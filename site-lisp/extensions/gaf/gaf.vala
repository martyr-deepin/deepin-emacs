using Gtk;
using Vte;
using Xcb;
using Gee;

namespace Gaf {
    public class CompositedWindow : Object {
        public Gtk.Window window;
        public Gtk.EventBox event_box;
        public Gtk.ScrolledWindow scrolled_window;
        public ArrayList<Gtk.Window> window_list;
    
        public Xcb.Connection conn;
        
        public CompositedWindow(int width, int height) {
            conn = new Xcb.Connection();
            
            window = new Gtk.Window();
            event_box = new Gtk.EventBox();
            scrolled_window = new ScrolledWindow(null, null);
            scrolled_window.set_policy(PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
            
            window_list = new ArrayList<Gtk.Window>();
            
            window.add(event_box);
            window.set_decorated(false);
            window.set_size_request(width, height);
            
            window.move(1000000, 1000000);
            
            event_box.add(scrolled_window);
            
            scrolled_window.realize();
            scrolled_window.get_window().set_composited(true);
            
            
            window.draw.connect((w, cr) => {
                    foreach (var emacs_window in window_list) {
                        emacs_window.queue_draw();
                    }
                    
                    return true;
                });
        }
        
        public void add_app_widget(Gtk.Widget widget) {
            scrolled_window.add(widget);
        }
        
        public void add_emacs_window(int emacs_xid, int x, int y, int width, int height) {
            var emacs_window = new Gtk.Window();
            emacs_window.set_decorated(false);
            emacs_window.set_size_request(width, height);
            
            emacs_window.draw.connect((w, cr) => {
                    print("#########\n");
                
                    Gtk.Allocation alloc;
                    w.get_allocation(out alloc);
                
                    Gdk.cairo_set_source_window(cr, scrolled_window.get_window(), 0, 0);
                    cr.paint();
                
                    return true;
                });
            
            emacs_window.realize.connect((w) => {
                    var window_xid = (int)((Gdk.X11.Window) w.get_window()).get_xid();
                    conn.reparent_window(
                        window_xid,
                        emacs_xid,
                        (uint16) x,
                        (uint16) y);
                    conn.flush();
                });
            
            window_list.add(emacs_window);
        }
        
        public void show_window() {
            window.show_all();
            foreach (var emacs_window in window_list) {
                emacs_window.show_all();
            }
        }
    }
}

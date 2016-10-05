using Gtk;
using Vte;
using Gaf;

public class Application : Object {
    public static void main(string[] args) {
        Gtk.init (ref args);
        
        int emacs_xid = int.parse(args[1]);
        int x = int.parse(args[2]);
        int y = int.parse(args[3]);
        int width = int.parse(args[4]);
        int height = int.parse(args[5]);

        var composited_window = new CompositedWindow(width, height);

        Vte.Terminal terminal = new Vte.Terminal();
        try {
            terminal.spawn_sync(Vte.PtyFlags.DEFAULT,
                                "/home",
                                {"/bin/bash"},
                                null,
                                GLib.SpawnFlags.SEARCH_PATH,
                                null, /* child setup */
                                null,
                                null /* cancellable */);
        } catch (GLib.Error e) {
            print("Got error when spawn_sync: %s\n", e.message);
        }
        composited_window.add_app_widget(terminal);
        
        composited_window.add_emacs_window(emacs_xid, x, y, width, height);
        
        composited_window.show_window();
        
        Gtk.main ();
    }
}
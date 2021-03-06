//! GtkPixmapMenuItem works like a normal GTK menu item, but you can
//! insert a arbitrary widget (most often a pixmap widget), which is
//! displayed at the left side. The advantage is that indentation is
//! handled the same way as GTK does (i.e if you create a menu with a
//! gtk_check_menu_item, all normal menu items are automatically
//! indented by GTK - so if you use a normal menu item to display
//! pixmaps at the left side, the pixmaps will be indented, which is
//! not what you want. This widget solves the problem).
//!
//!

inherit GTK.MenuItem;

static GTK.PixmapMenuItem create( );
//! Creates a new pixmap menu item.
//!
//!

GTK.PixmapMenuItem set_pixmap( GTK.Widget pixmap );
//! Set the pixmap of the menu item.
//!
//!

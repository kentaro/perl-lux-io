#include <luxio/btree.h>

#define PERL_NO_GET_CONTEXT

#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#ifdef __cplusplus
}
#endif

typedef Lux::IO::Btree Lux_IO_Btree;

bool lux_io_btree_del (int bt, char * key) {
  Lux::IO::Btree *  btp = INT2PTR(Lux::IO::Btree *, bt);
  Lux::IO::data_t   k   = { key,   strlen(key)   };
  return btp->del(&k);
}

MODULE=Lux::IO    PACKAGE=Lux::IO           PREFIX=xs_lux_io_

MODULE=Lux::IO    PACKAGE=Lux::IO::Btree    PREFIX=xs_lux_io_

Lux_IO_Btree*
xs_lux_io_btree_new(int index_type)
CODE:
    RETVAL = new Lux::IO::Btree((Lux::IO::db_index_t) index_type);
OUTPUT:
    RETVAL

void
xs_lux_io_btree_free(Lux_IO_Btree* bt)
CODE:
    bt->close();
    delete bt;

bool
xs_lux_io_btree_open(Lux_IO_Btree* bt, const char *db_name, int oflags)
CODE:
    bool ret =  bt->open(db_name, (Lux::db_flags_t) oflags);
    if (!ret) {
        delete bt; // XXX shouldn't free here?
    }
    RETVAL = ret;
OUTPUT:
    RETVAL

bool
xs_lux_io_btree_close(Lux_IO_Btree* bt)
CODE:
    RETVAL = bt->close();
OUTPUT:
    RETVAL

char *
xs_lux_io_btree_get(Lux_IO_Btree * bt, const char *key)
CODE:
    Lux::IO::data_t   k     = { key, strlen(key) };
    Lux::IO::data_t * value =  bt->get(&k);
    if (value) {
        RETVAL = (char *) value->data;
    } else {
        RETVAL = NULL;
    }
OUTPUT:
    RETVAL

bool
xs_lux_io_btree_put(Lux_IO_Btree * bt, const char * key, const char * value, int insert_mode)
CODE:
    Lux::IO::data_t   k   = { key,   strlen(key)   };
    Lux::IO::data_t   v   = { value, strlen(value) };
    RETVAL = bt->put(&k, &v, (Lux::IO::insert_mode_t) insert_mode);
OUTPUT:
    RETVAL

bool
xs_lux_io_btree_del(Lux_IO_Btree* bt, const char *key)
CODE:
    Lux::IO::data_t   k   = { key,   strlen(key)   };
    RETVAL = bt->del(&k);
OUTPUT:
    RETVAL

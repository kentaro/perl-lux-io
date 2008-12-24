#include <luxio/btree.h>
#include <string>

using namespace std;

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

int lux_io_btree_new (int index_type) {
  Lux::IO::Btree * bt = new Lux::IO::Btree((Lux::IO::db_index_t) index_type);
  return PTR2IV(bt);
}

int lux_io_btree_free (int bt) {
  Lux::IO::Btree * btp = INT2PTR(Lux::IO::Btree *, bt);
  btp->close();
  delete btp;
}

bool lux_io_btree_open (int bt, char * db_name, int oflags) {
  Lux::IO::Btree * btp = INT2PTR(Lux::IO::Btree *, bt);
  bool ret =  btp->open(db_name, (Lux::db_flags_t) oflags);
  if (!ret) {
    delete btp;
    return false;
  }
  return ret;
}

bool lux_io_btree_close (int bt) {
  Lux::IO::Btree * btp = INT2PTR(Lux::IO::Btree *, bt);
  return btp->close();
}

char * lux_io_btree_get (int bt, char * key) {
  Lux::IO::Btree *  btp   = INT2PTR(Lux::IO::Btree *, bt);
  Lux::IO::data_t   k     = { key, strlen(key) };
  Lux::IO::data_t * value =  btp->get(&k);
  if (!value) {
    return NULL;
  }
  return (char *) value->data;
}

bool lux_io_btree_put (int bt, char * key, char * value, int insert_mode) {
  Lux::IO::Btree *  btp = INT2PTR(Lux::IO::Btree *, bt);
  Lux::IO::data_t   k   = { key,   strlen(key)   };
  Lux::IO::data_t   v   = { value, strlen(value) };
  return btp->put(&k, &v, (Lux::IO::insert_mode_t) insert_mode);
}

bool lux_io_btree_del (int bt, char * key) {
  Lux::IO::Btree *  btp = INT2PTR(Lux::IO::Btree *, bt);
  Lux::IO::data_t   k   = { key,   strlen(key)   };
  return btp->del(&k);
}

MODULE=Lux::IO    PACKAGE=Lux::IO           PREFIX=xs_lux_io_

MODULE=Lux::IO    PACKAGE=Lux::IO::Btree    PREFIX=xs_lux_io_

int
xs_lux_io_btree_new(index_type)
    int index_type;
CODE:
    RETVAL = lux_io_btree_new(index_type);
OUTPUT:
    RETVAL

int
xs_lux_io_btree_free(bt)
    int bt;
CODE:
    RETVAL = lux_io_btree_free(bt);
OUTPUT:
    RETVAL

bool
xs_lux_io_btree_open(bt, db_name, oflags)
    int   bt;
    char* db_name;
    int   oflags;
CODE:
    RETVAL = lux_io_btree_open(bt, db_name, oflags);
OUTPUT:
    RETVAL

bool
xs_lux_io_btree_close(bt)
    int bt;
CODE:
    RETVAL = lux_io_btree_close(bt);
OUTPUT:
    RETVAL

char *
xs_lux_io_btree_get(bt, key)
    int    bt;
    char * key;
CODE:
    RETVAL = lux_io_btree_get(bt, key);
OUTPUT:
    RETVAL

bool
xs_lux_io_btree_put(bt, key, value, insert_mode)
    int    bt;
    char * key;
    char * value;
    int    insert_mode;
CODE:
    RETVAL = lux_io_btree_put(bt, key, value, insert_mode);
OUTPUT:
    RETVAL

bool
xs_lux_io_btree_del(bt, key)
    int    bt;
    char * key;
CODE:
    RETVAL = lux_io_btree_del(bt, key);
OUTPUT:
    RETVAL

/*
 * $Id$
 *
 * Config-file for the Pike mySQL-module.
 *
 * Henrik Grubbstr�m 1997-01-30
 */

#ifndef PIKE_MYSQL_CONFIG_H
#define PIKE_MYSQL_CONFIG_H

/* We don't support Mysql without threads. */
#ifdef PIKE_THREADS

@TOP@
@BOTTOM@

/* Define if you have mySQL */
#undef HAVE_MYSQL

/* Return type of mysql_fetch_lengths(). Usually unsigned long. */
#undef FETCH_LENGTHS_TYPE

#endif /* PIKE_THREADS */

#endif /* PIKE_MYSQL_CONFIG_H */

#ifndef _SANJI_RESOURCE_H
#define _SANJI_RESOURCE_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "http.h"
#include "list.h"
#include "debug.h"
#include "error.h"
#include "component.h"

/* CRUD methods for resource */
#define RESOURCE_METHOD_UNKNOWN (-1)
#define RESOURCE_METHOD_CREATE	HTTP_M_POST
#define RESOURCE_METHOD_READ	HTTP_M_GET
#define RESOURCE_METHOD_UPDATE	HTTP_M_PUT
#define RESOURCE_METHOD_DELETE	HTTP_M_DELETE

/* CRUD methods text for resource */
#define RESOURCE_METHOD_TEXT_CREATE	"POST"
#define RESOURCE_METHOD_TEXT_READ	"GET"
#define RESOURCE_METHOD_TEXT_UPDATE	"PUT"
#define RESOURCE_METHOD_TEXT_DELETE	"DELETE"

#define RESOURCE_NAME_LEN 1024
#define RESOURCE_METHOD_LEN 8

struct resource {
	struct list_head list;
	char name[RESOURCE_NAME_LEN];
	char *subscribed_component;
	unsigned int subscribed_count;
	unsigned int lock;
};

struct resource *resource_init();
int resource_add_node(struct resource *, char *, char *, unsigned int, unsigned int);
void resource_display(struct resource *);
int resource_delete_first_name(struct resource *, char *);
int resource_is_write_like_method(int);
int resource_append_component_by_name(struct resource *, char *, char *);
int resource_remove_component_by_name(struct resource *, char *, char *);
int resource_remove_all_component_by_name(struct resource *, char *);

/* lookup/reverse method */
int resource_lookup_method(const char *);
char *resource_reverse_method(const int);
struct resource *resource_lookup_node_by_name(struct resource *, const char *);
struct resource **resource_lookup_wildcard_nodes_by_name(struct resource *, const char *, unsigned int *);

/* lock method */
int resource_node_lock(struct resource *);
int resource_lock_by_name(struct resource *, char *);
int resource_node_unlock(struct resource *);
int resource_unlock_by_name(struct resource *, char *);

/* inspect method */
int resource_is_registered(struct resource *, char *);
int resource_is_locked(struct resource *, char *);
int resource_node_is_locked(struct resource *);
int resource_is_any_locked_by_component(struct resource *, char *);

/* get methods */
char *resource_get_subscribed_component(struct resource *);
unsigned int resource_get_subscribed_count(struct resource *);
char *resource_get_names_by_component(struct resource *, char *, unsigned int *);

/* free method */
void resource_free(struct resource *);

#ifdef __cplusplus
}
#endif

#endif /* _SANJI_RESOURCE_H */

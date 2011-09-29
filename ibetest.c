/*
 * NTRG IBE WIN32 -- ibetest.c
 * Patroklos Argyroudis <argp at domain cs.tcd.ie>
 *
 * Simple program to test the Stanford IBE library on Win32.
 *
 * $Id: ibetest.c,v 1.2 2006/02/14 17:37:14 argp Exp $
 */

#include <ibe_lib.h>

int
main(void)
{
 char *id = "argp at domain cs.tcd.ie";
 params_t params;
 byte_string_t U;
 byte_string_t secret;
 byte_string_t key;
 byte_string_t master;

 IBE_init();

 IBE_setup(params, master, 512, 160, "test");
 printf("system parameters generated!\n");

 printf("IBE test program\n");
 printf("Test ID: %s\n", id);

 printf("generating key...\n");
 IBE_KEM_encrypt(secret, U, id, params);

 printf("U =");
 byte_string_printf(U, " %02X");
 printf("\n");

 printf("secret =");
 byte_string_printf(secret, " %02X");
 printf("\n");
 byte_string_clear(secret);

 printf("extracting...\n");
 IBE_extract(key, master, id, params);

 printf("recovering secret...\n");
 IBE_KEM_decrypt(secret, U, key, params);

 /* hopefully it will be the same as above */
 printf("secret =");
 byte_string_printf(secret, " %02X");
 printf("\n");

 params_clear(params);
 IBE_clear();
 byte_string_clear(U);
 byte_string_clear(key);
 byte_string_clear(secret);
 byte_string_clear(master);
 
 return(0);
}

/* EOF */

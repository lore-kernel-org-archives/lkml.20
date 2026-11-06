Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985634;
	b=rf+zxSXmkz+4RBor5ALDqlOTmCYI8WP0ozQsXPGKaKooBcULvDv3jUUbz3qSKuWfYhMW
	 rzq2NP8gFRq8pDJQ0tEXrwQy2hf7fX5VoE7e63LakUJHh6WGuHYOfX+aGym/ymdEQylDh
	 BmMFdrQ5eqxLsZ/uti71vmcms8SSG7T3U9BhtFUSSRtVLdvTf3q1ABPBv0KrWmsalCaqw
	 fLK0gltpC2IQNdCRLamYYgvy5x3vQ+vUoAS8/16aOfW5XAencIPHpBLupmuDCpgzkkG+2
	 Ia3Tu10kzK2l/Kgj51sR82mMjK+RKtgiVmouIQcTpY5NEwK+Pgo5q4y2RgaQq+TsjVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sJakC65jRiJycFPLrWS53C7JIcLuQtZw3EKWHlPXzoI=;
	b=ET5+umM6D0KpMgdzlOZbDQORCegsMU1h/V5UmdNuZLvU7SsFFUt9glxxvNUy2sx49XU6
	 rIurLa+qJ+qhCKvQDsUoNEU9TlsFzxFD0h35S8JhwrNtIV7g1PlcB9cFjrsEwdaYVoFC5
	 f8QkRwPGatn67AN/9Hhf0QIPHixunjqXo6k90vVgsl3/0cg/FjtgMks7SE5lCPDVnS8Eg
	 d0WyQ495JeByEoyBr4ICzbC6VxyTwLdVo6hyCfZXidtM80VuZqfJoo0zr0m8ZEamhowWb
	 Cxznk/cfOt0EiMl9qopuykx+59lPH6XCG8THT11+0kJ4S9dqLozzIpxq4xo8SFSFtZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XoMzaK97;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9929B606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9929B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XoMzaK97
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so11766215e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985632; x=1794590432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJakC65jRiJycFPLrWS53C7JIcLuQtZw3EKWHlPXzoI=;
        b=XoMzaK97DireabyhoqLQlKpLeo9NTqvNHPus7ht1vi0eoETbrXjWg2prwNj7pvMhAY
         D4koatc5dsBeqDx03gzTBYlkV77qLhemHKBc3Q/QEL1tPkk3xALEhX/AEOZW0iicjubS
         Askm/4832rXR/AlNaXNIWmrPykndErckT8Cfmo9NwZEkLU+LGCfBuqdxiv3fOLJhzAhR
         asnZbehZhwCoUn5vnvIfyyYVQtHmAu1hI7vHFKYDQqKaCI0srzgjJXgFILUStcU/jN0h
         rnyrQ5Rg4z1peCGEYyHhmDqCQ7Lzhww4iJ9eNBOxcxM+BLX+Y23Yvg+8sKpNk4p1+eLX
         B0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985632; x=1794590432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJakC65jRiJycFPLrWS53C7JIcLuQtZw3EKWHlPXzoI=;
        b=l59eEhCqU8nMXTcvt0XoWO8TX3jNyGpFYYE4bJ5JSmOV1dH1CnGDjWr3UyOhx1EzHc
         8AXTnvp94bPNPaFitJydNTBclk8oohUkf/haAU935pA/gpjH566cxSQ9bat6EeCyR5JE
         Cid7cmcugclQwJvd7wMb+VrgXWqHn22JnKoIePwj3lpVOL5ycet/o/SDEre6QAclQ2FK
         eDFqH/T5xYggp6K87SVVyt9fs79LuS3cyyUSNK+iwfukzlSbhNQj1D7Yx+Sx6Tx0Sb+5
         WYVTQSyzctLgCBoOv7f/6XUuakJwy4hwImx/wkzycmz6r2B6RzP57F9nV1UDQiCd5ZbK
         tGKw==
X-Forwarded-Encrypted: i=1; AKwUvByc30J4V163crZdsGtP1EBEMkF29oYxYP9Ai+ivpKbN1N5bgBWf/k4qcSCQKr0ebuaIJo5BKiiLD0rnsO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gB2/xsXUE1VzLIDqsKubif5KuZfhRShWatuOVipGUzPW5mcbP
	QXbNA044YQW2BkNdUIrSB9uviwCIRjm/eY6fQwe9gpOlb4zRMprOmJ4mKbehAKRV6Nk=
X-Gm-Gg: AYBFou3JpMHLXl4HVmiqG2SYB+ziacat0ooY/u3GdQ2depZP0Y2Ko2eJRDVp1QWkKEI
	2r0wOM8uTnjVbb06/IMRTF8+UwLRoow0EvWTyYkROoAhB3MCLG2GhK0gPeiMYZJXrzii4f1fxv2
	KZ4eliwDmHAiU9k9T7iR2cryhqq+tBJHLGwJy2t9hNL6B0h+Hskvo2ehMzYs3nblhdgxZmyKwBe
	Py8P4d/yh6pNq+LVQExvUmA+6H7/VNvgF2Im9Geza0FmE76WWTwd66yKoL8mSuOJb2mJD5Um5ye
	/neEax5m6Ydb3qfJBeTO2zLRy6Pr2Xejxj3ySmbkk3oFsSrtKN19nBFoOOSmqoUBXjMVVYEaH7H
	o3Z1RtMZ466quLwRYhtMh1a8nqu6dL5rTkS2OjPZV8ha4SDNrNIRyf/V6eii84kLXH8uwxZqowI
	SFVfXSxh4cHUapZsOkRe1YjY/PSbO1Q9FCVS79+uptpu7LjzTUAJzoCOHb4UT9S82Q2YBM0uz7n
	zR+2mA3/rsPsC4J0Wsz+6aPwFXy7lpEBV/SRH6IbapYUfbtbGO8iGH+wGoRMsM2Wh/OFRN64Swe
	Fe1gadmPOKh7InPuGUjYsvrY/85T/WCRVVtwyj79/0LHdJF4xEx1
X-Received: by 2002:a05:600c:1d05:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4b6dc4001b5mr52654515e9.1.1793985631961;
        Fri, 06 Nov 2026 09:20:31 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e168f73fsm77045555e9.5.2026.11.06.09.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:20:31 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v6 01/16] printk: Rename struct console_cmdline to preferred_console
Date: Fri,  6 Nov 2026 18:19:37 +0100
Message-ID: <20261106171952.207909-2-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106171952.207909-1-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The structure 'console_cmdline' was originally intended to store details
about consoles defined on the kernel command line. However, its usage
has since expanded; it now stores information for consoles preferred
via SPCR, device tree, or by particular platforms, e.g. XEN.

The current naming is misleading as it implies the configuration only
originates from the command line.

Rename the structure and associated artifacts to better reflect their
current purpose, for example:

  - struct console_cmdline c -> struct preferred_console pc
  - console_cmdline[]        -> preferred_consoles[]
  - console_cmdline.h        -> console_register.h
  - c			     -> pc

Additionally, renaming the header file to console_register.h would
eventually allow to decouple console registration logic from
the monolithic printk.c.

Finally, renaming the local variable from "c" to "pc" helps to distinguish
it from struct console variables. Note that "c" is used for struct console
in some code, for example see vt_console_device() function definition.

No functional changes.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
Acked-by: Marcos Paulo de Souza <mpdesouza@suse.com>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/braille.c                       | 10 +--
 kernel/printk/braille.h                       | 10 +--
 .../{console_cmdline.h => console_register.h} |  6 +-
 kernel/printk/printk.c                        | 89 ++++++++++---------
 4 files changed, 58 insertions(+), 57 deletions(-)
 rename kernel/printk/{console_cmdline.h => console_register.h} (83%)

diff --git a/kernel/printk/braille.c b/kernel/printk/braille.c
index 17a9591e54ff..9d21a2bb1d38 100644
--- a/kernel/printk/braille.c
+++ b/kernel/printk/braille.c
@@ -6,7 +6,7 @@
 #include <linux/errno.h>
 #include <linux/string.h>
 
-#include "console_cmdline.h"
+#include "console_register.h"
 #include "braille.h"
 
 int _braille_console_setup(char **str, char **brl_options)
@@ -35,14 +35,14 @@ int _braille_console_setup(char **str, char **brl_options)
 }
 
 int
-_braille_register_console(struct console *console, struct console_cmdline *c)
+_braille_register_console(struct console *console, struct preferred_console *pc)
 {
 	int rtn = 0;
 
-	if (c->brl_options) {
+	if (pc->brl_options) {
 		console->flags |= CON_BRL;
-		rtn = braille_register_console(console, c->index, c->options,
-					       c->brl_options);
+		rtn = braille_register_console(console, pc->index, pc->options,
+					       pc->brl_options);
 	}
 
 	return rtn;
diff --git a/kernel/printk/braille.h b/kernel/printk/braille.h
index 123154f86304..55cd3178a17a 100644
--- a/kernel/printk/braille.h
+++ b/kernel/printk/braille.h
@@ -5,9 +5,9 @@
 #ifdef CONFIG_A11Y_BRAILLE_CONSOLE
 
 static inline void
-braille_set_options(struct console_cmdline *c, char *brl_options)
+braille_set_options(struct preferred_console *pc, char *brl_options)
 {
-	c->brl_options = brl_options;
+	pc->brl_options = brl_options;
 }
 
 /*
@@ -21,7 +21,7 @@ int
 _braille_console_setup(char **str, char **brl_options);
 
 int
-_braille_register_console(struct console *console, struct console_cmdline *c);
+_braille_register_console(struct console *console, struct preferred_console *pc);
 
 int
 _braille_unregister_console(struct console *console);
@@ -29,7 +29,7 @@ _braille_unregister_console(struct console *console);
 #else
 
 static inline void
-braille_set_options(struct console_cmdline *c, char *brl_options)
+braille_set_options(struct preferred_console *pc, char *brl_options)
 {
 }
 
@@ -40,7 +40,7 @@ _braille_console_setup(char **str, char **brl_options)
 }
 
 static inline int
-_braille_register_console(struct console *console, struct console_cmdline *c)
+_braille_register_console(struct console *console, struct preferred_console *pc)
 {
 	return 0;
 }
diff --git a/kernel/printk/console_cmdline.h b/kernel/printk/console_register.h
similarity index 83%
rename from kernel/printk/console_cmdline.h
rename to kernel/printk/console_register.h
index 0ab573b6d4dc..9ab3e1cc749b 100644
--- a/kernel/printk/console_cmdline.h
+++ b/kernel/printk/console_register.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _CONSOLE_CMDLINE_H
-#define _CONSOLE_CMDLINE_H
+#ifndef _CONSOLE_REGISTER_H
+#define _CONSOLE_REGISTER_H
 
-struct console_cmdline
+struct preferred_console
 {
 	char	name[16];			/* Name of the driver	    */
 	int	index;				/* Minor dev. to use	    */
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 9a205f94bfac..b8d62fec2569 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -58,7 +58,7 @@
 #include <trace/events/printk.h>
 
 #include "printk_ringbuffer.h"
-#include "console_cmdline.h"
+#include "console_register.h"
 #include "braille.h"
 #include "internal.h"
 
@@ -359,12 +359,11 @@ static void __up_console_sem(unsigned long ip)
 static int console_locked;
 
 /*
- *	Array of consoles built from command line options (console=)
+ * Array of consoles preferred via the command line, or by
+ * some platform-specific code, e.g. SPCR, or DT.
  */
-
-#define MAX_CMDLINECONSOLES 8
-
-static struct console_cmdline console_cmdline[MAX_CMDLINECONSOLES];
+#define MAX_PREFERRED_CONSOLES 8
+static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
 static int preferred_console = -1;
 int console_set_on_cmdline;
@@ -2544,16 +2543,16 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
 }
 #endif
 
-static void set_user_specified(struct console_cmdline *c, bool user_specified)
+static void set_user_specified(struct preferred_console *pc, bool user_specified)
 {
 	if (!user_specified)
 		return;
 
 	/*
-	 * @c console was defined by the user on the command line.
+	 * @pc console was defined by the user on the command line.
 	 * Do not clear when added twice also by SPCR or the device tree.
 	 */
-	c->user_specified = true;
+	pc->user_specified = true;
 	/* At least one console defined by the user on the command line. */
 	console_set_on_cmdline = 1;
 }
@@ -2562,7 +2561,7 @@ static int __add_preferred_console(const char *name, const short idx,
 				   const char *devname, char *options,
 				   char *brl_options, bool user_specified)
 {
-	struct console_cmdline *c;
+	struct preferred_console *pc;
 	int i;
 
 	if (!name && !devname)
@@ -2581,30 +2580,30 @@ static int __add_preferred_console(const char *name, const short idx,
 	 *	See if this tty is not yet registered, and
 	 *	if we have a slot free.
 	 */
-	for (i = 0, c = console_cmdline;
-	     i < MAX_CMDLINECONSOLES && (c->name[0] || c->devname[0]);
-	     i++, c++) {
-		if ((name && strcmp(c->name, name) == 0 && c->index == idx) ||
-		    (devname && strcmp(c->devname, devname) == 0)) {
+	for (i = 0, pc = preferred_consoles;
+	     i < MAX_PREFERRED_CONSOLES && (pc->name[0] || pc->devname[0]);
+	     i++, pc++) {
+		if ((name && strcmp(pc->name, name) == 0 && pc->index == idx) ||
+		    (devname && strcmp(pc->devname, devname) == 0)) {
 			if (!brl_options)
 				preferred_console = i;
-			set_user_specified(c, user_specified);
+			set_user_specified(pc, user_specified);
 			return 0;
 		}
 	}
-	if (i == MAX_CMDLINECONSOLES)
+	if (i == MAX_PREFERRED_CONSOLES)
 		return -E2BIG;
 	if (!brl_options)
 		preferred_console = i;
 	if (name)
-		strscpy(c->name, name);
+		strscpy(pc->name, name);
 	if (devname)
-		strscpy(c->devname, devname);
-	c->options = options;
-	set_user_specified(c, user_specified);
-	braille_set_options(c, brl_options);
+		strscpy(pc->devname, devname);
+	pc->options = options;
+	set_user_specified(pc, user_specified);
+	braille_set_options(pc, brl_options);
 
-	c->index = idx;
+	pc->index = idx;
 	return 0;
 }
 
@@ -2624,8 +2623,7 @@ __setup("console_msg_format=", console_msg_format_setup);
  */
 static int __init console_setup(char *str)
 {
-	static_assert(sizeof(console_cmdline[0].devname) >= sizeof(console_cmdline[0].name) + 4);
-	char buf[sizeof(console_cmdline[0].devname)];
+	char buf[sizeof(preferred_consoles[0].devname)];
 	char *brl_options = NULL;
 	char *ttyname = NULL;
 	char *devname = NULL;
@@ -2633,6 +2631,9 @@ static int __init console_setup(char *str)
 	char *s;
 	int idx;
 
+	static_assert(sizeof(preferred_consoles[0].devname) >=
+		      sizeof(preferred_consoles[0].name) + 4);
+
 	/*
 	 * console="" or console=null have been suggested as a way to
 	 * disable console output. Use ttynull that has been created
@@ -2732,19 +2733,19 @@ int match_devname_and_update_preferred_console(const char *devname,
 					       const char *name,
 					       const short idx)
 {
-	struct console_cmdline *c = console_cmdline;
+	struct preferred_console *pc = preferred_consoles;
 	int i;
 
 	if (!devname || !strlen(devname) || !name || !strlen(name) || idx < 0)
 		return -EINVAL;
 
-	for (i = 0; i < MAX_CMDLINECONSOLES && (c->name[0] || c->devname[0]);
-	     i++, c++) {
-		if (!strcmp(devname, c->devname)) {
+	for (i = 0; i < MAX_PREFERRED_CONSOLES && (pc->name[0] || pc->devname[0]);
+	     i++, pc++) {
+		if (!strcmp(devname, pc->devname)) {
 			pr_info("associate the preferred console \"%s\" with \"%s%d\"\n",
 				devname, name, idx);
-			strscpy(c->name, name);
-			c->index = idx;
+			strscpy(pc->name, name);
+			pc->index = idx;
 			return 0;
 		}
 	}
@@ -3903,33 +3904,33 @@ static int console_call_setup(struct console *newcon, char *options)
 static int try_enable_preferred_console(struct console *newcon,
 					bool user_specified)
 {
-	struct console_cmdline *c;
+	struct preferred_console *pc;
 	int i, err;
 
-	for (i = 0, c = console_cmdline;
-	     i < MAX_CMDLINECONSOLES && (c->name[0] || c->devname[0]);
-	     i++, c++) {
+	for (i = 0, pc = preferred_consoles;
+	     i < MAX_PREFERRED_CONSOLES && (pc->name[0] || pc->devname[0]);
+	     i++, pc++) {
 		/* Console not yet initialized? */
-		if (!c->name[0])
+		if (!pc->name[0])
 			continue;
-		if (c->user_specified != user_specified)
+		if (pc->user_specified != user_specified)
 			continue;
 		if (!newcon->match ||
-		    newcon->match(newcon, c->name, c->index, c->options) != 0) {
+		    newcon->match(newcon, pc->name, pc->index, pc->options) != 0) {
 			/* default matching */
-			BUILD_BUG_ON(sizeof(c->name) != sizeof(newcon->name));
-			if (strcmp(c->name, newcon->name) != 0)
+			BUILD_BUG_ON(sizeof(pc->name) != sizeof(newcon->name));
+			if (strcmp(pc->name, newcon->name) != 0)
 				continue;
 			if (newcon->index >= 0 &&
-			    newcon->index != c->index)
+			    newcon->index != pc->index)
 				continue;
 			if (newcon->index < 0)
-				newcon->index = c->index;
+				newcon->index = pc->index;
 
-			if (_braille_register_console(newcon, c))
+			if (_braille_register_console(newcon, pc))
 				return 0;
 
-			err = console_call_setup(newcon, c->options);
+			err = console_call_setup(newcon, pc->options);
 			if (err)
 				return err;
 		}
-- 
2.56.0


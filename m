Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DE550B409
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683569; cv=none; b=ApoK20hdYoi2Aws0Qmmh3dZlJAR+DNioJmP/Pousa5Rf1qQjhpngdM1xGjpe1E7Cg1tnbKICSQaf0BfL4xOtERkyKZCvOv3u5btFjdn175gUFGtYsQpzNGOL1zwkRJTMM476dKDfyrRPis8ichSB0bUw1lsoWgr1wbMnG3KbSxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683569; c=relaxed/simple;
	bh=PH0mRFy2ZTNWeV7J6vQb/JZr/1guNjvsUUwQrar9mWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cl1YFKS/W7ieB4EaOeEr9CDQ277xvTTKCQrgtjGoXzE+bxUABlcl9xTF4l5D+EUfJHBHsnnxYHtWfO4hTfRRd3t2SDpyKEGtT95gJDafgK1Js9N6rspiBHN1yzEMrqYlSsYyF2M7dLqLiZjMhjFh4Rf8Q6dT0TCVFzfuZrBDitg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K1ruqTlR; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K1ruqTlR"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so2925749f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683565; x=1791288365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2bXrk3s2N8PPJdkqaujyHKd8Y8AkGxmCiH3sGNVXWw=;
        b=K1ruqTlRPW7PzBje45tMOKfwP5/lDUxcnmNNc0Rg6FYFR7tc7yzD07ew99KIzdarqT
         mXimCOx+ZYejqItUOmPPbSAWNWMwVLJvdrwdRUB9eirajxb99/gvBZeliR1hm3ag2qKN
         jWpH4n+Zu2q1BCFvHPykKWzab9Zoi7/Qt5aB6xGvxlEtDmWW6WGXYQHpmnjiW+lFj3AN
         KE803FUXbwakrbOFbpNLK6qfvnUcxfqiCLbPdOjjbAOPnQqmO6UR/Tci9iHWSfl3l9YE
         jQ8SqIFxHJU0+wm6qHTClD6VNz5UADIWfGJn+sM8FNxT7wajMZJJmrmoabFPTSeY8HoI
         dmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683565; x=1791288365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2bXrk3s2N8PPJdkqaujyHKd8Y8AkGxmCiH3sGNVXWw=;
        b=FfO2plx6g6mX3iDWhwQi4hnJvUwsXWukJsk2jf1mlDf2HmQn83GYgVFpq+ea5IU5ba
         dgxwPATEaH+5C7XErdfCEH22qfBT60y2TQwkS8j0t2RTnuA1+DAebOmiztAdbybChoL3
         8LvWTD5pdsOHmn4nGQtlQFRuqK2irReo3E5GCIiylZx1GqEZAQSZ2d8eWax/A+gYuh4r
         X/Im65oik3rtMn/7fSzPbKTOWprqqmQ5Z5gLhlEJ+e57q98SJZ/dhhDdv3wR4vPa5Fbh
         rlkFdh9jGTX1TOM2oHCHUOu9ObHj0Gsz5/fVcEC/TIfNpPjoukwU7eJP1mYyBQpM1a6r
         9nnw==
X-Forwarded-Encrypted: i=1; AKwUvBzDMRfSR6JFuHBjaTVUXvfI/oZtLgSIjnxWxb4COuvSCZypVaxJaeDwqAZ9gdVYnDdiZ6KAQHlE6Fqbauc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIpk/MFav3VL+chxskvBGmjP8eEaBbt7jz8EAFdvrRuD2nDs/H
	YSwpaqcvCUrye3/kxgRaE/jCeAhzxP/xu9oDwYEIrUHcgwjpumADXPUHG2mbnkYDHyk=
X-Gm-Gg: AYBFou3H9CHW4D4PkuX0l9W/QP9HfaA4PqEk0OFzpBu21gasIq9syYN4QPQg7opmDUk
	0Gs8HjM+9zvEe3cbDIZCLdiHDDK9/lII1EmCRhvR9+UrnTWeE5N/1iEfRyuZ69GtMjDtwS4x+Dz
	nbp7zhukDVwyKJhb33nbNatoOCjLaEpQwmTB87d00evWrUhevGUI3yWP5+WFSTyV+016FcdOkwT
	0ykArvsnpN5YCjtsVhpy3oqilgpPoXaLxtSN0+NcSD1Vp2g6jmMO0Xena6K2Kc4QE7QZ1JkOVHs
	gjhB5D9+C8wd9ln9fVSkgWGZIjWlIsQWfdPlYOXouG5qHgXRAUT0g3Z2BsqxpYNA7SGEJF+x6Wb
	LaxzKyMljMRPH0+oxn8DUZC8F8u0eFIOZBVLZyDkBR6FSc5pxpttW86zw97UTLaI0BwDLfncyEM
	qffee5DOgW5DmDm3tF3p6NqvNL8Jr8f0UeqI84kPY0X4lcu/EI89xYQ+isWr2zZFBYO/AKutOpx
	5PWtlo=
X-Received: by 2002:a5d:64c7:0:b0:487:27f6:a4df with SMTP id ffacd0b85a97d-488716b8a05mr30944668f8f.47.1790683564987;
        Tue, 29 Sep 2026 05:06:04 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af505e699sm3674556f8f.20.2026.09.29.05.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:06:04 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 01/16] printk: Rename struct console_cmdline to preferred_console
Date: Tue, 29 Sep 2026 14:05:31 +0200
Message-ID: <20260929120546.328616-2-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929120546.328616-1-pmladek@suse.com>
References: <20260929120546.328616-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
 kernel/printk/printk.c                        | 85 ++++++++++---------
 4 files changed, 57 insertions(+), 54 deletions(-)
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
index 6d3d18a50da7..2cff224cf1e2 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -58,7 +58,7 @@
 #include <trace/events/printk.h>
 
 #include "printk_ringbuffer.h"
-#include "console_cmdline.h"
+#include "console_register.h"
 #include "braille.h"
 #include "internal.h"
 
@@ -362,9 +362,9 @@ static int console_locked;
  *	Array of consoles built from command line options (console=)
  */
 
-#define MAX_CMDLINECONSOLES 8
+#define MAX_PREFERRED_CONSOLES 8
 
-static struct console_cmdline console_cmdline[MAX_CMDLINECONSOLES];
+static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
 static int preferred_console = -1;
 int console_set_on_cmdline;
@@ -2544,16 +2544,16 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
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
@@ -2562,7 +2562,7 @@ static int __add_preferred_console(const char *name, const short idx,
 				   const char *devname, char *options,
 				   char *brl_options, bool user_specified)
 {
-	struct console_cmdline *c;
+	struct preferred_console *pc;
 	int i;
 
 	if (!name && !devname)
@@ -2581,30 +2581,30 @@ static int __add_preferred_console(const char *name, const short idx,
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
 
@@ -2624,8 +2624,7 @@ __setup("console_msg_format=", console_msg_format_setup);
  */
 static int __init console_setup(char *str)
 {
-	static_assert(sizeof(console_cmdline[0].devname) >= sizeof(console_cmdline[0].name) + 4);
-	char buf[sizeof(console_cmdline[0].devname)];
+	char buf[sizeof(preferred_consoles[0].devname)];
 	char *brl_options = NULL;
 	char *ttyname = NULL;
 	char *devname = NULL;
@@ -2633,6 +2632,10 @@ static int __init console_setup(char *str)
 	char *s;
 	int idx;
 
+	static_assert(sizeof(preferred_consoles[0].devname) >=
+		      sizeof(preferred_consoles[0].name) + 4);
+
+
 	/*
 	 * console="" or console=null have been suggested as a way to
 	 * disable console output. Use ttynull that has been created
@@ -2730,19 +2733,19 @@ int match_devname_and_update_preferred_console(const char *devname,
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
@@ -3901,33 +3904,33 @@ static int console_call_setup(struct console *newcon, char *options)
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
2.55.0


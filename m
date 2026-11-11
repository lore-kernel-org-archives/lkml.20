Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412287;
	b=xTZP0l7WioKOZfJk2Kfz+OnhMXSE1Lo4N2MA+O73QaDymBz/9nTyA0XU8LbRuZYqC926
	 aMpMw0zNXb23GOojajwV1nT9w0ObM6+wGQTrYIZrWX11ITvt3PuxtO+t4gUnhSA3FSzDF
	 e1bLNxVz5n/75ncF6L/Nd3vwD3E88E0/ZcmqCT2EJmRAPBGCk6qBYst7u1zV8Om8SEIAl
	 Wn1W/4GG7aoEyMPqVdX9XkHZAXgofyrFG3zV1a2/r1O55MTWn6PyHlXvlZEMrd4k6F87m
	 9CO/9+ngsJjkxppsunrOZTA48ugipwMNM//zJi204sWUZESHVuOJWVvy1V8O4r6WiBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7inFXUA9oiMxbV+Wia+1AU8bjdJLbgmzY+eZADP2uMo=;
	b=Wh0p63ax8/3cMa6PYwVWini5vFwkZyJGPjuriA/QK5ce9+UtXv6tWH0xDQUmu3xr/+Cr
	 hvnKP5iO1EeTMwkDz1ctF5vvIfI+9QRIvQgdZE5az2KUcuW60KooMJUIaZ5LN1USrPkqm
	 +418ZaoXW6qMRwDDA6L/GpQi9HEMNiEBQTlx4uOh6qk1EJQNkvdfite6uwsMDjIGobOqM
	 o5xbF3BOFTx9Vx4MHcCDN7QkaUteh8PzWisuv3rW5/Ata4BtiqE1rwj+fRQXcWSwgqsUn
	 Q3H2y46TGXQ/giEq8rtJF3qHACLastedFeHYGi8iPaooNTZLiQo9o0nzCFy+DgJuJPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gkDhhFOL;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDD9606A887
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DDD9606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gkDhhFOL
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so30563655e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412285; x=1795017085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7inFXUA9oiMxbV+Wia+1AU8bjdJLbgmzY+eZADP2uMo=;
        b=gkDhhFOLlc/kIOQeWQqnGZXLtdJmzFzYux5rrxQPSSsTBkI61PYEBzd2VgE0Stddoc
         Zm6JajQR6rdlNobyq6I1h8beP8rIanHpgaREEcLsUL6DjRGJXjgdTF9sZDZivZCI8AR+
         ZUdNjKdFCfHw1oq9lGGC3VCkKyCd2RK98I0SYn/VTpfQZPZ9loTKnmdhfHACJ6gkPQfy
         bI9zdW2s0OoHOf2ColDUPVKSSTOu+UzPDRAuQZPRxG3rOF799W3Mv+G60boe/AVkscR1
         6isOQMpCz4OW7Sg3Pxni1Ggje2c+DK6T/708Q7Dn61nfsH8fg9Hr7OgSXLPY0J8Q73Ua
         DfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412285; x=1795017085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7inFXUA9oiMxbV+Wia+1AU8bjdJLbgmzY+eZADP2uMo=;
        b=n0tPDWcElPbIPVptI3OswMeReQkMx3km5O9Jpz1QIp0JDOPDJKVjuoBBrXA4KF1BCi
         5HrucBM58eOlWqnQLkWJGSrLACS4EicL9EXYUQSDVPWurap4cp6f/Y95szfuWuGi8IVI
         RO5a2PSKYFq65JTqZ7CRnR5oRyTXx5Y4CvzQ7WNrFP6i5TdvF2FWkNTuzH00H3IZTgLm
         kpghYIguCWCZeoHU3Q2oGcSw8v7XF6+MdzEcuYNCBd09FE9KOra8xwobOeeVYEW8+oeQ
         w0dGCAWUS2uo0c26VryiubXt6CYxN6TU3hqHiH02RvfURQYkglPkErlg15B/1ASN+6I3
         ddpw==
X-Forwarded-Encrypted: i=1; AL+hErHtdrxXbQm7L5E3dHwDE9Yvj0k+vkkUVJzhQaN87DS7+GZHQp7bMhSldYQ6VHi8iPEnoAtxD0nteeVzseY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mcML49atL/SVU0zVinu3EeUECfs3a7XVJFhUuWXQqSCJUp4DO
	1Gpp0E/Rp7sbydrhMchBKXYogO3M3ZGlP7FVwzLqtXKWWypJuCujBGUy5mJkkvwaI60=
X-Gm-Gg: AYBFou3aSTMn3XizxgCDnJQseW0JY8ztaPlHZn490P3qwUw/EOLjmAZ4zZVlQsvmHJc
	gX3arka/cpzIrWVZRVvfV1037z4vSu+Vi6XskhrEMRdOPtAx6rqib/ZZPlj52cnfKS2IJibkxsT
	/LJww5OdcF3fEs3sqcjDp6V4lFcvd1Yg1e3YRoLf9xme11Xg3UNP8INPp7N0PKXuHvgj7aCbEWz
	x56ZA3kLIM+9h9IAb8o9nqKMrQI1a+SawPr6AmMiH8Wuy4+s2KKmyq2/HsinA1h/1MC3WdcJl8i
	06Wusp43h9WoFRRNfXAxMxSIR4+eIU90bwa/L2nVddeARUbgiadpCAs9fIjDL6gJKxyI/I8gbcf
	o0MDspLgKnj2u5HWoH4jcZOO6JgCn1G6BZo7yMwpoBRfANj8HUPpYrb2bsmYf0tEw77Ve1GhPhY
	JSJUSuHDREbBm/Gc7vvbvzHgTShc1c6nC705UF0jFr/u8Z2SdkiDH8Ho1eOKqGrklrbu1o2YbuN
	OZDm0hT7cnJrusJlYroaWiGVeZWqGgup2sBkwKbHm08V4rD1xadW402Gw6v8ACU+HH/irGVOeIc
	ygG+jPGeqycVb0wE+l6yDiQp9IsKCEs=
X-Received: by 2002:a05:600c:1d18:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ba093a2dafmr48636545e9.24.1794412285481;
        Wed, 11 Nov 2026 07:51:25 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49944d646f9sm7974397f8f.32.2026.11.11.07.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:51:24 -0800 (PST)
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
Subject: [PATCH v7 15/17] printk: Do not set Braille console as preferred_console
Date: Wed, 11 Nov 2026 16:48:14 +0100
Message-ID: <20261111154816.71103-16-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111154816.71103-1-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com>
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

The Braille console reuses the framework for handling consoles preferred
via the command line. However, it is a special-purpose interface that
neither receives standard printk messages nor associates with
/dev/console.

Currently, the "preferred_dev_console" variable can point to a Braille
console entry in the "preferred_consoles[]" array. This occurs if an
entry was first created for a non-Braille console, but a later 'console='
parameter redefined it as a Braille console.

Since a Braille console will only ever be enabled as such, it should not
be tracked as the primary system console. Adjust the logic to ensure
"preferred_dev_console" continues to point to the previously designated
normal console instead.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/console_register.h |  3 +++
 kernel/printk/printk.c           | 31 ++++++++++++++++++++++++-------
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/kernel/printk/console_register.h b/kernel/printk/console_register.h
index 9ab3e1cc749b..64cf12fd6ea5 100644
--- a/kernel/printk/console_register.h
+++ b/kernel/printk/console_register.h
@@ -2,6 +2,8 @@
 #ifndef _CONSOLE_REGISTER_H
 #define _CONSOLE_REGISTER_H
 
+#include <linux/list.h>
+
 struct preferred_console
 {
 	char	name[16];			/* Name of the driver	    */
@@ -12,6 +14,7 @@ struct preferred_console
 #ifdef CONFIG_A11Y_BRAILLE_CONSOLE
 	char	*brl_options;			/* Options for braille driver */
 #endif
+	struct list_head preferred_dev_node;
 };
 
 #endif
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index d1481ae6c729..60a6b407155e 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -365,7 +365,7 @@ static int console_locked;
 #define MAX_PREFERRED_CONSOLES 8
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
-static int preferred_dev_console = -1;
+static LIST_HEAD(preferred_dev_console);
 static bool want_braille_console;
 /* Set when there is at least one console preferred via the command line. */
 int console_set_on_cmdline;
@@ -2567,9 +2567,16 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *
  *   3. Only matching entries can be updated.
  *
+ *   4. Braille console is never associated with /dev/console.[**]
+ *
  *  [*] A valid @name and @idx will get assigned for a devname later when
  *	@devname matches during the device initialization, see
  *	match_devname_and_update_preferred_console().
+ *
+ * [**] Braille console is using the mechanism for registering consoles
+ *	but it is very special. It is primarily used for user interaction
+ *	with the system. It neither gets printk() messages nor is
+ *	associated with /dev/console.
  */
 static int add_or_update_preferred_console(unsigned int i,
 					   const char *name, const short idx,
@@ -2658,10 +2665,20 @@ static int add_or_update_preferred_console(unsigned int i,
 	if (brl_options)
 		braille_update_options(pc, brl_options);
 
-	if (brl_options)
+	if (is_new_entry)
+		INIT_LIST_HEAD(&pc->preferred_dev_node);
+
+	/*
+	 * The last preferred console should get associated with /dev/console.
+	 * Except for the Braille console which can't get associated with
+	 * /dev/console.
+	 */
+	if (brl_options) {
 		want_braille_console = true;
-	else
-		preferred_dev_console = i;
+		list_del_init(&pc->preferred_dev_node);
+	} else if (!is_braille_console_preferred(pc)) {
+		list_move(&pc->preferred_dev_node, &preferred_dev_console);
+	}
 
 	if (user_specified) {
 		/*
@@ -4044,7 +4061,7 @@ static int __try_enable_preferred_console(struct console *newcon,
 				return err;
 		}
 		newcon->flags |= CON_ENABLED;
-		if (i == preferred_dev_console)
+		if (list_is_first(&pc->preferred_dev_node, &preferred_dev_console))
 			newcon->flags |= CON_CONSDEV;
 		return 0;
 	}
@@ -4088,7 +4105,7 @@ static int try_enable_console(struct console *newcon)
 	/*
 	 * First, try to enable the console driver as a Braille console.
 	 * It would have metadata in the preferred_consoles[] array.
-	 * But it won't be counted as preferred_dev_console because
+	 * But it won't be listed as preferred_dev_console because
 	 * it does not get printk() messages and is not associated
 	 * with /dev/console.
 	 *
@@ -4115,7 +4132,7 @@ static int try_enable_console(struct console *newcon)
 	 * Note that a console with tty binding will have CON_CONSDEV
 	 * flag set and will be first in the list.
 	 */
-	if (preferred_dev_console < 0) {
+	if (list_empty(&preferred_dev_console)) {
 		if (hlist_empty(&console_list) || !console_first()->device ||
 		    console_first()->flags & CON_BOOT) {
 			try_enable_default_console(newcon);
-- 
2.56.0


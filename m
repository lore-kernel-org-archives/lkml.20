Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985786;
	b=3uuW837IOP3MBNOmPP9meKDXCIGbBUeifx7N8z9v3rYBNYw/bwy2HAXKuNirkDeYN7AE
	 ue3cRZaraR1u0ox3hwrf8cr5x6AMPFXGokxMl//FaO3ep8NU8GIFmtiGOD44mUTU7NZbm
	 +f8gswTs2+Twsp7FqQ7ojNKr8Y0samaihS5nwLYlIRYMcsli4vfvnoK/cwi2MkX+LVEsa
	 0KbFyjK5qWQkYhjIXkAXXSeS84ziQW+/YgY7fyrwyx2FE/lPdSV895ur49s4ZzWMoLeAK
	 F94ILysK0o7j0PCW8zmseF2ljdEdkBzkSYB9tKBvnvZNMSkbW8Dx9t1ukKuP9cg33+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lP5gdhjlWCYnG9aSG/nvYTwv0o/lXe1/1V8+CbFrcw8=;
	b=qwgHjbIP8tHy9VdYvgGyhHQbfXjnJNi48zDfEs4dFks1ZOKRUORp7S4Iw4Th7Tth4anP
	 6i/wUkWl0/t2wsoc5BJqdVsSrTzd9j3rZN6sarl3WHyv9S/NVQYRn18pSoPSUzLufuOmB
	 xNDwVnS005B+ooKEILqyF/pR4wyFo4l+HJTkStiEtNaunfrk1RG4n7ZpIZLaAG89hPVuL
	 SkKqbyLSnOSXZIwndszJIajrMzvhT3H5JWoFvUspQmB5mhkTN5ZO3lXpDCgNLUAMZ9giA
	 qVAB9vD11NfTIbDZvWIc4d4dRNW2C5ixRhBsiAG7P8nP25nuGDSRCoYjgo/zO8P9klw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MEoxFz1I;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F18606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39F18606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MEoxFz1I
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso6131915e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985785; x=1794590585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lP5gdhjlWCYnG9aSG/nvYTwv0o/lXe1/1V8+CbFrcw8=;
        b=MEoxFz1ION1Be8ZjpFefpQlBek+EaUehReroosZ/QtvQxzoHriutkTF3Ne4s6XV/5I
         VpjawOvGEq7PEAvzQ10DtnEXtBiIenDpX5Lxy1kr3KYI65CubjMc6tb3+io2n6KtG6rl
         VSUNVBh98fkNwXURE19rMX9b3M5NZep9qZvnHvSEzz+CPhx3VHSGcJkf0EKAOYREC1qf
         KGoWhk3RM9RkM07UaTrTULQ6aNV8sz8YKdhDWulqym9vcFrIG2kJZAvADLCkEJO26OLp
         xkMOBe84sBEFa28LLW5QqJu4MOV2OLU8L/DvAml0JQmLTb8Za3b9y7JWCo4tR6AwbHWS
         r3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985785; x=1794590585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lP5gdhjlWCYnG9aSG/nvYTwv0o/lXe1/1V8+CbFrcw8=;
        b=SLwH3gIRfNtQ3eeMsOpBZ/Itbg2GyauhApPnz+C9RUQWdjWxqGJW2uu/fjbgjegzN3
         kh/LbTZeZEtWH+qdPPMPhbyP2Rcm8l0IB/hUFrIssY7Y8Lx1L5EBTfQucfTP7nM8MK1j
         72kBfhVuY1V/czvRMI/Ahl8bFwnInyvkeedW8uckiPpfOvGr06VpmGM/2tjvIIVhHEwa
         Cp9ynt8OqgTj4/cu6Hcex7hqr0Br8yXDE9jFCVsQcKv2nNhxJ0oo+6wVPaE7zFXjxGP2
         gMmGEPTzJaBxREA53Hb/SgUBCStEd14x3DIRoropSr/x6pVinxUilX7n8nZGQ6CwszPJ
         Pf/g==
X-Forwarded-Encrypted: i=1; AKwUvBy5rekzWdwbDMDtIT+Esmzd/TP7G941STNSz6UUN2sQHeeDtnOz1768w9rT9TrbC8o8MlTuutHJJP4j6+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LQ2vjxhwpqbeWzqDgmsbVRKKM1Dfs8TpPABZ/cu7eQL5JeJWB
	6D311YAaRqLnJNsiVrvMI82PYQMKn4FaFE9v3Up7ES/Z8zDiIAMrEI02Z5pW0KhKew0=
X-Gm-Gg: AYBFou2GA03pIunwlt05VU5bjF2TBnFEMwckeTsOc+4+3Kv+k4ShgXqdC9kuWG9vJ1K
	XkFyZFdYDoXbvxzDqNoybaLEMun/oO0A6IvuP3esOXn7+ip5TH+mSa/P6rpkt0sVGN9/Mn1Y663
	6rhxQqtGLQSuRiC+3goOvFXKgjeGKxyzZeptbGA4bqGtqX6nsOGtn98D3dWNaKTVLH5yqIHVsoC
	fVdixn7/20Q/veaZiuGrm7dQ5BBcmE3h1LOvR2n/qkqcy3zQtg5jveeqtVXAmjrK5KwNoCM4JxJ
	ON04SDVoTALODyLsZ+mA5Q3czQTyp5hwEtABTERSRUU1k0nsGe9ke4BwNg8nU+U7NrDXPdRxQSW
	dt09EExv6HD8A7irSqpJKCxJkRf8C+/mUmDPeo02Bb+VkeupTv8SQ4okZu1AVyF5tN+xl63JPut
	XoTzi/upruhyd15T/+h1GwZkhWN1pU1oaYdY7Dci4T0KRuDv+vS0uwc9vErvtk3hxdObCr5zhi1
	UeAiTv79rvKZV401nabKh0DUMqn4sOw4Yrzfkv9tQVoza/lY3pUTOpv5UHPgSC3+GNd4JGVwmtr
	yKZ4iqM8Jm1U6mhUl9Yv2e/pq1GwHpk=
X-Received: by 2002:a05:600c:6306:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4b6dea69843mr63600315e9.10.1793985784675;
        Fri, 06 Nov 2026 09:23:04 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm274220755e9.2.2026.11.06.09.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:23:04 -0800 (PST)
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
Subject: [PATCH v6 14/16] printk: Do not set Braille console as preferred_console
Date: Fri,  6 Nov 2026 18:19:50 +0100
Message-ID: <20261106171952.207909-15-pmladek@suse.com>
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
index 2bcf82b2c4e3..5ec34dc2d168 100644
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
@@ -2649,10 +2656,20 @@ static int add_or_update_preferred_console(unsigned int i,
 		braille_set_options(pc, brl_options);
 	}
 
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
@@ -4035,7 +4052,7 @@ static int __try_enable_preferred_console(struct console *newcon,
 				return err;
 		}
 		newcon->flags |= CON_ENABLED;
-		if (i == preferred_dev_console)
+		if (list_is_first(&pc->preferred_dev_node, &preferred_dev_console))
 			newcon->flags |= CON_CONSDEV;
 		return 0;
 	}
@@ -4079,7 +4096,7 @@ static int try_enable_console(struct console *newcon)
 	/*
 	 * First, try to enable the console driver as a Braille console.
 	 * It would have metadata in the preferred_consoles[] array.
-	 * But it won't be counted as preferred_dev_console because
+	 * But it won't be listed as preferred_dev_console because
 	 * it does not get printk() messages and is not associated
 	 * with /dev/console.
 	 *
@@ -4106,7 +4123,7 @@ static int try_enable_console(struct console *newcon)
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


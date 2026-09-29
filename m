Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FDC50E5A0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683723; cv=none; b=i2pktqtsDLbGIzAs0V+VF++qxQjMwZojLRzveuHErf/jXlF30XRg7gA2r+FE+3rM6z+7g1oAkzjbME1R31Adm2M405TjCG/RtnsdxcXWQwB1fUphjadMxoGhN6l1qYDWaSNFDnsYOQON2xZHgJzOENq/8rdqKGUJIs2vvpnhDCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683723; c=relaxed/simple;
	bh=GmdHBVg5K3EDa2/xqvNjCHMOTYCKoFH8Z7i9n2yx/tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AunBRsEN/idD3UYvAnxp1agrpDw6UCiGDJ6Z4CM5vCW3ztnixCgzDRNdgRawKCNcfSdU0eOVyZNN33SrGJeWhw+0KCuFup5ToIWIPVB4DVUbC65I/ZkD80L0pWXgQAc4oSNB9Cb4AJttAh2hUQHYzRpcVQpOJ49Um8IMAk4LKYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fso6avUu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fso6avUu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so32392325e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683720; x=1791288520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KHWQjpWIkKdxM5wAaOyfBYxH6+bTkvqAS/gh1JEuPo=;
        b=fso6avUugUfVrG4299MUdn7RlmXwnULWxalRziMEXDZYfN6eBkYfAL7BzuNFKPh1zv
         v7vIOr1opxbc6o6qrwhUsz+AJmCUaWD+oG50Q3VkjHKmBj7bp4WpRQxPIvIVRSuHzBmb
         RSw3tbplbjiQZWsRP3nap9OmvBCNwycpnNBGM5SOutnvKQXQAfJ7FCOZ5p0EjCGBER7g
         kZySu1pPQY1mmZrN8irqfEdmvZHq+8mmT1pqsJRLu6N7Md11cdwk1VKFYfQLSR+RCSum
         mBvFNCF+TKZvqUSt+sTa10fRL8lodY1tZO7+kYhgRI/TbzCDqY8ObuNFot0s9Lh7e36R
         8vRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683720; x=1791288520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8KHWQjpWIkKdxM5wAaOyfBYxH6+bTkvqAS/gh1JEuPo=;
        b=g9Ks5zEujYQB6UliPrl/IANBT7nepccMrnNwvxojGY68Ev91p8c4e7bNucaY7n1HTw
         4jq/4iPTgXZLZ6PvJfK/DF+N3rfc3Y/ZpQ94YaJBrizh9TmOeZ2P2SwT7uECXscZTsc+
         iW5gyHjc1gUnC8KY+Tx7y1KZqZFgl1tkHvrdISBwGONfodQWrrkcH1+xkfPhrRwZUJDu
         e4CE5WI+brXncN7XrQ8SEZziDXGPRuIzLrKxN0bpINQSdubB7/9/6vP9JUDcH8jTjLJt
         HSd8rts/YsoRAMZFx3ISplMmPhkCoYlZPIQKnN/VSkfrftMo3KWZroCbG2C2FQO5GHLj
         P4vA==
X-Forwarded-Encrypted: i=1; AKwUvBwlFPeubfeMYByn7Xbh9tGqKwg6ooVWwwQdFanE33o/g8Qrz5qmetCa4r6/yNb/348levDHlR8Ln0pZNSw=@vger.kernel.org
X-Gm-Message-State: AFuF++mo35HiYcxGo/YAbaLgiqZABI7JFxYX2ADg6Qt0rypwM18EMrHp
	l38cSBLKXVKk4wvrvlnfEqHqR15AWR5kyRgrYKXaPerPlGmYGbNO4GNPFtCq0/fnPy8=
X-Gm-Gg: AYBFou2ZD+bfR/3PRfWItWtukfGymuGjpLiqB4APV+0kI5w1UgGNkcl8yd4dgLCb2zg
	IEBldlEb1hLpM2c4bN8P0Q68rg+t9dSxYy6jTMFAKTAFLf6m66UQtcZEhmqvwgkqvoMxLMjeNsl
	ccM80ahGzS3pdDZLPdoTH5zdz/9K0TfmgeGNd4Z9T0hZNN39g/srmvAQG5eizLMVcuGE0yXcN8F
	+0N9DUJjhYpEp1T3JiOAjv5L2XsePPItBqcBfajdeDQfY7Mbb/beBh3Amg0bRfFD54HRdglvqv7
	zIqf/v8iput/jSxD4c6gKD+/XAhxSh3KlP2KW41d/95CHqAoig2aRwN2A7qx7NlFusvRKzrTQ71
	NcMuxphiMx4wkxGvUJ3k072hN2ImtDuZexDqaj7V41fa9tACCS+FCx4Dvof8gTZN9zbQEnJMxmj
	TqMYzgGcbJXluCxPwEDypI7PEdS1fD+6vhU8jZ5zUGig3qfcOgRofrTYMMly2gFs90RJqTZmx32
	BX9JXPC
X-Received: by 2002:a05:600d:8652:10b0:49f:feca:b3bf with SMTP id 5b1f17b1804b1-49ffecab799mr101425555e9.8.1790683719537;
        Tue, 29 Sep 2026 05:08:39 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013c64fecsm222435e9.0.2026.09.29.05.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:08:39 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 14/16] printk: Do not set Braille console as preferred_console
Date: Tue, 29 Sep 2026 14:05:44 +0200
Message-ID: <20260929120546.328616-15-pmladek@suse.com>
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
Assisted-by: gemini-1.5-pro
---
 kernel/printk/console_register.h |  3 +++
 kernel/printk/printk.c           | 33 ++++++++++++++++++++++++++------
 2 files changed, 30 insertions(+), 6 deletions(-)

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
index 75d2a1085926..a2cc7bf3a62e 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -366,7 +366,7 @@ static int console_locked;
 
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
-static int preferred_dev_console = -1;
+static LIST_HEAD(preferred_dev_console);
 static bool want_braille_console;
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
@@ -2567,9 +2567,16 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *   3. Allow to override @options via the command line. Last one wins
  *	except that the Braille variant is preferred.
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
@@ -2645,10 +2652,24 @@ static int add_or_update_preferred_console(unsigned int i,
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
+		if (!list_empty(&pc->preferred_dev_node))
+			list_del_init(&pc->preferred_dev_node);
+	} else if (!is_braille_console_preferred(pc)) {
+		if (list_empty(&pc->preferred_dev_node))
+			list_add(&pc->preferred_dev_node, &preferred_dev_console);
+		else
+			list_move(&pc->preferred_dev_node, &preferred_dev_console);
+	}
 
 	if (user_specified) {
 		pc->user_specified = true;
@@ -4020,7 +4041,7 @@ static int __try_enable_preferred_console(struct console *newcon,
 				return err;
 		}
 		newcon->flags |= CON_ENABLED;
-		if (i == preferred_dev_console)
+		if (list_is_first(&pc->preferred_dev_node, &preferred_dev_console))
 			newcon->flags |= CON_CONSDEV;
 		return 0;
 	}
@@ -4091,7 +4112,7 @@ static int try_enable_console(struct console *newcon)
 	 * Note that a console with tty binding will have CON_CONSDEV
 	 * flag set and will be first in the list.
 	 */
-	if (preferred_dev_console < 0) {
+	if (list_empty(&preferred_dev_console)) {
 		if (hlist_empty(&console_list) || !console_first()->device ||
 		    console_first()->flags & CON_BOOT) {
 			try_enable_default_console(newcon);
-- 
2.55.0


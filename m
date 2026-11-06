Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985670;
	b=TuDATLbY5vcB0JG4GKNg+oNI8GcAwn6OkK6kfE1Sp6KdkmPAXFpOcbabBKBy1qXNck7i
	 79+9NQNxW/YgTZzRbv78qzHL1PwdH/QyyAsVzQx+QuumMkN8zUOzjUbBYUDmunKxObR19
	 tTmv38pahU9j+3aRulCPq4c08QZ9SBB4Ww99Cy0eK6RNGK9KqSv9lOaHI4fj11xPwX+Y0
	 AFvyY3P1flXfLYJT2Xd7RJWXVoUgqhWrHk+A0kvHL5WAiwOl4Ic7192RC6ta2QRm4o9Gg
	 yapqmW4KDVwKqAAp6h4exG28pcBhyW5oOMly0mukZ9rvfHwXQVvNHHgvkI1/eq2eWpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RtI2f5FgGDg+mdmprwJofy8UDryNlfF3afVfUrT/OrQ=;
	b=DLAUDvvX0uc+cpP1FoNEKZjz1WkrKWDJpOkFP24BndWNbCK6XQBKz/TX9Dbbx2gBIA4l
	 vaMpibd4llYx/ElhC5eIwWV3f7xHMFyzA0Yyb+mQyvrxvy+YCRy181qh72FbmkP89i+EW
	 maw4H0NRJblL42rzYD37ue3PYKI5RyMKNmXF3T0mi/wR83q/WZQDRQXJzYBOQuUDiajWg
	 gRZkyl+u79JNDXIod0ecAlYp9LvaaAzWUIRrltyeL43rReRTeOuT8h5CEtEQ/bGJNN9+U
	 Y0LunquSi2JdgzomF9d68hqE0ZJ1iUDdpXfei5FTjGioefNUXaQA2koMcMrmupl3o6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q3P0E+AA;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662B5606D80B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 662B5606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q3P0E+AA
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so7801335e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985668; x=1794590468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtI2f5FgGDg+mdmprwJofy8UDryNlfF3afVfUrT/OrQ=;
        b=Q3P0E+AAuDjjPSqiKacBo08VJ+QscRup3wM9gVY5jWuXR1saWbM9LyU0Zpohs9/sIq
         HQWPgAMzmou8D8RPzdeSMuxfURdjR4M835cT6+PEBAxfg5p55VNYaWePrl6E1WoGDodL
         +vgRMJHsmMDdCUyDmjrZ4kihTGNo1GIBxZ+A6yuPxZ7ZDRHfzirBe3xZ7AOWSXR0glFR
         ip2vjdY0je4pAvl0O6O4PINggrQ5e4lpaLW0PWJpAUOp3x53VtyxG7lvqvM6Iqcq7Pqq
         eXbSY1GHuOymIvl8B8gq6I+UX9XLEYEJdzn2yFMBkmxOFhQ7XiQk0UsYnBgCGmB8Mv9u
         3LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985668; x=1794590468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RtI2f5FgGDg+mdmprwJofy8UDryNlfF3afVfUrT/OrQ=;
        b=V2ARlvtlPnd6Rq417IEqQ8Z9tLs5rLPBm1IWkzlS+yZbMvtrQ5SUu0T/nNiFJbUnsc
         XJMu2C1nPXlSxK8MIQ5Ou4R2ospaIKgGdQbI5kxwqMjL9sxq7HLQ4CQGlV9I8Oy4WgsC
         6jZVkNRXOBedIqyXY4w1YVkMrQGg3wBMkU0PfKqNsTBICMwBmFsydrj/rzDbBAOQEdtW
         tpv5DC3UUSxuqKiTtozsoB/Ydz20Z+9DCs5YbJy1KwgTR57/J900v9p+9Hb8NW5dWhfW
         8+nfDoQF5toG9gbH6PvkXrDmhRYR6vfXa6zVEntvXPWJeNUl0QaCZn/ttuW4z8egW8O7
         +S+w==
X-Forwarded-Encrypted: i=1; AKwUvBwQPQPwmIRpgQiE5j5tcqsldxeh+i3zsSRCdAzQi/70/RZbyVuffSXV4ebJxj8WCedoKEsA6j+YfMFJOMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s0GcBFWXusMgW/z5tpu9eMoSLk/y+q/IyhYRgHzwjQtfKJMIx
	geOchbRdyvW8dtvrG9cIb0ApzswXXFu4ak73ExpmeSgfOMEI7UdkGixCy4xGPw7ADos=
X-Gm-Gg: AYBFou0xWH7NqeIbhg86wSxbgb0EZXoWClD05HU4Q3IWplRf6qji3L9EX82GQyQnV7k
	v7xvqmx6LOEwTtLoiJQwAFlYz/XyeM0/gLaJh12jAUsoVR7oxw6E9GzTApYD0bfGjQPNPPVkhCm
	/euTi90tsAOAlpASE5cZYQQ3uiltMAJc5RZbIrAQKwTfvzc8IPitbgQThAiU2LyfMTJLyJDC7qT
	11k9bxBwHpkRl+BXg3g7aLaSCF1uKwaBGuP4fyfMajXBgSNyNd1rNeH6UjFIR3MkyycMCQvP/5m
	WZDqotxdmxyU2er4eGn0zQBdV/dJIEpl+0wzo/XIAM8FL7CpXv5Pyg/ZmUbwSQDOJ57Id8j0fxR
	/91I7e3X/xbChSjjhYbK0cBvfKYAZgcgcT7xAVHozodBjshrwW1EVAy5Wk0DvJiQxaD0V1yiA+A
	GXbbTeUKpA7g/uhR+urO5px3GbvBrkY0yRF69xoCDKDCDJjeXrAAX7AVC5Y+d6NaBL9UWLbTWpH
	vZ5hqhOJM/VAskTo0cF2Ay7kZFY76HhHUELk+b9mBEkx0t2m2lhpZHcFtQ8hmB78xzLiLUce9dW
	9WzMFeljkNKnVyw0tXypr1erBZq7rBrI
X-Received: by 2002:a05:600c:5307:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4b6de973c39mr52155845e9.7.1793985667739;
        Fri, 06 Nov 2026 09:21:07 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e168f331sm86675335e9.3.2026.11.06.09.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:21:07 -0800 (PST)
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
Subject: [PATCH v6 04/16] printk: Separate code for adding/updating preferred console metadata
Date: Fri,  6 Nov 2026 18:19:40 +0100
Message-ID: <20261106171952.207909-5-pmladek@suse.com>
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

The logic for adding or updating a preferred console is currently
duplicated within __add_preferred_console(), making the code difficult
to follow and prone to consistency issues.

Split the code for adding or updating entries to avoid code duplication.
Make it clear what operations are done only for new entries.

Use this opportunity and replace an int with an unsigned int for
iterating over the preferred_consoles array.

It is a preparation step before adding more consistency checks.
No intended functional changes.

Reviewed-by: John Ogness <john.ogness@linutronix.de>
Acked-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 114 ++++++++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 40 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index a46c9bd184de..b7543fea865b 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -366,6 +366,7 @@ static int console_locked;
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
 static int preferred_dev_console = -1;
+/* Set when there is at least one console preferred via the command line. */
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
 
@@ -2543,26 +2544,34 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
 }
 #endif
 
-static void set_user_specified(struct preferred_console *pc, bool user_specified)
-{
-	if (!user_specified)
-		return;
-
-	/*
-	 * @pc console was defined by the user on the command line.
-	 * Do not clear when added twice also by SPCR or the device tree.
-	 */
-	pc->user_specified = true;
-	/* At least one console defined by the user on the command line. */
-	console_set_on_cmdline = 1;
-}
-
-static int __add_preferred_console(const char *name, const short idx,
-				   const char *devname, char *options,
-				   char *brl_options, bool user_specified)
+/** add_or_update_preferred_console - Add or update a given entry in
+ *	the preferred_consoles[] array.
+ *
+ * @i: index of the entry in @preferred_consoles table which should get updated.
+ * @name: The name of the preferred console driver.
+ * @idx: Preferred console index, e.g. port number.
+ * @devname: The name of the preferred physical device.
+ * @options: Options used when setting up the console driver.
+ * @brl_options: Options used when setting up the console driver
+ *	as a braille console.
+ * @user_specified: True if preferred via the kernel command line.
+ *
+ * The function adds or updates an entry in preferred_consoles[] array. Also
+ * it updates some global variables which are used to make the right decisions
+ * in register_console().
+ */
+static int add_or_update_preferred_console(unsigned int i,
+					   const char *name, const short idx,
+					   const char *devname, char *options,
+					   char *brl_options, bool user_specified)
 {
 	struct preferred_console *pc;
-	int i;
+	bool is_new_entry = false;
+
+	if (i >= MAX_PREFERRED_CONSOLES)
+		return -E2BIG;
+
+	pc = &preferred_consoles[i];
 
 	if (!name && !devname)
 		return -EINVAL;
@@ -2576,35 +2585,60 @@ static int __add_preferred_console(const char *name, const short idx,
 	if (name && idx < 0)
 		return -EINVAL;
 
+	if (!pc->name[0] && !pc->devname[0])
+		is_new_entry = true;
+
+	if (is_new_entry) {
+		if (devname)
+			strscpy(pc->devname, devname);
+		if (name)
+			strscpy(pc->name, name);
+		pc->index = idx;
+	}
+
 	/*
-	 *	See if this tty is not yet registered, and
-	 *	if we have a slot free.
+	 * Historically, the preferred options are stored only by the first
+	 * caller who prefers the particular console.
 	 */
+	if (is_new_entry) {
+		pc->options = options;
+		braille_set_options(pc, brl_options);
+	}
+
+	if (!brl_options)
+		preferred_dev_console = i;
+
+	if (user_specified) {
+		/*
+		 * @pc console was defined by the user on the command line.
+		 * Do not clear when added twice also by SPCR or DT.
+		 */
+		pc->user_specified = true;
+		console_set_on_cmdline = 1;
+	}
+
+	return 0;
+}
+
+static int __add_preferred_console(const char *name, const short idx,
+				   const char *devname, char *options,
+				   char *brl_options, bool user_specified)
+{
+	struct preferred_console *pc;
+	unsigned int i;
+
+	/* See if this console is already preferred. */
 	for (i = 0, pc = preferred_consoles;
 	     i < MAX_PREFERRED_CONSOLES && (pc->name[0] || pc->devname[0]);
 	     i++, pc++) {
-		if ((name && strcmp(pc->name, name) == 0 && pc->index == idx) ||
-		    (devname && strcmp(pc->devname, devname) == 0)) {
-			if (!brl_options)
-				preferred_dev_console = i;
-			set_user_specified(pc, user_specified);
-			return 0;
-		}
+		if (name && strcmp(pc->name, name) == 0 && pc->index == idx)
+			break;
+		if (devname && strcmp(pc->devname, devname) == 0)
+			break;
 	}
-	if (i == MAX_PREFERRED_CONSOLES)
-		return -E2BIG;
-	if (!brl_options)
-		preferred_dev_console = i;
-	if (name)
-		strscpy(pc->name, name);
-	if (devname)
-		strscpy(pc->devname, devname);
-	pc->options = options;
-	set_user_specified(pc, user_specified);
-	braille_set_options(pc, brl_options);
 
-	pc->index = idx;
-	return 0;
+	return add_or_update_preferred_console(i, name, idx, devname, options,
+					       brl_options, user_specified);
 }
 
 static int __init console_msg_format_setup(char *str)
-- 
2.56.0


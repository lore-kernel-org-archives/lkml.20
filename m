Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8485172E3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683606; cv=none; b=paVQrMA3jXshp1MwScHWhouijI+AeTZDxujVbjE5Wipgs9srER2L3Lq13n6mnu0syuD6sZGi0iMV8uCnP2bKuBU7CEZL9Acba2joCkKjXnIeOfs2vVZZtF5luA8lpI9yiwoy1Q2OHJ9gbGMkhlkLZDt27fCM0cOLTUuTQM1mR9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683606; c=relaxed/simple;
	bh=C+TAvikEz2zBmQBW2PxAdq/qjp1bKxDqODCqRpyxkl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hcc/XG0wD9umGAot2Mc2q+053z2Ao7aa6NQqyJgrLqQNFqzJRXhMQXO8De7KUQRiJF2t53MA+5UibY7zvx/2lL40UDTXYyhWjZ5blQ7pQ97dcAsyeYak3VE1I/57YfAUXc6eJj4sF4doANnFMVIItFoqIjL5dTOZ61+zedfAwWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=d69W0qhJ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="d69W0qhJ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so23247615e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683601; x=1791288401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0jv8Huioa2QsCZsQS+DbktYVF6atf9CK0CuVp0nHSo=;
        b=d69W0qhJqEuHBy6N1wmhu44Vgvf2jkMDc27AknD/phg35uFufpkBlE3M1BfznzfVDW
         6gOb/fWg80d4Bkt8svhppmjDc4LNq88Xo5cedDzV5cIquH1yyF5mM0afa1rUPnEPdkY/
         nrm1O6RB+4wXtun0HRlZaLytS41o3C6v7TkhLSgN7YdOrYqSTqaD0xUAj7sUHcHcQ5Ot
         uXLGjkrMOlR/38YKavvRgRxCSyKKjCgQNkAgKcsH591d/5olF/U5dhFQEGMZrUTUw6IB
         1nwEaDCCl70WndSswzeIxkhm30U4ZCIWqKMNQ561TMMvghIZyWC1bo6pHgliE2oj8sF6
         Uwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683601; x=1791288401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J0jv8Huioa2QsCZsQS+DbktYVF6atf9CK0CuVp0nHSo=;
        b=PU2+bJU7gyCM0mRXf5KCbiFqqBJIq5ko9Ptp51x+iTSCmRw+/Y5EFQLCol66+/7VQ+
         zjskahCIkOnkRCzlABg7XTk69Dvu2G7u8HGbRgh2PrG0N7V5lm4Nxy97Uj6WFj2hhQSv
         9uexsNsNHJdHAvNHD9Uk9wnj6KHsFQ/PkJN7RtbQ3Laphz3C+a8ulxdRY9jxul1WrANW
         T4Uwk0haphx8X0zTiLC5JmfScYkVcm9p2t8KoLO99xVvKHr/bhG7ojgnQGpQd2w2awOX
         onGmLp5iS8pzTD48IoKMYn3p4Rt8OeoFWh/dnALUk4gBU6ct64Anc8XNxiLCwe1ARqtx
         gbTg==
X-Forwarded-Encrypted: i=1; AKwUvBwrOvsa5XExr2xDaYy7CkIkf8pOW14F4tZT2qyHhPcSVdAigIxNafjQ6KjKju+PoGRJpyJDYY6Ts13wkA8=@vger.kernel.org
X-Gm-Message-State: AFuF++lqV+Mod0upTlkDN14II9zP9t5UzrnnzynXsjV6f2QJFYihwyJy
	lI4FEX8dpsO2FDzt1rbYpayte5cRHsDWx6GGYGhPH9L5H8nx4+5l3q2qf1Tw8gx4L2Q=
X-Gm-Gg: AYBFou3XdDo3H8IlWh5O6dGvlqhfJcjw1a14m2Lixk9TB0My2BfZs5iqLhs2JiZixqA
	d6sY+yNa1xKB78ugELT4eoD2/5n9yIKc841f+jWr24MQR5TQgYozo3EHFaKwk5q0IERTfhlAx8m
	axvWn/OvSnOj2G8IVaSJW+zyTdLvHsDm/Eqc4NO5cMYFcGrAQnmryCA/Y9kMXfARehuet8kgHxW
	kUExnvMsYIQTjVtOivhexNAFUkDX5ZmjeHpmgDeHUKe7ywq/Wm9rRTzH8yVbUc5EwcgdShB+5rf
	h1Zd7AhH0WyedRqvz4QO4qRyvQDs2FTwpqx0StqJlKwvkrCv1v60NCJncWS6dyguKqAcy9cbut6
	forkSjCyCYW6wxcaH4wyX36eUIVb1DMygwRNSFYmi/k1x0l1Zde8mQjD9kWopCGLsIw9MjEoZ7/
	1lZfNBmJ6wORrsFHk9v/CqT2352sYykw0XNCAZKb1SN6KRTkQHM/c4T+AGo0Jr/d6MAo7t9zP+U
	mUgf34=
X-Received: by 2002:a05:600c:314f:b0:49f:e4ca:e09 with SMTP id 5b1f17b1804b1-49fe66ca9e5mr269197715e9.3.1790683600285;
        Tue, 29 Sep 2026 05:06:40 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfafa23sm69965505e9.14.2026.09.29.05.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:06:39 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 04/16] printk: Separate code for adding/updating preferred console metadata
Date: Tue, 29 Sep 2026 14:05:34 +0200
Message-ID: <20260929120546.328616-5-pmladek@suse.com>
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

The logic for adding or updating a preferred console is currently
duplicated within __add_preferred_console(), making the code difficult
to follow and prone to consistency issues.

Split the code for adding or updating entries to avoid code duplication.
Make it clear what operations are done only for new entries.

Use this opportunity and replace an int with an unsigned int for
iterating over the preferred_consoles array.

It is a preparation step before adding more consistency checks.
No intended functional changes.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 108 ++++++++++++++++++++++++++---------------
 1 file changed, 68 insertions(+), 40 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index c3e50f19a32b..174aee533a53 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2544,26 +2544,33 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
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
@@ -2577,35 +2584,56 @@ static int __add_preferred_console(const char *name, const short idx,
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
2.55.0


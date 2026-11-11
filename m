Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412253;
	b=4BtD1zgEQO+u3CLF6l4KveOKJKDDA8y7+5PrNhzegqGdt/VFgaat77JeKqL/ZYGuJ+wx
	 5WuPZwmXvqOTlmnpDYC/HXSlqnwDPxtCtQmpwKAfjFfOgs+alGA36gDLuIFpAyFhsi4gQ
	 x15qQw0H+q237DCjAxhwqyoTxrkvpd6Zb7UCKqNIBzIawHjiajp3oiHYSNERVlj15gwFj
	 WgFct1ysf749pj5ajhSISyTkKQGh9SyWhgNwA87e+21DDEhVsJjh0bzrdeArXE3Vlga4o
	 kXZh9ofMOP5LOLIzwxKb9VBH5woyr/y8beKQ+O29FzJbsRCOY0HdRgY2lDqH9CV/gAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k6G6xgqSlEM3Q4tZbFCHAlRdnKn4XyO0f5C8BowqYDo=;
	b=Ax+gxR20FMMaDUIOnURVMHl3LXLbL/IbuNTyH7Qe5wSGJS5yOmCgRqQ9wTfkAfEeHy3q
	 E4ZtTf2HJ9PkzXjmmLgkUXxPRVXYSSMr4aTqoKB+B5Wh+4WzlZ3o+SsITFxgXxnOVM5fD
	 xqXzLsE15IrAH6kuB6JPtCyU5rV+34LTSMUxUh7S6wC/8kVI74t247eXBnxJ8sioQe2iX
	 DbWbpwSGTrd+bMHug20K2LBmWcZ5bPiq9OQhnEVPuH5Qk3MR0i1drQpklkUkxZ2Gp0Y9i
	 0MDTM32bVNKsONTWadnpAKK2Ry3jeQGOb4Ewk34OBBOLZOV0vHcaF+MgYX/3IaPKHjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eJYHDkyj;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F8A606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53F8A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eJYHDkyj
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1666379f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412251; x=1795017051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6G6xgqSlEM3Q4tZbFCHAlRdnKn4XyO0f5C8BowqYDo=;
        b=eJYHDkyjFbynA+NTVXEHy2HC5BVD2dZikIWWz5Dl/lz6waHr4pVpsSmrfUAZTavWkp
         CqLFfeWfol/8iSO/T3sXPagcgxOAM9usjpkw76zLkc6nt++HHIuXyotcNdbXJJIL8aOR
         nnseyPK4nU9F02jO7YGjczloVvHZBl1cXUg4/WZhpEESEp0Iypsie85KXOfUmkqnACPE
         LqTQzXfycE7zq/S1JfEVc5C8u7jRfdgIay9kXRr3gEEsDI+1osO01XTJZkE4XaKSaxmj
         7sJGfJko+rS+aGcGvnrEDM1YQVDt3UDfT204GPD0NGyKnR5nizC8tQQZOEdx7XKh3swj
         qleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412251; x=1795017051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6G6xgqSlEM3Q4tZbFCHAlRdnKn4XyO0f5C8BowqYDo=;
        b=OvY5i8349Xm/VcY3o4/c5Bm/+fxfIKt5buR8CRp6fbls0TOihIG6m+ufe2p7ahj0Jp
         3eqAvh3qC4F5p+CcDO11OEWoB50Ag+QTs8iLQJj4inRLMcIJoS6l+rpNs6tY/MDhEPA3
         Zhjzk90feYAkH46gxNQ9J2JBhALMcH6wI0c+wAes6yExMS5ViIQZDhCJX2JaW1N4aI23
         Brg4C2YuRFqCe0Mvu6SGyWjfrdJIp3RPYXeA7xzGfODm/DgV0FYmMN25Fks2DyY13EwP
         Dpe/rWvPMhu/Elk5bNli3yfHqrEfwHq46hyI7JbejbKsPrKNJBvMPLFAW1AZPA8c1zrY
         hUiw==
X-Forwarded-Encrypted: i=1; AL+hErGlT+lOKB2h3COHB+jgrNVn84QtUhmDqCX47pokJ4CO8n4vqD/UKlaibCCjCLuZCX9B2J6400qJq+Vjkoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m+fLh8jtjPLfZfJZjcoNQzCBCwX1McL/6tJ2XCiVIv8Chz8Kh
	oPiCuCDfIo9M9tyLH0szsgdQW6ztzTF3/kCOhlLhwlMCqBf1H6g7+F25+Dy0K3KiMpSrZrzkpUt
	i8JjFWy0=
X-Gm-Gg: AYBFou3MXV3qwL7szdrAKCTOXq1rztbcETSxGcvXW+04Hmg7obYxHNQZa2rg7MSwi4O
	+x5RYeBEwf6WsXyqeDgaGz4yWYdYIPiy1M1vP0oBvcBXkTDJ6VPotZN2PZAOyAnM53SJnM2ClLm
	YUPrMCbxKwif5XDyl+C1gvtx2tsVelCKt1ilyOaptWMvpQEJ8hobMTQSXDB8AsA/FEbQvR/Jscs
	l0hd8J+CuFYh0LKdcbXuRELohwwrdSY3RtMP/+h6I+aVYywpfpl3MrkFGQcakpZwgIB+jwEPHo+
	OdNKr0McdJD+RJNc7eTc1zR+TZixJzaf/cp0s6asZ1PidZzd/xKrUuMpDo4NbiBFh2WN8WAAIRh
	Yyfw9+mzmTzndRyy3X80Sccry0+L4KgsHO0rH/QYTeXMG3nqMYjv4sO+EPcmq9PlX852OmDvXXz
	Z1+lfhryFGxeaE2tTSBxesENvjVlws5W2b1koKbLG6eG9B1jxu/oC9K9jzvujyK2hMTdyL6Ik/X
	TNkzAAZXPH1gP6QBEiTfcKT+GfAj4SnhWDPsXCy/zqaFjmkt0TZEcPj2TrtV6JwggyUHCumY0Mj
	Cqlj88FIGWG7U9TmwRf610SI55MmZkCoqyy8VG0KqbYJtv8eECYg
X-Received: by 2002:adf:e186:0:b0:491:8286:5f0e with SMTP id ffacd0b85a97d-499c7ef33b6mr4307560f8f.55.1794412250750;
        Wed, 11 Nov 2026 07:50:50 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983f7801bbsm11742832f8f.5.2026.11.11.07.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:50:50 -0800 (PST)
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
Subject: [PATCH v7 12/17] printk: Separate code for enabling console
Date: Wed, 11 Nov 2026 16:48:11 +0100
Message-ID: <20261111154816.71103-13-pmladek@suse.com>
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

There are several code paths which try to enable a newly registered
console. Move the logic into a separate try_enable_console() function.

It simplifies a bit the long register_console() function definition.

Also followup patches are going to add even more code paths. And it will
be easier to use "return" when it does not make sense to try other
variants.

No behavior change.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 84 ++++++++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 36 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index cc6c2e829b1d..5a2e6f1b9907 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4044,6 +4044,53 @@ static void try_enable_default_console(struct console *newcon)
 		newcon->flags |= CON_CONSDEV;
 }
 
+#define console_first()				\
+	hlist_entry(console_list.first, struct console, node)
+
+static int try_enable_console(struct console *newcon)
+{
+	int err;
+
+	/*
+	 * See if we want to enable this console driver by default.
+	 *
+	 * Nope when a console is preferred by the command line, device
+	 * tree, or SPCR.
+	 *
+	 * The first real console with tty binding (driver) wins. More
+	 * consoles might get enabled before the right one is found.
+	 *
+	 * Note that a console with tty binding will have CON_CONSDEV
+	 * flag set and will be first in the list.
+	 */
+	if (preferred_dev_console < 0) {
+		if (hlist_empty(&console_list) || !console_first()->device ||
+		    console_first()->flags & CON_BOOT) {
+			try_enable_default_console(newcon);
+		}
+	}
+
+	/* See if this console matches one we selected on the command line */
+	err = try_enable_preferred_console(newcon, true);
+	if (err != -ENOENT)
+		return err;
+
+	/* If not, try to match against the platform default(s) */
+	err = try_enable_preferred_console(newcon, false);
+	if (err != -ENOENT)
+		return err;
+
+	/*
+	 * Some consoles, such as pstore and netconsole, can be enabled even
+	 * without matching. Accept them at this stage when they had a chance
+	 * to match() and call setup().
+	 */
+	if (newcon->flags & CON_ENABLED)
+		err = 0;
+
+	return err;
+}
+
 /* Return the starting sequence number for a newly registered console. */
 static u64 get_init_console_seq(struct console *newcon, bool bootcon_registered)
 {
@@ -4118,9 +4165,6 @@ static u64 get_init_console_seq(struct console *newcon, bool bootcon_registered)
 	return init_seq;
 }
 
-#define console_first()				\
-	hlist_entry(console_list.first, struct console, node)
-
 static int unregister_console_locked(struct console *console);
 
 /*
@@ -4182,39 +4226,7 @@ void register_console(struct console *newcon)
 			goto unlock;
 	}
 
-	/*
-	 * See if we want to enable this console driver by default.
-	 *
-	 * Nope when a console is preferred by the command line, device
-	 * tree, or SPCR.
-	 *
-	 * The first real console with tty binding (driver) wins. More
-	 * consoles might get enabled before the right one is found.
-	 *
-	 * Note that a console with tty binding will have CON_CONSDEV
-	 * flag set and will be first in the list.
-	 */
-	if (preferred_dev_console < 0) {
-		if (hlist_empty(&console_list) || !console_first()->device ||
-		    console_first()->flags & CON_BOOT) {
-			try_enable_default_console(newcon);
-		}
-	}
-
-	/* See if this console matches one we selected on the command line */
-	err = try_enable_preferred_console(newcon, true);
-
-	/* If not, try to match against the platform default(s) */
-	if (err == -ENOENT)
-		err = try_enable_preferred_console(newcon, false);
-
-	/*
-	 * Some consoles, such as pstore and netconsole, can be enabled even
-	 * without matching. Accept them at this stage when they had a chance
-	 * to match() and call setup().
-	 */
-	if (err == -ENOENT && (newcon->flags & CON_ENABLED))
-		err = 0;
+	err = try_enable_console(newcon);
 
 	/* printk() messages are not printed to the Braille console. */
 	if (err || newcon->flags & CON_BRL) {
-- 
2.56.0


Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79D23CF1E5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683700; cv=none; b=p+xNb4mXosTr4l6r1mMANvznHc+ES97tD52Eg/3+IyA9zViLSaPCXgK5CqOrfpUvBD64o9qDrPH94iy8PcTXPMFIsX6rZdpWAujnefoT9t49JoVgD0U/qJA49xgnUIYWrcl81uwSzjHBmYuaUVT3kXlfo04eCGCyMPHlLI8uOWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683700; c=relaxed/simple;
	bh=HpftS4zKTysF4BcPEvl0++1hAbk/ySM2v1XhUZ2RPLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqXbOdt3y7MbU6aN8PdmHcXeq72p3v1iWw7nBzpdQIi2GfYPb5listE2lUKL4U9TlHV7g9XI3MWGv+yTtaOS2qvHsFeG8DA9aO3dMVqyttL7S4ElLOzxnfzboiPEv2uW04APszC8Wfkucka2aoJssHCHGjJhEfftUitGy1M7cQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KEIO4T15; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KEIO4T15"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso24863935e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683697; x=1791288497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+drELn+VkIbvcmiwxR7tQNRVZiBSRWqDuFL1+iIl6WE=;
        b=KEIO4T15x2ucFV6OYilA0MKsJkRNcjNbQM/E3bRiHFykzBYWxLjf9H8PARXVdxrPpv
         7+IZ+/KiiLp176ecozzpZOsKYtpIUd1m4TGHcxXv8cpc0vbD7PiLMkGd9EpefdOu3rvO
         ugTJLu9ir9/SyWOioLFQVTN3xkU4Ny0WQXHkfnC3id1iKxAAkVzd//4UnJrKw4NvFJh9
         mVMFJamH1cmLYbxhZ9CGngeLmUVjOt228Ivh0OVpFE+eg5YzaNLiV9azvqiMNs2AOycT
         7PoI+60mH/9Pxv7n6bW7TZIRdQgXs7kydgU24j5OvqsiEmZDldLToQ/tkNSRG0cm3Bws
         rn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683697; x=1791288497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+drELn+VkIbvcmiwxR7tQNRVZiBSRWqDuFL1+iIl6WE=;
        b=hWMvPc14A0f4ApqpRqYzccQNkTS16zZ0GBunKKqT6ROI95bUFNtC2oQ5uiuJDUMNfc
         BgVe3U9Upp1FRpwiNgThej75gHJHA3w+G/Ml/fcoQ56VKtxBYqqYqFLdeEXLyvfL1dhL
         EQOxpaSsvULAZCedE8f/7zIoL3xbCkl9K4ibKtgpUIeNb5iTwpVoYLWKGSxYN6Zphkzk
         OjldhNmyxc8/13oMUCHF9ob6r+xUB3vhPjnAq84V8bGniF3/ZqA9wdNiIX+mRCEeoCSQ
         T/rAJ1Pf9KxFU4FIVopYddRhvwgOS/X+Ll/5VC5iYrg2YckTa+QeqApXyhPsbsp7fd6d
         m4Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxlxLPUlVZud6FayFCV8lRL2upAA5+yQ1G+Mh5MKtGBlWEykmWcN/av99Dqty0z0Hx3Vi3agBXqpXw08gY=@vger.kernel.org
X-Gm-Message-State: AFuF++kxC435FwwRpXz7BoljldTJUa1xWTUQP592xztlvdeqN4HmhUG9
	S52OFYAMddOaz4/pwOUY79EWzmDhbUdzDY8muIx3dbPkxpcJWkHrYTED32uakDrYYvE=
X-Gm-Gg: AYBFou0o5SUGwHthzSK2Ubv0iKpj9Ap18UTJwA4uYKQAWWNES1XgsbkIIJFApy25aAC
	JMK3zSgqh9GXRmA6/7zYugh14v0QJAtOKn/gLIOc81vfrUq8h6W3X/i0CADWYup1krB1bsXa81t
	E8ihN/gUYQdglbVrrEnO3qkx65NnTHeYkHVd6yLHBli02VRRXfAYKgm+w7M1l9d8epFdvnE8pA8
	jLlbtWXaVyBE1FFSlBr1OQtIEyvcjEFcu5/y604w9moOgB8l7qFVG6tQs45hPpz1VbK/8KShwg/
	q+EcopQ6DTa7+Mvk1V0mrFPe60P8sRgHVbmrKGT88vSxUZxyHKZAF+YNbGiTLQvYUN5Bbpp2jZ1
	TJq30MfAgMUSUSzEu9z/NjKNjTbH2Js8JjESZOeZkhqBoK7WG4fcnzOnAd9XiUXK+6q+1bniqbQ
	jqz5NPGTJCl6qOC1bAJ9dkfwzvD61PFjiR8jRyCxy3mpfTqOtEEJz01tqHH+/Vd8o13lS/Sc08s
	S1BpCtH
X-Received: by 2002:a05:600c:310b:b0:49f:bd3c:bc18 with SMTP id 5b1f17b1804b1-49fe66f4c72mr279465695e9.19.1790683696794;
        Tue, 29 Sep 2026 05:08:16 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf8f93csm79350045e9.5.2026.09.29.05.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:08:16 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 12/16] printk: Separate code for enabling console
Date: Tue, 29 Sep 2026 14:05:42 +0200
Message-ID: <20260929120546.328616-13-pmladek@suse.com>
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

There are several code paths which try to enable a newly registered
console. Move the logic into a separate try_enable_console() function.

It simplifies a bit the long register_console() function definition.

Also followup patches are going to add even more code paths. And it will
be easier to use "return" when it does not make sense to try other
variants.

No behavior change.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 84 ++++++++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 36 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index f2a602a05614..8a51c4b690b7 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4026,6 +4026,53 @@ static void try_enable_default_console(struct console *newcon)
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
@@ -4100,9 +4147,6 @@ static u64 get_init_console_seq(struct console *newcon, bool bootcon_registered)
 	return init_seq;
 }
 
-#define console_first()				\
-	hlist_entry(console_list.first, struct console, node)
-
 static int unregister_console_locked(struct console *console);
 
 /*
@@ -4164,39 +4208,7 @@ void register_console(struct console *newcon)
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
2.55.0


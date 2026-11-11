Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412146;
	b=Nj8nyIU7JHWxWgN6sYPjCLhLMlDq0/by8hfTJ7x7DyOV9WF83gOq+veGTZGL681Mnnsn
	 1FpcodcEmhNRmCk8AXQRYt+rL+lpkYnUgiqnn7UUwV05G8Q+UemFXv6fHzknvjvqNsygF
	 yXfOqhq+euguhO3u8obHYAVS53juHeyd+i/EiuBp5TEfmguX2xdJsoQDjbWTHHqhRZzja
	 LiBakk7RZIeoT7dD1cCcM24kLlOekN59nIneZAqoQdvrJbnnt0R9137xdSZ9pXm3/CfEn
	 t/3bA2KX3bztu2ZOBfvi0NmDIjekLyldXW+q9Oyo6KqAQrHhHAp7ApyMSYu5M/bstNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kKhciZOkgxjlFHYeRZEOqDiSFFSjwjv3a9/X/Qk+1VM=;
	b=ablikYOCcSnPTjopG+IioU7SiwcXMViEuNA8iZWxS+r6v1OxhiDmKDlW7hFxEZur2fRz
	 XkVDimrHSv1cgSXM1LWmwLH+3kCpmo0pCD1pYWyIeKjqudvyt0tQpSD0rNSdj2WR4eXZ1
	 HPHvyG9ywAD3AIcz09Ws0Bz6pGm2EMTL0UlKDXhNZwDyghfKzHtBxBzBB45G0Korxur2e
	 Q//rqdM0Ez+JCJ0o7BwKEfBg8pbTW3Bx+2xdJ62w8TVulolwVtj+wa8a8rtusnjWEAMNt
	 8ywrsAW+10Kf57DEvMGIsL8V4fid/+8wI88G+42xwJlAsWDXpWZEfG9+6SIsuaLpiPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dqYRo2sM;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29B3606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B29B3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dqYRo2sM
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so23227965e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412144; x=1795016944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKhciZOkgxjlFHYeRZEOqDiSFFSjwjv3a9/X/Qk+1VM=;
        b=dqYRo2sMzKST81ExkFxvcsUyK8NmenkFi4my5Wj+CPvNknUJH5xOgD/XhWyYzEg0pB
         F/t2PDwUXtpFnM8BpwrHvsKCBGLl3AOq4h7e2clDyovIL4TF6142xOX7C9U4XZgvIbwg
         dyjsPqyrYIOjEDtUmc7H8311sAW5rkEZTFyBlNS2JGHWh4+7Rw7Doc+dfzd3DleLncVF
         dCMTwFkmSnMpqEtv2sSUCHsiWJ1QEUD/ZJ0Df8ErNNBN7n6SiaButnPtlFPPoGEcOxwn
         4lKPQiBQZjlsyDkDV+p+Ob0LVOH1iS5SB90TDA3WJGew4WPZxjVU3sNyUsT6GxVSOE4u
         sLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412144; x=1795016944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kKhciZOkgxjlFHYeRZEOqDiSFFSjwjv3a9/X/Qk+1VM=;
        b=sjBQo7qdPMw3GP0y/iwfy6xfOjGbbJUA96OmDJ0SLtAJp3ddSAuKXBrz53vWGsxdfE
         VaFgRK3QKtq3+iVFdWLFOvyXsm2Bw0NzTYCoK/nQyeOFJgK+gLMNWPuw+T+/uLO20pUI
         2f5wylxqBIu404NOetpKe1ORi1OYYbJgW7BaU/+AtCijw13A8VqbkyCgTh0tIPF47Ued
         bUIQuxhd5dPh66CcOZ0omC+YMO5VAfcUW82OmPOf1dh6vRZgpjWhtYRW19OBAVawg/At
         Z3ukeWyW9HvzrjGXcXtOp6psN8OzYI1l6CN/EkUp8A/liU9IXTHZHNT4GmRSTFl2XaSb
         /wxw==
X-Forwarded-Encrypted: i=1; AL+hErFYe1NXm3I+kT7d/66ztzK1IOvUeIhNhshM9wH1MgzBerWFYjq6qYmSksh95xhxUEOsjEHWirxlylE7Hlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8llClV7IQ3RmoPjc7e/VQyGpBzb+liQyXzo2PdFQp2FZ6pKghf
	lxlTnRkhbNXV3b4mu9Nyg7YGEMhr7IXI7tlRd0cA4AdLOHVBUBT+zF3UKMFtE299QoA=
X-Gm-Gg: AYBFou0D62OBgSo+WF8/BoN3ncVjB+K2k2OvcAs5vR78p3K4FnSvG1Rr35YqWgnmaw2
	9xqe47w//O99V9HY0xwLqu3F0aETy5E4XCW2wDa1xtfXGRZEFGle81prl6FY7pzdumTp7QVWV1O
	nX+qY4XxoRQI0zC5SnlsIbFhvLz8xsCbnq0bDRgKeE87aqekPMLfdCv/j8gWIOgmvWb8VXZSBNm
	Lz0ITZzOEip0xnJr5SzijB3f/GGRt9Io68kiNaExo5xOoV4763JYnPOQw9uwvICjCUv7GTeuSUq
	4zjdTA8Cl7t/esQ2Y6X79faM7NyjUCvPov4ATlicfgulAbftYpD2PU0DRGvnckEcvs5ZOM682ed
	2NOvfC4OyYXe//2f+q5c6Aq5GvA9BEXEx/Qi4buY4z4RUyyCx5Fe4c54uE1/AiPgHmrHokEODKl
	PAOl/5jtFcNnktpTDB6oR4a/0wfMmtYvYlkALE1isqX23id8VNsBnoeXyXvtF8VVQuvynkl6892
	SS74oLfqcJ9mKzOJuFJFbNnXP7PXPoFP28WGRgh944TshYEA9J9GaiJo/DSmHA00xrvB0F0oeU8
	BysZaOlHY5uUTU8TZ4gL80BaX/8Anbo=
X-Received: by 2002:a05:600c:8707:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4ba091aa248mr53695105e9.0.1794412144016;
        Wed, 11 Nov 2026 07:49:04 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c4a3d30sm5695565e9.0.2026.11.11.07.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:03 -0800 (PST)
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
Subject: [PATCH v7 03/17] printk: Cleanup _braille_(un)register_console() wrappers
Date: Wed, 11 Nov 2026 16:48:02 +0100
Message-ID: <20261111154816.71103-4-pmladek@suse.com>
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

The _braille_(un)register_console() wrappers currently attempt to hide
implementation details like the CON_BRL flag and pc->brl_options. This
forces callers to handle an unconventional tri-state return value (0 for
NOP, >0 for success, <0 for error), which makes the control flow harder
to follow and non-standard.

Refactor the wrappers to use standard kernel return codes (0 for success,
-ERRCODE on failure). Move the responsibility of checking brl_options
to the caller to make the logic more explicit.

Additionally, move the assignment of the CON_BRL flag from the internal
wrapper to braille_register_console(). This aligns it with how
CON_ENABLED is handled. To maintain symmetry and fix a potential bug
where flags might persist after removal, explicitly clear both
CON_ENABLED and CON_BRL in braille_unregister_console().

No behavior change.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
Reviewed-by: Marcos Paulo de Souza <mpdesouza@suse.com>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/accessibility/braille/braille_console.c |  7 ++++---
 kernel/printk/braille.c                         | 16 +++-------------
 kernel/printk/braille.h                         | 12 ++++++++++++
 kernel/printk/printk.c                          | 13 +++++--------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/accessibility/braille/braille_console.c b/drivers/accessibility/braille/braille_console.c
index 5a3e375f4800..1b79b4d88bac 100644
--- a/drivers/accessibility/braille/braille_console.c
+++ b/drivers/accessibility/braille/braille_console.c
@@ -413,12 +413,12 @@ int braille_register_console(struct console *console, int index,
 		if (ret != 0)
 			return ret;
 	}
-	console->flags |= CON_ENABLED;
+	console->flags |= CON_ENABLED | CON_BRL;
 	console->index = index;
 	braille_co = console;
 	register_keyboard_notifier(&keyboard_notifier_block);
 	register_vt_notifier(&vt_notifier_block);
-	return 1;
+	return 0;
 }
 
 int braille_unregister_console(struct console *console)
@@ -428,5 +428,6 @@ int braille_unregister_console(struct console *console)
 	unregister_keyboard_notifier(&keyboard_notifier_block);
 	unregister_vt_notifier(&vt_notifier_block);
 	braille_co = NULL;
-	return 1;
+	console->flags &= ~(CON_ENABLED | CON_BRL);
+	return 0;
 }
diff --git a/kernel/printk/braille.c b/kernel/printk/braille.c
index 9d21a2bb1d38..593f83eb0487 100644
--- a/kernel/printk/braille.c
+++ b/kernel/printk/braille.c
@@ -37,22 +37,12 @@ int _braille_console_setup(char **str, char **brl_options)
 int
 _braille_register_console(struct console *console, struct preferred_console *pc)
 {
-	int rtn = 0;
-
-	if (pc->brl_options) {
-		console->flags |= CON_BRL;
-		rtn = braille_register_console(console, pc->index, pc->options,
-					       pc->brl_options);
-	}
-
-	return rtn;
+	return braille_register_console(console, pc->index, pc->options,
+					pc->brl_options);
 }
 
 int
 _braille_unregister_console(struct console *console)
 {
-	if (console->flags & CON_BRL)
-		return braille_unregister_console(console);
-
-	return 0;
+	return braille_unregister_console(console);
 }
diff --git a/kernel/printk/braille.h b/kernel/printk/braille.h
index 55cd3178a17a..e9790c28027d 100644
--- a/kernel/printk/braille.h
+++ b/kernel/printk/braille.h
@@ -10,6 +10,12 @@ braille_set_options(struct preferred_console *pc, char *brl_options)
 	pc->brl_options = brl_options;
 }
 
+static inline bool
+is_braille_console_preferred(struct preferred_console *pc)
+{
+	return (!!pc->brl_options);
+}
+
 /*
  * Setup console according to braille options.
  * Return -EINVAL on syntax error, 0 on success (or no braille option was
@@ -33,6 +39,12 @@ braille_set_options(struct preferred_console *pc, char *brl_options)
 {
 }
 
+static inline bool
+is_braille_console_preferred(struct preferred_console *pc)
+{
+	return false;
+}
+
 static inline int
 _braille_console_setup(char **str, char **brl_options)
 {
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 435c1b7148f1..a46c9bd184de 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3927,8 +3927,8 @@ static int try_enable_preferred_console(struct console *newcon,
 			if (newcon->index < 0)
 				newcon->index = pc->index;
 
-			if (_braille_register_console(newcon, pc))
-				return 0;
+			if (is_braille_console_preferred(pc))
+				return _braille_register_console(newcon, pc);
 
 			err = console_call_setup(newcon, pc->options);
 			if (err)
@@ -4240,17 +4240,14 @@ static int unregister_console_locked(struct console *console)
 	bool found_boot_con = false;
 	unsigned long flags;
 	struct console *c;
-	int res;
+	int res = 0;
 
 	lockdep_assert_console_list_lock_held();
 
 	con_printk(KERN_INFO, console, "disabled\n");
 
-	res = _braille_unregister_console(console);
-	if (res < 0)
-		return res;
-	if (res > 0)
-		return 0;
+	if (console->flags & CON_BRL)
+		return _braille_unregister_console(console);
 
 	if (!console_is_registered_locked(console))
 		res = -ENODEV;
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985658;
	b=Bfb9n6qoR6dH/d6KkVl5QyHaw7rqEq5EB/QVphZiWW5+UGAI0ESl/tzmmK6nYp5MGyYU
	 QUPRWFlt5HVQLdpBLt21k5f24LlE28F+Rzi/s8MBf3qOE+dA+nb++la3JrvXOHiWS7HLr
	 nqXO7fIUVhcQSmCsnmfkUPEgx1E2iDlj6IZ6L6lSXBARM+vrDaqxunD/UDWnrJvjIOJCT
	 gazB9QqOoY+uvSIwsQ99T6RPWoPuZl3XSXyaJR1LtXnu5TZEECoVFYeobDWUcpYPL36cD
	 8ZLVTPrlMoGcj9MbCSBcepmWQA325PHBHSn+z/KtMXsm3rtuxd7FFhhU0Bh6JkbXd0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kKhciZOkgxjlFHYeRZEOqDiSFFSjwjv3a9/X/Qk+1VM=;
	b=zkJ2GsezvJXnUx7H4xsqbkOSY0uq3qakYxemS+qY5kDUCBgXTosSRRGmp2/JOSbTKlJt
	 s7Cw19JFwDzTdZkfMovK89QxldR2h3LsZcJWKImI8e0sdwUYs5tp6a1GPYvGJcTLDoK0M
	 KLE9EIEFOMMT47Yw+e92g1Q5oYtfQ3aXOjCsZi2R35vAPFAKOeY6ApoNH7Iyka8Ojotx3
	 umy0hcAOm0dRNQuehUJn+2kpeSiyHF6uJUX356gEuC32ggz0+FK8cVQbEz/UHRJfky00e
	 SWqNuoR3Q5AprfyKpD2m5IlE2TOkx9ybqqbph9AoGRbaUYjFFS8K3xeqMLup14yeZyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CaaRBND7;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93757606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93757606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CaaRBND7
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4922dbcee23so518963f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985656; x=1794590456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKhciZOkgxjlFHYeRZEOqDiSFFSjwjv3a9/X/Qk+1VM=;
        b=CaaRBND7G817hdo3dlt87xUu/o6+gAavGXty98CF8i4WfQpBYhfdXX177ohqFTFIGx
         fstznkpcs9Ea63qJPaArvpCqCTybmLTvDIeZxWEyrQ/ky56N+xNTQQA53Ua0KQLzNCqV
         lplD+7mndR3PnVg2NLJO0Z0MwqWzsMRY8Jegcp0KYuuj5vNM9TgvSog5FhIeSoh2I43E
         G8SAaxcaY3ehwIutsq3fel2yAaumF/iE8VSGP0MJxi4bGbjTVgPuTMcHG0AUW9ce9V1q
         2raXgeuoVgK3IdpPooqVpCRYsXPNGJ/fJxWly19k1fJoZ5FdW76v0fbK4pF/ybnutO4r
         1zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985656; x=1794590456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kKhciZOkgxjlFHYeRZEOqDiSFFSjwjv3a9/X/Qk+1VM=;
        b=rcFfOUyX0okRtm9JutzYy/mTsQLafg67bnaFBgbHxls4dG1PwIiNRwY9IyNbyUsErH
         dbrmekxtkLR96yYD2BBM+JyWVDNMm5k0JTt+YMitjmscJlOT2kq0wF8HdtueBOIXqRCf
         knUzLrf3JWbn7XG3E6bt51RyOOyAKmC/w61wtkmjXXT7RsNmKGK/rMWDoGM/sr13fiZg
         bEDrlWbXNC2E/fbziDQlAAFn4kn7iTlr2q/RNOENy5aiAjHY4usD/kaCIrHkSboG8r+g
         hcTyvh7G1hidJdbbtj3AUQ6CKG80pqsHQrB7KeOOVj19TO7sjKRU0wz1SWEVsRwvjJBT
         8jmA==
X-Forwarded-Encrypted: i=1; AL+hErHFJ4Nr6X70plNno+64b4amIrsv0MQhFK6gD+7s7dgrO/ByW+5xuQ7Own49t6sAYIwqMwBN6qYOD6f6bz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dnYw7nqNzOnSo6p/4KwJrep9+T1p5zxH/LKANaQeAl6k23Xw4
	yqbKWiXZZ6Ybb8IK0rV6P8WMuWOwxCL7r3Lhei26/rGdAIksQzRHJWrs6hqkpT6dTB8=
X-Gm-Gg: AYBFou0UkWaI2UvT0TiSbrkSI9oYtP1MUXT1k+LSAAt6Ribe/IewyA8Mt6JzEM7HUPb
	fG9jCLvvzomvLJod6QWbNcmhfJwt5+u2n/6/jPVf/g2MDqS0yYE3MDWLxl7atjnWb+VVWwnUbbu
	0f5dpzeUQoC6elfgOw8HR2sIilDDbG8yVqGn6BSj+sIH7gBD5B1HyAH+Kn+ZmkRKWjfw1umPQlH
	CVSESTGSYqf0JfObfjTG5KdxDgH3/zxIMTcKltMST3iTbNAWbbEYXxAsGy4PDRauWkPtbWhQ8wM
	OVHl7/RAkdkc8LiyU4zXfNEvHYtVDphP+84ygkhuHz/ix1e8vu0ifCeSytxQlOVWqZLACX2Ovjo
	SW3FVoqm70QR7L+YvOlr9YvnxT09Py5mTm17L4qjmy0fzeJxyigmAUNROIrvPdeIZKgYnmG0GZB
	nFk/BnRyA6irblokkaKrvGrTqEzcCKWLw88xLxaBG1nxwBcDM4CWRqsN0l6cYxRu9GcUAinWqek
	c8gZCnrWS34ZTmC9Qd4vsfMXQw90Z6h/AFpjvP+xW9LzKcbDZO+4fpS+0DVTlySnCi/uyHHPWUM
	OayeZ9KGj4ZgN+myYwIy/rJN8A/ecMg=
X-Received: by 2002:a05:6000:454f:b0:48d:f4ea:49c9 with SMTP id ffacd0b85a97d-4927835f07bmr4270427f8f.54.1793985655910;
        Fri, 06 Nov 2026 09:20:55 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7700224sm4957206f8f.33.2026.11.06.09.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:20:55 -0800 (PST)
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
Subject: [PATCH v6 03/16] printk: Cleanup _braille_(un)register_console() wrappers
Date: Fri,  6 Nov 2026 18:19:39 +0100
Message-ID: <20261106171952.207909-4-pmladek@suse.com>
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


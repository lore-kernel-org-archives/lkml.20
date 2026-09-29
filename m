Received: from mail-wr2-f23.google.com (mail-wr2-f23.google.com [74.125.225.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3395158B3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683592; cv=none; b=OXL6bdHt4+LJ9WMV3/Ofk+gY4XCfN/+V7nSXKpR1pynHGuAyjXFE9qEG4cc5WssGoPIHDH4pyMmmbqLQnMa49f0ksx2dzrHzsFJW8PwL+Mt29Cp/dmRRCcFjsQwjXCcDIHZb9h9vz8Fk10vdv806rDcwQb6by7KA+Nf2lJL4Fcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683592; c=relaxed/simple;
	bh=olfO3uJ+j/l0lGGRXamntXYk8GAmaHHZwTsmQEuUc40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFWfqeSigcEcrk3A1SavKPdKBs2Tda1b0EKkWwU09WP5Fx5GxaG4T5DyYPhPIcBy0wT7efx2b83lxqhEReKDHGu1ZhI0ffnZiYxQtDmOmk4QNl/wPtuR8ZIvTJzhfOAV77ohThVntegLBEoUG+F3lEGH63KlREAAb9gDKzvKwRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gCJa+mmB; arc=none smtp.client-ip=74.125.225.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gCJa+mmB"
Received: by mail-wr2-f23.google.com with SMTP id ffacd0b85a97d-4888598e4f9so2677066f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683589; x=1791288389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FeoUoO9yDMc3eQmsF/gLZWD+zCpPnqqmz4X7M7CeD0g=;
        b=gCJa+mmB4a/sqWsgWbhal6TExzm/kcWg8NuReC3lNoCFbE6SdlS4xe+/8cw/wRTXim
         Ee9T11Xea/Y219qcSqXA89o/8t7DJIeLYwKONaWksAU2Gorbm3qPsiAMjOOq1EzBv4Ha
         hHJ7xnLJfViyLLmf4gNl2ePtcOIaO8YiJ6e5wS7YbZk4awANcEg1IVnZn9ajL0Rn3vGE
         uZcOx8onXhZu2SPmdePAGa51Kqv477NJkdyoJthW+x+QYChkVNOreOVyOtgZDjKFmSer
         6n7bvlMBCLvKItwfDQLCfukNGAeSD/4+2p2e1vh4coYDLNxZYEuyJytlIuFy9Qba1jJd
         paNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683589; x=1791288389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FeoUoO9yDMc3eQmsF/gLZWD+zCpPnqqmz4X7M7CeD0g=;
        b=fZ6mK5KJaOSCXhwdfc24WKeCqbafSuDLYD847gTQzGT4oO2iKkw7/N7CrbFrQKd7hp
         gn3euJajns6wr0FxPfC6gMIhaNv+GsWZV4aPRibATfK/8ThC8ets3s0WzySCKMzCJaXJ
         i4LVzjoQE9zbuqLyhPV8Y7XtVnU9mwV5ZkjVEcgQwGuZs6J0jAl8PQS5ZsvsJe5CLabD
         TP9W1dueYlFpSfsHu/ELIJupLVpO+porCwAHNNLKaTpq9BLkWL1G/FYNco9py6ZKfOEz
         wEwMpMod9D+yCp+OdRGRlpd8U0Uz5pe3hQW4zQwitfwvyduGSutZMkhLGvBf2Yr904tp
         Xt5Q==
X-Forwarded-Encrypted: i=1; AKwUvByaDagUDmIJqLAwwfgwgUMqCeAzaNhmDDgcgSErYLjdmLMivEcBr7h3oG5WkOqlDETbwuuzdSmq5QY92sM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsrSZS1/eXc5qhWiYMi2oGxEYloeiI4wOTYUOGPU8sFmGkxBiw
	liTObLA1Lqca0jCpdNf9NsU2lQrgxcT+Faa2u68oEk/XFdzzhj0GXikUHNTdV9W6/NI=
X-Gm-Gg: AYBFou3fZLjTBX+97E13g4Fklb4KC+B99Ppx9Ku6jgg1375GaiIK8fYcpuSPCm+9P6c
	Lbuc5Ncnnsxofk8u/yP1XwBK49aZKfrGl/N4eSkYhmI+S7bVQMgVxVXhm9qGLihUHPrYWo82Sik
	/+Yh4FZqc/JPBMb6EicVcigQHRvD69AolNqPNdXoIp4GaHOIoGcBTwWrB3Pzh+ztldUVQQeAqv3
	nZ5ykLeXl15WngLU3JO6AgcVD5aMBifLcjZeUXonhdNRDvuFvj9BNUgovr43+JynCOgW9yd5XqO
	chz/gndtyy5myWDbyVEyFC28X7tPnz3sqFhndAvIc7PDkZi0PcxrZw7WMKl5XxQbZz7L8BPbEWg
	QWO43+dL/PH/PcpdyS1UWgaUxeMKHhIe8e7HTE9zc+mm670rGgHg4E3EALwa3DIs6LFTufVYK43
	qD8RPgPNKtaERVwm4/cpPtnvVX1m8yxpeR4iot1Fw8okJXNQ03s5rHpW1EX7m0e3lZu/RYJkGac
	8hiHXA=
X-Received: by 2002:adf:e192:0:b0:48a:efee:db70 with SMTP id ffacd0b85a97d-48aefeedc00mr4670316f8f.7.1790683588981;
        Tue, 29 Sep 2026 05:06:28 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502f491sm3341477f8f.12.2026.09.29.05.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:06:28 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 03/16] printk: Cleanup _braille_(un)register_console() wrappers
Date: Tue, 29 Sep 2026 14:05:33 +0200
Message-ID: <20260929120546.328616-4-pmladek@suse.com>
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
index 4205c894df17..7e6011f9d823 100644
--- a/drivers/accessibility/braille/braille_console.c
+++ b/drivers/accessibility/braille/braille_console.c
@@ -394,12 +394,12 @@ int braille_register_console(struct console *console, int index,
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
@@ -409,5 +409,6 @@ int braille_unregister_console(struct console *console)
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
index 8166828a9801..c3e50f19a32b 100644
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
2.55.0


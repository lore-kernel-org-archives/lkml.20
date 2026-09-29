Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219E5519923
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683688; cv=none; b=m0SJNd3Sc0YB/nR5Rb9X+/gUCLNUQ16gy3NvOCneRUThc94eevSpZb4sCMG+U+QImocE6Cfmi/ylr0tfGoSl/8W/CQWX8S+B7fOXwsRgbxLvQ07NaEgtCKy5hAmict5Onk5MLAI/CyGGFH20ptUxc6vki+IFOr2+x8hiVFk5cHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683688; c=relaxed/simple;
	bh=W8S+hj2k3hcA2xzax4yXuJd+15t1KpbIfEzr7P3UcUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dCt3QwyKyOPgknbjg9lI5KSNZdq0l97+mJT+q8X5xYe0unuoJ4GB5nx/qgG49LGrrpMl+rVJZ4KQI5QSsCl8HwK4o+KPyOvGq0G1ovQ5QhPRBm4oSBrd26F6IZNcODS7xeTNqTjAkMyelaT3vLtvcx/QfAeptOxyo9JzW7B1Yjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eHGczd8U; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eHGczd8U"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso38785285e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683685; x=1791288485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyxZzFkzrAEl5LVxI1X0vM4npNLmwrlKD8xz7x6rVuE=;
        b=eHGczd8UiOc9p/vdFLLpSLp3WKwtpWW7DJV2cMg+/24ka8An/ZYMSqe2gLhL4/TJjW
         ZdVvp4EDebeAQA3F3Fgfb0EQ5gXbEDQmqZiKEWelaBR2Ys9aEpknq+5KZvaJx1afhpeJ
         lNqMx4SqmfTKAq/QK19wnEo33w3PC+WUK9P0TvKZ0R3FzawIW6OsPkkU2cH3FksOoBl0
         CS9EW3olfsNb7tiEJuFIQlI+P18vX9Dvdb6bEQkhYgN4WdaP0IS0OxOOYP2h90VDVe8N
         7nwOot4xwU6zWLxfZyrOi1yWTXZ5i2S2GefWho8Qr9fCPqiyABJcbz9nVkyd3q0hGGCv
         v1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683685; x=1791288485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyxZzFkzrAEl5LVxI1X0vM4npNLmwrlKD8xz7x6rVuE=;
        b=i/pvMM6HjGFNyGqAMEWuvg5StY+Mmm0bEzYSYYvy6q8zalMFXYe6hUqPfaT7szfUTt
         p2f0eziKfc/t2WbAa3I5vbQwQEdT+Z0jQpdaiKlEvcTUtYFXVuNsXnTNPfl9R+niPu6i
         i492mD0kTYsTOrTXxcz1B47BR+kI+WK3+7TzeDMxid/OKeF4R6kOWmc5KqK+Svd8ikc/
         VGgV+rfLsZcK54qoZNM/dNlqjuhX4t2fw4B6Y8rY6YGn+Do5aM2WMjD+wuXdxoim2QPi
         vzKRq0jsSBojAEhaxCS63idf8YH/sjeE/v/d2PJbc3HaPQbXXufj6IPiAQ6QN+/6FjEE
         toSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCeoqt2dMWtemBeqg5XPFxLT0gzooFUBVeyTu6YPexjBu9QhIcDrBKTuSL6poGiLT/Em08jKK4Rt1z2tI=@vger.kernel.org
X-Gm-Message-State: AFuF++mIxHPvrrbkG0vjQ7ca9g+cigOIEMKUp91egl6t2MJpxJMuNJO6
	JREg3cGpQuw5vNujjO9ahqtv77qB9E86nmdmge6u9SqVMvRSG4A/9FSJG4CVZXeDqa0=
X-Gm-Gg: AYBFou3zdc6tyH0Ko45ewJAoS0c2FOGc28YOwJzzJT3ZHGOvEKYp/47Ew8jkHWj1sDq
	a45JeAsVidmQqpIzjmfdyFjEdqHaN69F1/agW0KtgU1fNbAmo3i0aQ4xLPwY23nj6uQfYD4Zl8z
	FO86OcxvKK7n3OfrbuocrbDA0qeyZQf42N1vfKUAAUClr0gN3M8Sc9JTHufmlGcEzTbkiBqdcfW
	UShM8N7OfmduhFP1NFycC+bNzzGnV/iFRcUvdFbHa1RySncvWwOeeoZxdhuqC6ra/rPBvRCl5kp
	GHfZtxYVPjnfXl+ArtxRzulf9J588JBIQcP83AP6XRs82vOeFuZfbBHT62/oImT+edO/r1rBXz2
	g0we4Li3daK8S95GYB63/uoE0YuCIZmhGzuSVaSHcq1qf3JkysMCZaPZnptKAHfxrTo21ozjatp
	yZ4HeYkab4p/27Lwh/B6U8KeyZWFtlXOvHah+ilXbNVkCTpazL6QBv/eeHOeEXgH2zfEyBqrU6+
	oBnAv97GS9LQVb0Ww==
X-Received: by 2002:a05:600c:6216:b0:49f:fbad:29be with SMTP id 5b1f17b1804b1-49ffbad2ce8mr165396115e9.34.1790683685145;
        Tue, 29 Sep 2026 05:08:05 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9dfdbsm107923365e9.1.2026.09.29.05.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:08:04 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 11/16] console/braille: Lock console->setup() call during the registration
Date: Tue, 29 Sep 2026 14:05:41 +0200
Message-ID: <20260929120546.328616-12-pmladek@suse.com>
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

In braille_register_console(), the console->setup() callback must be
called while holding the console_lock. This prevents a race condition
with a possible active boot console that might be using the same hardware
registers.

See also the commit 801410b26a0e ("serial: Lock console when calling into
driver before registration").

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260423130015.85175-1-pmladek%40suse.com
Suggested-by: John Ogness <john.ogness@linutronix.de>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 drivers/accessibility/braille/braille_console.c | 10 +++++-----
 include/linux/console.h                         |  1 +
 kernel/printk/printk.c                          |  2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/accessibility/braille/braille_console.c b/drivers/accessibility/braille/braille_console.c
index 7e6011f9d823..200ca305c6af 100644
--- a/drivers/accessibility/braille/braille_console.c
+++ b/drivers/accessibility/braille/braille_console.c
@@ -389,11 +389,11 @@ int braille_register_console(struct console *console, int index,
 		console_options = "57600o8";
 	if (braille_co)
 		return -ENODEV;
-	if (console->setup) {
-		ret = console->setup(console, console_options);
-		if (ret != 0)
-			return ret;
-	}
+
+	ret = console_call_setup(console, console_options);
+	if (ret != 0)
+		return ret;
+
 	console->flags |= CON_ENABLED | CON_BRL;
 	console->index = index;
 	braille_co = console;
diff --git a/include/linux/console.h b/include/linux/console.h
index d780f6de303a..11d6b854ee63 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -699,6 +699,7 @@ enum con_flush_mode {
 };
 
 extern int add_preferred_console(const char *name, const short idx, char *options);
+extern int console_call_setup(struct console *newcon, char *options);
 extern void console_force_preferred_locked(struct console *con);
 extern void register_console(struct console *);
 extern int unregister_console(struct console *);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 683083405230..f2a602a05614 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3948,7 +3948,7 @@ static int __init keep_bootcon_setup(char *str)
 
 early_param("keep_bootcon", keep_bootcon_setup);
 
-static int console_call_setup(struct console *newcon, char *options)
+int console_call_setup(struct console *newcon, char *options)
 {
 	int err;
 
-- 
2.55.0


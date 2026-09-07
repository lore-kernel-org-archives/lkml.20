Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6016E3AA1BD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762427; cv=none; b=pumm8DR2mK95J8WkI/nMFghCNYa6xdC9lOVG4XuJ5vDaYqPaWh0OefnQzA8AN8lJ4/182LT61LxUZLdwAbk92VhRgj/sxds78r5o4Zf2Zo7bfPJsBr5rc8VFgQJyz6a0r7+zfYHWsp1N2tWI1p6cODEy8txBqQ3By1nOTlEGrVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762427; c=relaxed/simple;
	bh=rZ8iRBSZE6xpKvhJ0ZOhQ94EMB7ydccG7ry6lP67m40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EHQt0e9E2ikq3JXdjEzPN26cw6JhP2AyURXjgVZniD6e6tx646nZnZzAGU8Ni16KLZhi945B7tWPALZvxSz2bLOUj+emyxaSVICLr1CxeIGjOgUTa5VqhBrcucuh5KzO3rLJhv5NSeWeuQhLowyj0Png4fSqrx/liRgNwmXs1dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrSgwwQ4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrSgwwQ4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d5cad1a6baso26946145ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762424; x=1789367224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OcF57hu0+g/ff9yOn0KrB5lQwjHMKCpuTDcWS1ABzmY=;
        b=nrSgwwQ4mP+GDp/Ie1Umg0MgTJOWzUZbn1CzHIT/7zk11giFBiSXHhIAfGb5cPRtYs
         UtfXY7ZOHkFuOWEqnK0g1/i1njA4h0GikT58SCJu6rPyd1xP4kLX9TSDiPpFHhOMek4c
         biJOQev9dP7EPtqWacpajMhlYMDyET1wEg4L1tSHemROFGd3jvCtVftk3eJzUFgnzmoF
         kEO4IJ5HTKQ5MO2kS8RfofjUfo+3r/F/RuZeXVH81D7Nwmd0nSCHoav4OblUVEwsglAk
         zh2xkeUBjk3qWSJ3s0e6+HykZ1m1GfKGB5GQMdIPdS0hkQEXixTfJOChnHwazPzABkPg
         CJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762424; x=1789367224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcF57hu0+g/ff9yOn0KrB5lQwjHMKCpuTDcWS1ABzmY=;
        b=A0yLfvQ3UnGHEjxh/p1V9u8MWMi0w4/YmwOa6RJI/885h/GWjZcjAhEXELMC0V+KCY
         /336F7A8Tpj1kt2Tq+7GYvljn4SCJGbrh+p4u2qYRk4KuoNlpupFnXm2045kj8/g5IFA
         eyhmS7wk57hCCtVFvV9rGedzSvpyXVAJS8A5zTRInnDHhbY61q2UdZwoE/n35tcGfhig
         vwYYfiSwhtKA5F1kmlZxquZ4X8ZKr04lzSQrQi+0UZjkPoGFPlmkHwmppURojf7rgoO1
         +rrYi9pna/5Od3kfYT51ONSeK3NlxTsgBghLFMJsidltDv8hJckLaJ1piRvRMcw0Yojp
         prJw==
X-Forwarded-Encrypted: i=1; AKwUvBwGrWZn6whmF3NpcHqv/5pzY5nllrU3teq7j2AMJGkOdCCKKd+OgEtpg/vRt3rPgMYXpZyptPmpYbEHkN0=@vger.kernel.org
X-Gm-Message-State: AFuF++lNtxgpRKiGkRB4LObBO8RcCyAp3hcrNdZvjv33ZfJDkFcGaa19
	wI/CSVPsXI/VkkbcOPtmuoQPGdTgvujNY5UHC8Lu7OHYQW7y38sVdO67AD4xWZ6vBMk=
X-Gm-Gg: AYBFou2XPc7QGtP6CcszwWBQpYe0lUaFEcUiiVpCwWds3eQ1CgFXbe6bGS1OynAiMDh
	fMyonGs1gfDfv5wby5hZ5HeItCzv669DxZz79fmgantNRjgw2pvRKaWP/xNI+kfBf2bVDcrpvMP
	s2ZeSb/56YdVmfAPNrRPidwk2rK/9kRR06mY+wUaLpncWT7TEcrMptQZGkDsJE0SfvLIaV11zp4
	gFsKPEaG3kkvfqqKV7Bc7WHkshi0qdVE7Ejic22DLPJJyba1nM5wyDIPq7s+XrTzdzukF/i0Krv
	Y0qS/r+SvLvBJbUxx6RatcF5FP6SExMKi1D1A8ALGxNE8Ftz46FrVVPvXROotkDgWtUNH0kV3kA
	zv6r6UMv16oVZhfSTc7ercNJq55ILMNHwpICtbZhl4SePV+PEuSiOZJ49+QHgKSyxbe8KPlLpQP
	o0gGwCTPJlAZZFQdHPD7dItXgkiBQ+Uow+xdd0BFB+TC4FNiHx1kKqAV7bUu47mWgs2fDBMg5Gt
	opKLniD15q9Nw==
X-Received: by 2002:a17:903:1b4c:b0:2d8:d4d3:da4d with SMTP id d9443c01a7336-2db1262325fmr342823045ad.17.1788762424119;
        Sun, 06 Sep 2026 23:27:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm20404392eec.4.2026.09.06.23.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:27:03 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pwm: fix typos in comments
Date: Mon,  7 Sep 2026 11:56:58 +0530
Message-ID: <20260907062659.15500-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/pwm/pwm-brcmstb.c | 2 +-
 drivers/pwm/pwm-pca9685.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-brcmstb.c b/drivers/pwm/pwm-brcmstb.c
index 790ef7ffbbe5..78378787e4e9 100644
--- a/drivers/pwm/pwm-brcmstb.c
+++ b/drivers/pwm/pwm-brcmstb.c
@@ -101,7 +101,7 @@ static int brcmstb_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	u32 value;
 
 	/*
-	 * If asking for a duty_ns equal to period_ns, we need to substract
+	 * If asking for a duty_ns equal to period_ns, we need to subtract
 	 * the period value by 1 to make it shorter than the "on" time and
 	 * produce a flat 100% duty cycle signal, and max out the "on" time
 	 */
diff --git a/drivers/pwm/pwm-pca9685.c b/drivers/pwm/pwm-pca9685.c
index a2792b803643..3374ed76f8d3 100644
--- a/drivers/pwm/pwm-pca9685.c
+++ b/drivers/pwm/pwm-pca9685.c
@@ -54,7 +54,7 @@
 /*
  * The time value of one counter tick. Note that NSEC_PER_SEC is an integer
  * multiple of PCA9685_OSC_CLOCK_HZ, so there is no rounding involved and we're
- * not loosing precision due to the early division.
+ * not losing precision due to the early division.
  */
 #define PCA9685_QUANTUM_NS(_prescale)	((NSEC_PER_SEC / PCA9685_OSC_CLOCK_HZ) * (_prescale + 1))
 
-- 
2.48.1


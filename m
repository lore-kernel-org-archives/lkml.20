Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6615275BC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111850; cv=none; b=hhq4LtQparQ9/hd8Hh9zdwgtt21RMoQC34rDH4rmVeGAnpZepwTmbTXNzSAPv0NuQ4n56RpxR7OsT47llLmF3dKWID5oLiytczE1hgdsGe9sAfjYXwWonpDB1JbWeRmXZzlxeR1KqpwSRrSmFhkiXjYBOZc0z2rvqWObIGclkgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111850; c=relaxed/simple;
	bh=eqQky4L6vFtBRd5JuCtAYhYItfEVb6bBoMxiAflUToY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cTpul2bo22CjYRNfAwIlMLSMB5S9qJauE8vbGKHqMA0Kp0w0pW4/gIBs6yreebz/ZpjIFvh64tn8w3fydBXF4I6qp6SiJSeB4KAFlNMRKBS6xaS4uBNdBgyGb2atjEwrL0tOSN5wK29KFvoSDtq8ZDpj9WMLCkFaw0/ckNEfjHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PB5/g00o; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PB5/g00o"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so181321a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790111834; x=1790716634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iBiLSQPmd8h7HPBJ0oHvFXtAParwes62y7xIdG7uRP8=;
        b=PB5/g00ovBKpheSksDTf+D2zSdyEaCb4ZGl9D1+0QJg9j+57VCJjtNEgOaqWu6lIK3
         GDKuoIlHz2KN6DusGQAT48Ucit3RphTDZuUiTgeB8Ulrs/LJejq0V9jB0ewtd+TH3bRf
         UKm0B8GWMAhx0ks0+0C9za5+VRy0YMTiwOfI9rI5RyZSVs5fuc7lBJS6M6/oFI9OghBc
         Ecf2rV8wDbL6OPU4txjp2B7JOvjMZaK08ZhArUl8QiV9LQKR9V+uVWXZSPTJ1ML0hKnl
         iAYkD2hcIuO7ZA6Y5SaMF2EumFbrX4Gwjhgd67GGEhD4w9TkBVqLr3UgBGsWwvEn/5Ne
         pXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111834; x=1790716634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBiLSQPmd8h7HPBJ0oHvFXtAParwes62y7xIdG7uRP8=;
        b=EBnW4A/j4INx5dHpqevHYo9qrKX0/WkMfG+ynsmh+/FUGLxPrrq9HKFwXc15XcbuWv
         E7eJpJ6fy5HES7RsqQlIjEl6a6I1w/vxNjFLPVv9mnobEHmtQzI9O2JTfpSIUgMwJeQH
         Gzs6g07NJFjPztKQoS6t9b3IE+XK3m3Tt/P/8lIJJ/zZhQXyP8pUI5NsrLXfFR5IRTZJ
         pPSLVMGwaHMPW0pQKm5zqX/XU7YlNIApgO6x+4E4f1T7eKrvwcSk3mVCgtP5aiJZyt92
         qFNA+RZrKGv9Lbvf19xhC8bNHnNsd/l0YYY1vOHQinIuywyXhdgR3yHLjIwR0/eEbMhb
         Hpyw==
X-Forwarded-Encrypted: i=1; AKwUvBxBZZqp3tEpkXvbXfrir/kNOAbQ4vbVs2TWSVbp725Bh1zQHJPwu6SwyBBF+kSvp+uUavBow1ScsmhOQ4U=@vger.kernel.org
X-Gm-Message-State: AFuF++l8iOI/VF9VED+NBOLqO5Bh98cXVUpghLqzU7Wk1rYedMTUS8JX
	+OyllN3WkyeQ/a4X99dQ6VJ52AEa6fg2ce+a1qhcJ59QxCJsOnXDD4vkuimcnpUI7WIdLQ==
X-Gm-Gg: AYBFou02Uk1RvsmTDJ3RhDQCiYAgbk5BlmyEcMsP9kEy1Ue9svsDz/JrTB5VGzZ7OFO
	hk9/LfNTKi8dJlYHNHGT428+MnLb2xLoduMuzg7o1CNGNil1MDTiB6kQuWYPpRBFGPt34MnF3Mn
	w8buKmmbs8lMk7u8wqqhEUBsvTt6CnjvzAExRhMVmhE8T69pbOg/sF56XLG0YwMGQ80Lk3dbI5T
	+q0xxLJtlgoNZTuoSlADlOeFXQC4uKh0Zx2LrLDVgaPsiiFXbovt0dr7d69lS10DxSnHqIKf9zK
	ZO0PAw70pCBjNjBsIh7ZEW5y91HCkgPfgZHUrDXqjxDJBbSjsH0Um3ZXicMYlt8+3attgMobTW4
	uZRN006C3BWyA3+nmpjvfgnLe24GO1C4AIYnE4A+FOfoiknLahXTHnHTjvjfB2IbXV+gv/JXbyF
	twvm+ByasZK/xYZtuCzBXlUz/d52FFR5zssP0296BPw1RKltX2k0OUcptH7Nvkpqw8qD1aWxtYj
	wGwpadLb7Dcrj2hQF4=
X-Received: by 2002:a05:6a00:288b:b0:878:3705:5720 with SMTP id d2e1a72fcca58-87c857f2d1dmr1780277b3a.44.1790111833487;
        Tue, 22 Sep 2026 14:17:13 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1afb8e37sm320280b3a.5.2026.09.22.14.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:17:13 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thorsten Scherer <t.scherer@eckelmann.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>
Subject: [PATCH] gpio: siox: normalize return value of gpio_get
Date: Tue, 22 Sep 2026 21:16:58 +0000
Message-ID: <20260922211702.1480614-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio_siox_get() returns the masked bit from the cached input or output
byte, so for most lines a high level reads back as a value between 2
and 128 instead of 1. The GPIO get callback is expected to return 0 or
1 (or a negative error code).

Since commit 86ef402d805d ("gpiolib: sanitize the return value of
gpio_chip::get()"), gpiolib rejected such values with -EBADE and reads
of a high line failed. Commit ec2cceadfae7 ("gpiolib: normalize the
return value of gc->get() on behalf of buggy drivers") made gpiolib
clamp the value instead, but it now warns on every such read.

Normalize the value returned by gpio_siox_get() to the [0, 1] range.

Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 with CONFIG_GPIO_SIOX=m on next-20260922. Not tested on hardware.

 drivers/gpio/gpio-siox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 958034b9f3f3..d60680ace144 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -148,11 +148,11 @@ static int gpio_siox_get(struct gpio_chip *chip, unsigned int offset)
 	if (offset >= 12) {
 		unsigned int bitpos = 19 - offset;
 
-		ret = ddata->setdata[0] & (1 << bitpos);
+		ret = !!(ddata->setdata[0] & (1 << bitpos));
 	} else {
 		unsigned int bitpos = 11 - offset;
 
-		ret = ddata->getdata[bitpos / 8] & (1 << (bitpos % 8));
+		ret = !!(ddata->getdata[bitpos / 8] & (1 << (bitpos % 8)));
 	}
 
 	mutex_unlock(&ddata->lock);
-- 
2.47.3


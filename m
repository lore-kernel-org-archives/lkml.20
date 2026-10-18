Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D5139CCEC
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792298704; cv=none; b=ewsqf16/lfDi/lCiMDElSUDUiR3jDAAgooktptQwXGRmDNF2ClbRT8eeyJZjSsFa+AM49p8TcJ6mOtgfU0jIvb7+Mru2NPjtnxtj2JIjGUPJpZ+Auumn2+Kle+M/kPBM8rc4a0eDo1BvuMreQWVtkFu8WpWuF81vqGWrJS6+bdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792298704; c=relaxed/simple;
	bh=UVR8uK3gHs0AIhtdg/u31FGNb0f5HUFjn/VPji3argw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kTFJT+GFH8+fcJTYr47xI5naJnskimj3Me4pNLIJJkgkpvfk127EGYhZC9NbQgwotqrvd9DdIc5oZiHnYJyLdsmqUCDMQahYqeTG8xDXZOfHm+JID339dMBF0uXb/YP1qHPBjjmQfcXfpWsvG66vWvNfpJmfK+6nwuf5Pt3Sg/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdH8vs6E; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdH8vs6E"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8b20a899fso4666695ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792298701; x=1792903501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pZwauyHKkH+LFwe5iO/BreDrezGyTye39yS/26K8Y/Q=;
        b=UdH8vs6EamFrvJ0DINCQO3dEurgjwBSPlGigYzPpBMYgUVreXZoVBjjamB1mW/E69d
         EXf7xKoacxaVDHBvvKYqL6e/rgnVxmz4g1N5Dd5YAR/H0SI6nyLLuCAYb48AgSfzFuP1
         ICb9fbyOwV9z1uQLcq92P694xBrYdX3pdafRDXt+WQDUXTD74OTiZP5Xo8Ghz2tqZXM6
         TosXOaIkbW4nHxV/ZXEj+mVFHJVd94izbrCXs1y5JeAo+rIGbze26i6KL3b32pKUoGXq
         Ca7oxEThT3d7uaj8dZrPJMki64PeNJepmze25XwyalDlsOni+rGv+L4YUMI6A9houW+5
         QMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792298701; x=1792903501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZwauyHKkH+LFwe5iO/BreDrezGyTye39yS/26K8Y/Q=;
        b=sjiogHYg+UAqnlMU/OWVH8cdgkdGbJPYy+bC97HJeQZ0DLklwgbL7tJClWwA96oG+S
         orjNA6ZPwdgBivbly/Stqz3zbtuMAX4kZpgU/KbY75Ya8kSBEiRqKvtRQX/A/9AJVdCj
         ARQSmTTNRzJkMcc2BZIXQOUx88nZ2WeVzDtzkfM4RA57k9Te1v7uQR3yCyXb1p3gPaEg
         yHPRcJKnY2Nr6F23KejbPA6NB+q7YroOi4ygDdnjjWqzGlPzo+R5wPC9JMKxjzuodq6d
         twsGI24xQsX3u3Ky54woS7l6NuokZ4Qm6TsrCDF7uBcCeJewr9lB4/pMO+L9kdFMIFWb
         Q2jw==
X-Forwarded-Encrypted: i=1; AKwUvBw26ehUv8jTQUecYuF0l+GM54hAlu/KqGJDsk8DmJJsurxQLUvbQVrYfUDivDkPYrH6wQOZHK0X26HAeFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3z+AMSYYtfnEjWeqU+spQsO2zAx2sC971I1qnyPGDhxmsxuvG
	U6FeLHNv5hTNNurV5yGGzsJSJa9DJZZUhLd5DkBurnMKm1sahi1XiMMS
X-Gm-Gg: AYBFou2Gkr86YdchnhgVvq4QSwdQf6CG+jLaUoPcJ1tMydeVGDv5VQDeT4RQBWimY50
	uCPLePpShJbU71Z638sLSa/UNMPuuPtjVt2KtQlJm508VxHWcptSROgey38dHWEV5bULfMLLp3A
	YtQSBlxbLRnPJpTX+TNXuDFmBiyM7PaOh3JJaSvRTJUx2tSmn2KTVRMLK+iWsVjo9xNz6xKnl+6
	9lhmlAHIiwwtilSSQCTJvI+/VxVcLDDbY2ZdRfMExFSrwTodh3iudEQMpNhr7dBe9r+weYScRGR
	T3JSh3Wac8HgZSQx5g5dLAeccLM0CN/H2UJcpsbL8QixHJDZuq2QHoKt/QjV+dZ4Q+pl1DqwSVQ
	WF0yf1F7fFcA7EeOF3n3m5/p5Yj4K+QLctFuHxHc0NemN1PPqW5MdTL67zmlgSglw9jAO5H5AxA
	tDA8yKbRU7gaiiVqexv7Ifepd9ulwcGMo9a/EIu5NsQxTN6/fO22ju9RoG/DfYEGSj+4gIBd3Lx
	h8MQm8nprvE9prC
X-Received: by 2002:a17:902:fc4f:b0:2e9:401f:f102 with SMTP id d9443c01a7336-2e9a6c07f83mr42956565ad.32.1792298701229;
        Sat, 17 Oct 2026 21:45:01 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5c4b57sm25620405ad.4.2026.10.17.21.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:45:00 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Subject: [PATCH] gpiolib: Free chip resources when allocating the label fails
Date: Sun, 18 Oct 2026 13:44:56 +0900
Message-ID: <20261018044456.1259250-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If desc_set_label() fails after the chip's request callback succeeds,
gpiod_request_commit() clears GPIOD_FLAG_REQUESTED without calling the
free callback. The caller receives an error and has no GPIO to release,
leaving resources acquired by the request callback held.

Call the chip's free callback, if present, before clearing the requested
bit on label allocation failure. Leave request callback errors on the
existing path to avoid freeing a failed request.

Fixes: 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested under ARM64 QEMU with failslab, a test GPIO provider using runtime
PM, and gpio-sim. Label allocation failure leaves a PM reference or a
gpio-sim request bit held before the fix; both are released with the fix.
KUnit and GPIO_V2_GET_LINE_IOCTL tests pass, including repeated failures
and retries. No physical GPIO controller was tested.

 drivers/gpio/gpiolib.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c0394c7d6279..239c0d54843b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2627,10 +2627,13 @@ int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 
 	ret = desc_set_label(desc, label ? : "?");
 	if (ret)
-		goto out_clear_bit;
+		goto out_free_gpio;
 
 	return 0;
 
+out_free_gpio:
+	if (guard.gc->free)
+		guard.gc->free(guard.gc, offset);
 out_clear_bit:
 	clear_bit(GPIOD_FLAG_REQUESTED, &desc->flags);
 	return ret;

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0


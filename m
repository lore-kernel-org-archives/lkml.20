Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C4F201278
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790321035; cv=none; b=KsBlKMXeSbE2VtjJPtT2Lc3rXmJIoe6rC81Mu3pZ/wUMpmfcclqyKaa4uiqgvkobMKTDZiyQ/Ko3I/jVY+xAN4OcVo8vaJ/61sognxPp3SDsh7mXG6u3PL+LdgLsHsSRYqOK0SuYDbAPnCnZ6AxGCE7N99/mAKr6nX9nCfqANio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790321035; c=relaxed/simple;
	bh=IRyzIC8VRC/jjqvZPY07sbaPLOM0r7aLFQkJo7n68u8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Oz0NuAZdE5QPJd87p2jZKxp10dB2cMCC+aBOsyKQU5ONfGL+xWfhPCk/2Zz2PIjKnBaQ9EbpFQN+3wuyQaedPCbopxZTH9JtcvcfMvOcRVaqEbwFr0O78K1wBEyarZdr6fBdixxxtSf23jnJQfpHvrQvm4+3rsPSnQCU19rA61I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knN1U0/X; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knN1U0/X"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04edb5so977341c88.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790321033; x=1790925833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSELEHI//YEAphEyKZ5VJ4gtHaeIaGb6UIVWXzz2yZI=;
        b=knN1U0/XqZLtS091uV9wJCLY4auo02vPT+fL4UUNO8Y9PMfBJcze/keAlS56FhWAW2
         /pKDY9FV6+muJv+e69oMw+AvfH7p88eIztswARitnwTjhvNgFLgSV3dOeqLaOgB4AQvL
         1SkbJqoOhL/El/2kx2JxYtWVb6Y84uUQHV8MRnTkFTi2mohpVm+dnJQ02dM+erY+dy98
         G3G2yDXEJmRSTUyR0g5Ru/9tk6URpLB1Ia2fr0XWodG/8/nwx8pVeoy9t1N/4tqkOe62
         hj7lZkN1xTHIWgU9+rHq7N/EFR84jqIOLqIGciXbfvo1+mqkwHKSyQ2vTdB2ULF9lnYV
         LQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790321033; x=1790925833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSELEHI//YEAphEyKZ5VJ4gtHaeIaGb6UIVWXzz2yZI=;
        b=CSsBv+cl95K9R5v/T3t6pe8FiylSOlwZHszxjoUlkg9cQyf2aqUkcrhv4S618CVMrA
         rnTv8jm/y7e4rt73pMXep2WFJhpy1fyuxqp1UgSwP6RzAAktDnLdl5bcNC0vZw8RXp4d
         NsncdaZKewNElsBoUqCILMj+oybVRkflwvf09fgLdftGaeXcH58KbDzM+TEU3kyg/qMb
         15zouJBsaSM0LUj75p+TrP6gnc2YbRNFT7LDsvNYD/NxU6ZeTCZ+GsiEFCy/sxQFRGQR
         vIiqzcWoGMYzoS+57CChCPzyyRrl4MAr4g2cHhvnbZl5mV9B/fcAO3Qc7O69lkncllDs
         uWDg==
X-Forwarded-Encrypted: i=1; AKwUvBzgCO/4q6E/d3YKod6mqzxcBkrHh2x6BhF+ribN3QeeSs23lXvT0HoF+7gQAsOm/Rf5VawlOq/QefRAdsc=@vger.kernel.org
X-Gm-Message-State: AFuF++l+OIKvjNjnCFmGHfjfp905FHzSBdSxpN2sVaMwKccUykDorpk3
	Q4MQojxNc5qy3C5R+N7q5QJq8Sr0bFBTcHlhiFsJnGBkKRKjOeXqJ6vX
X-Gm-Gg: AYBFou0yhAxEnudgpsO41gtXvD648j2e+eOO3XZRWp3CzzFf18rR/95tpFJRE7RnS9X
	yO3ixcyuwmtTsswBJLDm7izcpUgoAtfyILh0NgQxhxP4cl8BZrlnuy3hvyiolj6kXRz5MuJpZv8
	u+vBRTgF6QgEehs5APdxIUzyuioVnvvJKxhIYDuMU83SS8N8WHFYFsrnUE3bT5Z2IAtirq4SLxg
	+BNBjISjYPrgvntgq3MzFpdehWhjti20f233DvZv7mbo3wKU6qVxk8cz8BtalicpPn7sg3jv4Xz
	Qv1LdY7zIJPH8mPx+N04IY2f8Q7uLzR5IoStE/bwZP/FgyDoKMZ9wzQOn51C5dl5jM8PFnp5A6K
	2zFOdei3PiVBPhql6hXUAV3ZO0IN1BvvSoH0P1PyO0M2df8kXIUQoN1kof1m2R/xiWRTibUBVUA
	eRmm4gSxVhNNinavxHOiMM6eJ0IOaHlYCLArHABAm1nvhjeSr1Gvjx316fkRbGPnhwkgt9iMcaa
	CCSz0iTnZXRn5h4
X-Received: by 2002:a05:701b:4243:20b0:13f:c85d:17bb with SMTP id a92af1059eb24-14503f8500dmr4207164c88.1.1790321032704;
        Fri, 25 Sep 2026 00:23:52 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145aa0cb6b9sm3656437c88.1.2026.09.25.00.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:23:52 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Jacky Huang <ychuang3@nuvoton.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rtc: ma35d1: fix unchecked IRQ error and IRQ-before-rtcdev ordering
Date: Fri, 25 Sep 2026 14:23:45 +0700
Message-Id: <20260925072345.2632042-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

platform_get_irq()'s return goes straight into devm_request_irq()'s
unsigned int param unchecked -- a negative -EPROBE_DEFER becomes a
huge positive number, so probe fails outright instead of deferring.

The IRQ is also requested before rtc->rtcdev is allocated. devm
teardown is LIFO, so unbind or a later probe failure frees rtcdev
before the IRQ, and an alarm firing in that window has
ma35d1_rtc_interrupt() touch freed memory.

Check irq_num for a negative return, and move the IRQ request to
right after devm_rtc_allocate_device() (its irqwork is already
initialized there) and before devm_rtc_register_device(), so unbind
unregisters the device before the IRQ is freed, not after.

Fixes: dc0684adf3b6 ("rtc: Add driver for Nuvoton ma35d1 rtc controller")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260918161925.2639130-1-congnt264@gmail.com
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- Sashiko found 2 issues on v1: dev_err_probe() on the irq_num check
  duplicated platform_get_irq()'s own internal error log, dropped;
  and requesting the IRQ right before devm_rtc_register_device() still
  left a window on unbind where the device is unregistered from
  userspace after the IRQ is already freed. Moved the request earlier,
  right after devm_rtc_allocate_device() (its irqwork is already
  initialized there), so unbind unregisters the device before freeing
  the IRQ, not after.

 drivers/rtc/rtc-ma35d1.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-ma35d1.c b/drivers/rtc/rtc-ma35d1.c
index cfcfc28060f6..ae68e5c89e15 100644
--- a/drivers/rtc/rtc-ma35d1.c
+++ b/drivers/rtc/rtc-ma35d1.c
@@ -236,11 +236,8 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
 	}
 
 	rtc->irq_num = platform_get_irq(pdev, 0);
-
-	ret = devm_request_irq(&pdev->dev, rtc->irq_num, ma35d1_rtc_interrupt,
-			       IRQF_NO_SUSPEND, "ma35d1rtc", rtc);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to request rtc irq\n");
+	if (rtc->irq_num < 0)
+		return rtc->irq_num;
 
 	platform_set_drvdata(pdev, rtc);
 
@@ -254,6 +251,11 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
 	rtc->rtcdev->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rtc->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
 
+	ret = devm_request_irq(&pdev->dev, rtc->irq_num, ma35d1_rtc_interrupt,
+			       IRQF_NO_SUSPEND, "ma35d1rtc", rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request rtc irq\n");
+
 	ret = devm_rtc_register_device(rtc->rtcdev);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to register rtc device\n");
-- 
2.25.1


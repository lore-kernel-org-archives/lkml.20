Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645433D3498
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295091; cv=none; b=Hi2HV8AZi97PlnKmG4fuS6NNqyzjnH+D7rdn46lR+GOo8T4zyWwmRlmXQdVDA8UqmroTtvTPd3cx0KStjOhZZ9iwgCTHoixBkKaHwt69HWcXDeANHuz+loSld3+h6ISCWOUMqrWHB9dN9IvAK3C7cxUJ7+bjrbcbXl5O3wlOElo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295091; c=relaxed/simple;
	bh=hg7raEooga7xKeO4WaQ+tcvC2LaGZVambn4vonEIGFc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FfyloQjpmkFeMNIg10MrGoGHBIQjpkqiLPrKU6u6TvqQBtCdEbbu50583heVcZEF+TIa0MQv4ojlVpmG2EwDyQu5/tmSjeV3TkedhM0S6iAQQOAysCI61RVPrQB36U+9N5zopqtom0hiiUaRtFCipaOGyEpZzbeVdbeFYkxa0iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ocWBWudV; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ocWBWudV"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91791ec1b83so9498176d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792295088; x=1792899888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T5pPwZ/48zpt+uZ5MPec+XhKwRcnWB3U80AGWU6HU3U=;
        b=ocWBWudV2MFoM/2sL5ksJSpXpLLDg3cXs5h5j2FF3sNs3EzPwW5btGrbmdmijUXk/L
         kDFS/gqGgsjN6GEweDJg84RovvZWoAQLIKgSMS7y+CMYn/5XFS4E1ETVEw8/4hm50vz2
         sES1W6Q74E4Qjt93tAbroAwm6MgM8vtH2dpA6fAxLz4Azy8IR21X8wKHhDAJkZ/LIgzY
         FaIIoIPZCbieshM4NcyAe+1eFQbPIePd83PzQZvqP4ZQxaVRFKHVs83IYqS0W6mSfsUi
         uYzuoUt8RsPRc76S9EsS7NikbqGh4ihXGVdPzFsT6SmgUUpcJWXaNcUfLcn9cepC521m
         Iq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295088; x=1792899888;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T5pPwZ/48zpt+uZ5MPec+XhKwRcnWB3U80AGWU6HU3U=;
        b=VfOrz7b/NZgRzL382/zL0ipu8sc6ht/oQ8Afs8MXwLzbhSr8EWFa3awQ+l9o9NuvJH
         N8CH1q897Fwziajh7NddkzmxVe8MOhLBmuHwnMlT4hbmZUB2hMZ+upWxVNViLd0mFUxW
         RIzhlSocL2yhMsmvF9c7IYpXxmUnVl1yQrjSou25/OzCSD55OfmCnJDIVcJr99WoiOjo
         SvRkQPZD1HFeH0QUPvSHdDPPmf+QMav8wppnyab9hbseFw1a+zGcyKpUXrqBMpVkCBnF
         OhdBB3YaN3nxzYQNzGLT6yJQObx+8iw4oTHHV+RhgO91oTDrqcr2wKaecidsPafxgPFF
         u49Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFwCuJa0BdI2ZIcfX1p8Wb6jUQ+6mItMXtPk8W3I2IJ/+Ir0H0b6P5jxXDpxYoWfk6lmBRWUBO/ycN15Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxyExjbnLjY5t49Q2+iTCFjRMsHkWO8BZsPX3ZdrqTOMKEBDO5
	eowfDWDhpXeY46rPfOWhHILt+hHqvU9TLjpZbP6pZVAGtQQG8M28RQofwBBN8g0=
X-Gm-Gg: AYBFou3h564feKQ5LFD8eMPTQ5urOPUaLHWrJlOIR51kFQCluOT+jKyLwDUIiGSQaAH
	5EPRBKtCKVyhyRuTD31ZqDY13+JE5BdVKZlcdGjdrQ/tooRWueVDvC5Dsoy4Z5ZLjvW6AWRV7B/
	n6I3t2ccppJ12I32/1GXPsoAofSUQw8Enm+pNN2Icewp1IKiGqKjZqFGW0kq8BdPadMYXmahaEx
	S82929iN7u8Kmak+W+Wd4affVfGhqCRth9rkeksrANKC7gjlvHJJlrsWrlGON6KvR6PoqmmUnZ6
	RkfJAt4DL/4nl4OVuFfhEW5qDH4AgArVABLtAh5TuSbiuP2998AkF4Zh3pOBURZlIPJh2e/v5q1
	ftvIwAQOWlZtxrCO4iMpa06rYaGtbE/dI+tq2DA2cL7SWpNtzsHi9MKmDizCocuFTBdBNuUUTBl
	L1nGRaCYHWs+3O1I8lRwTQiyCVx+6+ciRxHaBphUSBuTwQeJvykbqPqJngz43EaPKW1tVVoUWQe
	zk7l5NgwXoid2QvTzosxRZTdcLrKQpqzkUi0nk1s9N7f7xiQtEeDz0pxhMvO1lbichyhShzErxe
	HFY15iJ5xPP3GXDij1XDP0OoyBfO
X-Received: by 2002:a05:6214:2f89:b0:912:588d:55e8 with SMTP id 6a1803df08f44-91bdf0aa995mr67665616d6.9.1792295088031;
        Sat, 17 Oct 2026 20:44:48 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bea60e66esm22559866d6.26.2026.10.17.20.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:44:46 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] rtc: mt7622: allocate the RTC before requesting its IRQ
Date: Sat, 17 Oct 2026 23:44:43 -0400
Message-ID: <179229507333.3965554.17726204422948048488.rtc-mt7622-irq-init-order@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The alarm handler passes hw->rtc to rtc_update_irq(). Currently, the
managed IRQ is requested before the RTC is allocated. On detach, devres
unregisters the RTC and drops its allocation reference before freeing the
IRQ. If no other references remain, the RTC can be freed while the alarm
handler is still registered or running.

Allocate the RTC before requesting the IRQ, and initialize the hardware
and RTC operations before installing the handler. Register the RTC last,
once these dependencies are ready. Managed cleanup then unregisters the
RTC, frees the IRQ and waits for running handlers, and finally drops the
RTC allocation reference. The final irqwork cancellation therefore runs
after the IRQ producer has stopped.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: ba5d018135ef ("rtc: mediatek: add driver for RTC on MT7622 SoC")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1. No hardware runtime testing.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

diff --git a/drivers/rtc/rtc-mt7622.c b/drivers/rtc/rtc-mt7622.c
index 9e17dd09d567..c86c8cf3f2d7 100644
--- a/drivers/rtc/rtc-mt7622.c
+++ b/drivers/rtc/rtc-mt7622.c
@@ -324,11 +324,20 @@
 	if (ret)
 		return ret;
 
+	hw->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(hw->rtc)) {
+		ret = PTR_ERR(hw->rtc);
+		goto err;
+	}
+
 	hw->irq = platform_get_irq(pdev, 0);
 	if (hw->irq < 0) {
 		ret = hw->irq;
 		goto err;
 	}
+
+	mtk_rtc_hw_init(hw);
+	hw->rtc->ops = &mtk_rtc_ops;
 
 	ret = devm_request_irq(&pdev->dev, hw->irq, mtk_rtc_alarmirq,
 			       0, dev_name(&pdev->dev), hw);
@@ -337,14 +346,10 @@
 		goto err;
 	}
 
-	mtk_rtc_hw_init(hw);
-
 	device_init_wakeup(&pdev->dev, true);
 
-	hw->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-					   &mtk_rtc_ops, THIS_MODULE);
-	if (IS_ERR(hw->rtc)) {
-		ret = PTR_ERR(hw->rtc);
+	ret = devm_rtc_register_device(hw->rtc);
+	if (ret) {
 		dev_err(&pdev->dev, "Unable to register device\n");
 		goto err;
 	}

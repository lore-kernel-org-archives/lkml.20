Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCCD35DA6E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127079; cv=none; b=ZyTtLfrmnLWNDPNWfEA4/o4oFpIsAEjm0bWvFdGrDdFuR5/Zq7E3DXeq7iBWfn8xHOW1MqFmKLhFQ1pO8WRbQ6hanCGytGiMCzTocfmzT07UZVkCaIUsJp0vbGyYxq7dI3Adid8lPVs5ygoKG7UjN0ho1WIgxhhMTBnvqjELQAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127079; c=relaxed/simple;
	bh=DV7Z5h/u6N7asozehTp/yLD/Cc4vZCfLNPyscWNsTfM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=krEtpOrDwn6r2C9xM1cDYG4MdgcfyGAiDII7+JxYXbleQ7QKBEft95B51As9IFzvMz9oUC/ch+kNAIR+2qlBEMijxSuHWMQkQ/Caloh5gjcqeNI5LVXPVFMmFLAFH05LBZR4YhIa8A95VFrBUI9dLG3C/Nys01u1PYUoP/3aB+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JE7fVZn9; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JE7fVZn9"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so330238f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790127076; x=1790731876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=md9zT2jjgrRTs9v3b0TbZJ3ZYn/KP4ebTskMdmlmnYM=;
        b=JE7fVZn9yoWI2N4ZeCwmGdlne7DiHBl2lNmfgoI9ctPD2llzf/kzORx5lxYNpSfLBx
         AUS7orEHDiV7iB6vfjOf12V/F26uItIPvW7aBJ/eNjPiXFfBXS58uk6NIH4jRvG8uNZM
         KRFEHhA30QptD2Go8jbei9KPfw+sESfd2qTt4wUNehZEVzNHimeRpRj8UigU9ZpN7iRD
         BeGHRiClKGMJ10zUFJiZLVpFWoqt+TKgepfPswGd9uG+d2mVrgiBCdsrUixg9i88zDOJ
         Gp2NLM+IGPkE/mW3ScULe3+rVW1SHYR6xm9HIJhRm0UntjCyxzjwyJp0u9/iujv3N0uo
         mYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790127076; x=1790731876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=md9zT2jjgrRTs9v3b0TbZJ3ZYn/KP4ebTskMdmlmnYM=;
        b=SVz3YA7lgtmlBy4Jl72wE5GctdKNXSOsHimTaSN3fqY2mN9hv15x15oVkcT6WFcR4Y
         zh2WrgXo2Na8LoJ+U8a42RKiecvsJTmMvJMWmaXorMZt1x7bJ3nSpY5iy6Kxepb9i5Gt
         qit/wHnh8HCmbw+rKyN8wL0ARGw9DOc57Y4cGcSMAICiW4z6krWKcgZz1nszsGyM9w5E
         2WESkfLaaBMk3U9TYXi8+BN2rMMf0US7ibwaB7K1lbipZ0WWO7gXmCWematUSYWsDXiv
         zkf7lrE09EHgo4gO+j9tZ8vytncgbgH8pywP5B8QhxCTgjrokiSNFPzxMfjmSHIWyCCd
         dNvg==
X-Forwarded-Encrypted: i=1; AKwUvBwQY5Np/YFMCDbDF/Dbq/3b2ArW639SOJ+Yualv1JG0RIJqcrcM5OGoiQuagDFdDuFvrG57z+A72gYAEbw=@vger.kernel.org
X-Gm-Message-State: AFuF++l7gRfo9On6ohIpL3bHZLcimGBe49jkuEG4qcNiFrCExn0VlDDv
	Z0VkL7mYAA6Ahs164QM9/a/TaNBUZ2KhS6u0vCKMyBM1DyoG9RaJA3Nf
X-Gm-Gg: AYBFou0jAQ0cs2qdjJ2QQkGADrVgmoowJ0E3FC4AF6b4dNotciwcy9aD4ZCOVeArUjs
	iuOLRiwuVBSrDKogaGUe7NviAbxGdTtNM8F/M2q4sposOKRWKfbyq8tnJ761LjAu7fM+fFszQCW
	jSZkf7hkXHSt2B9reL5L6RY31kmTA8iRJf+d2SV5BBrt3PBQTDltN/sJJ3sZtttwXHbMtWRqYbO
	7aSEya+DWcaEB2rOOEgLfoyIoef43yv4CQuireJCbhaEPkP6jFxHKQHq6nJCg7h0555ET6gz1z9
	6vx3n8bhYwAD0yHi80S2DnJPA7ISvAurqIZuM3eeUWEBm6YsA9+4pVezqlgDhEO+uD/rKtNHocE
	GdYeS1PnMbpxCffVhhvWKWlLKmG0bHuKQsefFzX91hwIRlUuLdgAjP5m4jWF0hohHdq3l/y5oyr
	04lgInlrcd4/+lLd28cdndua6mvHehE40oW6Tmrrnwqu35Dc4ou6Fkgeg7UP/kfviwS3Fxvy6z4
	HKaBellbMzTYqzADWLi/PsmEXjBQVpd/C/h53dewFuiXE2gRLvm0tiq2aqiLuSo/HpDyTuKgMM8
	v9PPceioxpEjt9iDxrl6Z1WE2nZ3s3tmiu27TPfNnyH7uMTbZCeKwNRy6Go=
X-Received: by 2002:a5d:64c8:0:b0:487:2589:ce4f with SMTP id ffacd0b85a97d-488670a9a46mr1772611f8f.43.1790127075985;
        Tue, 22 Sep 2026 18:31:15 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-182-160.95.114.pool.telefonica.de. [95.114.182.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a2d5sm2703819f8f.27.2026.09.22.18.31.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 18:31:15 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] spi: atmel-quadspi: balance runtime PM and pclk across system sleep
Date: Wed, 23 Sep 2026 03:29:50 +0200
Message-Id: <20260923012950.15651-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the controllers with a generic clock (SAMA7G5, SAMA7D65, SAM9X7 and
LAN969x), atmel_qspi_suspend() takes a runtime PM reference and returns
without dropping it or suspending the device. It disables the peripheral
clock directly. atmel_qspi_resume() only prepares the peripheral clock
and then reinitializes the controller with that clock still off.

On a SAM9X75 Curiosity board, the tested standby and mem resumes
failed:

  atmel_qspi f0014000.spi: PM: failed to resume: error -110
  spi-nor spi0.0: resume() failed

Reading the flash afterwards returned no data. The runtime usage count
grew by one with each cycle, and the second suspend disabled the
peripheral clock again:

  WARNING: drivers/clk/clk.c:1257 at clk_core_disable+0x6c/0xcc
  qspi_clk already disabled

Use the same runtime PM sequence as the other variants. Suspend disables
the controller and forces a runtime suspend. Resume forces a runtime
resume, which enables the peripheral clock, before it runs the init
callback, and drops the reference afterwards. With this change the
tested resumes succeed on the board in both modes, the controller
returns to runtime suspend, and the flash reads back.

Fixes: 5af42209a4d2 ("spi: atmel-quadspi: Add support for sama7g5 QSPI")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260709112006.390742-1-robert.marko%40sartura.hr?part=3
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
A/B tested on a SAM9X75 Curiosity board, two real suspend cycles each
in standby and mem, woken by the RTC, with a read of the on-board
SST26VF064B after every resume:

                           without patch          with patch
  resume                   error -110             ok
  runtime status / usage   active / 1, then 2     suspended / 0
  second suspend           WARNING, qspi_clk      clean
                           already disabled
  flash read               no data                matches

pm_test=devices gives the same result. QEMU's sam9x75-curiosity model
shows the same runtime PM and clock state. Its OSPI does not depend on
pclk, so there reads succeed in both cases.

Not tested: SAMA7G5, SAMA7D65 and LAN969x.

Unrelated to this patch: with and without it, each tested OSPI flash
read on SAM9X75 printed "BUG: sleeping function called from invalid
context" from at_xdmac_issue_pending().

 drivers/spi/atmel-quadspi.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index ec19fa0180f00..96ed734b56218 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1590,12 +1590,14 @@ static int atmel_qspi_suspend(struct device *dev)
 
 	if (aq->caps->has_gclk) {
 		ret = atmel_qspi_sama7g5_suspend(aq);
-		clk_disable_unprepare(aq->pclk);
-		return ret;
+		if (ret) {
+			pm_runtime_put_autosuspend(dev);
+			return ret;
+		}
+	} else {
+		atmel_qspi_write(QSPI_CR_QSPIDIS, aq, QSPI_CR);
 	}
 
-	atmel_qspi_write(QSPI_CR_QSPIDIS, aq, QSPI_CR);
-
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_force_suspend(dev);
 
@@ -1621,20 +1623,20 @@ static int atmel_qspi_resume(struct device *dev)
 		return ret;
 	}
 
-	if (aq->caps->has_gclk)
-		return aq->caps->init(aq);
-
 	ret = pm_runtime_force_resume(dev);
 	if (ret < 0)
 		return ret;
 
-	atmel_qspi_init(aq);
-
-	atmel_qspi_write(aq->scr, aq, QSPI_SCR);
+	if (aq->caps->has_gclk) {
+		ret = aq->caps->init(aq);
+	} else {
+		atmel_qspi_init(aq);
+		atmel_qspi_write(aq->scr, aq, QSPI_SCR);
+	}
 
 	pm_runtime_put_autosuspend(dev);
 
-	return 0;
+	return ret;
 }
 
 static int atmel_qspi_runtime_suspend(struct device *dev)
-- 
2.53.0


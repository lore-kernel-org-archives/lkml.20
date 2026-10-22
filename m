Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653286;
	b=dXRaHHiAMlHJeoYM9aMiVcispnQ16Vvqe7VRzoIIjr6k+K/8yfSlxmXCr3ZNarsh9r80
	 a4akp0Rj3rU50jPiCRP5NeiPki0C3c/muX8Bko2GAQT4SjPMlpbdnrhuuLGgcwTz75cf4
	 dp/Ni5FKIM7tTFC4Z+RZ/lx4O6OWIoRb/Me+aqelBpMNCtCyv0l28EeVYjQ0WFLCqLFQs
	 norj8ueDE5CPCRkF1TFpNxgjrrP9Wx5EBDYYnpKwAtZ/AXoe1mMYkA/XwSQ7iwYo2Za3t
	 EM1GTM2Myen9bVMOrJ41N5DFQT6j6nARS5HsSod2pjVk1Ji07XIBLivr/W/boHABTfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rbQd37yNdLoEoUUb1uI07DktRFDbgbFgP3dMH/u8vgc=;
	b=Z33/06ekfo7qOVO/9sI1W5fGZI1GP7Re4/CxUQH5elgnQysPyLpKu52b9xgC/HykU5d3
	 s3Vm+FqEXsg8WzpDG40DIae2T3goH/1XpNULPoeVFj4TGuPFXiPbfyw/d8havt31pnr6d
	 2ryO+3eL23+rszeHzWcczTWuF7I4kAevUFIl7WTg6dtM+8zFGiDkhUDr+6MvmyY6+nNDJ
	 LlaATbfFOlNByHQYsCCNBy6bvSz8eGxgmwOsQpTp5UVBkZxon91wj1fCGa6dtQswEOdeA
	 Zcer85J69y/dsQU6297sa7on/gXgwPpyS/UkDP9Gf589Qoci/j9x07NaN/mb11ebiqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BFZUQwc0;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF9A606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFF9A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BFZUQwc0
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1931ff67a29so1329089c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792653285; x=1793258085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbQd37yNdLoEoUUb1uI07DktRFDbgbFgP3dMH/u8vgc=;
        b=BFZUQwc0glnGG0PC89J6I5yzkEC2MR9OBVnxAlTWSNJ8PjQOGdEdTojkyZ000fkN7e
         /dLlw/5WtvHT5jU1Yxb+WnqLDWSfzrof6bbJL5BZmrl46WtCGkJg1OKvHcF6eU990bAV
         QkHS0G/s1TMlcc/SSQtVmAUmBSr7R0IzoGXCX5PvLjuokmEWSK3+cL7NJtu2hTzoBPQw
         GG0wDpoO3cgyMe2DJJPE3vuBX0vjYr5isphipLLx2VirrFABjVhrX9oCuv1HUbrkPgMw
         PJJ41YcltJaXXf0As8L62f7a0Q+dPDQjyiJoOoXy2zqV4PouQ59trMIUpagKBt8KDJSM
         FKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653285; x=1793258085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rbQd37yNdLoEoUUb1uI07DktRFDbgbFgP3dMH/u8vgc=;
        b=2vXN7gCRCQMb8iNlzGEIZ4ATQ4n8ltGlwYxOemwIL4pAMU30d2u6eo8vwBb6R1Bd+7
         5lZlrTtint0w1cJcokV6Bc3PADo4Pu/1/bimXDAHtckiz1khvzx5SQKLN9gwpv0kxNS3
         MR/j+ms1Aoy0Cdo64SaAQCLaxYO0rB8x7riuVsI0xBVFhHPFx4z0BwNKCp7POv4pDBcx
         bYCOQ6+Zbl06fhI3CrzaGwvcYpm8AKQupXmnFgMawqlyC8URSqP0vySzF2rud13Aafet
         u+/X8i2M3Wvhh9FZ8B9TjgoMFM6lLRw9KrCe7PD3vXzeoENuyaKwcCJF46UEUHOojoIk
         HEFg==
X-Forwarded-Encrypted: i=1; AKwUvBxWcQDUhHHW0o86VR5psMoYg8fD8/3evG5VdYkblMsF7p6q3p8L8TqYaSFJf7ptNUDRPmr7QT7+aQFO/1U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVpOR/JXLytBnkgZAAZmTdZm3Id53XMDQ+q/W05MMVps+c63NK
	Ug89+ggkqjr+Vj9hTs/ocfqAEyJmMwsEb+VZ5M2kVIpCmzo+PFVxIOLi
X-Gm-Gg: AYBFou1ONTPys7am86jl2vUnLVvjWPxVXLzqW3ILfDlu6+M3TkKeCxctXFycjS55Eh4
	FmVkVr8NsShQh3zh2NSoHzYJfmC0ecmDzHyMq/0u7BRZTza4yOmk3/jajVWnLbeQ/2nwFYevWlv
	BwfMPs28yp6Ee73YyyID4rbbIRZKp1Fh2Fd/3jGbALVlmNB1Gt1BKzdk1CLiI0j0Q/Nikbea38G
	l/t3bEdyO+D34wDtvU0TlmR9CLV/8ZG6nCf/rlLF7t68SUM3ntMLBnWK/g5LmoiD+G800wVCac2
	aDXuK1g+QYR8uMj3vt9vmBT5VNrpbA8/LmzONb3RMlJxxZ4wuhPKyQjGwvgBUD1j+H1TZIAKIOw
	3pZM7GUQR6/IgUefrm3rp7OTjUQEUJ0WKPq+fVuEE+BT2Uz9Xn4nBonf7FtlG5OQdhiNS3UiZhF
	RqrlMYRZpejjuFJ8kDXTVsPICfhFcprETIVY3zqKX/EtSTOUFZ6BDFrJ1FP7yfTrFMqUtqpg643
	deRxpMZpgRQtzBfhI99s4bV26pFzY+UzA6VbX09mPOjFmaBrD2pjjonPeKVD02oDGj6ztWjats=
X-Received: by 2002:a05:7022:c43:b0:194:3a84:e67a with SMTP id a92af1059eb24-1943a84eaabmr325046c88.41.1792653285121;
        Thu, 22 Oct 2026 00:14:45 -0700 (PDT)
Received: from fedora-x1e ([210.89.35.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm11112321c88.13.2026.10.22.00.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:14:44 -0700 (PDT)
From: Saikiran <bjsaikiran@gmail.com>
To: loic.poulain@oss.qualcomm.com
Cc: rfoss@kernel.org,
	andi.shyti@kernel.org,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	bod@kernel.org,
	mchehab@kernel.org,
	vladimir.zapolskiy@linaro.org,
	jishnu.prakash@oss.qualcomm.com,
	birk.skyum@pm.me,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 2/2] media: ov02c10: Fix sensor power sequencing
Date: Thu, 22 Oct 2026 12:44:18 +0530
Message-ID: <20261022071418.26895-3-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022071418.26895-1-bjsaikiran@gmail.com>
References: <20261022071418.26895-1-bjsaikiran@gmail.com>
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

The OV02C10 driver enables MCLK before the sensor supplies and disables it
after the supplies. This can back-power the sensor through MCLK while its
supplies are off and contributes to camera brownouts on the Lenovo Yoga
Slim 7x.

Follow the power sequence used by the firmware on this platform: enable the
supplies before MCLK and disable MCLK before the supplies. Hold reset for
at least 1 ms before disabling MCLK on power-off, and wait at least 10 ms
after releasing reset on power-on to allow the sensor to start up.

Update the power-on error path to disable the supplies if enabling MCLK
fails.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 221cb93126ec..42aa43ea0a22 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -661,12 +661,13 @@ static int ov02c10_power_off(struct device *dev)
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
 	gpiod_set_value_cansleep(ov02c10->reset, 1);
+	usleep_range(1000, 1100);
+
+	clk_disable_unprepare(ov02c10->img_clk);
 
 	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
 			       ov02c10->supplies);
 
-	clk_disable_unprepare(ov02c10->img_clk);
-
 	return 0;
 }
 
@@ -682,23 +683,24 @@ static int ov02c10_power_on(struct device *dev)
 		usleep_range(5000, 6000);
 	}
 
-	ret = clk_prepare_enable(ov02c10->img_clk);
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
+				    ov02c10->supplies);
 	if (ret < 0) {
-		dev_err(dev, "failed to enable imaging clock: %d", ret);
+		dev_err(dev, "failed to enable regulators: %d", ret);
 		return ret;
 	}
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
-				    ov02c10->supplies);
+	ret = clk_prepare_enable(ov02c10->img_clk);
 	if (ret < 0) {
-		dev_err(dev, "failed to enable regulators: %d", ret);
-		clk_disable_unprepare(ov02c10->img_clk);
+		dev_err(dev, "failed to enable imaging clock: %d", ret);
+		regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
+				       ov02c10->supplies);
 		return ret;
 	}
 
 	if (ov02c10->reset) {
 		gpiod_set_value_cansleep(ov02c10->reset, 0);
-		usleep_range(5000, 5500);
+		usleep_range(10000, 11000);
 	}
 
 	return 0;
-- 
2.56.0


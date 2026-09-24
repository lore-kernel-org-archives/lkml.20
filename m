Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58841416870
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270465; cv=none; b=lARAvs9dmeyoUec/LuiHdWeaJt346r/6KZmUpr+OyVloRIVc7q/KAcQzC2cQetTWhlH3pOz8n+KMCcANBQ7RLFX554c4TkeS2BGAzOCFFvKVZRBvmr/mBXt+DNyBcfdBibOdH/UtSyalw5AVXELQne91YzgVWi47RsJXXdwH55E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270465; c=relaxed/simple;
	bh=y91BgDbV1pmNNW7fcDmBjagCNc/lHkbbK5GTaLYoxSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yod+W090NIX6c+Qdq2jaXMOeHD5GPYMTmaN8m1/INzjL/3d2ZMgwUOANts7XsfqBMmFSGq8vHsWPoLCmaL2gHP4saabVptLbCe5yCsrYQpzYTEi2fful+DA/pCofQp6LP81ZEpPj1zZpaYRPo2OjzccW29tYfSNm609nLOKhDYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khBtcY+Z; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khBtcY+Z"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b76694fb7aso93918e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270460; x=1790875260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtw0JhXm0/tmnOTWbZH0chwtlN4HPg9BNssrfKTCcYo=;
        b=khBtcY+ZHfKDik2xBEKBQ3MWLAWsqXwdm8/NJH6GnsmWgcLBWgV4lot3yW8ni4Rus6
         mvdc7XgO/Q59/JhMDxIlHV7IIE0Zh0wncrGQOSCgkkuMzxnt8lDnvjMuAHVIuJTsdqSn
         716k3gC7tdxKyTwL9X9Qc1AwE2S7iHKyaWOPLG3Hxy9klst+JpJ5ZgYVHHVHue2GnESu
         nRYJ4/k1ry5n6go36X9dUGotcWoWo3gywIz0r8dbgwVsAAdQjMc5H3yEF1tyeJLd4DgP
         kABrsvUPJWdl2nZja44htoYABIr5N9m7MBdxHmR+xYksJRv0sLB6crDsXAeVaIf01+uO
         JbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270460; x=1790875260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtw0JhXm0/tmnOTWbZH0chwtlN4HPg9BNssrfKTCcYo=;
        b=t5Ri8GFqJo8WXKQ6oSlX7IJw/DVC3UwsE3Ky8sa+wYiYZscXhBBLHE4hZV0tiHy6qr
         X9eLQfcuOmymDdEDCpsD2KK/J7M7cPpiSDBcNEI/dtRxUSe/OMb9l7qpNXF+BUJhp2fi
         fuypoi9zJftjyUHUYSIrKMYomYkjNwWUsEy0lYyMMvbe1d3GSmmYhWfJAYtac+AkMFEE
         y3C1pPGGLSiGDcO9gBgNRs7HFKcNOUe5tGjjsgXTZ1cxkxYcwnnKdysC3yF9e0JnCofC
         OrtFBc3myBStb5Gfv+daV1wREalXkt2OHI3vdJqc49mxeWmoQvhop1Npha21MXNbhXlu
         eAYA==
X-Forwarded-Encrypted: i=1; AKwUvBwvMJ8YP+oQR9m8eTsmSAQ6dUywgj0Cl7difujhHfZ45AuxZgC++ruuyb8O2pA4jYm8QyY1OwiAQ1EvPV4=@vger.kernel.org
X-Gm-Message-State: AFuF++mFanoQ4G8P99iOpADygMqNAHvIRE1rINHgxMvDitmAESKi+Gnq
	8tFdSXAyXBmHQbkhW4sNxP081m39Gn/37rELBgESKoan3+reBGedA65Z
X-Gm-Gg: AYBFou2wmO9nvPoH4WAPxgZKQ1o/MRJw4PDSYI456YMjh8sGxSDaDGZe6sbX2SLluAt
	UPQjmgUOVS2F/Jirk4DRpt7nqT5QUdTc2hwMDg1fuMTA4BfYtVdRT0a+eOXYJftWhlKpjrqEIPt
	LxhCjgXCUakK1uMnFYUZQF2ncKOtNtZPHJ7ciyCv7IyANEZXBw0AxBRfYRb7c8+LMkQ6ckEy/oU
	3n4dhyfMSX2XBi/FzHdyvPACMSwMKSYGL5qGLO3snX3KBx9nFiqiKAGJ8jp8k5kq9gHym+qydtu
	uuAD3tEpGbN+3SM4jTVJDhpcpszMnleeKW707szKtirABDgdO7tAT/4DvNDJ2ja7pnF5AYUj0uT
	R5azataixQet3VY+wJ32d4dgOQioyCdjdVylGTLnD0xijmQMPcvric97Kxl6TMIFysbQGVzJqZd
	m9Lm9leXsNwDDp0Kh+e8awkjuSvIB3zGrngFA+HDtltrzJ1X/WSH1MplnM2MWCQcjslzmPpR1r7
	b8RqUSKDfzTEoE=
X-Received: by 2002:ac2:4a61:0:b0:5b4:a798:2630 with SMTP id 2adb3069b0e04-5b8df0c3aa7mr845664e87.3.1790270460246;
        Thu, 24 Sep 2026 10:21:00 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d859505csm1611065e87.74.2026.09.24.10.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:20:59 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	rillian.grant@gmail.com
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 1/2] leds: flash: lm3643: Return to standby when the last output is switched off
Date: Thu, 24 Sep 2026 20:20:39 +0300
Message-ID: <20260924172040.1185688-2-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924172040.1185688-1-koreev.r@gmail.com>
References: <20260821083620.68324-1-rillian.grant@gmail.com>
 <20260924172040.1185688-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting the torch brightness of an output to 0 only cleared its enable
bit and left the mode bits at torch (or flash), so the chip kept its
boost converter running with no output enabled. Likewise switching the
strobe off returned early when the output's enable bit had already been
cleared, leaving the mode bits at flash. Both were flagged by the
Sashiko review of the RFC, which Lee Jones asked to have addressed.

Clear the mode bits together with the enable bit whenever the sibling
output is not active, so that the chip goes back to standby when its
last output is switched off.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/leds/flash/leds-lm3643.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-lm3643.c
index 48e164261..bbe9358c9 100644
--- a/drivers/leds/flash/leds-lm3643.c
+++ b/drivers/leds/flash/leds-lm3643.c
@@ -271,9 +271,15 @@ static int lm3643_torch_set_brightness(struct led_classdev *led_cdev,
 	    mode != LM3643_MODE_TORCH)
 		return -EBUSY;
 
-	if (brightness == 0)
-		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE,
-				chan->enable_bit, 0);
+	if (brightness == 0) {
+		unsigned int mask = chan->enable_bit;
+
+		/* Last active output: leave torch mode, back to standby */
+		if (!(enable & sibling_bit))
+			mask |= LM3643_MODE_MASK;
+
+		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE, mask, 0);
+	}
 
 	ret = regmap_update_bits(led->regmap, chan->torch_br_reg, LM3643_TORCH_BR_MASK,
 				 LM3643_TORCH_BR_CDEV_TO_CODE(brightness));
@@ -365,11 +371,16 @@ static int lm3643_flash_strobe_set(struct led_classdev_flash *fled_cdev, bool st
 	mode = enable_reg & LM3643_MODE_MASK;
 
 	if (!state) {
-		if (mode != LM3643_MODE_FLASH || !(enable_reg & chan->enable_bit))
+		unsigned int mask = chan->enable_bit;
+
+		if (mode != LM3643_MODE_FLASH)
 			return 0;
 
-		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE,
-			LM3643_MODE_MASK, LM3643_MODE_STANDBY);
+		/* Leave flash mode once no other output is strobing */
+		if (!(enable_reg & sibling_bit))
+			mask |= LM3643_MODE_MASK;
+
+		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE, mask, 0);
 	}
 	if ((enable_reg & sibling_bit) && mode != LM3643_MODE_STANDBY)
 		return -EBUSY;
-- 
2.55.0


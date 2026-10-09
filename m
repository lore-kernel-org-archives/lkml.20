Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366634CDDC9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545089; cv=none; b=sTjd0u7I3c6Lc2EcBQTnnoSqaGT6iAviQaZ6Yck9zb7031NXohtB67/X9mw6iQCuOCrURLJwgTmLM3EOTo+l5FEBHCKbYSqiON6B2LzHxb6KpZNguLwIhYIO1Z1NBa24hIBzZqSWUrdYqi30sjssd4IsMu+pQKOXK6nXutP5Uz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545089; c=relaxed/simple;
	bh=lzV/JOwZceG3YxOPL82K2UBdcZS5W230ZAh1fveVVcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hv7yC5WtE3/kufMt++25N9a76Zhvla9hjvGHwjbdYweQovRX8dEdMjLYwJps3nK6lRYOZvwjHF8R9etEhyjT/dd6W/NC7ofT2a5K0FrQLTtrj3Gbx3hI2/0YHYa4Bl+iEltDTVA8hpDNPWYjrNCy9X1skurGcfYQ7oJ6igIjeh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9aL5ot1; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9aL5ot1"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30b6dad2382so9187929eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545082; x=1792149882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=je2Q3HHMwOmDG5bekFREQfFaKgEfAjyCYUmGYt2rUu0=;
        b=K9aL5ot1AVomxF4MmjhtFiX4L5DWlQr1g/wmvMuOdSzTLg1quU2zmro2CDX4cUIYgu
         YMWhuJ87k7RusHDoCQ+Nh2SKvOWynLBisA00Ec/ZhzirRLemu1UDrmvxaLEqWVz4tpPb
         Z+AvQA6Lf4RGwrlCRBhrxu+gyv5kh8Yv3LZxaoTHA05Llbb9u0i6UHTlhWXcFfGFLK+J
         b8Mly2zCms7m1+8ZYys4w/wqL3VunMM/JJlNho/hk0DXlv/Y438I50QrDBsV1UGl+zxJ
         LDMOxB89VeW4nDNXHAXTCIjgmLMOGf/+DVXC5OCO7XKCAfhcMO/EYCAqGnBmri8jRYfg
         mwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545082; x=1792149882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=je2Q3HHMwOmDG5bekFREQfFaKgEfAjyCYUmGYt2rUu0=;
        b=wg82fe4ilSDx095FrAgKeR3y0fdSC5Mi8Zn2f639QFkp1Pr9OWdN03o7lby1+FV0pP
         tPBm24eT6UKUPwAM52STO4B+6myI5AimP69PSEpgZBMv+EOzplqa2YocEOaqIZokUzjV
         2tZxnJ42MERok1IutsS9g2T1gMhXw3nSq0UceR0Ap/Oc+KYzTaqEYI7P7KVx4xP/0oiN
         KtceZcnGCI8JsNC/AO+nzBaEHW/IbSC/FtBJbwLpQAUBv22POd51jFm7k/uP4YVB4m1t
         ORt4294pX1WXR0f0fwlnfrX4VDqzZZIjlGvaQxXZSAqd28aXpGXBI1buUGpSEKWHwa5a
         vKWg==
X-Forwarded-Encrypted: i=1; AKwUvBxmNCKUXDu3f4yxpfQHEbnbYeWJ3fco0ldG1IrbnK6OTxPTuIU7KgIVFtElscP0OW+M2LIyT+QVFTZRc78=@vger.kernel.org
X-Gm-Message-State: AFuF++nL/8IoxIqMOfzyQt6vnk+2deflkfLBQDJSAkYo61KscT1LcwZZ
	dRLv5ACk1AJB31wl0CNTbhB3bO+nsOitHlIxrOO2Z9xoHDio56w7im+J
X-Gm-Gg: AYBFou0qLMWS+kiTxsNsx7J+nSa89ot9P9fOKf6gCzXXFY2tyGeR+usFfTZ9qiP7Gnt
	cveFtjcJFkqWXfXJ2Y3DXqqj5wzo8ywhjsd3kJ79n6tSdB9Wi2qiyYL+7oZjG8aR0jIzJDY+uQh
	MYcxdXyTsPsWFYJgx2pbyB56icGKSKcBp7PpE4oo9Z6d0zul74tFwuuzNgIrBDeLfP06v9GjlU7
	VX19UqGlYc0jEvErz2YI0yBHeMwhe5Jh5ieLmMYktN0H7b8PL3PtGl+r10vpJJhUxNG/sZbLxs1
	wboPyiOYDctUopPQBFyYPbGU/l2JY0x2XHPEK/I6XaRZpUztmYzxjXexEF6jSNZCW6xGeo/a2fp
	YEo48dQ3ztBwp00MiPd84VuLlrzYajLVt5O9kiZ97SWWcikOn/FjJQ8eKqaY2Gf/64NC62K3qyv
	4FUoALGhbmaVKWo8ft18WSFsHuw0EF3TZKoLI71oMajp8r1I5tx0SwcVUYmoNux4g4c8Ope/rHp
	IZ2y5HQ2L6fbYOKFgE9crDP9WhxR5vL9siCLSFqbJGrr3fYOa9/2GAY3U8xKzwk3kPml5//w40B
	0z3yrO4Lr2bkrA==
X-Received: by 2002:a05:701b:2309:b0:153:7a27:b89 with SMTP id a92af1059eb24-16a5ed4008cmr2359046c88.21.1791545081842;
        Fri, 09 Oct 2026 04:24:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16996eac537sm6304632c88.1.2026.10.09.04.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:24:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sebastian Reichel <sre@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] power: supply: generic-adc-battery: Propagate charged GPIO errors
Date: Fri,  9 Oct 2026 18:24:29 +0700
Message-ID: <20261009112429.33318-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() may return an error pointer such as
-EPROBE_DEFER, but gab_probe() only checks for NULL. The error
pointer is then passed to gpiod_to_irq() and the original error,
including -EPROBE_DEFER, is lost.

Check the return value and propagate errors from the charged GPIO lookup.

Fixes: b0327ffb133f ("power: supply: generic-adc-battery: Use GPIO descriptors")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/power/supply/generic-adc-battery.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/power/supply/generic-adc-battery.c b/drivers/power/supply/generic-adc-battery.c
index 185f55d2fd70..f3ca3ebb2533 100644
--- a/drivers/power/supply/generic-adc-battery.c
+++ b/drivers/power/supply/generic-adc-battery.c
@@ -238,6 +238,9 @@ static int gab_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret, "Failed to register delayed work\n");
 
 	adc_bat->charge_finished = devm_gpiod_get_optional(&pdev->dev, "charged", GPIOD_IN);
+	if (IS_ERR(adc_bat->charge_finished))
+		return dev_err_probe(&pdev->dev, PTR_ERR(adc_bat->charge_finished),
+				     "failed to get charged GPIO\n");
 	if (adc_bat->charge_finished) {
 		int irq;
 
-- 
2.43.0


Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E16C426431
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959611; cv=none; b=XQ9v359G5SkutKv44bUsBs7hOaQJS1SJWDdEj1D4qSCLWJtIGSveVKEiRI4PVxgeB46MQkuQ5IM2fXIqrtjndBXQirHRNjzh6vHHtHkGRJyPa14xL4POpO6XM3b04fkV/fqxH0xTvAmOSSrHAcj5lySAaUyWZlt+tDmxFP3z8GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959611; c=relaxed/simple;
	bh=Adm0s5nDt1pgd1rSxmR99mnhZEVycyLvr7i5Aw20QU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGarJ1OQ7qxpTxhINfI5aGT67sUSzaT/ZF/glrJJkACrjE/dZZlqdkZml+KHd/rrQ5TfOTaxbTAm4ZPliifEbI/LW290KOgR6j2y0O9KVRagNS7bD41qfhTQKCxZOzqSm3DxZum7wOxKUqTvWwYqqDIZG7lOeyUg3jKxKqvwBw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdKt5/ta; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdKt5/ta"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab98332238so2032393a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959599; x=1792564399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e0+SQK7DMGgCc5FMxNNvIgVyMRIaCk2AvbyN6VRUGko=;
        b=YdKt5/taHU6b1ame4i1YsptI0O9CW6V4KH3LKRnN3Mw0z40GoVQVWiCJBRuWMLITPs
         +teXPf8MH5b8Z6XJ2HoTFwHFFUkvNF/tusE9cPwNC1fTE26DQlOI0m2a5HpLpAzteec2
         7bMN5e+Is+iwg7d6ylNLM2DBq5cjBIXgTAEsg0D1DO6zvAaJE9nL6db0CdI/DIdISnGp
         CxOztx/P7pznqhxA3fRD17UKvR8SMJZn4KlwwYlbYhiCNB/dtlOXGk0g5bynrpte5dGT
         lzdO7CM86C4oTj1bUI7CBXM9u3XHZwTmQU8VCvqM8n46yd9TOuGG+mm37AaPZN6C7Mtz
         a4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959599; x=1792564399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e0+SQK7DMGgCc5FMxNNvIgVyMRIaCk2AvbyN6VRUGko=;
        b=a7haOYxZBLXuk2a76h0rfmRrCMSITqfrDCYUqCzJf8KkzxpXWidhcwrTdQkoeP1Ycn
         4O9jqmDAYk83jwZYTfL1+5LUmDUglfoOxPA7Q8KPLGEaSQQ1H1KZQ7g0UsrH/ZCJptfs
         aOWrs/e+n5PDbF6glUuz4tmwAzppplZFRFPxwMCmGeQuNETbDfrWPjP8DLNwtlvCd20D
         quHZsQMY3sHtULNQizEHc2F1HIwhVidnCkc2c5gmw2wlho7k/E5PFdDuMB7/jo2eCRuQ
         y/IDS5UjoiHxsClycf6JGJGSG/hnwvNSDa2mQcJAZG0ORgQpUu/dTzHlDyO8zmaXLRVA
         aD+A==
X-Forwarded-Encrypted: i=1; AKwUvByN7dHoqOtTraA0ymWS0/Q1ki6x4PyTkmlAictF422E18jtgUUUp7gOubNkEwqFYLxJwF1aUCLKEpkc9g0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/grlrCZuByzq1BbJBUvkcAD7SxrlpbqXSwqaJzWQKR0kJ+Wee
	I9RyHUw3fEXj9W4rzJxh6hiXhDEY0j3zGojZnbJEqYir0hH8zUhKQprM
X-Gm-Gg: AYBFou0UAfORmEIOzOjloA2YpLS/IcNC4KG1snfNcDTVHKc9p7/VeybcBVxraZe0HoV
	LTTGi7O5owTGGSZ/0JxbZPCaOm5k0kNWRaoduluvJpP5feVDrw3Ae1XDU1M2R5JiquZgyh1BNoj
	qq/Wknyo8vEGPYMT+XXtGaI6PyYjAK7m0YGno1/CwnXqi1rZlfHgPOMrvCXHqGRSU8dGx2HHh/5
	SKsOhPLsz5xEokN3pelNsYgvjpqQZr4CfLr7xFAiSozcxZdqYh9UL7XfyPV5Q7BrfLYvRNYsG6p
	yCLScxeESPjRoHZ//ZceARKIqY8yz7t3fx+X7HmtJmC3tsCAglVXQUEIPjk/CgRBB32Nhpy0yN/
	e82C0npWvDdoawyzEsgZjtNNYWb9mGSxqd6/WGW7KyLVCv3MQWB5VjrSQEf+G+VvZpMl9dj/nhH
	OLUZmyIRz5J6nRztflQG4aQfnu24w3VstuSKzxBUinzwxjGFR2m1r0FH1sGC1BwtlEo5thOFEmt
	vbHTVuckesqLeQ5ekXQv/VZH6T4JwlFsI/uYej7bkgVWgC64mdzpI6kssPcf9R8Bj7m4uw0gLI=
X-Received: by 2002:a17:90b:5444:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3ab3ad26901mr10669810a91.36.1791959599383;
        Tue, 13 Oct 2026 23:33:19 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:18 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] ASoC: codecs: wm8510: Fix definition of ADC Inversion Switch control
Date: Wed, 14 Oct 2026 15:32:40 +0900
Message-ID: <6ada61df8c8fc97ffb1623e74f6742ca498032fa.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ADC polarity is bit 0 of WM8510_ADC, not bit 0 of WM8510_COMP, which
is the loopback enable. wm8974, which has the same register layout,
already uses WM8974_ADC for this control.

Fixes: 5d421516670e ("[ALSA] ASoC: Add WM8510 driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8510.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8510.c b/sound/soc/codecs/wm8510.c
index 137dcd3d7487..c611eaf0ef5d 100644
--- a/sound/soc/codecs/wm8510.c
+++ b/sound/soc/codecs/wm8510.c
@@ -134,7 +134,7 @@ SOC_SINGLE("Master Playback Volume", WM8510_DACVOL, 0, 127, 0),
 
 SOC_SINGLE("High Pass Filter Switch", WM8510_ADC, 8, 1, 0),
 SOC_SINGLE("High Pass Cut Off", WM8510_ADC, 4, 7, 0),
-SOC_SINGLE("ADC Inversion Switch", WM8510_COMP, 0, 1, 0),
+SOC_SINGLE("ADC Inversion Switch", WM8510_ADC, 0, 1, 0),
 
 SOC_SINGLE("Capture Volume", WM8510_ADCVOL,  0, 127, 0),
 
-- 
2.43.0


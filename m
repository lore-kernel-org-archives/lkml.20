Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86F63CBE89
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376818; cv=none; b=kEzOVko1G9Yhtw84lPb6bNEHxjLN6I16bBDyXHo7K7J8liY/KDRFajHU+tnh1WN6uBgfwWsfVMb/Q5wrIFBKaB0ChpYCX9y2lBoan6rzlvURTJOzNqg6ZhC9WrtFfigivEL3EqJ2PGdPBrDebuUHcueZA5rviY01Na98rIaSk60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376818; c=relaxed/simple;
	bh=gvlnRPbIuQpBNlIetJA1tcoffwd0qPM41kLziATxBNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NeFdiA7zFX2SOMvUNf5eYG+th/zt8v1nmdg3rm4iQerHk27MkCjkYZuM/uFWn50OAgsVJP94/toffoKUN3bh3FMEyeAxC/FqJG/Q+QaZVH+V32K4OUc0FCiKTvp6OIQVSnJNRnrqexnpU2m1N+HbBVY6SNjZk8MGiob4RZJ5g+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTPXz2PY; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTPXz2PY"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e5fb79cefaso6542365ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376807; x=1791981607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJssbI+xGs6ktfsC6Xw3DX5y7Ljs3Vvy25+XSMvy+cY=;
        b=XTPXz2PYjgwqLYr/+KzYv1mgR6TQ93ZOQ85RnJchI3nMOQx5cq/fwUHtAESlF71XpC
         a3xa3vUXerbShiA9FAbBNBLA47tv0zHBqfvwnYMXCEFXNCgParFFax+RUqNx3AjCjVoW
         a/in+Mqzf8rnhDp+F5+FP0kff69nmS8C+JjFAXj8LESgMPc6xbSbl3NxHFzpIKRx/c/S
         Pl+AjSa3nVsP3qpxY4EiXrtTVAgU1bwLS1J0EATgr6XHYJNAx/gnIjAaxPdp7kfV07bf
         dnT/SZlAA+VmrdCp0JLcachYIElvHzfo1Tmzc0wTVF0Cxe2GIDOdbfev4TmWuHZa7mIQ
         qF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376807; x=1791981607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJssbI+xGs6ktfsC6Xw3DX5y7Ljs3Vvy25+XSMvy+cY=;
        b=ZD4Vr9UWkG6fgwwNnViGsTyDocArvfGHN8+ysly9jcKMwP3a3HuQAbacJHrONzLziI
         uwcRqvdM8Fv/8E4bctfhTSyjA+4OW0KxvUKsp4xUtWL0V0odHcFoH3R9dJJVXuIz2+hj
         2nS9mx8HmsjS2tSRKdUYY5mnTQfz5DhHW3BQLOQkLlsanhMfmY2yu1Cx+LQ5SUrvJBXl
         ZWU6ZcQ6jvviIi1wDdABT/v8GCMAmZHLcWvez55ZrqPnivP5BQ/NrjfJXxJW/Ed3KfDZ
         xlYEJSUQLQgsNdXQd9rY5BPFJSRyBUNk4zGw2YraohmclsnRr0fal4M3JDXIe+0+AknN
         R6zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz4rwCUcv4X9LcLkCiZTASSc8XkIOShKlbbrzPzOj5yWvUWn4SkRKeIMdSStBfnICZRY3xHcbqsXmDLOY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV0RF+D3HYP2zdCE2CHw2vnZQ8PoIQIM6EqNzhZiu45QiWlpwI
	7ZAeVFhxBsKyD6FIiqsY9Uk6qnjh2SHiAZUCrTURgz1JncyKv3mOCuse
X-Gm-Gg: AYBFou0EDj+lVNSpAxh3Q2MzEwXEnNeWocFDvb37dpxdfx1CqdKmRWg8LWAG2eUx6ni
	BdnkuIv+/VdFJaKSnwUlf3HWS2/OMe+SF8ZnWYK0w9nlAhp9b+xXNxVJDsKX2+QjzPcKvT3tajO
	fRSsFo0DSYnNzcXytOYyKHwuX+gUrX6uYFHGRPA+q+XtPMmkTgEKAzZ6dhGS0knJr3FHC7JNUTB
	kO2BZOV62t8kFENZ+6wsiQk9wZLs9W3EFzlOMn5fgqITvRdONOZftVmDyuSYoK2VxZbZPjpSjFu
	4eohJa50kWOz+0mqVkWfXau89242qkclCy3p2+AqWJqY6/j52gDt6nKF9YFuyVgo7qfxPpLZxLp
	fyAw+nJZljTNyr7kmhT4+K2DugsOmp31XJoF//g6PScha2RqMMBKyxStAWtCp1AMK+zKf0I7BdT
	b1GkbXRS6ctoFjwsTQUMVovksNMO301hsyoi/mO9fZ2ESg1MoCG7SLW/ij9nSsdxvKTC/iaDpBu
	ywsVnoRH/hcwE4=
X-Received: by 2002:a17:903:248:b0:2e3:cac:3868 with SMTP id d9443c01a7336-2e60050922cmr15218765ad.24.1791376806392;
        Wed, 07 Oct 2026 05:40:06 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fd284sm9675095ad.15.2026.10.07.05.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:40:05 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: andersson@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	jingyi.wang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: kaanapali: add the I2C strong pull-up bit
Date: Wed,  7 Oct 2026 21:40:01 +0900
Message-ID: <20261007124001.1724-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kaanapali TLMM has the I2C pull-up control in bit 13 of the pin
config register, like SM8550, SM8650 and X1E80100, but the driver does
not describe it, so "bias-pull-up = <2200>" cannot select the strong
pull-up.

The downstream kernel sets it on the camera CCI pins (config 0x2007).
On a Lenovo TB323FU tablet, with only the weak pull-up every CCI
transfer on the two sensor buses times out; with bit 13 set the sensors
answer and their chip IDs read correctly.

Fixes: 35ff9c6b318a ("pinctrl: qcom: add the tlmm driver for Kaanapali platforms")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
The board uses it as "bias-pull-up = <2200>" on the CCI pin states; the
Kaanapali CCI nodes in the CAMSS series (v18) use plain bias-pull-up,
which keeps the weak pull-up.

Tested on v7.3-rc4 with a test switch that clears bit 13 when the pin
state is applied, rebinding both CCI controllers each time: with bit 13
cleared the two sensors and the VCM on those buses failed with CCI
timeouts 3 times out of 3, with it set they probed 3 times out of 3.

 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-kaanapali.c b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
index e95ac064b84c..e9351e29d38e 100644
--- a/drivers/pinctrl/qcom/pinctrl-kaanapali.c
+++ b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
@@ -37,6 +37,7 @@
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
+		.i2c_pull_bit = 13,		\
 		.egpio_enable = 12,		\
 		.egpio_present = 11,		\
 		.oe_bit = 9,			\
-- 
2.43.0


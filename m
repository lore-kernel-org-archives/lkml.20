Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B5242DA5A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037167; cv=none; b=lL4sGCDAA/GV7ANEuRKFPrjoGueLqOxFjfALq7QVFpOjTWZ8gQ0+TB5qAQrFLzctmdgJ85gJ7+BgN11d5i2/A1gg157xPBhjqiTo4SbwRMlhbygCgREXqvLOKRbvcuahX+7CFh2G7hpjdkur9M0PwaxR210601fDzEUMszI4jQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037167; c=relaxed/simple;
	bh=6bQ5FDzc9O5c0hTZjbwjMUSaQKlVAenIoEbVopWDjow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LYqR1AvGZ1NjLX6NfAYlSbxq2JbyiDGKEy7/PBlCShIJVLGj5tfPqDmLTUFXx6EgNVgyMRdDtMlY2hLQjC7p+YsR8l3UNh55VWbqDPlpWrxs6PBIZFIphwJfMQIHG+JePsDl9a0R+f8+T8d24VeS/wGPkVSqGu0Acuv2QwhCl0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zhsZdRGZ; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zhsZdRGZ"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-49e0ee9e7afso1528335fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792037164; x=1792641964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cygSHUA7YEh2Fllf4fUKnrZPET1t8vbMRMige3In1Uc=;
        b=zhsZdRGZNOgwfM9WcrTl+wWggmeb/q8oEz+QLLCWV5qirrj06qVrj+cYUOYEggyDao
         wTd+jaSOhswg62DUY22A6V+GlFnLZU2SFqSZ49gkeTPtWRo5UFiWjYsCtMPjuNqziYoM
         MF7KQSFIaSndRgNy+0LRNcG770n3l01jZTcOl1hEFVbsW2+m1xmTiev6gUeHQJ7MHn07
         URDfb3/kh74wHlk9j/rtO1RzntAB5Uk63UQu068JBUYIZazq7EVig0YZLugfs0Yp7EiZ
         pjHTVkTi2fvGyOutcrNvnPJ6Qtzweh/OyJ9hJ+BP7eDORWvlLeLa/2PoNaTNtR40cWSu
         04pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037164; x=1792641964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cygSHUA7YEh2Fllf4fUKnrZPET1t8vbMRMige3In1Uc=;
        b=bI+wHanXRmBbrpOxnzy7THXGo7w46yd91ZZJxJPYHoyKLRzBoKJyrRaCRrqKset/mB
         B3JghJxYy1UTPmkDjLFmscE6Jlng/FRK2UVEBmGh6GJ5cue+YWzkdVa0Cya7vNlhQViC
         d5ckg6W0QZ/C2TKo5KDqe0IJPUeTATeUVtq/2FTOMi3Wg2s7FAfWQGoF9VkyeoQks1bR
         w97D6Ljqwp4eEAUAgKQ9hg1RH+v1sxaaE1twPddUiRF/d/86irl0kUjum+DTpyZsxZbu
         njaPLqWxoiwchM69ysloLTT+D3M008lNVDTkbyWYhfnFKM3iy5ADw3XO2e2uhdQBC8Zb
         xqNg==
X-Forwarded-Encrypted: i=1; AKwUvBys8SghLqsgk/wvcXtX0gKT4Th5ilfWyEifuxjAmp5QUlSxCrKuqHZjaDChWeP/K91VAzE9EBoKK8BxIao=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5zIHDNwNB+Ra/Z9zxv8FSSaJtRGrgxPGXJipZRNjSh/L1W82A
	YqqfFxkwnAZrBThQ/rnl7Fd9lKKmqYgCfhf9+qOV0PxZaVd/0bIeZXfkDirZS/Z/hgi2Wg1zq27
	7+8evXxE=
X-Gm-Gg: AYBFou3w8ByKoMr8uoH9oe3derBR6aLCIR5Do28xCVs4iPgthLmn4sSAIGG3A+IKYdy
	5cer+6Jm12+NwMXf2YOnO2SKXxSe6/RhdxBiz1apYPJwnCS+Y+YY6AXP5gEKAK9U4Jg/Rp/5mc9
	rLeRpbg6oDfhvc+W9wWQ/vUun1n6I+e0tKDlgCEKGs1ucgdo5Uvuffpq3f6Bet7SbKvyP/inlTE
	Rm2SKi1+NdVvUdpPN9A8yma3rx7MpDBMa+Yfem+zj4JLOvO1N6sBDg2logNNrNhHPN7IBIHrkSO
	gJ/WkDYgZa+63Bdboc1isyW+7sQekrX88zgOAyzaRcwr/SxR+9wYa+xd+MeiiWqGuug27zoC7hu
	92gK6OxFvK2l3esFGMGuRpbRr89E+ACpwCmbWWZbdoR/6Sefc92khmjl/RMfUi8v+bOyA92+AJV
	wftvJ4g4Vi6agzdC4NYdhWsizIY0uBqgh9tDA4vYPkcThWcHrR8XVHuzKKQDylF9NtF9oLmKX3v
	7G5hPo=
X-Received: by 2002:a05:6870:7095:b0:49c:8cd1:d293 with SMTP id 586e51a60fabf-4a2a850ae9emr14476118fac.1.1792037164109;
        Wed, 14 Oct 2026 21:06:04 -0700 (PDT)
Received: from localhost ([2605:a601:1514:4f00:264b:feff:fe59:d7f7])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-4a6dfb4e92asm3570643fac.6.2026.10.14.21.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:06:03 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: exynos: Drop deprecated regmap from reboot node
Date: Wed, 14 Oct 2026 23:06:01 -0500
Message-ID: <20261015040601.30049-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'regmap' property was deprecated in "syscon-reboot" compatible and
not needed. Remove it to keep the device tree clean.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 911643008b9f..30ae952083cc 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -236,7 +236,6 @@ poweroff: syscon-poweroff {
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
-				regmap = <&pmu_system_controller>;
 				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
 				mask = <0x2>; /* SWRESET_SYSTEM */
 				value = <0x2>; /* reset value */

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.47.3


Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22CF19DF6A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727200; cv=none; b=BPxM0YJnrPvU2hjpVXeAJqiYlLlD6frBm3n6s4DYvIpamXq+GUZ3nzrAOcMSE91Am45VNMBQJxSmh/IRtv7ur8+c82jJayqyJRXyEKRkesqX4zVMn744DbVNYn+D28bBIkEjLEA5CcIptak7vw84kss7gLmW6thtwuvthstj3/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727200; c=relaxed/simple;
	bh=RakvmJw5IkGbBl14MJEb5sEKCKJHoqcetMUQUhf3ra0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LckyzP3Z6xCQwvenZXRh6qOWPlEMBKHxgFs4vuc/vb4leqOTGuRsDb9jZ0+0GJnw3m/7SQN/Z/DjsTnlwSckMAmmRM1mxyUGpppYPAZ1VGQx8ATTEybk8wznNTy13roklXmDGlXTVdbHLxbr2ZYWuQMOd0ZaoLRk1+JcQUaHckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kap0kCJA; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kap0kCJA"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so26768365e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727195; x=1791331995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awL/I0DSNdektaGl90hrS+nSMvd7q8sCEI8KJnLzrw0=;
        b=kap0kCJAX528IJO+GW6dPvK24rf3SvLfHvjQTdpRLGoqUq1FkQ0sOpgEaYaB00PTMP
         gpB37c4nVU8suJbq/y1pV0NtOiNZjqH6G28/6AmC4xFCjiY1zJSGi6oWBVYW60+NeDfT
         /uMhlYWGNcDoeactWu37gR+pq9A6kFHqBIJD2D7IXMpEC3hwtms64WIECEbYJIi97e5V
         oFo4aMZwHtpaj/cphEJOTEXH9GB6wifbnH0LqnV69rS5vLpL6tCC2ILGWbo4x535HbTe
         gVHx9VOWpenbNXoNqFuC/In+S/HUBdklqeYPLM2LEepNtSOo2wPoah+bkR6YXSWTI6Fo
         MRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727195; x=1791331995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awL/I0DSNdektaGl90hrS+nSMvd7q8sCEI8KJnLzrw0=;
        b=AX+G/9Vd1BoVsb4a30fbFHgXzDdRdVnbzQ5RxWonAHSBLmYV/P36+gJWnCECoerEYD
         B22eL583iriiFLtHp03+aOdUNLL1l3WJ3zwprV2H9MhU2aK3b/jHH18/lJKiqr3U7ApN
         RGN2Ei1Forh9KtptN0UYt0bSIucfulLLEl3KI0yLRnG61HTBLGRKA0cKysowGouP8zTz
         SctfsiXZ/CC4mHQXXIlpmevofjoWXsaUyPSSUICrsSy0c3EazbVIKgU0QaX4ZnJs3Xwg
         c1RclTtEPEphkeXhIhvh08qHnfzBtSzlaHmWlgO9tbH2yLyIGouoKGjFVJxHEdrCDYwf
         9y5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwsWdRuAVFKvYbIlTvD1fmFY/aZUMry3Iuj7JmXQeFusGXRSskX5KFHtpEdoKy4U7HJKLPoIw7vyEapcFg=@vger.kernel.org
X-Gm-Message-State: AFuF++kZGrFFeiRA20YRDRm/h/Rc1Em6b3teWIcCqc11sdMbYwJkfvdW
	yX9tzD8uIdpIT3v95j3UDQ4mSE0R2aEZs/qlcAHjvn15jv34gfP4GzkqcwvvmPHVoXg=
X-Gm-Gg: AYBFou2en15ZrqCbtX9wZ/yxKJgVksl2NaGtAsCsGGztLtjsP9ebTu5mWid8de9VhPP
	cky1Hkb7H0XSKMV55+JR+a6AQFhePL7uw2wDv4SlPc4S3J5hr8lgzXzWGLTEAcSrSJJTBcJ1rZD
	7TqntqvPALS9yD/zMZrv4EII+KfLSQ7idwW/+a/uNpuNZNJO4t6xaed3wiKYRWlEWZhfO1kI6Ze
	0gqfzQirKitc7pCatCWeFqYKG8imnf9mdbr2qbG2j+FuZGzUFP1QB/juVDUCgkSFYoI+++fkPJh
	BKmEkAkhkLeMgqm+/2R73R+lm5rHxmZRgSOjl5Izpg1iuYLhOpk5ncm9NZq/23CjnUNM5uBopCC
	HKZcw6beU0wn1ohkZN5IsWigpDxxiEuJBqY0KT+ZvFwi7SILQcj8/Mxfj6vnuV+CHsxxnVmoJxn
	ZV1eYg/5sl4fu3pJ0BE/RNpir+2tS/iAYND3vTkf1eWikc5rz3EA6HBsl91ltGhWTnNMODebSFb
	2y0PsFNLLIfFMv4DhgymgkgEKTSsJtRqsUGz8MlKjXmpgTY5VWON8gCnQFg0Q==
X-Received: by 2002:a05:600c:4fc5:b0:49f:f997:7ed7 with SMTP id 5b1f17b1804b1-4a01503ca46mr9945865e9.11.1790727195101;
        Tue, 29 Sep 2026 17:13:15 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:14 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:13:00 +0100
Subject: [PATCH v7 5/6] MAINTAINERS: add Exynos850 PMU entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-5-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add Exynos850 PMU entry describing new file
drivers/soc/samsung/exynos850-pmu.c.
Add myself as M there since I contributed Exynos850
PMU support and intend to maintain that.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 137297bf508b..810111c83478 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24622,6 +24622,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
 F:	drivers/clk/samsung/clk-exynos2200.c
 F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
 
+SAMSUNG EXYNOS850 PMU SUPPORT
+M:	Alexey Klimov <alexey.klimov@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	drivers/soc/samsung/exynos850-pmu.c
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.51.0


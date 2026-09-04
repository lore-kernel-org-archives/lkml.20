Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAFF49482C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528767; cv=none; b=jf2mm/3Xq9Vb/Nh8jps+SYnCsu9e08u6z303TyLPafkDLNMVTsENSH/oQb61HvUHOcEjqd77psWMmvKDEcbbLEh0WSj7SW4eK7JWjezg3OkI/eBng0hrRJ75i1LmC5bJawbVRixrtXWBZGACnTrKNJ5kVTd6uNZNY48bfK+XUiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528767; c=relaxed/simple;
	bh=2G1xZrHjM1JHXnoDsstI3b2BjufIFU1p5k/dPACFxeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U5p+goyL1LGAqcVOLqGp0HvIyo9XkXPoXBuVF7HFRmpf/CZKjzfUpMZ9eS+EpzCFUNSi3xgeQ+7pY95H094N0K440uf0xnlAtfBSbDJAU76Wab2kgYUjk1lFB1etV/ixMbOLYHmIpHw7gKNdnFN977keYf8XcYhEtr3LIgjrISQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akbnEXFH; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akbnEXFH"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b4a95ab94fso2270417e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788528762; x=1789133562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0c/Sgi1T4W7/Ogmdz2aUIy6QPzImiY6hgRc7tBhpmno=;
        b=akbnEXFHTukprwLqgaYiGJEqLq0EVpy1dfch/Zok4MWovfhYy/PSgMoom7cBRjn3H3
         JRzpmyHZAWi9X558iELqy36WlfN3V3NhYIWwkT7SKG1gz+UTAZfnv/7M6khiG0OIftKD
         dnaJqa7lN/jIclNdboliT1Cac6bj7rCTRbEdERzCcJXvXErk6xUMdsltkhGz9WTjtGkE
         WiSdIhnGxYr9CY0mHoTLKAQBUBI9yzjlNNtjMFOkkus19bCTg1+IKkdFyS5plB4axQ2i
         7Y+26W0EBk+ga1YrREBBZpWZ+axnJbSQvjcXtLP0TWlIx/PixEu0a43Oo6BEMkQGByN2
         FXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528762; x=1789133562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0c/Sgi1T4W7/Ogmdz2aUIy6QPzImiY6hgRc7tBhpmno=;
        b=KfUMIXzDWLf4Is06GI7Zi0niyzfp/ZgA2/YwVcbvoZAmACtX5IHQ2d20lSjmecftK9
         ynwPeR5G3iQR7WP3PehEhHGiMPUseUzHchNDqBULA72BRCnNRd91InnOpJv4aQZe+n7E
         ebBumyH7fHFyKnnRuYRW0IFV9Loq11GzccwR4ZCX2u7csJFn5JYUL6VK0sK4SeGpWtQL
         qXhxJ+rLMptcCSNUoQ/1fTIaPo0IaI7YSvasVFNyDPSzay/XhUciXzzM1rxgzh7FBaal
         pQGVIdqFU8nuMnNiGoDiH7n01/w27vw9jL/i853Kkbm8/axs2vzmZXcV8taHYJWTP955
         pfPg==
X-Forwarded-Encrypted: i=1; AKwUvByqiCNZ/YeElY8yc2dHnf51JPD70KbLQP/pHBa2oHoTITjO1T6oE/xuMeZh4XpL0xYQfvhjvP+jPhcWvnQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mLxXU4XqaHW0Q5K+tc81SzxPYE4RcuglXuRHyynqji45uXF0Vr
	RmrJEsAYpzkpYUgik9jhNVWNkNiy0VC1OCacdNabCh/MUScPrHc+kTXG
X-Gm-Gg: AYBFou3kabY+J8uyraK60ghhmVYOe6WRE3Cl+7wflHqTm44udF9BuPY4KKDOc03UM1f
	u3TurpZNSkDWJK5K/FGEXsFR0ZkK+g+hkTMJ74ysaqmYdz4DqVzILYJtzGWkiTB1U3L7piGxVuu
	kKKH9EFEqQ+ZQcUgYi3Uw93FeTNRvb30gLBgxWzl2+RuYf7r4uDbwlOKNNEpARCiRzR9g9GpGke
	RQcpz/gFwjT6gltQBCcZ5MRP6MDTe6wkt4OyBWKgq5mlyOti6gBV6MMJoNTsdbj4biy46+2ch9K
	s7hh1/N+iTIJr68jJb7cP0NBINL+a0tJT8cKcaoK1TpGbLmCYlWh/po4SHLz6rOHBqbbY8m8enw
	MCql2BAK9ErAYrNRoW129qtgiyJKSVMI0fHjlbZIErhIucBVCJr156aK+HI9z6cTpq9M5H8VpoP
	9ItEvsZEXYbJyVSwV8ue/fMEuZzkjutqbG46dTbxX5m9hyabF6Oou8pPnGxb7AmE8Y0TvCfLbzN
	18JwT0UOeVtQj/PZEY=
X-Received: by 2002:a05:6512:2344:b0:5b5:e8d6:8870 with SMTP id 2adb3069b0e04-5b60e6a6340mr2137250e87.1.1788528762134;
        Fri, 04 Sep 2026 06:32:42 -0700 (PDT)
Received: from fedora (pd9f1e316.dip0.t-ipconnect.de. [217.241.227.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bcefd59sm3661297f8f.19.2026.09.04.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:32:41 -0700 (PDT)
From: Vladyslav Ivashchenko <cactucatu4eckuu@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Ivashchenko <cactucatu4eckuu@gmail.com>
Subject: [PATCH] iio: adc: axp288: Add TS bias override for Haier HV103H
Date: Fri,  4 Sep 2026 15:31:55 +0200
Message-ID: <20260904133155.51290-1-cactucatu4eckuu@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Haier HV103H firmware configures the AXP288 TS pin bias
current to 60 uA. This causes the battery temperature reading to
cross the charging temperature threshold under load, incorrectly
stopping battery charging.

Setting the TS bias current to 80 uA fixes the temperature
measurement and prevents charging from being incorrectly disabled.

Add a DMI quirk to use the 80 uA TS bias current on the Haier
HV103H.

Signed-off-by: Vladyslav Ivashchenko <cactucatu4eckuu@gmail.com>
---
 drivers/iio/adc/axp288_adc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iio/adc/axp288_adc.c b/drivers/iio/adc/axp288_adc.c
index c8283279c47..c98863d612a 100644
--- a/drivers/iio/adc/axp288_adc.c
+++ b/drivers/iio/adc/axp288_adc.c
@@ -207,6 +207,14 @@ static const struct dmi_system_id axp288_adc_ts_bias_override[] = {
 		},
 		.driver_data = (void *)(uintptr_t)AXP288_ADC_TS_BIAS_80UA,
 	},
+	{
+		/* Haier HV103H */
+		.matches = {
+		  DMI_MATCH(DMI_SYS_VENDOR, "Haier"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "HV103H"),
+		},
+		.driver_data = (void *)(uintptr_t)AXP288_ADC_TS_BIAS_80UA,
+	},
 	{ }
 };
 
-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030488;
	b=WgwogIGE165sKcPNlcpdO3gM0ieGlRYrvGPvk8RgXV/sRMdLmZaQoKrw5yokX/5ZZUJH
	 ARwBPPPinu8LKzEHj89gZAVP7no9T2sL23Q3O/S5MpJ+2OsrSw9y75LQp8/f3p02Y0G48
	 cMiMlgsoK3VVE/PtfHnxObYsM9hA/dBLaTpLyTUGcXY60etF73YAiRsyUbAqCWGXT35Wb
	 1DU8XOM7rcyvAfK4txSCT4jSoX6Jza052fCtEbSbVaY76GXQ0ale+t8c1xFfIF39E7yi5
	 y9nW6hvaTBOnNgM6TsEJ1wST/s9sg+QNlqRD7I3jLZJjN4C6lx+FypTv8aG4Uv/BZVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XK7qHQy7h7fEOAcUVe+GZGt54pAG7ispME5t/pzPbRc=;
	b=T7vcbeIu25MHEW2B6k/ou3MW0UDmnHStjYhov+LzjKQFCIvSfPxs5pfQlBim4i+6oaOe
	 Baj5RAJzxGrx/3HKfg6s7dP8ayJGUmroQXbo9CJLYg059v63f3y4EisQuhID1QN4B3oCx
	 t36oE1I8wDfFZur0e++tDERiwSGc+mkrbwfqEUJuASh6ES/GGZNoMoySfdzZpG5TKR1kA
	 YEeUFMmRo7ANA97L3POwaS3h7N5RpdQlaBbpg/78hC21pte71tvat2JaYbkQEgycbZ5xF
	 keLffP/LfxT6qLkJ/VqKOq3y1R978wXlQ4Bs6ckEGxXCoRqXoTfSTEvN6gMJOSKTuFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ieUR3kYm;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9C5606A332
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD9C5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ieUR3kYm
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c414e5d282eso362195266b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030486; x=1793635286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XK7qHQy7h7fEOAcUVe+GZGt54pAG7ispME5t/pzPbRc=;
        b=ieUR3kYm3p4hIfOSxUoDSjFV1IWD3pQVNRWXlDRB9tsLgApSHkHf/RGj7ECfLsbymj
         SJ6Tq3aMHz3BkzycrYkIcxDPfJix09Rs+06ASpB2/Ao9+qV/mRvMh8h3aXFZHsmUCf4P
         8qFZfQMbuONsJKvol30wP7NsvW9f2Scsml+v+SUibIblbNJOW5+qniwKlh6au7xw7/lO
         DX2IDMiUq7N++2C5fkPaTH63lDyafrnNrjA6E4eexmK3J1tMN2VQgSCKJIS4qGK7gOkI
         /v/8ONz22x+hb4UxYM2FvyUp/ne77eiZnfHrqFejCU6FhjZSsRSAsd/6K/xNq7Ml339y
         kphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030486; x=1793635286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XK7qHQy7h7fEOAcUVe+GZGt54pAG7ispME5t/pzPbRc=;
        b=hDs600sP4gjgK3uoY9g4JxXFXY4ZznFYRUxgpk7R3LF1HD0ULgR0Fz2976y1Pp7tNA
         1ovyM+cVKz+ltD1gLiWC1HLncxgpxrr/8dwosCgSF11Dpq2wPPxj6ZroWKPBAKPQsqot
         J+EOJDH9oz+Aa0kHrYtFdC1tdO/LAMQZeq0aCPmz2d0nbYC0nLqMInSTcLpwiAYRhJcI
         ZpDxm1qVFPZMQNjTPcpCI+xrm7ziqx94M7EY4srXeEazhlWCtoq2cwpcFGUfrRcQkqwi
         W+RwjZZHVf3k1FKaZjlX9fFVKipTWrPehjOmmhEJ4b4Z8/1qGuBhKjom4e0EgGngeWq2
         rOeQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6R7tPSyH5dQ+4sAOEOMasjpAgusTnSIi4IXaeYznsHmgP7UWf9IHdf6kl6zmZvkcNfAyEjqprEy7BVn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYICeFUOOzPOk8/SVx5xt8tLAcLoVoOxgIMkPhpUbu6x7vUPOAJJ
	USDkhoY6sPnoQL9KOXumvpE/n9sgUo/xsmlRngWj9RosEISR1ysKWnz1rJ1LUGk11wg=
X-Gm-Gg: AYBFou1RSGPWwPQQwY2IdKqMrSb20kIjV2ZcrzJB8XGXJn5tn16wY57oI6uCVOIkYlq
	3FbSbeycD32zdtAJOA7UxKbDibBpBHPtO+w9GG7lAdpcVR61xI/JyMasNwlErl66h2DDmikkbsP
	DW9JJgu4gbR2E/LFMHD6fkYObXBNosTLqkG1ubUP250VSRYJbCJ/NH/7N3VXoimsk9Rofzm4Lde
	i5RyAWcM8fB2YHNFoR3kJ/UiI45ZCm68UQcoeiv6/1PRy0q0vQv6FjDDyGKK8PfV4CD4fifRZKl
	zC0MT5GRZs7U7L/aIF+p0nSVc4MH4etW0aKXcWu3URbyaOHZORhl1xSj/Jk5XsTNEfdRL4/QUhF
	QcciH6O4oy74pjmKs5HFzmbWBYY7/i8503qQeXkMAq1KQiKdt/PvjE3wM6J91hL8gBafXxZWfD+
	ArmD2tmJjyXPR0dgTFJDWgrMK0CXp16tN20WMx5Ddl8svg8RGryUL4m7MCVI+lHaBsPlt+QAPuJ
	TCHrnUi+sVyyH43WhVDgLYJB6KJZ4oBQ+Ryq2Om3+x5TqvwimZIGEVEddHjiV56gOBcpuXd3ZJ3
	iCcLZIc0YXi4NiVPq7vz+q4Dz2fprG/+Vjbp
X-Received: by 2002:a17:907:3fa1:b0:c2d:fade:e089 with SMTP id a640c23a62f3a-c46bd95336dmr871688466b.0.1793030485703;
        Mon, 26 Oct 2026 09:01:25 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:24 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:19 +0000
Subject: [PATCH 02/15] thermal/drivers/samsung: Depend on PM for
 EXYNOS_ACPM_THERMAL
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-2-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1174;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Dzhl0EEXao5JmHmXdbQBkEx1RDJKD2McfwIvQF5jBlY=;
 b=yldnHcVgig3g4YuaqhknJNmqQ0LiizU/8L7WyW6sz9Ri/9FOWRHr2VpyiIQE9S5ZTzmP6lMpo
 HHCV9rcJCDYAIrbrxD3SaBInPJhhz5uMQhuqE1CNV6B+NCUxnHtIT87
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The Exynos ACPM TMU driver only prepares and enables its APB clock
(priv->clk) from its runtime PM resume callback
(acpm_tmu_runtime_resume()).

Neither ARM64 nor ARCH_EXYNOS selects CONFIG_PM. When CONFIG_PM is
disabled, pm_runtime_resume_and_get() is a stub returning 0 without
invoking acpm_tmu_runtime_resume(), leaving the APB clock gated when
acpm_tmu_thread_fn() reads the memory-mapped INTPEND registers.

Add a PM dependency to EXYNOS_ACPM_THERMAL.

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
index 18ab4ffc8671..b879a63e97c7 100644
--- a/drivers/thermal/samsung/Kconfig
+++ b/drivers/thermal/samsung/Kconfig
@@ -15,6 +15,7 @@ config EXYNOS_ACPM_THERMAL
 	tristate "Exynos ACPM thermal management unit driver"
 	depends on THERMAL_OF
 	depends on HAS_IOMEM
+	depends on PM
 	depends on EXYNOS_ACPM_PROTOCOL
 	select REGMAP_MMIO
 	default ARCH_EXYNOS

-- 
2.56.0.257.gf7497c7d27-goog


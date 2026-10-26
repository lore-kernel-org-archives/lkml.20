Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030495;
	b=M0WCYwhUW+6VwjeRR6hrqdcWujg523+SeRQRebnNJm/zyxVkNDXh0mKnAZ46iv6c8uiW
	 nPpBbWe23l97ULlr1F9OJjBMpGEKDDIaijzdS8+tqAFdnJAJnuYkzQbhvnqIWv52YCCDO
	 B8Pz7y2M8M5A4is4htO4bSCZ7Ky0h5dt1kLng+uYV9iTrMUx4pBpBFZXvP/aVO95isbH/
	 mNuik4xDkztrws5L2TFQ5VHoQ7lZ8noZNR8cPa6z2Dt51MmVnB1I+dC8ABdfZj3VhmAuS
	 qZQMZgtAOTU6vshsGS7XEBZTfxjIrCZXpC02V5Y6JWz8Xcy73DRyXy3T7sj582uZzLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K3sKvuhBViiGlLU3TkCVl1Keg1pObMrKBIESSV0t2zI=;
	b=aDlMK2GFeWMdTT3A9oaZNVjkEMPsM44ug8SRY2alNSBzFc7w1uCiNgW1nq5AbNVb7rDT
	 7Jru6+22vxGYMW9k0CEyg1PRAfI63m9yOMD/6rYgI91yOuMKfz7yKGhum+SxW/vtLOYj1
	 ULLLrzA/GkFIGxuZ+psh1Nx8t1INRvuLdXqywS30a1qboZMA2Cx6bia00A7LIv3G0B7VX
	 ERbR+CAnwYgS73OSQEdEIBN7s1u/M+ai0MJf0m9kgoevtmZXMRO9qjcYWiChhfOiOa6gm
	 wCx6fdKnpZFjbaqJ2CuzdstApZPZ3fcr7gIOmficiQRxMsV0DOJyQ1Gil1RUrTpu9pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Gy0DTVQr;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57941606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57941606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Gy0DTVQr
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso490169866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030492; x=1793635292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3sKvuhBViiGlLU3TkCVl1Keg1pObMrKBIESSV0t2zI=;
        b=Gy0DTVQrLWfIPaQzWTsoxJdmXUaoLO60RxOiIn2NcsjY0qLd/YUHf9FPyp4pku997H
         2oZlIQQxp19q2U/moXXwRMkMqGSKDGYN4XJ7q7zvaUyLgXTcv/I8SDs7HorJ1QJWSXbr
         4vunZikuIuU0uWS8VxTpzmh9sP3DO5N4ExUv46NkvA0lQ4iXBgrq0lXsW/OCNAbBt4Uz
         WFHNdP/wiVtn/206+6E7Krq4EZHOQVspCDYezqamM1H4c7jIsTrLZzP7yRdYJtObc2zw
         3bfEa94JqeBeZIRHwLBTRnBYvr95ZC7rbK7ViuTNIp1pGA0hHSqUKrlSm4Z2Nu9/O3+q
         sxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030492; x=1793635292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3sKvuhBViiGlLU3TkCVl1Keg1pObMrKBIESSV0t2zI=;
        b=mxQr1+pbrbxKMcNMveK2WDxohDx8UGBctI90dKpbvOsCpCaGJYZq4tZsioh5di2BSo
         c4mnpB8N9smPaEyyutk/VMDFmIbg4oSmFm1wq9eCwS4OQfmwbwFoKJDytoF1ZxX9JyuH
         IKync00nIjXf7bqw2AH5LnPj8hFNGwWSnMwFFMSdF5MD1T7qtnpYturMihOGaRgbAROB
         CGcdmiy9Lxt6PoViaXKIKuhjt1hssRZttKx6Juz4ED1JVvoEz0bcYMBDGsLLKwYp9198
         pjtTI16i+ftt2sDHSv00T2KtsmE2tmhB4rJ7nke37t35eTWm4XHlpGmjWwcv+Zp1YTri
         HgAw==
X-Forwarded-Encrypted: i=1; AKwUvBwX29ypErVrWUavWtJOF3lnXW0p6foUvo3QviIhnfHPaufpunNlMdtFe2t4Ri+WbDXHAjuWooYX2q4L+28=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqIn1+YyXEwxx2T4aqP3sMM/KOyAHhpGS8f8/18MaJ3NnSvzri
	3J821qHmiv4DzQQzY/AiRhFPSr3BbIYGK070vUxNjA5DTWJLDh3Ae3y9w/25nPpUKZE=
X-Gm-Gg: AYBFou0U4XGGgO7L+kBSHfHh5J5EGLTp3iBz12Hbx5sED/FIqaLp2jxklkRUg/wm62V
	49PnMz1Sd27z9lnw8YbemKrWE7thxrcBtUDXmnLXZoOwsVMw84iQ7OP3meBkA9ALcWgRzUVZhjQ
	vTSKINumg1qqbIyzqcOsFU6+wXYXzve9l6SyZheTzfrl8z62XELJ8iEnJEzus8u0c0Gwxiy9yAq
	XJ8x/3eOxLjdbqX3NukgrTg4olMAUM3kk1/LRmo/vFhIFZZNDre14fHFZK6NS8RWpvU5JZvtWX1
	gCD6nMs5P24a7lIrrAlShvyIuas+g5D3Fa3bEUXn0LekUb4X7wgBxJJt3jAC6wyURZmjs4+79SG
	BtiyK+qpK3Cnz6kD4ZZQesO8eA58ndP8rApcS1ewyNENmQLhW+dFiRphhJ9WUlbDOEl8qKA7hfV
	3UhvcZYo/8s3Gtrndgs4RimsrgjsKNxCJVdrjAVuTdlEbcJK8JewHv2i9KiZQv01KxXarkpxyeE
	TW5b+RwKt1/bl0lwwxmqKdzmXuA17BGaVdPClUqMyhJqYI8SD+Xqgk1KWNOfe/e6Rrz4/x3G+CV
	7hLb+Aueup4x8I7GQ0HwraZECAM7gh5Vd0te
X-Received: by 2002:a17:907:3f1e:b0:c3e:d0ca:d2fd with SMTP id a640c23a62f3a-c46bddaefadmr876184966b.12.1793030492156;
        Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:31 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:28 +0000
Subject: [PATCH 11/15] thermal/drivers/samsung: acpm-tmu: Rename platform
 driver to "exynos-acpm-tmu"
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
Message-Id: <20261026-acpm-tmu-fixes-v1-11-0637431b7268@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1029;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=kKFEY7/HvEq+100xRnR+XskO/ds5n+vISMebLJ4Xmr4=;
 b=ec7B0504Wi6Z8WS8KfhDktthnTx3XbHQeg00S34wCbflTe0KQVBU5L4yBFWkH1RAfbPukMl7S
 +PP33+KjN88BE+Y3NUBrjPmJBAV/M7X3mNPO26BGuX5nceHOnSZjuZL
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Rename the platform driver from "gs-tmu" to "exynos-acpm-tmu" to reflect
that the ACPM TMU architecture is shared across Samsung Exynos SoCs
(such as GS101, AutoV920, and Exynos850) rather than being specific to
GS101, matching "exynos-acpm-protocol" in drivers/firmware/samsung/.

Suggested-by: Alexey Klimov <alexey.klimov@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 42b338d8d093..2324efcffb84 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -597,7 +597,7 @@ static const struct dev_pm_ops acpm_tmu_pm_ops = {
 
 static struct platform_driver acpm_tmu_driver = {
 	.driver = {
-		.name   = "gs-tmu",
+		.name   = "exynos-acpm-tmu",
 		.pm     = pm_ptr(&acpm_tmu_pm_ops),
 		.of_match_table = acpm_tmu_match,
 	},

-- 
2.56.0.257.gf7497c7d27-goog


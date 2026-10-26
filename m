Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030494;
	b=qVvGZ2M5uoHe+T/UgaUt26brACWWEsgJyJqtq3B63v1dtXh/N+1kquFKqOUFQs+NqP5I
	 SRHZHBaI2+10hnpeWSgOidUgpF0lLcHy5lSaamwV1leXVsw54tAraw8fkZ9mBDi59ZtSl
	 i1W3mejbSTMzG1hIdY91mGy+UfRzv4nhT0wbpybEWfecdaiaFfmfA3dVQ+6WqcTiNnvFg
	 0C6199hws1onG1DIAaMBQneW6f08YrHSK+f2ImDb0y12HnqUzmlLNOdcgzey85HduWqqZ
	 uKwMF7uC0BnaflZVxuabdUgWo7OGbn0jdhVR+U8Mm05u4w7PGF68unxxkjGzqiA30bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kBw7AsSPjsfDBCQewWzDRPOIx+yoCp8Gcws1tr4ymx4=;
	b=H4oXoEidWrDHynOFjy6Rkg/Wa0DLoL1qZYmAWBoGjQXc74GUhuzCZBXVeqs9jRA1Fgbp
	 bNgyeO73qMDEfhFLNsewuY/OEDIbk5VjQqg5dKjvsW4Eb/5KCBPfDTv0XVx/g+xapK71/
	 zahcBlDMVOQCtud8oFom/rXh/jstiQH5ffxgEiBILsHlTUljEj1r5surMXm42J+YwHf9P
	 j91qFWADOW72UZrpGebD00GSPzd8lBGBg9Eff77rYFnBUj09RalEGPbvTA5CI53CdKus8
	 t6lvobvEVgJMD6YeGpPvRIn8OaiSdt8MNo+YQU5oonuC2DL/92SeAZPHjoR6rofyHtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q2+gKLTX;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668E760A3810
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 668E760A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q2+gKLTX
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4550d8ab15so403338466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030493; x=1793635293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBw7AsSPjsfDBCQewWzDRPOIx+yoCp8Gcws1tr4ymx4=;
        b=Q2+gKLTXKBmiFtZ3oS6jQ/Alb+7Y8/226FUbzVO0UsRgn0WP/nSIudqsHDvjXVWlYe
         ppKS28mUWuunFTQtgq3SL7OpecpO5D87T58jH32UNB4L/hAPcqmu/8aSkrJM05L/ZNbp
         uijzsrmQDyDLNoCv4nswrIlEfI0NCvKa5H4/aZbyATgqu/ekcUtezv8kqOqPBFAyv5ae
         1yacVh897Y8xxclpOvfEbgIwheoneVYdNswZ9dkOj8TKA6JhrnnaBWLdv8DTlnd+wOfC
         dJUE/FDAWdd3OTlm4hD98Hs094pws974LOzbU5vUIrWNR2n1i2FV3SZwBuPuU0lQkAdB
         KiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030493; x=1793635293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBw7AsSPjsfDBCQewWzDRPOIx+yoCp8Gcws1tr4ymx4=;
        b=j2KAYHezwAY848mcuLM+9qKL6cF1lbJgkPvmpmQF5HRCLD7LS5kYUQIJnrYZyY+vTz
         aL2zti179x5w1Wd3XeJAY8QEK2kK9GwoGdjPVpU2UVujPSZQodGoKwn9EpctwgncZp4l
         fHshck1Sh6T00Q8MoDXLm1HCJutcrwGQAvOSLy2Viybu18SRVUhue3+O7FWD7IUIQKnS
         QaCUCa3R4xYZGs0PZAhioexQftf5IRMzQeLxGutLv7jPCrqFRL1IOwdW/Hkai3QyeSD8
         9vKOycVddJQo0S0S+3W7n64JvKCpld+HluBhnfZrRs1NZ24GUs8rZDUS10Zu+ssF/wvv
         EA1Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/IxkRCFcHsBFoOvtSCahH6umfL8Mcz+2kjd2Ev+SYCZZ5lQsj9e3l13hn9iwon0yOpMq+/8SZ8O94/ac=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9kFH36xIcp06MXE/o/IYrs4CnnbivGa1OMG4hOiUkEy9tp53m
	M1OONCyHuH/w8AzLdBPS5wOCZx3Go1MPprRpsC++g+1T3+a15FN4EiRq46lEvsnLCwI=
X-Gm-Gg: AYBFou0BKLjN0EWfXa3Aw+hnRewQ0wMzamcIpesFQ2+5juEG6epSCZHdPE7mNYVQXKb
	I0tePGV2fAYku8+xdRhduppuFXoNNQWx/Uz6kBlI9gl5cxELPlTJ0kqUDOjSSpEqhKmvnyzGyKM
	6i9/jPdLTrdvg7hvL0Z8rmLbiptbhO4S1IBmAt9yj3IKJA6PsTAkgWSqmg+WbJNeeyjnPvTjzrT
	agUCIf1Q/DyUZnoyHAoLinCnEJIbxPrRTKWlUM26JTuzLfVozYdGr7qCzRHxvf1niLMUCiRFn89
	JoE8honP4Lnz76SgmDbdJWUBijRV6VVymsj/WOqXRLr5Bg2uNTkQEXPlQErQAvgQWroJfNhEva2
	8tUmx88E7/TacNvCYIjCRev4NTUvUoJCqqx3eWguSLg3vHLD0QCLR/azGODIvWIcAJQlXfpaG96
	wQcRMQ61EPmzQ2ZcuQFhitl9gP3u51U4Q4XXarFL4WUViP1DddiH+b5HO3rN5jQRGXkz0n/YNaz
	b1PEUaCF/loJttDG0CaeMGUr66c15JnRfq2iirdPMV2ia6nOL68Qri+DR76iw2tnv9QY+ys+yN3
	0jy+fK7uIv+9dxuejwDCDTvqh1sL8vDg5RQ1XxAyoxprEw0/Zb6Z0ekjPUTXVHOq5xIxFJSLejC
	om15ji0WOwA==
X-Received: by 2002:a17:906:7952:b0:c24:adf4:5c73 with SMTP id a640c23a62f3a-c46bdaa744dmr805676266b.1.1793030492733;
        Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:29 +0000
Subject: [PATCH 12/15] thermal/drivers/samsung: Drop redundant composite
 object in Makefile
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
Message-Id: <20261026-acpm-tmu-fixes-v1-12-0637431b7268@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=884;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=SDTotlLZ4kEAoPrEqW6PvwCyKZkwJhZmCCGyB1TBPzI=;
 b=JadGXkbxn+EafNhgFKNtszZPIyTWdwhW8qTIY37B/py/BVkrrWmdJpOWgaeZTF461yBeuiH6t
 pQrC4KFxCwoBCxlHTzjvL6fSlwGnY2iXIZSE9WCw0AgKuhCRPGCehLb
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The Exynos ACPM thermal driver consists of a single source file
(acpm-tmu.c). Build acpm-tmu.o directly under CONFIG_EXYNOS_ACPM_THERMAL
instead of wrapping it in a single-file exynos_acpm_thermal.o composite
object.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thermal/samsung/Makefile b/drivers/thermal/samsung/Makefile
index daed80647c34..d5b6e9e05377 100644
--- a/drivers/thermal/samsung/Makefile
+++ b/drivers/thermal/samsung/Makefile
@@ -4,5 +4,4 @@
 #
 obj-$(CONFIG_EXYNOS_THERMAL)			+= exynos_thermal.o
 exynos_thermal-y				:= exynos_tmu.o
-obj-$(CONFIG_EXYNOS_ACPM_THERMAL)		+= exynos_acpm_thermal.o
-exynos_acpm_thermal-y				:= acpm-tmu.o
+obj-$(CONFIG_EXYNOS_ACPM_THERMAL)		+= acpm-tmu.o

-- 
2.56.0.257.gf7497c7d27-goog


Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E035836B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321957; cv=none; b=grw4GTlFsIEhjv4K+LK+YTauHkpaij+8RpsNco4bt0AdJCnnNXVWiCOmHxckQ6SM+mjrmp/dsUQIz+njDrUDkvDvEkfvOp/i8KsxzJs1X/ayJUJfZ8/Z2bAZvnOiqqNjixyqggnrFYEfA88kDMH7mTlJEPgV6QhR2J+MD3HawJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321957; c=relaxed/simple;
	bh=U02rSKyzUzmCOmMCAOGr7JPyboEYq2F7JqSsroq7C50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ml5Nw0CJtXaPa95neNXofWm1oRAH+eWrx8mxg7ibnf+HKDVB/oyglCTm3rs0M9DtJ9wKoS8ecS33xQ0zu49b2lko94l41PKddfF3hVIJTlfNPgtWd1j9Q8SF26dagxRptRZjVVlYeVKm+JunplsOTSgWMQdUpDtJVnC4E4DlZYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3ea2ono; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3ea2ono"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso7604795e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321953; x=1788926753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFvygFZGUjQBUvyTV1K8zmfQ8M+g/wd4Pqbb8y8IqXE=;
        b=W3ea2onoKooBqbCDJnvgzlYoAdt89GyN7/iCwdILcLjgDl58tiZscDh6UiWXXkOLky
         Zk3t5/PQv/4jFRXE52e2kSU6lAQwjAp4A5kCcSQ5mtgYk0RlMp790g+RRNY+m4PPkUrO
         b51K7NZhFuNaJyVutDfkVUgF0CbWCvl1JIDtZCxxoJ9m3sOAD/J2IeHi/dajyrqw57fF
         xX/JxScysSEPM6xZkpOEENiPdO/94OUX0W5oOGOCHVHsoTN1AdcaNpNtzMKkuhtNlx+f
         fqJ4GHaSdAt63/SQvDGg0vdBqPKcHrCt+7HyTPXDePWnSbVK8nwkagwsZjkPnQwaOGoC
         x5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321953; x=1788926753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFvygFZGUjQBUvyTV1K8zmfQ8M+g/wd4Pqbb8y8IqXE=;
        b=I57ws62jkUFQjHTE0J/EAvklGC4PwDjl5Hmh0jAR6VNHQmyu90U+EAfD10iqaUTVtc
         /9RA3kjI+8U22gpiqNbs5a1e/cd2mPI2VqvpWDbUdk92gybJDKau49CaNV2yParCkYMn
         6yGXryWX0TrTqwUhU8EynzM4Xstja8Veex5F0FNeodHZ6Wzol3w1TkxSgqhJ0/GB02ZS
         tlyKE3N0Pm7tX5CkPH94aMf/3YBFeZXYc2uvjhp+3Xgd3wPCqGJQ7aBc3FOXvw2D8onp
         LvOCkWO3DJBGCwECJK9G5/fBYjyiCu7yWmVmUdlowv9KS0AKBQZlSeaBpeynJn380hhF
         3izA==
X-Forwarded-Encrypted: i=1; AHgh+RoSFJWtDEKJKhKIFoJOnvda4j8a2ce98chHRr7E32jBu/+kbsk8l8gSl7FvzCVdf1WXRoNVvZx7x6Y0hNw=@vger.kernel.org
X-Gm-Message-State: AFuF++mDnMI4T2+rrsj4ylFk2sm1U+ZxTgj94Y0QVaM8i6Uu9dS+AVie
	C0CB0NFpA/cvNXcm+gLEwaI1hs+50Eypzn6W2kUOceeF9Epwz0EmnGC/idlFxMefSP0=
X-Gm-Gg: AR+sD13HtpPpSNw0KOtSryzFUkx5xaq630cY3Ub2Hm3d4vyTX5x3mbgBDeK6AAGMbgV
	el19rryux2JoqMBDldiFF4naFUfBOoBjSVrrJ02AWGPURXJck6NQVimSPo8YnxSD8ZiHwtU+w1V
	r1/EsLHw8qs7RIrYHeAJa+2t0TpF/H3j81muKqhoEOFSa3AAIis0/Wx1kPj8ivm1GAutiiEk6zI
	NIRO5+G7Ya8CNuFHlxhG1++GHK1bdzJh1HpKiZruy3K+3I13lZutNi6rb7GFcLSlFyco0m3sREz
	Z2AhRmNLQVQ75i71bYJveWh/Ky0/oqG6Upxln/0uojCoWAJooRzaEjdpoSI2+MblQU4Qh8IshVT
	J5EQ1xUcOl5wCGjNY1LU5zQr4Mz7O8/stkd+YLgqzNU9ui6jjZf2Qcb41OTUk2AabWovn0N6zw7
	oqcM5FQWpu9nTkufKmT6xrRWFKoFPRRa5FQ0xC77Cr4+WwjRwbHvCYIz0tXNDpmHDcklSgE7CoL
	Iyp3GPYq0PCZiFWlNodbsXyxmKV0VmUrQqJzy9y8Zpxidtxa5QTzsYIYoiwkOs=
X-Received: by 2002:a05:600c:1f92:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49ce5816440mr28643995e9.2.1788321953089;
        Tue, 01 Sep 2026 21:05:53 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:52 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 02 Sep 2026 05:05:42 +0100
Subject: [PATCH v6 5/6] MAINTAINERS: add Exynos850 PMU entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-exynos850-cpuhotplug-v6-5-a85bb55bb118@linaro.org>
References: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
In-Reply-To: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
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
index 554246ef6d91..44986153183d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24290,6 +24290,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
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


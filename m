Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6295C35E926
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321952; cv=none; b=E2j3dZ0FiIFIboeguBqyZJ3iHF5Q9RoScDm/Fmy5mg72igMSOYO89NJWZdbaHWY/HOkVLqaT3oPN/3MgvQlCyRoU56SGdhO9kBL9MRpTaKHGTGoU4Uth1PF1FK2dyLSsM70l+4FPgtkr4QIRwKQ5c6EZannJXSeMsJ3gb2MF2yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321952; c=relaxed/simple;
	bh=rYZ6f8ke4/CgAKpv47zNC1/8drck6P5HXuC4yvBfoRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2Vftg5NfHRoUkVvTz6aVFl/SEIF9k1lJBo+Eq27+oXirsO4WM6BNwH34DUQ2NmpuCyRBPuKgG3Ntdep7gtsZx+K6Jfkdof+MPqxbnwjaBVd0pdaWSz/ciwczkP/rqj4Kk8Mm6IfNY06kNMIPothpW+XeE5KXTPzid8/LXkM7PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GwBh/3s7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GwBh/3s7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8687630fso3843775e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321949; x=1788926749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbNhV3sGP6oWXmNCm4cU9gjHDsysd2+OUMzLU54oMEk=;
        b=GwBh/3s7s615lKyOoW/do5WE1S2uLUZwqvI+cmeMsJegkdjSBK8x5jqPFEmH9cQN/Q
         yLLCU7PSKo5ClbHI1fm3Y8A9e3s1D33egu+LHsGGG+DDY4ihA3oJRapCMcb3kV37O6n8
         eSmYLXXs4Zp655AZKTRHxdkROOW6Df7nAB1BS99MiKEv0Eev5J2D1odHHGhGTemzp2Rg
         xaW72g2WlA0A9LPqsQjq1e2lomy22fd3AcGdyo+3gZW3O89ozhywMYkqxS+RZEqiI9UJ
         PVEB2jM0LPbkxqI9KiVXCXuDEb2GF0QViDsNy/U+cxX8x4GwF9+SLiHrhwwwv2tpc0OV
         kinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321949; x=1788926749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbNhV3sGP6oWXmNCm4cU9gjHDsysd2+OUMzLU54oMEk=;
        b=ans/u2EnIyy8Zxic6xaXusde+TLq4HpTWwcHHGi4KmZSAl9ExRwKQyuaKPtfwACsDV
         OZnQrA1mQBMVmC/R2A3W85O+FMVJPvNdjfU8HUNlPk3z1aO4B04FBUmTNEusaqh1Lg2w
         mbzrPfwqT8ld5yd39npO49tDS9arlmxgTsgqqBKTKuqiGDrZVnrwPmSSxW6/WDCVP5DO
         9Gik+8t+A3921eGycDQVlYz7sVdTIvjLGp/AU8Zmw1UYxXpTUakKjdhHTHijhkKNWfVO
         A34nSL5xv1Ox19aMS54L9ouApAH6Lx6upQH2Qb4AeQS3p6DFAZa7WC8ZStBqUqFmxvi+
         wL/g==
X-Forwarded-Encrypted: i=1; AHgh+RpI9BV4nmDPeR9X+mzs/SNxylifl9p4FWdJ2528gmO+ejW8Bn16nZDse8uRRFjA29HMJ6Ivl9KLjqbaTkU=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ5Ki2Mkity2u3m/JZfsbmwlVjGApR3hKxttBV94/5gq1wzCOj
	L68aDDeITyt7Xww6R1AJ+53qhzIxk8aW0VlyZd5Do78pwgoq+QEOeJlrlNZXqSxuTl8=
X-Gm-Gg: AR+sD12atX54ZNvQXLnqczFLTB2GK5wa41Bh8Zf3inyLrcsROuipgEDx0aPATRmI9cC
	iVjJ1+G2PpOGIwEIC7Wh4Ib2V27Kj/0s09GaMYc35B40w0vlCTkAuSdqakYhXTDA+KTKJHNwMI2
	2/GTqr2jvOXJDPOgVsu/k+2kVqc74uJzm9g23h6DEYJdvJkFXehyFYyTApOSqGgl1Hhx9UkT+Ue
	N9RVTeZx9MZx2CEubYoCiu2Xf9T7v9uIt0MRE1W6gLcOKQud2LqAFNsatlRY7OLyhZkEN6bBjHW
	r+rdC7VOKEQC87DC4Eq4zu0gLqbUOmuROZSU6qQKBVlHh3S2cE+TiMXqZwaZ5oxO4hpnoduRQlz
	Tuo8kuUXBKt+fxHvjjUCtTBxvxVWOIAzeMrxwVofC1b9aWZG2rwjrWuYskZLm8atiNmj0SyJ+do
	fYuN5YMZ1ialmpf+vRe4gKtpGeinMlwhuUvbx/atrrJN3GtF9BeZ5h4MBu9DUuxpZNaVxY1o7q/
	3QvXGsVX931dORzU89mWkXmyGg9XjZ0mCjuqIYXvNn0/L0U0YKD
X-Received: by 2002:a05:600c:3e10:b0:49b:9433:ea44 with SMTP id 5b1f17b1804b1-49ce57fe002mr33589265e9.4.1788321948081;
        Tue, 01 Sep 2026 21:05:48 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:47 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 02 Sep 2026 05:05:39 +0100
Subject: [PATCH v6 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-exynos850-cpuhotplug-v6-2-a85bb55bb118@linaro.org>
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

Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
property for the 'samsung,exynos850-pmu' compatible so the driver can
obtain the necessary syscon regmap.

The Exynos850 PMU relies on a separate system controller block to handle
interrupts generation, similar to the hardware design of the GS101
SoC. To ensure the hardware is correctly described, this syscon phandle
must be explicitly provided.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5bd39876e3b3..7d58976dccc4 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -196,6 +196,7 @@ allOf:
           contains:
             enum:
               - google,gs101-pmu
+              - samsung,exynos850-pmu
     then:
       properties:
         reboot-mode:

-- 
2.51.0


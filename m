Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DECF356750
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 03:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790824157; cv=none; b=dpzU2v4qw/sqtLBUno4LDI/eyCPF1IDo5EWivPdLsWk0iFLE9XBs1bowiJm/E6BsF/nfneosov2/U2XHUcrGLdvXJhjilhL0M+NwKxADEn3ACQzai5lrU64k8mu3TZrROs0NJ3ZRTctZEAkgIWB546ommxB0AXblySB2f+bfaLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790824157; c=relaxed/simple;
	bh=KdbLuJASOqevLxdks+lbqwjMq97p66unyiVIod1bv5k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A/WPDFTX2oZ446hb3rSSFWURptdhPVGQcJoXVY85DDc+IXZsAcVcXDNGQDkYAw1Kog9KIhY/yonDsf1Ddp1tccsNo+KrkJsiK6Bbny4MVaJruDr17ayajlrsZdGRu+gHSSEn93mUpeBLX/WTU+NOiOe1QVxPPbkvVyQ6RdYZod0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b79Jeha/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b79Jeha/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so33391375e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790824154; x=1791428954; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d6XLJYbI7HUMV7gx7S4Fj3cUrwWbeBAJ9EUdAHuqM6E=;
        b=b79Jeha/QTbOVruwzc8D0ukHx9EcrvVF3mxLtJvTTCzGIWe0hhZB/sGyR5gBIW0d8a
         9fqrOmFiO1X4uygll4NhQ8THELudQaGyYdiKET6UbFud0oDrFZXOEkOCtq2xeSBWtE7i
         fqZRbOXTgsQ3ugyk+5rCjHwYyie1IfL72cXBArKS4QyY1ajuHd97rQJU+5SHkw2NL/6o
         w0WzGkffxnKgUPxMawgM70JVqThYMU0i9tx8vWJgEDxeHbUdOrEinrojI7MYALX0dLDC
         HtsiYMJqVcQYtPJthoQu90Qg6QrYDLaSp3YizyKLZm+yJiLfW1vFpQyopKDU/zzhKL0A
         T3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790824154; x=1791428954;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d6XLJYbI7HUMV7gx7S4Fj3cUrwWbeBAJ9EUdAHuqM6E=;
        b=iH+S4Sc6fzpjj2sfVWAEIwm99inJKJQZwri+E7jW9rvk3cXxukcUBsGFYY3CvMIupr
         Iw3OFECZ1X9c4gbJRrkmaZ8A4jaArWw+BI2nEbcYsYRKkwQdnWsVRNtPM2MlYpKDNlYm
         zw42XjD429bTv9qJUF34r7Y2KDk/mzQEkltGBvTvA8gswc0T/pZcTptl6cYjPEg9RNwm
         XFU2SmzLGXXv0mdfm+SOSEbE0/1ZE05Xv9xVyuUw3uNrx6TkHbl2xpLxIZbtGivjZ4EW
         WhQocpV4JW5pJvi1tci318Jj7YNSRyV8PgahPbVIAfblt/qT928cEh3Xrdc+e9jrZ0Sg
         MR/w==
X-Forwarded-Encrypted: i=1; AKwUvBz1E1phJHMUUtc8St28cXX+QFtZX+LuYEtVTYULPlTzmTWtErO5g1L89X+IYFaEByokAsuVwltJL+/Zkhg=@vger.kernel.org
X-Gm-Message-State: AFuF++nBhkjKxRIm/Mfj9jeEEcZighDmBHKbqKT895JSDEle88F8eGk8
	5UvB8xVShu5FQO4KBjak1G/3BAletDu3E1WCRk+bW3kBvp4H6VFEjwhdC97gP6j7Fbw=
X-Gm-Gg: AYBFou0BzNRjKF2wKozXChpcx7gK0Ds/O2BuJyOugGvdEii1xHrndt3y301KHTljYLA
	HHcJRvLj8CWuRU/lfH+X+0EGg1BgZnP/nBqlB9Yvhj4kRC2H0Gap4EWfgqYx4e9Hpe/EFBDpLvm
	yW7m+6fC21d5eWZz79lvHEwteHayCL0vcEvX6Aa1ouRygjUhjzm4J3XqSByy7Env0QHYQB1bPqJ
	V3lbHPHRO6qqqqetLHBRLaod+golz381cZWlVUlznNZhcQ2fYN1o1oRCRPSonoOiUih53DDpQtL
	TVybiVgVQ/zNJ2wVtg7mUtD9oVFbUlNPrr4a58UZN8cwYjfCJmmefueuffnjPHHBYXO6FW8dNcK
	7/rAOvz/M4/IjxQFe7j/UoCXKk+5HpgQ8k5JcKHmDFhW24tgCCSUbfvcEfChYyBNqxTelO2jaum
	Ikc5gR47VZoriZwhMO4boBzLamYDsyytPoY2Bi8RznKPbRybGZkhLEZYHO5710bb+iarz6+Wwle
	LLMkyEJUiK0MQdWQ7Urn2E0jgFgpXPnoZDtz/eb6BZLfwFoDeflPjgYKnZxMw==
X-Received: by 2002:a05:600d:4448:10b0:49f:ce78:3564 with SMTP id 5b1f17b1804b1-4a01b11bedcmr39473525e9.21.1790824154410;
        Wed, 30 Sep 2026 20:09:14 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9145e6sm27091885e9.5.2026.09.30.20.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:09:13 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/4] Exynos850 ADC support and soc thermistor
Date: Thu, 01 Oct 2026 04:09:11 +0100
Message-Id: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANfOvWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwND3dSKyrz8YgtTg/jElGTdJBNjI0NLS1NjC8skJaCegqLUtMwKsHn
 RsbW1AF3fQIBfAAAA
X-Change-ID: 20261001-exynos850_adc-b4321995389b
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Hi all,

This small series adds support for the ADC block found in the Samsung
Exynos850 SoC and enables the Murata NTC thermistor on the WinLink E850-96
development board.

Exynos850 ADC is also called ADC v3 in downstream but my understanding is
that SoC names are more prefered.

It also relies on PMIC 1.8v regulator which currently represented as a
dummy one.

First commit adds compatible for device tree bindings, second one adds
support in the driver and last two place things in device tree files for
E850-96 board.

This was tested on mentioned above WinLink E850-96 by reading reported
temperatures from thermistor.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (4):
      dt-bindings: iio: adc: samsung,exynos: Add Exynos850 compatible
      iio: adc: exynos_adc: add Exynos850 support
      arm64: dts: exynos850: add ADC node
      arm64: dts: exynos850-e850-96: add soc thermistor node

 .../bindings/iio/adc/samsung,exynos-adc.yaml       |  1 +
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   | 22 ++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi          | 10 ++++
 drivers/iio/adc/exynos_adc.c                       | 66 +++++++++++++++++++++-
 4 files changed, 97 insertions(+), 2 deletions(-)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20261001-exynos850_adc-b4321995389b

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE54D274FE3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789698023; cv=none; b=FYrz329Wjg6544DAL5SGC7HfTTTowNEaoei40HfrTX0rjCOf8SAVNh2IQPLEDfNuZnXCcic51sluFILThcuVcDFq1gQjpWjl39jGfYgknPsvRvmp+S49t73kxxoZlfiqoiB1abRoBhQRhJeAx/OhGVT4C3LoGbUfYKESL6ohvrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789698023; c=relaxed/simple;
	bh=fwlPkqstrQlpYtzSAbjI/xkIKHHpjI1afmv6T7fC7po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hpI3wJ24FO9wGpDVaXu+T7LSfq/C8+/eMQsX0/WptkgOc5NHDarU928aHmDBnujAsJMBg1LVFJkRQ4r9DyDtn7BdaQuJl8ilySuW0RczsddkYhgXFalAiDtnNKiisugiTCN0Rm0nVEyMBbfqFsGhzQfS8mbyte0nHjUu8G8GQU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWgwSNNt; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWgwSNNt"
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4c9a4910efeso75154b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789698011; x=1790302811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=sWgwSNNt0yWL5eFck2KEZUlm7e9hGTU+v+yXOuttMIZ1ktUuP0WpoAT8H/hiE10MOH
         WBQr9tf0skJZBNGxdI18+cm5Nq8uH/MwI3B1yTGu6pkE0WKzcTiICQXW08zggU2IyaGO
         O3Fjxppmi7Mel6f1UWP/UtLzuKfUdaZqhBEeCS85rmJ0Cpvs4hExSRfCm+RlJiYGRUBe
         6n/I/lj3/cfWaLa4SqBBib+c+vSeaIuCacUFBx5CHZzNlssOogB9HvcS+1BllymKJFj7
         JrHvQknMSojS+Wa0hVbRldw8FgpfABxssrKdCrZOlSlgXoaqF02RpJVA8hmXXcHcw3Yn
         KPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789698011; x=1790302811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=f7xUZJfo+N3CHkwOTdV/u+7nvIovIZiGki2wurNEMVEMjL4I1KPAZWYLoDn9yovv2X
         QZJJ/5lZOBmZQiIjtbu52xUBvbQ2GdPSwH0rLpKOv3tZgMaXWELNNYt6LJGOKykJHH2J
         Wjw3kBRMBZgUf+gBgwiouvgNRgYySHya7kVM0hwcxTj5HYQz8nX9hxr5nLTfHrg7tsFU
         MgIxLFgoanWt1MgdylBMgnK3i0/1U6BfII4bZPxcV5cvu1svUokrTq69Qq5bQfPDXGeZ
         a4lm5EVwduyeQDr0aEg3jxLkivJ+cja+92NlUardiNGwqUcqokTzNnwJ/K7l0jnulocU
         GX2w==
X-Forwarded-Encrypted: i=1; AKwUvBzXAXnHd3LlO73mA70MJVzjxRmuEL5ZprZNYf8rbvbesAlmRdKVAxIpbwlLcr8Qi3+8t4QnEgvid80Thw0=@vger.kernel.org
X-Gm-Message-State: AFuF++kKG0SDfBJY68azZsbXvkGXjqaZqR1KdKRHjVf/ZPQ1aP/E5stK
	WMZErZFOB/ZHKtr42GRls6oPFReJ5Ww7m66gDd5ZJkncWm9tlhMF2mvU
X-Gm-Gg: AYBFou3g25bCHdvQ00hyM2IT6ogjXx4l1ELAVGMapo+a0BUQlOOaukDj2dPWZ7wOHtk
	/pmxaGyxs1S0IBn2HZvjmK67llrq85YOhMSIHu6PBVKt+oP792OKJqp2UPVhbvpyS3mnxjDjMfE
	CNYEvrTzzZ4hGdo8OB681t/dNm7Za2N6TFkpa2sOqaONjnVy1RnfWRgisVNFuaKYCad4OuWnGE3
	3g0jGf1sVG9gXp4FaC5TqOf7s2jIi+QWIAS+u9jfSSTA2OB6a8HjGRhKWB1SzFpkzWGswiGy4q0
	2o0KnHDlOTpSRpX9kM+J0C7vH/PPq0yag9ARmRx7bU9o0AyXV3oT391ZIq6ck89JmApiENxpH3M
	d2iMQY/noRUiF7XQWOYivqsDisUDPzIRAoGjzR5dQggm6BfFKtIPnAieU86ZOoBbVJRL74DsfZ0
	xIxVF4Td9UE9Y8QCtVf67hunFXeJIUBBmMNK9mJqymsakNZbn3YLE9jZwSjgEV0leQcQ==
X-Received: by 2002:a05:6808:3094:b0:4c3:2e7:55bb with SMTP id 5614622812f47-4ccf977b99fmr1600319b6e.38.1789698011513;
        Thu, 17 Sep 2026 19:20:11 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5226786csm295476a34.22.2026.09.17.19.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:20:11 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Thu, 17 Sep 2026 21:19:50 -0500
Subject: [PATCH v2 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-1-db35882a6080@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789698008; l=2681;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=fwlPkqstrQlpYtzSAbjI/xkIKHHpjI1afmv6T7fC7po=;
 b=miNvqU66NVjsZoTcnVnB/kgVEaxWAqjFh9azbHOFtnGSnkRq1eftd6rcrmBB+2/4rlXYfBEUw
 Zyvg/aMLPnkBOPbEyLLlzDeEXx4kS9ytIIdtF8pPiaejam11tPa+fMv
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MediaTek mt6397 PMIC includes a 10-bit AUXADC used for battery voltage
and battery temperature measurements. It is not register compatible with
mt6359: a conversion is requested by writing a channel number to a select
field and pulsing an edge triggered start bit rather than by setting the
channel's bit in a request register, and the results live elsewhere.
It therefore gets its own compatible rather than a fallback.

Add the binding and the header naming the channels a consumer puts in
io-channels. The battery channel is named for the input it measures,
ISENSE, which is what mt6323-auxadc calls the same input.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml      | 1 +
 MAINTAINERS                                                      | 6 ++++++
 include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h             | 9 +++++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index c2f7387e4bfc..2847bd5d5bc4 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6359-auxadc
           - mediatek,mt6363-auxadc
           - mediatek,mt6373-auxadc
+          - mediatek,mt6397-auxadc
       - items:
           - enum:
               - mediatek,mt6365-auxadc
diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c..41d7b3a67415 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16713,6 +16713,12 @@ S:	Maintained
 F:	drivers/iio/adc/mt6323-auxadc.c
 F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
 
+MEDIATEK MT6397 PMIC AUXADC DRIVER
+M:	Ryan Brue <ryanbrue.dev@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
+
 MEDIATEK MT6735 CLOCK & RESET DRIVERS
 M:	Yassine Oudjana <y.oudjana@protonmail.com>
 L:	linux-clk@vger.kernel.org
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
new file mode 100644
index 000000000000..b696c1cb5ebe
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+
+#define MT6397_AUXADC_ISENSE		0
+#define MT6397_AUXADC_BAT_TEMP		1
+
+#endif

-- 
2.55.0


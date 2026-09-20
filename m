Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75293D5C07
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789882326; cv=none; b=SgTT7hVU8WL1Fou5ZuDM2U18gfhXw3U7mdqQPf353kUhd4Ock6gDwH9qf6cGO8jSn+oupmF2lldBp0bLtAgFRITbczhqFRDjeXJvJmRFpryXbrsxkFOVGcUJ8+TRJhR/DYHzUTHZsnhPl+irRdS+Jc/z90anoATK2uUKMYhDca8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789882326; c=relaxed/simple;
	bh=fwlPkqstrQlpYtzSAbjI/xkIKHHpjI1afmv6T7fC7po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2PcLhYQVx90g1WK5tycwk0BrrhImLvmyeo+4DjiCbCdnqqHKp6+4AG25NuEe298UdYM6GcZyhCG/mkT1tpiewKPi74TtaE/exUtqXrfjKf3wvz1Jq90zTvYm/vpENYVOaejdtZyia+M9TISfLXMgFtZ5xvAab9VhoIbPlzKAJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2OxweBi; arc=none smtp.client-ip=74.125.231.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2OxweBi"
Received: by mail-oo2-f8.google.com with SMTP id 006d021491bc7-6b1bf394d3bso346715eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789882321; x=1790487121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=n2OxweBimzodcV9kpyfGfSjjlRiIknR7qOhHuila2d3TDcvB5dv+ChEW7y4BpshfHs
         NJVtHmifhQzvOD4YdTiiQifW5pLf4lB6qA2G+BVpvMND2t1/lAYh9f5og187T+9xSGm4
         hSeWTf/YBPu4Cdvp00gJl2kbRa9tnB/Rg4IjghbnvCovo/EbnzWuGZo5bW98eDsD7b8P
         NIs3kLb71TAITRb4Yt1GL6jkWu67dKkty92YQw+LNtedqJWhRH0P8BFA+BKOSjWi2p0h
         XznFV16k1gX7kXxvU3iuPqNAunvwZdT2o8/791dGue0HF7akc/6zdQg698N70SP13hp2
         +4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789882321; x=1790487121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=vyXebEu75U24C/nWTtgmNTmQaOdVjYKjCWkWs9XORIxl5/yPILyQ+AXqdnbqgLWoDW
         gXjQyO8tuAYwbXAnWVHYQ70AY4g6SKK2IvMyU3o3xpek24E/fO8HvmchyeXcorw5egJA
         zeDOwDf1nai0kvWlpxMr6C4svTPG/j8WVR2DyYGjOdeFWca1DC5Bb+hFHH0YGSf6jlHj
         N/NEda2RN5feZD6qf7Ij6p+TujRXo3YW5sDbkGlKxTIZlq+LkWWqwasb7VaYAouWXocB
         vO/8sbEQmx5tOh4oIbvV4NGiBXPFg8ImA7apCtoQbiGHiFgxasHIjBkLx5LNtnHCD+Lt
         BTeA==
X-Forwarded-Encrypted: i=1; AKwUvBzDX2BHDbb16xMN7a/tJT/SXmggQHgL5CpVFO+z6EAnFE3sNlhiloHJPNECr3/R7UOK7u7kWpLkgfk7zkE=@vger.kernel.org
X-Gm-Message-State: AFuF++koKJ2tmWCpq4eQFH4g8d1tvoNkeHWLF/RYLzWE3OywpX85qbbJ
	W7WxyUsuUec32dpbAujWHSqxCca1B4ZQgbW2zOMVwRAqie1UMd2hcClN4l2orHacvyQ=
X-Gm-Gg: AYBFou2hI9HE/Tt/xiKfcLpGCiMDj/NRJjDhbkjaOgTA6UjLO1XUWsCDp+MfdktjuXf
	/nkLN2tSAtkjYYJZGpqT6WcuBjc84NqJXduoccujbsRUE+sWu6ZVJJ7XYAxNCds+i1BfgrV1hxV
	rh0UKVHJGK3Hn/GRPyc3KEirkvzR380OpQShEXiE7aNIGLe+7GOxIqgm32uyrcQXBT7CDTnNsLM
	FcYJwAbIisczYn4BjDmQ4KnmT0qAj4FhC7d13vfK4oUKLv/pvU+rmzcnqqHU62FCJTT+lFDB/YY
	FiFnXSIxteQ0A17Nb3nv8ux0qLKrb54sBkryk/nh9ji+SdR+NhhcWB5eibLVzXmVRVIVDJEKeg2
	Ei06cUBJyb6PJ5qxwBVOslHEHaMSlP7gVB6TnECZ+B1Fa1QBD78gfwsF4ZbPIDMKVPYHkVbYhZa
	SPD+5gRe7gWr6rlQ19U32fV/39znFhzIcMdwvLKQksari4QFHxgGQY8wLzoZ9xegUGiSI=
X-Received: by 2002:a05:6820:c0cf:10b0:6cd:3fdc:6009 with SMTP id 006d021491bc7-6cd3fdc6073mr2569288eaf.90.1789882321459;
        Sat, 19 Sep 2026 22:32:01 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd3541f07fsm5007319eaf.10.2026.09.19.22.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 22:32:00 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 20 Sep 2026 00:31:51 -0500
Subject: [PATCH v3 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-1-c00edacbee64@gmail.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789882316; l=2681;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=fwlPkqstrQlpYtzSAbjI/xkIKHHpjI1afmv6T7fC7po=;
 b=Opl97KH8MrqT3zIoiO069ry22IpQqYaPkHHieyAt0MVeeRXmAV1cUFOzXcG3h4gqUISqz8ECP
 zcigdUcPK5ID5aT4XknZj1qigND/X/OZwurcQvc1nDaYdP5H9wRI4Y3
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


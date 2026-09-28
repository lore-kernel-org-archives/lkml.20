Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30384FC356
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629052; cv=none; b=UFqS55rtzrkhHu5oW+LOjNjst1CneyoTyGbh77lYYgCk+EMyi0k/ZAYQie3ISHCFyK0voiWgw+1PluRq3WEcbBCk47j/HtlWIzYNktRBaX9zaBvVQIOScMdbh4gQWA+XrUyNbY9+3z26Ak2BelwqkWcYWKXGOfJMcSA9Ua8vfUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629052; c=relaxed/simple;
	bh=3JnyJKWel3/w3iLfxdhp8EfzhB6f91NxerOyNOuEJFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fj5gcGucyhmYkiHt2qNIB2KRTl8ew3tX1JVkqQyqXHYS1xBxCt9gvhMuSrddZcc9saoBXw+kCAVY9laNIUVzG4DfMj9+jU1SBTDgu8jmEm7VILPHHiN/MWUNR2GwWa49c6jtTV8+IjUK+CNVLFRBwuyS9CRNzbM6T119A/2w0+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzyERUoi; arc=none smtp.client-ip=74.125.230.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzyERUoi"
Received: by mail-qk2-f8.google.com with SMTP id d75a77b69052e-53333a2f1d3so5450351cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790629048; x=1791233848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wa8W3OLkBGqzASUkXu8RiR+bwvcxHsCIsQEXqgkVDWw=;
        b=hzyERUoi5F0uY6x7I8YAlgOeumEE55fZ1ekGQjpoJfRrkWMoA97LQK+ukOHTlnrdla
         ly4ySVG/SCP3JuhjoTs4HxUT39Z1PoaQez0FgoepRoIgNsDEVpevMVEJc8sytV1S0u99
         pHW1wT4OHJIEIxT+YdgoiFt1oew+/4ruy6kd6y/pZL5z9RNrDyVN8TRRTrSrijyA9OL1
         2Wt95d+pQW86G7eMadt7uGXgDHa4/HooZTzz3kyQziWc8/nO9mu5mpwoeb4RaasUn2Hn
         TUSe98r5w66TSBZL/1YjDXFBUt+kBPJDtdaKiz3X+MgFmjyJnDatRAkXiTLQqDD0+1WI
         yZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629048; x=1791233848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wa8W3OLkBGqzASUkXu8RiR+bwvcxHsCIsQEXqgkVDWw=;
        b=FaVgaja2XoJkT2jA6GNq+2FYFLHwU+pXNRlpId+OTTzg+MguWPyinnwX9U+1HMVLYK
         /EP1k7BsXSR0FtHopUT3gsznZPbJzC5gPL+LfoJsm6oyp5DTyCJbxBIDugDZDYBnFn2Z
         JnPTepqiuhGzf23FkRZ0/Au6ABmB/1FHK05l8UpLDzJpHD4VstDYPIYZvYoasTLODEj5
         FUod+U+jX0IaAGkkfYYUlZLfm4jW2si46fK2KPucrDOOd48/KsBIF8AfqeKErWBPNRe4
         wp6FtjAA3WOJC7Ko3fHvWn+j96hCqw6IVCcju1LeCRdixpktEuZ/dvd9yL857TZrUWz0
         +ksQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH/Kfvoe5DjL+TXFmPJ8LxshrIYB3WMJlLegi8v+W2xMEml6Qrq+hZgC66hZ1ATUOmXnS1/D/P4amBnCE=@vger.kernel.org
X-Gm-Message-State: AFuF++mBnUa9AGi7E0htHnDpOeT7HrPeCPjsMWdibTdBjUyELYQEe6QZ
	7diOqlrwHJkEAH3T0hDmLbT7d/BWIRtu9oNWYAz/KDCj1vfAgfoJuJ/r
X-Gm-Gg: AYBFou2k/1pWuxnDhaNH0NTi2dZ7WBMjf3GQhyxdOmLO2PDsqDjkuhIxlmI1JgoyZKA
	CaKMevoOsw3gZpXjDAtsK6BDFU27Qd8Yenc6Rh0CW9Fv6Tt5c5wxRai5Q4HumR8QkaPtU9lUkDX
	01dRid4MPNbJV3vm7cLFYXVp7E3pcpBBvKO3pTsJgWuqyhlIbYbZuWOxcK38Nu1h2RNxbdBkt8D
	+g89R9AobQMqRxC8hRGKau5NRvebQ2fwxyCOc9S1mWYMv7qCtcgCj5np1T2/nyDwy95eOIKHhh8
	88n7iH0GB9xAczfXbtsrrR61A3tep5w5ml2pgdgmXq5bSZyaHFziskL7BEg/gAoRkVtkA5/DZHD
	0Y7U57LnHMkxFcOwOUVjpTpOnZlfwu5CHnAx0gEBL/mJMlCJl/AX6A0273HOGGbCnALq7nIORGl
	4pTB7Y2U9CagS2sq1laQ04hahBWvzTXKiqtaKY73/ZCLnUWlL0K/O2Udw18tF4VPZ6+aAjn6MVT
	9BwUAdjnPdeg31ByEXD6BEeJArhkYC1SUNzvUuw74qJt9yZuz4m4AGOa4C10N3rpASN+womh9w=
X-Received: by 2002:a05:622a:258d:b0:533:2daf:c0bc with SMTP id d75a77b69052e-53357e0f58bmr10788381cf.0.1790629048636;
        Mon, 28 Sep 2026 13:57:28 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223c6d82sm71443421cf.21.2026.09.28.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:57:28 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 28 Sep 2026 15:57:19 -0500
Subject: [PATCH v4 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-1-23533a0d30e3@gmail.com>
References: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
In-Reply-To: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790629044; l=2834;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=3JnyJKWel3/w3iLfxdhp8EfzhB6f91NxerOyNOuEJFg=;
 b=mway+9YBw+26uBdu0PB7mYGQXaUGyQC3x7jQ8ufOCuQmaNxG0dcH0uwuFpe/vq3Gqb4sxO1sb
 8lrBzk4tK1SA9ZB6wmkNkdeNoWX2sQSqFh2yshcMGc2zdcb1kWiQ+rA
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
index 72294ddfa5b7..c8cef3bcb7de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16715,6 +16715,12 @@ S:	Maintained
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


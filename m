Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792905496;
	b=YPTOpL7HpF5BHKEa3ic/I2zolQRkktLj0aEvPPVkIQvtNBE9tWXCQ+qKmZ9c7IOqe6r/
	 Ucjg5s3CyiWbxfsyoAq69Qb43GRYyS2F3wQgfXRkDB0RKkGRzZaA5hN8E4ZAVs4oV8i2M
	 CZk3JWX3QT6ftN7v2+YkNnbq+aSOSSLVb2jypDan0SSwqgEA9y+gqo/Y/BkSXmAOEurEx
	 eeVX70Jt4Oe853vZLCSj+IN2jT2XZzJA6zf+8CJWiAqlqoTkuZjvm7VXLdupzbuzfMw6V
	 HszV7G4JWHdruNDrfBvnDqhQYcmQkt4lwsT9geZissX25gxlg/+l2PkcoV4ZPa6vftw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792905496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Ao0LzEZOUNstisYoUSRpO7xtRQdZ2FfSYO9nengEgWU=;
	b=yLvV/sa0shhuV0j2dZB+GD6L27k4zc1GiOqEgW9FD3P/zB/s0WTaHJMBLzuUTBSqDbwp
	 jTaFY5nN/AbQTig98ARRe/VmdKA/L5eYAHjfDlczfz3WMTXZxr2VzWZRYv4NyM6O213+f
	 gM/+WzIYwIxe4ndjApCKyj78kdQwoUU7+iGQbBfv0Reb/ZpVJ9cmWPX7oSaRC8qqe8AeL
	 eAHSzrR0GWjW+X8A98HlTJa7n7cLZzpV/rLSkiF/kntpVKsVgc6OfJ56REe94y2intp7j
	 8C5d5V7Pm2+Cw5p/+NnKqDNRDIvn04yRLfwHIAtoK2fQLdC/uU9DuJj2T0ZvO5SKQzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E2Y2mH3y;
	arc=none smtp.remote-ip=74.125.224.129
Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C380606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C380606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E2Y2mH3y
Received: by mail-yx2-f1.google.com with SMTP id 00721157ae682-8b0b14dec7dso2403877b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792905495; x=1793510295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ao0LzEZOUNstisYoUSRpO7xtRQdZ2FfSYO9nengEgWU=;
        b=E2Y2mH3y9BR6KBrsEgj7Sna2sKPp9+kmOOJJM4cqS0AN88itfHUyGGAIFtcLfpKd70
         0xfYWCBIxeB3ADWEVUvcXMz/u6JdJvcoYeZAWWrJUL7Qx/IMaTAINZn93dTnbpjszQUM
         /9IiEjGy3jHj+qDM1OrSblWbhfSdliqBbpaDaqjA7pSM8yBYGBmSJfPPko53WsXhVRvP
         Ohbj/7pm5tYKJE6OQslsfo5/82solLi/PhES9I4mniBLrWzN5/1fnvEoDHMBlnqVO8to
         ahufBHThVj58T43LabKebXpghhYtEzLMpcW3GJNX7iKAlkcRc1+dVtUz+jrpSRXl1tQL
         YXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792905495; x=1793510295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ao0LzEZOUNstisYoUSRpO7xtRQdZ2FfSYO9nengEgWU=;
        b=A7or6UFxjZ8sIniKRtrQi8RsWr5LyfChb+UVjaeHJn4opGuQ93z9n0Ohhi5trynhzK
         VFnj0PvHS4ca3/5AMrvxt3AcWLoFUc3KcGD5f1Z9iNVTfOjxoR0XLhB+WivmmI4dB3To
         VHN2W+KQUblomuCWL7/BBFMurNAYNQKLQcfmgxNAX6fhosTh9meXGABXz/Kxfzx+aSE+
         jTxzoSUipat0ZuaIDjUZK+3ipINRov3Aih1qfubFDvE+D2uVPLVAf1W4vcEFh908mIIF
         WfrXTbtO4iixhTboXmJ1GOGoYRo1XMfYZ1udLP89TpqreR0E+vkNPXl3z72IfBjFkVJ9
         j+Lg==
X-Forwarded-Encrypted: i=1; AKwUvBy2vR5wQkHvI43a7bqgqPOCAN75Qaqu58KCNFz3dNmDqOkFoojnhIkVCvYwADa0XQ1Uflya+WittKCV1EA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEUCehL2dPVJAbx4y/8exjD2kvABA1AX/txV0lSKCXmL4MPgF0
	//OvsK3dcxnTSxcj7rt4b9lu8DnVTf1JV/VHjjSceLYj7RnHdKtZqzWC
X-Gm-Gg: AYBFou0SOuX0Wo2tzCqRELz+LIK/WbfcC84GCs4BuypR9WAofWVPIdd7+mxm5NKeqPR
	gXgqFv7InazvsDb+mkx39bmtWF8uc0tF6cir++wFpWD3/dAZvmAauesHA5ltLFlgGEj21A2E/0F
	u1CUwrHSYPFh7GbVcbFDn9hG36gEXZs8QfdbdotFrcMfL21Kxc/LeHPF07mtl4ADgYyHxc5eR50
	XSvoksBDqhtPNeV4C8gvwwq5jbPpCPU+AfAM+lLWDIEfMs5ueWjsRXPz9gmPWIqvGJu9v/GsRy3
	KeifCoDL2TMHDmwPYKbIomLVgnDVrDSqjuHPHJ4oQOK0tXxxwnz0HSVp+ov/EqFZCkENNaeKyJY
	znFngEUcFb9WbT4G53T9ShDWP0HM69Po0ZgOf6vYOWW7qcQLtN7IIjZhXIOsJzGpLiJidA3E3Ti
	FUd7a9kuP9ARNiKgk/Ha/Qu6z+i7IHtag+2gA64V5w3muSzXufh92jE5drC1+Hibys0wbsv5eCd
	uzISSQS4CxDsgcdJh+IvsXp1osTco4FRLCotrgjy9fcWw==
X-Received: by 2002:a05:690c:c4f9:b0:8a0:e27e:8e75 with SMTP id 00721157ae682-8b166c6f987mr22449797b3.82.1792905495289;
        Sat, 24 Oct 2026 22:18:15 -0700 (PDT)
Received: from [192.168.1.91] ([2600:1702:894b:4a00::12])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166c5d605sm16477797b3.5.2026.10.24.22.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:18:14 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 25 Oct 2026 00:18:08 -0500
Subject: [PATCH v5 1/2] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
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
Message-Id: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-1-5c3c7a5a1851@gmail.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
In-Reply-To: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792905489; l=2798;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=JdiGQh0KVm70DbIkS0pQKFBLtV68drIsj5z75XBPwxA=;
 b=YQht8FlXebiSXOai3WM/zuvpDL9fEatxuBpgvv5MqOVMjp8xIC+PbWFLP4Kp0ZyoptsaARv3W
 OS3S7UU/Wv5DKYeQ8hVE8LNFldXHmNwewYh+zNK82rW2cP6MJ9/KpZd
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
index 02426f316faa..b5417c02eb01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16780,6 +16780,12 @@ M:	Roman Vivchar <rva333@protonmail.com>
 S:	Maintained
 F:	drivers/nvmem/mt6323-efuse.c
 
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


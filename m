Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650395;
	b=a+1CD/mJIymwEK2XhJ3DgP9eTEqS/F6/hclflX3wokV2Km9PabWU7fxyObFVN8D1QUAm
	 VQ8YZLLhzs3Itp9frrR/+tej4BUdEKra8dV1nCiW+8efuJb8mYfCLXV1Jxv3Gn+v8tO2a
	 vXCCoZm5FFeaa5oWXMtlSvj0PnAbL+kRhA82vowLBzcZtXMhzIIjDB5q+SHiST+PYUgLG
	 YsmTrNns1vjWHwJiQhCE9ZuFDGDPa1Q4pG0l+VD32ORv3gKeKbRQAbTHE+S/2eMVPL6vI
	 YkyWHMS943bFlgWwhGphXwKOHc184GSG/UvuhQWPbNBCEqlQgvXf8urtmu2EtuhsRXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L2gEpleCd13p+gM0N/gkP9xykl7jsD9jHrOnDwV/TOQ=;
	b=fbrps37wWImJ/4pGQCwbCgrU7FIt7wuflGRlvA3p+W0EVkFowHj0kPmFYqUFUCG3xvK3
	 ynnpyiQxRaP5WndWPnG2aChw0xibOMU4OVQXc0+WRi8n68IKJ1lW/h7D9cRQd7MD8SBC3
	 xCJrWuEnPlLzww7EaUkz+5ulrJ8/NJnThN27rUV1GTyzxXpQbOdpUvHFT/53DAJxZe+iF
	 g72b70Dw/FBBbRjBghEMZbB4r4bIvEchcQ0uNyN1G2ILKew8PK5O0P604dWjFnKk71Axu
	 obb1uAjEWH0k2PFEvZ8swajh0COiiNM04MzV5/XGBEgk29zxJCfXc3PdkufDNTj0wpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MmSV0NDv;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96EE606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A96EE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MmSV0NDv
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a208d93758so36579695e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793650393; x=1794255193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2gEpleCd13p+gM0N/gkP9xykl7jsD9jHrOnDwV/TOQ=;
        b=MmSV0NDvusZz1hnlGyvqH9FGRNZmkYXSSPUBGZ9aWE8hBkP1gA1S84f28JHu3Q+fx4
         BbxJzw8iFTkIWHedRtb5zP/sMHHyw0rS0m4/9xpAzCKQlbrJU+XJ1RFjP7Pts+malEhH
         GfC/iGJ/b/NZWaY2nrOZr64AQPXUy6yb/miV725si3g2Zq4p5UTTGejXX8aJEhQ6RoBQ
         FSNl2DzJ4Zp09b7qEHkWTHLcvUVjibmtc/3OucJfYU12u5xUQ7Ms27ql10t70oIiJyLP
         v63o0HjQGe1M1EHsuyGHqtieBL+2hLHmv/9iqzRhPj/INNxY24a+ckyrqtbOiBuROVuR
         znRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650393; x=1794255193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2gEpleCd13p+gM0N/gkP9xykl7jsD9jHrOnDwV/TOQ=;
        b=bvo6ryNXDJs6PRPj68EYJ9OG8rw7CwY9y8c45omkHpXcTuXPuhSg6WnaNDBdFS+y/I
         RFqgbXvfNZZ1z4JBpuQFGnu3TfDywKfkc8UZaiHsJtT5AdmDRmu7nY/5o4QGxpck9Lul
         MbwgIlJngC2idh2LqXfhBMyH72iZaqyyvLpEyFvWupY6IdgTds7FV4VtisMOB6UBLBv5
         U9DIRVy1pt+knjx8d8jzdtxIsKZ0n38MHdS3ZduFmCs+Jdhn5vOY5f+VHg9ieL+pi9F3
         aHTyKIajT6UaG24cF9Z+SCAGBLHt8Gcf8kQcCrdf3zG9p+ZEvDWSZxWcB0ZoBj4f2UO8
         K2SA==
X-Forwarded-Encrypted: i=1; AKwUvBzsAMISzhF33VNbw8wMG1Mm+90799mx4d/oiOXO34rnfUkDQTPUGqCNTdBTLo+Xj4E+iW4q7zJNW4ACWzM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLR8G62s/y8NUVjjgyBOJMMkZ2bvkdsXhfLlIKSQESNuowB87fF
	t1iRu+15LSiai/0rTIlf3KUIIc+ZtYaDA1r0aJ+FmDaUoRLTjEveeqUXhveD9X+g0rI=
X-Gm-Gg: AYBFou1haBxpV+sr3nm4w4X/Zo7dL19x4DWf2yjCiH0IGv5+ff7nklsABBf1yqsSCq2
	gKZJK3OHnB3mfnaMMpIPEiWyUJCMa2HXOPOMJ+ygpFRI/Y8ybMcd/CP5z91dx241cTMfKU+8DaY
	NYJideH8Y0f+lzdBzaR3gw3getUJ1jmJJLrbFwqv5tkHxC4O/6FCB0lR9Vsxp+JH+Dg0ABkmeIC
	TGHcM4rqrtaorc5HYTOshqyXKdj9YamzkFl4JvEHBY0oJx7t9GA5s/iChuXQnIfeNRdEanFRBWW
	562XKDSD9g1fIKfP+WHA7SuRzHcAqeMDlDQCtduEOvGugrHBNqGYIpZNDrZqvTtzNvLdgixf8DM
	QE06mYMl000M63z+vljpMnPO7eMhlFAUp/WnCAQ0p2mXdsS7h/kXJh2J0gyJDZ7FRG9XZPqUh6h
	3ckVlDJ5L6DtLlptSPNaMGEc+j7uM/4ZfuUuprCM0aiZgiPvW4xcUiSUANvZ2xg1vNlVzebn9qx
	xD3ZYYutX2JWdSfzPFzByXjugdT22OCCs4nZuomPlNkhqcSPwUzeJF+WNvwiKohz+gRV6rNyhJJ
	e6XbqYxoDYaNcGWSude1K3QQCLDsqQXrsJKk8JZH0rhhxw8WikFtGNmbI5As
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4ac17d168b1mr286479175e9.11.1793650393215;
        Mon, 02 Nov 2026 12:13:13 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6412:7406:ded:3229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm13969155e9.2.2026.11.02.12.13.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:13:12 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v4 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Mon,  2 Nov 2026 21:11:54 +0100
Message-ID: <20261102201155.10948-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102201155.10948-1-olivier@mgcrea.io>
References: <20261102201155.10948-1-olivier@mgcrea.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X1600's SAR ADC has four auxiliary channels and none of the
touchscreen or battery engines of the JZ47xx ADCs in ingenic,adc.yaml,
so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 53 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
new file mode 100644
index 000000000000..f6356ea97980
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/ingenic,x1600-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 ADC
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The SAR ADC of the Ingenic X1600 SoC, with four auxiliary input channels
+  measured against a 3.3 V reference.
+
+properties:
+  compatible:
+    const: ingenic,x1600-adc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  '#io-channel-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - '#io-channel-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    adc@10070000 {
+        compatible = "ingenic,x1600-adc";
+        reg = <0x10070000 0x30>;
+
+        clocks = <&cgu 28>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <11>;
+
+        #io-channel-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ecc22d1149d1..fd4bb5c6bf16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12925,6 +12925,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 ADC DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.54.0


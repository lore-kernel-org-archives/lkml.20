Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962467;
	b=lYVb4Wd1BZoqMZ8eH5bZWXatE+YYEjMxKwuvPsiIJ8BaRjThEw645Y6bkALdJyLkgvFd
	 FbrKk6zOYgCXV40dQlCgNblRUFpC9uWKm3Db+Jsy0VFSW1NrtyytQlua6rI1q3hN+LWUm
	 SPJcUE042LYuzxjHssbTieqo2srI79udTxeVLOGUVs6K2LEIjQYvRok2jcj6TFQsq0Jk2
	 AGSvVYsdzqbk0kUet8pKFyef9jE7p8pyt48l/1iJ2uzPpQqxgLc6PWCnWUR+B/D4EC1sL
	 BP+UQ0W6PnrxZ2uLH/CdtJz8caIpeitrHdLhbXuiEmORV3YB/3qO2g9pNfGim32Nefg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5NEqsMSr3pHjqorQElx9gtqmjSxhKtX5m0i+RDOSZyI=;
	b=awTBC8o15Dkhq+TEE2e5jKntNEyum860d661U1I5VNprMyz6UIhEKDy5VUVzumq3h+6R
	 rQBBAmFqvi2D/0RWgPJ8EDyMbPQaP4+9/5TNwdudnw3HcNsGr2M1Rfpbb1HS48dJ/AWhi
	 /fSXsrySPb2x5GcdxUcfan5mP/hm5kh5Vz9bDIu6uBniWo4aS14NvoRp+sMEesLNuWx8B
	 D8pPSgrKarz2GpL/xvxDFHo+GunqGIcEUxezsxPq+3dnID8XwpEGI8dViz6GAZPC/NTzC
	 5CKZU/pdSULVlg7kv5jawoJWGIezcxq88SqXW2p0YCCqTAw6BpDzH1LzrXgqC2nJ0UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iD9Dttiy;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA82606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA82606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iD9Dttiy
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so4982715e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793962464; x=1794567264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NEqsMSr3pHjqorQElx9gtqmjSxhKtX5m0i+RDOSZyI=;
        b=iD9DttiyokGWik/9lX7kkjGlj6NpUKTvyqyOFRbsvGvAn3SQU7WzguD5EG9JtCHUg/
         /hNC5Ls1yAVelLYySciMLDUyIUeKEUde4sxJqCXcaSc6mNWV/ifUyug7cPQBR03EW4hQ
         SyANdz8UiuD+iTx1FYEEl64Wk+jgc/rsM5YK/dzKMtevh7f5yfZHOo6dGGXrNw0kciHe
         3q0QDYP8XfkG7rQKkfqMPUlfwy13zlF2E4qWDrgrCdsUubVnGcpe9bGw2Bh1wyM1eNol
         5djgFmvx6dEPXbOnCkTQa1C5ZoBtfr/3yCyeWapWOqcPEf6y4x6V6UK/I3T+Vfr2WDOf
         k/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962464; x=1794567264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5NEqsMSr3pHjqorQElx9gtqmjSxhKtX5m0i+RDOSZyI=;
        b=11iFyC3wai6DFA59vAsvLHXE/DjKdcfKJWamtK5Tp2t6ZcWNC6zMAi+LQdCcT35eFb
         xl3YsrDhGBzHuBzOepiwlQUgYXJGI/G5F4BYZL11uIbeOLm+XojN4d31b1N//lggdU6f
         fDF7i18PViFO34RZYrDfLV8mTEf1/Fj3LF0DGbkkabmhXjWTfgN6yu/R/9UKQZYM8VUi
         t9JNmUOXLp8bhwp6JxqUYNTUQk8ayMYxdD3N5a+tW4gvphZdy0tEJi31wA6wyT/y7umB
         vUaOO09Oh+qmd0HYVcpWlAW/hEBKFWzpGVhirkwHAKKVpPGxdvewZ+2i5b5bPyoUi2Ll
         nenA==
X-Forwarded-Encrypted: i=1; AKwUvBzDsvfUSZxkKcBz4yXvmpCO57/L1v9f6YANOK5WPrBjWl38oQ24xiQliLF3M/XJmax91PLAofdWV3AH6h4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MhSxdXlU4SC50oVkRMZph1o1Knx09+s57PcG+USyDY9fmZwkG
	CVc8fY1mK+ErY+DD4Ps/2N0jd/4Eag5Qsvm81XPP4hYy/9bXiap+8lGRIQVLooqfLwI=
X-Gm-Gg: AYBFou3ADujG+YvBZLpVRNvwi7p8n2ZqpOy6w6ZyRhqohi3w6TQ/8Tm11oM48lnZWwi
	vam0grsgHZN4RrhjTqiD6T/v+aK3Ss1ubK1JC0VD03rIQy7iiw+KQXIzcmXFBvSa3eWHQy+uVju
	p75d7MHPMSoIFXembdLf31YfP4I1oDMhGCUQpB8T7IZlAzbZ/XSWkiH7KMmjdzv9VNO8jiRkaxV
	BvJmPvEppKE880QCNKzCZT/uUOM3fB/j6jmv0eIzIcf1HgXM1ou9vWMvCWf0vf1Vj8C5jjo5ZQE
	Bi5X5wJZVA2zM9F8y4JM28uTzEpaYyAYmwLI1/PA3tSjHLBrbMI+YwNahBUkQzHXqjrDTGWv+yW
	V2oQzznGyxzaC1kKcdWF3ke1IRE08NMce8AgEXUaP243MhcgDL7CxlC2zYmJOedGOSoVh8gS2N8
	pSlUhrgSEYOvQCTGgdvU1T34EMdv4sExcDrjtQVNspyCsRfBcJ4Z3/OS8zmpfcEJCi1EK6Y0Rjr
	xQ08ue9urnpleLYIZXa7KYI9zBe4qMrwxcskNdB5YrDtinqnN94DWlV+w25+uqA5Cbbs4ryW9AD
	DWybnVf5NITQ7ugn/FbpcqIUIp+GBgjCH6oIaZQuONUM47TP4xb9qTSeLEU/WtQ=
X-Received: by 2002:a05:600c:4e41:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4b6dfe8f3c1mr33593735e9.26.1793962464578;
        Fri, 06 Nov 2026 02:54:24 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm125584065e9.5.2026.11.06.02.54.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 02:54:24 -0800 (PST)
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
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Fri,  6 Nov 2026 11:53:57 +0100
Message-ID: <20261106105358.59616-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106105358.59616-1-olivier@mgcrea.io>
References: <20261106105358.59616-1-olivier@mgcrea.io>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 59 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
new file mode 100644
index 000000000000..f5d4726fdbae
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
@@ -0,0 +1,59 @@
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
+  measured against an external SADC_VREFP reference (typically 3.3 V).
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
+  vref-supply:
+    description:
+      The SADC_VREFP reference. If absent, the reference is taken as 3.3 V.
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
+        reg = <0x10070000 0x1000>;
+
+        clocks = <&cgu 28>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <11>;
+
+        vref-supply = <&vcc_3v3>;
+
+        #io-channel-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0017755f593b..4ab4ae67f788 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13176,6 +13176,11 @@ F:	include/linux/mfd/ingenic-tcu.h
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
2.39.5


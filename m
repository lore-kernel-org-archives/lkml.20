Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E12A31D367
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112706; cv=none; b=SbIKYi8Oy8tKUR75KhfNhE8EbX1sKJD9DQUB8DI+b+hf0YHaiyvTDIK7eYcp2VU7TwaKQ9RrmgrHLATuJcnCvDX6AWFZY5qeF6+13Qvk0+LtZ1DCiZZEP95j8uimr3M71Y1lyllUoox74pax09WQ2um7DmtZNlG/q6HcEx0ow3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112706; c=relaxed/simple;
	bh=O8MDKZM6orbok+3kIkwxaUSh/e4nFOYJeY8hZUI/E60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GvrocyTipNeNoAaQZJCRYT9GY1Oh+dq2dK7PFiMF4arTMoOj2sy9H6ENB84jFUTZbu4d4P6dXU59KUKJ+qkl5/cx2e74FlfF/hSyloZQYzAurWTRTD1mx6d4N880ROhORk01q5dYykOUh5FFDLSgva07Iqmw+YnqntQUdqVeFuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IONcRzMZ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IONcRzMZ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-88b7d853b11so1144303b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792112705; x=1792717505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=IONcRzMZRqog6BoQgnHuzD5yvx41J1B5NXNpjuL/sqqj1+xZVB5c59/3dzDlDl1058
         l2JXphvYFWmyUYSsKxp7PiKZn1+YXoxUETY1St0bU3ZCyqWnnS7mR5SQ1br7xUBEPHko
         m//YgfCyEVi9h080c5eX0FLjazEkmLo0ZajVK2LRy/en/5lwQEx8Ufx8EiXeoXw9rqYU
         d667dWjHZBJm8LQnOzL4aWKpgG/05FaB3HH8rSkqXU8ovYes8j85ang0AcD/cS4Eog7c
         oQEsZtxtqB2yeBgV0GQFGuYT2UTlf0Ltea/deqPpqQaMee3+TddlVIFl2bio/5xAzavE
         z27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792112705; x=1792717505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=JF/cXFld8jCjdL3QwlGbXlhXgMwcMN8rvfo+wmxeDu78of7+F35/p0xB2YaIRo7WS2
         2nCt9wOgGP2uLpkjS3eWesgldb2MuSae33IST3/FC/c4VbKBRhWkSmyKmOBfoJzpp7xZ
         vX6mxdruCigAUudr/GOBDgcZvJBr9CV7zxTGOZg1H8Ic/wUDWJIiNdttTXNw1CjOk5ny
         LviqrF1p+YPg11+qSlKhgdm4QzfZ6zhSdKyFZYbTMWKlCuX2QIYWoyMKSDRmRIbQyRre
         NtH9pQAD251thmnMOqj464I7ho+Ujd0jkahCz1iMHmTnm160cFWt8NlQ00eZG7jFBokg
         9Wow==
X-Forwarded-Encrypted: i=1; AKwUvBzV37ToeJvImK9e54xJgcyG9dyxDQ7VbTUFxJ1DTtmSKOqMiPRMfpK6eIQttBYWzPPOYbZYcyJ1HntHAYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbGJtxhbecIfz8UODVhhgPAl5pAxw9UoA6/PJREvD+pofWcb02
	BaM5S1fkFMdWq1wrY5srrDZ0qm/yH4n6KZ5bBUrcadkQHzWkFQyZLacl
X-Gm-Gg: AYBFou3ExE7V6ZOXKRA4TalAbEyJauzd7C9DO+rqHtY9ijiqYHraoMgMswTkbRcqZqz
	MNlIveY32oBiq4bpG8M93t44WoWnpv3MONI06K2BhofH4A5xQg8Qu31gv90qI2iApkhQsGB7rZl
	+9VQWLVO3PDr2BKwHdhmDY+BHvCi9UgtEYhPhlxhWFaEJMl5BvmXklKCMfQtMPyPJKkRsAkiqef
	h/pnA1wKxbTrb1JPgh/DcPaZiNJ5TeiX+B7A6aMkmGsHsl0KIBvIwmCe1FGsc8OtL0+CS0OGmkb
	kL4k7/mcVj2vH74Ht1HUlxu0e0NNmvYgIgdJCQpcXj+rXES8H8YtPV0A+gjDWZcKVyVTeYg2fs2
	eatSo5xnYH1BXLK/68xhmsSDwnT3c1f2DRZIr6gGDfz0De9k0876KQsfUpesur5T0Q6xH9aw1h1
	XMVrUVV3VQM0mNmWHEZ1UqOb5WvFPWGelmeC0OGcWAUVVZBYgDaz81ECktpy/kEr707HYlpo+E1
	OtuL21+BN/JvecDzY1p3d9kuet8oIZV13kEiEJso6NmTRsF1LAEdymW
X-Received: by 2002:a05:6a00:983:b0:89e:8423:6863 with SMTP id d2e1a72fcca58-89e84236d2emr3324731b3a.37.1792112704665;
        Thu, 15 Oct 2026 18:05:04 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5735e513sm302821b3a.27.2026.10.15.18.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:05:03 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v12 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Fri, 16 Oct 2026 09:04:46 +0800
Message-Id: <20261016010448.324856-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016010448.324856-1-zychennvt@gmail.com>
References: <20261016010448.324856-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the I2C controller
found in the Nuvoton MA35D1 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
new file mode 100644
index 000000000000..0713e1c1ecb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nuvoton,ma35d1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 I2C Controller
+
+maintainers:
+  - Zi-Yu Chen <zychennvt@gmail.com>
+
+description:
+  The Nuvoton MA35D1 I2C controller supports controller and optional target mode.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Desired I2C bus clock frequency in Hz. The absence of this property
+      indicates the default frequency 100 kHz.
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    i2c0: i2c@40800000 {
+      compatible = "nuvoton,ma35d1-i2c";
+      reg = <0x40800000 0x1000>;
+      interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk I2C0_GATE>;
+      clock-frequency = <100000>;
+      resets = <&sys MA35D1_RESET_I2C0>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
-- 
2.34.1


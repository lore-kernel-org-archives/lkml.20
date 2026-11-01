Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547675;
	b=0MOnAyttglSi3mnnZFNMRGUZ+9RCHhKE1hz2c3YCmYSDpmD17Ik5UFtWHj/2MHK0RxQ/
	 j8y8TdtLLCC7tUeJPsOZWXFxHAxdMMQAZzFqmrmd7cqngQke/ZC+cqAl/C6u2bZeOl7dW
	 2+6RL3aGFg+BXfD6anGRx1f0zwQOSMsH3aXAlYhwhaHOrWz4OI1hB616HtDdQ7F8LftGs
	 UJkQkEO43oaQIE3oz8Ann+qDwqgdFp+luvGKl223f+r9fSjkXmP3arTzxdOvLdeoGnsUK
	 KgGOAXTB19Eww4BZv9C4YlSb51nto+bsui8DPi9SuK/rlLfAIKkz6EgoDpQTiv2v05w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0lnaBOUQQ4XDI1nNodunw8QSDiqgsme6k9gqV20nFXM=;
	b=LpL9O8V2/4Z0bC8Qn/XZ3rST4XI3xtH6hHaKApfOex3PTJoINeoAIUYw1X4BNuMZ5OJs
	 1f3Uo54THaEI39fMadwuqZNm5v9z9QmGapt8XTyHiXNp7YaIeWVpI0A+vQZTOmgBNxgbm
	 yuWW5saS09LLpO2nLFnFBYovP8o1lEWFGGo9EC7YtBKHIaitBQxusA44FJ88feVWqFVOK
	 p1k8sYs7xiBm2SmC6TBMaQPJy9HtEv5t+HBnDREHyH6jFEgJ4OqgjCvjWVoLDEg+rtV5A
	 tI0OAxIjmezmPtYpVY7RsJy+w+B11CLfWCeIT4TwPdkv9zt6O361bgNqg7MYmaJ02xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8qCQHxs;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B405E606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B405E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8qCQHxs
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso854018a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547674; x=1794152474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lnaBOUQQ4XDI1nNodunw8QSDiqgsme6k9gqV20nFXM=;
        b=F8qCQHxsnJUexYLUijluUTj0ujitt9XSRYWb9YYBlHV75TG1jKhiZb+1DLKn/sd5Qz
         YKFPGKeUa9q0sCYuG3C45tAijz6AGntbYXiHbr/+b4AV85iTas9pxyPYpbCPYl/5wkPz
         QLQk39ItxLRkWS2C30gz2KFiQ/hKfSsEnAXVUT21I1B/u5Pw1bM6/stlffbUJTbvjMu4
         VGNTKpjJtvNZnTclpi05ulPX2nNA0nLTyZnpbIqwh9nucI5uT3ga/dZaui+Vdrb6ecNv
         qQNqcekTjOBgfFO9GF3MdCisbAaOsHWOmiMBaPG3HmrDtHn+xY6trCZnDrNw2kryvsAx
         Fj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547674; x=1794152474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lnaBOUQQ4XDI1nNodunw8QSDiqgsme6k9gqV20nFXM=;
        b=oM16uy43N+nmR8YbVPeAY2Tyv1MmTIddCncluwrgPTrlbFFgWbYaKvD5ubBkIvcyYw
         TdB7jMgdcqtwFnUfyPZvYHKG55L9bp+h62W1YaQQFHfaTrc0TaHojZqGyvknIwIGs/TP
         dDE4Gt/nU6KTa1zdyO6jKhyp2mXHAqPZdDdDaQdQd5l7m4QvIDmaM+Gp4l6W+utZqabW
         xvfTAqpYrv9HT2H6df6hcOhVSe0XzEENMJkcmHFLfO++EH60rqcQRj2ZqLqh3oREFLRa
         bf34+yd4y2164VH+s/KnhDxpa0R3eqYilwvIVOXxnZWUhgEf9Lf54lUIfDjWHygRUHbz
         /DBg==
X-Forwarded-Encrypted: i=1; AKwUvBzh/qgCfS7MbWv1rrfYORa3RlhIMrIu1py1ZvynNpf2UAgdtkTNS7D/O53sDRUM8xiHepXS6I/4eOD7vjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BQKl8ULBStKgp0r/JtvgAmF5wsa4ihpAyCbOYG2hWTHvP5LYc
	S8JCh71EaptWWKojR/AIHfznxegB7netpAHtZyhP6gdqkY6xijoPdAuW
X-Gm-Gg: AYBFou0CQiiR4IluC8IMbUTwxt9rYJr0nRUCLNk+eTT6nhMGm0iWcmSKCN5KmlTv4lI
	Kqy0Bm8npVZC2Kswrx23kr2aVe9mYx8VyJpVcpeZeWd73F1f0peVvkMN0CSTB1j9HCEfuKqs5ll
	1iB+c36o3N4h4zhwoXMCDy7MOzEPjNOqglMJtt012ucZ9nntNajeZfsizre6ojFLbGpGIqwdyP8
	b7jXx9+UephoqQyepe5iSfy7gCffvevypWb4JM1L4vRciAPwbNR1Yc50NumGunvyPqBoJDjEaRf
	CBg7Fm79OCqybiDUlSnJli/mI1N2Z7/hEk01P0ualM80RgGXPVGbJPmVuqMgAgq3vLtTppkuErt
	S360hcmJeK86eOmR4acu6jTaslREen0HCjY8TMCQUxEPNb8g4woJQm5sf24/IrfEjv4HyEnYJi8
	xTot921cZDr1rzQsePtGShOB4TGv9SlQKQ74FOzM/SCK0wycALfpq7DVNnFK9IcR0UYmVNdZkeV
	Pdqq42Ogtv7djYh5ssff6armNBLh0Z7cMr+a/wtuJsR46Gw4vVStsABvxWaCsjVICnI8SYcrSHr
	+h2OrB0Jlk+Nxifm5zWsNGEFoBOAvQ2kwK+ZlVy/8g==
X-Received: by 2002:a17:90b:4c08:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3ae8957cb02mr6684585a91.8.1793547673934;
        Sun, 01 Nov 2026 07:41:13 -0800 (PST)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm10776958a91.10.2026.11.01.07.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:41:13 -0800 (PST)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Yaozhong Li <yaozhonguwl@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: mfd: rk8xx: add board level power hold GPIOs
Date: Sun,  1 Nov 2026 23:40:50 +0800
Message-ID: <20261101154053.3874-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261101154053.3874-1-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
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

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written,
otherwise the rails can drop and come back up instead of staying off.

Add power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time. The driver reads them for every RK8xx variant that is
the system power controller, so define them once, in a schema shared by
the seven RK8xx bindings, and reference it from each. The bindings
switch to unevaluatedProperties: false so that the shared properties are
allowed, except rk817, which keeps additionalProperties: false and lists
the two properties: it also references dai-common, of which it only
allows a subset.

The array is bounded at two entries. Firefly's vendor kernel handles
exactly two such lines, pmic,hold-gpio and pmic,stby-gpio, and its board
files use one or both of them, with an RK808 and with an RK818.

The lines are released from the PMIC's power-off path, so they are only
meaningful when the PMIC is the system power controller. Require that.
A board adding these lines is expected to switch to the generic
system-power-controller property at the same time, so the deprecated
rockchip,system-power-controller spelling is not accepted here.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk801.yaml          |  5 ++-
 .../bindings/mfd/rockchip,rk805.yaml          |  3 +-
 .../bindings/mfd/rockchip,rk806.yaml          |  1 +
 .../bindings/mfd/rockchip,rk808.yaml          |  5 ++-
 .../bindings/mfd/rockchip,rk816.yaml          |  5 ++-
 .../bindings/mfd/rockchip,rk817.yaml          |  4 ++
 .../bindings/mfd/rockchip,rk818.yaml          |  5 ++-
 .../mfd/rockchip,rk8xx-power-hold.yaml        | 42 +++++++++++++++++++
 8 files changed, 65 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447..38108fe 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -76,7 +76,10 @@ required:
   - reg
   - interrupts
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da23915..ddf2b2f 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -87,6 +87,7 @@ properties:
     unevaluatedProperties: false
 
 allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
   - if:
       properties:
         '#clock-cells':
@@ -108,7 +109,7 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index eb5bca3..5ca76dd 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -136,6 +136,7 @@ patternProperties:
         enum: [gpio_pwrctrl1, gpio_pwrctrl2, gpio_pwrctrl3]
 
 allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
 required:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..d51f815 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -119,7 +119,10 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index a58d945..c0c8dec 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -107,7 +107,10 @@ required:
   - interrupts
   - '#clock-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d17..6207c42 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -55,6 +55,9 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios: true
+  power-hold-delay-ms: true
+
   wakeup-source:
     type: boolean
     description:
@@ -157,6 +160,7 @@ properties:
     additionalProperties: false
 
 allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
   - $ref: /schemas/sound/dai-common.yaml#
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c..c9b863a 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -111,7 +111,10 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml
new file mode 100644
index 0000000..6be3e1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/rockchip,rk8xx-power-hold.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK8xx PMIC board level power hold GPIOs
+
+maintainers:
+  - Yaozhong Li <yaozhonguwl@gmail.com>
+
+description:
+  Properties shared by the RK8xx PMIC bindings for boards that route power
+  hold lines from the SoC into the board's power circuitry, which have to
+  be released before the PMIC is asked to power the system off.
+
+properties:
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+additionalProperties: true
-- 
2.55.0.windows.3


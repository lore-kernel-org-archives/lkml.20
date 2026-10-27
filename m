Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090746;
	b=DskJFjQ7un6YmyNttO21SqnQ0QwN+/IdYSoebIAhEDLu2RxBGxW4ztndXbqhjQl33jio
	 k1jpZwgMHgQD6+THUF+53ADt1V1dMWnEJu1WEfHT8hL+QnKbOop0CUnwPxaVSlyo2lWIb
	 Lwc9Ns8MV9wSeo0/sRq12DJkkGWkDh0mVkS/uUWmXD8f+m02mj3C2z9+d9Hhb7Attu11w
	 kBRtLfU/DDbkzbQ8ZBr0xiHtoHpuvvyBLCyCmEFhXKFc/L8V3v1cEL3mvqeWZTGBthzZL
	 PXsKqAs7EF01HibS+f2Z/ya21mvBXQj3mFd1LUAB9k5BDzAHnybiXBnS7d7CbxhOfsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fUtBDBFlnuwqHCLsz+VPCk4N74H4c6MrUI5YYlRszuU=;
	b=p5xGu0uMBsR8Sg8i4safA84RNO98cVtniHWtVFhTu4TdjAC0UgDv7DERxavIDPwTqBVD
	 xVt/+jmVrBUkBAZPCl+0nZqIFoC5p9XtDXzT5amgRjmIN70gryDmgrzeGdjDeR1hwfrc6
	 6rG+UZSGilgXdR4hWz+Uz4gYo6wTFKjLDIhqEB6RdtA8P8gMyN611U+NEqjFtIryxNBMV
	 MLKXHqfK1ZAXBFlkHoOkD9ABtNvMbzZEnCJk0IqMnM39OryTxK7iZ2AMfYTTFxX31wzLn
	 YHBGamK+FPC98FEqhkbpIX6FiFCTtUnNC7Dihotnt0a2dsxIlx83L4Pgvf8X9yzIjzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H4kILZPN;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F41A606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F41A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H4kILZPN
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1899404b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090745; x=1793695545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUtBDBFlnuwqHCLsz+VPCk4N74H4c6MrUI5YYlRszuU=;
        b=H4kILZPNGx/PI9tXIND2biAQPIFNsgZDlxRadAR32rqYh7qxvNtt+FW6aKE/10yJrC
         1nvf08Yagx2WCa69b1G5DOYuVpdG0xsvwZNTSV8jIHTyy3ishvuh+9bsCcjNYGbWirOK
         33+NLbfvGPHvw6RyQwsZ4jeXNQxxVhJIOkie4Bvm+a1ObscKjgNn4GOjZpK0I+JKoFIU
         hl7NFJtfP6UvvE6x8X8Q1z+SFEnvBeS0cxN6VQtyTOtSj+q/dTD/PKknfrkBRZVN4ewC
         KO1rK+wAiVvWssf+GhVYKOgIKony1QLBGTg6czbxi95fApaXXJ7vmPPFDKyaclpTytoa
         gLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090745; x=1793695545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fUtBDBFlnuwqHCLsz+VPCk4N74H4c6MrUI5YYlRszuU=;
        b=ivnBdEe2IEMzmXwCeD42WFSm8o/RDNq1eW60CjxkjJrjA6+LLgltrQTgvQ3jE8et31
         +gGCzmYe+ofOtojbYYCoX1J1Rjem9NcuicXQKQaFRff/fGPmC8Yn/zuO9hDtZm8QLY7D
         d65ChANXgdJ3udpTe5vJn04YHsakLMeYPbdqJ/z5V3/6bimNbqFbPEI5AqejmHdajRdU
         AcooBqm4rvGPXREYWhEa9hMgpndUAyW5DJH29n6tDQMs5pmmqHSIzWLOzZc5ELKX2plD
         WVRxoiq+V3m1YvTg9r3niEel2mxQ5nZ4onHcFTntrztsTSaGj3KGlblVQrkt0Nj7+5SD
         dU4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwVdNpP55OJN02Aaua1AT95dkv4uicnlVautm2rVBvo0sF+JUvR16A5Fv7cmsqdE+4OfiDpOskuwsb/tmU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtRM97SvDyObrW8DzCNegqgXL6GFiXk+itC/BgPFQM5lNB5M/w
	J3lkkPlZbEQbkiqSfMO3JO+/druJKxviBCJLu/rLZXwSobUKpbRNh3rw
X-Gm-Gg: AYBFou2s3hPbdY/+J1LwoH4K6CmWb23CKMRuUb306yynVUJLORs4ojmBkJLKO5QTQe6
	QNqL1taKUXUSBhtNsT2C9kMikIq0qolU4V3WjRvXmqP2rhClCuPcpziJIj/CRAMlYdUVPZUoA+1
	D/hTKTvQEpTpZ0x4uJ5tg3QjLWYIWTHVae7Tuq5qXm5qXbNgEFcvPeJoowuBdIqPYb7LqBwbmZC
	JNrFqylOgg5TmPcp90AaYFiPzqSFLWy/99hg3B3R4QyovRfrP842dqed6LBlA1s4ebuec80wZGo
	54KBQYaEDeaYrY+hdfeCTV2flkR44DurbA/n9hQWUriyncUvSrDX3sxne6E3awadybXHUfpJQni
	i99ouvLagzgNmioERGaMAyV+ZXTX2+6N4EVud4h7djGfzxu+w9FAI0mNXdfFJSjQbmohX7lVCfy
	2sLBf33jBnIpIOOx8TKb6qTi8wZsRTOiGnFjfJ1ceME7qQaKRJ7vJ4IIq30lS6IAMUD5ZQ8CwzM
	2ousWArMekJLwg5aHWSA1KPGXoFIj/xTNS/G2gUQyr0cJTJoyMFD+scAGdq5y1q2YfK2Q==
X-Received: by 2002:a05:6a20:ef03:b0:3e2:1a24:fb82 with SMTP id adf61e73a8af0-3e7bfa2023bmr5501098637.16.1793090744450;
        Tue, 27 Oct 2026 01:45:44 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad8f2c611sm267581a12.10.2026.10.27.01.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:45:43 -0700 (PDT)
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
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v5 1/3] dt-bindings: mfd: rk8xx: add board level power hold GPIOs
Date: Tue, 27 Oct 2026 16:45:07 +0800
Message-ID: <20261027084511.1992-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261027084511.1992-1-yaozhonguwl@gmail.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
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
the system power controller, so add them to all seven RK8xx schemas.

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
 .../bindings/mfd/rockchip,rk801.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk805.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk806.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk808.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk816.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk817.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk818.yaml          | 24 +++++++++++++++++++
 7 files changed, 168 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447..bfba394 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -29,6 +29,26 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
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
   wakeup-source:
     type: boolean
     description:
@@ -71,6 +91,10 @@ properties:
         unevaluatedProperties: false
     additionalProperties: false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da23915..7895c31 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -48,6 +48,26 @@ properties:
 
   system-power-controller: true
 
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
   wakeup-source:
     type: boolean
     description:
@@ -102,6 +122,10 @@ allOf:
         clock-output-names:
           maxItems: 2
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index eb5bca3..b719b07 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -31,6 +31,26 @@ properties:
 
   system-power-controller: true
 
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
   rockchip,reset-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1, 2]
@@ -138,6 +158,10 @@ patternProperties:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..0be2bb9 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,26 @@ properties:
 
   system-power-controller: true
 
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
   wakeup-source:
     type: boolean
     description:
@@ -113,6 +133,10 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index a58d945..a834a9c 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -44,6 +44,26 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
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
   wakeup-source: true
 
   vcc1-supply:
@@ -101,6 +121,10 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         const: gpio0
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d17..2c05275 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -55,6 +55,26 @@ properties:
 
   system-power-controller: true
 
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
   wakeup-source:
     type: boolean
     description:
@@ -189,6 +209,10 @@ allOf:
           patternProperties:
             "^(BOOST|OTG_SWITCH)$": false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c..319c0f2 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -43,6 +43,26 @@ properties:
 
   system-power-controller: true
 
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
   wakeup-source:
     type: boolean
     description:
@@ -105,6 +125,10 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3


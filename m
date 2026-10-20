Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505007;
	b=W60LMacEGiqg1Le7jeLm7fNpSKVzlNBBo5TnWzUX14uFZHovR8K4Aq8toXmUs2YsFUAi
	 eRI3RhI/fKAeBYnkZrRQTQIz9mfANN4j4dXdq9NzRbi0brEsCaF1CqYA9/WHNDI2VlRT1
	 MCoMsN9CXDbXsiArWuvCnTu+yo3aAZVi2qmRBw4XDdZZCXAsW4gPfmE1V5cOAT+5MayX+
	 ZLyfNbuEXMpqiUZlNc8gGgKEfJdOcUvHPhFLMAQ42sKXG7byeQUytwKs32B7Y8eZm/iU1
	 IEZErgjVNv03q67hxhxWdO8DKZLNCg6uhpJdHc2+VOiVtilhpacyyAzOI0rCFhkp3cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pUI83F+vNn47A4zRNccyxKlCOIII3kxuZu0/rPY+a/I=;
	b=GOEmADJgXluE2+Ro3A7XWzrnbi4ol525YnbNEEdEQSUWCeZgyOeucRSfC36sCuBLEbIK
	 +dtbrBIm1a5/SwrqT8USGgJUWzfSVpUGbs0+fNzPWdV9hHhPx4eMhd/2i6iVy0q/L91A0
	 gEJJ2z9BECqbjLl1f+m42gPSS6cfzZNhfdbmvrsB5d9Cp1TSu5jxfs7G6fBlSQbuqBVXj
	 56z6nNnpXy890CpjlNfTitbfvZ2jjwkDGJJk+b9yvlG54UDeu1nBRRqVX1LO6O8HFgDV1
	 zyX8JfAmkR2nJW0IY0BNi1fiLdwAn4hIjpKzr8CcDpmah0yvViov5oN1ULKZsysbO9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bzOyA8D1;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49110606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49110606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bzOyA8D1
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e831e86ebfso15276095ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505006; x=1793109806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUI83F+vNn47A4zRNccyxKlCOIII3kxuZu0/rPY+a/I=;
        b=bzOyA8D1o7tzU8aPzMA88tVzSTY7eK69edveH/y5VPe3Gyr8aR5EDzQrCJfrVuit3x
         7mThg5r/0FHXHshjY/nuWitlE7MZkRTPFL1bTV/GapmMdRPQWFj9Om0qnXb6NqxCrZpN
         sZSulCcJ3r63DJCj6wBmP+jQFm0/00E4vaXrn0gswYUvBFjiUvA9b3noP6sZuwPLe3OA
         CfhR/iFTQgR1f5nGN0AOtVXs6UvOgut+JeUTKb2coIli2Xav7BmtWq2hVFCEZFvElCqn
         QkvgDGflnz74TgRRs+qRVS/qawtYIBFPIxxb29CZgdXB9tlzgSpZXhBc1vTMo/0lGK2G
         SQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505006; x=1793109806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pUI83F+vNn47A4zRNccyxKlCOIII3kxuZu0/rPY+a/I=;
        b=XsgG34LGXR2xnNjt0ndBlp5UR0bVtTS31FUMBwV7x4/ggpU48SYKfzUME3RLi/erJZ
         yeWAuejHtbwxsQ/OFe6eTVlSgviVVrkRt/4w2KOJqwl1gZnUo/TaoMp7sy0QAO/EPmvp
         vvIj3UHiTISBla6SA6US6QQYCcGACZe0jOzZ4dR2hLCQot37rsrJhoZZpxtOE2ublRsp
         N6VKRwzEUwUxKYS3dPHpQASOlfpFqeSHXAlVno/IjOzXKl2icRxoZZ5JOrVy3Z9Y1SaA
         W0DmP2IjMolmuybZ1OawpPjk4qjzfWg8ANRY5Lo1gJ0F56igJ6sDT76H9tJYJzbL8las
         3nmg==
X-Forwarded-Encrypted: i=1; AKwUvBxcImiFwXlWGj+KbafMv2NMv3Viy2LcgCPbGK7jfyAG9Jl3gUfV3zxsIm2osVmszVFY1vYS+45SLQmFgNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBPLpd/A4xCpthN06J3l12Kb8yU1LeBJ55+5+WLeK/FjK7QaEE
	9Tkqikl2WnQoc98szK0vbumrf8s6IXgU+1sIoUkVf2rLgeBidEKwyhj1
X-Gm-Gg: AYBFou1kc0RR8Q/AgoUTeI9o5m0e8HAm8aqjQ3YBozADYNaYQIkmyxgz4gQ8P4nEGfv
	Xup92TxjtthuGxRmw65pVpdNFfnh0nq+kAe706IF62EI7Ni2d/BckbYWpcgmX6wzC+Z+LbnNtoK
	SFYYnvl3qKbj8oZmRVZaMILkanKtGVEvDaqZi3N3nbVu4nMVb6Z+RucNNDvLgM+7UITeDlfIlxx
	ghpW+AiJDssnZKyQROpXrM08+PlQoEVj/3fjSekyiJrD0fWzVKn4iwimkQjju12UgEZ5JyRKBJn
	+Epif4vksnv22RqFk+7eB0rTdIK0icoJpDDwUhqz47jVt4uHCqGBmgcETKmSh3Br396saFeBX59
	7bhGSXe4xbMikgMH74p9ujezPNczmnSCe0n/LtZ4qA9jHmUcPL1WyZUwQqKDKG8/+158r2vqiI3
	fZazu0AtyARf90vJHDdUoNldakeHZ3pbm6qucmKeX5bM73sfMGbF0XtqRmDhoJ25xvkyL4/s9gt
	KFvGhl5N2s=
X-Received: by 2002:a17:902:e547:b0:2e8:93b5:c555 with SMTP id d9443c01a7336-2e9a6e5296emr88242645ad.61.1792505006159;
        Tue, 20 Oct 2026 07:03:26 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1502971csm12434865ad.51.2026.10.20.07.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:03:25 -0700 (PDT)
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
Subject: [PATCH v4 1/3] dt-bindings: mfd: rk8xx: add board level power hold GPIOs
Date: Tue, 20 Oct 2026 22:01:12 +0800
Message-ID: <20261020140127.720-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261020140127.720-1-yaozhonguwl@gmail.com>
References: <20261020140127.720-1-yaozhonguwl@gmail.com>
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
meaningful when the PMIC is the system power controller. Require that,
accepting whichever spellings of the property each schema allows.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk801.yaml          | 23 +++++++++++++++
 .../bindings/mfd/rockchip,rk805.yaml          | 29 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk806.yaml          | 23 +++++++++++++++
 .../bindings/mfd/rockchip,rk808.yaml          | 29 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk816.yaml          | 23 +++++++++++++++
 .../bindings/mfd/rockchip,rk817.yaml          | 29 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk818.yaml          | 29 +++++++++++++++++++
 7 files changed, 185 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447..2f9554d 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -29,6 +29,25 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
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
@@ -71,6 +90,10 @@ properties:
         unevaluatedProperties: false
     additionalProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+  power-hold-gpios: [ system-power-controller ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da23915..1a11c98 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -48,6 +48,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
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
@@ -102,6 +122,15 @@ allOf:
         clock-output-names:
           maxItems: 2
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index eb5bca3..3df5501 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -31,6 +31,25 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
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
@@ -138,6 +157,10 @@ patternProperties:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+  power-hold-gpios: [ system-power-controller ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..a331a2f 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
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
@@ -113,6 +133,15 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index a58d945..f90e5d5 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -44,6 +44,25 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
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
@@ -101,6 +120,10 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         const: gpio0
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+  power-hold-gpios: [ system-power-controller ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d17..b1cc54e 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -55,6 +55,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
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
@@ -189,6 +209,15 @@ allOf:
           patternProperties:
             "^(BOOST|OTG_SWITCH)$": false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c..96ec07a 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -43,6 +43,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
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
@@ -105,6 +125,15 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3


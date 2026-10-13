Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FC149AA41
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916362; cv=none; b=Y/S4hIExTKfmBzJ1BOxsrQMP9D/nkpcYY7ZFoWQG7dGE95B6dAGebReRbM0ce6y/VyeI2qR89EekF92VJj4ogK/CLWmESDfaWvW3OhaMWjSWoaKLa6bhOjWFfctRSy8VpoA7FALS2PNTkP+i8rkcKVaxXJoHWjGg7t3L8ddFuNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916362; c=relaxed/simple;
	bh=sRh2h9zB1an4fHHdjoUBYWc1yZ5+jD2WIHwZzPaCqjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/pw5rewdfqcImDpqvwYVg+syGSeVVEtieddzX2X0MjtrlHqSv/LgWgWnB+DKVPmuJsupkaTfwuCgOPGP7xx8TMfYiOZHRkC70q5IqwKuIAmJbgTd2Y/EJdUCPVGPgUTI+cDo3YBb/QyGl8wcZdjU9FIv0k0BRTneMMsM0FL360=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fy+b4oJ8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fy+b4oJ8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a020e65269so21450005e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791916358; x=1792521158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kREpI8m4G/QZhA7u4s2/uYr0oWTkEgsKQc7fRL7IuIU=;
        b=Fy+b4oJ8OF84+GRKg1LZS8p6A0387DQKq1ZTnr5UxFHmr6he2CmvuknxsCtvFLjy/u
         kEFT4tIdfvmZJ03+g9bzWdfG4SwSjw2lnrZJhPZWPBkjqfZpPgkawZD0jcHR59W3F6KD
         RMVYDZzOYfxdJysmh48D//1Qz7pvCpfBzro33L8roe/jZOQlMdZEI4OhY/LCIKjfcNc6
         zumA/cnOzY9GHLsITxBuYWT3IEa+CLIifjwWYzNBcgoTUfgYyQzR3/bVKb+tPd7wNrbm
         q4u6LUVxJ31iJ/w89bs23o2a53puFrfWbfckJjd1+OfrWyyr+vXJPsbfkFydUuOodXqX
         o5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916358; x=1792521158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kREpI8m4G/QZhA7u4s2/uYr0oWTkEgsKQc7fRL7IuIU=;
        b=Kyb5/YSWy8peAWDnthUW57WNAhDkkclyNZNZ4jEUfGDYEEWTwuy4Gd/Ov45VF7bcaa
         BqHuVhrBW1WJZMwzRZqdzqGnWAIRRKuoNag8Uto1yc6PhfVHqKCm2ZqwaPkz7zy48qLt
         ZGz0LZRRxtbrsPkae3c4urks558S4ypAKlnYeXE9aOi+EMgKmYY86KOF9So46fgHCrhQ
         bDnw/8UIZyu3Nyq7EEjNGGcJLpj+zcaG1jbA5+bdV7Z28A4j3RhCf6GE2ccQTSbepgpB
         Az8B1HrkdbuljOELT8m1KG+BOWv1sxXmWOkDhwee735tlGInu3o/5dI7hrOboWgfLAQU
         u2rA==
X-Forwarded-Encrypted: i=1; AKwUvBzcrzkVtCl2GFgEJi2fNFKUGRhwP0HuNuj4K3i5DsbDfXOCzM0OPY2y/FEv38GbSLg/jN6Z3mWJfehNPOU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+IIixAxBUNL2CXhscXGpW6OHMf+stRMcBHLNtZThwz7UR8GId
	FYtjwoZgjfopU07BwetoOoKXN6LJiTnfVoR7GxXIQSaJjW8CGVUOiS1C
X-Gm-Gg: AYBFou3atP9hHVj/BOMSfct44jl1QqqCsijyPWtMGYL65dewntre/NfIlIl/hHLH9Hi
	f40oa0Z825joOKdYWQdEH4cC1qWAgqf45PjJ8Rvikt25kipYbEim97QNN6UKlA55YKC8iyXu+Gu
	buQUfjwk4HDYvb9e68ptwfU9+Vr+EYckF3wJp21cmbqvKKbvWiB/6w5qKKgUUMDiOhyweWTSAIH
	e/cfn4rhSAXDr4SjmN0eO3T7ThsnSzPfn/52OrP1ECM7MCmvuUIEiiqJv48AVAodf/xX30ytXIq
	1d50RjR+xQ8KFxactxxUrlKZVUuTBB3oiABfVBOGs3ZuGIXC16TaFWWcpuCfVo3tyU6HwUqUqf2
	3rBAx1eQ1rLWjO03FP8/U8m1QQD7XNQtTjoMN31RKjhD7YSY0CqIMxjfn2zJthKURCIIj557RKB
	+q/CrFs2tOprqo8Oz10r38cNQDBozQRfCBdCWJQU0gfQ5C60+yvU3xMtJKn2h0r4uCGrjDZyuaQ
	ppdZikInZ3jGwOEUHc=
X-Received: by 2002:a05:600c:548e:b0:4a0:1aa0:7cfa with SMTP id 5b1f17b1804b1-4a18e4aa724mr275921405e9.12.1791916358313;
        Tue, 13 Oct 2026 11:32:38 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm548921305e9.9.2026.10.13.11.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:32:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ASoC: dt-bindings: nvidia,tegra-audio: document WM8994 CODEC
Date: Tue, 13 Oct 2026 21:32:25 +0300
Message-ID: <20261013183226.513658-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013183226.513658-1-clamor95@gmail.com>
References: <20261013183226.513658-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-binding for WM8994 CODEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../sound/nvidia,tegra-audio-wm8994.yaml      | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
new file mode 100644
index 0000000000000..3c9a055f5e4bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-wm8994.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra audio complex with WM8994 CODEC
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: nvidia,tegra-audio-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - pattern: '^[a-z0-9]+,tegra-audio-wm8994(-[a-z0-9]+)+$'
+      - const: nvidia,tegra-audio-wm8994
+
+  nvidia,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of the connections between audio components.
+      Each entry is a pair of strings, the first being the connection's sink,
+      the second being the connection's source. Valid names for sources and
+      sinks are the pins (documented in the binding document),
+      and the jacks on the board.
+    minItems: 2
+    items:
+      enum:
+        # Board Connectors
+        - Headphone Jack
+        - Int Spk
+        - Earpiece
+        - Line Out
+        - Mic Jack
+        - Int Mic
+        - Internal Mic 1
+        - Internal Mic 2
+
+        # CODEC Pins
+        - SPKOUTLP
+        - SPKOUTLN
+        - SPKOUTRP
+        - SPKOUTRN
+        - HPOUT1L
+        - HPOUT1R
+        - HPOUT2P
+        - HPOUT2N
+        - LINEOUT1P
+        - LINEOUT1N
+        - LINEOUT2P
+        - LINEOUT2N
+        - IN1LN
+        - IN1LP
+        - IN2LN
+        - IN2LP:VXRN
+        - IN1RN
+        - IN1RP
+        - IN2RN
+        - IN2RP:VXRP
+        - DMIC1DAT
+        - DMIC2DAT
+        - MICBIAS1
+        - MICBIAS2
+
+required:
+  - nvidia,i2s-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    sound {
+        compatible = "lg,tegra-audio-wm8994-star",
+                     "nvidia,tegra-audio-wm8994";
+        nvidia,model = "LG Optimus 2X WM8994";
+
+        nvidia,audio-routing =
+                "Headphone Jack", "HPOUT1L",
+                "Headphone Jack", "HPOUT1R",
+                "Int Spk", "SPKOUTLN",
+                "Int Spk", "SPKOUTLP",
+                "Earpiece", "HPOUT2N",
+                "Earpiece", "HPOUT2P",
+                "IN2RN", "MICBIAS2",
+                "IN2RN", "Mic Jack",
+                "IN1LN", "MICBIAS1",
+                "IN1LN", "Internal Mic 1",
+                "IN1RN", "MICBIAS1",
+                "IN1RN", "Internal Mic 2";
+
+        nvidia,i2s-controller = <&tegra_i2s1>;
+        nvidia,audio-codec = <&wm8994>;
+
+        nvidia,hp-det-gpios = <&gpio 51 GPIO_ACTIVE_HIGH>;
+        nvidia,mic-det-gpios = <&gpio 27 GPIO_ACTIVE_HIGH>;
+        nvidia,ext-mic-en-gpios = <&gpio 57 GPIO_ACTIVE_HIGH>;
+        nvidia,coupled-mic-hp-det;
+
+        clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+                 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+                 <&tegra_car TEGRA20_CLK_CDEV1>;
+        clock-names = "pll_a", "pll_a_out0", "mclk";
+    };
-- 
2.53.0


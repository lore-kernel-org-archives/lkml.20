Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184128;
	b=tr2rpURjudTsQgb1ocOdu+UPNsmknOuUj1AuDm47RBKcCvqMFf6Sac9fivxfwQl8G3ZE
	 RlBsWc84FUQf1VmNp7rMx/ey7T3qulQZnLmH/gMH5Le4xdQL39j3wduUAfeOJxGCGnsTb
	 528CWwJIUMkTZuJMWz6IkUB8/o4STZGVyLv2pSMdt8MBszKVWNcaRKieSKE0587mlJwdh
	 EcqG2Fj5x++YwZo5iTjwtgR6QZqeqn0U0BXepPWVoNpY9tCqZqiiM3qAFgGmO0wjoE21f
	 eT7ezw5acrpANH21MalDFWYSFEFLuH0idQnlE2WjFIHzmmFUlxzd2IF76SjaGarFUtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2CZ2W+FwZtB0njIn3FCn/JS7jnb+oXPr0gBpjVo1AC0=;
	b=S8Rk9BwP4zlXCQ6E5n4yxC5Y2h+INOKVBhU+uYyKIE+YFnbEh0FpBgOtG2O55Q9i9y9S
	 jx+EGa7bZhhzZwPGBaDcx+eD3QBUdU8zUkTd2xeLEQkTFKxAD9vPFSTyzWTzu+/nBJh5X
	 guWtRslFVMCq7Aos7lOeE0dlS6maEUUB0A+8kkvVhWiFfP19dr0D0zGcxc+rzken4FG+O
	 JDDLqRDIuOYI1sFtl2DkgGbXCt8DHxe5W9e6C+lKgZ92oFKXvevXa9Gv8Kz/tuKK6tBkm
	 FVosch+4f/xB++y0GxzkhvIVO7qGkySH490vRYyZ6TnkfVQMHDRAopreLPmfJl5+GKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VozrAUCC;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97087606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97087606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VozrAUCC
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e09aa5264so180148f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184126; x=1794788926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CZ2W+FwZtB0njIn3FCn/JS7jnb+oXPr0gBpjVo1AC0=;
        b=VozrAUCCrlumMsUMuHo4TEKi3RjpViePUhLV+6ID5Mj2LSnoQwmCfOecgz/wADuJee
         XM5oZXPS/DgjtdwE2g9LMZFndScws3MdNZeQYfjvGQfaLu7Ur58/FFjtKp9iZBVj2J6/
         iAtUoPs74sCcPvCZ4KVh1/08EVC1W8TT5UIMfjQBfKt4kIaukNYlcryHjfJC4lZ0Ce8H
         UaCt6fsaLRCl0oeL+hHZTq544aVb/RE1NbzE6naVMmus3eiTPIWimZ2B+oG1Cr1pQzQ8
         PdnaS4NJzIoxaiZ4uLOU2lCTnGt6xf1/9j8i97OeqtRF0LE9fLhNbt86EP0gVq1RwiSH
         Y4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184126; x=1794788926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CZ2W+FwZtB0njIn3FCn/JS7jnb+oXPr0gBpjVo1AC0=;
        b=ry0IrNu2O77T31a0GHwuByvXGszsUFfw4+rSP4IfRPX96mrxy/xYsXzeZCytgJSwtj
         idoRsKwMKmzp5jYDDcTHHaqKnA0qEZUsW6/3sVSeBVTgXa4mqR28nBC6hrUP2ovjDRVT
         0NCBex4Bx7B8VR9UtrLRkU8loAdLSapDmTTo4cX36c6Bs5kjBALlnU2ro9kPrC2pe757
         8EDlV8jAnAksQvU6HCdBOBCFVcKWql3hNRDqUSOEgEPDJnVuNIMfQUvgKxyA9gMF4YI+
         kQDR8+RyQL+s3GV1cQaAy5MUi8n9WLNNhMm2yMi+4A5IceqWWeoBSi8odmueCe+6iEoB
         k6yw==
X-Forwarded-Encrypted: i=1; AL+hErFpetQ8JSUGyeJ0G+W9mpUrJeMMoC6QeEqMGKr7Rl4X5AaZhDWXipaTJSB2yr0Tu6FQ9AhIlPFENTTibyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e3K+MaJ1tIbFBKO+PuoaHIkBd8LwthnpCJ9Jdxym8zOLLN1Cb
	OH9iwWTSaFt7rNZ4kuHIn6A1YuU9lZInGQkWmcHQs1vwzxO2hHUJXNTI
X-Gm-Gg: AYBFou37cqIsUnaIdrlE0PGP9Kl48B+j4aKUUU1Yx/adsTftzQuz7BgTE4pDH1F5X1z
	OHbf/5TB6HSdzdwPXbmLtR1iG+1fFsyHefCE8XVlHAP5Nl/g2N4zKqh41/d1fvP+UpoWRJE6f44
	qXzVqPRvTn4CVVWTtYdHk84E0XEy2xcrE7cOr/1LBXMMI6F0rCXezgdifxkMUN91WcucV3qjcbB
	VrJfM+YEQ0481nM21bLMsdIiioIVHtqZVavbPeR4JTDr1llmpE4u7Gz32/GDxQL03Cpi/ZG9mlb
	cT+AAJQZjHiIccHgMlL1VE8fPpjE4B2Yl0Pd8SJAq6OIE+57VQUjzaMYjhLU/RCwF4i3YvNV/Zi
	usSug5W9tFnYT/4LoZ78hELOuWyL9Q3y8VrM1xH0pvcqFqGeb1KSdWy9+rJd7bQZLqiHOM2yvCh
	3z9EoxCxgn1n9Uo3Z5rWTAziA9XBTX5iZYlHyLMFtwVcoHll0ccFE4xCxU0VZ8M8RQYeuThwkdn
	UlhbFv2eApgAL4Xc2D1bVhLLHftRqRYdzKGn05LK3nCJ5sFPXJBPnpGfv0LOKKt00b5E11kWkqG
	OeGQttgc9OB3zfX2f9HrdsfhG3MFuyrbRlYVIeml
X-Received: by 2002:a5d:456a:0:b0:491:a219:8506 with SMTP id ffacd0b85a97d-49584599738mr2961808f8f.48.1794184125902;
        Sun, 08 Nov 2026 16:28:45 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49673b94dc1sm2688388f8f.16.2026.11.08.16.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:28:45 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:28:37 +0000
Subject: [PATCH 1/2] dt-bindings: pinctrl: document the Halliday Top Level
 Mode Multiplexer
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
Message-Id: <20261109-halliday-tlmm-v1-1-a181d54214cd@gmail.com>
References: <20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com>
In-Reply-To: <20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184120; l=5972;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=q9T+NC4u9aHo09uZQiFW4fqfa5/Pc9nEwP44Okd4IDE=;
 b=EIHF9+Jd+cvdDl1qjO09afOx5BezUxOdifmNW9CWb/F63EEW94qnlfIxEliEUpuoOHF6MxgSl
 3j+6rojxDnsBEJ/eA8tJbuR65OnARPKDYOupJWZ9yNeAW0K47kacfDZ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Top Level Mode Multiplexer on the Qualcomm Halliday SoC
(SXR2250P).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       | 146 +++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
new file mode 100644
index 000000000000..172de2d98997
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,halliday-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Halliday TLMM block
+
+maintainers:
+  - Stanislav Aleksandrov <lightofmysoul@gmail.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Halliday SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,halliday-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 112
+
+  gpio-line-names:
+    maxItems: 224
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-halliday-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-halliday-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-halliday-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[01][0-9]|22[0-3])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ atest_char, atest_usb, audio_ext_mclk0, audio_ext_mclk1,
+                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c_scl,
+                cci_i2c_sda, cci_timer, cmu_rng, dbg_out_clk,
+                ddr_bist_complete, ddr_bist_fail, ddr_bist_start,
+                ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp0_hot,
+                edp0_hot, edp0_lcd_self, edp1_dpu0_lcd, edp1_dpu1_lcd,
+                edp1_hot, gcc_gp1, gcc_gp10, gcc_gp11, gcc_gp2, gcc_gp3,
+                gcc_gp4, gcc_gp5, gcc_gp6, gcc_gp7, gcc_gp8, gcc_gp9, gpio,
+                i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws, i2s2_data0,
+                i2s2_data1, i2s2_sck, i2s2_ws, ibi_i3c, jitter_bist,
+                mdp0_vsync, mdp0_vsync0_out, mdp0_vsync1_out, mdp0_vsync2_out,
+                mdp0_vsync3_out, mdp0_vsync4_out, mdp0_vsync5_out,
+                mdp0_vsync6_out, mdp0_vsync7_out, mdp0_vsync8_out, mdp1_vsync,
+                mdp1_vsync0_out, mdp1_vsync1_out, mdp1_vsync2_out,
+                mdp1_vsync3_out, mdp1_vsync4_out, mdp1_vsync5_out,
+                mdp1_vsync6_out, mdp1_vsync7_out, mdp1_vsync8_out,
+                pcie0_clk_req_n, pcie1_clk_req_n, pcie2_clk_req_n, phase_flag,
+                pll_bist_sync, pll_clk_aux, prng_rosc0, prng_rosc1, prng_rosc2,
+                prng_rosc3, pwm_0, pwm_1, pwm_10, pwm_11, pwm_12, pwm_13,
+                pwm_14, pwm_15, pwm_16, pwm_17, pwm_18, pwm_19, pwm_2, pwm_3,
+                pwm_4, pwm_5, pwm_6, pwm_7, pwm_8, pwm_9, qdss_cti, qdss_gpio,
+                qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4,
+                qup0_se4_l0_mira, qup0_se4_l0_mirb, qup0_se4_l1_mira,
+                qup0_se4_l1_mirb, qup0_se4_l2_mira, qup0_se4_l2_mirb,
+                qup0_se4_l3_mira, qup0_se4_l3_mirb, qup0_se5, qup0_se6,
+                qup1_se0, qup1_se0_l3_mira, qup1_se0_l3_mirb, qup1_se1,
+                qup1_se1_l3_mira, qup1_se1_l3_mirb, qup1_se2, qup1_se2_l3_mira,
+                qup1_se2_l3_mirb, qup1_se3, qup1_se3_l3_mira, qup1_se3_l3_mirb,
+                qup1_se4, qup1_se5, qup1_se6, qup1_se6_l0_mira,
+                qup1_se6_l0_mirb, qup1_se6_l1_mira, qup1_se6_l1_mirb,
+                sd_write_protect, sdcc5_vdd2_on, tb_trig_sdc2, tgu_ch0_trigout,
+                tgu_ch1_trigout, tgu_ch2_trigout, tgu_ch3_trigout, tmess_prng0,
+                tmess_prng1, tmess_prng2, tmess_prng3, tsense_pwm1,
+                tsense_pwm2, usb0_phy_ps, usb2phy_ac_en,
+                vsense_trigger_mirnat ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl@f100000 {
+        compatible = "qcom,halliday-tlmm";
+        reg = <0x0f100000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 225>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-wo-state {
+            pins = "gpio1";
+            function = "gpio";
+        };
+
+        i2c-w-state {
+            scl-pins {
+                pins = "gpio58";
+                function = "qup1_se0";
+                bias-pull-up;
+            };
+
+            sda-pins {
+                pins = "gpio57";
+                function = "qup1_se0";
+                bias-pull-up;
+            };
+        };
+    };
+...

-- 
2.55.0


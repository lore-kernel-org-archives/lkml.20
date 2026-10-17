Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61BD3BBFC0
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233234; cv=none; b=g5Poc64tz0g+AG0FGrx77jZUqhDKSCQUFZJrE4bWZh/iYMeU8Ma8Fx/8Vr42zycBiPZ2VzX1dQ/CAwQi6T82uhtZUfvJCXRot0nlC/hPYoEzp8nxdpd9qW5sjPr9eo5A0eBaGUPeHgbKgVl3fBR88G7DMJBOCtpEiph9NK0lwic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233234; c=relaxed/simple;
	bh=L4hjxrVI9j9WNQiTNo7E4pMfYOhsq3Kw++wyebOLp74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RCCTTSXo+RebvLy5AT/bGl1SEh3L97AzpkLl58LsamW3CnqpzjwYrzJS9Utg3+mhLApDO7+YAgVW0mkuCCm8T2A1gvk0lG8k5JzMm2qcK1ZEEE/NJaAU0A6CRIhr6EwfQpAns80adHDKdXycKtCpUZth0VU5xz+DiCl1IXmsEDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zw+t4m9p; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zw+t4m9p"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc53988d9f3so336431a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792233233; x=1792838033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJMiI3zn0Ah/6v7E7BqKNzfu3zqpMlEsQjtNsehcFhg=;
        b=Zw+t4m9pTvbzqeGSsoTavHub+dMoO4riTa+0aDpo9itRvLxx42ZfC6+VfmAPzc+609
         rR3Gz3DKJrlGiV4z06YqKchs2D3oVRpQojCmH05j4I82/kK5HGuEmveOfoiHTiHGrQQm
         ntpSVfomXmgi9TQoEWeZ7e8fkcwksCdQHLT9P0tEbCOrdLoKZbRqFnCsJARlXlxqSGma
         oaEUqVB2kKYnlSASBM7PUKV8i/G34rDki61ggHLFUQmABrE3Sot1Y8t+v0urQqixUZgH
         DU78r3t+Y6yN//Y0mHGgQNqKatFfv/RYyALiQSnUc/vBx4bWMdZTxgAZyMiFoJKKMohq
         H0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792233233; x=1792838033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJMiI3zn0Ah/6v7E7BqKNzfu3zqpMlEsQjtNsehcFhg=;
        b=bxx6UFKgXPXPxdtSqd8eUQ781IVKczx92C84vsC22/m/o7z2dO20h1ueCDfHuawoq/
         /dRnCL12fVpJQTrs5PeWz4pIkrECAOUWFwO8RLahc5tIYj2LKDDFrR6Ubs4YvOLkA19G
         I1tPzAo0q5KIIyTo0lV9THg+2FlotjM05yAU2GoCF86bYmjVzdsLHVZpa3a+nk+RKbRX
         WXs9fNfh4pcXIu2xERc/te1O5DGv9es0jUv2+v1gwco+iR00Q3C/EJfR8XhVf48S7Dix
         GgyviR4nfJxbBy18DimIfKY2AmPbWuRY8owcc2+wNukBTbn+7sA+sjv2NH4ZGN0rcKAz
         Sh4A==
X-Forwarded-Encrypted: i=1; AKwUvBztEpc7KP2/wfTlBeUYC6h1CuXa9dU1wmzArI2f2L3tqDv1e6NtzK6hxM7ysG7LqqsUagGCI2XnDbwiqqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIotQPwWe37JoqzoR1zimy7UBkDREtJ6yK0x4tVB52zPACLa0iQ
	xboS22ui287JivG9qSn30N1Pb0n8A9WAQI4jk+pL2MW0sbKYRyGpwMsy
X-Gm-Gg: AYBFou1YfsSKS1T7pjpIfsrejsvkd13AqZ+0zS9gJeO+nUXFoQDLvJMuqWdLjrp5ogS
	8YKYFTfOYS+bRsZQe8BV5dVEjN/lwv9P7q7fIUp6v4HMmg4dUSJXkc3gcjPh0/yV34eWP1FMPIM
	N1B0xw9ECdMQMEBLNNgCSk/+AQmXqglsTiZCLJTRz8v4rVCSiStwb7yuUIJicu8sXpfyISiApvT
	gNRMqpg813F9ZSYmkXwBGvhNVjC6necJMl9zySZFIZ+UbQlsXRLoxiTW2i/kGJykLDlwxwRWVNE
	8d8WEYa6KIi90y31jBZLOluef9m71qm3ggnP3plJIYf55o1lwlK5jk9hImkfBm8xhfWWz1GiZCz
	D4CA1kfEHX0Zw7iM4SoCsNXlpN1Px8vGCgb/1VoHVTGI2IgVJUH/Ij/iYjeoD4pbwmVFG28kda1
	SOOAbHpiOVRny7ody1/enq6/u4C+sAhkg0SGvfB4U6Md4zEFZy8Lvetn0O
X-Received: by 2002:a05:6a20:6f8b:b0:3e1:7249:e26c with SMTP id adf61e73a8af0-3e226057ed8mr1628852637.34.1792233232952;
        Sat, 17 Oct 2026 03:33:52 -0700 (PDT)
Received: from Linux-PC ([2a09:bac5:1f0f:372d::57f:4e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58414986sm2051585b3a.57.2026.10.17.03.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:33:52 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: display: panel: add Smartisan TD4362
Date: Sat, 17 Oct 2026 18:32:49 +0800
Message-ID: <20261017103250.800109-3-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017103250.800109-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261017103250.800109-1-tianshi12127@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Chen <tianshi12127@gmail.com>

Document the Smartisan TD4362, a 1080x2242 command mode panel
found in the Smartisan R1 (trident) smartphone.

Signed-off-by: Lu Chen <tianshi12127@gmail.com>
---
 .../display/panel/smartisan,td4362.yaml       | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml b/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
new file mode 100644
index 000000000000..d9a18cbe635a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/smartisan,td4362.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Smartisan TD4362 MIPI-DSI panel
+
+maintainers:
+  - Lu Chen <tianshi12127@gmail.com>
+
+description:
+  The Smartisan TD4362 is a 1080x2242 command mode panel found in the
+  Smartisan R1 (trident) smartphone.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: smartisan,td4362
+
+  reg:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  vsp-supply:
+    description: Positive source voltage rail
+
+  vsn-supply:
+    description: Negative source voltage rail
+
+  reset-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - vsp-supply
+  - vsn-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "smartisan,td4362";
+            reg = <0>;
+            vddio-supply = <&vreg_l14a_1p88>;
+            vsp-supply = <&lab>;
+            vsn-supply = <&ibb>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.56.0


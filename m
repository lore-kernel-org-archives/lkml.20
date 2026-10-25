Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792902101;
	b=29rasYdgopOGHlvR6c/bEqsg+X7nx1JCWKYcWJeYQMGrgO69S/wDJWTJDOpHF6sLvE0M
	 NwJlnwJnyrHhOySS2PWF471oDIdF+Yz+5O953MANV+f82Ka0Be3HAREzmhbpFXzx8lhGv
	 GhGEt30dPkSSlyy66P5aOJXDCD3DCmAK5blLz+4+iGfWeOoCqvxq2nvrAOjMSKM6qw7Oh
	 NdEm5JESC6h8U0XoD5Y+pO5FtDnAz6MMnURRlA4+8jzHHfl5MpWI6/ayRO/8q6CbTXb+H
	 ZBN5JiewEkPyAVqROm4BzGzXEdUnnnYi65YIKy1q40NrYE/LbhTEKM58/XYTBNJuCng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792902101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=045OPuJjBnPf9EV6Lqby1VMt/pxJDKJfo2sjPGVdf0E=;
	b=PYeFzgS/HRH21kGDCb0mvazhGvFiVyCs+oUh4Xxfo1uChKmKm42ib25MzNOAkxl9XbKG
	 c3Kna5cRDsRFStnDLe1gD0KOE1PxXLQHbeq2xLpBYsxFmhW1hXL+8z75zgsnMmjXhfgM8
	 tcN4DByv5yziBkdgQ3V1HfVKoDYEsQUXnLjeyHdJDRB1Reu0C/x0MDtjyQycX/RSs91SR
	 +4JJXcK/CdMdWXHP0+UFixaIvFvfkkS3/H0jU6XlKujHPyq43kethTIGaIQ+OvNIrUufA
	 IIDoDYFbGjw5Ypk/Ezde8JvQHJcoNHSMs16bFrqjNa2WC0BDRdyBePgA8vNnuiERLUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BHLb+cEW;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2C7606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F2C7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BHLb+cEW
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-353804b591eso3658251eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792902100; x=1793506900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=045OPuJjBnPf9EV6Lqby1VMt/pxJDKJfo2sjPGVdf0E=;
        b=BHLb+cEWu7S58l6WotEAQxIpsfqsh0vcSVVpdn6nuJYlFfQdrJo/fqo6f5czmjqvw0
         RjAlErbj3kWyHzEyFxr2Bij/lxy1/8rnOzWi5hc26OqH2lAI95Z04/PMRc3lCYEJo6TR
         7EqgF4Ac3ahPMbStHJsvcCZad4jvEdXd4paKrmdeVxcUxIVmpnL2yPoaPzbKhavtY3ob
         yVJDRMK+hLUTiLS3dgHhfwOGZVfY+4qV11DwrRz2Wki+7Eqk7+TVx+T+/9jjYowqpLtf
         9CAWteu30VEDt6gq9+vrqldYd6/6np/JVpf9BU837gL454A26MIFm3AfGFTOJs2yPJ2T
         2TxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792902100; x=1793506900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=045OPuJjBnPf9EV6Lqby1VMt/pxJDKJfo2sjPGVdf0E=;
        b=T6mINpuUXVuzy2GFJDP2wHfVcf1++AeG0Hd+tg58l7ahihM4JsPzywiVIUive7twgB
         2tLpFykxW15aDOO0PrqqM2c+dRSdDlB13Kpec0msaOp6t2sBTEdzhixriaMCT5f3I9Gk
         fqbTFl3kcYt0zLW4amTuzk+dKp/ltQhv9OZeY/KHUzmdVqkKzQKcG+RnggGqbniTHfPT
         HDn0nW2oMuggxIAcAstdosb6wGDxCAq55ZtlW3cZjmY8iwjBXNrEWqw/jQ9aUgU2zQK7
         lYWl+Ssh5+6Pg34kSloZzjcGzz0DaeIfxYhVNOPED/jo0q5YE4NiHOWRceAAoXxlziEu
         14XQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3T3OEb8g5hKagQ7+dGAwI2VCDBbGgGyITgN/WlOvg19AzJWj2FBYwrJwhX7KcYmj0+dIXHIfrg0IE6uc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfgGNlhweB3Zq4PmWShHoWpnuJlQBb8pp2X94gGPBhfHQI4VWw
	myK+Fydk77M7xuBQVFMHF9alK5wzxNJjp/K1hhexryUaAwTiOlFkv87S
X-Gm-Gg: AYBFou19Xew3nhrrAlPKYAemgiZxde3LUl0iYtpkaV7zTpIXN1hbCaPOLdYPVOtWX6M
	q8MjhSd8PW6wJTe3Mkyf74rugOqB1woKP4xyqUMAt5gzLOQ1lKaNhgeaQzhmh2WVePBkYhBzuiM
	L+5VpmsNyVI0URKZh3KPbE/38tyxPc//qnTDltU9X3Z1X11azyjDkBZ3BZJ4qetd5hBJ137dicO
	SaK98Cv/yX2ouN2F9zQjYRsL5JP5kY/DKXS3drJJBZ7BBcVICq4urMMqgqToR8+dFxtku4oSoTD
	/GHXD1ysXMKtbs5M1s19Z0lE6e3srFw2DhSJpQh+dcefAo0QtT+UW/3qgtvksLYUGc6tKvOnxt/
	GifR5V5K88Rx71RQuRW+lcrDTtjkKvSHURnh39mdQUys1fJmAFmMKZ+tQmtqhQpoV/Awe5xp+tt
	OjzPl2TpojKYYtAeGxT1uLvhOK8qiTb5/CzAogsU3Fiya8XR7AbcFc+0ygH1fE78biFJ4gKeI3+
	orHweQsZjcq/taNIZEkhw+lY9qS+asmwy8Z51xUf9kXeI7IUkjXzKARuLsqNxH95Xpy/5h4SYjY
X-Received: by 2002:a05:7022:7f06:b0:166:3e26:c4b5 with SMTP id a92af1059eb24-19935be7e56mr5156571c88.18.1792902100329;
        Sat, 24 Oct 2026 21:21:40 -0700 (PDT)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm14037825c88.11.2026.10.24.21.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:21:39 -0700 (PDT)
From: John Macias <dencity7@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	manikanta.mylavarapu@oss.qualcomm.com,
	varadarajan.narayanan@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 1/2] dt-bindings: remoteproc: qcom: wcss-sec: add IPQ8074
Date: Sat, 24 Oct 2026 21:20:59 -0700
Message-ID: <20261025042100.1356088-2-dencity7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025042100.1356088-1-dencity7@gmail.com>
References: <20261025042100.1356088-1-dencity7@gmail.com>
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

Document the IPQ8074 WCSS secure PIL. It needs the PRNG AHB clock, so
move the clock names from the top level into the per-compatible rules;
IPQ5018, IPQ5332 and IPQ9574 keep the same clock constraints.

IPQ8074 firmware ships the M3 image separately from Q6, with its own
load address, and some boards place it in its own reserved region with
board data between the two. Allow IPQ8074 to name its regions "q6" and
"m3" and to give the M3 firmware name as a second firmware-name entry.
Without memory-region-names a single region holds the firmware, as for
the other compatibles, which keep their existing constraints.

Assisted-by: LLM
Signed-off-by: John Macias <dencity7@gmail.com>
---
 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 96 +++++++++++++++++--
 1 file changed, 88 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
index 1ec8df60d..89d648769 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
@@ -18,14 +18,17 @@ properties:
     enum:
       - qcom,ipq5018-wcss-sec-pil
       - qcom,ipq5332-wcss-sec-pil
+      - qcom,ipq8074-wcss-sec-pil
       - qcom,ipq9574-wcss-sec-pil
 
   reg:
     maxItems: 1
 
   firmware-name:
-    maxItems: 1
-    description: Firmware name for the Hexagon core
+    minItems: 1
+    items:
+      - description: Firmware name for the Hexagon core
+      - description: Firmware name for the M3 core, loaded separately
 
   interrupts:
     items:
@@ -45,15 +48,11 @@ properties:
 
   clocks:
     minItems: 1
-    items:
-      - description: sleep clock
-      - description: AHB interconnect clock
+    maxItems: 2
 
   clock-names:
     minItems: 1
-    items:
-      - const: sleep
-      - const: interconnect
+    maxItems: 2
 
   mboxes:
     items:
@@ -74,8 +73,18 @@ properties:
       - const: shutdown
 
   memory-region:
+    minItems: 1
     items:
       - description: Q6 reserved region
+      - description: M3 reserved region
+
+  memory-region-names:
+    description:
+      Present only when the M3 firmware is loaded into its own reserved
+      region. Without it, a single region holds the firmware.
+    items:
+      - const: q6
+      - const: m3
 
   glink-edge:
     $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
@@ -131,6 +140,40 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq8074-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: PRNG AHB clock
+        clock-names:
+          items:
+            - const: prng
+      required:
+        - clocks
+        - clock-names
+    else:
+      properties:
+        firmware-name:
+          maxItems: 1
+        memory-region:
+          maxItems: 1
+        memory-region-names: false
+
+  - if:
+      required:
+        - memory-region-names
+    then:
+      properties:
+        firmware-name:
+          minItems: 2
+        memory-region:
+          minItems: 2
+
   - if:
       properties:
         compatible:
@@ -176,3 +219,40 @@ examples:
             mboxes = <&apcs_glb 8>;
         };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    remoteproc@cd00000 {
+        compatible = "qcom,ipq8074-wcss-sec-pil";
+        reg = <0x0cd00000 0x4040>;
+        firmware-name = "ath11k/IPQ8074/hw1.0/q6_fw.mdt",
+                        "ath11k/IPQ8074/hw1.0/m3_fw.mdt";
+        interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+                              <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack";
+
+        clocks = <&gcc 50>;
+        clock-names = "prng";
+
+        qcom,smem-states = <&wcss_smp2p_out 1>,
+                           <&wcss_smp2p_out 0>;
+        qcom,smem-state-names = "stop",
+                                "shutdown";
+        memory-region = <&q6_region>, <&m3_region>;
+        memory-region-names = "q6", "m3";
+
+        glink-edge {
+            interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+            label = "rtr";
+            qcom,remote-pid = <1>;
+            mboxes = <&apcs_glb 8>;
+        };
+    };
-- 
2.47.3


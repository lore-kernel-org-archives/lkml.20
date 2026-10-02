Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAEE499F2E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950914; cv=none; b=KIXs7q5lrnZcm0MNEwVeMLUIIEzsAjayNWYcQJCjfIU3CbsRXVNc3xBChrti/wfVyKxhEfw0q4D3aUWfQj8pT1P3ASDpSQ6kQW7ZI9ULT2dP68ehIhtz7KLewFU4Ijkgvc4mm5c80EHibkFdeOFPR1sBaY0FmJAdeN/f9eLYVCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950914; c=relaxed/simple;
	bh=ZXP6OkY2DxkiTYSnHO0CLOwn5hC6SXDi4hWyiPvZAl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ee6cCzAu23IN88fxVCdqqmg68l6ereD5z5Nj6h/ZAdEmyge50n7yMCW/I8wSYR4qwqsebepf0fmAdHzlMne5omwjRXxkxLtmn+ZB5UNmKbLxpjdC2Ix+xXBBAbkfTN7I+k8G3pS0DDmtoluhOfMsnvyOnDjW9wIAKmozMwa4MK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=B1amWoIt; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="B1amWoIt"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e201b7189so21871966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790950911; x=1791555711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qgqhj3Epuh5RclDvybJ2oNFa673B4IjvzwU5Ux/nnZ0=;
        b=B1amWoIt2znqDUpPbI2WOERHHdAIWflbhwyzxoMrz646sH7zuunHllEAtPoDE9IuhW
         oD5AWrHqEfpTSweitysUnOE7pp5of3SnL5g8H84/TDBudAtzGcOWsng6So28BceYpRjg
         ZDVsLT6khEPsZiTtDTy3qZuVHg1gsMJvj45ZSlhJ2WRpHO7LI1KWjcXBB0veuqtvkitJ
         YTXlczUuqXew4BT1KaTAlI3GMBUW6z8fGptBKmgP0C6cmoGydxOj0ltQvDMkFg00z9WU
         y3Cb1VrIFZgwRwPkrJr76//6JKFfi0HjhgY/CX28BPGtAPm3E0GHGDr1V4reaLsIlZlE
         G2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950911; x=1791555711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qgqhj3Epuh5RclDvybJ2oNFa673B4IjvzwU5Ux/nnZ0=;
        b=X7mfN4tVK0T8PDpSZQlViQruZHLpLQlwV9xQ+SHRE1hE3SMpd0ytjhRLVJddUoJuT5
         XmPrsrW5CsKv4LYCD2WH/XrfX7etyD+hvFjIsUvwUNQZj75M5lul2s1PzoJzntKH7eX/
         kN4ffTOU/gWxoSYwTdAB08GF1H2tbeil5shFsxOceKNLAFgoWeMZZcxth1jHkl3Rpt7B
         IDPjp9v8fLPl7xUjjtVl9Vc3g2PgQ1ivuNkV+RY29Ey78wSpo+nl6ji/XxHarXnF1Tnh
         G39wUsx7jLyn6kFMjSiiAHZ/RpCKys8vfXN3ZTImZ3vVx7wIDmciWLq6dPpJKI8x/nd8
         Jovg==
X-Forwarded-Encrypted: i=1; AKwUvBxdsIEdtkM3qIoA2P2rIRIW0Bu5yhRLSuq7+VeIEmRnN+9VXYJBk/AuZ+ibVmFzkdyyZ4I1j2HurvZZzZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lufAy/UQVDBZFNMooDH3uUo2Wxd1tKyfG8HZmPXr/RBn5KmULe
	3dnRyXufRByVKsILPR7BCXK+rQkceoOVyNGGTmkbGBSr/3sCcogtnBOU5utKmzjFR2g=
X-Gm-Gg: AYBFou1kveNIqJCpDA7zfaGGtjd4KfEsI8v1FkEu/a5+9NBkHQZnzGVx8Nj1MKOW6iK
	GfBg7T64DkgUHNzcJHSKfK4T7Rwn5o6+y5jCYq0fZcMu1jkxci3lyhLHDZ+Y4Nk9kumsSsvAzkT
	PQAMVK6BMyjI8veyYkHWW5B2bnkeciW+o/Xib386RBgCEUTFgHWivfBCfxIUz/DucUBdRJxfZmL
	ZV1IpwROT2xwGLSNb8qipbOavjPbVO7ezw0AveV/M2HC1aNTv6B65DrKDNCpAFH+hEDf91+SQ7O
	ZaDInBeCGawdoj20+oVc2uUVP48QNASWyIO4MRNrJxb+VeT8b2UwM5/hF3Cp/UVlL0DF4UsJegl
	U7J28F/Zvx3UgeHra6pWEmpCY5Udg8U7ZtusqLx12SJx8JXTqlLR+sVSFamWnoHgJP0Uu6TwiVR
	ykfmr9TS1JMuz0cDLHxmmp+61Ff2JlxHdcByAPi8fdt40sb6GEgs38xbnj5R7mnxhVYIIl4vxV3
	O58Jzam6TYr34cVEBxWxfyE2YJ3/pUU/848H5FuRXilCWZLSlFWtNk7M0nfdxU=
X-Received: by 2002:a17:907:c16:b0:c2e:4488:b8a3 with SMTP id a640c23a62f3a-c2e4afb4dfamr203583766b.33.1790950910733;
        Fri, 02 Oct 2026 07:21:50 -0700 (PDT)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf684e3sm89307166b.51.2026.10.02.07.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:21:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 02 Oct 2026 16:21:45 +0200
Subject: [PATCH v3 1/4] dt-bindings: display: panel: Add Novatek NT37705
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-fp6-panel-v3-1-4b80f83bc936@fairphone.com>
References: <20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com>
In-Reply-To: <20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790950908; l=2354;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZXP6OkY2DxkiTYSnHO0CLOwn5hC6SXDi4hWyiPvZAl8=;
 b=COCbMQS3AncCT3ls131LtMAtGjNrfapFqjTCKGzpbyoLUllRaFlpMgQRKj5Tez5BqkWhFh/lN
 W1H8eSLRNWGCCSu1sBjRPqGfBc6lhIZA2e1Mh3sB1U6Uiped9YwZYHK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels.

Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
from BOE) using it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/81a3c207-4d8f-490f-8e2a-6f3f4c2acd35@kernel.org/
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/display/panel/novatek,nt37705.yaml    | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
new file mode 100644
index 000000000000..850d91e25af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt37705.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT37705-based DSI display panels
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  The Novatek NT37705 is a generic DSI Panel IC used to control AMOLED panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: boe,bj631jhm-t71-d900
+
+  reg:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  dvdd-supply:
+    description: Digital voltage rail
+
+  vci-supply:
+    description: Analog voltage rail
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddio-supply
+  - dvdd-supply
+  - vci-supply
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
+            compatible = "boe,bj631jhm-t71-d900";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+            vci-supply = <&vreg_l19b>;
+            vddio-supply = <&vreg_l9b>;
+            dvdd-supply = <&vreg_oled_dvdd_1p2>;
+
+            port {
+                panel_in_0: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.56.0


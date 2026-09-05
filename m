Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6522D30567F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 21:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788642970; cv=none; b=HNR8FXCRiLonrgVWhmfzK5Mx2q3SxsbhSEN/R7tXhXCrp7FY7Z4sTz3/G1CEsUao1Yrue1M/yzT49RGrNzx4iKaUHeGWFxulxfJzznPpkkpP+yZKuIjQNUfTBf8A7IR6jOBJpA/J9cfO17EIWzuZ84TNEZK9ik+NFHsb0XgY3U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788642970; c=relaxed/simple;
	bh=RHhhZSLObOBY9zTYvLvn08xR+LXD/6DbHCpYXvjntk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J7d204ddH0wrWjHBBUpKRAU2J4iRjkjCHjMlvp2Gfvv2jdlNwgos6sMdI5LcyFu8aoGLINaUQbTdRBNsA9qi+yCHqNofdf9k9iwzklIHyDnF/UyDhlJF1f7pXsjrjwtvC7AOvjlK/HIhEg0TeJwBUAkOWfkqvN6le+990b0AmRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=hyqjWVyu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="hyqjWVyu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso27767915e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 14:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1788642966; x=1789247766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcPh6S6yPO5PSnIUjNx8RtmS3hZ6VbQMqkL2Bvi+uPc=;
        b=hyqjWVyuAMy1cggWI7s01UHv6ALZzhmXBx8T7G5zYIXoG9xVrmzj9AjNemKAYBh/Bc
         GLHrMPP6CsVHoZm6YXG+luSPfsYFUS4bfgixuCvj26ggqCulOiW7URjqh1+Fl9sOW3F4
         OtiAWkxSuXYUEFezYMlal5l8A53kKuMok1AVUHtYvw6WMqeU5JA8+y+SDQJaSYx8ZJQV
         CrolLjq2wuoj0Y9GIjP8ihRzjm/1WB5y2C9VBammqJ6WR6qauAPck/NBMhuj6b+qG0T0
         a23VRlQ09ahD2J/Cpt3pa/uMYCkQBpFY6XkrpdURUM7Lx0pu/eBFuydrPviOqeyAmIl0
         OBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788642966; x=1789247766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcPh6S6yPO5PSnIUjNx8RtmS3hZ6VbQMqkL2Bvi+uPc=;
        b=Bul+uFx9MAk4D0JaiZ+bH4IYIJEPEHrWZARHZMbsmXx/nv77gVqc2GWzwlqsxo4ycj
         flQ8SmMv6ZKSkN40TQhMBNsp0PnbT4oCXmnkqwfcqo63XWlzUrYcd6rQm3TLnSvraBQj
         3uQUUPMwWsVx2X9YX4AHAHJxKj+GOhL+oqPfnZCmnTpNemnDJT2av4dmq8zlG8whkAa0
         SL9nhkabkPGH1owSWy8G8/EeejP1RA+829INvjDbyRxafTXO3D/Yscf7pKLQ57mEKuFT
         cxXGJS1DWXXSJpELyZcmviHwIgmCoYuZiDuZ0EJBmykE37Mr6imovC8tSyouXXSwucsF
         hG0A==
X-Forwarded-Encrypted: i=1; AKwUvBy7O4Bm52bZBO3zrTESkEsoUYTEeXTEvzOLGCPUsVin6MVQEHNWFeySuXV1fDaSFowCC06t9EhMqB1MEcI=@vger.kernel.org
X-Gm-Message-State: AFuF++k/vujOaQz2VMvvu6sKA2dOuxbsTP17EzxQk4uoMP8v6gkTsYo5
	8iAlTQKduEFiQtFHHK9g1/I3K9x2KJPL6oHln3eFoixEaZedvelatYLmfrjBwAi2E90=
X-Gm-Gg: AYBFou0xSM0pod/qQnAGzOSKLlusDfNSeFEOY8g+U1MGNe9+M8szYkX2ulWqsWUkHLm
	hw87i2cCkwSSproJZdkj5jTVVWTuwZl2TP3B3toDJFjH9rNI3wRV2wYfrfkQXp3pmrAFcSbTyEz
	1+gn/qlb9uO2vWmJNM+KWH3kCghTfH/NlnYjPwF/rg9i477t2IUDooJ7+gQ17wscLIL7hOaJ2bX
	5p/mnAkt6NXPTa0r30kUJss4xDz0SqIenDMURz/QNepwUqJqynTql0ebQfcJRqwFkb4c6JI29gH
	9YFhPtA3knlGjP+iv9DpS1ukziE3x7fl4U7NjuPZAjwJfKHMggAmEPS6omKPrPUbUKKx8MgJbEN
	e1u3UHVfhUDKGJLMHnmtHgB4nYK/CYUb4HU0c6U4VSGYqJK8AfKv58njxh1bRvcahaB49LOBQyi
	C51HTiK5kP5ksVaHGgLMkyhz+gu7HPgo8u4xGa90wrhVELcIw5Ma0Q9L0fxGPtWXqItzl/bhWuJ
	97TvnLe04UsXDFsgPFfOGEXrA8bo4iMlUZnogDqc/7DCTySHGizPA==
X-Received: by 2002:a05:600c:4e8e:b0:49c:dada:f57f with SMTP id 5b1f17b1804b1-49cf823cd42mr129389095e9.7.1788642966595;
        Sat, 05 Sep 2026 14:16:06 -0700 (PDT)
Received: from localtoast.fritz.box (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm261416695e9.3.2026.09.05.14.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:16:06 -0700 (PDT)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	johan@kernel.org,
	rogerq@ti.com
Cc: Julian.FRIEDRICH@frequentis.com,
	upstream+omap@sigma-star.at,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v3 1/2] dt-bindings: phy: ti,phy-usb3: Add aspcie reference clock setting
Date: Sat,  5 Sep 2026 23:15:54 +0200
Message-ID: <20260905211555.15944-2-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905211555.15944-1-david.oberhollenzer@sigma-star.at>
References: <20260905211555.15944-1-david.oberhollenzer@sigma-star.at>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PHY control logic in the OMAP PCIe PHY subsystem has a
configurable reference clock selection. It can either use
the ljcb_clkp/ljcb_clkn pin as inputs, recovering the clock
from the bus (RX mode), or generate the reference clock
internally, driving the bus pins as outputs (TX mode).

The setting is exposed through a register in a system controller.
A device tree property is added to specify the syscon node,
register offset and mode value.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 .../devicetree/bindings/phy/ti,phy-usb3.yaml  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml b/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml
index 84f538aa587c..41e7bb42cbbe 100644
--- a/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml
@@ -52,6 +52,20 @@ properties:
       enum: [wkupclk, sysclk, refclk, dpll_ref,
              dpll_ref_m2, phy-div, div-clk]
 
+  ti,syscon-acspcie-tx-rx:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Syscon register and setting to configure the clock buffer to run
+      in RX mode (clock pins are inputs, the clock is recovered from
+      the bus), or in TX mode (pins are outputs, internal reference
+      clock drives the bus).
+    maxItems: 1
+    items:
+      items:
+        - description: Phandle to the system control module
+        - description: Register offset of CTRL_CORE_SMA_SW_6
+        - description: Setting for PCIE_TX_RX_CONTROL
+
   syscon-phy-power:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
@@ -94,6 +108,15 @@ allOf:
     else:
       properties:
         syscon-pllreset: false
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: ti,phy-pipe3-pcie
+    then:
+      properties:
+        ti,syscon-acspcie-tx-rx: false
 
 required:
   - reg
@@ -135,4 +158,19 @@ examples:
         syscon-pllreset = <&scm_conf 0x3fc>;
         #phy-cells = <0>;
     };
+
+  - |
+    /* TI PIPE3 PCIE PHY */
+    pcie-phy@4a0a4000 {
+        compatible = "ti,phy-pipe3-pcie";
+        reg = <0x4a0a4000 0x80>,  /* phy_rx */
+              <0x4a0a4400 0x64>;  /* phy_tx */
+        reg-names = "phy_rx", "phy_tx";
+        clocks = <&dpll_pcie_ref_ck>, <&dpll_pcie_ref_m2ldo_ck>;
+        clock-names = "dpll_ref", "dpll_ref_m2";
+        #phy-cells = <0>;
+        syscon-phy-power = <&scm_conf_pcie 0x1c>;
+        syscon-pcs = <&scm_conf_pcie 0x10>;
+        ti,syscon-acspcie-tx-rx = <&scm_conf1 0x10 0x2>;
+    };
 ...
-- 
2.55.0


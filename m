Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E964AA031
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637249; cv=none; b=f3JA+xS0Kb63jf4d09MqUKl66pW38bI5Vzt8kIOeZgb05TLFZ9VsEN3UiAd9mi6HzNcz+/wBgzCdbD1wfCdjwuGFDqUOwNKpkngrHyPVsufga97etPfVnk6QYqlkio3X/ECo5JraVFEuL7uFRvwRPTW0cW2MISOvAgEcx6kGp18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637249; c=relaxed/simple;
	bh=LRlsp+7Wkjv4NlQijqgL+btcCaWjo6W5DhGeHyIWFqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BD0zLz6dfXNlSOJGcLD9hmFLQouOQeA3ST40T8qfCWshdMFuJhV+NdKfOzDHkYtwlBlD3nsIxIe6nXLr5nslkGvNz223qxXARvU/TKS/6u4PiC1b3M0urBEnQOBEGr3MJMbpmlhGPPanMCYsD8OGLLIe7VhfDdru3YAbZaGd9zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEOfyGN0; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEOfyGN0"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso306773f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637243; x=1792242043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YO8Lfw0R/ZajnaY4WHrnUbXF7RAAHoajPla3LSdk9go=;
        b=mEOfyGN0HmYes2TO+J4lUy69XxGTpUbQD+Kn/54g9rKzS0T+EH8qhIojbZ9R2HjHpb
         +kXuMsuAj4ipeo2LGQF8Tvn9lyUx/Y8KYyUyfjeld0UIiWzjsuPG4TMe0eSwgRF95TuD
         Gb+ONA863W0R8zTPYTdP+5zxNncBOna5FjuveMzQh2yF4wnYhMTM65mPpE4c/2yO38D6
         KBAk1Dea9fngpzInJDFpt1sul0tV56oLl49reH4A3aQrl4omVsfqdJTOZ74Ta42bN1qp
         Et70aQ0T/tu/Z0l4n3UO87K1rNAZhAttjIUcccNzI4BZD8vl7Wcp9iToZWnwKTTFRKTx
         +Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637243; x=1792242043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YO8Lfw0R/ZajnaY4WHrnUbXF7RAAHoajPla3LSdk9go=;
        b=VBaQIA9Xy1UDXXkEC4r/pHck09V3/rctrDDzNHbnBqneeXYqluVl/wFsXyB/L++hF0
         4p2KcEEWg6sYolab5YGI1EeWKBzuImgXhxzrtXSvZAHKZVGw3GOIbQSgC8l+ys1HS2y3
         LIMj/hrAmzuOPsUK1FFCmK8MI+8a4idZdzwCd/X4rM4VJJd1DePfLDXek8GCuQe9v1LV
         9Zr1U7t1kP4IXF06RR1VFpMpDNbLXLwmMJdS3QDB+HBkoszSRUcl0Lb1kZsiK06y51q8
         I1Cl1D6Yvb4cmw+SdiGMkXWnk6P+BwYcUANlVfFi7e3FLGoDUJKISAWILirpdW39+xdo
         FjyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkqlaeAV5QuA+Lr+VYrK3WZjvOpFHZYzGG+cvnibNNe1HMgyDrrL46zkF+8olDfFxelOMYMdj8PnAsXUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwRL3G5CjdM+Dh9bCRUgTzdYSS5j4VfdaFJinJlvcKehdBvwSn
	kqBRZhdb3fhalw3mxdx2ihSBYZVid7cMJeNSlbSmrizq7fLx2s6gLKVm
X-Gm-Gg: AYBFou0zSPmfwoozfdwSHpHqEmj7Fy3M5nhuJ8vU4iaNPaeKdnAMpcjUE7XGTuTaKxB
	vRyDw/ghhMNNALLTr62HiiZ4i1DIbtnR6D0mse1aUBZAFdQfxrFy+x19J39lnTR6J1RuvCGfXOu
	A+zRlEg32tLBw5Jm4Uc3yDXbquspdDgPDBfamPxBB0VfE/Lqv2sTHvGAwCdMESUABbhQO+IH1pY
	Feq3knrdmqrzxeCNArhwDcuuSjGg6b2im+hANCXwVqeTJdJhaNIM/gCQMxZfoARFYMdzuwJ1jHh
	9Ot4g1pmZFon8zVpeBiwdf9y74Lj2C0vkZMiqz5zZ0XUIa0/1iYvkhG4pTfsZNOq7po4hLuok/Y
	SUjCHe0sFynIMWfSgol2FzD7I83MeuCh4kZp+XI/AlHrfFY34EydqX3c9vi3uOK6/i8gX+Mx9Z5
	veZ3xedlajsIrXDwsg1ssEgf0uRbqb9+m3BCUfd+mL+Wm1rdiJ+w3awwvhsQh2io3ErH/EvBsTf
	7lE5+5k5AmfSb/kk4D1noUD7HFlk0GIXAOlEAJ9r+nqZO8rEBgdxHfjA5yUGqC7xPubKCS6N2i1
	dPEjLriQQ3tHD5fElrPkuZlaLk5ZCpNfq83wRxfnVo8UAp5k+7Y/5hCYeQZb3g==
X-Received: by 2002:a05:600c:3ba5:b0:4a1:70d4:c69 with SMTP id 5b1f17b1804b1-4a18e4c03bbmr101466895e9.28.1791637242847;
        Sat, 10 Oct 2026 06:00:42 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:42 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 14/24] dt-bindings: net: Add ZTE ZX279128S MDIO controller
Date: Sat, 10 Oct 2026 13:59:52 +0100
Message-ID: <20261010130024.177503-15-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the MDIO register block and its work/register clocks. External-
PHY pin selections use pinctrl rather than direct syscon writes.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/net/zte,zx279128s-mdio.yaml      | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
new file mode 100644
index 0000000000..49ff7e7b1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/zte,zx279128s-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s MDIO controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The MDIO controller of the ZTE zx279128s reaches the PHYs of the integrated
+  switch and an optional external PHY. On boards with an external PHY, the
+  default pin state connects the interface to it.
+
+allOf:
+  - $ref: mdio.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-mdio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: work clock, the source of the management clock (MDC)
+      - description: register (APB) clock
+
+  clock-names:
+    items:
+      - const: wclk
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    mdio@9a101000 {
+        compatible = "zte,zx279128s-mdio";
+        reg = <0x9a101000 0x18>;
+        clocks = <&lsp1crpm ZX279128S_LSP1_MDIO_WCLK>,
+                 <&lsp1crpm ZX279128S_LSP1_MDIO_PCLK>;
+        clock-names = "wclk", "pclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&ext_phy_pins>;
+
+        ethernet-phy@8 {
+            reg = <8>;
+        };
+
+        ethernet-phy@10 {
+            reg = <10>;
+        };
+    };
-- 
2.55.0


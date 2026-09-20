Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360B048C3F2
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933550; cv=none; b=nvSOYBG2UYDiiEOvX5Yxpdhci815qHautwACOvEzyo8kZprnaZBE8dlhe5csta9daKHzgRODJJaMtPFGhmNiw3iWBDdlVcwov33hYYsOWD9j3O75moBRa2/JHKuJH3Ln1eOos3KV1JCv/VVU2kDdIifZwAcG9PZHOaeW6ixdKps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933550; c=relaxed/simple;
	bh=Gj+LzOejuhn4QUWRd2BeQZ06xMLgJHxeiRX4lCDRZzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJv7F8BGXLNI7AZumACvW2uNz61yBPnpOAEi4aXqFZKogEeWNPRu/JfrXuRaVhnZzx6w0iymOrr5HeqK4w91B2GywFhblyMSOKwqa5su2pGKJUDHms3FRcJbX630ZbkhI/Wfc8YHvcXgsLcuH5rPKqpOmwhY/NROz/P0KDUzvl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6CCX2Qa; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6CCX2Qa"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46accbdfc39so2512396fac.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933548; x=1790538348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=l6CCX2QaYTWF0xmANFskLvprELdoCxBGDgPcQY3MP0X/1K3BAiXENuPTSpZxLGDKKp
         H5dABEwxYOaQJkrUcfbcpMwPFyHMVI0i6FJiPE50g/QE1uYDec1aEGhaRZ1op/8AuY3H
         9J2zH30CSgxzehNkNcdDL/BD0lOqfQcXrBgi6MgGDqh63iUmZSuobG80jjJ8NGc+U7KC
         KQbgjJ1jNVwSXFw6V1Fl7CXvJFnZeLx+GsS8S3fVqS17e0X0JEQA8Hg71K1bSGK6UVMm
         ZzaLGUiWbWFg93hkK77LgAtfyLOmoAfBLrKJEwlaj02N5/iVuF9Pf71401KRwfqiI6sO
         Scwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933548; x=1790538348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=vxOCGUrN1edFFiTv/VVs/E+p+50e/+e2iw6VR6ZE/tsLLj1E8V7D9kdbIze21gTZHY
         Vbrdixm9JjLk1W24yA/ORcpAo7BKdgDlTqcGlq/xflHpiPBE5dyfYCgrbdcG3ZcpXLTH
         jhz1HX0J7fgskXKd9DjR5ipOXGk2oMqUPhmYgNWMCMigPubxa+vzoWLuJN42rykcJou6
         gHg3xYyu3vESSqPh73hTAXG4odTsQa0O5gCSTks9i8OHu6NZPEJHrHpJ9g84pcrQ9zSo
         1FYWCkRuWcQaj3antmQVJRDaC2Sb8wi9MExDUuTxHyiwUUfiNU3bn94BhyeUPYP6bVYf
         HP7A==
X-Forwarded-Encrypted: i=1; AKwUvBwtTEkkaawi4qBIdDHB20KsVvYDpCMAueegVb+gBDuxBCTa9tKcpM1IkkdcCZtYQVdToKJyCqhy9xzWx0M=@vger.kernel.org
X-Gm-Message-State: AFuF++kFf8VPgO3yItpkMYGuEMynOZyDHDv/UtNr4uBGex5O16Y/H0Mr
	QXNy2+ImFHZkY3ydJ5Van7elYeQJi6Lqj7hDczfGmd3GUkZ2GMVYz5jW
X-Gm-Gg: AYBFou05CUUrQuTotnqM6qyaq5DncSTdmJYBbcDYPNa2kjvA5NX2bHY/BhaapsCYNP+
	h094Y3lBXd+xi/IvGHvUVyBulV7QXk9oJ1neglz53mS0kfj7MuTIIAAGDCw4dCwQ7VR7fE7GcpW
	7xefgvGnzwwI2Qh9w4XArPzvACzlvEGVo+Y9YHX6EuBvQKVeFqa9S3rKyeKAZWdRMjAI7KSBEJq
	f/eY7hNu8e44JhRLncv5x5+OmyFwcKLEyQ4iG+r3fKIjLkHXZtTdZEbztAyqSyua1B/PtN87ODw
	Kd1LHkC8Ol9zbCDHB4V7v+uImhd8Cud1fy1aLox9QlJGduC3og3NwVY95qN92Gv2tqcCKRJGnY+
	s26upu8NBoSuDvFKWQWyxSPIHGkTd5US60zy7voZGIpHd2dgsYL05X59JQ8KU46r1JjEhl9WKgp
	Faose3FcwyyV3spd00p3ByRKYXTqrK+UegfwAhVHx6qDR5eIp4rK+vzGeciAOcdOvzNaQTvrgJq
	qa16XlLE2iPAfC1iUAbNoCrtvZf+8x1o3bHQUzLGSphKZBy4pXD1w6ApCIrFUXJHrwi1JoH9wNT
	pU6XiIHt6hntWQNcYBG/HqZDuCYkcaaJJSgpY8EmLtfUORggD+XiTFIqyPFI1iGG1xgRQNzn3eW
	Y3C0rI1RimN8p02c0BMAr
X-Received: by 2002:a05:6870:140b:b0:448:cf96:25c7 with SMTP id 586e51a60fabf-486e5a6680cmr8538751fac.17.1789933548079;
        Sun, 20 Sep 2026 12:45:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:31 -0600
Subject: [PATCH net-next v4 5/6] dt-bindings: net: allwinner: add H616
 EMAC1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-5-8347dfe2eb7d@gmail.com>
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
In-Reply-To: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware.

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 13 +++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml       |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..2cae0133b3cd 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -21,6 +21,7 @@ select:
           - allwinner,sun8i-r40-gmac
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
+          - allwinner,sun50i-h616-emac1
           - allwinner,sun55i-a523-gmac200
   required:
     - compatible
@@ -33,6 +34,7 @@ properties:
       - const: allwinner,sun8i-r40-gmac
       - const: allwinner,sun8i-v3s-emac
       - const: allwinner,sun50i-a64-emac
+      - const: allwinner,sun50i-h616-emac1
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
@@ -91,6 +93,17 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        phy-mode:
+          const: rmii
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 0ff9e3284a06..3fa6e17c3d12 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -57,6 +57,7 @@ properties:
         - allwinner,sun8i-r40-gmac
         - allwinner,sun8i-v3s-emac
         - allwinner,sun50i-a64-emac
+        - allwinner,sun50i-h616-emac1
         - amlogic,meson6-dwmac
         - amlogic,meson8b-dwmac
         - amlogic,meson8m2-dwmac
@@ -623,6 +624,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0


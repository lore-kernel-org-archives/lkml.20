Received: from mail-oa2-f13.google.com (mail-oa2-f13.google.com [74.125.231.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025894CCDD7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499019; cv=none; b=OuGUQLTR0VmjkWS7ULsXRKZlqELe8/wjsqvBKpBzlwGpRt4VDxRMtCIGQmDpK34EcIlmR/3A8l4b/b8vWZhZ64LkT7INeRyIx1349Zp+gL5K2A+vTi1YDk+71mCRMcuoxpEJPdIvHosmfEKiavFpLJeUt+6UNbRcO2liv3NU9jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499019; c=relaxed/simple;
	bh=2JIyZIHznyDtQqCAOgu4r0hfKVY221r4s//QaqUnxzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rz92AunlnPG81G3aboXRDa4qQxAWvn8idch+5Afh1TP7WIAWkbd9p6Oo/YydnBn60sSF7XXBJSM4tXL8ssQVx3WhsG7w5K+Ebr279JNbLEsgkNuwJIkF69nS71l2yLz/IT4UNMwhvnVw5n9+iJWtODpRnjUAjaN7NTbzJFM6JY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAKb0A5G; arc=none smtp.client-ip=74.125.231.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAKb0A5G"
Received: by mail-oa2-f13.google.com with SMTP id 586e51a60fabf-466ccdd7695so73267fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789499017; x=1790103817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JW8jFyLPHvei3ZpNWECcPkSmFiI6d1/AJVTjb5PqVkk=;
        b=OAKb0A5GtKEkUVxAqhBf6QoYrynU4W3MWb2+BwMJQQ474VnCd0FEybMFNXw6gm4jvf
         R9G7IBsqLTGhtmYTR5E+pfYeDSlgnceue3pkF7j//V5Gr/1vync6yUFaouONIgna3Iwo
         P957x3vBUnShmCCwYbWm8WxxnhzBrMUSBKgFt63yll/oiZS8aByq2nbCWl3PaMjbBWso
         2s/FzF8p/p1c2Lr+yRAdYnkxZawMozJF8h/qzbyEMEvPPdFxshea9Q1JsTPazcSKHVUr
         peqgEE80KG8WwmXlUmksVNz/zHJb+0hOeQALkIybXI3E5slmlN0y4ShV53S8wULic32M
         RHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499017; x=1790103817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JW8jFyLPHvei3ZpNWECcPkSmFiI6d1/AJVTjb5PqVkk=;
        b=rGiOPFg7NxPFW7Ax1zKVtHUu2TzE3sJHorjvyFcUwHZGGxgvR53I7fzJ5F7q2Ligj0
         HEEYZTYYo+K6lftFE4p5hpaaoiYVY1CbmPR4U76I/UGLroo3V9haPbEWEbXzx0k4NBF8
         qixsQayVCaL2MBGgVNWye9rU0VhaExDFU/NpSrIiOmjNoOIITJ2PBv/w442dG09CE/ZY
         ZomSDusjDQZfJfmQ/NGoiT32voHW2fdlh7OLDnIv0iL5OCmMOApG1h3F6NRzKjTtUsDk
         fMcLfX04W2kwRAhxM3M4YxmjyOWeK9mwrv45VHSe8h9Cnq5QrPhEmSeQMac6bal8w6lj
         I34w==
X-Forwarded-Encrypted: i=1; AKwUvBzMz9QaJfHXnQpgpPFXUe96FYav1v6cxMG1ja03hoLFs7UdbBSwovUcXC1l4QWnno4o1s7TZfrqrbn21nE=@vger.kernel.org
X-Gm-Message-State: AFuF++kDp8D40XxOCtPAl5uFG0JsVSpWKoOPwxqu8XtcM3fgf+xSHiu7
	FXi1R4t9B5nHkRVgssiuBL6KxUDKkAqQIUokjznNtXKYo2QH4GKiRuRI
X-Gm-Gg: AYBFou236q8nyq9VeFVp+61N0rmS4c+esQs3UGR/sORHAAJhncABtmOD2U5FlEnjjvb
	BVIpib8glrlF8taa91+21ztDIIL//aXVkqcDlbDkTPg0eSuvq3MQjmp0bEMM2kwTVjvcgDmS+oJ
	aYZi0/rdRxhda9HK/ruLdjN+2lDMJQ69S5CjtMN2HJ74hSGOBLHGftl+v6z3AYEGeIKvTsoUqPb
	BquYnBVLcGUTZ2vZfWLsg25YUckZtxBNzeUuUysEsp3xorrKNMSz+ihIyF0l2VVfZi1EjuwApAX
	0bVCbmLxT6i7MIgKcms+cxijR4L8OR3+VqHC3+Knc2Z4E59ulWDQ1/ODwiPrBSDD6ziuR9OC59q
	Kq8SwaFSd4q7dm30tPCcmK1sqxGx8RmIUCYRS6gFxhaDABrlf1gQxmA9zm0DcUlWH/MO2OizAN7
	lsecA9k+mevohzH8xepl92S4TzAMySuHlmQxd5Uj+8uM4QdVyXS/I72B48TzuceG3wgB35QHAf3
	aRZ44hRSEL5uJdudbWyMYf3FCtGdu9Y/trsvkBDuIgQKKDOEH5SEV6tOduM4vVU/buagTygmng5
	1UBwCfgMCgwKPL0nGelANqrIZGuJyvepzTvo/eTmN3Wm3LSG2lZ+jdv135ydYWnw0a0NO9tSuWy
	4i2jtEEylbcy0pMmS8ycAQhM=
X-Received: by 2002:a05:6870:e305:b0:475:a112:1279 with SMTP id 586e51a60fabf-481fa3a2804mr6618423fac.38.1789499016683;
        Tue, 15 Sep 2026 12:03:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842546a51bsm836569fac.0.2026.09.15.12.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 13:03:18 -0600
Subject: [PATCH net-next 1/2] dt-bindings: net: allwinner: add H616 EMAC1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-submit-h616-emac1-v1-v1-1-195de0bb1f8a@gmail.com>
References: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware. The
EMAC1 clock register also retains the three-bit TX and five-bit RX delay
chains, so allow the existing Allwinner delay properties for this
compatible.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml        | 18 ++++++++++++++++--
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..34def84e6c21 100644
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
@@ -100,6 +113,7 @@ allOf:
               - allwinner,sun8i-h3-emac
               - allwinner,sun8i-v3s-emac
               - allwinner,sun50i-a64-emac
+              - allwinner,sun50i-h616-emac1
 
     then:
       properties:
@@ -109,7 +123,7 @@ allOf:
           maximum: 700
           multipleOf: 100
           description:
-            External RGMII PHY TX clock delay chain value in ps.
+            PHY interface TX clock delay chain value in ps.
 
         allwinner,rx-delay-ps:
           default: 0
@@ -117,7 +131,7 @@ allOf:
           maximum: 3100
           multipleOf: 100
           description:
-            External RGMII PHY TX clock delay chain value in ps.
+            PHY interface RX clock delay chain value in ps.
 
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2ed4564ae99d..b20149c3e850 100644
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


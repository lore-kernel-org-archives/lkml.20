Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C52338B15E
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272325; cv=none; b=vEZ8x7jjVGnovfyQvD1Nc/zW1eMe7LuuhbQl+0WxITCyRcRNAqR8azsRHuZ+jR5QAEFozcHF3EfiMLUva/koJ21qdzMtNCxhLEDpPSASXbdECzhvEVFV+oL25e6UEaZKgnkvIjCp8p6Z2kXJ15TcEiLHvo4sVMtpzCD4SO6omGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272325; c=relaxed/simple;
	bh=TnmhAN7UAS2ynuFEOPQLlzD2wvbIo/yeVWwhOMqNS58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lSKeM+nh45n+ve/zdK0MZbeZzBPKVTgTFAIXCvkOm4of3nusp28s5gU5oEKsUpAP0tupn2VFSXuTIAI9hSO2jzHqrHXq7Fxxhj+Egvl8bUmjb1T/wDiSrnvWDvVWtwLMzN9HqFvI4Hz1GFkyMkzkUmgDGGeBwz1vW09iCDfQs3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmqLCzDO; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmqLCzDO"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46ac6e5d8f7so345854fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272322; x=1789877122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=CmqLCzDOCu2p0HojwwpR1/zb5q/OFzzSc020JhWJBWm/N5wGyFAp5CSQMtGslLQudI
         IxjMYO75GY3DDfTrDDfvTB5+hpGSRiHkUl6LNSJUtPKqB/cD2FgFVt/IJ+E0fp4zJc50
         TFKGScYeKSkkgwutnwDdXONU+2rTC/d6XHssEjc8Ho0DV1VCmHKz57ypJRTkXTsmgruS
         3OLEHQryiZ4RGgtrwPrzoQCLXhzZtN+EtOmsR5YA0Dk0eV1g/9UyedeDRkHurFTFjAKy
         nxI1AoBbqInKwOzzZWVs4Ka4g/q13HfPnTcL7kSvSwTU9d1CnphFIAy4toNbtcN5SiJC
         FCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272322; x=1789877122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=PLEwCGH7lvtPDnQkDls34RrW6wHxzUZbVZhejDTN+gdthErE1U5mea+USWlo4P0ECl
         ScerNdx2LbypDTSCIJv2rEMpVqWMXE3m5MC7RpOCO8JRTxJnbC6LV22UMOrT/3POe4Co
         omDrhzcuwJktKZKJ+JKzeyG2FhF88ZZuU5LfbKTv/xNWkns4AubXimFN+ER52DlJhGHN
         q0lqO0JuGPsTxjxIb+RfDDtUdUAFUIbGPTckuWbKYYfYgi2mhaIJak3Ohc8pvYJEf1KZ
         Ommh8GwBrfS5GFy8FVv0broe2NxLuOpNNM7BXXqxiscjGoBpv5+wIg7NPQkNyIRtLlU0
         iJhg==
X-Forwarded-Encrypted: i=1; AKwUvBydDwoyLYb+6GfMkiG3JP9m9oK9nxmaTCmLnXf0L3aK+YM6w0PNezYlTb+81yf/poNn2hr4+8PBDjQ+FmA=@vger.kernel.org
X-Gm-Message-State: AFuF++ny6Z0yyt19/onH8LAeJb7s93M+HFnr7z6RqFRz3zM0JNWAtLGh
	OF3eJ058JyhWAYDW7n2a4D3GOB+DtdUsb2trbrNouo5lJeKZSq7SZQGc
X-Gm-Gg: AYBFou0tzvb5tlB8NQ430uHtZFEuQ3DNRKUSlFyLIJrt2fw0TQNr/wRR8PaPZXSo/CE
	e17AZXhEmUHBwsytg6oGUCH/4+YQRns1In+t+AgF9ZnO0aO4/2jcAeJaZ4zCFlguvM3Qv5UOEl7
	VhpRdQexETAKa/TZlbFCgRkpsLfetPNFxePRU4g2diF/mghb0tkfjbGPQYM0gZsqlzhMWyUA2o1
	dYFMo0oxF2pMHJdtjMipDRowQXHt2tbYjvDA15jgXcd0Eo4jxz5mBGq3jBIdULxfroKZPbuvy3U
	zfO/GAVdNHG3bJ2N9Fa9NBrCaRBCyKqTHhW/Gom46+koUplJZFRfUuVeS+KHm1kakENQuXSCqN5
	7I+ZHz1bbvbn9t90FskH8f8pW9TiUzvhK0I88IFsFjOPG9hvnc057hiCo53FMOlnKhsXIO5eBy6
	3bw7lFYK8kUDmfwj+fYTmK6VeCveTwPj/9h05GWgqISUJOzcBfwqLV2UYlhei4S+w1Si26D4dpW
	xW6aXFDXgVqxkLfBysoEdulBRS6dkDKqSi0Zjt+z4HD66NAVdGR59W//++FFkV5mUTnnkNi0Hnv
	tcR8zU7ha1JigeYuGrSYfFnwRsDwVexLmOHQ/8q7iQN6EqduSi9i/Q2/du8nNwNQOW6Okx+Sqjj
	3p9ZV5ktk+ULyA5Y9kpyrGgcje558/g==
X-Received: by 2002:a05:6870:82ac:b0:475:e0a7:9f32 with SMTP id 586e51a60fabf-47f59ca2579mr2988460fac.32.1789272322076;
        Sat, 12 Sep 2026 21:05:22 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:01 -0600
Subject: [PATCH v4 10/17] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-10-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware stores the bad block marker through the
controller randomizer. The mainline driver instead compensates the first
two randomized bytes so that the marker remains plain on flash.

On H6 and H616, the firmware also uses a fixed protected user-data
placement while mainline fills the OOB space left after ECC. Add an
opt-in property selecting the firmware's normal-page format for the
configured controller hardware-ECC geometry. This covers the
vendor-specific randomizer, bad block marker representation and protected
user-data placement needed to access BSP-derived images.

The property does not change raw-access semantics. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..8ecafc40ddcb 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0


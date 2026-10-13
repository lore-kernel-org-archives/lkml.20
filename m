Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC5E51C047;
	Tue, 13 Oct 2026 16:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909484; cv=none; b=QCvmt7PboeblSYct35th5J8CDq/mSKyytIxDPyIw9zhZzVncAdZ6nSafUUCDfAGH1pfgA3Fvox086KJTjWygO778hcvFJwny2lmBnH2mGH9R5Um++m9oLloD/diZjUEl5hmmQvqlk+Wc95G94z6miUbs1cJIVcQJ1sPMRKbid4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909484; c=relaxed/simple;
	bh=90E4Y3iv3wZWZ7rk6RLZc9iA+z4ETFdFADS8b0uLgEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qZELnVB6EEn4ogr8d2ItsQlQcpDvvfHNtsBslSYn7uNv8FppsrdZEtVfEnNycSSzPKBeuEzvY+pfIlCUFJsa3wpuD+Z9MPaW4MKm6sP7Kr4AvdpsYG1PJhIk90zmDW6jHdcqzqFMBzd6JN5E9bBgMBxz/v4BeytLxHw4xIgI3yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=XoACY4lJ; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="XoACY4lJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791909483; x=1823445483;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=90E4Y3iv3wZWZ7rk6RLZc9iA+z4ETFdFADS8b0uLgEQ=;
  b=XoACY4lJGiPp1Hv1OarNy1PO5gJRl0HCWEGO0wnE0eExzWCTX2/64UT5
   PzZ5cHHyBjg2zbtdAGtyXMCo1TRgKlK4QG+BGsZYwc9Qr8+jhYEigYjpR
   GM5x7u1xGo7YFE0BiZ/aBczGktgwjdeW+Fn1JMdv4wWPY5E6jYzkK6Ecb
   jE/8lo7356RyLaI60tuvUGNenFdEp5lfSWKWU5yTRjavSN8UhtlIRn/im
   TBLb8Hx8NooH3mmIX2wex6JfaVihOXoxA6diBpFjFpPTwBy9WLa6AlSva
   wCIFgTHaU6pTKJnUG6aG2U+T4ABXy+XHFzDt1cnKB0DKJZwmLsoI4DPpa
   A==;
X-CSE-ConnectionGUID: s07STZ+qRmK3MM0z9piNRA==
X-CSE-MsgGUID: fuvovqN1SIaEwS/pH+fkhg==
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="296388313"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 09:38:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Tue, 13 Oct 2026 09:38:01 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Oct 2026 09:37:57 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 13 Oct 2026 18:37:26 +0200
Subject: [PATCH v11 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261013-cpitchen-mainline_gfx2d-v11-4-7527f2efab0a@microchip.com>
References: <20261013-cpitchen-mainline_gfx2d-v11-0-7527f2efab0a@microchip.com>
In-Reply-To: <20261013-cpitchen-mainline_gfx2d-v11-0-7527f2efab0a@microchip.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Cyrille Pitchen <cyrille.pitchen@microchip.com>, Manikandan Muralidharan
	<manikandan.m@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=90E4Y3iv3wZWZ7rk6RLZc9iA+z4ETFdFADS8b0uLgEQ=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9a5uEDPrReCo/8IaM7a3VV0x8+8qpXJQCMrUfLSxMIPO
 geaip06SlkYxLgYZMUUWQ692dqbefzVY7tXolIwc1iZQIYwcHEKwESs2xgZZl33V27Y41beLB6n
 vcH8wNJza15oxLCmT8n4ciRwafMdLYb/RcvO3LyWcsvEsz9QvTexQ6hOZOfyzY8ryw5HZsqsSb/
 KDQA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D

Add support for the GFX2D GPU.

Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index c680a5033b6b..5450fddf89dd 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -292,6 +292,14 @@ AT91_XDMAC_DT_PERID(26))>,
 			status = "disabled";
 		};
 
+		gpu: gpu@f0018000 {
+			compatible = "microchip,sam9x7-gfx2d";
+			reg = <0xf0018000 0x100>;
+			interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+			status = "disabled";
+		};
+
 		i2s: i2s@f001c000 {
 			compatible = "microchip,sam9x7-i2smcc", "microchip,sam9x60-i2smcc";
 			reg = <0xf001c000 0x100>;

-- 
2.53.0


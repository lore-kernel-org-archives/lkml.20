Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629AF4519B5;
	Tue,  6 Oct 2026 12:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291451; cv=none; b=FsHgbwwL/ODYM5m0h1aqTzSS+cWH8a2HbDvbLnqWTWi+/bmrrvFDqgO9PG9fa9elKK8ltS6dBxrmmXVs2BnWDOhhnYYZ4+0nLKL+zn27vBZUAxXpUWWXReQZ5yv47m6DDCrhRWWqJ+gmDv5pX5mbBV148IUav4f6kKnwRRAY/QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291451; c=relaxed/simple;
	bh=90E4Y3iv3wZWZ7rk6RLZc9iA+z4ETFdFADS8b0uLgEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nKFq6QTYUWWEbSK9qcvkBAsPd/G0NNFjZ6dnwD0Ek8tYd6ZqWLTjhC/6DWdfREYied21uryI0ckPGlJrOS1unxYP05IXSjQs/SWHtQgzgw/HeN77TDz1M7PUpsNZmhHHnZIn8JJSDZvk/H0f+PpTAIPagXZUVbI6z/rLFwDTQNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=vYP6sVDR; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="vYP6sVDR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791291449; x=1822827449;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=90E4Y3iv3wZWZ7rk6RLZc9iA+z4ETFdFADS8b0uLgEQ=;
  b=vYP6sVDRXgnG0qCJYxCpO2Sl8/RDnDGQYJ7qUkBB+LSkYu9krA9YjVuR
   CGc2Ljm+mpSP2hCg+HrJ9TTYk0ZCw+oKoeysAigdRhksexNh3wmiGn+zl
   K767ff252nUoHbWnl0I92DwU5em0sYoB5mE1GHv8VRf1gOyqIMvTYadhW
   QdLa7IVzB62GFkpGPalxxcXX3sAuj8auNWwuOEyNbY3WecWrDwCrM/srh
   GWmrgl5dD3pHTkY3aVf/G+rvVzjzGdqxX6aDZ45tp/58+TRk41r8qDKFW
   fKMWW5Jrp9q85mi5p2YbQ4iNZjg94+PsE9XilOlKq5W++AwU6cB/sE+aC
   Q==;
X-CSE-ConnectionGUID: oTYxfA/dRDOOO6oih+iojw==
X-CSE-MsgGUID: KuMQzZxvT1CZRRjiYGAdsA==
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="63701587"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:57:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Tue, 6 Oct 2026 05:57:28 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 6 Oct 2026 05:57:24 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 6 Oct 2026 14:56:36 +0200
Subject: [PATCH v9 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261006-cpitchen-mainline_gfx2d-v9-4-74bd3df2e183@microchip.com>
References: <20261006-cpitchen-mainline_gfx2d-v9-0-74bd3df2e183@microchip.com>
In-Reply-To: <20261006-cpitchen-mainline_gfx2d-v9-0-74bd3df2e183@microchip.com>
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
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9aRDwpuYn1KRlcjNqQxnLKa3+oZFFrrEvOJzS0idZPx/
 eYpJ3Z3lLIwiHExyIopshx6s7U38/irx3avRKVg5rAygQxh4OIUgIkc283IcKunUDRgt4X5vwTf
 i+8dzqd16vUkfQmXcat1qTywwiyln5Hh5MRSyTMKtntZS7atYS7c8fUHc9GRR8mJLaeLnoZmT+D
 iAwA=
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


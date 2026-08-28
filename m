Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B65371CFF;
	Fri, 28 Aug 2026 15:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932409; cv=none; b=D3ZWExFJi/MUgUat8fUe+acaCNXXXaojX92VfW806DHiaHCXT9VrcTE4SK1P087nKuL2KZgVC2sIL7p3wP3+uiH+4IDQY99Sl001R2c5/xsVuKOKw2ePk8RGP6aaLGcDWR9ujAM4ODcHiF8/OB0lfMNgvwBPit/LaynTzUSQeQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932409; c=relaxed/simple;
	bh=rul8oV4bLn598lIb6gr2RKI0bv1EPl+VpXNSLDe180g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UYXOwRhwG1D232Akp6R7saZI1GdZOKE39gm5Mdyjun+dW906KHp5tvCkGV057WRlWRlbGqG3wpOBItdzqTFrsiRN2cvB8Mx+RpW7txAsS49FUVa3hR2sEqkRSQzpgjKhYwUI9CkiTw8/i6pEYdEn5TrTN/VvhISbmMwm+TjnNVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=zcysypdu; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="zcysypdu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787932408; x=1819468408;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=rul8oV4bLn598lIb6gr2RKI0bv1EPl+VpXNSLDe180g=;
  b=zcysypduE/ffseUJT/bwtmMi5xxfHq/9F6NbRAA9QNVTgImcpt8r2Fij
   IvgmPqB6iDEjhglNvyrRnpukVoX6vX53NaBA45XLEyLgd11Kt9Ozh8bCd
   e7vzo+SUkhZ55cAM4qNCh5DSITZPGQaNqwvO1Seq4sapGAjmmVl8NEVE/
   YMxbxJQK9zStaYSSamV19NutXh3Jdp6/IfbYzUFQ2mOaB27BxjTsiBtxr
   kE46f8xOLA2swMrXQDPcjsrb2bON/nePd3wmiX+NzOKQB2zL0/SNEtky3
   +faU7EMLqWr1NPKwP1QWxqEhZWo+n8Cqb7J2TQ3CfIVpOuiESiEc3X0K3
   g==;
X-CSE-ConnectionGUID: j5/KmXZdQsSFlgTWsaTc8g==
X-CSE-MsgGUID: N2KYhVp+QAqc84LomdPdzg==
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="63124554"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Aug 2026 08:53:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 28 Aug 2026 08:53:21 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 28 Aug 2026 08:53:18 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Fri, 28 Aug 2026 17:52:25 +0200
Subject: [PATCH v8 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260828-cpitchen-mainline_gfx2d-v8-4-378374559738@microchip.com>
References: <20260828-cpitchen-mainline_gfx2d-v8-0-378374559738@microchip.com>
In-Reply-To: <20260828-cpitchen-mainline_gfx2d-v8-0-378374559738@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=rul8oV4bLn598lIb6gr2RKI0bv1EPl+VpXNSLDe180g=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9bEdXcDmQKiv+4W+ZKx9vNx9Zl1P0KmW97a8fXYidgTr
 547FW2T7ihlYRDjYpAVU2Q59GZrb+bxV4/tXolKwcxhZQIZwsDFKQATeSfKyDD74pPJHl9eLnXR
 WnVCXC5W334n1x157gPfnPxYJ8nJvZBk+B+unJ3qKNIW0LFgxVbZAqXtNzYKTz2c4Srxa3LikRX
 q/hwA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D

Add support for the GFX2D GPU.

Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
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


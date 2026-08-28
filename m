Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033A2371897;
	Fri, 28 Aug 2026 15:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932400; cv=none; b=KBaoPjd6Qzjy3IEaljQiGelF10NRYyxSb/sWg3lzOeJW4wYL4/ORakhgW04PfSn1/t4F//idr5gFVFHiAXRd0qBKrSRsyweAq4rTxdlKUZD/M6R7CfAEt8g5r1qNO2+mipSSXBvhgFDjjcCZ4OKUah1NT+qKPv0zT6WOJ92L92M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932400; c=relaxed/simple;
	bh=tIb/+8izPT3zjd9BLKBDtKJpX8Ccxl+fD8XLn3TLvLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NRgrnuUqYW1PBPXTsW+Fblktd1d43luR04nZWbWHHCc4wwzlB2Tg5l6usdBHbFNNzm0O8JyhYlyiFkEQkmY+5Dxk2vP2mnVVxrX2zFSSUfyUM62s3Qi60twhZuFyK4V99gBGSwzILXmGZsoJGWmoll/Cs96lLHt9OsL22GkIEd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=T7XoO0/+; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="T7XoO0/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787932399; x=1819468399;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=tIb/+8izPT3zjd9BLKBDtKJpX8Ccxl+fD8XLn3TLvLE=;
  b=T7XoO0/+g5Tw6moDd6JVjmXfBNfGtwPVGt9rT499gSHxNrDp36I91PMg
   xBxu5qwQWRChos4Sb6SthTwBHdzJiCfbtzwBaFZNQzebwNQLnasjarhhV
   vNarMiWzFXlcyRCeHogEqkk2Daas/38KqOeBfuG9EQ8hhL3GgwGWUbqef
   Ha41EKowvckL4r+AcuDzmaSKQrst7q03NNSlyYn4HkUOJxo/OTvnyfsUf
   DfjlOb1TXETvl61XF98x6ZADviChjyrZasWufYCcN/CBeVym15JwgsUxR
   DeCVCM99Lv7c5EBo0WwYnN5QrbF2bl+iSjqqfa7JfGt2105oVL7/tZR9w
   A==;
X-CSE-ConnectionGUID: UCJbBfD0SCG74KGl9MMFqQ==
X-CSE-MsgGUID: /PKMGB4lSki/pQ7s8pSDcg==
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="294208082"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Aug 2026 08:53:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 28 Aug 2026 08:53:18 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 28 Aug 2026 08:53:14 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Fri, 28 Aug 2026 17:52:24 +0200
Subject: [PATCH v8 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260828-cpitchen-mainline_gfx2d-v8-3-378374559738@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=tIb/+8izPT3zjd9BLKBDtKJpX8Ccxl+fD8XLn3TLvLE=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9bEdXfFdQwP3A5Km9bG98+yQXjD/32uesde8Tx3vhy60
 6nlULF1RykLgxgXg6yYIsuhN1t7M4+/emz3SlQKZg4rE8gQBi5OAZgI+2+G/2F1b7kXKL2dkhMf
 dCCHr3Oq0EalwqWHBC31vYwuBiuU5zP8FdtkuDjgyqa5j8JS9sxz2T5Facex/7c3sjv9ia220FL
 ZzQ8A
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D

Add support for the GFX2D GPU.

Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index e708b3df4ccd..1155f4f997f8 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -351,6 +351,14 @@ AT91_XDMAC_DT_PERID(26))>,
 				status = "disabled";
 			};
 
+			gpu: gpu@f0018000 {
+				compatible = "microchip,sam9x60-gfx2d";
+				reg = <0xf0018000 0x100>;
+				interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+				status = "disabled";
+			};
+
 			i2s: i2s@f001c000 {
 				compatible = "microchip,sam9x60-i2smcc";
 				reg = <0xf001c000 0x100>;

-- 
2.53.0


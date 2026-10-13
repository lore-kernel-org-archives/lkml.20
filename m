Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0307451CF51;
	Tue, 13 Oct 2026 16:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909479; cv=none; b=egqOzMsfngbbX1JWJswGI+mAc9xAl3rgkd66xbfG00cdjS0S5YLPCaTgu8pF6tGYikbq25GeTLb+ZPZbQDDIG+ns2Rk4T28zSBVb0gzriCmrHh2wLBhYzxhe+Orv0RAsKNcpex5207SKJCrjtwFiBGgiTVQB/ASU4PG5R03UJpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909479; c=relaxed/simple;
	bh=+u2grcbCdhxCd975l0htRzcuvftDxE2QAvyE3v3OQ9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YUC+SJzUZDvzbnbmk8MFsGr93cn20ZZwOI4VDLz97QIzRE8hpVyNGRUE0hrTwcF6eQUbaSnNTvwMKIkkhCNsaPSZeVvzg8+IrnzgYghiFy/nEcS0G4eAsJu8dON8sbOO6MMr6Sa+neZRydLaIwV+Bi9i9o0axCnWzMJF5hpv+Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=BM7PBBQt; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="BM7PBBQt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791909483; x=1823445483;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=+u2grcbCdhxCd975l0htRzcuvftDxE2QAvyE3v3OQ9Y=;
  b=BM7PBBQtKcZ4gLOkHrMrXy7Ivc0QeTXxXgyKUeNfeIvnMo1B1+tGzsYr
   MC3TH7JHZrIkrR5/e+uy3J0hR8V1PFVsSkgGumZDzOSB9ALINRutYNRVU
   jE1vSuV2vWkITxwszcLRE598q32rQXgoJB9QQcES1g9/n+bl4tVTbZYel
   0cP92Ms1Akjk99vokS6YNEgvMsA8e3Scw9xWOF47itXCGf4OfHQe8X1u8
   wL2s7FjnyfhCWvXT0nSF2PEqXCHj/o6dAnR+yAFOv0WAaX00c6mcp3FmL
   oZrOylo4wS6M7fJyZLNSSeNEdbUIi+J9prG7KLQueCaUbhSG3LCv4Kh13
   g==;
X-CSE-ConnectionGUID: iemulpAURH6sc6gEF2PvMg==
X-CSE-MsgGUID: naGB6ideTLm0McSAMAm0nQ==
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="232062271"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2026 09:38:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Oct 2026 09:37:56 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Oct 2026 09:37:52 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 13 Oct 2026 18:37:25 +0200
Subject: [PATCH v11 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261013-cpitchen-mainline_gfx2d-v11-3-7527f2efab0a@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=+u2grcbCdhxCd975l0htRzcuvftDxE2QAvyE3v3OQ9Y=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9a5uEDTM7OtudtyTLl45myem7no7b6z0nbzJx3yL7p/9
 Fod99lvHaUsDGJcDLJiiiyH3mztzTz+6rHdK1EpmDmsTCBDGLg4BWAi2x4yMtzUr/nJcrBg3cGI
 KaIW1YqN/b/jyn3uNNooCdj9ur1UkYfhr0xRn3ZFvGhNkOP2GvGJbNbmG4U3+zd+aaoo2OibZ/u
 KEQA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D

Add support for the GFX2D GPU.

Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
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


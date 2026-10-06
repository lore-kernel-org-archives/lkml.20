Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403B6381EBB;
	Tue,  6 Oct 2026 12:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291446; cv=none; b=ohj3t4hEmepDqDt7uUVJ/0S9Xe/Ekc+Cbc/ZvErAvFkCzKgeJbovhGI64aBkF2ci+6d2+Bo5BqLNttfAPkGdJCGIsE5FU++SnrwiTJ2ugiOLMHg9zqF6zPgSAKicQdoRVpBwMUWq+VjG1qs6cnZzZiO+NIS8WWAJ0uRY42H1mWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291446; c=relaxed/simple;
	bh=+u2grcbCdhxCd975l0htRzcuvftDxE2QAvyE3v3OQ9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FfhfBDT5AOCHu5KOZV0II20eMgwwryw1pzxVu0Sujr25bB60Z1x9mvtQyrlnDSWiFX4dqPtYSUm7o4bhglZJ9Br77RmpCL0Fr7jtFxpOXGGszRt0UmrlpVMyZeJBIayTzYqZpCsCKCJSLvJPzgKhcyxMpn0DbLPYvHRmikyAUQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=H+yX/0Rw; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="H+yX/0Rw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791291446; x=1822827446;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=+u2grcbCdhxCd975l0htRzcuvftDxE2QAvyE3v3OQ9Y=;
  b=H+yX/0Rw1/YHAMCwvKU7yww7EZeIXJnEHGnC8z4fxRP4hbBlGlrhVFS/
   gzyIVAQhg2sZ+Y9HdyrwwG5YuJ9ANZ92xSU4oXZ5klyxCr0D3m11aFnc4
   yvYCFdZECNxnF9H+w8twpY8t5tmOMPytNGFX07T1RFqxt9Zu6bHDnUEjV
   G8Fmjd5LtB7jYzAT9GRcWdNDgbcw1rNfq8upJ10d8Wf2KW2klVZIxE5nt
   s8nbiZzOFxDWIWA0Z0cAX7q5sTF4ZNt8MpxhDyZOkk455oYupCa/2WoMe
   O+q9rYdw8d7q5ZaU7Xnj32kAY0gKQwQoC/ps1rcs+QezcVq37uaNxZSfI
   g==;
X-CSE-ConnectionGUID: 7vzj3izRSM27lgKYwypH5A==
X-CSE-MsgGUID: 7s+UZdmyQuGI9rQHoJhhjg==
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="296057287"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Oct 2026 05:57:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 6 Oct 2026 05:57:23 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 6 Oct 2026 05:57:19 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 6 Oct 2026 14:56:35 +0200
Subject: [PATCH v9 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261006-cpitchen-mainline_gfx2d-v9-3-74bd3df2e183@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=+u2grcbCdhxCd975l0htRzcuvftDxE2QAvyE3v3OQ9Y=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9aRDwo5fabldndCpzzZJ1bJfqUtS/8SQ3zQNVEPHSW9r
 x1P9s7rKGVhEONikBVTZDn0Zmtv5vFXj+1eiUrBzGFlAhnCwMUpABNJcGRkOMjYdOgC+9fJ0+L3
 OEvZujnOfcBwMeOWtefe5vspWY1TdBn+J3R6f1aPe57CdUI+hdMsqW7TnT8VvtbPDpR/+Fa4xEu
 JAwA=
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


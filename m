Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3004477F3;
	Thu,  8 Oct 2026 13:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465589; cv=none; b=LBn48yFZYnVTthOsf8AVpc6H3+1sUrekevqFKlPPHZArtc3tRGSklORdVdjnHCA2bT/88dE7tuWV5WJ4RxY+UTWX7CYyC+JFGtQNFqcWCvIiiJNHp3nB6i16xN91M6CruAJqLg1FfxEAoJyHe0Z3sfFKpOuwFThF1GUXg8tZrAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465589; c=relaxed/simple;
	bh=+Q3Zno1VCYhLi025pNDCmJZ5SJkmktbvvlNyIe3ul58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ew50EwqnW5VTzlUqUWOKRKhazXvuff7+NDoWaxOhgI8kKdc/SJGqNNzGt6lM/m9O3kuZHhiVmHe3gAfEe9/ENLJHDeUJOUTsaoq8RzmL6FeRS+eYLBE8PaP0PDWTaLkcB+zn3lOZiytQ7jldAolvgEtBR0G3AnAni0NLNaf5PAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=rdRT6Npr; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="rdRT6Npr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791465588; x=1823001588;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=+Q3Zno1VCYhLi025pNDCmJZ5SJkmktbvvlNyIe3ul58=;
  b=rdRT6NprgEPwy8jpmV0S1A7FlYVJX6lqSs8TxE7ZQp/GOtgfb+GQPGkh
   wFZek81jio3iRrfgvY2WxvAzAYfo9YoOgPIlt10wgdm0JXxbC7/wnhbsM
   dKCorVDJqBRKumcpOsAWfYBDPvFoh5+whKhSAF7oYOmiE90hrajBmO+XX
   To+RQQXOSucCYQ/rcNLtzQd0kvGqpDVAK1EKU/IReQ9R8MTh4hVTjvt7e
   q+emauwRk8umNw9hTKKsT/aSJsLfcMWjUeef2MYuUeQbndTtNGcbLxtP1
   I+OcFIIiW01YtndpRGtSipdJGkLmlMc3hSnzuZW55l5G91PgEwzKvBXQ6
   w==;
X-CSE-ConnectionGUID: RiY43zkkRCC0hmDKHauqLg==
X-CSE-MsgGUID: huQZLqcbR0Wd8tnYoaYSMw==
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="65038463"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Oct 2026 06:19:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 8 Oct 2026 06:19:47 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 8 Oct 2026 06:19:43 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Thu, 8 Oct 2026 15:19:05 +0200
Subject: [PATCH v10 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D
 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261008-cpitchen-mainline_gfx2d-v10-5-67ca2477b3d5@microchip.com>
References: <20261008-cpitchen-mainline_gfx2d-v10-0-67ca2477b3d5@microchip.com>
In-Reply-To: <20261008-cpitchen-mainline_gfx2d-v10-0-67ca2477b3d5@microchip.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Cyrille Pitchen <cyrille.pitchen@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=+Q3Zno1VCYhLi025pNDCmJZ5SJkmktbvvlNyIe3ul58=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9bxGWFyYXlXzErf5WeGSFm/ufi2PmWXeOKezU8XhL9ZP
 Ecja5lRRykLgxgXg6yYIsuhN1t7M4+/emz3SlQKZg4rE8gQBi5OAZjImU2MDCfMvlybtvwlb9aq
 p0dmN/gdbdSp6jpsNF/S/FJ9QPjFez0M/92XH1Pf7N2WX+KqILqjrThwgqnlxIOPVOX3X70ZcXD
 3MnYA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D

The GFX2D GPU is embedded in both SAM9X60 and SAM9X75; enable the
driver to use it.

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 830c6c0dbdaf..2a4a2d4c1865 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -142,6 +142,7 @@ CONFIG_VIDEO_OV2640=m
 CONFIG_VIDEO_OV7740=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
+CONFIG_DRM_MICROCHIP_GFX2D=y
 CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y

-- 
2.53.0


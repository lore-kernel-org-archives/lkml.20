Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FCB32E728;
	Fri, 28 Aug 2026 15:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932407; cv=none; b=tJwqgh3M5sZ8nxCAzUWuDYlfXNohD7IQ+dcnBEG9QHMZEaEfq3EtyOfHAHzLo+1vIhtOCXGJElReHzmjJvvJkO0cAErzm8OWwNPC8Jc89/Moh2+4X8NX5OCXKHSnJAcUR2Zy6xkLxXIS/DqgOeaNFbild8hmHuzeCNfz1+A67jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932407; c=relaxed/simple;
	bh=Hd0+xM+vYimkXMny85WCOa880n5BfRgByO9sWWaBvKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Jkv3NXNv22K09KBk14CHEJ4KxOPG5PPMl8VMEA6oBG5k1MfoTSqXjdkHeDF+U5/i3B5L+R6PcZn/6z2akSIapeLpNhWrioIPzY0IOcDB2Dbf5EOmz1BpmBNmONhg7Li1CUezlET1IjmH2KYG3JxMxuCrn+2ny+cksq3VE7F/8jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=xRGsg2Jb; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xRGsg2Jb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787932407; x=1819468407;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Hd0+xM+vYimkXMny85WCOa880n5BfRgByO9sWWaBvKE=;
  b=xRGsg2JbiObNud5QJk00sFRTwbiKOkjnvkVwA//RAk8jUSftihq8glWk
   4QdM//WwOt4lNehUkQcEK5GXI130bbG89HlMBw//AnOBgC3aRUrCrhjdl
   tBxOqoyrREmmTqAmqmNw1/O91ylO/j+VseTe9juHS73xtGWjzRpXIs/uv
   YRFrDGuP3QUy72veTft7Z0vjmOljg7vgVuilwlG2aAet4mUqqV3q1uoa6
   fyEgCNnivlDlMUiYEqV9UC1ZAtgbkuaF3Ht0/5N7eI46p/fSpokLOMLwy
   ntQ/pBiW5Z5XnzeRXT6MBmdLVRFSaAwCLNcw3CewF9/mlzrVsfKJL/PfH
   Q==;
X-CSE-ConnectionGUID: 646BmaG5RvScq4vZlyr29g==
X-CSE-MsgGUID: +ZpByMuZR0GEFXfc9W1L2Q==
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="62811377"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Aug 2026 08:53:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 28 Aug 2026 08:53:25 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 28 Aug 2026 08:53:22 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Fri, 28 Aug 2026 17:52:26 +0200
Subject: [PATCH v8 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D
 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260828-cpitchen-mainline_gfx2d-v8-5-378374559738@microchip.com>
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
	Cyrille Pitchen <cyrille.pitchen@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=750;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=Hd0+xM+vYimkXMny85WCOa880n5BfRgByO9sWWaBvKE=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9bEdfcuvNRpTzo6bYV/nxJDy46/jpqnl1v2mSvvj5hs0
 m+fq/C5o5SFQYyLQVZMkeXQm629mcdfPbZ7JSoFM4eVCWQIAxenAEzEYQfDX7Hjt2/OmdR0ziVL
 afrNmKuv5P526HIGhqw+PH9Fsl63/3SG36yaTwNrrm23Z5L9MIPbUfZXqxeD3fvkZRuXz20/e8X
 9HgsA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D

The GFX2D GPU is embedded in both SAM9X60 and SAM9X75; enable the
driver to use it.

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index e331242dece7..805573bf98c4 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -144,6 +144,7 @@ CONFIG_VIDEO_OV2640=m
 CONFIG_VIDEO_OV7740=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
+CONFIG_DRM_MICROCHIP_GFX2D=y
 CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y

-- 
2.53.0


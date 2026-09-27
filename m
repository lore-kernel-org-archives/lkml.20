Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105043D3D0C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506624; cv=none; b=jJIMJ0Udv7V3YraJHMpDOIVqP4Bv15Z/LeK72mgJ2II49V0IRULsgQk41A0R0xOItRlz8m0W7f2uJTz6Z1I3Hb3XFGioWL2siLh7J15CRYLAFG+eKIbXZssB5e0HGo+aD0nSkpA+q2WQ9I6WwzQNOg32/m8TxQFayaYhaCAVzoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506624; c=relaxed/simple;
	bh=/xNgx0C5Qk+rmHpba0lVw4kEWTvc+zDwxQimGQD1Z24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=og9HNVSSPxoQ7/AMXbSa5J+VN+b/AJfkeKcBPw60nZMaasiuIJfnKnihVfx6+Q2B9FE+Nj2xTzXE1s3/QqtRO92bOuzk4v9ILVo6x3N5WvDaLgRlbStKXN6C8+jVzfjyaNcM+ap+1/Mwxyujv3B7YcsDzDV/x4ChwbLp28zeO64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtjjsSSr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtjjsSSr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C1F1F000FF;
	Sun, 27 Sep 2026 10:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790506622;
	bh=7hec+lMEDGI9y3jbHt6Y6kArMIsxA69vRhR2rOPeIFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UtjjsSSrWF+TFt54/0px6YzSyUYzlv91ip/Lcs/KQAoOamZa5b/L9bVLQr1c49pr6
	 rZs4OMKT/daTgTbfTNw1O9OOYTok6mhb9QMqKwRJkiyCwrGaeY2p9A7BDpOqn8avNF
	 3TP1auOS0UIXwjNVcGySRRnQGMJMgawY5M/zIAOgCmnhwJ1Bt7k37sKB9d+LAkdn0Z
	 NDATEzOnvjtacpBm4OrfYt3I3wPneZcPuTpKUZT0UImruFzyG4vY1Me9Bv0gDjBBmV
	 kDq88JrH5NETzKs4MczRZfcEJemq9gWx+kNPnBOGmMjtD5pKV1+f6629p/jwNuZ1Y0
	 bEEYriCG4ctiQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/radeon: add a connector table for the Sun XVR-300
Date: Sun, 27 Sep 2026 12:55:55 +0200
Message-ID: <20260927105555.8771-3-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927105555.8771-1-kaloz@kernel.org>
References: <20260927105555.8771-1-kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sun XVR-300 is a FireMV 2200 PCIe (RV370) board with an
FCode-only Open Firmware ROM and no COMBIOS to parse, so the
generic connector table leaves both DVI-I outputs undetected. Both
XVR-300 SKUs report device ID 5b64 with an ATI subsystem ID rather
than Sun's, so match the OF node name prefix instead. The table
comes from the board's FCode.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_combios.c | 51 +++++++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon_mode.h    |  3 +-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index b3e7a747f11e..096f953c67be 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -25,6 +25,7 @@
  *          Alex Deucher
  */
 
+#include <linux/of.h>
 #include <linux/pci.h>
 
 #include <drm/drm_device.h>
@@ -1512,6 +1513,14 @@ bool radeon_get_legacy_connector_info_from_table(struct drm_device *dev)
 			rdev->mode_info.connector_table = CT_RN50_POWER;
 		else
 #endif
+		if (of_node_name_prefix(rdev->pdev->dev.of_node, "SUNW,XVR-300"))
+			/* FireMV 2200 PCIe with FCode-only ROM, no COMBIOS
+			 * to parse; both XVR-300 SKUs share device ID 5b64
+			 * with an ATI subsystem ID, so match the OF node
+			 * name instead.
+			 */
+			rdev->mode_info.connector_table = CT_SUN_XVR300;
+		else
 			rdev->mode_info.connector_table = CT_GENERIC;
 	}
 
@@ -2187,6 +2196,48 @@ bool radeon_get_legacy_connector_info_from_table(struct drm_device *dev)
 					    CONNECTOR_OBJECT_ID_SVIDEO,
 					    &hpd);
 		break;
+	case CT_SUN_XVR300:
+		DRM_INFO("Connector Table: %d (sun xvr-300)\n",
+			 rdev->mode_info.connector_table);
+		/* DVI-I - internal tmds, tv dac */
+		ddc_i2c = combios_setup_i2c_bus(rdev, DDC_DVI, 0, 0);
+		hpd.hpd = RADEON_HPD_1;
+		radeon_add_legacy_encoder(dev,
+					  radeon_get_encoder_enum(dev,
+								ATOM_DEVICE_DFP1_SUPPORT,
+								0),
+					  ATOM_DEVICE_DFP1_SUPPORT);
+		radeon_add_legacy_encoder(dev,
+					  radeon_get_encoder_enum(dev,
+								ATOM_DEVICE_CRT2_SUPPORT,
+								2),
+					  ATOM_DEVICE_CRT2_SUPPORT);
+		radeon_add_legacy_connector(dev, 0,
+					    ATOM_DEVICE_DFP1_SUPPORT |
+					    ATOM_DEVICE_CRT2_SUPPORT,
+					    DRM_MODE_CONNECTOR_DVII, &ddc_i2c,
+					    CONNECTOR_OBJECT_ID_SINGLE_LINK_DVI_I,
+					    &hpd);
+		/* DVI-I - sil164 dvo, primary dac */
+		ddc_i2c = combios_setup_i2c_bus(rdev, DDC_VGA, 0, 0);
+		hpd.hpd = RADEON_HPD_2;
+		radeon_add_legacy_encoder(dev,
+					  radeon_get_encoder_enum(dev,
+								ATOM_DEVICE_DFP2_SUPPORT,
+								0),
+					  ATOM_DEVICE_DFP2_SUPPORT);
+		radeon_add_legacy_encoder(dev,
+					  radeon_get_encoder_enum(dev,
+								ATOM_DEVICE_CRT1_SUPPORT,
+								1),
+					  ATOM_DEVICE_CRT1_SUPPORT);
+		radeon_add_legacy_connector(dev, 1,
+					    ATOM_DEVICE_DFP2_SUPPORT |
+					    ATOM_DEVICE_CRT1_SUPPORT,
+					    DRM_MODE_CONNECTOR_DVII, &ddc_i2c,
+					    CONNECTOR_OBJECT_ID_SINGLE_LINK_DVI_I,
+					    &hpd);
+		break;
 	default:
 		DRM_INFO("Connector table: %d (invalid)\n",
 			 rdev->mode_info.connector_table);
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 031a3bf6fe0a..6a16d821915d 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -226,7 +226,8 @@ enum radeon_connector_table {
 	CT_MAC_X800,
 	CT_MAC_G5_9600,
 	CT_SAM440EP,
-	CT_MAC_G4_SILVER
+	CT_MAC_G4_SILVER,
+	CT_SUN_XVR300
 };
 
 enum radeon_dvo_chip {
-- 
2.47.3


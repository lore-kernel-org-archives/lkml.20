Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8164F3EB1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775197; cv=none; b=sObsxKbTGM5Lw/Q7cJTdSjntyde6uEfrfvresTKcmwSn+61lHpc6Lsi4mqpchRao1t1h3oGCSC8GlDk0dRA2SR9doWwrb2RKeY0ZqVO2IRJhgYQON/i6D9tuKyl2WvQUNgIdHF/chz4hvq4fbzjiC8HhnMIxLDb6uwtnlwVTIBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775197; c=relaxed/simple;
	bh=utYFrsJuYprZoOmQmX3B9K4bkwMAYjAAh3GJlDRTg+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qCK5JNBJe4yctOm7Hlbx6GnKYBV2slC4yRGvR1zirew+U8ILKsI6u739EGDW8Rv20igbv9lzjylKuWbxmtrIC6H9NawzfSKvOLee7Y2v4g8rcUZ9F9Qziq7N8r2FYkcVoWnnoiNtWNjhaVte+I7jM+7hUxpvj52Tky7S+dsHPKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQ4TVQmr; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQ4TVQmr"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b042e00f7so231072f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775181; x=1791379981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7TzL9qAFKtaS7vfznZL2zUVepTC6ZMh9+7GhOWKsog=;
        b=UQ4TVQmrqNzBtgx8JCm7wkP51uD4J8fasnzDOqhTKGv/4p3/tsWjMu47mX2/4uzhc2
         bdR3uG//mDNivpjSCYCbK/VHtQg8VE+SfBBfvdnf50LpncIRSSGZ5du3pRoYHD0et1RW
         UmakFeFX/7xSXZBmcFHsklf23CKqGRefy/v/XUmziWlrB5DmUw+HjTVzN1u5r7umlhCR
         wkPHS9M0fElbNHSoojtcaJ+DR8U//oeoNFaqrfwlri9Lsiiz1EVf1J/k/2UNdOnwPMDQ
         +xFD3DX9NrdnjNCiwGBvXiSNOIrsYF4jYgzOAhuX/xvYnbFswr7oO/i8De9SFVTyZHJ8
         0Q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775181; x=1791379981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7TzL9qAFKtaS7vfznZL2zUVepTC6ZMh9+7GhOWKsog=;
        b=ubmDdOm+tjUTI38V0PGoX17Ws1ndKKD2p7FELLVMupwe2Byx6kyYmcEqGyUYew2vui
         virx7LMBXnpA4gClqfojmRtjvha8xRUn8yQRKZ9iT7tRBjqZNuETUGuMmaWX/wNTJMrF
         +MpVUriYog/ag7xr/o5cTFXTJ3THCj0S39ofgljyq5nil5fZfCh34eguLAJfYjCwVDEn
         kFErKOliVyTU41ax5aeT1Pf/nGc0f5vPdqOUApPGHVPIWnParQ1tdOqEwH4vgutevO1p
         k4J0wYtbFtztOnCKDw1u+8sHTd5zEFsBaTE97XFZ4EiPdUuVfU6+7nUVCaybPjuLGJzU
         Pagw==
X-Forwarded-Encrypted: i=1; AKwUvBzrrXxKMsRbRP5F09wOHm90hN3YhfAKqC6U4pIe3NtPSSFRnXyIEZkpbwYD76xr5EWu9wwWOIdXk0geIqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjEDckowp2tMFfw9CKwevb73NOMPDck4kB/eif4BBEthe+8aXH
	n44fNxqZViuo7+w6MWTubQGwx1D4vXQgYzFiWo7u/wQJgd8PrBbZoSVk
X-Gm-Gg: AYBFou33HsM+Y0uJwL5iwZVahtiBUiL9XFfaptcFXs9G4zDnwk2mRB5b2a+gmyWS1y1
	UaMZ5rV8+TsrHC3AbrC2oJcv1WUP3y2ZVQVpEW6RF6KfY9489qL7tvJw9HIv5AeDeimJhfIIhpp
	iIKewiVlx4zL6kwFeH67QBM8lscQ/YNJJylkeKg6q4Av+X1akLlQeXyxAXRX1LCTYeZqW5i9z66
	Ue7EW3Vd7SgMutPXyofZsqKf05eXgSiyM4qIZAIdu0MxCvuXYft1g5qkUkOWOclSantXyIpTXmw
	Bs3/2kzhDGsnHVi+2vicT1NPY/KTxAAYR/Vd0QrclI3L9BmDLk59hNUdecMpuNqVCG6FIPbGrpl
	6F9WwuDfRVOVePnDtwv0Bi52RKSReExHgKojMDcBIhoJY8FbG0qS7yTuIoDJooaeURBOMOVSFo8
	oV6gT/zUoPTXkYC8snpuLE9lgKPCEyK0SEITi71148VQZlx5Hn4DJ4chUHaLc4X35SnL7LieuC1
	8wg3oRIH7P/9Uwp0xYcObM=
X-Received: by 2002:a05:6000:989:b0:48b:174:eab1 with SMTP id ffacd0b85a97d-48b02511718mr2875334f8f.36.1790775180889;
        Wed, 30 Sep 2026 06:33:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:bade:1500:bcd:b3ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b02sm3685582f8f.24.2026.09.30.06.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:33:00 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/9] Add support for DU, LVDS and DSI on the Renesas RZ/G3L SoC
Date: Wed, 30 Sep 2026 14:32:42 +0100
Message-ID: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add DSI, LVDS and LCD support for the RZ/G3L
SMARC EVK. The RZ/G3L LCDC is similar to the one found on RZ/G2L, but has
LVDS support.

The LVDS series [1] is merged here to get an overall picture.

[1] https://lore.kernel.org/all/20260625172359.292631-1-biju.das.jz@bp.renesas.com/

v3->v4:
 * Collected tag.
 * Dropped pwrrdy variable from struct rzg2l_mipi_dsi_hw_info and instead
   using feature flag RZ_MIPI_DSI_FEATURE_PWRRDY
 * Dropped rzg2l_mipi_dsi_pwrrdy_off() as it is taken care by
   devm_pwrseq_get().
 * Updated mode_clock_min from 5440->5400 kHz.
 * Added resets in pair for simplification.
 * Added comment in probe() for asserting resets.
 * Updated commit description for patch#8 and #9.
 * Updated license header  for patch#8 and #9.
 * Added HDMI audio support.
 * Dropped reg_1v8 and reg_3v3 nodes as they are redundant.
 * Renamed it6263 node name from it6263 to hdmi.
v2->v3:
 * Dropped binding patches as it is accepted.
v1->v2:
 * Dropped renesas,sysc-pwrrdy property as it is modelled as power
   sequence.
 * Switched to power sequence for handling pwrrdy signal.
 * Dropped header file regmap.h and mfd/syscon.h
 * Added header file pwrseq/consumer.h
 * Replaced syscon_field->pwrrdy in struct rzg3l_mipi_dsi_info.
 * Restored ports in DU bindings.
 * Replaced endpoint with port in ports node.
 * Dropped the macro RZG2L_DU_FEATURE_SMUX2_DSI_CLK and RZG2L_DU_MAX_LVDS.
 * Dropped the variable rcdu from struct rzg2l_du_encoder.
 * Dropped the variable lvds from struct rzg2l_du_device.
 * Dropped renesas,sysc-pwrrdy from dsi node.

Biju Das (9):
  drm: renesas: rzg2l_mipi_dsi: Add dphyctrl0_init_val to hw_info
  drm: renesas: rzg2l_mipi_dsi: Add activation_dly to hw_info
  drm: renesas: rzg2l_mipi_dsi: Move global timings into hardware info
    struct
  drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
  drm: renesas: rzg2l_mipi_dsi: Add RZ/G3L MIPI DSI support
  drm: renesas: rz-du: Add RZ/G3L (R9A08G046) DU support
  drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder
  arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535
  arm64: dts: renesas: Add LVDS overlay for RZ/G3L SMARC EVK with
    ITE6263

 arch/arm64/boot/dts/renesas/Makefile          |   6 +
 .../r9a08g046l48-smarc-dsi-adv7535.dtso       | 138 +++++++++
 .../r9a08g046l48-smarc-lvds-ite6263.dtso      |  86 ++++++
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  24 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |   3 +-
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  24 ++
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 162 +++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 282 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  25 ++
 11 files changed, 756 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0


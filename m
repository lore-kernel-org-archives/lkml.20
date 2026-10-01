Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C003C49DBB2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847648; cv=none; b=pvW+0xTT64tNu+4GYfcnhsC7RNEsr7BgvnRDd41qYzhfm4gwgwycsevZiJ8gKDInZtPCJdalI+3vOjdtwrgUB+zVGf+t6vC4ZoDlISOVteNeLN0uyfVutBk/YsNAyUNbEt0rtcjXfNGyTzikYcMKNCW4Udcej2IXyULkvCwiqIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847648; c=relaxed/simple;
	bh=iW71tWD2wNLRzOlWaKjpqoBDzIno/RxVTDSnreqjcWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=icmS8uTqByPw0j5uOdhWaDJGKpmCkTk77Vh1gmjYots4Qudw4uxpFfINDwy75lDrOlZ0WpwxVwyb+zs5StG8465GdLSfI/8Ut/Fz2Ob/PLX21mAhKhAZ/DHb0xSZzLKm0M82dPY17Ny2wNtXkTSQU2SulXT1rfI6uYmsoEkV8SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/dTVL08; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/dTVL08"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso32056385e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847645; x=1791452445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jc3gHtQINmiAkpV7pjKLPbOoZ/HXw5DC2EHguV8I54k=;
        b=p/dTVL08s84NZ9eBM/NXU15zfzS13KqUmxkwp0dRnvQa3/0iDo0JzU1B16uTDQNxDZ
         bZlFwA2BoqA74gjlAZUIStI4L7tGoiRxtM7WX2wt746Ngo0JtQADDENNt4UK2A8i6BeD
         ZKjgyn9fVcfChdgsQdsOiDP10HUBYUHdC5sn8i2UFjCCc4lWFg6Su6qflBeBVNI5pd4w
         kdXPe9kyodqlWqRZGQ1++NN0wzlnnXdJoG6h7SiYyfKSP3UcWK8EO7k+XCRRG97OiKwL
         XnOnxl0iqfZw5CmS5JRsg3ecfHDGllcPjD0PAe350lOcuOrWBp1TIC4KAaHRf2Iv2D7n
         FUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847645; x=1791452445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jc3gHtQINmiAkpV7pjKLPbOoZ/HXw5DC2EHguV8I54k=;
        b=qzEB2fb6d0iX6lgfbxqy8ybRUzEjTIeGWM7HqIkFD2DHKxYp5A5XZbDeOuLGDbJzqj
         RevIQ3CuO24L+d20DSQeNTjBMoAblTUXWz+pvXj+1WOS78IU+5hkqMnmt+hUI5HlEYOf
         pFE032wbQoEDYxtkyS9BOCkCvN5+apWUc2LoT/yKMg3RY5DCxTRi0mPy+IvIOSmwUOcH
         Mta+GcbMJ7Jj9qQ2GwRpvpf/hYLsKpPhVRPS7QPZUjFx7hm8y5Y05sLqdRp7+NeyAFrs
         QqdUyzQP/usWDbkO2aRVfmWHaavCtAZ1Sv36LLDmgZMspSUGK4L/ineNwV5SLXWKc98G
         JgAw==
X-Forwarded-Encrypted: i=1; AKwUvBwUpWKnBXBXBZKna8RRL/Jsy1feN9CKqG6y/83xgc2KS9tLbZ+Y5eUvHEVv5AFKdpLklAKawnle/JrlJYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nsEye3zJuimTMZQq9iUw9L1tLjBik/UdxoiW8VWYeUjuE4mSxp
	df6aQ1uakanZWKRhfLgdfFIc2MoDkWbWsSfdfUg5/egvO1+KR0JqJlNFpbWLZA==
X-Gm-Gg: AYBFou2u8yP4pjGYfcY0MSaaENsmdn+Sjd8t/UnWTObdBZNV10wOHzRh1LS/7NlNkgq
	u2nrOmyXtLayzOaG0gc628GUmFq3bG/JmjtLUuCoibfu2HpCLv2CI0oWLzAq+bHw4T2NnjTT5tK
	4b3CaVKnZ963ftHG9XnfRuOiLsNpdpDJYd0zTnvpeOqegapWtlVE11mJ+TBdaek2kp+A0E854N7
	aPQ1UySJfMji8gNPWEfrMQSwnxveP+9W/tAgqZ3mXe+mEiwNq49fM4RhNE/rdzDS0LfKxxgma2T
	jBTtP4oB71FYBRart1Yxuel0A5k7bihVFKBKip2+eGjp74fRH1M2WgfaC+dyyWak1Fa2MHRKkvV
	2BhlMX8tTtiVpDX328ZBxtE5xq00Cu1TesM7r9XveCmsv4yWe6iwXjLCAaIbNx4n03q0pT2fx5p
	xXxo5XnwXUDssG2XotOWzNjdw50m35yH4G/InODE1LfYqKknGvyd6YYmTRD4FaEv+8tZ6D2HeHi
	Kkq
X-Received: by 2002:a05:600c:3b10:b0:49f:fbad:29c1 with SMTP id 5b1f17b1804b1-4a01b133c13mr67735075e9.33.1790847644699;
        Thu, 01 Oct 2026 02:40:44 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:5563:a938:8fc:9dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm38937725e9.6.2026.10.01.02.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:40:44 -0700 (PDT)
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
Subject: [PATCH v5 0/9] Add support for DU, LVDS and DSI on the Renesas RZ/G3L SoC
Date: Thu,  1 Oct 2026 10:40:15 +0100
Message-ID: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
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

v4->v5:
 * Collected tag.
 * Restored mode_clock_min to 5440 kHz.
 * Replaced static resets array in probe with global resets array.
 * Updated rzg3l_lvds_atomic_disable() to fix the
   PM_RUNTIME_ACQUIRE_IF_ENABLED guard that prevents synchronous suspend.
 * Updated rzg3l_lvds_atomic_enable() to fix refcount underflow in
   atomic_disable due to early return in atomic_enable.
 * Dropped dotclk from struct rzg3l_lvds.
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
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 162 ++++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 275 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  25 ++
 11 files changed, 749 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0


Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6689038759C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766551; cv=none; b=Bw8SOjwHHGVh5xPN40evbAZQDApV6WP5l48n7OGcK6zJusYgy1/Awd+1ezUOZ3kqkvSsJnKpXjk0X0hpVA8Cl7a6d1+0TD81f5BgnsLHyHwwuNb7NlWQcVHQFpp4qGAGzq/32Z7wlPK5K8OaAgbUcXNL+fjij5B8KbXEls703Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766551; c=relaxed/simple;
	bh=cdQ5vhttPw+7AtUVGXP/VkacQdyd8rJZkk7EiEFUhEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O4Hl9AxlI3jmEq7UrrKFL0mD7JKYyVM1spjbxVHzDZQ+2u9P4hxCbXS+CDC/SlfuepoD+Redreu4bSompTTik2YUh5VCbJqYwNQzJkkhXbuUbB84kZU8DR6Tz/OSqjV0zmPeJY32gAEErhYHhlhyp5cYtLfcnZJHnmoJPGx6lEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaK+7qm3; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaK+7qm3"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so2107175a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766538; x=1788371338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GV19qGomh8jVFr0DU0I6wY2+mqT2GUa1szxwspwi060=;
        b=FaK+7qm3VvVuG9PbO27GGuaZrCW3AitC4BHos02wm72asilPRt8dZpUsUag8UOEbCx
         jcH4BWcaRkzi+dV7QrhW5W/6gO6G8vjnEtE7k8xKrgpEaKmPjdAZbZOSWpYDe0643e1n
         rJuOqQalZbVB8pVsJvCfX0aVvv+P7Mtupx/3bmvFbUBp+i3MSGwE8AYpWSZbkcvoytjx
         7LsmOpiBUM11erq3Mdjw5gDJXkCGPCTaVyhNMhUqoGCyUYl4AtLCcMYh9TP9u6IFvsku
         qaFzvci8gFAUGgaubbAaG+8cSDldCl/7bdH2spccL/VlNNqEPyi+HmNKBu0222akWbqd
         R00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766538; x=1788371338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GV19qGomh8jVFr0DU0I6wY2+mqT2GUa1szxwspwi060=;
        b=EGZF4MQlifqc3ZO6nfF2rD9Z61hwjjdix8y5ua9+NlKd12oExbBTbKG4rByzv5MWmH
         pWRC4ByjEHZ8IIV4z2bq5nzPuAOEUbSg8OP5JRyqmTv9fyvEehp7qFSQZ+ufKoSFzDTb
         OYnur3tkpGB5B6aGHn12kmPhjmiw81IdtRjCyaXPKHrlACTWXDRwEfkgfjUBq4N+X2/V
         Lkn9QQkCe3eozLE+qN5WhmVJarceUYsV06hBZBg4Wb/DGzbWNVTdNYIJFyWW/8GpqpDG
         Hrqt6OlWW8b+zNQVNe2bEgJTd05V6pkEnM3T7nXVIzDlIY0My233BtjNU2zCLIhsuQzM
         DA8w==
X-Forwarded-Encrypted: i=1; AHgh+RritwWRbQTRijtPwtCeQGUwQin/uaha5Va46Sh1J3gaFhFRBGCzF1WdPVw9nZVmY6naQrg6V3L74mVDv18=@vger.kernel.org
X-Gm-Message-State: AFuF++lM26SCSEXS9M+bjxOBgpkZn4t2+L+Fifzxs0nQlCa8E/ktE4j8
	GvTG2XN94POzAxN8uE44rudkQOBSLREmZSFMJa3ERNT62Y+MpslKlAfl
X-Gm-Gg: AR+sD10gnZjGQPthGo73ZQwwzOlT9ry/Ghtq4TfDUbmbcuS56Hduyg4pasLm/ViikUX
	W/DMftS558t+VxIaUpfoQG/SE9Ns/T3+Qdz36zUm79zqng4lfFe93C+vOxM/UzyGrh8IkuFwSWk
	dVh9Je47RLO62lhmnEjkpeM5VYIeUIzazvr4G5Tcdczb/d2EXCw0tNF11LC8YBxxqc2NwIE+dkj
	bCtyqR9zqopFh/YCKIDPG2CX+4TAUSb7DeEahhX34hxEyjqVmOjMvTkhKItwZFy2pim3lxCbSmC
	Qtujr209cP8Tau5E8RGOeu1WYiSZPrRqRloVKfRCtOAkhDbIU31MjmlXFpqQn/0dgLcrgNe/vcU
	uFwIWP/tONhFuU8fqPHBGEaakfVgfX5Uam5V2Z2k90QtZI5In0iImdD1Y/EFamyXs62vkknmXjB
	iLAhDLEhlZCkeN5F2HmurMk4zCUSkL3meXxuOnH99dT6HKcVtNcKZXv7yQGRpG9HBb8BHqFjCr+
	tzZIXBMIjVDZdVmxtpwobW0
X-Received: by 2002:a17:907:7203:b0:c24:dd7f:3254 with SMTP id a640c23a62f3a-c250c4492b6mr1005185866b.3.1787766538022;
        Wed, 26 Aug 2026 10:48:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:48:57 -0700 (PDT)
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
Subject: [PATCH v3 00/13] Add support for DU, LVDS and DSI on the Renesas RZ/G3L SoC
Date: Wed, 26 Aug 2026 18:48:34 +0100
Message-ID: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
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

Patch#4 has build dependency on [1]
[1] https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=d51fc9d4cd6eb18ac82913d83ecf7bd8c85f71ee

v2->v3:
 * Dropped binding patches as it is accepted.
 * Collected tags.
 * Dropped .dsi_global_timings from rzv2h_mipi_dsi_info as it uses
   different path.
 * Updated powerseq API names.
 * Moved set duty cycle from bridge driver to DU encoder.
 * Added min/max frequencies for DPI.
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

Biju Das (13):
  drm: renesas: rzg2l_mipi_dsi: Add dphyctrl0_init_val to hw_info
  drm: renesas: rzg2l_mipi_dsi: Add activation_dly to hw_info
  drm: renesas: rzg2l_mipi_dsi: Move global timings into hardware info
    struct
  drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
  drm: renesas: rzg2l_mipi_dsi: Add RZ/G3L MIPI DSI support
  drm: renesas: rz-du: Add RZ/G3L (R9A08G046) DU support
  drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder
  arm64: dts: renesas: r9a08g046: Add fcpvd node
  arm64: dts: renesas: r9a08g046: Add vspd node
  arm64: dts: renesas: r9a08g046: Add DU and DSI nodes
  arm64: dts: renesas: r9a08g046: Add LVDS node
  arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535
  arm64: dts: renesas: Add LVDS overlay for RZ/G3L SMARC EVK with
    ITE6263

 arch/arm64/boot/dts/renesas/Makefile          |   6 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 139 +++++++++
 .../r9a08g046l48-smarc-dsi-adv7535.dtso       |  95 ++++++
 .../r9a08g046l48-smarc-lvds-ite6263.dtso      | 104 ++++++
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  24 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |   3 +-
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  24 ++
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 174 ++++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 295 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  25 ++
 12 files changed, 895 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0


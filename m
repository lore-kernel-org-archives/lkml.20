Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915D73AD537
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700499; cv=none; b=m7Pw81VTG9vQeyaU0ODzILtZ/J/JYonTmj2pPAv0IbGN/mEtVA8YJ6hxNXfqnT9CZyef9LqJTfua9VxEQugKre7oMYolsl/sKrS1tqSjmO0HZFgR65/0UrmAZn//mahCKcBZT5+rJK+gRYP8d9AYd/6mymijwbQQnBB/NJJgMDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700499; c=relaxed/simple;
	bh=KJjFDh/52gu7EfLUhn16FGRvyciUieU+GbnCGuYWSWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h7YxTMLqqg13Z2UAXzjtm0R1wZ5AfrcT5rw+ovZM185GzH/9334yHdvi43Rna8eEnE5ruRbynbpyZvR/BxjMUPNkXl3ZGDONti1GU6iKkoYAbh6T0GVXHkDGPm3PZKYzLigDKglgUjftR3h5Dc4dvQiLr4C3tBDuuQojfvUdDbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2T3C0Vo; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2T3C0Vo"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso284302a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700494; x=1790305294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdKFcHr+t1P8kB1M0oZWW1CebC16dNbe38DihNTmLO8=;
        b=E2T3C0Vo4zlJnWnIipzBWgiQ60dqwotMTII8X9irh92Ct1rEz1R3zLdTC37+Ua6G8E
         2ZwqTelF8OzSWktGgThPREH+mOlgo97Oiho9GLJvn3H9sILk0UkXUF5tsugTJ8iCwz9Z
         VLEYnGletvU41wFckOF7rM7/pdJeesUv4nApcG5Ie09ROi4o8I4GIOpPqpHWOhpMtcbG
         UsCiLjQgKsJo38O1Sy1j0BbOK/rU/zTt41EVJyS9/U15A2yhFlFvckG8MRA1rIngQ8FH
         sfRa6Wr0w9rRPWZTiL6XW1KfUEIzIpkL9aDpehg28tf7Fqa1vKJNs8N36IPpOh0adY/l
         2zhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700494; x=1790305294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdKFcHr+t1P8kB1M0oZWW1CebC16dNbe38DihNTmLO8=;
        b=HLfOcMlxf6EZoxQ2xUw1X35DHCp8mtoqItgAQzYJr2tR6d4JhUR/KdBQQmBJtkrYtM
         7bWCPY7hNt7litTeBXwt3hf0dFUkJBCXAuAGlOiW5SgskjqAQ8kWZV2BkC5bXJqCmJ7Z
         pduzW9lgYxllavCVaVS4aPPi15lq66xdj+/cVb+NxFkrIny1wlUOmGuDlgfwxS8/KeHR
         p/LptBAqX0T0erygfsggihSRHVzNBwkMBcNFe67n9EwlCjmOrZfs6CQSMcx4Uooy2sGw
         9wxXMeBMd4Ai2EkxuQKRYv2UCXvu1/0AbfY1RvaXw7Iuc/qIoPKFUl8kue7PNz4+15bU
         cXfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXYZsBflafI5/x/aSMiSRx9e4b8gFwWEf6PJZviqpc2AXvPg6v3UvO7RWalQIpzmu1GHrjNYfRd1ZixmM=@vger.kernel.org
X-Gm-Message-State: AFuF++ncVfhMaiL9nN3PBY5pAtS/I0EeqUFNj8+S1wRQ/8/2UfF2ryRv
	EiQVcVtCVQ+v778WmJfVbgaTbw6O20n7WHfG9nOUykOBmUtSyxqkIeog
X-Gm-Gg: AYBFou089dLIwwjdfId8JZXbHPkFB6U/DRbQ7ZJJMYqono5y79e1yr+DH/aM2un6bgO
	/eigO1YQ9IyEJv2rjZZRaxE0mOORszbF+3Q0652ubKAxaVh58njeKkaH5ERV3dVmi0BVHFamW3i
	ROEsBFjps1N0LtDo8yS1rtxYSHQ3AAUeK5uJxBc1PMWK1wQNmuVnDng7LSKRCOauJsp4wPvhi3a
	jtZFOcjRjhJF3Bwf3JtfZRahOwXk+jnyOOKV5m+MTDd/65ZEavM4fr6E0h18OQtCOms/HIFS36d
	3XIXpPMWwJNHpd3M9VKmOFOmviCiaNorKztHeWMkZ1o3Bn6cImVGb+Hnin+Nth2cttocSSnx/hO
	rJsIyxWup6Sde11xVgV4oB8kapPlveGs29Ym2GuWR9VlxWKdu5GswYVufCjBuxp1ErHMbDoqvqz
	t1J/t5DBNPYoX2p/OSBp1Sqc3osk88GMSGaTl6UPLbizODLJAJ8pwplGDT+PXRtqXZCoSrIj6cp
	rS+JqWYW9axljpjYZ1D+nukLRcyU4rNjUy7cdZNUo/bNKcO3bTN4FmYzZaUt+A=
X-Received: by 2002:a17:90b:4c50:b0:39e:4c7e:f03f with SMTP id 98e67ed59e1d1-39e54f6a423mr2356087a91.28.1789700494073;
        Thu, 17 Sep 2026 20:01:34 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:32 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v7 0/7] drm/verisilicon: add Nuvoton MA35D1 DCU Lite support
Date: Fri, 18 Sep 2026 11:01:18 +0800
Message-ID: <20260918030125.315978-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Verisilicon DCUltraLite display
controller as integrated in the Nuvoton MA35D1 SoC.

The Verisilicon DC driver and its DT binding were originally written by
Icenowy Zheng <zhengxingda@iscas.ac.cn> for the T-Head TH1520 SoC, which
carries a DC8200 IP block.  The present series builds on that foundation
with gratitude to Icenowy for the original work.

The DCUltraLite is a different variant in the DC IP family.  While the two
IPs share a broadly similar register layout, a number of differences
prevent the existing driver from working on the MA35D1 without
modification:

  - No CONFIG_EX commit path: the DC8200 staging registers
    (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT, FB_BLEND_CONFIG,
    PANEL_CONFIG_EX) are absent.  The DCUltraLite uses enable (bit 0) and
    reset (bit 4) bits in FB_CONFIG for direct framebuffer updates, and
    requires a per-frame VALID bit toggle (FB_CONFIG bit 3) to latch
    configuration changes.

  - No PANEL_START register: panel output begins when
    PANEL_CONFIG.RUNNING is set; the DC8200 multi-display sync start
    register at 0x1CCC does not exist.

  - Different IRQ registers: DISP_IRQ_STA at 0x147C / DISP_IRQ_EN at
    0x1480, versus the DC8200's TOP_IRQ_ACK at 0x0010 / TOP_IRQ_EN at
    0x0014.

  - Simpler clock topology: the MA35D1 clock controller gates the core,
    AXI and AHB clocks with a single bit, so the devicetree supplies the
    same clock phandle for all three; only the pixel clock is distinct.
    No second output port is present, so no pix1 clock is needed either.

  - Single display output: no per-output indexing beyond index 0 is
    needed.

  - Hardware-discoverable identity: the DCUltraLite exposes chip identity
    registers whose model field reads 0x0 (revision 0x5560,
    customer_id 0x305), allowing the existing vs_fill_chip_identity()
    path to identify the variant purely through register reads.

Patch 1 adds the nuvoton,ma35d1-dcu compatible to the verisilicon,dc DT
binding and relaxes the top-level clock/reset item counts so per-variant
allOf/if blocks can constrain each compatible's actual topology.

Patch 2 adds the register-level macros needed by the DC8000 ops.

Patches 3-4 introduce the driver changes in two logical steps: the
vs_dc_funcs hardware ops vtable with DC8200 ops extracted into
vs_dc8200.c, and the DC8000 ops in vs_dc8000.c.  Patch 5 adds the
DCUltraLite HWDB entry that gates hardware recognition once all support
is in place.

Patch 6 adds the Kconfig dependency on ARCH_MA35, placed last because it
is only meaningful after the HWDB entry is added.

Patch 7 fixes a pre-existing DC8200 bug in the primary plane disable
path that Icenowy spotted while reviewing patch 3.

All patches have been tested on Nuvoton MA35D1 hardware.

Changes from v6:
  - [dt-bindings] Added a "port@1: false" / "required: port@0"
    restriction to the nuvoton,ma35d1-dcu allOf/if block, since the
    DCUltraLite only has a single output port.
  - [driver] Fixed 3 "alignment should match open parenthesis"
    checkpatch --strict issues introduced by patch 3:
    vs_crtc_atomic_begin() and vs_crtc_atomic_flush() continuation
    lines in vs_crtc.c, and vs_dc8200_primary_plane_update_ex()'s
    continuation line in vs_dc8200.c.
  - [driver] Added patch 7 to fix the pre-existing DC8200 FB_EN
    regmap_set_bits()/regmap_clear_bits() bug in
    vs_dc8200_primary_plane_disable_ex(), carried over unchanged since
    commit dbf21777caa8 ("drm: verisilicon: add a driver for
    Verisilicon display controllers").

Joey Lu (7):
  dt-bindings: display: verisilicon,dc: add support for
    nuvoton,ma35d1-dcu
  drm/verisilicon: add register-level macros for DC8000
  drm/verisilicon: introduce per-variant hardware ops table
  drm/verisilicon: add DC8000 (DCUltraLite) display controller support
  drm/verisilicon: add DCUltraLite chip identity to HWDB
  drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms
  drm/verisilicon: fix DC8200 primary plane disable clearing FB_EN

 .../bindings/display/verisilicon,dc.yaml      |  51 ++++++++
 drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
 drivers/gpu/drm/verisilicon/Makefile          |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +--
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 +++++-
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |   1 +
 drivers/gpu/drm/verisilicon/vs_dc.c           |   9 +-
 drivers/gpu/drm/verisilicon/vs_dc.h           |  33 +++++
 drivers/gpu/drm/verisilicon/vs_dc8000.c       |  92 +++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc8200.c       | 121 ++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_drm.c          |   5 +-
 drivers/gpu/drm/verisilicon/vs_drm.h          |   8 ++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         |  14 ++
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |   6 +
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +----
 .../drm/verisilicon/vs_primary_plane_regs.h   |   3 +
 16 files changed, 382 insertions(+), 55 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c

-- 
2.43.0


Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2B74F30FD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859730; cv=none; b=FYW92GlFK7uUtpf9k0EzwwE63embwvrZJRYadvHGp24OACsBYRhl4wD1nnbKm1UyxCFUDwaKDqOk9zCoCSC6NgOqAqEdgE+joXSaMBXMG5rD5M4vLduId+3JfVO4FFGh4338I3lUCTcpH5QonvJTT98nBPIO/X+jAQRQTYwE5kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859730; c=relaxed/simple;
	bh=F0xUuzXHZyymxqAvs1Si8mOhaBzzUTC8YR4HB1fYGyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AdCxTKOKlxEhoQ/T6A2m64jrFEVTnZZMvbaD8VwdiawIhHkfIpmiiuHQ0ZRg7LBPnil8aQDjgW7USmiICIB8ACC8cn3aCr4OQBF8BbkbuS+Q0Hswv3ve/XP95VAtbA44fkGSLc9klwSHY20Nb0TKKNxqBTs79WLkKMsgAvN6I1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiE5wHGN; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiE5wHGN"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398a5aad413so3333885a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859728; x=1789464528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1cMT7fKgP+zuYY8ESvwdYk2VGfHp7bRIw/gwcfnHbX4=;
        b=BiE5wHGNM+hVDxq96Nnjd3Gk3QLb1uS62tEBTtmNpBy2GqL0k3hDnz6lv7oLkySlkv
         6Z/TkLhh6LwJDbxcDZYqxdGlvfVIJIFJCk9KNNaPTODZVmJ/xCJeWcT21iEAlybc3GM1
         vWzAs7xqgIJqo08Rco/hHZRp5lfkOM/FWXnVOm09a9zNpi4qYaWLKCIo4KhepLe6kq/D
         JwyN5zB4cLcZIf1//mV4uppT6ljKa+mrJe+/aFSvQ9YnxzML0tOPoWiSPb1nQnLyNgHf
         XOYOaPubFfy8AUqd/IGIBsqx2aeFWREklHcsOwn6t0X2oZbTiNgBJHbco0WmXaolh1R6
         TGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859728; x=1789464528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cMT7fKgP+zuYY8ESvwdYk2VGfHp7bRIw/gwcfnHbX4=;
        b=dA/xjmgQSSMPqCjZKqF7QZidJtvX7PFmef3K+oV/poMsMAKC+V7nrOnogRWT8zEmD2
         BTGkSUs/RTyKwC80p8Khqiq80xEzYdBcB6FCrWuWc/cOmVzTWPBHOuaVlrHFqlb4G6zY
         mysS3wyXXLWnBD4cxjyZPhiyaqhAbqP9HImWVCLH/5t1rD2ulDN8495pjwdFoH+HXDSW
         P3zzZ/RiO4uHa7/tZ+KuR48kAs0Bq3EJq+ibCCNu1zSMU9bNml/QJlkdZHp+8Tox+v8J
         J/ILvs1kgV5vf1LgAuQOVtqc+MrB9KTUfcmj7ovfsP+dgcHtvfT7PsLdzrj0wL3GTbfL
         koUg==
X-Forwarded-Encrypted: i=1; AKwUvBzHoCdEh5iZA9jdwaYhqie06xC7RNDbbwXD8w/nNOIoKBW2HOZ6fKdl338/Qq5BAM4okHMK7C5LpVmxCkY=@vger.kernel.org
X-Gm-Message-State: AFuF++k4ZPa1mOhj8NlniiwEiNztCMVNCjUHMqc6+LLyZJ0/gYhGYli0
	1leFvz49ZE64UoMLxvKliMLQjiP/4Bum7eKkmT2IM6Do8fGMq2dRT3Bb
X-Gm-Gg: AYBFou2hYGptKgF0qge6vJXbH59ie3SHC+uWEalM3uiNZBiNbKKehZCO5aXr0u080Rt
	ex7oyPzLwTIf0plN1lvFsrTGlXBtac3TxkUOxfCtZZ/hDPK80O6hQrW2YcpqmHP9EQnNR4CSA75
	AJ2Edegfe6bKSCDlRfoxOkd+tgsKQA1C/jcC/WHt/ebb1wOZLFxxAS23lpikQxcisK06oeXcSZ1
	sY0vNfTk5ymD9dfbucfCC1k3eA0bCy3sVEkGPvbcphlNfnuzya4LOy4eedEKlmS+0hzObJ79TJo
	BCAZ21bqkkH198geUGEXVr9XNW9fVcoiAZTD21AyvY+DbcjgjgTh2O54whcwAlJioySLGDqwEGG
	vDWKAXAoe4nselscMM5a+L+QkAGqXUAxj2hVazTicqd30RTcx8jyukAdzVX/4cn09iQo5kKJlkn
	ggAtohP/rYj34+g3ikRdsBCLL9Fs/pOCSMTJGcOO0w4DhPLP0V/oG+N9MINM/qSISjtQ3k0aGBr
	S04/rm4sXeQppCEskLJHXEfuxCuSV4KfTaJRkQRKKTqEwmwMFIrF0kGaCHt+9E=
X-Received: by 2002:a17:90b:394e:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-39b26272d76mr43048844a91.12.1788859727665;
        Tue, 08 Sep 2026 02:28:47 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:28:47 -0700 (PDT)
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
Subject: [PATCH v6 0/6] drm/verisilicon: add Nuvoton MA35D1 DCU Lite support
Date: Tue,  8 Sep 2026 17:28:34 +0800
Message-ID: <20260908092840.225220-1-a0987203069@gmail.com>
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

All patches have been tested on Nuvoton MA35D1 hardware.

Changes from v5:
  - [dt-bindings] Renamed the patch from "generalize for single-output
    variants" to "add support for nuvoton,ma35d1-dcu", since the binding
    topology itself isn't being generalised, only a new compatible is
    being added.
  - [dt-bindings] Moved clocks/clock-names minItems to 4 and
    resets/reset-names minItems to 1 at the top level (the lowest count
    any variant needs), instead of overriding both minItems and maxItems
    redundantly inside each allOf/if block.
  - [dt-bindings] Kept the thead,th1520-dc8200 allOf/if block, tightening
    it back up to minItems: 5 (clocks) / minItems: 3 (resets), since the
    outer constraint is now looser than what that compatible requires.
  - [dt-bindings] Dropped the nuvoton,ma35d1-dcu clock-names/reset-names
    item overrides entirely: the devicetree will supply all four clocks
    (core, axi, ahb, pix0) and the one core reset in the same order the
    top-level schema already expects, so only maxItems: 4 / maxItems: 1
    are needed to cap the count.
  - [dt-bindings] Dropped the redundant "required: resets/reset-names"
    sub-blocks, now that resets/reset-names are unconditionally required
    at the top level (landed separately by Icenowy Zheng).
  - [driver] Dropped "make axi and ahb clocks optional" entirely: since
    the devicetree will always supply distinct axi/ahb clock properties
    (sharing the core clock's phandle), vs_dc_probe() keeps treating them
    as mandatory via devm_clk_get_enabled(), same as core and pix0.
  - [driver] Added drm_WARN_ONCE() in both vs_dc8200_irq_ack() and
    vs_dc8000_irq_ack() to flag any hardware IRQ bit that doesn't
    translate to a known VSDC_IRQ_* definition.

Joey Lu (6):
  dt-bindings: display: verisilicon,dc: add support for
    nuvoton,ma35d1-dcu
  drm/verisilicon: add register-level macros for DC8000
  drm/verisilicon: introduce per-variant hardware ops table
  drm/verisilicon: add DC8000 (DCUltraLite) display controller support
  drm/verisilicon: add DCUltraLite chip identity to HWDB
  drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms

 .../bindings/display/verisilicon,dc.yaml      |  44 +++++++
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
 16 files changed, 375 insertions(+), 55 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c

-- 
2.43.0


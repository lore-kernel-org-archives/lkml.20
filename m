Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315922;
	b=joxzv1BXiq7NRR1FWjcvb2a+R2oODNWoZ2X64qbWbf51c8R0rCsNyFTcGOjmvGo6Z0ra
	 eCgX12J7Q9rFVkRlkf6ccbuVLT3fn7VrkD4d9epoZqOD8k7P/mu1rk/2oecwEAMgGO2Dc
	 ZZx/o02PcHBbOTtodEjiGSzD3DU8g66vVucc+vxqycZ6kHKVU9N2Z2tBCtxzFp6cO1F27
	 17mrqEE6o6x75e6ueZKcGGy3v0LbVjdoYaIJMK4u+WxZDW2ZNekK0IK2JxQFJldjMq/iu
	 1yhHzL1e0gt/zUr7DeKlXFa/Pug1nnzC7sJhxxx8eUAzAxHK39yhsKfKPu7BpGPAT0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6x86s7blevtluoP9nJsSdSKJgLOgTfshLxyDXczjN8g=;
	b=OT9gN1OHlfyugIxsRScgmd/ietyfZUsO2yRiveXTLzoQoC7CO57zazvBPhThHeBuo+vG
	 6mvhwSC5YSd1oULy68EjpS82EAxPfS7O06X83dv9B2gFIfG7MjjNPqnPq96064pU5braz
	 SjH5jh3ruNPL5HTYsDkNeewvnJ0oIhwz86ZioXPV5gWGiy5v6qjSzFXTP1i07Vv/k4Etb
	 TSDduX433w/Ou8Xe6G+b6/gxIiOkIIXQWMtlShw/NwlFyPFYXpQEhM7ZPCKe4l82zfI2z
	 nhIn4eAcclukOQ6AD24dmPrmcoC3r81jg/RtnXDH6SyuWTut2dz/vtZsCfgL4cNhA8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZUSiEi0n;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C07F606A335
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C07F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZUSiEi0n
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e93e0d86a0so1941495ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794315921; x=1794920721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6x86s7blevtluoP9nJsSdSKJgLOgTfshLxyDXczjN8g=;
        b=ZUSiEi0niXnC8Z6Kj0bKAAMfjptJrX6cLnoTLRg5ALxXC+q5eiLIm3VbcUjG7LzP4t
         L3TplgM0EBX/KvycBV/n7JoU4M9UuIRtreqE1EQ+HwsHxapDAq2AJV3kGxQZl5d/BCip
         aCKKfQK33SriLoIDaGBN1+itX+8sgizpR6Jz739Hve7hsGRD9fO4NB4amGllQMfjLZTB
         KVmFXnuMiK1zuiY1pp7OkzcNuvNKSN3CHPUXE9gaqQi2vSnCBpVlrWVjW4J2yOMY/dv3
         XhNHBdM3idGBo5LscfWJaRg+MUTPIB/z5riKUO4bFKg8N7AadCf7jMohHeYq/LDh0yi1
         OIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315921; x=1794920721;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6x86s7blevtluoP9nJsSdSKJgLOgTfshLxyDXczjN8g=;
        b=nZ27trEA/HByY4WCCicKlDQaG2e1twOJksuy3bPsZhzPQwvnR/8jYN4d9SrktmdkBa
         4UohcQZyhFXC9LWwTTG+rStKxeHZ3kLNBoOnFpbUoaGzJF9eEqdu1gi6mpJoERN9P+TJ
         BGfFCxlMpYEvF3iGzaIOtMOhCysSgjPRAR56HzmHmN6KWIw55eEQlw03mr22iFY7Ipxn
         k47072yeLqS//X9lO+5RhsKaVc6dlostQl6X55/1VEn/2//v/wZHvdyyhVz6toeKGxbQ
         zqdRyZ+ROpciEVM5wG/22IPpov7+VhGNodU0Gl8cpBu2Gs/uWidDBsmjFtSsW15abXYs
         OJOg==
X-Forwarded-Encrypted: i=1; AL+hErFZrwC9rh7bcz/KbNSMwugfEwZaSPFwYlO7o+jUSdLPnovHR7aJpcd1VFaBLvYZeJY0HO2RDx60a8MaZAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kpUmEOUY6fRE+QDRcU36qFKmmAQH2/0nqFXh8Rlv4p4ZnG7AX
	3/KBMS34C5K5szClVus1KXvoCIWDJ1pdEjisYejpZ/g43sENLOSGAGcj
X-Gm-Gg: AYBFou3yZ+UXwXrwH2QzIi/YRzlgViGyh+1ckHz25YuP3uR7ilMmivE6zJd5sVOTX+Y
	rz16YXNCsjFk3Q8MCR1K5tVlEKUX39AXrGilZbsnblEqTcNH85/H1K/VYq72DxqrBqSvNNto//i
	MZXBcK7UGFNBgJcXqXsXFYSSEWOjul7vePiaOhL/xcvxAFgmJbjiRur69BZU1Ee4FG4IvPLZ2Sd
	RLyhRiJsbykQIzGzzxAlj2n2mundiwluVnJsE1alGm95TAXcD2LkckxUAsImkFBt/Kc50bj3lPg
	rwFrJZRYRqJ5/dv+/LD5qJxAmAC1NdFOt75u0K0+dmSp7rWOqpmAyEl2cwCKEbO5v/DxrZls7Ff
	zxI8MNrzXasM42Ga4QdQgzBmsKRqkOLhN1jMuHF5fgcQ0iCnNWN0BHia2gJNk/CFmsnO0NAiE99
	7ojpa09FEgbJeDA4qk8CNuOESjT4Qa4CDjuBQJ47IoJoJyoOC3NXINyX5ytcQCOrH8WfPYdT7KZ
	u+0TnUcavRTrrXUih9Pan/BZtlXn/ex33v7bG5oKnuqQ4T3Iir0vVD25Bca/jq4RBpwDlFyQd25
	KLgxFfaIfsH575t2x9jEq3q4Ne8=
X-Received: by 2002:a17:90b:53c8:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b166ad51d9mr4660163a91.1.1794315921137;
        Tue, 10 Nov 2026 05:05:21 -0800 (PST)
Received: from marchy ([2405:3800:918:486f:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678d1f42sm3982296a91.7.2026.11.10.05.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:05:20 -0800 (PST)
From: Adam Azuddin <azuddinadam@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: jesszhan0024@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andersson@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	azuddinadam@gmail.com
Subject: [PATCH v6 0/2] drm/tiny: Add RAiO RA8875 display controller driver support
Date: Tue, 10 Nov 2026 21:05:12 +0800
Message-ID: <20261110130515.45819-1-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds a new drm/tiny driver and matching dt-binding for the
RAiO RA8875 SPI display controller. An fbtft driver for this chip
currently exists at drivers/staging/fbtft/fb_ra8875.c, but fbtft is a
legacy fbdev-based staging driver, and nothing in mainline DRM
currently supports this controller.

This driver does not use drm_mipi_dbi. The RA8875 SPI protocol is
structurally incompatible with both Type C options drm_mipi_dbi supports.
Type C1 encodes command/data as a 9th bit within a 9-bit SPI word. The
RA8875 uses a full prefix byte (0x80 = command write, 0x00 = data write,
0x40 = data read, 0xC0 = status read) sent as a separate 8-bit transaction.
These are not the same thing and cannot be mapped to each other.
Type C3 models two transfer types via a D/CX GPIO. The RA8875 has four
transfer cycle types and no D/CX pin.

My ER-TFTM050-3 board has RST tied NC, and VDD is a fixed supply
set via an on-board solder jumper rather than software-controllable,
so I couldn't test reset-gpios/vdd-supply myself, but added them
as optional/required properties respectively per review feedback
for boards that do need them.

Tested on a Raspberry Pi 3B connected over SPI to an East Rising
ER-TFTM050-3, a 5" 800x480 panel driven by the RA8875 in Linux 7.3.0-rc4.

Link to v1: https://lore.kernel.org/all/20260916175942.3186804-1-azuddinadam@gmail.com/
Link to v2: https://lore.kernel.org/all/20260924145400.1385815-1-azuddinadam@gmail.com/
Link to v3: https://lore.kernel.org/all/20261001144128.2336301-1-azuddinadam@gmail.com/
Link to v4: https://lore.kernel.org/all/20261012064518.3497285-1-azuddinadam@gmail.com/
Link to v5: https://lore.kernel.org/all/20261030083737.47188-1-azuddinadam@gmail.com/
---
Changes in v6:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml:
- Drop Assisted-by tag.
- Remove sentence referencing driver polling from interrupt description.

drivers/gpu/drm/tiny/ra8875.c:
- use drm_atomic_helper_connector_create_state instead of
  drm_atomic_helper_connector_reset.

Changes in v5:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml:
- Drop the "Add YAML binding schema..." paragraph from the
  commit message (Krzysztof)
- Add interrupts property for the INT# pin

drivers/gpu/drm/tiny/ra8875.c:
- Move bindings table to above ra8875_spi_driver definition

Changes in v4:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml:
- Drop the sentence in the description saying the binding covers only the
  SPI-connected device (Conor).
- Drop unused panel label

drivers/gpu/drm/tiny/ra8875.c:
- Catch error value from ra8875_write_pixels
- Use consistent include header format.
- Return if fb is null in atomic_update
- Drop unnecessary extra byte in pixel data spi write.

drivers/gpu/drm/tiny/Kconfig:
- Add depends on OF, which is caught by intel 0-day[3]

Changes in v3:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml:
- Add gpio.h include in example to pass dt_binding_check
- Remove spi-max-frequency as there is no reference in datasheet

drivers/gpu/drm/tiny/ra8875.c:
- Remove debug-only ra8875_read_reg function
- Chunk large SPI transfers to 16 rows per chunk
- Remove unnecessary includes and spi cs setups in probe
- Create ra8875_write_pixels function for clear_screen and fb_dirty
- Use 2 spi writes instead of 1 write with 2 transfers and cs_change in write_reg

Changes in v2:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml (review by Krzysztof Kozlowski):
- Add hardware description to the binding
- Drop the display-timings property, and instead require it in the required block
- Add a required vdd-supply and an optional reset gpio property
- Rename the example node to a more generic "panel: display@0"

drivers/gpu/drm/tiny/Makefile and Kconfig:
- Remove TINYDRM prefix from the config name (Thomas Zimmermann [1])

drivers/gpu/drm/tiny/ra8875.c:
- Reformat device_id table to match current convention (Krzysztof Kozlowski)
- Drop unneeded linux/mod_devicetable.h include (Uwe Kleine-König)
- Use drm_dev_unplug() instead of drm_dev_unregister() in remove callback
- Move stack-allocated cmd/data buffers into ra8875_device struct
- Add mode_valid() callback to validate height/width against panel maximum
- Add optional reset gpio
- Use dev_err_probe() in probe function
- Remove connector detect callback
- Remove unnecessary |= on register write return value in hw_init
- Migrate from simple display pipe to manually-handled plane/crtc/encoder,
  following the simple-KMS-helper removal effort [2]
- Use defined constants instead of magic values where possible
- Use drm_atomic_helper_damage_merged() and drm_fb_swab() in plane update

[1] https://lore.kernel.org/all/fee2a743-d3e4-46b4-812f-05c3cc3a46ae@suse.de/
[2] https://lore.kernel.org/all/20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com/
[3] https://lore.kernel.org/all/202610042347.idGisdDW-lkp@intel.com/



Adam Azuddin (2):
  dt-bindings: display: panel: Add RAiO RA8875 display controller
  drm/tiny: Add RAiO RA8875 display controller driver

 .../bindings/display/panel/raio,ra8875.yaml   |  86 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  13 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ra8875.c                 | 719 ++++++++++++++++++
 6 files changed, 827 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
 create mode 100644 drivers/gpu/drm/tiny/ra8875.c

-- 
2.55.0


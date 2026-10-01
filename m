Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D5A3D47B2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865702; cv=none; b=VDpsJDJHyoSqDQ1g5jzVkKNiEvNkCb18CNxK71+TBStjvGBS8mbbiJE+vJrdKvsRiB6PzSBc2B0IZuxSLSaLee0u9ZlzkqOsw1IjHILAtubn0VMrHRxEJWBT8RgTiz8GCY8PNZ8W98k2Mc2XYzrxRI3NWkQYhZfK6zjaT9EBXbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865702; c=relaxed/simple;
	bh=SmCaPRW5RB/lhe6ewDGMORKqP7nGfg2f1E6wKHp4eIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HMELa2Gx51dOvdrvxyVqVlfWtHSZNYZqVj50a6OMBa/JD2cyeGrUm5MogeEtFiq4pMmrJU4WYTMdQMWggSg/6ChY5bw/Xncrue7WORDsVkefwU04w9rWBDzwBhHhTa4fAT2nXZYRzKehLP6Z3iOQDwR31s9xwUODfv2PZza/GsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1Hei5Gi; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1Hei5Gi"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2e2ce6690b7so2035285ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790865695; x=1791470495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCSnuGxp9XE7dQhnhZvQokcC2NUIPJCMksF4os7NREE=;
        b=L1Hei5GiXQ89bBJYnq03Najnu+KIXzbSwI7LBsTVbHyCOYF3peAzEGs2vpcBu+HLpt
         KpvaMt/o/lJEk/AIOLOQ/f4VRRTPn7VJK3hOBXFVN0Th1DqZVIq1kL4SJZaRnj66OcIZ
         AIqN5UNeEuRizMmKRJIa8Z+nI6v2NkvgZWCKpOPanyvzOdXDDmPZZ5MJ5dZu10ZjhmIW
         lpKFl0nzWDBD5IFNo/8p+/RL85nDsPjs8P7d3qvgX9yEPlEKIR4IjptfmUDJjQSzewto
         UMS7M72IPRUFSz9kmijOpGVleiTI/eKcI7+9WYTzdbik5r23DatbqYluRTv2l5hvt1Se
         cpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865695; x=1791470495;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QCSnuGxp9XE7dQhnhZvQokcC2NUIPJCMksF4os7NREE=;
        b=Yoi291ZGkA+c8C8tHwYKfa+3pOxMD95WrQg/3GfJXfnyuxpKV4za+rmpxl35j5zDK8
         XQOmqDqYJOFBbda8mIHvpooPYrwkQQC31Ah6nsfG5yIIg14/OfCX8NQQ1SrO8WxMEDOm
         IFBfYhFphrMFNnv4RnYjH8fW7PKik/oTrlfZeIdEia0cpXasVyQ+lTYoC1m4v1mbdLVS
         Ykf25VSH2TsfaPDomvAvtiKLAyyMi863G+4ntNICCx3Z23ea8CNr9EcPdKV7utlz5Xl6
         pjp2XdBAXl+XPyZ9v/gTwwMbwgZ+wrmuHfAQjLLmYfFhBcfRQQ4RLCFknkT8M5VVM2yx
         qE6g==
X-Forwarded-Encrypted: i=1; AKwUvBw4K2P8+Ec0TN7BhS62RjshF/2lxdVM3dcH5+LZOJChiJNWx0gkYL1bwJlc1Ww5+Ix5awA92spwNiXoRvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmUUPsJfrRc0uMKm5ZSV9SQnXZGTDN+BX8Xh1iDw/R/JnEgOlN
	iTUdzPiOCtYeTCuUPI+LVVocFMVOC3Re8YjqjP3W5XraAqmTunnQk5TE
X-Gm-Gg: AYBFou3X7Ws36izdZ0TdhgktpH2RTQlYE8N05sU7K81gQTDGWGemz/4pWDDv6nedAs9
	5itwVvsF8kSSeE7laQmZJRTYdiCta8Nou41e37VeW1XWI7jAqe9S65m5sf3ksmAiaH/vK1FNJU2
	CRFj5XSOtbEg2MSKpOHSuEIhGJ5Mcaep2/k2CtvI8sH1TZ2faxa61sZJ3gtaSZIvD7749hA6ZGh
	X+e7aObxMQ6pL4Az+l0YX1z7WHG7+K9cy84WkOItF1xmqcy0Ucgc21v1otKsVl4bg7jWY40OC4D
	LzO2hu+pj4+AQlkNkFsPHcoZLsnCIs4Tq/TuYZo5efaZBr6DjCO52ZR0UvOjeWkZInQWsCEu+AC
	8VggyTvmJ/OBt8DVS42/oDGSxqCROVpjMiOnnZesojGyfBpAwRHZN5uu2yLtu7rzRtppbkws6Nc
	s3+2VmG/W6ax8JHQ3Sg7d0JfIdvls0cy2qvhZlSZIwVnKMmTUD3hz13ZS4O1ZifARx3kfb
X-Received: by 2002:a17:903:9cc:b0:2e2:cdbe:bcea with SMTP id d9443c01a7336-2e2e48cd1b8mr64108075ad.1.1790865694615;
        Thu, 01 Oct 2026 07:41:34 -0700 (PDT)
Received: from marchy ([2405:3800:8e5:44e3:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30099c306sm11988435ad.21.2026.10.01.07.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:41:34 -0700 (PDT)
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
	Adam Azuddin <azuddinadam@gmail.com>
Subject: [PATCH v3 0/2] drm/tiny: Add RAiO RA8875 display controller driver support
Date: Thu,  1 Oct 2026 22:41:24 +0800
Message-ID: <20261001144128.2336301-1-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
as optional/required properties respectively per review feedback for boards that do need them.

Tested on a Raspberry Pi 3B connected over SPI to an East Rising
ER-TFTM050-3, a 5" 800x480 panel driven by the RA8875 in Linux 7.3.0-rc4.
Based on drm-misc-next (commit 7c4bda20eb0f150315d19f1b51058820e75d3f3d)

Link to v1: https://lore.kernel.org/all/20260916175942.3186804-1-azuddinadam@gmail.com/
Link to v2: https://lore.kernel.org/all/20260924145400.1385815-1-azuddinadam@gmail.com/
---
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


Adam Azuddin (2):
  dt-bindings: display: panel: Add RAiO RA8875 display controller
  drm/tiny: Add RAiO RA8875 display controller driver

 .../bindings/display/panel/raio,ra8875.yaml   |  77 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  13 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ra8875.c                 | 713 ++++++++++++++++++
 6 files changed, 812 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
 create mode 100644 drivers/gpu/drm/tiny/ra8875.c

-- 
2.55.0


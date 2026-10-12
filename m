Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD8F4349A6
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787533; cv=none; b=cGC28g8dm7qC9EfOTm+hPTOq5CxFHTXHgYcmZMzsgl8S1m+xD5iINTxt8hKMe09Axq/rmVtbCsJYam2voPPpFUESfTQtRsripjDmR67P9KalQSqMBefY582n27RHUr029HKFpktnwjFbwrAcM10R90fxf1fBr9vkPX/RKZ3Uf5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787533; c=relaxed/simple;
	bh=vsU4fgWUxgVst/irsBNGMIJwmmN6QEqkg+3ocfgqJIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ja9fC2Dx4xhpa1bVePEUKLvEAj4v1+NGFlrISpwc6YccsEptB/oB64+mT07LEF+5/CIiRP2fzMQntaq27O44ttWlcuozmMUMe3C4Sv3RmbUGNU6SMZRj/8rppot3GohON8sQO/ON2jmH301/jt7obEM5eC/YXB6eTAZfpPddvc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCF0qcYG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCF0qcYG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d01548ac96so931615ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791787531; x=1792392331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouRjuP1RtfyniT15YEA/gc6km+f4No4a2cccPN4BtkA=;
        b=OCF0qcYGuEnTa6dx+ZEJcwtC4eZOe41GLVJphuY3W4FC8YskluGt1j8AN124c8idPr
         NZu/oBoRkta5EO7WJ9MVnvGkIwyTrOeUKsM73SgckUtJyay6CHv7BwseFTQqa6J2+Jfh
         b8OZCVpKxa3N6geEL5kO7lthgaMX5vz5JiqK9hLhwmzqclVkJdIXekigw1453emZhwyi
         zzckSI76cTapythkX/MwhDKQGuplkrEHb9f6wyYEjaLmMqWyBj7baqAeqZA2cvpy33Nd
         7vghuFVBzhEEODpzEwTQUqY7RKKr9KWZsy4wNVoMaPQVrO8C/nATg7eVdsIBy3ZvaFVr
         p8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787531; x=1792392331;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ouRjuP1RtfyniT15YEA/gc6km+f4No4a2cccPN4BtkA=;
        b=uWAFwJSoe8jJBq39bbKHutdkl5DrhYLq3HeCpnSpY7HYaIftmVJZfQI9FiRh76+Q2+
         mo/XWiupj8K/pGpzf62tlbajggYL4fzELolOPH5O4+Q9V9fvCjq/CQnsC5w8IT0vgPsH
         bRSqqN4razqy33JTzg/xqoaqnUq/iUb+xdrbXUn2I/WvDpOHo1kiIzvchCB2cYsP6cHp
         voFaaT28zyFZzWQySsJoKfIW/0YWX2aBFKr47dfeDKwV+zsz+8p9XLF6sJ8sg+iFzz9x
         cuYaW6afwHjM0fJxIOmTOQndyI1ZrERxOEZU0U6Sok4GyHgtM6/yTcm4l2FCc1HHe9Qc
         ZecA==
X-Forwarded-Encrypted: i=1; AKwUvByF649W+n4yNKe1Ya78Zn3QqL3yqSp6usdD/5jOGNwkFCudqHlZXg9qEKJKfLDfToaWBSd61GH6tvy2ros=@vger.kernel.org
X-Gm-Message-State: AFq9FYKG4PEjzuF4VOEg4Pvoki0qKaW+1TJ4zeaCNeIrgSo4torkLn9H
	f31xE6YngI6xfK+5w5TSe2jmH/6OJ1WJ/xsrxJtkX3E4LB5NrPIbt5H3
X-Gm-Gg: AYBFou2wFncDj4RtQ8WLShMvo9JMmPWFWU/vt1rAeNszMx5odm+F8sVehoMR+fgD5T2
	p+fNM3mnf8DdInx+5CWDxN+OkCbGQYhHaQdnMpY9DvFqupN+RqHe1XEbIm0vi/LH5ilGiOsv1F+
	dnjjGix5WiP2m1kXutPqXQDhRai3qAO7hJOibCOKdEbsleew7Zdep9V81Bx3eiD99SwsErTtfY7
	GNF5ULl5wrSb3NfC3xyESMvgUIKP8PEdX85/1oOaxaq8UtdiUGxm9dUdKX0NlkqR3pZ/EuidJUm
	KihPDSh6txiCu0txp+J+53Do2OgmrTgKM3sKLS4Y3atJxX/saM0VIPcvJ80xSZvBl9F4TfSVzMX
	1G5qNzmCxDoLtgPZe0FSnquZn50NLJqTLEYyyeLnkybBAyd/0e3ym91I7EfT56yce4S4MNKSYEb
	bYfATZVlZQHZJO5MU9DBL2fPzabThLP+F/nIC7wWUAyOWXRlsd4psrgSnmt8TlvB+kH1dG
X-Received: by 2002:a17:90b:224e:b0:3a0:bcc8:1549 with SMTP id 98e67ed59e1d1-3ab3afb180emr11995577a91.6.1791787530571;
        Sun, 11 Oct 2026 23:45:30 -0700 (PDT)
Received: from marchy ([2405:3800:8a8:86f0:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed0daesm15052355a91.5.2026.10.11.23.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:30 -0700 (PDT)
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
Subject: [PATCH v4 0/2] drm/tiny: Add RAiO RA8875 display controller driver support
Date: Mon, 12 Oct 2026 14:45:03 +0800
Message-ID: <20261012064518.3497285-1-azuddinadam@gmail.com>
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
as optional/required properties respectively per review feedback
for boards that do need them.

Tested on a Raspberry Pi 3B connected over SPI to an East Rising
ER-TFTM050-3, a 5" 800x480 panel driven by the RA8875 in Linux 7.3.0-rc4.
Based on drm-misc-next (commit 73df79cceb8c)

Link to v1: https://lore.kernel.org/all/20260916175942.3186804-1-azuddinadam@gmail.com/
Link to v2: https://lore.kernel.org/all/20260924145400.1385815-1-azuddinadam@gmail.com/
Link to v3: https://lore.kernel.org/all/20261001144128.2336301-1-azuddinadam@gmail.com/
---
Changes in v4:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml:
-  Drop the sentence in the description saying the binding covers only the
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

 .../bindings/display/panel/raio,ra8875.yaml   |  77 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  13 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ra8875.c                 | 719 ++++++++++++++++++
 6 files changed, 818 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
 create mode 100644 drivers/gpu/drm/tiny/ra8875.c

-- 
2.55.0


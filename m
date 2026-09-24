Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C8849BD9E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261657; cv=none; b=CbS5ICTJENCW0y6tjGaay+PuaD4kxJG9JbrC/w5h+Z8re221Zq9EbffS/o4QdjkM/c7u/Oojwrw7ZGHlaxqnHl0mn0o62J4wfAruOWzGe0FfqMoA5OnaSBOQly6uorbKSyszQKYIcMK9EtNcUjflzF7GJh1xYn/2sxYgh14YccM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261657; c=relaxed/simple;
	bh=m22ieEk1JrQwTMknjO8/YAAH/1q29q7Wt/fO2MrySzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FtFpGrCOS3dwx8UIVU3dHPmYVzBnEzd/sjAKlkd3ipQT1nCnngwgenZJbKw+5WuLld0tnxHoUjRw9EnUU85InW3+h4Nym27WdsFfIitSlb78GKWUt0R+NfWRRYDENJBUxm0mBHpsWV088DdLsMnGjvWPf8gpHphdGVLJES06pVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbqM6CtS; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbqM6CtS"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a0a97efe99so25168a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790261651; x=1790866451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2jed+r/RYO8PQdQxEYLrGM4HfS4Po2jUlT/jQ5ucjw=;
        b=WbqM6CtSO9K6n8mFHh0mHlYGNWBXar4GiYRZI/EnvjewC+oXGtDQlBi9Hpq2Q75pxN
         LoTD2SaW5j00W9O2lHgSej0X1LUaJFSHe4Wcr9vDej0x1YXH4N0DfIlwICdyv9jOEwc9
         CVqrM0VqtpqhIILZS7/aq4NUC3lAqIGtO5fJWB/66Mq9nAhyzxTnue+zLTG09i2S1TCs
         FZ18yMywG4ksECT/hffJhHm/5udlJWxNX4ROu8TH5FeCF72pBQpxRrtbKSEiudjEz9EB
         n0mXppfGMHUkIbqdFoHvmzxhxqu52dgad9AMDHweytnkbBny/nMN5SE1rcqItGllAhBx
         Baig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261651; x=1790866451;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p2jed+r/RYO8PQdQxEYLrGM4HfS4Po2jUlT/jQ5ucjw=;
        b=mSwMybHuhgsj4DlXVGHmV7SAbv7UciCpCSByP68MSvsxKlfPtxmWeBCoTOklYXma4W
         qMeoBLkG9Z1zaZW88Lvut4AP57YKAQyK+Y41nkbQebwJ4ykStyXi2O/T2n8NOGIewDWV
         qGc3hKj8d/OZOE6ZgtBw8fbr1ZUKSmwsswvNNCKNUdZMCR3pENHLzzLPmHxseij7NsPV
         og9172HQaOhhR9/7MaqJI8rPtUqJkKhb+R6HBLKs+p07JstkPWl8jGQzAOQfqQ1bb64M
         oB+j9vDoCL7ljSTodFvTVPZojPsqn5Nj1dbxy0URB4J2ESEKQkALSdTAvpWX4KnEeFnI
         LjVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcQOQP76g6t7LKcu5mgqw9DL3fMM01nVbv8efLPLCfTa2bO0iAxsDbGEy2RLsLzjWc0uQFygSCTJjZqQU=@vger.kernel.org
X-Gm-Message-State: AFuF++lauGHmLDxWt+xtoG1HLfCpicjYhD0e/XzaCtMcVwV+quejy/1c
	Bkub5lD67BU0g/TkGNtpqVPppd9m+eVGo2K3KSuf1jR2J38UF0/8fGQb
X-Gm-Gg: AYBFou1ERng9Zf17nIYriXgsAUCWcuBeuzLll0rDyfUDsa1ZmD0N3hQcSBQvOkDWlNb
	hGOzz/z6MbY1Kr+MPLiHDsmjeP3mVbJfT9HoQ9UW1kK1HoYSnY31l0u+ogpTkz31ZoWzSJPlMl8
	io+G6SRrT1WjoE3foHKJRlnaw5W5a68oCYaaRKcOBopyJqdgyuVnqYOktaT8F5+xQryPAzzVcBv
	pgN2qqF0s6vtG2y4p7NWLIt2IetG4tbcfhKszkENcsrPSlKTE3dteNKbPLPZsoxKI/Kq5OWStBg
	3iQtW+OZJ+p/uAV9rxyZ9Ian1sm5BUtsxUr8q54WRERlNYmCp4bT6ROaZwU4L5uK0RlydFjhwfR
	nRUL4EJRv7lo2W6ramvZ92N9jphTog2znLTDWyilPdxnFvslcUGAMCMhrSnNyi4ipmYYY7Z9JEM
	qavSASqop3XfgJ0MP35unci79lDGE3dLo3zG6wLODoW2NeviPyqYhZ5bwWcz5KY4w/B4J3
X-Received: by 2002:a17:90b:39ad:b0:3a0:60c0:7f8f with SMTP id 98e67ed59e1d1-3a0b21d2233mr37250a91.0.1790261650464;
        Thu, 24 Sep 2026 07:54:10 -0700 (PDT)
Received: from marchy ([2405:3800:9cc:defe:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097344841sm5391590a91.10.2026.09.24.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:54:09 -0700 (PDT)
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
Subject: [PATCH v2 0/2] drm/tiny: Add RAiO RA8875 display controller driver support
Date: Thu, 24 Sep 2026 22:53:54 +0800
Message-ID: <20260924145400.1385815-1-azuddinadam@gmail.com>
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
as optional/required properties per review feedback for boards that do need them.

Tested on a Raspberry Pi 3B connected over SPI to an East Rising
ER-TFTM050-3, a 5" 800x480 panel driven by the RA8875 in Linux 7.3.0-rc4.

Link to v1: https://lore.kernel.org/all/20260916175942.3186804-1-azuddinadam@gmail.com/
---
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

---
Adam Azuddin (2):
  dt-bindings: display: panel: Add RAiO RA8875 display controller
  drm/tiny: Add RAiO RA8875 display controller driver

 .../bindings/display/panel/raio,ra8875.yaml   |  78 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  13 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ra8875.c                 | 808 ++++++++++++++++++
 6 files changed, 908 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
 create mode 100644 drivers/gpu/drm/tiny/ra8875.c

-- 
2.55.0


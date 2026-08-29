Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE4E3F1058
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787985490; cv=none; b=nP5ISRgmxFWP+gCP/+qm/w+UeB/tOelV04HIVyMG6Qtf5KMx2jBW3FMnkeiqPfODS7QvH/cy6BEeAdDbDiahhamDJFPE+P+mQmf+H+dOMbs/zdObNwcM1voLgBe/D+5nBS6rPUHscPdnjy6tMQ+g2cPiPAex7jpnlCqnTF7sRwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787985490; c=relaxed/simple;
	bh=r8bYo07SpGbBBI7dnVtYCZIooDNABB+5RG6MHH6OO1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rr2lmbk2s9DZPanQ22BtA6VhagZdQOez5IF4IbuGhzrpXFUcDW9409f8sgZrrMGOwvaOGMBlK+D9myDhPlw/qDq7frphHGJYCBUMOpNusXmiF9AhdrnHIS3xJuotdivuI3ONxgrLPQ8xw36gZNc/xJ7upyOqp1LLPERytYLcNgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nk7bmGkp; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nk7bmGkp"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so2256905a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787985489; x=1788590289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gUDHNOKmIoQbqe9mzJt0j0l2zbHlvksIrYcKhCoTP4=;
        b=nk7bmGkpOL0RrH8PMw2ZVT2dWr/c9K/FtOSqnOnNGlOnlTZ+IvgSU1y6xRqdk2RFgY
         Nf++jc3ul/8/U/dyYXRGxiuRETxFydD2wj+KnyTl7TdoZqO4euOCmtdUUm26TgQ3u2g3
         moIYHITpwuUJ/ZmVryBm+v/zpaqutp5HIipMGSK0o6ve/jfNkhTFy5qUjjJqlW0s6+Tk
         sa8esu8++3NkchacyzayLq4Ltg0riPyfZLxlTvjrYGIto2WpzyCvxdPBq1sVf4r4nUOB
         V9CovCPx88OQX3fdCXy0VIK93IHzIRz5I+zY2LAlGUH1ZYbxn9+n3ttOYg/IiO1c0Cvo
         qX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787985489; x=1788590289;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gUDHNOKmIoQbqe9mzJt0j0l2zbHlvksIrYcKhCoTP4=;
        b=s90LRfVD9ewwIyayheKXTZj7C7MSaa5nyfSKOXC9pg1Nkbn5Uw93I739z08RnWj0b2
         9O1t601rD4vJex/2hw1sPKeM8iHAJ0IoARACnMU+zUcr+u0D9hL4iD+xxdFJ/E1e8NF5
         lEzaKkGfURG/lF75k95TkO3G2XRpBHcbo52Uij8yG8HOMY/Tgm4vj7CkkiafsmWMCAk8
         C1i5CAsK84V1HmQV/WK4vdqr+JA2RRrBfxJHVLtwQ97SKspSp4VWMAP8dGXsRtwTGADy
         TQyR3w8LNB+UCOgksIIUiA7aOIzVJ3m327VGMxDEhT+IxUW5Izpkt1ZnTsu2KmAKHczU
         OBgw==
X-Forwarded-Encrypted: i=1; AKwUvBzhLuhCYIHdWAOtXY+iIXNIW7WChya9A0xL8O9Dj9MyFLhiByW7P5qRAkZrx6znK3UE/JtyG+JRpiQ23L8=@vger.kernel.org
X-Gm-Message-State: AFuF++lAzRiWEb+o+fBvNiWGlpI4eSEbFj9zdbEtXWUUr3BuoTxyyIpD
	/tWdCFZ6qi2vX161dqWX6tEHBWSjHMtp/tdfa0boTgX0SDAeTLzyLHE=
X-Gm-Gg: AYBFou3PKsEdU974gS73z7+GicZ1NIKMU5hDO93toWCnzfPqmsb2iY47W2X0yQmq6z/
	KONd+MZXf1fFJt9r3fGbWWHmZdsTOz9ReuO9czmUpDoA/r0c5w49SCqaN3RPg1PlNCg1HOzNgPO
	+xjH84nS04ZAW4QBugST1h8ZzKTKaE2Nsvw/xDIPkLEEWFQ6mUBk0xgiGFd++KWTVN6zBqiVo9e
	nlGiRMUGM1A+VD40/n7fFl21nqbUE4kzY/Rdc//qTq0yXQzwqBzNCoCSDKpy0OhAXw6PsvhXgy9
	iUuJh9DI7Ydd8eD2zk//2eaJIH8wk5pfc2IivN/XWzXIj1oERbrz1C5jclkUKH2fL6rWI/o0REC
	fF7fpT1xJqolqwPebwFlH3H8YBdwzgvZJrthSXVmRwnjzH1AP4UwiCVXC7iiFV5jp9ZI5R1hIqg
	3EC1V8TP7FVNlcTzSgK3vP6uWTtd5YUDcGiHRRdnl2WOHPsiFSaym2A7TUeYhsiqdF1TUTEGFJE
	yO2iSGaMBONfM+eNQD6HcCcCoy1ULiD4bZDAiY=
X-Received: by 2002:a17:90b:1644:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3969ba3c851mr22712524a91.4.1787985488496;
        Fri, 28 Aug 2026 23:38:08 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1abbdsm10957539c88.2.2026.08.28.23.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 23:38:08 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 0/3] Add support for CH1115 Controller
Date: Sat, 29 Aug 2026 03:32:12 -0300
Message-ID: <cover.1787973729.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series add support for the CH1115 Controller [1].
It is a monochrome dot matrix OLED controller that supports several
interfaces such as SPI and I2C.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

This is the first driver I write. The work is based on the driver
located at:
- drivers/gpu/drm/sitronix/st7571-i2c.c
- drivers/gpu/drm/sitronix/st7571.c

Tested with Raspberry Pi 3b+.

Changelog:

v3:
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Removed "chipwealth,contrast" property (added backlight_device
    support in driver's code)
  - Renamed "chipwealth,invert" -> "chipwealth,inverted"
  - Added default value to "chipwealth,offset"
  - Removed 'status = "okay"' from example
  - Indented example with 4 spaces as stated in the documentation [4]
- In driver code:
  - Added support for backlight_device
  - Replaced drm_dev_unregister with drm_dev_unplug to cover the dt
    overlay unload case
  - Executing drm shutdown operations before turning off the display
  - Checking that the width (panel-timing.hactive) and height
    (panel-timing.vactive) parameters are greater than 0

v2: [3]
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Fixed linter problems
  - Replaced first_page property with offset
- In driver code:
  - Fixed dst_pitch calculation
  - Renamed file from ch1115.c to ch1115-i2c.c
  - Support flip-vertical and flip-horizontal dt properties
  - Fixed several things found by sashiko-ai

v1: [2]

[1] https://datasheet4u.com/download/1576606/CH1115.html
[2] https://lore.kernel.org/all/cover.1786110720.git.nico.antinori.7@gmail.com/
[3] https://lore.kernel.org/all/cover.1787321297.git.nico.antinori.7@gmail.com/
[4] https://docs.kernel.org/devicetree/bindings/writing-schema.html#annotated-example-schema

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller
  MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller

 .../bindings/display/chipwealth,ch1115.yaml   |  81 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/chipwealth/Kconfig            |  16 +
 drivers/gpu/drm/chipwealth/Makefile           |   3 +
 drivers/gpu/drm/chipwealth/ch1115-i2c.c       | 887 ++++++++++++++++++
 8 files changed, 997 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/chipwealth/Kconfig
 create mode 100644 drivers/gpu/drm/chipwealth/Makefile
 create mode 100644 drivers/gpu/drm/chipwealth/ch1115-i2c.c

--
2.47.3


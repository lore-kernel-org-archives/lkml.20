Received: from mail-vs2-f20.google.com (mail-vs2-f20.google.com [74.125.227.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4F758FD0E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202954; cv=none; b=eTH4LvlMALDRUpUIBr6f7ArF/dpcXgo3nLaTKHCqDdbTld5ELNEmHfWyTEpYXGkyGJyApFsQdtRym/oMeXpPjUSCwSmi9L2APFJWjAjU7ARh6GNNn08hETRTrTuNL905sVheVspGGOWcN09G1f+JNR94Lm99RjSCKOZIj2RkZiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202954; c=relaxed/simple;
	bh=jbncQFO8THehAlFqBfjAmwdcyvpJzFigEmUeUp4MnbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oE/IQEqOXL7wLFcB7xIRXKjTH9WB4nrN0/zwSSleF49AzC1DGdFU8+YLbiM7xwlKGTbu4aW0JD3jt6VchTDyOX553LbwWs68gtLrG5UsJME6bEWivViBOtdNKx49W6EMOJds+3D2glijhndLzMOxKGCAAa2U8EcgREnJl+Lg8Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rsGuVg/7; arc=none smtp.client-ip=74.125.227.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rsGuVg/7"
Received: by mail-vs2-f20.google.com with SMTP id 71dfb90a1353d-5c67e4fff62so582376e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202948; x=1790807748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bClm3tufwH8Z04BuQiDaCFYe0ZcBB/1uq3G9UCOaFoQ=;
        b=rsGuVg/7FkfU09F7MurvC3FIton/vgHsfIZ3+kbdksvSaWCLnCLLvKR8Ir++Di57Jl
         QkfMtYlj/UCZsvU1xl4/MGv5zXp7We1jhDwo4TwuGRJXzWqkNt1BMJw64hjqILEw6+g+
         4r5NyexnEPinw1O3RaNiMi6tVP7KBEwsuY6THFC1ciGmKTloTzcrbMUi0eJMJzsgffzM
         8nKtxL5vEK+AKhsLpTgz/r/+9xBOYXVfTp2Er6sVZKTHe2WRi9NzXvLOSQ0C1o8qMCHY
         LsgAA+lSJjYLQZuMjBfNvErFg1wTyyGIpgGN71/JGmTw61oZa7BBR+9VKTMvEDOAAoGB
         RYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202948; x=1790807748;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bClm3tufwH8Z04BuQiDaCFYe0ZcBB/1uq3G9UCOaFoQ=;
        b=2mzL1xx+UP6pkf/YZcuwsNeWWUeI6BrqNH5oDlhfrTZA0LiX+CcYohH9uK1IO7LFqx
         r8OYLSWLDD0U1rVTlDZIjp/rY3hX+583ml+XcVHp8IQKK4p36QZFuYk/LSdZ+lA1xnaX
         7ZuyUBLUf0umlvxtRGC/OWbyC/6fJeYj7KASyQVwjnyLdtkuv1qYr/5KsqMFyt0Sh2Fx
         YffoyDwr9TOUHgQ3byD84UFr89uXcW5BX8XvfEwqZn6zTWoZocmbkhsD/JtRsCkYvdsv
         VCjCFvIps5hVXNwBaEa3xd40fGfKCs7jxlKKZvxtyREcE+Fr2HQgIBzcXdMXPp4A/ZB+
         KAPw==
X-Forwarded-Encrypted: i=1; AKwUvByg1KSxzjG2hpr1IptIFsI0wU4lldK66JeUtJTqCb676ltHYyQk+U3yzJ/duzBV7Xr75qYxWENxaClAFao=@vger.kernel.org
X-Gm-Message-State: AFuF++lbjL+ZxdVlNe/ZIW4b2o5WcvKpMiRrbDK7rI0G7XSfekLaDmEP
	fT9WgiW1e3tMJuyRFv0TpESwoW7g9ISUj3kXxeRCs0rJYYKG9/jiZp4=
X-Gm-Gg: AYBFou2hcdXh1aW8Ju4yIRdupQUvLCCfPRjOR/MOLVa+9DJg/LnwObwfnZTgEnGodeS
	o/h3gzDNNvHjhXyQlmgCEZxR0Ln6AAKP/Cr48ABzA2Cb9Q+MErUy4JMXqPZs4xljLFDo7lwwtW5
	Scw5dwUJukz0WgBRrY7dfUBviQb4lE1Rc3B12yN0kHSnAv23XVBQ/8cHVraUg1DRu5650yZ4SJR
	7+QbAYMNv8yu7UFbwXXJkw6eSauSdwrxD8XwL1z+zME449LywzgzpG7W2Q8jxFgk8z2Pus0R2vC
	Xg+TnJ4+mK2p82mJ/pFuvAjZrJuPENZEf+9iOZ6yBtTrHPUL7fAwgVljRBd4e4JmvzyLpSJ+/av
	qRaq0GRapvD81LmncGHNB2LUY9t7lnhepPV7+XSQ7Nc8VqOjsu+BLQ2Hi79d7clBgeFSBwhJqw6
	AnlpwhI68DeECSAacFGfexC776bjqjVWB/CvjWVI23uWUwCk+vXbzKLcHoLbCifdtDEFdqv+hvi
	ubgS1RfgC24wZ40wkG59YBToFlMMzEvoBn2jhOVftKHrCFDvw==
X-Received: by 2002:a05:6122:29cb:b0:5c8:3870:ff73 with SMTP id 71dfb90a1353d-5cb09217726mr543120e0c.4.1790202948179;
        Wed, 23 Sep 2026 15:35:48 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm5162983e0c.9.2026.09.23.15.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:35:31 -0700 (PDT)
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v5 0/3] Add support for CH1115 Controller
Date: Wed, 23 Sep 2026 19:35:12 -0300
Message-ID: <cover.1790200427.git.nico.antinori.7@gmail.com>
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

v5:
General:
 - Patch series based on 7.3-rc1
Driver:
 - Fixed KConfig dependencies (OF and BACKLIGHT_CLASS_DEVICE)
 - Initializing baclight with backlight_properties struct
 - Moved driver from drivers/gpu/drm/chipwealth to drivers/gpu/drm/tiny
 - Fixed allocation for hwbuf if width or height are not multiple of 8.
   I was allocating less memory than needed in those cases.
 - Fixed damage rect horizontal alignment.

Note: The last two fixes listed were pointed out by Sashiko in some
occasions but when I checked them I dismissed them for false positives
because I misunderstood them.

Note 2: Sashiko keeps complaining that i2c transfers are called in
atomic_update callback stating that it is forbidden to call sleeping
functions there because we are in an atomic context. AFAIK this atomic
context is not that the kernel is in a non-sleepable state, but refers
to the DRM way of working by doing check -> commit. In fact, the driver
I based this driver (st7571) and others (ssd103x) do i2c transfer in an
atomic plane update. Am I missing something?

v4: [6]
General:
  - Patch series based in kernel v7.3-rc1
Driver:
  - Fixed nits found by Christophe JAILLET.
  - Fixed max_width and max_height in modeset to avoid having bigger
  framebuffers than resolution.

v3: [5]
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
[5] https://lore.kernel.org/all/cover.1787973729.git.nico.antinori.7@gmail.com/
[6] https://lore.kernel.org/all/cover.1788711082.git.nico.antinori.7@gmail.com/

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller
  MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller

 .../bindings/display/chipwealth,ch1115.yaml   |  81 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  17 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ch1115-i2c.c             | 895 ++++++++++++++++++
 6 files changed, 1002 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/tiny/ch1115-i2c.c

--
2.47.3


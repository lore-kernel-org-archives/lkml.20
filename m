Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738829;
	b=ksMLEz2CMM979bq/EnE4eq/j/LWEnBC/kzvNqAEXEQGzS0LUuq/tyYfOKsOiACydR+0Y
	 4ajaV0AfzYSRQrzerfnwTBmLZk5Oze6AYn/CmuZZPjIbvtOUQcjX00RGQ+472NOiyBOKk
	 M8FerhvroFGhHiiARQ/4m2C4Q49ahaTjh956JF6VY3tAHKK9OGNKveRQWGCojXMpk4egF
	 v9uB42yXXR7OuTvqvkS8XG8R6XkDyqV/oxhFaWEELuQHrP+5zKdeOUdlbIv94ScpsFJti
	 +ExMk438KOiJqoNLbDhYDRACP6bjn/wJ0SoM4UyxuRiqTKRZT1Pu9NpqF0v7eakzAsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UNLZOB7RlMn7c8blD1Uiiei/dC7dkvXjaLxBgJvaSyg=;
	b=AyZZwTQpWfxHBnLJ4phxgX/zBQcMVpDlQPMM8h49OgVvTYOmNepg4KljxbDV7w3t/bgm
	 AGG/Zp3aVHQFaTUNyNEuAYJUhIcH8xbEcfite4v9Yhe+Gjl2lOefSiJp0rr1ZjfFZ5716
	 0wu0799EwVqc9RzUhrx/NnJ09Ptn80FnThorPVRdh9AUsOPtvQfNfSNpzcOocdJ+CVvtj
	 qDKDYA7OWLJAOQBGkh0n9H8xUvGAUBGEzKzLpl5nPVvXg1vx8iMZa4W2QYffcJv/Kr6Xh
	 wyzDac0G9bnPGvg/nXmJhowPxgSNWAl1wIAeOmTnbzppLi46sIDEpXR9LlKN9BDVgxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4SnkvTi;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CED2606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CED2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4SnkvTi
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eadef147ffso2889322e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738827; x=1794343627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNLZOB7RlMn7c8blD1Uiiei/dC7dkvXjaLxBgJvaSyg=;
        b=w4SnkvTiPR82rsjnRiSEKqqfk2WWGc+5HDeLU6GwCPCxs36CkuTHC+xHdljimNvv02
         NGLXGRl9GlnDgqH1rhjyHkr6aFxV8VvnFArSp6JtsLr5Lem/HvFYHEQgxpy7wSI/VlHP
         IjQWqxVuG+XzXiCEP+0RY07fIKgA0Ani69hQlXbpqH5usIe488i7rqmpVCSTeCT36q/o
         acLn33lKR2P4iu8TNe7z+/NO/lirISCHMT1Yfp1Kiua/WphLO08yDd6C2+fC8OCIae1w
         aCmYmwsOGBabwGJAH3PmNyO6uED7Qh3Bhz8MaSk7ptcqvFN8w+VQckNFtPTNMotllhpC
         ZL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738827; x=1794343627;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UNLZOB7RlMn7c8blD1Uiiei/dC7dkvXjaLxBgJvaSyg=;
        b=FtulSD5p5c1EfdEIlm1A520WIPOla3+PbTYtqpd0PXG4eizI2fF5LSHDWxtmdcgADg
         icIL+KQDdczThoisGk0uFMtPiyEqcbNmVgX+HMKnykc5UbCsD8CSKy72beMRIphIcUaV
         BXJLFqTML1Klc++VBKnj+LH11ngO/DgYulhBlL7U7AsZuY8Mpe7xw/lX4RgqmUp44ryN
         HQKxYVx4SiejT0iL46luDUADxCemvFlK999mh68bxTOXKkwEMNxqceC6TXYhmeeefihY
         0/0IE1qgKcjV8+u+2hu8d2+OmosmbUfZtxgjej8AInzQcb6w3HRpFyu3RYTDsU0ZPMrs
         IiKA==
X-Forwarded-Encrypted: i=1; AKwUvBzklCwk4CKaKb8SlvMRP8FNwaDoS579G0wioUFqO86MFfjuzmtg7SBTkLZUvVBXSvzbwvD+tGs88QXyhgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X6CqzE2eGpHOVNtC5phzD9B+z1rr51H37OF5wb8qojdsZPkM3
	bKJt/Z/VPQTrwPflxVV9RNMX6FrB2fG6A5a88koHmF7aYpzh4yPrV8drZoDM
X-Gm-Gg: AYBFou3khjVcESKzaH67t1AKR/A9l8H0P5rqvGs2MuTqjwCGSkNNp83unBGBiF8tG+H
	6yHHgyxvOqhsabsnjUO2FWErNKYGxIvF3+jIjHb5IjHbefRt39XG/c+32ZHMxXuv9wWKbKRM25+
	7aTzjOhCXPX7/Da/Ykzan7lqcY0wSS119tnmhgP98fbLu5DmIMAODHFy58LBKIrCJU+vO3x5Uwn
	7xmAVgP3McfT6MyNJxHcPiUKKhD7hUPPeey61r23iRGsOlaVmlJX8jWqDB42OVyksh9Qyb2rLpt
	SaW8TRfEIrFS9dUvip1Y7qiIcecNyKGt2+SB65IiZmn8rS+VX2h1tldt3t6t9IN5s/1TN9jzlE6
	2ITqT8iX2XTIE93glrGQkR3W6/V62bcMB3VMWXmBJeEpUCMVLMchusRtIENcAOb1Jlqx8AfZpS3
	77Fb/I1SYwGO7YiSarb5O8RmaI2yVDjviSMlihiahBwVji8/5B5SKoip1gtUMF2f7RA9h7QBsdZ
	G5r1Rxt5Op22Je4xvsaHItjVJyjSpPaRAG2RgF2yOdhIqBwvG9VgRCNxZZ13P/r6ySeaJvvMtKZ
	C1bty5rarQJaYrE/ldKk28reQTdCv2LSUEJcbY/zMLmLb7o0ldFs+LeSz8mgmO0hMUBvyn6y463
	bhb8f
X-Received: by 2002:a05:6122:328b:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5ec68952670mr7610678e0c.4.1793738827265;
        Tue, 03 Nov 2026 12:47:07 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b81b3sm119618e0c.2.2026.11.03.12.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:47:06 -0800 (PST)
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
	Javier Martinez Canillas <javierm@redhat.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v6 0/3] Add support for CH1115 Controller
Date: Tue,  3 Nov 2026 17:46:50 -0300
Message-ID: <cover.1793735996.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Tested with Raspberry Pi 3b+ on Linux 7.4-rc1.

Changelog:

v6:
General:
- Patch series based on 7.4-rc1
Driver:
- Fixed KConfig dependencies: added depends on MMU because of
  DRM_GEM_SHMEM_HELPER select
- Removed unused constant CH1115_MAX_PAGES.
- Removed unused ch1115 struct member pages.
- Fixed width and height checks error messages
- drm connector: use atomic_create_state and remove
  drm_atomic_helper_connector_reset: This change is because of [3]
- drm CRTC: use drm_atomic_helper_crtc_create_state and remove
  drm_atomic_helper_crtc_reset. This change is the because of [5] [6]
  [7] [8]
- Replaced devm_regmap_init(...) with devm_regmap_init_i2c(...). Deleted
  related unused code. In this driver `I2C_M_IGNORE_NAK` is not used.
  The way of communicating was carried from an old version of st7571
  driver (and me not understanding better). This change is because of
  [4].
- Early exit on failure in ch1115_encoder_atomic_enable
- Removed "CH1115_CMD_ALL_ON" in shutdown sequence. This was a
  misunderstanding of what this command did.
- Fixed Sashiko report from v5: "[High] core: uninitialized variable
  `bl` used in IS_ERR check". Apologies for this, my LSP did not
  highlight the problem and I overlooked it.
- Fixed Sashiko report from v5: "[High] drm: out-of-bounds heap read in
  ch1115_transform_xy()".
- Fixed Sashiko report from v5: "[Medium] sysfs: unprotected state
  modification on registered I2C device"
Dt-binding:
- Removed adding Chipwealth to vendor-prefixes.yml. This was added in
  commit 058ee00216a1 ("dt-bindings: vendor-prefixes: Add Chip Wealth
  Technology")
Link to v5: https://lore.kernel.org/all/cover.1790200427.git.nico.antinori.7@gmail.com/

Note: Sashiko keeps complaining that i2c transfers are called in
atomic_update callback stating that it is forbidden to call sleeping
functions there because we are in an atomic context. AFAIK this atomic
context is not that the kernel is in a non-sleepable state, but refers
to the DRM way of working by doing check -> commit. In fact, the driver
I based this driver (st7571 [9] -> [10]) and others (ssd103x) do i2c
transfer in an atomic plane update. Am I missing something?

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
Link to v4: https://lore.kernel.org/all/cover.1788711082.git.nico.antinori.7@gmail.com/

Note: The last two fixes listed were pointed out by Sashiko in some
occasions but when I checked them I dismissed them for false positives
because I misunderstood them.

v4:
General:
  - Patch series based in kernel v7.3-rc1
Driver:
  - Fixed nits found by Christophe JAILLET.
  - Fixed max_width and max_height in modeset to avoid having bigger
  framebuffers than resolution.
Link to v3:  https://lore.kernel.org/all/cover.1787973729.git.nico.antinori.7@gmail.com/

v3:
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Removed "chipwealth,contrast" property (added backlight_device
    support in driver's code)
  - Renamed "chipwealth,invert" -> "chipwealth,inverted"
  - Added default value to "chipwealth,offset"
  - Removed 'status = "okay"' from example
  - Indented example with 4 spaces as stated in the documentation [2]
- In driver code:
  - Added support for backlight_device
  - Replaced drm_dev_unregister with drm_dev_unplug to cover the dt
    overlay unload case
  - Executing drm shutdown operations before turning off the display
  - Checking that the width (panel-timing.hactive) and height
    (panel-timing.vactive) parameters are greater than 0
Link to v2: https://lore.kernel.org/all/cover.1787321297.git.nico.antinori.7@gmail.com/

v2:
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
Link to v1: https://lore.kernel.org/all/cover.1786110720.git.nico.antinori.7@gmail.com/

[1] https://datasheet4u.com/download/1576606/CH1115.html
[2] https://docs.kernel.org/devicetree/bindings/writing-schema.html#annotated-example-schema
[3] https://lore.kernel.org/dri-devel/20261022-drm-no-more-connector-reset-v2-26-0b7e4e85b1e8@kernel.org/
[4] https://lore.kernel.org/dri-devel/87345ckt2n.fsf@ocarina.mail-host-address-is-not-set/
[5] https://lore.kernel.org/all/20260915-drm-no-more-crtc-reset-v5-0-bda007735748@kernel.org/
[6] https://lore.kernel.org/all/20260915-drm-no-more-crtc-reset-v5-9-bda007735748@kernel.org/
[7] https://lore.kernel.org/all/202609260122.KLDd6aW4-lkp@intel.com/
[8] https://lore.kernel.org/all/202609260545.eEm9FCKo-lkp@intel.com/
[9] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/sitronix/st7571.c#n371
[10] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/sitronix/st7571.c#n224

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller
  MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller

 .../bindings/display/chipwealth,ch1115.yaml   |  81 ++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  17 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ch1115-i2c.c             | 859 ++++++++++++++++++
 5 files changed, 964 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/tiny/ch1115-i2c.c

--
2.47.3


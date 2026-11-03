Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680664;
	b=A+uUBFUw2IpKO2t+5+MP2lyIdrpUZLvC9d53PwWcatJLzvHI1mWa2G/BEgjJzr0jZA/5
	 rVct2yxHhVrU6sEu8bJ1nEdzBxjD6Ar7FZGylltpCOKGKXgFsOipTBv62pWisUk39lusQ
	 lwb9BZLqHnsThu2Ih8z3Tmt25W25oRONGn3JVlR0D6A8B4vLBWIok+sUSTzkrovBOK60u
	 9A+EP2ODLOqmD7/vULouKuMqQczIqJXKvpfCA4yMX07wtJKjELLVDAs1KvpjYWkqUci+2
	 19BcNKWlZaXHqxxIxkpIKtIsfQUW2q1syl8zakRVi/qmTc1Lxl1qAh0eVlwM7Ua8/qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y6wjbZhTp6FgAt4yM4WvATTLzIXuOKHx2x55i4aYjqw=;
	b=j1fvI5HGgyby9rhIfKwYV3tIVUQjbVG8HaYnAVTCw4FrI0cVvhqwt9ZUqlJqApSkNw03
	 8RWckYy7PKbdSNZfSefKKJoNjYuaggtrqR2uLOhLCKOUkvf9nmFtuF7MiVubcsmwtX7Z1
	 fG9C0PaTVpsXOCV6qlEjcWnf6WF4SZPr0QlBYwr4DHG0KW1Mqrcv9rjGddoRrLkoMkdzS
	 fqYfh/i//5HBB0kb6HdnYTCQqm5OTOj8U57UZda3yI5hNS7vHSF2LPrpaAASyaUSGM97e
	 bCFQYzivTYF+EngJ8QOdj8yphnRQBmP0tgxtB5ggjtkbNBiTI/KNXILEIz3TjeuFLnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oW4jOSx7;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944E9606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 944E9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oW4jOSx7
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8246b13cbso31801125ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680663; x=1794285463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6wjbZhTp6FgAt4yM4WvATTLzIXuOKHx2x55i4aYjqw=;
        b=oW4jOSx7D0JSROpnF4CChnXtkfgNeiGcg89AkTawpHxD/LR/9yD3eD1YxF4ucRwgLs
         elnGb4s7J21M1wmyZi4adPxcN76kU+pv+b7TZexIWFXl5d7mnLEFDujTNP16Vif40dct
         +6/Sgw0llpqyu8bjd1nYBX45JbXiBIlim64MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680663; x=1794285463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6wjbZhTp6FgAt4yM4WvATTLzIXuOKHx2x55i4aYjqw=;
        b=ayyyy+44kip1Ib96yg6AxRS2j0NDRjanojrX+XScX6cEP/vLyU1Z5I8ZSPf5NS2LHJ
         O35qj3kDVczyFrkWNUA09H0BieYxdzhUcaNqc2gh3mF6vHAQJ0MLQfMmrG9MFaZUOIdO
         gkzNIbhm+QeCOq8OJ3ssYiSxIsifaQrbxykrhrCLtgA8uOHPvz9pFFLxb3RAT/UTGjkT
         G8CrAIYgcy8qGQFC8LIoKW58G2eK6K/EgjNqVKJsgWH/LA3BzSEQoH3FUrIMFxwEe+If
         NIukRHJ1mUtAQxWADUoKPt1uWtVgxDL2Fu2vpuZXyO5LipdjlnUe5/beszvTnwQpSuyr
         HMLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqyhGrIzZvAOG6lQkOez9Me3NOuBie01exILEvBHz92JMB7tRHVjJZCniXLGxMwpz1XvQtF7rNm84wJiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0s064Lczhh4NtwNPncQLrRFlPc0xATScKQO1/mbHKelmqqX3l
	EUdupLWcE+yln3D7xTnVUz0E82J8GickJ6QotqXRQ2WuzkZMU9QMYiywkkbHFBngDw==
X-Gm-Gg: AYBFou19iL3u7r8+Z/OCninl/E4qHoqy/opPi7zXj6X/Da6kH4SEXRvPiERx3w2iVjb
	ewpLIeQFmgV969612/hdSaDLVfb73uPbNS6RYXJzQK7YNoq2aKSQZOLUNLS1RkwONgC8hT4ih3q
	XF7XCn/Jwfv2YgKRw9qO+3jxh29y23VQfTH5xiezQCZjjsPckWs0Ip82l2gXrHcuX12wm7vH2Ix
	ykg6KUe9YWDOyXllCCvO5igesDrrq8ywOksATIuyAs9r8XE9ND3qSa6LLfp3V2IGpsrrsktgeyn
	S3VBMcmtGabHHS8I78OVZ/oKiTr7egk4ON4PJypeATFdT1RN7nxEd8GQCSpxzre2y6r0UxpM+ig
	uBi2yWTjkVanAH2xzTfVGhH7/QaY3ex3VSaMr1Fw8KgHGUUuQmP1FsBsicko1YJyGV9SYWNbzvK
	+if3tlSET2e/Ency1mJP1mGywerQZzTWQhezyaczryOvwnNBZCISRaMS2u6dVJid6kL8AwlkQhD
	lZ7vf80/VexS0DUu1Gix1PJsyxSEhue25RQjEimneq9XSFlpmVQlsOJun7zXkULdeWDmPKHycaQ
	kX9ANQvIuOXUIUz60lpWd6pQvl1G/yxml0L0NSkf3/tuj3mMmXJolGUBupVYqYMkzrTKDhulriq
	mw2clHjbQ88za1H62S7mKv1b5fxQ1CUnvCw==
X-Received: by 2002:a17:90a:b890:b0:3ab:e588:c29b with SMTP id 98e67ed59e1d1-3ae8e5bdcc9mr6988054a91.5.1793680662787;
        Mon, 02 Nov 2026 20:37:42 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:37:41 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/8] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue,  3 Nov 2026 12:37:24 +0800
Message-ID: <20261103043734.2179858-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v7 of my Chromebook trackpad supply fixes and optimization
series.

Changes since v6:
- Patch 1 (regulator)
  - Fixed rust build
- Patch 5 (cleanup op)
  - Fixed missing parameter in cleanup op type declaration
  - Fixed typos in commit message and comments
- Link to v6:
  https://lore.kernel.org/all/20260901074930.764550-1-wenst@chromium.org/


Changes since v5:
- Patch 1 (regulator)
  - Correctly assign wait_us to all bulk consumers (Sashiko)
  - Check _regulator_is_enabled() > 0 to check for enabled regulators
    (Sashiko)
  - Lock regulator_dev on final _regulator_is_enabled() check in
    regulator_register() (Sashiko)
  - Make it clear that _regulator_is_enabled_recursive() assumes that
    supplies have been resolved (local AI review)
  - Consider supply's last_on timestamp for regulators that are already
    enabled or have no .is_enabled() ops (local AI review)
- Added noautosel tag for some patches
- Added patch to pass component probe success or not to cleanup callback
  (patch 5)
- Only defer regulator disable if a device was found (patch 6)
- Link to v5:
  https://lore.kernel.org/all/20260825041628.988369-1-wenst@chromium.org/

Changes since v4:
- Made regulator core try to set last_on timestamp for regulators that
  were left on by reset default or firmware, but not enabled in kernel
- Dropped two patches that were merged
- Link to v4:
  https://lore.kernel.org/all/20260811122011.3539250-1-wenst@chromium.org/

Changes since v3:
- Added __private modified to regulator_bulk_data.wait_us field and
  switched to ACCESS_PRIVATE accessor for the field (Andy)
- Moved wait outside regulator lock scope (Sashiko)
- Moved "remaining" value assignment closer to conditional (Andy)
- Fixed variable unit name in regulator_enable_and_wait() prototype
  (Andy, Sashiko)
- Added commit message section showing average delay needed for I2C
  prober (patch 6) (Andy)
- Link to v3:
  https://lore.kernel.org/all/20260721075226.2347933-1-wenst@chromium.org/

Changes since v2:
- Added new regulator "enable and wait" functions that wait until at
  least the given amount of time has passed since the regulator was
  last enabled.
- Converted patches to use the new functions
- New header inclusion cleanup patch for elan_i2c driver

This series fixes the trackpad descriptions on some MediaTek-based
Chromebooks: either the trackpad's supply was set as always-on to
workaround missing delays in the driver, or the delay and supply
are missing from the trackpad's device node.

v1 was just the first patch [1]. It has since grown to cover multiple
drivers and devices.


Patch 1 adds new "enable and wait" functions for single and bulk
regulator enable.

Patch 2 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. This uses the new "enable and wait"
regulator enable function.

Patch 3 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 4 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 5 makes the I2C component prober let the cleanup callback know
whether a component was found and enabled. Needed for the next patch
to only delay calling regulator_disable() if a component was enabled.

Patch 6 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 7 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description. Should not be backported without
the other driver patches.

Patch 8 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. Patches 2, 3, and 4 have build time dependencies
on patch 1. I suggest placing patch 1 on a separate immutable branch
or tag for the other maintainers to pull in. The three patches all have
different maintainers.

The DT changes must go in after all the driver changes land, especially
patch 2 that adds delays to the Elan trackpad driver. Otherwise the user
could potentially end up with a non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/

Chen-Yu Tsai (8):
  regulator: core: Add "enable and wait" functions
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: Let cleanup op know if a device was found
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   8 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |   1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |   2 +
 drivers/hid/i2c-hid/i2c-hid-of.c              |   9 +-
 drivers/i2c/i2c-core-of-prober.c              |  34 +++--
 drivers/input/mouse/elan_i2c_core.c           |   7 +-
 drivers/regulator/core.c                      | 129 ++++++++++++++++--
 include/linux/i2c-of-prober.h                 |   7 +-
 include/linux/regulator/consumer.h            |  21 ++-
 include/linux/regulator/driver.h              |   2 +
 rust/helpers/regulator.c                      |   5 +-
 rust/kernel/regulator.rs                      |   2 +-
 12 files changed, 176 insertions(+), 51 deletions(-)

-- 
2.56.0.385.gac671c819a-goog


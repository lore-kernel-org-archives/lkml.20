Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6254F448393
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834789; cv=none; b=AWPKamoBnDce/5ZkMW3TVcH/GxUTNqxtX8/ivUnWAUbo/7R7QvaMrfwaKhzUxAc5laeHmO8WhY3TYmgw0/d22cj7QwAsnr37dCU3NSjJ5eY2TtV5qg/ySJphgFUHl28tZlReoEKAYSGwDey+TITxz+bkikQtHdG6Y+gh5mrxjys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834789; c=relaxed/simple;
	bh=Fa4yz4ws80lvnPHZGu7LUR50w5bA4WdsPLfYwz1C7kc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJqYS+5QTATvbmGLy9uIze98A2vpB/e+JFoleO5LYB9eR50BTT/hod0LnQyXgU3MywKm9Gtp+qRcWTriQSS32eHZF++CGouHYzsz1TuM1IZxGtz7hsFW37BxGETkL/trnNhoOleyiTdyo7C4cAC6s13xhBABh0MmVGR+nfPVXsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMMXu4/+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMMXu4/+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530A41F00A3A;
	Thu, 27 Aug 2026 12:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787834779;
	bh=B5ucIQ1lVVSs/cgcJ4OWpF3bwfs7pY1lRvruaqatyoM=;
	h=Date:From:To:Cc:Subject;
	b=FMMXu4/+1nIwqzrzlPkkbEUEPYxR6fPw+xfJHVxG7V2Zy9aK1skEhv8I5jD2/8+Ae
	 Owf8WnpQ6dnxp9edMiP+gQvcArtiNdZv5rj/Y32D3EDaqUiYTd8Vpg6LLengIvz/tZ
	 2aD7OFo5hYnKsinx1ZGANeGTdEgVO3Iz/Rvo4xIzaCzo61gAy+ciGmuX4WJkYnLK+R
	 2Jkjr+WmipzFMOCg/eK7PphQbO9s8UMbKmJl4GaWArfPqVqXA8PoL7M6nkoSm0PwZg
	 rl8o9uyhhrSLShd5SPxnKqJORSh7tuWdi6QL8E3ShjherSIcDs40X7SuHuWGHnogYe
	 3HXfmLUniY5Jw==
Date: Thu, 27 Aug 2026 13:46:15 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Pavel Machek <pavel@ucw.cz>
Subject: [GIT PULL] LEDs for v7.3
Message-ID: <20260827124615.GF770273@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Good afternoon Linus,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git tags/leds-next-7.3

for you to fetch changes up to f8cca63a0a4f3475199d9ab7f86782bdfeb0744d:

  leds: is31fl319x: Modernize registration (2026-08-12 12:45:11 +0100)

----------------------------------------------------------------
LEDs for v7.3

- New Support & Features
  - Core: Extend netdev trigger speeds up to 100G.
  - PWM Multicolor: Introduce default-intensity property.
  - Analog Devices LTC3220: Add support for 18 channel LED driver.
  - NXP PCA963x: Add multicolor LED class support.

- Improvements & Fixes
  - GPIO: Clear error pointers for skipped LEDs.
  - Broadcom BCM63138: Use %pe to print pinctrl error instead of %ld.
  - ISSI IS31FL319x: Modernize device registration by using fwnode APIs.
  - NXP PCA9532: Fix inverted GPIO output polarity.
  - NXP PCA9532: Fix phantom device registration on missing hardware.
  - STMicroelectronics ST1202: Correct and extend hw_pattern documentation.
  - STMicroelectronics ST1202: Fix channel disable logic on zero brightness and ensure
    brightness changes are applied in active mode.
  - STMicroelectronics ST1202: Fix hardware pattern sequence programming, validate inputs,
    and correct pattern duration calculations.
  - STMicroelectronics ST1202: Validate LED reg property against channel count.
  - TI LP5860: Fix a potential double-unlock during device initialization and fix error
    handling path by using devm_mutex_init().

- Cleanups & Refactoring
  - GPIO: Make legacy gpiolib interface optional.

- Device Tree Binding Updates
  - Core: Add default-intensity property.
  - Core: Document "gpio" trigger.
  - Analog Devices LTC3220: Add DT binding for LTC3220 18 channel LED Driver.
  - Broadcom BCM6358: Convert to DT schema.
  - LaCie NS2: Convert to DT schema.
  - NXP PCA963x: Add multicolor LED support.
  - NXP PCA963x: Fix reg maximum for pca9635.
  - TI TPS65217: Convert backlight bindings to DT schema.

----------------------------------------------------------------
Andreas Kemnade (1):
      leds: is31fl319x: Modernize registration

Arnd Bergmann (1):
      leds: gpio: Make legacy gpiolib interface optional

Christophe JAILLET (2):
      leds: lp5860: Fix a potential double-unlock
      leds: lp5860-spi: Fix an error handling path

Cosmo Chou (2):
      leds: pca9532: Fix inverted GPIO output polarity
      leds: pca9532: Fix phantom device registration on missing hardware

Edelweise Escala (2):
      dt-bindings: leds: Add LTC3220 18 channel LED Driver
      leds: ltc3220: Add Support for LTC3220 18 channel LED Driver

Eduard Bostina (1):
      dt-bindings: leds: backlight: Convert TPS65217 to DT schema

Jonas Rebmann (2):
      leds: pwm-multicolor: Introduce default-intensity property
      dt-bindings: leds: Add default-intensity property

Loic Poulain (3):
      dt-bindings: leds: nxp,pca963x: Fix reg maximum for pca9635
      dt-bindings: leds: nxp,pca963x: Add multicolor LED support
      leds: pca963x: Add multicolor LED class support

Manuel Fombuena (9):
      leds: st1202: Stop pattern sequence before reprogramming
      leds: st1202: Validate pattern input before stopping the sequence
      leds: st1202: Fix pattern duration prescaler and pattern_clear skip marker
      leds: st1202: Set all pattern PWM slots to full after clearing pattern
      leds: st1202: Fix spurious pattern sequence start in setup
      leds: st1202: Fix brightness having no effect while pattern mode is active
      leds: st1202: Disable channel when brightness is set to zero
      leds: st1202: Validate LED reg property against channel count
      leds: st1202: Correct and extend hw_pattern documentation

Mike Marciniszyn (Meta) (1):
      leds: trigger: netdev: Extend speeds up to 100G

Ninad Naik (3):
      dt-bindings: leds: bcm6358: Convert to DT schema
      leds: bcm63138: Use %pe to print pinctrl error instead of %ld
      dt-bindings: leds: lacie,ns2-leds: Convert to DT schema

Samuel Holland (1):
      dt-bindings: leds: Document "gpio" trigger

Steve Dunnagan (1):
      leds: gpio: Clear error pointers for skipped LEDs

 .../devicetree/bindings/leds/adi,ltc3220.yaml      | 133 +++++
 .../bindings/leds/backlight/ti,tps65217.yaml       | 170 ++++++
 .../bindings/leds/backlight/tps65217-backlight.txt |  27 -
 .../bindings/leds/brcm,bcm6358-leds.yaml           |  96 ++++
 Documentation/devicetree/bindings/leds/common.yaml |  12 +
 .../devicetree/bindings/leds/lacie,ns2-leds.yaml   |  85 +++
 .../devicetree/bindings/leds/leds-bcm6358.txt      | 143 -----
 .../devicetree/bindings/leds/leds-ns2.txt          |  35 --
 .../bindings/leds/leds-pwm-multicolor.yaml         |   4 +
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 108 +++-
 .../devicetree/bindings/regulator/tps65217.txt     |  78 ---
 Documentation/leds/leds-st1202.rst                 |   9 +-
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  14 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/blink/leds-bcm63138.c                 |   4 +-
 drivers/leds/leds-gpio.c                           |  53 +-
 drivers/leds/leds-is31fl319x.c                     |  61 +--
 drivers/leds/leds-ltc3220.c                        | 586 +++++++++++++++++++++
 drivers/leds/leds-pca9532.c                        |  18 +-
 drivers/leds/leds-pca963x.c                        | 189 +++++--
 drivers/leds/leds-st1202.c                         | 102 ++--
 drivers/leds/rgb/leds-lp5860-core.c                |   3 +-
 drivers/leds/rgb/leds-lp5860-spi.c                 |  10 +-
 drivers/leds/rgb/leds-pwm-multicolor.c             |   2 +
 drivers/leds/trigger/ledtrig-netdev.c              |  46 +-
 include/linux/leds.h                               |   6 +
 27 files changed, 1565 insertions(+), 438 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt
 create mode 100644 Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6358.txt
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-ns2.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/tps65217.txt
 create mode 100644 drivers/leds/leds-ltc3220.c

-- 
Lee Jones

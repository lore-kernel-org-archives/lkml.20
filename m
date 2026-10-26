Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028016;
	b=YRYGSsFivfrhON10MXpyIxXs4YJX2I2NQpKjWwTw6kMSG+FCTFqmVYrYyL5lXD3QrBZU
	 BQnuvAeCEwE0Y17MThTuWDqodTynqz8pIzrEe/tmRGA0HWOIeXiZgwj0bqNLjm3gZN8BY
	 Q0teP7ONBuSxyBw2JsQ/9z0i0UNXEfitBUjZp+OAz+J1jUZoZoKKh8ERoThvHYT0+L32B
	 6blrkPqTa0PgJByQuT5zjkKRDv12kXVUpPyPkKtC51EIgQBKUf3pYHdV0tLB4eZh1/z/b
	 NBgBr1jtqCqgoN0czkbjzha0qUNApR21W0xP2kyHocoLj4l8BhKRpqPZCHX4f1Z+IkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028016;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=qh2WYceyg9MtlK+9B4gF9aA89lWm6+cWlBRyI1J8Fug=;
	b=pc72v7AIBmr5v0nmp0iJPgtWLzY/jj3hpTk5IzFoRQDMpavwgo/JPfYUnCHid+beieiB
	 fO6nmSXIpXl/eYDJbi3J2Lhuzpp8zNakm6l4D43ItdNQoX4yWyI9aDUg3KFfe/ICg4Q2w
	 yPob5fcgnAg88OOjXC7SWj8SMcXF3w1h7BIbRmGZxafSMdRel2ou5QowDg8cjYMHHUTmN
	 NGtFqJvhn/prLDPvJKLLrJBUsMEUALGm8DflMeMPe1aJhi4LywyWfzzo2uTLt6Yb8AnS9
	 9TbHJS64hAH2MyAprhaZf+sh5B/ky27oa2UnH90xNIcItlKCETh+czuxL/XKVdOraAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TgpMWqp6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AE0606A329
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TgpMWqp6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42491F01828;
	Mon, 26 Oct 2026 15:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793028015;
	bh=qh2WYceyg9MtlK+9B4gF9aA89lWm6+cWlBRyI1J8Fug=;
	h=Date:From:To:Cc:Subject;
	b=TgpMWqp6dekPMAPuEw6HP1Us0rH2CMv6fpwvHZRCJlq/FZRmZecPAXXm/I2RPvlfr
	 SyGwL890id7D6deaT3WIDrDVmuiGvhi5QeYl+Cp6XHOsEoz2t7QWDkBBvjn4/zbbrk
	 cPZZ/yobSdZ3gGEsY5dJqoRKuPJ6zgaMnys0Bo5Um6x0PbP250NnT+77gyvGmo36FD
	 92BCpMD4oPMHULcff6ju8YqR2uBOIwXRW3/mDLbz+9XbQTJFR8vCVgEwJv0N2BPXUV
	 0snfeVaexvzBGolh/SoxL2Iili9ysT/Zq5LvjJ6q4v5jKVccyNpDcdAiFEk10y2CuO
	 6gH/6ZiMxWPog==
Date: Mon, 26 Oct 2026 15:20:12 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Pavel Machek <pavel@ucw.cz>
Subject: [GIT PULL] LEDs for v7.4
Message-ID: <20261026152012.GD2195460@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Good afternoon Linus,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git leds-next-7.4

for you to fetch changes up to 59cf91cf87abb67a49b1bb7b9d3b06486abde8cf:

  dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema (2026-10-15 16:53:25 +0100)

----------------------------------------------------------------
LEDs for v7.4

- New Support & Features
  - Core: Add `led_trigger_notify_hw_control_changed()` to allow drivers to notify the
    core of autonomous hardware control transitions
  - Core: Add the `hw_offloaded()` trigger callback and `trigger_may_offload_to_hw` sysfs
    attribute to expose hardware-offloaded triggers
  - Netdev Trigger: Implement the `hw_offloaded()` callback to report hardware control
    state to the LED core
  - Analog Devices LTC3208: Add support for the LTC3208 7-channel multi-display I2C LED
    driver
  - ChromeOS EC: Implement the `hw_offloaded()` callback for the `chromeos-auto` trigger
  - CZ.NIC Turris Omnia: Implement the `hw_offloaded()` callback and declare `omnia-mcu`
    as a hardware control trigger
  - STMicroelectronics ST1202: Add hardware-accelerated blink support via `blink_set()`

- Improvements & Fixes
  - Class: Always hold the `led_access` mutex in `brightness_show()` to avoid exposing
    transient registration states
  - Class: Deactivate active hardware control triggers when writing to the `brightness`
    sysfs attribute
  - Core: Enforce strict validation in `led_trigger_is_hw_controlled()` and warn on legacy
    fallback paths
  - Flash Class: Initialize the fault variable in `flash_fault_show()` to prevent
    undefined behavior when callbacks perform bitwise ORs
  - Kinetic KTD2692: Pass the driver context directly to `regulator_disable_action()` to
    prevent a NULL pointer dereference during error unwinding
  - Maxim MAX77705: Use `fwnode_for_each_child_node_scoped()` in `max77705_add_led()` to
    prevent child node reference leaks on error paths
  - NXP PCA9532: Check the return value of `i2c_smbus_read_byte_data()` in
    `pca9532_getled()` to avoid integer underflow on read errors
  - Qualcomm WLED: Fix a NULL pointer dereference in `wled_remove()` by setting platform
    driver data in `wled_probe()`
  - Qualcomm WLED: Fix the WLED3 brightness register stride to prevent consecutive string
    writes from overlapping
  - Qualcomm WLED: Read back the hardware-programmed brightness at probe, expose it via
    `get_brightness()`, and prevent unbalanced OVP IRQ enabling
  - STMicroelectronics ST1202: Clear unused PWM pattern slots in `pattern_set()` and
    `blink_set()` to prevent unintended output when sharing the global sequencer
  - STMicroelectronics ST1202: Program and cap the channel current according to
    `max_brightness` across brightness, blink, and hardware pattern modes, and scale
    pattern brightness to the 12-bit PWM range
  - STMicroelectronics ST1202: Retain a reference to each child LED firmware node for the
    lifetime of the device
  - STMicroelectronics ST1202: Use only the blocking `brightness_set_blocking()` callback
    to avoid sleeping in atomic context during I2C transfers
  - TI LM3692x: Check the final register write in `lm3692x_leds_enable()` to prevent
    regulator/GPIO leaks and an inconsistent enabled state
  - TI LP8860: Fix a `device_node` reference leak in `lp8860_probe()` using
    `__free(device_node)`

- Cleanups & Refactoring
  - Core: Move `led_trigger_is_hw_controlled()` and `led_trigger_group` from `led-class.c`
    into `led-triggers.c`
  - Core: Replace conditional `set_bit()`/`clear_bit()` patterns with `assign_bit()` and
    `__assign_bit()`
  - Flash Class: Simplify `flash_fault_show()` using `sysfs_emit_at()` and omit the
    trailing space
  - Maintainers: Add Griffin Kroah-Hartman as an LED subsystem reviewer
  - Intel SS4200: Fix a spelling typo in a comment
  - ISSI IS31FL32xx: Convert DT-specific parsing helpers to generic device and fwnode
    property APIs
  - NXP PCA955x: Drop redundant intermediate platform data and allocate the LED array
    using a flexible array member
  - Qualcomm LPG: Convert LED and channel parsing to fwnode APIs and avoid leaving
    `default_trigger` uninitialized
  - Skyworks AAT1290: Use `ARRAY_SIZE()` when allocating `mm_current_scale` to match the
    target pointer type for type-aware allocators
  - STMicroelectronics ST1202: Introduce a `st1202_iled_max()` helper to unify channel
    current ceiling calculations
  - STMicroelectronics ST1202: Standardize variable and macro naming, fix helper spelling,
    and use `u8` consistently instead of `uint8_t`
  - Syscon: Convert from OF-specific property helpers to the generic device property and
    fwnode APIs

- Device Tree Binding Updates
  - Core: Allow PHY RX triggers (`phy[0-9]+rx`) in `linux,default-trigger`
  - Core: Standardize example indentation across multiple LED and backlight binding
    schemas
  - Analog Devices LTC3208: Document the LTC3208 multi-display LED driver
  - LaCie netxbig: Convert LED bindings to DT schema
  - Motorola CPCAP: Convert LED bindings to DT schemaLEDs for v7.4

- New Support & Features
  - Core: Add `led_trigger_notify_hw_control_changed()` to allow drivers to notify the
    core of autonomous hardware control transitions
  - Core: Add the `hw_offloaded()` trigger callback and `trigger_may_offload_to_hw` sysfs
    attribute to expose hardware-offloaded triggers
  - Netdev Trigger: Implement the `hw_offloaded()` callback to report hardware control
    state to the LED core
  - Analog Devices LTC3208: Add support for the LTC3208 7-channel multi-display I2C LED
    driver
  - ChromeOS EC: Implement the `hw_offloaded()` callback for the `chromeos-auto` trigger
  - CZ.NIC Turris Omnia: Implement the `hw_offloaded()` callback and declare `omnia-mcu`
    as a hardware control trigger
  - STMicroelectronics ST1202: Add hardware-accelerated blink support via `blink_set()`

- Improvements & Fixes
  - Class: Always hold the `led_access` mutex in `brightness_show()` to avoid exposing
    transient registration states
  - Class: Deactivate active hardware control triggers when writing to the `brightness`
    sysfs attribute
  - Core: Enforce strict validation in `led_trigger_is_hw_controlled()` and warn on legacy
    fallback paths
  - Flash Class: Initialize the fault variable in `flash_fault_show()` to prevent
    undefined behavior when callbacks perform bitwise ORs
  - Kinetic KTD2692: Pass the driver context directly to `regulator_disable_action()` to
    prevent a NULL pointer dereference during error unwinding
  - Maxim MAX77705: Use `fwnode_for_each_child_node_scoped()` in `max77705_add_led()` to
    prevent child node reference leaks on error paths
  - NXP PCA9532: Check the return value of `i2c_smbus_read_byte_data()` in
    `pca9532_getled()` to avoid integer underflow on read errors
  - Qualcomm WLED: Fix a NULL pointer dereference in `wled_remove()` by setting platform
    driver data in `wled_probe()`
  - Qualcomm WLED: Fix the WLED3 brightness register stride to prevent consecutive string
    writes from overlapping
  - Qualcomm WLED: Read back the hardware-programmed brightness at probe, expose it via
    `get_brightness()`, and prevent unbalanced OVP IRQ enabling
  - STMicroelectronics ST1202: Clear unused PWM pattern slots in `pattern_set()` and
    `blink_set()` to prevent unintended output when sharing the global sequencer
  - STMicroelectronics ST1202: Program and cap the channel current according to
    `max_brightness` across brightness, blink, and hardware pattern modes, and scale
    pattern brightness to the 12-bit PWM range
  - STMicroelectronics ST1202: Retain a reference to each child LED firmware node for the
    lifetime of the device
  - STMicroelectronics ST1202: Use only the blocking `brightness_set_blocking()` callback
    to avoid sleeping in atomic context during I2C transfers
  - TI LM3692x: Check the final register write in `lm3692x_leds_enable()` to prevent
    regulator/GPIO leaks and an inconsistent enabled state
  - TI LP8860: Fix a `device_node` reference leak in `lp8860_probe()` using
    `__free(device_node)`

- Cleanups & Refactoring
  - Core: Move `led_trigger_is_hw_controlled()` and `led_trigger_group` from `led-class.c`
    into `led-triggers.c`
  - Core: Replace conditional `set_bit()`/`clear_bit()` patterns with `assign_bit()` and
    `__assign_bit()`
  - Flash Class: Simplify `flash_fault_show()` using `sysfs_emit_at()` and omit the
    trailing space
  - Maintainers: Add Griffin Kroah-Hartman as an LED subsystem reviewer
  - Intel SS4200: Fix a spelling typo in a comment
  - ISSI IS31FL32xx: Convert DT-specific parsing helpers to generic device and fwnode
    property APIs
  - NXP PCA955x: Drop redundant intermediate platform data and allocate the LED array
    using a flexible array member
  - Qualcomm LPG: Convert LED and channel parsing to fwnode APIs and avoid leaving
    `default_trigger` uninitialized
  - Skyworks AAT1290: Use `ARRAY_SIZE()` when allocating `mm_current_scale` to match the
    target pointer type for type-aware allocators
  - STMicroelectronics ST1202: Introduce a `st1202_iled_max()` helper to unify channel
    current ceiling calculations
  - STMicroelectronics ST1202: Standardize variable and macro naming, fix helper spelling,
    and use `u8` consistently instead of `uint8_t`
  - Syscon: Convert from OF-specific property helpers to the generic device property and
    fwnode APIs

- Device Tree Binding Updates
  - Core: Allow PHY RX triggers (`phy[0-9]+rx`) in `linux,default-trigger`
  - Core: Standardize example indentation across multiple LED and backlight binding
    schemas
  - Analog Devices LTC3208: Document the LTC3208 multi-display LED driver
  - LaCie netxbig: Convert LED bindings to DT schema
  - Motorola CPCAP: Convert LED bindings to DT schema

----------------------------------------------------------------
Cong Nguyen (1):
      leds: lm3692x: Fix regulator/gpio leak and wrong enabled state on last write failure

David Heidelberg (4):
      backlight: qcom-wled: Fix NULL pointer dereference in wled_remove()
      backlight: qcom-wled: Fix WLED3 brightness register stride
      backlight: qcom-wled: Fix unbalanced OVP IRQ enable at probe
      backlight: qcom-wled: Read back the programmed brightness at probe

Dmitry Antipov (2):
      leds: flash: Prevent using uninitialized variable in flash_fault_show()
      leds: flash: Simplify flash_fault_show()

Griffin Kroah-Hartman (1):
      MAINTAINERS: Add myself as a LED SUBSYSTEM reviewer

Haibo Chen (1):
      leds: pca9532: Check i2c_smbus_read_byte_data() return value

Hemanth Selam (1):
      leds: ss4200: Fix typo "retrive" in comment

Jan Carlo Roleda (2):
      dt-bindings: leds: Document LTC3208 Multidisplay LED Driver
      leds: ltc3208: Add driver for LTC3208 Multidisplay LED Driver

Kees Cook (1):
      leds: aat1290: Allocate mm_current_scale with ARRAY_SIZE()

Krzysztof Kozlowski (1):
      dt-bindings: leds: Use consistent indentation in the example

Manuel Fombuena (14):
      leds: st1202: Add hardware-accelerated blink support
      leds: st1202: Correct the name of the prescaler conversion helper
      leds: st1202: Spell out the phase-shift configuration bit
      leds: st1202: Name pattern index variables consistently
      leds: st1202: Use u8 consistently for 8-bit values
      leds: st1202: Clear unused pattern slots in pattern_set()
      leds: st1202: Scale pattern brightness to the 12-bit PWM range
      leds: st1202: Program the channel current for hardware patterns
      leds: st1202: Take a reference on the LED firmware node
      leds: st1202: Do not set brightness from atomic context
      leds: st1202: Clear unused pattern slots in blink_set()
      leds: st1202: Honour max_brightness when blinking
      leds: st1202: Cap the channel current in st1202_led_set()
      leds: st1202: Give the channel current ceiling a single helper

Manush Prajwal (1):
      leds: max77705: Use fwnode_for_each_child_node_scoped() in max77705_add_led()

Miles Krause (1):
      leds: lp8860: Fix device_node leak in lp8860_probe()

Myeonghun Pak (1):
      leds: ktd2692: Pass context to regulator cleanup

Peng Fan (1):
      leds: Use assign_bit() where applicable

Rob Herring (Arm) (1):
      dt-bindings: leds: Allow PHY RX triggers

Rong Zhang (10):
      leds: class: Always protect brightness_show() with led_access
      leds: trigger: Move led_trigger_is_hw_controlled() to the right place
      leds: class: Remove hardware control trigger when writing brightness
      leds: trigger: Move led_trigger_group to the right place
      leds: trigger: Add hw_offloaded() callback and provide trigger_may_offload_to_hw attribute
      leds: cros_ec: Implement hw_offloaded() trigger callback
      leds: turris-omnia: Implement hw_offloaded() trigger callback and declare hw_control_trigger
      leds: trigger: netdev: Implement hw_offloaded() callback
      leds: trigger: Enforce strict checks in led_trigger_is_hw_controlled()
      leds: trigger: Add led_trigger_notify_hw_control_changed() interface

Rosen Penev (4):
      leds: syscon: Use device property API
      leds: is31fl32xx: Use fwnode/device property APIs
      leds: rgb: qcom-lpg: Use fwnode APIs for LED parsing
      leds: pca955x: Drop platform data and allocate LEDs with the device

Svyatoslav Ryhel (1):
      dt-bindings: leds: leds-cpcap: Convert to DT schema

Udaya Kiran Challa (1):
      dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema

 Documentation/ABI/testing/sysfs-class-led          |  28 ++-
 .../ABI/testing/sysfs-class-led-trigger-netdev     |   3 +
 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 183 ++++++++++++++++
 .../bindings/leds/backlight/lm3630a-backlight.yaml |  52 ++---
 .../bindings/leds/backlight/lp855x-backlight.yaml  |  18 +-
 .../bindings/leds/backlight/qcom-wled.yaml         |   2 +-
 Documentation/devicetree/bindings/leds/common.yaml |   2 +-
 .../bindings/leds/lacie,netxbig-leds.yaml          | 136 ++++++++++++
 .../devicetree/bindings/leds/leds-consumer.yaml    |  14 +-
 .../devicetree/bindings/leds/leds-cpcap.txt        |  29 ---
 .../devicetree/bindings/leds/leds-lp50xx.yaml      |  12 +-
 .../devicetree/bindings/leds/leds-lp5860.yaml      |  12 +-
 .../devicetree/bindings/leds/leds-netxbig.txt      |  92 --------
 .../bindings/leds/motorola,cpcap-leds.yaml         |  42 ++++
 .../devicetree/bindings/leds/nxp,pca963x.yaml      |  24 +--
 Documentation/leds/leds-class.rst                  |  72 +++++++
 Documentation/leds/leds-st1202.rst                 |   5 +
 MAINTAINERS                                        |   9 +
 drivers/leds/Kconfig                               |  12 ++
 drivers/leds/Makefile                              |   1 +
 drivers/leds/flash/leds-aat1290.c                  |   5 +-
 drivers/leds/flash/leds-ktd2692.c                  |  10 +-
 drivers/leds/led-class-flash.c                     |  21 +-
 drivers/leds/led-class.c                           |  46 ++--
 drivers/leds/led-core.c                            |   5 +-
 drivers/leds/led-triggers.c                        | 177 ++++++++++++++-
 drivers/leds/leds-cros_ec.c                        |   6 +
 drivers/leds/leds-is31fl32xx.c                     |  20 +-
 drivers/leds/leds-lm3692x.c                        |   4 +-
 drivers/leds/leds-lp8860.c                         |   5 +-
 drivers/leds/leds-ltc3208.c                        | 234 ++++++++++++++++++++
 drivers/leds/leds-max77705.c                       |   3 +-
 drivers/leds/leds-pca9532.c                        |   9 +-
 drivers/leds/leds-pca955x.c                        |  94 +++-----
 drivers/leds/leds-pca963x.c                        |   5 +-
 drivers/leds/leds-ss4200.c                         |   2 +-
 drivers/leds/leds-st1202.c                         | 240 ++++++++++++++++-----
 drivers/leds/leds-syscon.c                         |   9 +-
 drivers/leds/leds-turris-omnia.c                   |   7 +
 drivers/leds/leds.h                                |   8 +-
 drivers/leds/rgb/leds-qcom-lpg.c                   |  38 ++--
 drivers/leds/trigger/Kconfig                       |  10 +
 drivers/leds/trigger/ledtrig-netdev.c              |  13 +-
 drivers/video/backlight/qcom-wled.c                |  99 +++++++--
 include/linux/leds.h                               |  24 +++
 45 files changed, 1406 insertions(+), 436 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
 create mode 100644 drivers/leds/leds-ltc3208.c

-- 
Lee Jones

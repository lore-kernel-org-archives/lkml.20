Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792614357;
	b=5hfx1MwDaUyEF/pm3MmrcRIpkE8OXoDOgwI3VY1wGFBTANJOqnCwm/QMOuxQsDEJE5wA
	 dQMLAkx5ocKf9HgT0YlBeKCDwppDq/zwg24ZvpIEATLgvZHfyCKsokaBOe/3h9E+Z95ci
	 jLQz9uiY/18vqTkLpRMEDvz9nwq4qlZQ/11HQobR6nDAgorgvCS13tyQ32rJmIobJMnYp
	 mjeCBuJ03Fo99eneVmDRDQprS4iZ6uiIPTBagqt77RXb7v1LMVIck57Z7mASloGIaSO/b
	 9CkWdZDp/yePECOCMw6Dy0LjzI2LOyUPCfuF1QC02D+bpIKZAXtZ6QHAh5yIsoyAqtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614357;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JyJ+zOEbxtHOoZRV7HedGWMubFWmkO+FqgkNDniEmG4=;
	b=jEJk+WBkr4GEfo1dwZ6dZoXi30cGg72W6Ko7JQXmZdWz5JY2EoaxkiqrzNpG55Mh+yPn
	 WAwfazbIJAE4LmRJmzYERD2BPzuf2KJD+hHqLmkBCyh6jWXCNTIZABFvZkVFvXzE4PYy+
	 EViRXH/Brnph+Mdqv6z9GbnJXIwYF7Dp+Q7GpQJ+db56+LvE4igrI+j5+fE2gkdsCRo1A
	 4owkXlViGiXyuGYGOjmXMuh7IZI+pt24jpQ1mrncVQ8lmOoX0M/nCaJciQdngi39cr17b
	 l0+vM2ED+9UEJbxscycVYURtPjnfjV6DD+9AA2pjBaLzDO2RCahk6z/An+AxOpIqsYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nwhLwsBN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E131606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nwhLwsBN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE5B1F000C1;
	Wed, 21 Oct 2026 20:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792614356;
	bh=JyJ+zOEbxtHOoZRV7HedGWMubFWmkO+FqgkNDniEmG4=;
	h=Date:From:To:cc:Subject;
	b=nwhLwsBNpdUpANtwyjpkK286r5MAIN5CY9HKV6I70vaUfS8xpLysJfsXQkd7hV+Vm
	 naiZsFjtxuy9k8VxTfNk3nbi9tHEfNEuAw+UYhNJDv/3/lRWG1owksF4uesBMTgQFr
	 tbv+H0k6Rk8sgznwtaV8KXlNgDYZzzJnVkt90xbu03Y5CHAbVF85cmMnW8pGrdRDfU
	 s3eSuqLdUrehKUUyWaMvig6VlOwcUrjVI36R2vzz3vUkFO7P4tAmFxIVshr26xW7dh
	 o6Vp5SEUysxdTgMeZ+JB8bVAXqS7s9Xtfn3YcRUxbINAXwejSvpV71KYrLIOg1JPnl
	 cx5V7JBKv/fwg==
Date: Wed, 21 Oct 2026 22:25:54 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] HID for 7.4 merge window
Message-ID: <so055932-q645-4261-noq6-12214q6n09n9@xreary.bet>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

Linus,

please pull from

  git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-li=
nus-2026102101

to receive 7.4 merge window queue for HID subsystem. Namely:

=3D=3D=3D=3D=3D
[CORE]
 - OOB fix in s32ton() (Alan Stern)
 - switch to named initializers for acpi_device_id (Pawel Zalewski)
 - UAF fix in hiddev (Yousef Alhouseen)

[AMD_SFH]
 - support for newer AMD SoCs (Basavaraj Natikar)
 - sysfs attributes of operating-mode telemetry (Basavaraj Natikar)

[APPLE]
 - power management fix for Apple Touch Bar (Andre Eikmeyer)
 - fix for trackpad hanling on T2 Macs (Aditya Garg)

[ASUS]
 - power management fix for ROG Ally (Deni Benato)
 - asus_work() hardening (Denis Benato)

[INTEL-THC]
 - conversion of intel-thc-hid to hid_safe_input_report() (Even Xu)

[NINTENDO]
 - support for Switch 2 controller (Vicki Pfau)
 - support for PDP Afterglow controller (Aiman Najjar)

[ROCCAT]
  - fixes for proper handling of short reports (Jiale Yao)

[WACOM]
 - UAF fixes (Lee Jones)

- other assorted fixes, device ID additions and code cleanups
=3D=3D=3D=3D=3D

Thanks!

----------------------------------------------------------------
Aditya Garg (2):
      HID: appletb-kbd: support layer switching on Fn double press
      HID: apple: ignore the trackpad on T2 Macs

Ahmed Yaseen (1):
      HID: usbhid: skip interrupt IN polling for devices with no input repo=
rts

Aiman Najjar (1):
      HID: nintendo: add support for PDP Afterglow controller

Alan Stern (1):
      HID: core: Fix out-of-bounds left shift by 32 in s32ton()

Andre Eikmeyer (1):
      HID: apple-touchbar: avoid nested runtime PM in PM callbacks

Basavaraj Natikar (7):
      HID: amd_sfh: Add support for newer AMD SoCs
      HID: amd_sfh: Add HPD support for new AMD SOC
      HID: amd_sfh: Add device mode support for latest AMD SOC.
      HID: amd_sfh: Move sysfs attributes to a separate file
      HID: amd_sfh: Add operating-mode telemetry sysfs attributes
      HID: amd_sfh: Remove unsupported motion-state field from acceleromete=
r report
      HID: amd_sfh: Use report type from request node

DemonPlayer (1):
      HID: apple: Add GANSS GS3104T PRO to the non-Apple keyboard list

Denis Benato (3):
      HID: asus: document and harden the worker teardown
      HID: asus: reinitialize the device after exiting a sleep state
      HID: asus: add support for xgm led

Derek J. Clark (10):
      HID: hid-lenovo-go-s: Return ret instead of 0 in mcu_property_out()
      HID: hid-lenovo-go-s: Bound stale reply window before reusing send_cm=
d_complete
      HID: hid-lenovo-go-s: Prevent deadlock if device removed during setup
      HID: hid-lenovo-go-s: Use pm_ptr for reset_resume callback
      HID: hid-lenovo-go-s: Add kobject_uevent notify during reset-resume
      HID: hid-lenovo-go-s: Add suspend function and gate access under bool=
=2E
      HID: hid-lenovo-go-s: Move attribute init to after device query
      HID: hid-lenovo-go-s: Reorganize and rename hid_gos_cfg
      HID: hid-lenovo-go-s: Move static led_classdev_mc to drvdata struct
      HID: hid-lenovo-go-s: Use devm_kzalloc for drvdata

Dmitriy Geels (1):
      HID: logitech-hidpp: cancel reset_hi_res_work on probe failure

Dmitry Antipov (1):
      HID: roccat: fix device access in roccat_release()

Even Xu (2):
      HID: Intel-thc-hid: Intel-quicki2c: Use hid_safe_input_report()
      HID: Intel-thc-hid: Intel-quickspi: Use hid_safe_input_report()

Gabor Tanz (1):
      HID: quirks: Always poll the Anne Pro 2 with product ID a292

Helge Bahmann (1):
      HID: amd_sfh: Add DMI quirk and module param to disable interrupts

Jiale Yao (16):
      HID: roccat: isku: reject short button reports
      HID: roccat: koneplus: reject short button reports
      HID: roccat: konepure: reject short button reports
      HID: roccat: kovaplus: reject short button reports
      HID: roccat: pyra: reject short button reports
      HID: roccat: ryos: reject short special reports
      HID: roccat: savu: reject short special reports
      HID: cougar: reject short special-key reports
      HID: cp2112: validate response report lengths
      HID: elo: reject short touchscreen reports
      HID: logitech-dj: validate unnumbered keyboard reports
      HID: mcp2200: validate READ_ALL response length
      HID: mcp2221: validate response report length
      HID: prodikeys: validate fixed-format MIDI reports
      HID: pxrc: reject short input reports
      HID: zydacron: validate key report length

Jiri Kosina (14):
      HID: asus: add keyboard dock of the ASUS Transformer Book T302CHI dev=
ice ID
      HID: nintendo: introduce dependency in USB_HID

Justin Yeh (1):
      HID: i2c-hid: Unfollow the panel on shutdown

Lee Jones (5):
      HID: wacom: Use hdev->product in wacom_setup_touch_input_capabilities
      HID: wacom: Advertise SW_MUTE_DEVICE capability prior to registration
      HID: wacom: Fix Use-After-Free in wacom_intuos_pad
      HID: wacom: Fix Use-After-Free in wacom_bamboo_pad
      HID: wacom: Redesign shared sibling data lifecycle

Liang Haowen (1):
      HID: add ALWAYS_POLL quirk for YJX-CHIP EWEADN wireless receivers

Matheus Alves de Almeida (1):
      HID: wacom: fix wacom_intuos_irq NULL pen_input deref

Myeonghun Pak (1):
      HID: mcp2221: always initialize and cancel init_work

Nehuen Lian Bova (1):
      HID: magicmouse: fix null pointer dereference in magicmouse_event()

Nikolas Koesling (1):
      HID: pulsar: add driver for Pulsar gaming mice

Oleg Keri (1):
      HID: lenovo: suppress phantom radio control input on Yoga Slim 7x Gen=
 11

Panz Dev (1):
      HID: asus: do not send keyboard init reports to touchpads

Pawel Zalewski (3):
      HID: hid-google-hammer: use named initializers for acpi_device_id
      HID: i2c-hid: use named initializers for acpi_device_id
      HID: surface-hid: use named initializers for acpi_device_id

Ping Cheng (2):
      HID: wacom: Write shared touch initial status only once
      HID: wacom: Setup SW_MUTE_DEVICE according to the order of input regi=
stration

Rafael Passos (3):
      HID: wiimote: turn on the LEDs indicating the controller id
      HID: wiimote: replace spinlock pairs with scoped_guard
      HID: wiimote: led_probe with scoped cleanup

Tjark Effenberger (1):
      HID: Kysona: Add support for Kysona M600V2 variant

Uwe Kleine-K=F6nig (The Capable Hub) (1):
      HID: wacom: #include <linux/device-id/hid.h> instead of <linux/mod_de=
vicetable.h>

Vicki Pfau (4):
      HID: nintendo: Add preliminary Switch 2 controller driver
      HID: nintendo: Add rumble support for Switch 2 controllers
      HID: nintendo: Add unified report format support
      HID: nintendo: Patch NYXI Hyperion 3 descriptor

Yousef Alhouseen (2):
      HID: hiddev: keep state alive through disconnect unlock
      HID: hiddev: set report-init policy before device registration

 Documentation/ABI/testing/sysfs-driver-amd-sfh     |   60 +
 MAINTAINERS                                        |    8 +
 drivers/hid/Kconfig                                |   52 +-
 drivers/hid/Makefile                               |    3 +-
 drivers/hid/amd-sfh-hid/Makefile                   |    1 +
 drivers/hid/amd-sfh-hid/amd_sfh_client.c           |    4 +-
 drivers/hid/amd-sfh-hid/amd_sfh_common.h           |    2 +
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c             |   65 +-
 drivers/hid/amd-sfh-hid/amd_sfh_sysfs.c            |  134 ++
 drivers/hid/amd-sfh-hid/amd_sfh_sysfs.h            |   19 +
 .../amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h  |    2 -
 .../hid_descriptor/amd_sfh_hid_report_desc.h       |    7 -
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c      |   13 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c |   37 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h |    7 +
 drivers/hid/hid-apple.c                            |   30 +-
 drivers/hid/hid-appletb-kbd.c                      |   91 +-
 drivers/hid/hid-asus.c                             |  148 +-
 drivers/hid/hid-core.c                             |    4 +-
 drivers/hid/hid-cougar.c                           |    3 +
 drivers/hid/hid-cp2112.c                           |    9 +-
 drivers/hid/hid-elo.c                              |    3 +
 drivers/hid/hid-google-hammer.c                    |    2 +-
 drivers/hid/hid-ids.h                              |   22 +
 drivers/hid/hid-kysona.c                           |  292 ----
 drivers/hid/hid-lenovo-go-s.c                      |  655 +++++---
 drivers/hid/hid-lenovo.c                           |   14 +
 drivers/hid/hid-logitech-dj.c                      |    3 +
 drivers/hid/hid-logitech-hidpp.c                   |    1 +
 drivers/hid/hid-magicmouse.c                       |    4 +
 drivers/hid/hid-mcp2200.c                          |    5 +
 drivers/hid/hid-mcp2221.c                          |   10 +-
 drivers/hid/hid-nintendo-switch2-usb.c             |  493 ++++++
 drivers/hid/hid-nintendo.c                         | 1714 ++++++++++++++++=
+++-
 drivers/hid/hid-nintendo.h                         |   73 +
 drivers/hid/hid-prodikeys.c                        |    7 +-
 drivers/hid/hid-pulsar.c                           |  767 +++++++++
 drivers/hid/hid-pxrc.c                             |    3 +
 drivers/hid/hid-quirks.c                           |    3 +
 drivers/hid/hid-roccat-isku.c                      |    3 +
 drivers/hid/hid-roccat-koneplus.c                  |    3 +
 drivers/hid/hid-roccat-konepure.c                  |    3 +
 drivers/hid/hid-roccat-kovaplus.c                  |    3 +
 drivers/hid/hid-roccat-pyra.c                      |    3 +
 drivers/hid/hid-roccat-ryos.c                      |    3 +
 drivers/hid/hid-roccat-savu.c                      |    3 +
 drivers/hid/hid-roccat.c                           |   13 +-
 drivers/hid/hid-wiimote-core.c                     |  277 ++--
 drivers/hid/hid-wiimote-debug.c                    |   67 +-
 drivers/hid/hid-wiimote-modules.c                  |   22 +-
 drivers/hid/hid-wiimote.h                          |    1 +
 drivers/hid/hid-zydacron.c                         |    3 +
 drivers/hid/i2c-hid/i2c-hid-acpi.c                 |    8 +-
 drivers/hid/i2c-hid/i2c-hid-core.c                 |   11 +-
 .../intel-thc-hid/intel-quicki2c/pci-quicki2c.c    |    4 +-
 .../intel-thc-hid/intel-quicki2c/quicki2c-dev.h    |    2 +
 .../intel-thc-hid/intel-quicki2c/quicki2c-hid.c    |    6 +-
 .../intel-thc-hid/intel-quicki2c/quicki2c-hid.h    |    2 +-
 .../intel-thc-hid/intel-quickspi/pci-quickspi.c    |    2 +
 .../intel-thc-hid/intel-quickspi/quickspi-dev.h    |    2 +
 .../intel-thc-hid/intel-quickspi/quickspi-hid.c    |    6 +-
 .../intel-thc-hid/intel-quickspi/quickspi-hid.h    |    2 +-
 .../intel-quickspi/quickspi-protocol.c             |    2 +-
 drivers/hid/surface-hid/surface_kbd.c              |    4 +-
 drivers/hid/usbhid/hid-core.c                      |    9 +-
 drivers/hid/usbhid/hiddev.c                        |   45 +-
 drivers/hid/wacom.h                                |    2 +-
 drivers/hid/wacom_sys.c                            |  198 ++-
 drivers/hid/wacom_wac.c                            |  113 +-
 drivers/hid/wacom_wac.h                            |    6 +-
 include/linux/hiddev.h                             |    2 +
 71 files changed, 4621 insertions(+), 979 deletions(-)
 create mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_sysfs.c
 create mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_sysfs.h
 delete mode 100644 drivers/hid/hid-kysona.c
 create mode 100644 drivers/hid/hid-nintendo-switch2-usb.c
 create mode 100644 drivers/hid/hid-nintendo.h
 create mode 100644 drivers/hid/hid-pulsar.c

--=20
Jiri Kosina
SUSE Labs


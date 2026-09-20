Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079A6320A34
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789879394; cv=none; b=T9dQ9ZlQqWJS2HkPMtOs9VuZsmerYfIZvEirPUGYdbFVWmqkZa0TwVzXRAlIW8hRHi3zUritBex9ZOEZmnKXumqaf2Mtyy/hVg3lmQqIpddia0a1197/aevnySgf2wf+s8LXn1oUZ2uaDivt7qDodSc6k+fjg809TFMqxey4YdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789879394; c=relaxed/simple;
	bh=OKybeNTHbCjX+lijFcusRULBKEtqJkRC/OitUXYDXP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W1Ygd+ePAYi2DHGP3c4O1MNQEhcN5wf6ZV3Z4S83ElfTnXqJmZqq+/Phv/gMcrcgAsXikqCorQtjhualQobqtriTOiM8SFYoRY3lDRUuyd6DPBAX20kiM82MERkEMia+X99l9RhUlddJ1N6pHbBa08Q1SwTzt6PDzv77/okHARA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOwp1URq; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOwp1URq"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fbef5018so25404015ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789879392; x=1790484192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SiwL5PjakOjLHsEDEMqA9qmAfeJeklyHfxE5nzDgN9c=;
        b=UOwp1URqw6UIOKySrfsVFpCdrZjyRj+FMay5bzL1qi6omDmz//ldpw7FfkFVBdDFD5
         yioVg40liVoHR4NHZWsKJ96KXIyLMdNS74jIXydbHGu7ZnsfAGENDT5cK8c5lFgc62Tk
         7rzV9xqy6zKVuA5jaiO6OaJT7oNDymBiL/To7FMfXakYwBudiwSK79QOszeSyvlGIp96
         2F8Xo3HVj9FsXeuP3oQaOARxk8PhhvwHgeVSRFwN4+PptfJ+nMbj0JuCeP8f4ZsglxC8
         /+O3NfGVCHd2zYaSoLMhcpP3cYjlReXuUi8XRR4DRxe1LQAu22KL5jkUuBFsYceYXL2b
         tasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789879392; x=1790484192;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SiwL5PjakOjLHsEDEMqA9qmAfeJeklyHfxE5nzDgN9c=;
        b=fpCcvqzOZbpyNaCpDsqHZFi43vO/B2ZoCq2JaReq2wmMcZ/8xBpLxg28QoDUItr0GZ
         lBsOVV9g6nLu3Eosbl0o+gWFLzwBGi9oq0XS6qHNQfPNnibBHWT2eWacvEAKeW3Fo7LX
         AyiySujnGFubhD1E1vmjD2h4BH7dfN/S/5rJJVoXRl/j3N8dw3QhCGzYhcnn/nb3FGpg
         b64NH4RMUey88rZDqHZWYS2lQ+Foq4MwBJK4fOxyy4l/SPgIPfTeYi0futBQud0yR3wN
         o3sr38FsRq/j0CjYcRt0WDUQYvSOn1bzMDZEBfeYt/3nN5o9+bfK4I6e6nUIQ31VTVwq
         o6LQ==
X-Gm-Message-State: AFuF++mL/NXwp37lNhAxoVsR2Tm36WU0SspT9+xOPQEgxUokJMuTsLQg
	XYUXNzBwHQcg/RXkUhdBsTV/RtmI0gHr9q69IrtBm03nPc4+eaIwC6td
X-Gm-Gg: AYBFou3BVukWIABH9nlpYelxb3W6TpnBrLPHcuxMm+BwA1c6BUYxJroGO2EEVcjQ9ZS
	tufdH5xfj+E79iRJjJAkYWX76Xp9GGdb8mT7921YEKESZQCySP6OGmS9vUilwd0qlvI26ATCch/
	xxOlHVuBGcrL29EGC29mhK9HNc+vWsx/xDWJQkFh3EJOMbCdpOP2o+mgcB6T8u3ma4WLE7fjRM7
	Lku2p+/qlvKmFPmNFUL8j3h5d5TAjzTOLjGA33OaQAkYM5aDTmWvD5mAx2nPrHSAOmu+1gtoC1/
	p0CsdtGlnOayYy06+6Tu+U6HdVWvWio2RmS5WZN2viv8mUediV8SPc1l60UiRX6zB1HR1SOqPtj
	VkSVO5HhbqWmq9/pKr3k8nJSv+diYGFNuP15+c3obGwD3oYnz0RJDz3Y638MDmvr+JIw3smwurc
	SQFdXMtotiiksZpjIfxUcO4val5rM+7tnXa4EXhCFfnFA1UiLGfajxW/my+doNMJ5VR7zFZCkHJ
	QpL9zX8MLbe6XbKmQQmEoPWPjqQUBG40MIb0SdS
X-Received: by 2002:a17:902:ebcb:b0:2dd:c054:1981 with SMTP id d9443c01a7336-2ddc0541cd8mr60732265ad.38.1789879392213;
        Sat, 19 Sep 2026 21:43:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7836:19f2:c781:88b2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c33142a37sm10350789eec.15.2026.09.19.21.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:43:11 -0700 (PDT)
Date: Sat, 19 Sep 2026 21:43:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v7.3-rc3
Message-ID: <aq9kRuJbKqBe6-_z@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v7.3-rc3

to receive updates for the input subsystem. You will get:

- Fixes for evdev and input compat handling to zero-initialize on-stack
  absinfo and force-feedback effect structures before partial or compat
  copies from userspace, preventing kernel stack memory disclosure

- Fixes for the Synaptics RMI4 driver to prevent an out-of-bounds read
  when writing multi-chunk blocks over SMBus and to avoid a NULL pointer
  dereference during suspend/resume when the RMI device is unbound

- Fixes for the soc_button_array driver to propagate -EPROBE_DEFER on
  non-Bay Trail/Cherry Trail platforms (fixing broken power and volume
  buttons on the Microsoft Surface Pro 11) and to validate the ACPI
  package element count before dereferencing

- A fix for the adp5588-keys driver to cache the initial GPIO hardware
  state before registering the gpiochip so pre-configured pin states are
  not clobbered by GPIO hogs during registration

- A fix for the cyttsp5 touchscreen driver to clamp the device-supplied
  HID report size before copying into the response buffer, preventing a
  buffer overflow

- A fix for the HP SDC serio driver to use timer_shutdown_sync() on
  module exit so the periodic kicker timer cannot rearm itself during
  teardown

- A fix for the eeti_ts touchscreen driver to export its OF module alias
  so the module autoloads on Device Tree platforms

- Updates to the xpad joystick driver adding support for the Victrix Pro
  BFG controller and Azeron devices, and fixing the device type
  classification for the PDP Marvel Xbox 360 controller

- Quirks for the i8042 and atkbd drivers to keep the built-in keyboards
  functional on the Acer Aspire Go 15 AG15-42P and Xiaomi Redmi Book Pro
  16 2026

- A quirk for the Synaptics PS/2 touchpad driver disabling SMBus
  InterTouch on the Lenovo ThinkPad T440p (board ID 2722) so the
  touchpad and TrackPoint respond immediately at boot

- Other minor updates and documentation fixes, including reading the
  "ti,poll-period" property as u32 in tsc2007, adding the mt6572
  compatible to the MediaTek keypad Device Tree binding, fixing an
  attribute name typo in the trackpoint sysfs ABI documentation, and
  documenting that no new LED codes should be added to the input
  subsystem.

Note that there will be a trivial merge conflict in
drivers/input/misc/soc_button_array.c between mainline commit
bde4905c102f ("Input: soc_button_array - select CONFIG_GPIOLIB_LEGACY"),
which removed #include <linux/gpio.h>, and commit ed22ad5fdbdb ("Input:
soc_button_array - fix MS Surface Pro 11 probe failure"), which added
#include <linux/platform_data/x86/soc.h> on the following line. The
proper resolution is to drop <linux/gpio.h> and keep
<linux/platform_data/x86/soc.h>.

Changelog:
---------

Alexei Turtanov (1):
      Input: atkbd - skip deactivate for Xiaomi Redmi Book Pro 16 2026

Alvin Šipraga (1):
      Input: adp5588-keys - cache GPIO state before registering the gpiochip

Chris Sommers (1):
      Input: i8042 - add quirk for Acer Aspire Go 15 AG15-42P

Dmitry Torokhov (3):
      Input: rmi_smbus - fix out-of-bounds read in rmi_smb_write_block()
      Input: synaptics-rmi4 - fix GPF in suspend and resume when unbound
      Input: document that no new LED codes should be added

Erich Sartison (1):
      Input: xpad - add support for Victrix Pro BFG Controller

Hans de Goede (2):
      Input: soc_button_array - fix MS Surface Pro 11 probe failure
      Input: soc_button_array - check btns_desc->package.count

Iván Ezequiel Rodriguez (2):
      Input: evdev - zero absinfo before partial copy in EVIOCSABS
      Input: zero ff_effect before compat copy in input_ff_effect_from_user

Jeremy Nyberg (1):
      Input: xpad - fix PDP Marvel Xbox 360 controller

Karl Mehltretter (1):
      Input: trackpoint - fix the inertia attribute name in the ABI document

Linkai Gong (1):
      Input: cyttsp5 - clamp the HID report size before memcpy

Raphaël Larocque (1):
      Input: synaptics - disable InterTouch on ThinkPad T440p (board id 2722)

Rob Herring (Arm) (1):
      Input: tsc2007 - read "ti,poll-period" as u32

Roberts Kursitis (1):
      Input: xpad - add support for Azeron devices

Roman Vivchar (1):
      dt-bindings: input: mediatek,mt6779-keypad: add mt6572

Runyu Xiao (1):
      Input: hp_sdc - shut down kicker timer on module exit

hpp.iscas (1):
      Input: eeti_ts - publish the OF module alias

Diffstat:
--------

 .../ABI/testing/sysfs-devices-platform-trackpoint        |  2 +-
 .../bindings/input/mediatek,mt6779-keypad.yaml           |  1 +
 drivers/input/evdev.c                                    |  2 ++
 drivers/input/input-compat.c                             |  2 ++
 drivers/input/joystick/xpad.c                            | 10 +++++++++-
 drivers/input/keyboard/adp5588-keys.c                    | 12 ++++++------
 drivers/input/keyboard/atkbd.c                           |  8 ++++++++
 drivers/input/misc/soc_button_array.c                    | 16 ++++++++++++----
 drivers/input/mouse/synaptics.c                          |  8 ++++++++
 drivers/input/rmi4/rmi_driver.c                          | 13 +++++++++++++
 drivers/input/rmi4/rmi_smbus.c                           | 10 +++++-----
 drivers/input/serio/hp_sdc.c                             |  2 +-
 drivers/input/serio/i8042-acpipnpio.h                    |  7 +++++++
 drivers/input/touchscreen/cyttsp5.c                      |  1 +
 drivers/input/touchscreen/eeti_ts.c                      |  1 +
 drivers/input/touchscreen/tsc2007_core.c                 |  5 ++---
 include/uapi/linux/input-event-codes.h                   |  6 ++++++
 17 files changed, 85 insertions(+), 21 deletions(-)

Thanks.

-- 
Dmitry

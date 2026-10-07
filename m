Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C674C46AA7A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364912; cv=none; b=ISLVA58/SRGSf8m+hmDzlXEjND3j+LwdT5znQWfko256dY4HNL1kao6lCCoWym1oqZMknDGd3AyZpIyWWWdV4NPgTEABHvlTZjkb5S7bT6r+eFiMjlaEkvH6YmcXXTO4Uol/XH3UXyki5hfHG2jXlgQWd/Z1Yq66VAjjoRgtin4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364912; c=relaxed/simple;
	bh=vOcMmWHXzSHEsTyMzIcDE6xuorjHcAzCjTewydu2nZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Gmwjfmtc0WloncMB2Rqqg1LMe28Q3s7YbrNJ6IlSzyWDGMJ1motbPH7D6KNxnjWbOZYlbD29PJyllXuGKptEbdDPxJc+amjSS7cFeRnCDIMzxV6uS6RLv7JsCwzsNWcKewKgaB6mPilS1xhQ+m+GbpgdHpeyJfN61IMgQkWuV7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h90BzMO5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h90BzMO5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so9350255ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364880; x=1791969680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7bGJp0W3lyLv6aEr8PYCN/rTYBnZWqqa7RbAmWGVPa8=;
        b=h90BzMO5V9XKAmwXcyz6d53BtJbS/aIt1FMh+clS6240iFNZueqlrNQxZHt1o4yjYh
         d6629TkdVRKMskQOyT0R5tjB3E+XAgpl+H21dKpuKVayTlgSezz2+siaTKZcON1CP/38
         hiC01ifI7YRYF+C5YG+4r0xIJhfttZP536odCT6lCz3WvYef6xNWUBOnrm3x7ouWXMci
         DHilEQgxHpD0UO76kMf1fO5X90Hdn2AhavCqrnp2FXHhwcKc4usvxy1ms+z0RO1kQU+P
         Xxby1vu8FwPpx1XqiLjwk7j1ApwLSnP5/lCIZbbJhbokLvFgehMci8XRRVjdRfpVXW1/
         NrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364880; x=1791969680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7bGJp0W3lyLv6aEr8PYCN/rTYBnZWqqa7RbAmWGVPa8=;
        b=V6Mg3tuxeRbu7ivfoLH+33vvS613+1f2a+BFkKmC11wCwtvVs8bcPLMbYqbvPuwKuk
         54FnDizwnJBhwCFZQvGQ+VI4aIcfj8YR2R+hQSmLCd9vxxQ6M87O9ACViAljKNJim5AO
         O3AhZbzflniR9N8FteXsOgG4InOAOBvhgyF+qoghJdwzuLYlZ13VShz9MV86FLJXjJVp
         e/KCnkAYmNOi+CdlkVlLPn7p7U48wkCWARje3l+gX2GxPBxXYhitC7oyzXEkCkuE+VJh
         3dgZyo6PQG6rutJEeTXYxau83vhutFS9E4tdENClanHxYLy8jJkzZQZx/KupEIt7hHwO
         PIPw==
X-Gm-Message-State: AFq9FYK1TRZJwqnNNe8hI3S+eoF6BIzoBKRoFIkffgAK6cA9RfGHt5Ig
	wh/qlPF9rCHcROercfoHLzRsLbCDMzmjZkzHl534Md1BABUDvdGfnUzOG0YG6w==
X-Gm-Gg: AYBFou0Bf+T+N2AUw4GHPoY+if3tflJOX0nMJcyb+DEQRAPqVKY41gTs6G9mbPUQx/T
	k+x28bJU5jtBKjhH2uWZPT2KhAFToT0hmKjKdhOC8ik5iTWHKbgGuEygfuw3811DjVpeU2SlzF7
	kVqMjIYdM3OY1rHgQiuKagcDh0y2htssA0dqfxBCHpqGZvfCW2dty/VYhkk8i/vf+3006KqOl0A
	AF2B7KlOVETHnh60AbL9J8I4whE5A7O7p5YYvrrj5A8m3wehKd2he5vJX/HZqFumxTahRO/C/Kt
	P+SH2bDuf/51KaLXvyUFcpNX2j6uz/s7Wf8cs4FM1exMTj5PDzrlnN0thlwcToatLc9GA5WC3ik
	1TVraYdmmVDPRNAyjjuJl8uLUVC/BWjZxzDFYCqTszVg7FbbAl4WHURsdjyl6f1lDBl/LyUPJe5
	WTJPRmBEFbSJHS8F5TVI+Q4S0HQljgkmAAkfmaafVpSKbbGypAA0Z3un58WjSYr/IGwd2dUssAF
	gbTy3YABzI2zU2AtPFFHiQIueqlHCyh4HFYdJ2p
X-Received: by 2002:a17:903:2c7:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e6004f1169mr15909165ad.37.1791364879834;
        Wed, 07 Oct 2026 02:21:19 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:18 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v8 00/13] mfd: nct6694: Refactor transport layer and add HIF (eSPI) support
Date: Wed,  7 Oct 2026 17:20:49 +0800
Message-Id: <20261007092102.3768818-1-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

The Nuvoton NCT6694 is a peripheral expander that provides GPIO, I2C,
CAN-FD, Watchdog, HWMON, PWM, and RTC sub-devices. Currently, the
driver only supports USB as the host transport interface.

This series refactors the NCT6694 MFD driver to support multiple
transport backends and adds a Host Interface (HIF) transport driver
that communicates over eSPI using Super-I/O shared memory.

Patches 1-5 fix pre-existing bugs in the current driver. They carry a
Fixes tag and can be picked up independently of the rest of the series.

Patches 6-12 isolate the USB transport, extract the transport-agnostic
core into nct6694-core.c and wrap the firmware command interface behind
regmap, so that the sub-device drivers no longer depend on the
transport. Patch 13 adds the HIF transport on top.

Changes since version 7:
- Marked the GPIO controller as sleeping.
- Validated the USB endpoints with usb_check_{bulk,int}_endpoints().
- Checked the length of received USB packets.
- Ignored interrupts without a mapping.
- Moved all fixes to the start of the series.
- Embedded struct nct6694 in the transport data and dropped the priv
  pointer.
- Renamed variables and buffers consistently.
- Retrieved struct nct6694 from the driver data in the core, and let the
  transports register their own MFD cells.
- Returned -ENOMEM when the IRQ domain cannot be created.
- Kept MFD_NCT6694 as the core symbol and added MFD_NCT6694_USB.
- Folded the interrupt URB submission fix into the core extraction.
- HIF: requested the interrupt after the core is set up, so that it is
  freed before the IRQ domain is removed.

Changes since version 6:
- Transfer command payloads through a buffer owned by the transport.
- Locate the interrupt IN endpoint with usb_find_int_in_endpoint().
- Submit the interrupt URB after the core has created the IRQ domain.
- HIF: several robustness fixes in the interrupt and shared memory
  setup.

Changes since version 5:
- Replaced the read_msg/write_msg function pointers with a regmap-based
  transport abstraction, and added nct6694_write_read_msg().

Changes since version 4:
- Split the monolithic patch into a series of logical commits.

Changes since version 3:
- Removed redundant module type macro definitions from the sub-device
  drivers.

Changes since version 2:
- Restored per-device IDA and PLATFORM_DEVID_AUTO.
- Validated the irq_find_mapping() return value.
- Checked the superio_enter() return value.

Changes since version 1:
- Reworked the Super-I/O access helpers.

Ming Yu (13):
  gpio: nct6694: Mark the GPIO controller as sleeping
  mfd: nct6694: Validate the USB endpoints
  mfd: nct6694: Check the length of received USB packets
  mfd: nct6694: Ignore interrupts without a mapping
  mfd: nct6694: Transfer data packets via a dedicated buffer
  mfd: nct6694: Move module type macros to shared header
  mfd: nct6694: Refactor USB-specific data into nct6694_usb_data
  mfd: nct6694: Rename USB transport functions with _usb_ prefix
  mfd: nct6694: Rename driver to nct6694-usb
  mfd: nct6694: Extract core device management into a separate module
  mfd: nct6694: Introduce regmap-based transport abstraction
  mfd: nct6694: Add a Kconfig symbol for the USB transport
  mfd: nct6694: Add Host Interface (HIF) eSPI transport driver

 MAINTAINERS                         |   2 +-
 drivers/gpio/gpio-nct6694.c         |   9 +-
 drivers/hwmon/nct6694-hwmon.c       |  21 -
 drivers/i2c/busses/i2c-nct6694.c    |   9 +-
 drivers/mfd/Kconfig                 |  34 +-
 drivers/mfd/Makefile                |   4 +-
 drivers/mfd/nct6694-core.c          | 111 ++++++
 drivers/mfd/nct6694-hif.c           | 572 ++++++++++++++++++++++++++++
 drivers/mfd/nct6694-usb.c           | 414 ++++++++++++++++++++
 drivers/mfd/nct6694.c               | 388 -------------------
 drivers/net/can/usb/nct6694_canfd.c |   6 -
 drivers/rtc/rtc-nct6694.c           |   7 -
 drivers/watchdog/nct6694_wdt.c      |   7 -
 include/linux/mfd/nct6694.h         |  91 ++++-
 14 files changed, 1205 insertions(+), 470 deletions(-)
 create mode 100644 drivers/mfd/nct6694-core.c
 create mode 100644 drivers/mfd/nct6694-hif.c
 create mode 100644 drivers/mfd/nct6694-usb.c
 delete mode 100644 drivers/mfd/nct6694.c

-- 
2.34.1


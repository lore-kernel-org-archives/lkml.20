Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67A0495ACB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873221; cv=none; b=XCkoYVyRfl65GCR9FrRicLkHTG2QXKYF9xcCS0jDNFs9g8BJq3mbdnEmWpnutAr6VtWhQaQKJmqeRXo3GEKdt0UArd8IyCL1KOSWuBKdmc/wD7oJEjq3L31PkdD4bFuI9TFsEUsykFiEeSdjd2AcEnLfp9xeMiuRz+UkJaKwRF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873221; c=relaxed/simple;
	bh=D4KK4Owzl2IDUuekO/ucI2qVgmNOA+ePEY03/Q5b0So=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tKoHq7qHbpXcURJSslMkcqPX/qOwPirXFRSezP98Isaxnl0qGtGo2qLMCdwy/Mli6E/FODyaKy1y8AIhF85VFu0/0uciCD2cDVGaSG2F3pRHWt5aQEz5VNfXek2uuAiv5Q61Ch/CLJFRLX9qJP8l2IB5G064RG1lKu6hVPf4ldU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PF4CcAOP; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PF4CcAOP"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1069697a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873220; x=1792478020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7V/K7ai512RfQ97r0Gg8DmaVbxXlJYfptSpej176iXc=;
        b=PF4CcAOPsay8kIDlznceYoXl+G4KNYlFvkRflyZ2NTZcbHqwq8Cv7s5jFXKxZ2xOyd
         yresaWPnYMZ6l+LAxFCbFf65c/x2RNN5/shEwS4/wS/ahVejK4Rfw/7br1e8171D3bZO
         R3T8vDASW9b9Zx0ftFstnZBxwpRkFU/9JLCJghKmqziLjbwqIrvqazE5sId4gh6CnZdy
         zClwA2R53yG079qA0GsVIy9oBIZ+tvNNrN7AYzwYX3S6wIXAYMB2x91TxNRpHC/YfsM/
         yOHmToG+gq6m8elvE51cGEPdPoEb91o4xMqoygM2zIT4kepWShifQAiYIi4JwP3yuwkz
         PboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873220; x=1792478020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7V/K7ai512RfQ97r0Gg8DmaVbxXlJYfptSpej176iXc=;
        b=l7TB1k/BfXMS21lKNNWaBdSuw/x+834SXgeKianK1rY+demSX373ozC3e7BzK+sjKj
         ca2RBGn0aYJIJdrtqHDA6tEOirBYsLANwMTsqbyrLu+6OrgRqgEywp2ypmt+NsO3QlVN
         uWOAFU18GqHh00wB07aU9Chkm8r+ZRlH0Xe3ZIL876lUf0kNsmocgMuzahLTaDf6iQYr
         f6YY6O8JghMy64L/azWqYScgQPbeEHnRryO+QXWAkvt0f9KN/fUNxt1Ic1GpOGkg+2Yj
         QhkJEGLS+bIetKNhy82jgOxJRuWbzXwzJcA2hDQ4RWEqjH2h68G+aX3iaY46OCTs58lV
         aWZQ==
X-Gm-Message-State: AFq9FYJ/WaMIUGukf+xThZQYHAR9WYMTWgPM7hxho1VkZB+TPtPLMsL9
	EUW19N9AJTGhgiGi0ri8dTA76v1Sk46HxcGnhcVQx+dHaSzwgVrKYlVO
X-Gm-Gg: AYBFou38Ku98MatiNcpfQOzmw8KzWevhwTw9TRYI5cM2ztCR5tQv89oVPSYgr4AeUq7
	kc1U3lCUQ9tDGHGjysVRlEEpXPBg+KtA73CfLWKN8Um2Z9d29HFgB1OXAT91RBaBq7ESbORHXsw
	WByAZjrPfDfK3zn+sJ64JZBnKIfQQRaUa4VzzAYxqHXFnmaLLImubps//ORd/JcBcWHhugY6AIW
	A/ARsOEhFXuTUuUhBjfHQLvpnm1rkBtBr3c4rjaT2Ex9Q13teUYHzPE0bUrrrNIk1O16iZosdef
	ZvryMBMBxRXG4oAYVcKB9EJ1evSuNLCnFxRUAS7QsNGeb7hzsKoW77lEuSlN52Yp2tx4+GwjfYp
	B1UdC/uPMYCZiTnyYEmnyUpYj9kIQUYdkcSc9bznM4CQy/mciaoH4whuitoiV8aSsKuiBhHa4FY
	HIJaivDGLkdIY4zf+L6fpU/+HfiZum5ygcjwkhumMweUm1gM5LHNRYZ9vlmJ9cuVjxbvC8hL42G
	j4Q/t3UCl9NQSKjCE2LmUzUrkS/TBxsqjIb5jAA
X-Received: by 2002:a17:90b:4fcb:b0:3a8:7dc:7fdb with SMTP id 98e67ed59e1d1-3ab3a79d4f5mr8912801a91.44.1791873219708;
        Mon, 12 Oct 2026 23:33:39 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:33:39 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v9 00/12] mfd: nct6694: Refactor transport layer and add HIF (eSPI) support
Date: Tue, 13 Oct 2026 14:32:46 +0800
Message-Id: <20261013063259.2734757-1-a0282524688@gmail.com>
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

Patches 1-4 fix pre-existing bugs in the current driver. They carry a
Fixes tag and can be picked up independently of the rest of the series.

Patches 5-11 isolate the USB transport, extract the transport-agnostic
core into nct6694-core.c and wrap the firmware command interface behind
regmap, so that the sub-device drivers no longer depend on the
transport. Patch 12 adds the HIF transport on top.

Changes since version 8:
- Dropped "gpio: nct6694: Mark the GPIO controller as sleeping", which
  has been applied by Bartosz to the GPIO tree:
  https://git.kernel.org/brgl/c/fcbc48dc650d2f58bfe19c4486830de0e9cad62e
- Rejected transfers larger than NCT6694_MAX_DATA_LEN in the regmap bus
  callbacks of both transports.
- Reworded the commit message of "Rename USB transport functions with
  _usb_ prefix".
- Collected tags from Andi.
- Rebased on v7.3-rc7.

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

Ming Yu (12):
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
 drivers/gpio/gpio-nct6694.c         |   7 -
 drivers/hwmon/nct6694-hwmon.c       |  21 -
 drivers/i2c/busses/i2c-nct6694.c    |   9 +-
 drivers/mfd/Kconfig                 |  34 +-
 drivers/mfd/Makefile                |   4 +-
 drivers/mfd/nct6694-core.c          | 111 ++++++
 drivers/mfd/nct6694-hif.c           | 578 ++++++++++++++++++++++++++++
 drivers/mfd/nct6694-usb.c           | 420 ++++++++++++++++++++
 drivers/mfd/nct6694.c               | 388 -------------------
 drivers/net/can/usb/nct6694_canfd.c |   6 -
 drivers/rtc/rtc-nct6694.c           |   7 -
 drivers/watchdog/nct6694_wdt.c      |   7 -
 include/linux/mfd/nct6694.h         |  91 ++++-
 14 files changed, 1216 insertions(+), 469 deletions(-)
 create mode 100644 drivers/mfd/nct6694-core.c
 create mode 100644 drivers/mfd/nct6694-hif.c
 create mode 100644 drivers/mfd/nct6694-usb.c
 delete mode 100644 drivers/mfd/nct6694.c

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.34.1


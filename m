Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585917;
	b=2C9BzUaA1yqkJxoiomaEqsdXzpHlBBRSFITSvyH7jpLwmr21guwePVJz9Jf0B8IrqrCq
	 PssP7dcJ4WArnYlh3jn2GYOkawM7EkgQ1ufo4gbnzSiUqAYam1KcMbS3QG/UT2AnoLG+G
	 fjs0aN1p9OJSdWGWjJFEaH9f4B5rTKK+9I0anwbAy8AuNF0+MOdW1XTBhsFf/KxQfcQZy
	 M4Vcd8+bOPubcP6vOQBC93BYBkansqfLQ1+tYGl2yqI8k2FkDtu6Uy6B6jCTTCcbTHBhI
	 0XrCBiuLcAuK6H1nlk91BjLmmc2xYFnNx2OH9HVKcO3uCf0fSi301GH5nl3VtV9JScw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585917;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Vi/DPnceOq0VsSSRedDFBN2uKDptzqnJwZc3aUmq6lQ=;
	b=LcoNrDGBLbHSWQIOZWwgyoBbreQfl62mtLZvOG2u/PqkN++BA3NEsu3YO/RQ8GGzWkYs
	 5m0sc3IbSUBwVUXARn2QGbOnyT6eD+b2BVqpncHIDELjQE/w/PnDT5LBp80FzczEACVeu
	 y58/CYoX99C1sNRcgdmo5CmIO5HFwqHKHiLhijwa1ewNEe9Znp709HYPtdToxObLwzT4L
	 nhLEzFSO7W0wwmx+C4QUYtRkhdCjpZTxGgVpscZKTD4iIpoYvjY5VMEd7Il5FaXI624IL
	 G/0CdEtUXwFpK3aZQnghqg6jB0qK24iVeDDZyj/01DDM3A/QLiUz26+8KWURkjklEwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HN4AMym7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B64606A330;
	Wed, 21 Oct 2026 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HN4AMym7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7ADE1F000C6;
	Wed, 21 Oct 2026 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585916;
	bh=Vi/DPnceOq0VsSSRedDFBN2uKDptzqnJwZc3aUmq6lQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HN4AMym7jksJoTV6FE19Xu82a+/hEi3StMBEmZVCnuMh1qDfcWicvC4LrU6CByUFu
	 XA5AIeDggmwbCeIa7KQA1rSfZ4iBoWDCrTiuRJFw6eZoAKoWf8KkimapRGaJDcUAz0
	 ABIFQRDcDel1oCbzYtTtS4uZuzSKykiBiv4jZNxIuh36Lf6LEhBy229tY3a6E1RZY/
	 OIaLx6PMAGTDtamZB0zIzQzgrUaSXVvUGafTkaNA1doCUdLDNtrKS21GYuNj50grUs
	 UN/hQHSfQTDOU9jpk3lpqQzn4NSy8RZ2wAhUC0KK5K2vZzutlr2xKFkRK9cA9R+2Mf
	 dPtQTfatPRVEQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/28] mfd: Assorted resource lifetime, teardown, and error-handling fixes
Date: Wed, 21 Oct 2026 12:31:14 +0000
Message-ID: <20261021123114.3159750-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021121245.3111563-1-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
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

These issues were reported by Sashiko.

This series addresses a collection of resource lifetime, teardown
ordering, uninitialised memory, and error-handling issues across MFD
drivers (along with two related patches touching i2c-cgbc and the
ti_am335x_tscadc child drivers):

- Resource teardown & lifecycle fixes:
  Ensure IRQ domains, chained/parent interrupts, GPIO GSIs, delayed/reset
  work items, PM notifiers, system power-off handlers, sysfs groups, MFD
  child devices, and global singleton pointers are properly unregistered
  or managed via devres on probe failure and driver unbind (ls2kbmc,
  ioc3, intel-lpss, max8907, twl-core, loongson-se, abx500-core,
  ab8500-core, tps65217, mt6397/mt6358).

- DMA, URB, & hardware error handling:
  Allocate USB transfer buffers on the heap rather than the stack, avoid
  resubmitting interrupt URBs on endpoint stall (-EPIPE), zero-initialise
  command and version buffers, and validate DMA masks, engine IDs, and
  polled transfer status (nct6694, cgbc, i2c-cgbc, loongson-se).

- MFD cell descriptor & driver-data clean-ups:
  Avoid storing stack frame addresses in MFD cell platform_data and
  resource pointers, and retrieve parent driver data directly via
  dev_get_drvdata() in the ti_am335x_tscadc child drivers (ls2kbmc,
  bd96801, db8500-prcmu, ti_am335x_tscadc).

Lee Jones (28):
  mfd: nct6694: Allocate USB DMA buffers with kzalloc_obj()
  mfd: ls2kbmc: Unregister GPIO GSI via devm_add_action_or_reset()
  mfd: ls2kbmc: Cancel reset work on teardown via devm_work_autocancel()
  mfd: ls2kbmc: Allocate simplefb platform_data on the heap
  mfd: bd96801: Allocate watchdog IRQ resource on the heap
  mfd: ti_am335x_tscadc: Retrieve parent driver data via
    dev_get_drvdata()
  mfd: db8500-prcmu: Make AB8500 cell and IRQ resource static
  mfd: nct6694: Do not resubmit interrupt URB on endpoint stall (-EPIPE)
  mfd: cgbc: Zero-initialise version buffer in cgbc_get_version()
  mfd: ioc3: Request parent IRQ via request_irq() and free before domain
    removal
  mfd: intel-lpss: Remove registered MFD child devices on probe failure
  mfd: max8907: Manage power-off handler via
    devm_register_sys_off_handler()
  mfd: twl-core: Clear pm_power_off callback in twl_remove()
  mfd: twl-core: Clear twl_priv pointer on teardown and probe failure
  mfd: loongson-se: Check return value of dma_set_mask_and_coherent()
  mfd: loongson-se: Zero-initialise controller command structures
  mfd: loongson-se: Reinitialise completions and wait uninterruptibly
    for commands
  mfd: loongson-se: Zero-allocate driver data and initialise engine
    completions in probe
  mfd: loongson-se: Prevent out-of-bounds engine access in
    se_irq_handler()
  mfd: loongson-se: Stop controller and mask interrupts on teardown and
    shutdown
  mfd: loongson-se: Validate engine ID, DMA buffer size, and IRQ
    registration
  mfd: abx500-core: Unregister device ops on devm release
  mfd: ab8500-core: Register sysfs attribute groups via
    devm_device_add_group()
  mfd: tps65217: Manage IRQ domain teardown via devres
  mfd: mt6397: Manage IRQ domain lifecycle with devres
  mfd: mt6397: Unregister PM notifier on probe failure and unbind
  i2c: cgbc: Propagate hardware errors when polling read status
  mfd: ti_am335x_tscadc: Remove redundant ti_tscadc_dev_get() helper

 drivers/i2c/busses/i2c-cgbc.c             |  27 ++++--
 drivers/iio/adc/ti_am335x_adc.c           |   2 +-
 drivers/input/touchscreen/ti_am335x_tsc.c |   2 +-
 drivers/mfd/ab8500-core.c                 |  11 +--
 drivers/mfd/abx500-core.c                 |  29 +++---
 drivers/mfd/cgbc-core.c                   |   2 +-
 drivers/mfd/db8500-prcmu.c                |   8 +-
 drivers/mfd/intel-lpss.c                  |   1 +
 drivers/mfd/ioc3.c                        |  32 ++++---
 drivers/mfd/loongson-se.c                 | 110 +++++++++++++++++-----
 drivers/mfd/ls2k-bmc-core.c               |  27 ++++--
 drivers/mfd/max8907.c                     |  28 ++++--
 drivers/mfd/mt6358-irq.c                  |  17 +++-
 drivers/mfd/mt6397-core.c                 |   4 +-
 drivers/mfd/mt6397-irq.c                  |  31 +++++-
 drivers/mfd/nct6694.c                     |  23 +++--
 drivers/mfd/rohm-bd96801.c                |  11 ++-
 drivers/mfd/ti_am335x_tscadc.c            |   7 +-
 drivers/mfd/tps65217.c                    |  40 ++++----
 drivers/mfd/twl-core.c                    |  45 +++++----
 include/linux/mfd/loongson-se.h           |   8 +-
 include/linux/mfd/ti_am335x_tscadc.h      |   7 --
 22 files changed, 327 insertions(+), 145 deletions(-)

-- 
2.56.0.218.g1ec904b173-goog


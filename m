Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F421A9F90
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788726551; cv=none; b=GcuHUwkG7uSr72DjUVdMyU/4NSIpRRKhr5QbFF/4sLOCRuT2oloM9oW576HMev4CheZ1BjP5FxN0b78Py8SvAwYitoturS1kPF1kYgWBzfCrnsbFrVcUSgaWDb41GSNvNPdo3LOgNVYu/1cw6JzFJlSERw5em5TBQB8lqSDK7mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788726551; c=relaxed/simple;
	bh=wRyOSWA6M9OHPhvSOH334wB6oJpVpuc+OTU9XK+frr0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GbILMRkA7l5xOI2iteB+ZBtA7on9dd75yYCfZW3FUB0yrUtp1VktsJqdaqKG0zRoFoyiSpo+wbFNp9iskFrEfbOrhz9K2uYlj9Qo7Yitx38yhO2IufjkedCPSui3NmgDtpKHR3XkV9lNEjCz+UCymzGwcizOzulPxxDsTSXXDok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G0u3fAaV; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G0u3fAaV"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso4454012a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788726549; x=1789331349; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BdOF/psNk7u0j9Lh9H2kzgy+dViSQ0MMlbl/hGjVxJM=;
        b=G0u3fAaVhPgDV82sk6Tj6UcDUEJvaKy2wLkR7cCDfhX47DqfwRhOhBsmsAibzr0uvS
         0CiWyE62x4ZVj26rifeunQLBvcibiIo1W1QM19R/LHiP0RBEWgZTYyy8s8kZRojIND21
         kOCsq7esmrLGX1NCD3hQ2P23tUuf7ckN40MeEmNcZfnxsJMjQLkLum0pY2pR+qRqA2i0
         lT+ogxntW75hNHa4vxFAbEdW+5H4WH8wrFdnPz2P9HGMecSffIgGaSWiwNp2dTqFgyOQ
         CX9jgO9drF/zYOm+Xw6USNxtMhsWWse8UWuJJDxLwQ5Bb5tqcsTFxWk27qcXekmH9l2q
         jcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788726549; x=1789331349;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdOF/psNk7u0j9Lh9H2kzgy+dViSQ0MMlbl/hGjVxJM=;
        b=qFZreT2m/qbq7tsZnDxoT9SZP1QlsuSWxyMmDeNqOr+JMUKu8/gsgQOcf5Hb4nCGvh
         SgnXGFBisPZijZV6xnAigKw1v26GTag6f5qyJYpv5AGRQY03I73+jltvHLL2wiSC+Vkd
         CRAC9GnLuzIwhwmbpjN9pW9TVVOta+NrwoJo49o45pCRx+LvHCYRCmD2s+RrxPej0vhN
         UXiWDElwFeEZW2stvRNpzZ42W773fmFcginBF9cZdlU/RV6ggfE5gJIG5ysp6o2ZB1sT
         d0FZY3enPqNyFm81R+QQDMdPHv2v8K8POZcDQEHIV6IVMpoGWUuuQ759KfCUj5Qn/44J
         2gCw==
X-Forwarded-Encrypted: i=1; AKwUvBw75E0GN3ZN4zqjclbIjQl2TEOzVpMTH5lhuOlXfkHJdNflmX+skdgJzIdlKj41cGkfnkL3x2k6zNouZdI=@vger.kernel.org
X-Gm-Message-State: AFuF++nzkEanM8Ir5QmkV/B2ilhxU0ODCwyLNW3L0Aa0DGLh3RHCt435
	NzJEKdgX9TnmrO6tHkdQsl2995ltc5OdoRKpushZv6jZu+tHIc35vswW1aeQS8S1FOjEqsx6QP9
	RJ43rAp095GzKGkzNKCQ9NipRuldf9Q==
X-Received: from dyrt38.prod.google.com ([2002:a05:7300:4f26:b0:30f:2f43:117b])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3cc2:b0:3da:2e53:4f1d with SMTP id adf61e73a8af0-3da3a171cb6mr30624523637.22.1788726549141;
 Sun, 06 Sep 2026 13:29:09 -0700 (PDT)
Date: Sun,  6 Sep 2026 20:27:44 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260906202747.4041389-1-samagazaryan@google.com>
Subject: [PATCH v4 0/3] i3c: Introduce i3c device userspace interface
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
Content-Type: text/plain; charset="UTF-8"

This series revives the I3C userspace character device interface (i3cdev),
originally proposed by Vitor Soares in 2019/2020 [1][2].

1. Motivation & Production Use Case:
Previously, one of the reservations against introducing an i3cdev module
was the lack of a standardized production userspace use case beyond
controller development and bringup.

We now have a standardized industry use case: the OCP Secure Firmware
Recovery Specification (v1.1) and Open-Source Silicon Root of Trust
(Caliptra) recovery flows over I3C. When an I3C target device (SoC, ASIC,
or SRoT) is held in ROM or bootloader recovery mode, no functional
in-kernel driver is bound to the target. A userspace recovery daemon on
the BMC must perform private SDR transfers to interact with Recovery
Control & Status Registers (CSRs) and stream recovery firmware images.

Exposing an interface modeled after i2c-dev/spidev allows userspace
recovery tools to operate directly on unbound I3C devices without
requiring rigid or proprietary in-kernel recovery drivers.

2. Changes since v3 (Feb 2020):
- Rebased onto upstream i3c/next and adapted to the unified i3c_xfer API
  (replacing deprecated i3c_priv_xfer / i3c_device_do_priv_xfers with
  i3c_xfer / i3c_device_do_xfers(..., I3C_SDR)).
- Addressed UAPI structure feedback from Greg KH and Arnd Bergmann:
  * Used explicit __u64 for user data buffer addresses.
  * Added fixed-width explicit padding to ensure consistent 32-bit /
    64-bit ABI alignment.
- Wired up .compat_ioctl = compat_ptr_ioctl in file_operations.
- Fixed device lifecycle and concurrency:
  * Switched to cdev_device_add() and cdev_device_del() with an embedded
    struct device and a release callback, preventing use-after-free and
    races on driver unbind/detach (incorporating fix from Oleksandr
    Shulzhenko).
  * Cleared i3cdev->i3c under xfer_lock on detach so concurrent/subsequent
    file operations safely return -ENODEV.
- Fixed read transfer buffer allocation:
  * Replaced unconditional memdup_user() with kzalloc() for read
    transfers (rnw == true), avoiding copying uninitialized userspace
    memory into the kernel buffer.
- Fixed mutex leak in i3cdev_read() and i3cdev_write() error paths.
- Switched to static const struct class with class_register().
- Switched minor number allocation to the IDA allocator.
- Added include/uapi/linux/i3c/ to MAINTAINERS under I3C SUBSYSTEM.

[1] https://lore.kernel.org/all/cover.1575977795.git.vitor.soares@synopsys.com/
[2] https://github.com/vitor-soares-snps/i3c-tools

Vitor Soares (3):
  i3c: master: export i3c_masterdev_type
  i3c: master: add i3c_for_each_dev helper
  i3c: add i3cdev module to expose i3c dev in /dev

 MAINTAINERS                     |   1 +
 drivers/i3c/Kconfig             |  11 +
 drivers/i3c/Makefile            |   1 +
 drivers/i3c/i3cdev.c            | 445 ++++++++++++++++++++++++++++++++
 drivers/i3c/internals.h         |   4 +
 drivers/i3c/master.c            |  15 +-
 include/uapi/linux/i3c/i3cdev.h |  37 +++
 7 files changed, 513 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i3c/i3cdev.c
 create mode 100644 include/uapi/linux/i3c/i3cdev.h

-- 
2.55.0.979.g7e5102b832-goog


Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467FA3E169F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790509792; cv=none; b=osXEWeAzg8TjXcoItwOjGlee6QAX8N6rpuEWK6l1A3wVsD76SDNIknFJXKRyCwC3USISCZTWIB+d7EDBcHaSlSKfiC1OdJ+6r6Ks8XN/GO+6Eu4RfQt0uqRNXt7i7aRH+mW8kkjlsCXrMHsmTe4wlIMxPFpXOQCYhn5cKxq/jBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790509792; c=relaxed/simple;
	bh=qZkCiL861lt8lwd3IuO5tuuGDOozM3gVvT2PHwQzA8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y605JUSydhrgE8fWsXugidlDERl3DNlwNNqawVNsbjlk6hXR9qXMruziXkqVgcJnkSOtgsNymHbBpVwb/Z3VdL1lkIf90Oso1WRZ+5f3lRPJGnPPC65iNRoy+RfeTmshovt2k1H3kt8A8uPm6VU64CSusWAmxc9mZIg488F1f00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=P5ZnlvtN; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="P5ZnlvtN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso24005975e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1790509788; x=1791114588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71g56uPtScUsuXicGPFTJJ9Hw3/l51368qJ69c37ce0=;
        b=P5ZnlvtN2b/PG2dqaWEce9K/WKmyet+f45TcfC/OQsfwJaUQpXiph8Ervtn0xY0y5u
         c19X4ITyoxi+02i3RYpT9v4kbKGuIx600pCCLo7WeeIltvbb+ktL64t852icMtrt5W+K
         /CDeUXPq8X1xkEpu0so6BJIw/WN8Las4vknnPdtO0hyJNsdvq2WuqKHK2mUrmInugPjW
         8GlK53TjIdyRinV53TqGsh72FVaS2o77sEa2k/mdf6caB81xTD3V4qAJ6yTfsXxIuCcO
         klUtZK11f5QMaf7WC5n27cvBrOSHJQSkCGXnO/7I8765LRpnZ99X3guFSEOGBixLHMxj
         psrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790509788; x=1791114588;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71g56uPtScUsuXicGPFTJJ9Hw3/l51368qJ69c37ce0=;
        b=GU+Z88+XzSs0PbItPA3HgX3C/QmuEtlCPvFIf72D7EFa7G9LdCZx1w+aXxtotEQqe+
         s1KouFVYy+Uy2LnDf1uClvAAsfiFTak0/h34hCDmh86FC2TKIAiAkKVKbrNcUr0/NK1O
         mVS+fu4DBaUFcB7iZA+GGCU+HV2QxQQFfqjvK4qEY0bUhNHeRRVs97zsZnv4lUIEb1eD
         YZ8RSit/ZGYOhreD15pO4jZGNawJqPrEbiEeksc0c0XoAENR4lqbGTUHYWDtHr32f4Rb
         SyqFw/IeTf2D2Ajde6x9sMizV8fHSzsSFmZQuXz363Pulab777xBNyAgkVLfJaSWy5/B
         Rsiw==
X-Forwarded-Encrypted: i=1; AKwUvBz/6TIpOu5YGzbgozTdA6Gonww4UgGzFzl1hpybDTtwmx4ovzn9VQc2f5ZNQBkuNlhdOhWzj4o07AZN3hM=@vger.kernel.org
X-Gm-Message-State: AFuF++nFHjU/FhP9cqhhORIe1+eAEB+NPIDNGK4D2exMJnaal2x+V2eE
	AFKBgo4S9uESEwlmg5gBjGBOlMS9SysOnVGuLNZvPd6rGBx/QZzRHDF92773KxyxXS2P
X-Gm-Gg: AYBFou2OWQHt3LqPa1lLL1Y3QQ0SRCfcWXUv1u6F+iSRszdIcj12SB2epsr2IfMmYf4
	5tmqlFl1EhGbY8IN/vZBYN+q6OyEM250goFJwtGS2TdIhscfSsz1tdrwbF4PKHgjjJ3bEOgaJjg
	zIzkhxPIp82E54U4GJ4wnDcCv8WJsLG9Ya29CJiWiUndue7R2W5wcDxqW+8wRZwpuCiZ9o8wpcI
	UKu447ZG2Vn1LvuuF49jEJvKL1rlH6vqDS6zCYOPzIFvAHUqr16pt7XbgKH0o9CT7bOmqbI5vom
	Cw4Oo98k9YS70WkaiUzRWNfu+pUKdO7Km/PA3tdIwcOeyux3N+jSqg0UaJHdYepLyrMclM6YsSk
	eqk4ZSOvnDlLoIgrWUUtMQ8pGzkGgA4JLBm28mDG8iCUjefUAQkEu3dvvjSbS8L0W9aMiSTlAF0
	6tL0AOBZ3WelZTcEOWWlpZxpMzq7W7YZQl8luwuaKI6bPgimQT3rrEw3OSL5XA6gxjT9zlrlpg/
	AUtOnhmdw7cZ9ZM/LWyMESvfl3VvQ==
X-Received: by 2002:a05:600c:4744:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49fe7b6371bmr185299995e9.12.1790509788255;
        Sun, 27 Sep 2026 04:49:48 -0700 (PDT)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:6d6e:8514:ff1c:6c57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178bebasm57095935e9.11.2026.09.27.04.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:49:47 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/3] virt: bao: add Bao hypervisor IPC and I/O dispatcher drivers
Date: Sun, 27 Sep 2026 12:49:21 +0100
Message-ID: <cover.1790357735.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds guest-side drivers for the Bao static-partitioning
hypervisor: an IPC shared-memory driver, an I/O dispatcher that lets a
backend guest service VirtIO I/O for frontend guests, their UAPI and a
MAINTAINERS entry.

Bao is a lightweight static-partitioning hypervisor for embedded and
safety-critical systems (https://github.com/bao-project).

- The IPC shared-memory driver lets Bao guests exchange data through a
  shared-memory region split into a read and a write channel, exposed
  as a misc character device (read(), write(), mmap()).
- The I/O dispatcher bridges Bao's Remote I/O mechanism to a userspace
  VMM: the VMM creates each device model from /dev/bao, receives the
  frontend's MMIO accesses and completes them, with ioeventfd/irqfd
  support for the fast paths.

Changes since v3
----------------
The two design comments on v3 changed the shape of the series, which
went from six patches to three.

- No device tree (Krzysztof Kozlowski): both bindings and the "bao"
  vendor prefix are dropped. The IPC channels are a software contract
  between the hypervisor and the guest and are now declared on the
  kernel command line (bao_ipcshmem.channels=...). The set of device
  models a backend serves is a contract between the hypervisor and the
  VMM, so, following drivers/virt/acrn, the I/O dispatcher exposes a
  single /dev/bao control device and the VMM creates each device model
  with BAO_IOCTL_CREATE_DM (shared-memory region + notification line),
  which returns a per-DM file descriptor; the DM lives as long as the
  descriptor. The notification line is resolved against the device
  tree's root interrupt parent, like any device's interrupt.
- No architecture code (Will Deacon): the hypercall helpers moved to
  drivers/virt/bao/bao_hypercall.h and use arm_smccc_hvc() for the IPC
  hypercall and, because the Remote I/O hypercall returns the request
  in x1-x6, the SMCCC v1.2 arm_smccc_1_2_hvc(). RISC-V uses sbi_ecall()
  for IPC and a local ecall for Remote I/O (see open items). 32-bit Arm
  has no SMCCC v1.2 helper, so the I/O dispatcher is limited to arm64
  and RISC-V for now; the IPC driver still supports 32-bit Arm through
  SMCCC v1.1 (HAVE_ARM_SMCCC).
- The standalone "consolidate the IPC hypercall ID" patch is folded into
  the driver patches (Andrew Jones).
- All findings of the Sashiko review of v3 are addressed, among them:
  the DM id is taken from the file descriptor instead of userspace; the
  irqfd/ioeventfd teardown races and the ioeventfd deassign fall-through
  are fixed; the interrupt handler is per DM and the request_irq() name
  is persistent; queued requests are capped and requests that cannot be
  delivered are completed back to the hypervisor; the UAPI structures
  have no implicit padding; signals return -ERESTARTSYS; the IPC driver
  orders the shared-memory writes before the notify hypercall, refuses
  writable mappings of the read region, validates page-aligned regions
  and has an llseek. Details are in the per-patch changelogs.
- The ioctl type is now 0xA7: 7.3-rc1 registered 0xA6 for memory
  allocation profiling.
- Found while testing: the two modules were both named bao.ko (now
  bao_ipcshmem and bao_io_dispatcher), the ioeventfd kernel thread could
  exit before kthread_stop(), per-DM dispatcher state was kept in static
  arrays, a list walk used the wrong structure type, the UAPI header did
  not include linux/ioctl.h, and the dispatcher workqueue now passes
  WQ_PERCPU as required since 7.x.

Testing
-------
Built on v7.3-rc1 with GCC (W=1, sparse) for arm64, arm and riscv, as
modules and built-in, and with clang for arm64 and riscv. Run-time tested
under Bao v2.0.0 on QEMU aarch64 virt and QEMU riscv64 virt with the
bao-demos demos: the IPC driver exchanging messages in both directions
between a Linux 7.3-rc1 guest and a FreeRTOS guest (linux+freertos demo),
and the I/O dispatcher with a Linux backend serving console, network and
block device models to a FreeRTOS guest and two Linux guests (virtio
demo). 32-bit Arm is compile-tested only.

Open items
----------
- RISC-V: the Bao SBI extension still uses the experimental extension
  space (0x08000ba0), and the Remote I/O hypercall returns the request
  in a2-a7, which does not follow the SBI calling convention (Andrew
  Jones, v2). Changing that means a hypervisor ABI change (status in
  a0/a1, request through shared memory); the RISC-V support is marked
  experimental until then, or it can be split out of this series if
  preferred.
- Bao does not implement the SMCCC vendor-hypervisor UID call, so the
  drivers cannot detect the hypervisor yet; adding it is planned on the
  hypervisor side.

v3: https://lore.kernel.org/all/cover.1786010512.git.jpeixoto@osyx.tech/

João Peixoto (3):
  virt: bao: add IPC shared-memory driver
  virt: bao: add I/O dispatcher driver
  MAINTAINERS: add Bao hypervisor entry

 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |   8 +
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/Makefile                         |   1 +
 drivers/virt/bao/Kconfig                      |   5 +
 drivers/virt/bao/Makefile                     |   4 +
 drivers/virt/bao/bao_hypercall.h              | 190 ++++++++
 drivers/virt/bao/io-dispatcher/Kconfig        |  20 +
 drivers/virt/bao/io-dispatcher/Makefile       |   4 +
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 389 ++++++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 334 ++++++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       |  70 +++
 drivers/virt/bao/io-dispatcher/intc.c         | 150 +++++++
 drivers/virt/bao/io-dispatcher/io_client.c    | 423 ++++++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 159 +++++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 326 ++++++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 315 +++++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |  16 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 358 +++++++++++++++
 include/uapi/linux/bao.h                      | 116 +++++
 21 files changed, 2895 insertions(+)
 create mode 100644 drivers/virt/bao/Kconfig
 create mode 100644 drivers/virt/bao/Makefile
 create mode 100644 drivers/virt/bao/bao_hypercall.h
 create mode 100644 drivers/virt/bao/io-dispatcher/Kconfig
 create mode 100644 drivers/virt/bao/io-dispatcher/Makefile
 create mode 100644 drivers/virt/bao/io-dispatcher/bao_drv.h
 create mode 100644 drivers/virt/bao/io-dispatcher/dm.c
 create mode 100644 drivers/virt/bao/io-dispatcher/driver.c
 create mode 100644 drivers/virt/bao/io-dispatcher/intc.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_client.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_dispatcher.c
 create mode 100644 drivers/virt/bao/io-dispatcher/ioeventfd.c
 create mode 100644 drivers/virt/bao/io-dispatcher/irqfd.c
 create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
 create mode 100644 drivers/virt/bao/ipcshmem/Makefile
 create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c
 create mode 100644 include/uapi/linux/bao.h


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0


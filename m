Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589982;
	b=AviqdvMaHdiuu5ovMADSsPzXEikIkSnHaJ2lGXWXCkTpQUa3SD+oFAENgsKr/N/PaUhQ
	 5V5BmSNi6OIbOny3YagvSWUtjjGqdaGglZMHMb1w8AXOhJuj9WYKbDVeGJED2c9xP45Wr
	 cpK0kUr6aYECuPWq4/9V+RbobG+huZtZqgtsD4txCOgAt1RreaNnV7IkK3BSLjR0sPr+D
	 vwziW3ueL6sauuFMILrESUFDcrognoankCruYSDO9nGf94njSmZ9jeooIxJE1Bjf9n7g3
	 ZnvfrfRVLTh58mMbW0MregyWr5LT8q9DRmBIYbUXlA2BaIRVvuCr7Rc3nUC9aKw3Sqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=K4XNZiwrr0RJRpeWG5dfP2Kz0D1CmXeE6JJQJUjjjck=;
	b=TbS/crfO9GzSgor7KIrEuloe7YRvX95NUS9qbRfNDdQ+71pNvH4wokyskOXKUBeBKNjy
	 HdvTC8N4XkhvAyco8wHZiC59sbVNEQKHeYCSJwurF8pX9gR6VCfEuk5M/bh+zeuOSACp3
	 MYfb8BmPJSgzrHOee+xTvtxYAIohVElzYFLg+AHVZTL3cU5rVHwZnSk+v7TQM5PS0uV8a
	 tCRCtZvW+9LSdEAndRVDXXsf/P6wL79NEKl5XOHZICQdkUhOPX3EbHnpUfnxuyidZpL/6
	 IWskDLzuzo4n3eqo++fO0sq1mVTZywALWfLyDa9sYJGTlP0v5wbjPlAxBsH/4oBw5Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=beWSRsR+;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D3B606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D3B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=beWSRsR+
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso9617475e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794589980; x=1795194780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4XNZiwrr0RJRpeWG5dfP2Kz0D1CmXeE6JJQJUjjjck=;
        b=beWSRsR+VqdJyTYPWdf5XEDSKemjUDvnM8GyfLz2AjmY4trkDUwgg+AY4TcuaB7mOd
         7MUGZxFIns2zJr2PcbWwBH2JoPTPEuzVDGt7+3cNWGw6GhsTp0Z8ORCFT5JwwLebr27m
         Yy0QtYSfOZ1yEMvFUmzeIBHp5Y7DWTmeBB4G/EG07JqvtUr63VJ3Y/FonZbQyT3YxLsO
         of+uJP26OyltPErALHRfC+Dp+Oln95SEFT+eM+c7GLhnPUK2/4xQsVKFrO8kMPP0mQiy
         7Kq33vmXQOHIljyRTa226LliXXqqwRQx3DnT4YGfUT5f563q9Xjeh94pt5zBH6+c5nlQ
         jLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589980; x=1795194780;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K4XNZiwrr0RJRpeWG5dfP2Kz0D1CmXeE6JJQJUjjjck=;
        b=GXhR5strLnQPlxnd72pL2rEsosqtYEOOZ4DnPwmYJiRcXQLKMdzKq5mtfjqqbgqWNZ
         tX9rs0CkdbQFErq2ts1LaWJGsCV5/vY2QvGBV2NPQkc1BqtXU9gDQw4vR/o27RgYRaVR
         PbsVRZanPEM7W/N5HagKfMQptKKBgcFtzamRykGRaLhhXk/m5bQENmq7DqWWsIdK2F63
         mA5utN8CQ9bKPjjWvxfb7nBr6eHBD5uJqherVy7DbY+1THHLkPvQ5zJTlUq2UQxHTTOJ
         ucY3eG3gh25PUPguLRfnNAqTMTeSGEwwzQw4kPVV97Q8A6+K49tOo2Yc/i49PVvENwDk
         p1YQ==
X-Forwarded-Encrypted: i=1; AL+hErEgxAdOGf6rGtKSILUxUluH7NaeAWAPxXZM/xQmwxCr6JXULOyPA8tlLV8yI0gMgVKP5AqWmeIWLKJm0oY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T3hJqJIuJpFsunO+UyDCGrw11TzXjME0xNgEOm3WlhQS6Se0M
	gP//P99GFod2jS9/K7z3TixUaePPb9roXQmWiXFQQq6NgCD3ZJwk5A4UcCrMeyf2mqV9
X-Gm-Gg: AYBFou0ARFWeOkjTXSl+r0XHlcScbp3PO9SosK7+l+hpCVyFYJqCmhgEKpnasJLC6Yy
	9jbRoOLy90PdeRff56Moy/qP+MDdARUoeLt4uhsSPbNFvavs9BiluzW6ifHLU1N+4yKHXALQJlD
	/qG0zqbX/zCwPNrMt2nQI8HrIz2dWLGbwsaP3bNvdSprHzqrX50yhEtgnyvf5PN8rd02ctdcqOl
	KN+3oB16YgOTuvJNv1Hc2SarPW9Z0pbsfNepA3TQMOjMhLkKYK6nYSQYzcCkLdVE55FzHa365YI
	bbKyhYiUiPOaH8hrzNaEzjPOfrNv3eD8E/MSkQ8ptpw2EmIKg+2rZrPjzDJz7BEB8W4lfNe/YWz
	ncYHlu63xP09WDvanCQVKUb5DReD0XKzeRIbxjSv7nkNPW3yt/8gq+T+RSftmEso0iILQId5JrD
	AzQ6/5fNqwTRmMUE5G9z8vm6VlDbWGg7H1q44/TG0Zn57YVgViOGoToRf8nF7d13G/TLz8Q6IkC
	NMhL2NqjrNq4Z1AHUQSOxOd1C2kYOZqt0VyEIZQ+cCtmv5y25XlBNLHAlKO4Cz510KvmlTu2+Qc
	gKnmix4M9+XuHRMGphwjRNQj85aRKwFhbw==
X-Received: by 2002:a05:600c:4ecd:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb5599a73fmr77020185e9.0.1794589979643;
        Fri, 13 Nov 2026 09:12:59 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:b5a2:ed52:66a7:3ac7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm6001643f8f.12.2026.11.13.09.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:12:58 -0800 (PST)
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
Subject: [PATCH v6 0/3] virt: bao: add Bao hypervisor IPC and I/O dispatcher drivers
Date: Fri, 13 Nov 2026 17:12:52 +0000
Message-ID: <cover.1794589639.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
  as a misc character device (read(), write(), mmap()). The channels
  are declared on the kernel command line.
- The I/O dispatcher bridges Bao's Remote I/O mechanism to a userspace
  VMM: the VMM creates each device model from /dev/bao, receives the
  frontend's MMIO accesses and completes them, with ioeventfd/irqfd
  support for the fast paths.

Changes since v5
----------------
All findings of the Sashiko review of v5 are addressed. They are all in
the I/O dispatcher; patches 1 and 3 are unchanged.
- A device model is torn down in order: dispatching stops first, every
  I/O client is stopped before any is destroyed (the ioeventfds are
  released only once their thread is gone), then the queued, in-flight
  and still pending requests are completed. The dispatcher is no longer
  paused and resumed per client, which re-queued dispatch work during
  teardown and issued hypercalls when BAO_IOCTL_CREATE_DM failed.
- IO_CLIENT_ATTACH publishes a request only once it has been copied to
  userspace, so a concurrent IO_REQUEST_COMPLETE cannot complete it
  twice.
- ioeventfds follow KVM: two of them conflict when a write could match
  both, whatever eventfd they use; a request matches only the exact
  length; reads, and writes that no ioeventfd matches, are handed to
  the VMM instead of being answered or dropped by the kernel.
- Matching a request against an I/O range rejects zero or oversized
  access widths and wrap-around.
- An irqfd consumes the eventfd counter when signaled, and deassigning
  an unknown irqfd fails with -ENOENT.
- The I/O dispatcher is 64-bit only: the Remote I/O fields did not fit
  the RV32 hypercall registers.
Also, requests already pending when a device model is created (a
frontend that started first, a VMM that restarted) are picked up at
creation instead of waiting for a notification that does not come
again.

Changes since v4
----------------
- BAO_IOCTL_CREATE_DM requires CAP_SYS_RAWIO, is refused under lockdown
  and claims a non-RAM region with request_mem_region(), mirroring
  /dev/mem. The notification line is checked against the interrupt
  controller and requested exclusively, and its mapping is never
  disposed, since it may be shared with whoever owns the line.
- Requests that cannot be delivered are completed instead of stranded.
  The requests handed to the VMM are tracked: a completion only
  provides the value, and a VMM that exits leaves nothing behind.
- ioeventfds and irqfds are bounded per device model, and a device
  model id is bound to one file descriptor at a time.
- RISC-V: the hypercall status is the SBI value (a1), and both drivers
  depend on RISCV_SBI.
- mmap goes through .mmap_prepare and only allows shared mappings;
  .compat_ioctl is set; the IPC driver never unwinds a registered
  device; bao_ipcshmem.channels= is documented in kernel-parameters.txt;
  rebased on v7.4-rc1.

Changes since v3
----------------
- No device tree (Krzysztof Kozlowski): the IPC channels are declared
  on the kernel command line and, following drivers/virt/acrn, the VMM
  creates each device model through /dev/bao (BAO_IOCTL_CREATE_DM),
  which returns a per-device-model file descriptor.
- No architecture code (Will Deacon): the hypercalls use
  arm_smccc_hvc()/arm_smccc_1_2_hvc() and sbi_ecall() from a
  driver-private header.
- The "consolidate the IPC hypercall ID" patch is folded in (Andrew
  Jones), and the ioctl type is 0xA7.

Testing
-------
Built on v7.4-rc1 with GCC 15 (W=1) for arm64, arm and riscv (RV64 and
RV32), at every commit, and with clang 21 (W=1) for arm64 and riscv.
Run-time tested under Bao v2.0.0 on QEMU aarch64 virt and QEMU riscv64
virt with the bao-demos demos: the IPC driver exchanging messages in
both directions between a Linux guest and a FreeRTOS guest, and the I/O
dispatcher with a Linux backend serving console, network and block
device models to a FreeRTOS guest and to Linux guests, including
killing and restarting the VMMs, plus a userspace test of the /dev/bao
error paths (privilege, region and line checks, duplicate ids, limits,
completions, ioeventfd and irqfd rules) run next to the live VMMs.
32-bit Arm is compile-tested only.

Open items
----------
- RISC-V: the Bao SBI extension still uses the experimental extension
  space (0x08000ba0), and the Remote I/O hypercall returns the request
  in a2-a7, which does not follow the SBI calling convention (Andrew
  Jones, v2). Changing that means a hypervisor ABI change (status in
  a0/a1, request through shared memory); the RISC-V support is
  experimental until then, or it can be split out of this series if
  preferred.
- Bao does not implement the SMCCC vendor-hypervisor UID call, so the
  drivers cannot detect the hypervisor yet; adding it is planned on the
  hypervisor side.
- The notification line is a line of the interrupt controller the device
  tree's root node points at through interrupt-parent; a guest whose
  root node has none cannot use the I/O dispatcher yet.

v5: https://lore.kernel.org/all/cover.1794038390.git.jpeixoto@osyx.tech/
v4: https://lore.kernel.org/all/cover.1790357735.git.jpeixoto@osyx.tech/
v3: https://lore.kernel.org/all/cover.1786010512.git.jpeixoto@osyx.tech/

João Peixoto (3):
  virt: bao: add IPC shared-memory driver
  virt: bao: add I/O dispatcher driver
  MAINTAINERS: add Bao hypervisor entry

 .../admin-guide/kernel-parameters.txt         |  15 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |   8 +
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/Makefile                         |   1 +
 drivers/virt/bao/Kconfig                      |   5 +
 drivers/virt/bao/Makefile                     |   4 +
 drivers/virt/bao/bao_hypercall.h              | 210 ++++++++
 drivers/virt/bao/io-dispatcher/Kconfig        |  20 +
 drivers/virt/bao/io-dispatcher/Makefile       |   4 +
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 421 ++++++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 460 +++++++++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       |  71 +++
 drivers/virt/bao/io-dispatcher/intc.c         | 186 +++++++
 drivers/virt/bao/io-dispatcher/io_client.c    | 475 ++++++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 184 +++++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 359 +++++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 330 ++++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |  16 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 421 ++++++++++++++++
 include/uapi/linux/bao.h                      | 126 +++++
 22 files changed, 3323 insertions(+)
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


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0


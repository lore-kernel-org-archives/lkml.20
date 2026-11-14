Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650456;
	b=y498maTBMYf4WcouQ3m1KpVCVKBiozV5mgPhB3nx9UaK1o33lMUSgi4wr5cZw1geNmp2
	 UOnN2HCsdS6+cbsxji+f/8cXasWc/L9OkYwkTP7c1EeIhnO/bURthxT9wXbzHao+hl1q3
	 C9zzn5oPBFqzfZm/EmXxahCjDapEu60xr2cNYpFgl3+ubGMl/eg36uf6tRyDkBoSE0jez
	 z1pTHoDqPmbgqDYH3I4nW9dZBq76OarpHI6PlZ5qlVe78TYhi8jlDIEDbqWG3dJ8+97DR
	 W+MJq8dIl2Ghr1LcdGet0EtCnmuELulrfXw5HBd22EXHx5cYYpiALDoRu2B/deiarrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fGzu6S+vtoROaIzcwoSP9XCnpNyUzhPrDB39oZSUVZM=;
	b=sljuWq73WsftFmChkF/D5MIvNj4RFjIexo7ALQ5Gc0+MytnbGsC/+fTy2vbl3yABc16q
	 gM8ttQJ5pnNLCJsy6Dem38LZn6jQkc5BXIzmzgdlhexTGdEqT+WmtWItlkyFocF2jC6uB
	 wlUF6TWqiHdhE4Zupi1Pu5rVtQ0Mfo/bLrtfuax3kl0qQBsD4Or8Vow2EE57cLHfCJKo0
	 jXSXxxPdB+bwdzuyCmQVed/VjMkpRJCgPbJw9NAhDY+/zHGN2qy70tLkmibO0eOI+2cTE
	 t096lM9wptN+ifj5fnjlfDAIBO0I/a102b2FBiHnb3CHloWDcwtRNGqfB4RGUEEh/Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XPK4EC4T;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DBF606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3DBF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XPK4EC4T
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso22763415e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794650454; x=1795255254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGzu6S+vtoROaIzcwoSP9XCnpNyUzhPrDB39oZSUVZM=;
        b=XPK4EC4ThC+p5S3EY1c/dqFMgrPXJqEKK4Mi/JHTtKsIrNY/V/i0OuEzo9kgI/Dg5J
         VXipTpQQxz5I1+yaUsgyMezGYuKaLPw8n2B3LujE8MK/fQVbVTFR+kZSUGb4mmUSjzdK
         4NshmqpF8+feWuxuMf8DFNWHgZZtoIHmB5vUXX8QqRvu5niP2BS5lFLab+aoZNAw2G5F
         VcWXrw741Dt1kmnm/lWeDuGiJXcCiCalC5GbKj0L7ZxMZhXTdC2cVElA8AZrEviwsEA+
         gDzRdrl7rdEJjI9f4iqewZF7Fwo7mEgydZNKyJsQt9wm7VUXgrdvwevvVH1sT0J9954h
         5P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650454; x=1795255254;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fGzu6S+vtoROaIzcwoSP9XCnpNyUzhPrDB39oZSUVZM=;
        b=t4PL6UA+YZlYL6z+8CciXd8Vqa9lFp5Mu6BHSB9h7bPfK+CZ2MrEQPVxHBcy1fM/eU
         0bdTurw2RlCvA/PsVzcMDetElR8IrKr8NZVViPZxRb+JnricECs5Yi4MW8YgmgY4+RKP
         kbHfA6G+8WLwAIKJ+p5l9D7yeD2LMjYnZB44inNvqCsXZa6dmu+rx1lmZV98UcbrjO5w
         /NyVb/hA1u+2wRZwkhr5Av3qRN/k0QUDDM04L0uXcsK1iQSK2Dsx3RlAJG3pN9Tr3yfG
         ogvXO3oIFnYJ8ky8BaBsDzycdxw0fx1dG/OQ3Xj7MZLMZP62sskmw01c0CrFxEEctxL8
         eC2A==
X-Forwarded-Encrypted: i=1; AL+hErHqWJ7SL9rwDD/Od2jNNQ9r8yVO8NwewgEzRjeKM7poJQMR2DF6R7LcmXKZpR3AESi2btBJIVYQGyEjeTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z87/JsBrXb+NRnWnqb0t3eTxriyQj/Z5Ms4wZr+jHbOwJoMQKyE
	6dMjJvOJmVF1gteblWrrGOnEgjH4PrN7ABah2udoo16lzwaGLVc7Xy3zcmpYxwcrTEXN
X-Gm-Gg: AYBFou0M7n+CE3HAWvZ3qFeTeMSWijMR56asDIn22s5364ncC39tSfCk3o2Jl1hIcM2
	iNCV8/bxdYTooRtxsxseLx8YayhrL0ZH1e/DvEFDP909UheFaKdIDvvosJm/v2DD/rbCqKjr36P
	9h+DOfjVJmDCpmDn4b64N3EwRGLVRUx3ceDoVSeIRSfr+EaEnM2Zx+FN8/r6sQv9zc/A/6zBdwO
	H0mJhvPdZ2WRC8WRObzfAunJtOKalkZnK1dE4ND7BgcsW6Fj1QIGozcgziEN26mTndk37f5wRcP
	fAfrNCOpfHgn1EWoMdBokIA8Paij2wOR3RkB0Sl4Wthk1z37YQgQM0ZqDXu5IZ2FPwkOOfR25k4
	iPM0KZSmkjVEpZpalmPmAcb+PCPzYYT0sTzEttu6NYOwYbNkosrGiVMJm7RwsIQPDsHSVrvvu4r
	wocp3nC2yov0BSvMj/ia8nkv8StkUKTqT93y6fSdqxPrYz1+vjCobzUkdr4vp1WRphZK6oM6eog
	TXGjz1sxAOyOfYY7724J/MZYHaWlAhPUMuyrCwlPf8qo0u7XFcgySEcbTOMjaZ6Hqf1Ro3oGYPv
	lOsLexeqZtIFxpsuyt/unALaX9Ln+Pfs+g==
X-Received: by 2002:a05:600c:1f96:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4bb55a4d990mr111281695e9.12.1794650453934;
        Sat, 14 Nov 2026 02:00:53 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:a084:d599:46a5:5c31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm16920053f8f.44.2026.11.14.02.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:00:53 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@linux.dev,
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
Subject: [PATCH v7 0/3] virt: bao: add Bao hypervisor IPC and I/O dispatcher drivers
Date: Sat, 14 Nov 2026 10:00:46 +0000
Message-ID: <cover.1794649714.git.jpeixoto@osyx.tech>
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

Changes since v6
----------------
The finding of the Sashiko review of v6 is addressed; it is in the I/O
dispatcher, and patches 1 and 3 are unchanged.
- The EPOLLHUP path of an irqfd marked it for shutdown and queued the
  shutdown work outside any lock that deassign and the device-model
  teardown take, so these could skip queueing it, flush and destroy the
  workqueue and free the device model before the work was queued.
  irqfds now follow KVM: an irqfd is active while it is on its device
  model's list, and whichever path deactivates it (EPOLLHUP, deassign or
  teardown) removes it from the list and queues its shutdown under the
  same spinlock, so the flushes always wait for every shutdown. Queueing
  the work unconditionally, as suggested, would instead let an EPOLLHUP
  re-queue a shutdown that is already running and free the irqfd twice.

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
Built on v7.4-rc1 with GCC 15 (W=1) for arm64, arm and riscv, at every
commit, and with clang 21 (W=1) for arm64 and riscv. Run-time tested
under Bao v2.0.0 on QEMU aarch64 virt and QEMU riscv64 virt with the
bao-demos demos: the IPC driver exchanging messages in both directions
between a Linux guest and a FreeRTOS guest, and the I/O dispatcher with
a Linux backend serving console, network and block device models to a
FreeRTOS guest and to Linux guests, including killing and restarting
the VMMs, plus a userspace test of the /dev/bao error paths run next to
the live VMMs, which now also races device-model teardown against
eventfd close for the irqfds. The arm64 runs used a lockdep kernel.
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

v6: https://lore.kernel.org/all/cover.1794589639.git.jpeixoto@osyx.tech/
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
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 426 ++++++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 460 +++++++++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       |  71 +++
 drivers/virt/bao/io-dispatcher/intc.c         | 186 +++++++
 drivers/virt/bao/io-dispatcher/io_client.c    | 475 ++++++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 184 +++++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 359 +++++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 350 +++++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |  16 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 421 ++++++++++++++++
 include/uapi/linux/bao.h                      | 126 +++++
 22 files changed, 3348 insertions(+)
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


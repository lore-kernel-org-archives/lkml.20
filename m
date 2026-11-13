Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589991;
	b=PwpBog3Dgp6scuDyRTOL6W86Tjn+AjOJtylINlOxO4lh5QG6xzOpzC4iQ+PrNfIIIyWJ
	 RGAki7tuKdfs3iprw2zfAd19LeA+o8g+VM7cfdLjXvAee1MtSOFVNKr3UEGmtVOmWEwMh
	 LAjjERYO+zPg1dedV/mjUW2skht+pn5S0t88DJKoTqYO1gDFYlfchbmK2mD7BLtyXmzRQ
	 WrumqvOXrrE+wIxXE+o39dfWhO6HegW9Fei6avL+FVLl2lFx7S/u5kH/R5elCdor1UVLv
	 9t53g2Tlzj4nTRuHeR/hC/A0QY+K1KsHEPiKiriGfCH0gQf/eLuy0Ocqkf14Y465DqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YXtiX0dfXoRoj8g6BMmnE32COEtlYUtROMd0iwisfqI=;
	b=p847RR8VlZ+Ssfaqx6kh7NxlYdRwtNV5Q8qRnVMQTn0+g3F0RuJb+ejsNkOwKvW/33br
	 r00TTYh/u4gNkf86EV8m+q9vDN8g7KRjJRtUGh6gn6tMyVJPa1lcCRTP79yZvHJiNCCvx
	 HCowdOngqjG2QF+I9dEf7gutor+4Aw79HwYwu8CKE7ZEYlSKCjJocNPPLVzIMiRu44dgY
	 ezI0pHh9kgtPCLAj0HOrJgfZVRZuNfe0CWAdvuVwW0BiDulpKvsXT+zAsHi4XO3s/84hr
	 quXOVbeHv+EtOby/FlO31rHonQengpsIE81RJAzvRIqVby0P3tNCiB3coCIgpHpSLCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BjQSV3R1;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA81606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA81606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BjQSV3R1
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490f38e9688so872851f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794589987; x=1795194787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YXtiX0dfXoRoj8g6BMmnE32COEtlYUtROMd0iwisfqI=;
        b=BjQSV3R1OXZbS0D5idySVJhFi7zzJWH5iX462oH9rZeaCmJNNI2JhM8msfCI3dpJHc
         B8H3DHrJ57AiB4JrjwlqrGjxzDQ6jZpfmfUwkDFK+pFkpznlKNDjN+LUIR6Nxxs4AP8A
         iV2TXVl3amD1Umd3j6e5mfRtzDqy6RtAUbAVcl5conl8ld4THzseptoGveHCrvStMW+g
         U4X8qaqORSxI5Xd+uUPEumcIDF2XLF98UFpwcW/ZhCwABzesnrOces5BfEO6joep+LpR
         IhfPp/wOqIscCrsB1lW1YyTdjns4Sx1+UVek/WGHM/tMsVDsbiRjx6p2omDnFjK78lDY
         1TsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589987; x=1795194787;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXtiX0dfXoRoj8g6BMmnE32COEtlYUtROMd0iwisfqI=;
        b=PGl73CBfKXbtdaBMv7XeRmfL8oTEEphpw19P/JlHhGLbnZSZaLMKNXSmLU2PjLoj1h
         86P+VP5riwPnFQyqJtB/xjQQbVNRzznG0x5jF6uKa+FSNnQWcZ8BUwk+qFTlx09jGFcI
         FuhchT3+xU1Af/1TuLwhiM0xTyTiNM1f2+fPiHpGHFZ+WyrH14QEsF1SRkgHC2jgETQg
         mucGi4Nx5L0SPaQBhTgXY79IjP9sM5a9ko6HB90nKEQUHZBijY/8g0gtThZ1QzcHvliH
         xS9OkTYXTxX93vfRDbBmnA07BJ6s/dt0TUuhHG/Mdag8yOYGX+pWlLHaGBfAkoF6J7Fr
         7JCg==
X-Forwarded-Encrypted: i=1; AL+hErEJJtoizsE0k6JK97LPRx+67Pzs6YzFJjRIskh1JDNj4/h1Ah4jd2m8kxDfVTlA2idh58OVDPhz/A3yD6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GEAW71r97V5GDqKumqTEreUnu8UCuJM+rRH925sGg8R5dywJt
	ZLbB4JkatSnvi/EtcU2FzUauvJliclcln+4rtdGV6y0paJHLWqOTNoMjnXlqu7Tqzo10
X-Gm-Gg: AYBFou0yewz/Mt7AO1e+kUAUKMYC4oKy73wHFVUwOodMIl5dvoJpr2jXk+ywPtXOH+I
	3mQPz8oO4AvN2+R9pNplifQpjaNyd8tnXOc/hIp8xruifysNZ/zQ7xiymK9gjoOyRrpN6VC5W6x
	kWyDA9HfpbreKWXO5LHAYThA2EzSzWBnDIAWrWMMdWB1Yc7ej9M7C+dAe0lkhou8xZqVIq0FR4r
	5GyLEh+yi+Tht6XmRNCkz5eZIiqOAdVX+usbi0eJ11VHIQ6/ALF37bnQLKPGCaormWBaeZClUWv
	I+Sx4qrMptUmR2k8y1+BH0UCGoLKfYxBmSgQEOM33dHmzZP9oxI3OjLnaJVEz8dV14nhVxNQK1a
	XzVDbedCyP2JAIhLQYbcYutUlx4VFgILtH1QBz4UF8gBM3lrq2otdadfk5ejdJtIl6Ynm0jJPlB
	DoLkgGUOfP6Mfnf+45mnixsqrIYEzbFd3pnZFs6E+bVw+Z7bFu5zRCkxkEP9J0rqgYH9aU308x3
	WqmkxkAEDeK4ddCoHW2gEdG7OHmywmyv2asPaDRcV0O3GDvlFWkSAVJIxmKn0pyffGTh+FjKcT9
	D9iS1QjfgpmDQnJ1erewyFjjedf9uxdBAs123dik6cJ3ho5FQk30wzI=
X-Received: by 2002:a05:6000:401f:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-49c6ff8142amr7140034f8f.13.1794589986039;
        Fri, 13 Nov 2026 09:13:06 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:b5a2:ed52:66a7:3ac7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm6001643f8f.12.2026.11.13.09.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:13:05 -0800 (PST)
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
Subject: [PATCH v6 2/3] virt: bao: add I/O dispatcher driver
Date: Fri, 13 Nov 2026 17:12:54 +0000
Message-ID: <4e725d9d94cfd425ac0ff4352b21f7bf7b7a1296.1794589639.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794589639.git.jpeixoto@osyx.tech>
References: <cover.1794589639.git.jpeixoto@osyx.tech>
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

Add the Bao I/O dispatcher, used by backend VMs to service I/O on behalf
of frontend guests. It bridges Bao's Remote I/O mechanism to userspace
VirtIO backend device models.

The set of device models a backend serves is a software contract between
the hypervisor and the userspace VMM, not hardware, so it is not
described in the device tree. Following the model used by other
hypervisor drivers (e.g. drivers/virt/acrn), the driver exposes a single
/dev/bao control device; the VMM creates each device model from its own
configuration with the BAO_IOCTL_CREATE_DM ioctl, which returns a per-DM
file descriptor. Each device model has a contiguous shared-memory region
for exchanging I/O buffers with its frontend and an interrupt the
hypervisor uses to signal pending requests; both are provided by the VMM
at creation time. The interrupt is given as a line of the system's root
interrupt controller (the one the device tree's root node points at
through interrupt-parent) and mapped by the driver. Userspace then
drives the device model through a set of ioctls on that descriptor.

Creating a device model maps a physical region chosen by the VMM into
userspace and claims an interrupt line, so BAO_IOCTL_CREATE_DM requires
CAP_SYS_RAWIO, is refused under lockdown (LOCKDOWN_DEV_MEM), rejects
regions overlapping System RAM and claims the region with
request_mem_region(), mirroring /dev/mem. The line is checked against
the sources the interrupt controller declares, since irqchip drivers
trust the specifiers they are given, and is requested exclusively, so
one already in use cannot be taken over. A DM id can only be bound to
one descriptor at a time.

The queued requests, ioeventfds and irqfds of a device model are
bounded, and a request that cannot be delivered (no client, full queue,
teardown) is completed back to the hypervisor so the frontend never
hangs. The requests handed to userspace are tracked until it completes
them: a completion only takes the value from userspace, and the
requests a VMM leaves behind when it exits, like those still pending in
the hypervisor, are completed by the kernel when the device model is
released. As with KVM, a write that no ioeventfd matches is handed to
the VMM rather than dropped.

The Remote I/O hypercall returns the pending request in x1-x6 on top of
the status in x0, so on arm64 it is issued as an SMCCC v1.2 call through
arm_smccc_1_2_hvc(); no architecture code is needed. The request fields
are 64-bit and 32-bit Arm has no SMCCC v1.2 helper, so the I/O
dispatcher is limited to arm64 and 64-bit RISC-V. On RISC-V the request
comes back in a2-a7 through the (experimental) Bao SBI extension, which
sbi_ecall() cannot express, hence the local ecall helper. The extension
always succeeds from the SBI point of view and reports the hypercall
status as the SBI value, so that is where both helpers take it from.

Co-developed-by: José Martins <jose@osyx.tech>
Signed-off-by: José Martins <jose@osyx.tech>
Co-developed-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v6:
- Tear the DM down in order (Sashiko review): stop dispatching first,
  then the irqfds; stop every I/O client before destroying any, and
  release the ioeventfds only once their kernel thread has stopped;
  then complete the queued and in-flight requests. The dispatcher is no
  longer paused and resumed per client, which re-queued dispatch work
  mid-teardown and issued ASK hypercalls when BAO_IOCTL_CREATE_DM
  failed. The requests still pending in the hypervisor are completed
  only when the DM file descriptor is released.
- IO_CLIENT_ATTACH: allocate the tracking entry first and publish it only
  once the request has been copied to userspace, so a concurrent
  IO_REQUEST_COMPLETE cannot complete it twice (Sashiko review).
- ioeventfd, as with KVM (Sashiko review): two ioeventfds with the same
  address, length and an overlapping data match conflict whatever
  eventfd they use; a request matches only the exact length; reads, and
  writes that no ioeventfd matches, are forwarded to the VMM instead of
  being completed by the kernel.
- Reject zero or oversized access widths and wrap-around when matching
  a request against an I/O range (Sashiko review).
- irqfd: consume the eventfd counter when it is signaled; return
  -ENOENT when deassigning an unknown irqfd (Sashiko review).
- Limit the driver to arm64 and RV64: the Remote I/O fields are 64-bit
  and were truncated in the RV32 hypercall registers and xarray indices
  (Sashiko review).
- Look for pending requests once when a DM is created: they may have
  been raised before its line was requested (a VMM restart, a frontend
  that started first). The file descriptor is installed only after
  that, so a failed BAO_IOCTL_CREATE_DM issues no hypercall.
v5:
- BAO_IOCTL_CREATE_DM requires CAP_SYS_RAWIO, is refused under lockdown
  (LOCKDOWN_DEV_MEM), validates the shared-memory region (non-empty,
  page-aligned, not wrapping, not overlapping System RAM) and claims it
  with request_mem_region() (Sashiko review).
- Check the notification line against the sources the root interrupt
  controller declares (riscv,ndev for a PLIC, riscv,num-sources for an
  APLIC, SPIs 0-987 for a GIC) before mapping it: irqchip drivers do not
  validate specifiers, and an out-of-range PLIC line wrote past the end
  of its enable-state array. Request the line exclusively (Sashiko
  review).
- Never dispose the IRQ mapping. irq_create_of_mapping() returns the
  existing mapping of a line that is already mapped without counting its
  users, so disposing it after a failed request_irq() freed the
  interrupt of the DM or driver owning the line. A leftover mapping is
  reused when the same line is mapped again.
- Refuse a second file descriptor for a DM id in use (-EEXIST).
- Keep fetching after a request cannot be delivered: complete it and
  return the pending count instead of an error (Sashiko review).
- Bound the ioeventfds and irqfds per DM (256 each, -ENOSPC); validate
  their flags and the reserved field (Sashiko review).
- Complete the requests still queued when a client is destroyed instead
  of dropping them (Sashiko review).
- Track the requests handed to userspace: IO_REQUEST_COMPLETE only
  completes a read or write handed out on that file descriptor (-ENOENT
  otherwise) and only takes the value from userspace, and the requests
  a VMM leaves behind when it exits are completed on release. Userspace
  could previously issue an ASK through it, which lost a request.
- RISC-V: take the Remote I/O hypercall status from a1, where Bao
  returns it, instead of the always-successful SBI error in a0. An ASK
  with nothing pending (every DM teardown, or a racing notification) was
  taken as a success and its stale registers dispatched as a request.
  Leave the context untouched on failure on both architectures.
- ioeventfd deassign also matches the data match and returns -ENOENT
  when nothing matches; irqfd passes the DM id as u32 and uses
  key_to_poll().
- Kconfig: depend on RISCV_SBI instead of RISCV.
- Use .mmap_prepare and refuse private mappings; set .compat_ioctl to
  compat_ptr_ioctl, the structures having the same layout for 32-bit
  userspace.
- DM_GET_INFO and IO_CLIENT_ATTACH are _IOR (they only write to
  userspace); define the request operations (BAO_IO_WRITE, BAO_IO_READ)
  in the UAPI header; reserve 0xA7 00-0F instead of the whole type; use
  fixed_size_llseek(); copy the ioctl arguments on the stack; pr_fmt
  prefix for the messages.
- Rebase on v7.4-rc1; use kzalloc_obj().
v4:
- Drop the binding and the platform device: a single /dev/bao control device;
  BAO_IOCTL_CREATE_DM takes {shmem_addr, shmem_size, id, irq} from the VMM
  and returns a per-DM anonymous-inode fd; the DM lives as long as the fd
  (Krzysztof Kozlowski; also removes the unbind use-after-free).
- Resolve the notification line against the device tree's root interrupt
  parent instead of binding to a node (1-cell PLIC, 2-cell APLIC and 3/4-cell
  GIC specifiers).
- Issue the Remote I/O hypercall with arm_smccc_1_2_hvc() on arm64 (the
  request is returned in x1-x6, an SMCCC v1.2 call); no arch/ code. RISC-V
  keeps a local ecall since sbi_ecall() only exposes a0/a1. 32-bit Arm is
  not supported by this driver for now (no SMCCC v1.2 helper) (Will Deacon).
- UAPI: ioctl type 0xA7 (0xA6 is taken by alloc_tag since 7.3-rc1); struct
  bao_dm_info reordered to remove implicit padding, ioeventfd and irqfd flag
  values exported, ioeventfd fd signed, linux/ioctl.h included.
- Sashiko review: take the DM id from the fd, not from userspace; hold the
  irqfd lock across vfs_poll(), single-shot cleanup work and flush before
  destroy_workqueue(); per-DM interrupt handler; persistent request_irq()
  name; return after ioeventfd deassign and match the full {fd, addr, len};
  cap queued requests; propagate -ERESTARTSYS; free pending requests on
  destroy; drop the unused kernel mapping of the shared memory; complete
  requests that cannot be delivered so the frontend does not hang.
- Found while testing: the kernel thread only exits through kthread_stop();
  per-DM workqueue/work instead of static arrays (no more 16-DM limit);
  WQ_PERCPU on the dispatcher workqueue; fix the range-list walk type in
  bao_io_client_destroy(); module renamed to bao_io_dispatcher; ERR_PTR()
  errors from bao_dm_create().

 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 drivers/virt/bao/Kconfig                      |   2 +
 drivers/virt/bao/Makefile                     |   1 +
 drivers/virt/bao/bao_hypercall.h              | 113 +++++
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
 include/uapi/linux/bao.h                      | 126 +++++
 15 files changed, 2754 insertions(+)
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
 create mode 100644 include/uapi/linux/bao.h

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index dbe462040999..a91f6a152dff 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -349,6 +349,8 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:luzmaximilian@gmail.com>
 0xA6  00-0F  uapi/linux/alloc_tag.h                                    Memory allocation profiling
                                                                        <mailto:surenb@google.com>
+0xA7  00-0F  uapi/linux/bao.h                                          Bao hypervisor
+                                                                       <mailto:info@bao-project.org>
 0xAA  00-3F  linux/uapi/linux/userfaultfd.h
 0xAB  00-1F  linux/nbd.h
 0xAC  00-1F  linux/raw.h
diff --git a/drivers/virt/bao/Kconfig b/drivers/virt/bao/Kconfig
index 4f7929d57475..ab08a20db8c4 100644
--- a/drivers/virt/bao/Kconfig
+++ b/drivers/virt/bao/Kconfig
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 source "drivers/virt/bao/ipcshmem/Kconfig"
+
+source "drivers/virt/bao/io-dispatcher/Kconfig"
diff --git a/drivers/virt/bao/Makefile b/drivers/virt/bao/Makefile
index 68f5d3f282c4..c463f04cf206 100644
--- a/drivers/virt/bao/Makefile
+++ b/drivers/virt/bao/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_BAO_SHMEM) += ipcshmem/
+obj-$(CONFIG_BAO_IO_DISPATCHER) += io-dispatcher/
diff --git a/drivers/virt/bao/bao_hypercall.h b/drivers/virt/bao/bao_hypercall.h
index 7a68c29feb48..498bc34cec95 100644
--- a/drivers/virt/bao/bao_hypercall.h
+++ b/drivers/virt/bao/bao_hypercall.h
@@ -24,6 +24,33 @@
 /* IPC through shared-memory hypercall ID */
 #define BAO_IPCSHMEM_HYPERCALL_ID 0x1
 
+/* Remote I/O hypercall ID */
+#define BAO_REMIO_HYPERCALL_ID 0x2
+
+/**
+ * struct bao_remio_hypercall_ctx - Remote I/O hypercall context
+ * @dm_id: Device model identifier
+ * @addr: Target address
+ * @op: Operation code
+ * @value: Value to read/write
+ * @access_width: Access width in bytes
+ * @request_id: Request identifier
+ * @npend_req: Number of pending requests
+ *
+ * @dm_id, @addr, @op, @value and @request_id are passed to the hypervisor;
+ * @addr, @op, @value, @access_width, @request_id and @npend_req are updated
+ * with the values it returns.
+ */
+struct bao_remio_hypercall_ctx {
+	u64 dm_id;
+	u64 addr;
+	u64 op;
+	u64 value;
+	u64 access_width;
+	u64 request_id;
+	u64 npend_req;
+};
+
 #if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
 
 #include <linux/arm-smccc.h>
@@ -55,6 +82,44 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
 	return res.a0;
 }
 
+#ifdef CONFIG_ARM64
+/**
+ * bao_remio_hypercall - Issue a Remote I/O hypercall
+ * @ctx: Hypercall context, updated with the values returned by the hypervisor
+ *
+ * The hypervisor returns the request in x1-x6 on top of the status in x0,
+ * which is only expressible with an SMCCC v1.2 call.
+ *
+ * Return: The hypervisor status code, 0 on success.
+ */
+static inline unsigned long
+bao_remio_hypercall(struct bao_remio_hypercall_ctx *ctx)
+{
+	struct arm_smccc_1_2_regs args = {
+		.a0 = BAO_HYPERCALL_FID(BAO_REMIO_HYPERCALL_ID),
+		.a1 = ctx->dm_id,
+		.a2 = ctx->addr,
+		.a3 = ctx->op,
+		.a4 = ctx->value,
+		.a5 = ctx->request_id,
+	};
+	struct arm_smccc_1_2_regs res;
+
+	arm_smccc_1_2_hvc(&args, &res);
+	if (res.a0)
+		return res.a0;
+
+	ctx->addr = res.a1;
+	ctx->op = res.a2;
+	ctx->value = res.a3;
+	ctx->access_width = res.a4;
+	ctx->request_id = res.a5;
+	ctx->npend_req = res.a6;
+
+	return 0;
+}
+#endif /* CONFIG_ARM64 */
+
 #elif defined(CONFIG_RISCV)
 
 #include <asm/sbi.h>
@@ -92,6 +157,54 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
 	return ret.value;
 }
 
+#ifdef CONFIG_64BIT
+/**
+ * bao_remio_hypercall - Issue a Remote I/O hypercall
+ * @ctx: Hypercall context, updated with the values returned by the hypervisor
+ *
+ * The request fields are 64-bit, so the I/O dispatcher, the only user, is
+ * limited to RV64.
+ *
+ * The hypervisor returns the request in a2-a7 on top of the SBI error in a0
+ * and the hypercall status in a1, which sbi_ecall() cannot express as it only
+ * exposes a0 and a1.
+ *
+ * Return: The hypervisor status code, 0 on success, or the SBI error if the
+ * extension is not implemented.
+ */
+static inline unsigned long
+bao_remio_hypercall(struct bao_remio_hypercall_ctx *ctx)
+{
+	register unsigned long a0 asm("a0") = ctx->dm_id;
+	register unsigned long a1 asm("a1") = ctx->addr;
+	register unsigned long a2 asm("a2") = ctx->op;
+	register unsigned long a3 asm("a3") = ctx->value;
+	register unsigned long a4 asm("a4") = ctx->request_id;
+	register unsigned long a5 asm("a5") = 0;
+	register unsigned long a6 asm("a6") = BAO_REMIO_HYPERCALL_ID;
+	register unsigned long a7 asm("a7") = BAO_SBI_EXT_ID;
+
+	asm volatile("ecall"
+		     : "+r"(a0), "+r"(a1), "+r"(a2), "+r"(a3), "+r"(a4),
+		       "+r"(a5), "+r"(a6), "+r"(a7)
+		     :
+		     : "memory");
+	if (a0)
+		return a0;
+	if (a1)
+		return a1;
+
+	ctx->addr = a2;
+	ctx->op = a3;
+	ctx->value = a4;
+	ctx->access_width = a5;
+	ctx->request_id = a6;
+	ctx->npend_req = a7;
+
+	return 0;
+}
+#endif /* CONFIG_64BIT */
+
 #endif
 
 #endif /* __BAO_HYPERCALL_H */
diff --git a/drivers/virt/bao/io-dispatcher/Kconfig b/drivers/virt/bao/io-dispatcher/Kconfig
new file mode 100644
index 000000000000..09e2a692b914
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0
+config BAO_IO_DISPATCHER
+	tristate "Bao Hypervisor I/O Dispatcher"
+	depends on ARM64 || (RISCV_SBI && 64BIT)
+	select EVENTFD
+	help
+	  The Bao I/O Dispatcher is a kernel module for backend Linux VMs
+	  running under the Bao hypervisor. It establishes the connection
+	  between the Remote I/O system (Bao's mechanism for forwarding
+	  I/O requests from frontend VMs to the backend VMs) and the
+	  VirtIO backend device.
+
+	  This provides a unified API to support various VirtIO backends,
+	  allowing Bao guests to perform I/O through the hypervisor
+	  transparently.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called bao_io_dispatcher.
+
+	  If unsure, say N.
diff --git a/drivers/virt/bao/io-dispatcher/Makefile b/drivers/virt/bao/io-dispatcher/Makefile
new file mode 100644
index 000000000000..b5fb18577bca
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_BAO_IO_DISPATCHER) += bao_io_dispatcher.o
+bao_io_dispatcher-y := driver.o dm.o intc.o io_client.o io_dispatcher.o \
+		       ioeventfd.o irqfd.o
diff --git a/drivers/virt/bao/io-dispatcher/bao_drv.h b/drivers/virt/bao/io-dispatcher/bao_drv.h
new file mode 100644
index 000000000000..90ef89689b11
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/bao_drv.h
@@ -0,0 +1,421 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Provides some definitions for the Bao Hypervisor modules
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#ifndef __BAO_DRV_H
+#define __BAO_DRV_H
+
+#include <linux/bao.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/rwsem.h>
+#include <linux/sched.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+#include <linux/xarray.h>
+#include "../bao_hypercall.h"
+
+/* Room for a "bao-" prefixed name and a full u32 DM id. */
+#define BAO_NAME_MAX_LEN 32
+
+/*
+ * Upper bound on I/O requests queued but not yet consumed by a client. Caps the
+ * memory a misbehaving frontend can pin by flooding the backend with requests.
+ */
+#define BAO_IO_CLIENT_MAX_REQUESTS 1024
+
+/*
+ * Upper bounds on the ioeventfds and irqfds a DM can register, so userspace
+ * cannot grow the lists without limit (a device model needs a few per queue).
+ */
+#define BAO_IOEVENTFD_MAX 256
+#define BAO_IRQFD_MAX 256
+
+/* Bit in &bao_io_client.flags: the client is being torn down. */
+#define BAO_IO_CLIENT_DESTROYING 0U
+
+/*
+ * Returned by a kernel client's handler that handed the request to the control
+ * client instead of serving it: the request must not be completed.
+ */
+#define BAO_IO_REQUEST_FORWARDED 1
+
+struct bao_dm;
+struct bao_io_client;
+
+typedef int (*bao_io_client_handler_t)(struct bao_io_client *client,
+				       struct bao_virtio_request *req);
+typedef void (*bao_intc_handler_t)(struct bao_dm *dm);
+
+/*
+ * Operations of the Remote I/O hypercall that never reach userspace, on top of
+ * the BAO_IO_WRITE and BAO_IO_READ requests of the UAPI: fetch the next pending
+ * request, and notify the frontend of a completed backend operation.
+ */
+#define BAO_IO_ASK 2
+#define BAO_IO_NOTIFY 3
+
+/**
+ * struct bao_io_client - Bao I/O client
+ * @name: Client name
+ * @dm: The DM that the client belongs to
+ * @list: List node for this bao_io_client
+ * @is_control: If this client is the control client
+ * @flags: Flags (BAO_IO_CLIENT_*)
+ * @virtio_requests: List of pending I/O requests
+ * @nr_requests: Number of entries in @virtio_requests
+ * @virtio_requests_lock: Protects @virtio_requests and @nr_requests
+ * @range_list: I/O ranges
+ * @range_lock: Protects @range_list
+ * @handler: I/O request handler for this client
+ * @thread: Kernel thread executing the handler
+ * @wq: Wait queue used for thread parking
+ * @priv: Private data for the handler
+ */
+struct bao_io_client {
+	char name[BAO_NAME_MAX_LEN];
+	struct bao_dm *dm;
+	struct list_head list;
+	bool is_control;
+	unsigned long flags;
+	struct list_head virtio_requests;
+	unsigned int nr_requests;
+	/* protects virtio_requests and nr_requests */
+	struct mutex virtio_requests_lock;
+	struct list_head range_list;
+	/* protects range_list */
+	struct rw_semaphore range_lock;
+	bao_io_client_handler_t handler;
+	struct task_struct *thread;
+	wait_queue_head_t wq;
+	void *priv;
+};
+
+/**
+ * struct bao_dm - Bao backend device model (DM)
+ * @info: DM information (id, shmem_addr, shmem_size, irq)
+ * @name: Backing storage for the control client name
+ * @ioeventfds: List of all ioeventfds
+ * @nr_ioeventfds: Number of entries in @ioeventfds
+ * @ioeventfds_lock: Protects @ioeventfds and @nr_ioeventfds
+ * @ioeventfd_client: Ioeventfd client
+ * @irqfds: List of all irqfds
+ * @nr_irqfds: Number of entries in @irqfds
+ * @irqfds_lock: Protects @irqfds and @nr_irqfds
+ * @irqfd_server: Workqueue responsible for irqfd handling
+ * @io_clients_lock: Protects @io_clients
+ * @io_clients: List of all bao_io_client
+ * @control_client: Control client
+ * @inflight: Requests handed to userspace and not completed yet, indexed by
+ *	      request id
+ * @io_wq: Workqueue dispatching the I/O requests of this DM
+ * @io_work: Work item queued on @io_wq by the notification interrupt
+ * @intc_handler: Per-DM interrupt controller dispatch callback
+ * @intc_name: Backing storage for the request_irq() name
+ * @virq: Linux interrupt number of the hypervisor notification line
+ */
+struct bao_dm {
+	struct bao_dm_info info;
+	char name[BAO_NAME_MAX_LEN];
+
+	struct list_head ioeventfds;
+	unsigned int nr_ioeventfds;
+	/* protects ioeventfds and nr_ioeventfds */
+	struct mutex ioeventfds_lock;
+	struct bao_io_client *ioeventfd_client;
+
+	struct list_head irqfds;
+	unsigned int nr_irqfds;
+	/* protects irqfds and nr_irqfds */
+	struct mutex irqfds_lock;
+	struct workqueue_struct *irqfd_server;
+
+	/* protects io_clients */
+	struct rw_semaphore io_clients_lock;
+	struct list_head io_clients;
+	struct bao_io_client *control_client;
+	struct xarray inflight;
+
+	struct workqueue_struct *io_wq;
+	struct work_struct io_work;
+
+	bao_intc_handler_t intc_handler;
+	char intc_name[BAO_NAME_MAX_LEN];
+	unsigned int virq;
+};
+
+/**
+ * struct bao_io_range - Represents a range of I/O addresses
+ * @list: List node for linking multiple ranges
+ * @start: Start address of the range
+ * @end: End address of the range (inclusive)
+ */
+struct bao_io_range {
+	struct list_head list;
+	u64 start;
+	u64 end;
+};
+
+/**
+ * bao_dm_create - Create a backend device model (DM)
+ * @info: DM information (id, shmem_addr, shmem_size, irq)
+ *
+ * Return: Pointer to the created DM on success, ERR_PTR() on error.
+ */
+struct bao_dm *bao_dm_create(struct bao_dm_info *info);
+
+/**
+ * bao_dm_create_fd - Create a DM and bind it to a new file descriptor
+ * @info: DM information (id, shmem_addr, shmem_size, irq)
+ *
+ * Instantiates a DM, registers its interrupt and installs an anonymous inode so
+ * the DM lives exactly as long as the returned descriptor is open. Invoked from
+ * the /dev/bao control device on BAO_IOCTL_CREATE_DM.
+ *
+ * Return: A new file descriptor on success, negative error code on failure.
+ */
+int bao_dm_create_fd(struct bao_dm_info *info);
+
+/**
+ * bao_dm_destroy - Destroy a backend device model (DM)
+ * @dm: DM to be destroyed
+ */
+void bao_dm_destroy(struct bao_dm *dm);
+
+/**
+ * bao_io_client_create - Create a backend I/O client
+ * @dm: DM this client belongs to
+ * @handler: I/O client handler for requests
+ * @data: Private data passed to the handler
+ * @is_control: True if this is the control client
+ * @name: Name of the I/O client
+ *
+ * Return: Pointer to the created I/O client, NULL on failure.
+ */
+struct bao_io_client *bao_io_client_create(struct bao_dm *dm,
+					   bao_io_client_handler_t handler,
+					   void *data, bool is_control,
+					   const char *name);
+
+/**
+ * bao_io_clients_destroy - Destroy all I/O clients of a DM
+ * @dm: DM whose I/O clients are to be destroyed
+ */
+void bao_io_clients_destroy(struct bao_dm *dm);
+
+/**
+ * bao_io_client_attach - Wait until an I/O client has requests to process
+ * @client: I/O client to attach
+ *
+ * Sleeps until a request is queued on @client, the client is being destroyed
+ * or, for a kernel client, its thread is asked to stop.
+ *
+ * Return: 0 when requests are pending, -ERESTARTSYS if interrupted by a
+ * signal, -EPERM if the client is going away.
+ */
+int bao_io_client_attach(struct bao_io_client *client);
+
+/**
+ * bao_io_client_range_add - Add an I/O range to monitor in a client
+ * @client: I/O client
+ * @start: Start address of the range
+ * @end: End address of the range (inclusive)
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_io_client_range_add(struct bao_io_client *client, u64 start, u64 end);
+
+/**
+ * bao_io_client_range_del - Remove an I/O range from a client
+ * @client: I/O client
+ * @start: Start address of the range
+ * @end: End address of the range (inclusive)
+ */
+void bao_io_client_range_del(struct bao_io_client *client, u64 start, u64 end);
+
+/**
+ * bao_io_client_request - Retrieve the oldest I/O request from a client
+ * @client: I/O client
+ * @req: Pointer to virtio request structure to fill
+ *
+ * Return: 0 on success, -EAGAIN if no request is available.
+ */
+int bao_io_client_request(struct bao_io_client *client,
+			  struct bao_virtio_request *req);
+
+/**
+ * bao_io_client_push_request - Push an I/O request into a client
+ * @client: I/O client
+ * @req: I/O request to push
+ *
+ * Return: True if a request was pushed, false otherwise.
+ */
+bool bao_io_client_push_request(struct bao_io_client *client,
+				struct bao_virtio_request *req);
+
+/**
+ * bao_io_client_pop_request - Pop the oldest I/O request from a client
+ * @client: I/O client
+ * @req: Buffer to store the popped request
+ *
+ * Return: True if a request was popped, false if the list was empty.
+ */
+bool bao_io_client_pop_request(struct bao_io_client *client,
+			       struct bao_virtio_request *req);
+
+/**
+ * bao_io_client_forward - Hand a request over to the control client
+ * @dm: DM that the I/O request belongs to
+ * @req: I/O request to forward
+ *
+ * Used by a kernel client for a request it does not serve, so that userspace
+ * handles it as if no kernel client had claimed the address.
+ *
+ * Return: BAO_IO_REQUEST_FORWARDED on success, negative error code if the
+ * request could not be queued.
+ */
+int bao_io_client_forward(struct bao_dm *dm, struct bao_virtio_request *req);
+
+/**
+ * bao_io_client_find - Find the I/O client for a given request
+ * @dm: DM that the I/O request belongs to
+ * @req: I/O request to locate
+ *
+ * Return: Pointer to the I/O client handling the request, NULL if none found.
+ */
+struct bao_io_client *bao_io_client_find(struct bao_dm *dm,
+					 struct bao_virtio_request *req);
+
+/**
+ * bao_ioeventfd_client_init - Initialize the Ioeventfd client for a DM
+ * @dm: DM that the Ioeventfd client belongs to
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_ioeventfd_client_init(struct bao_dm *dm);
+
+/**
+ * bao_ioeventfd_client_destroy - Destroy the Ioeventfd client for a DM
+ * @dm: DM that the Ioeventfd client belongs to
+ */
+void bao_ioeventfd_client_destroy(struct bao_dm *dm);
+
+/**
+ * bao_ioeventfd_client_config - Configure an Ioeventfd client
+ * @dm: DM that the Ioeventfd client belongs to
+ * @config: Ioeventfd configuration to apply
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_ioeventfd_client_config(struct bao_dm *dm,
+				struct bao_ioeventfd *config);
+
+/**
+ * bao_irqfd_server_init - Initialize the Irqfd server for a DM
+ * @dm: DM that the Irqfd server belongs to
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_irqfd_server_init(struct bao_dm *dm);
+
+/**
+ * bao_irqfd_server_destroy - Destroy the Irqfd server for a DM
+ * @dm: DM that the Irqfd server belongs to
+ */
+void bao_irqfd_server_destroy(struct bao_dm *dm);
+
+/**
+ * bao_irqfd_server_config - Configure an Irqfd server
+ * @dm: DM that the Irqfd server belongs to
+ * @config: Irqfd configuration to apply
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_irqfd_server_config(struct bao_dm *dm, struct bao_irqfd *config);
+
+/**
+ * bao_io_dispatcher_init - Initialize the I/O Dispatcher for a DM
+ * @dm: DM to initialize on the I/O Dispatcher
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_io_dispatcher_init(struct bao_dm *dm);
+
+/**
+ * bao_io_dispatcher_destroy - Destroy the I/O Dispatcher for a DM
+ * @dm: DM to destroy on the I/O Dispatcher
+ *
+ * Stops dispatching and waits for a dispatch in progress to finish. The
+ * notification interrupt must be freed, or not requested yet, so that it
+ * cannot queue new work.
+ */
+void bao_io_dispatcher_destroy(struct bao_dm *dm);
+
+/**
+ * bao_dispatch_io - Acquire and dispatch one I/O request from the hypervisor
+ * @dm: DM whose I/O clients will handle the request
+ *
+ * A request that cannot be handed to a client is completed back to the
+ * hypervisor with an error so the frontend is resumed, and fetching goes on.
+ *
+ * Return: The number of requests still pending, or a negative error code when
+ * no request could be fetched.
+ */
+int bao_dispatch_io(struct bao_dm *dm);
+
+/**
+ * bao_io_request_complete_error - Complete a request the backend cannot serve
+ * @dm: DM owning the request
+ * @req: The request that could not be handed to userspace or a handler
+ *
+ * Completes @req back to the hypervisor with a zero value so the frontend
+ * making the I/O access is resumed instead of hanging forever.
+ */
+void bao_io_request_complete_error(struct bao_dm *dm,
+				   struct bao_virtio_request *req);
+
+/**
+ * bao_io_dispatcher_complete_pending - Complete the requests left in the hypervisor
+ * @dm_id: Id of a DM that has been torn down
+ *
+ * Fetches the requests that are still pending for @dm_id and completes them,
+ * so the frontends waiting on them are resumed once no backend serves the DM.
+ */
+void bao_io_dispatcher_complete_pending(u32 dm_id);
+
+/**
+ * bao_intc_init - Register the interrupt controller for a DM
+ * @dm: DM that the interrupt controller belongs to
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_intc_init(struct bao_dm *dm);
+
+/**
+ * bao_intc_destroy - Unregister the interrupt controller for a DM
+ * @dm: DM that the interrupt controller belongs to
+ */
+void bao_intc_destroy(struct bao_dm *dm);
+
+/**
+ * bao_intc_setup_handler - Setup the interrupt controller handler
+ * @dm: DM that the interrupt controller belongs to
+ * @handler: Function pointer to the interrupt handler
+ */
+void bao_intc_setup_handler(struct bao_dm *dm, bao_intc_handler_t handler);
+
+/**
+ * bao_intc_remove_handler - Remove the interrupt controller handler
+ * @dm: DM that the interrupt controller belongs to
+ */
+void bao_intc_remove_handler(struct bao_dm *dm);
+
+#endif /* __BAO_DRV_H */
diff --git a/drivers/virt/bao/io-dispatcher/dm.c b/drivers/virt/bao/io-dispatcher/dm.c
new file mode 100644
index 000000000000..44f4eb96445d
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/dm.c
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor Backend Device Model (DM)
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/anon_inodes.h>
+#include <linux/capability.h>
+#include <linux/err.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/ioport.h>
+#include <linux/mm.h>
+#include <linux/security.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/uaccess.h>
+#include <linux/xarray.h>
+#include "bao_drv.h"
+
+/*
+ * The driver is 64-bit only (Kconfig), so the u64 values of the UAPI fit the
+ * hypercall registers, phys_addr_t, size_t and the xarray indices.
+ */
+static_assert(sizeof(unsigned long) == sizeof(u64) &&
+	      sizeof(phys_addr_t) == sizeof(u64));
+
+/*
+ * Ids of the DMs that have a file descriptor. A DM id names a device model of
+ * the hypervisor, which must be served by a single descriptor: two would both
+ * fetch and complete its requests.
+ */
+static DEFINE_XARRAY(bao_dm_ids);
+
+static void bao_dm_inflight_complete_all(struct bao_dm *dm)
+{
+	struct bao_virtio_request *req;
+	unsigned long id;
+
+	xa_for_each(&dm->inflight, id, req) {
+		xa_erase(&dm->inflight, id);
+		bao_io_request_complete_error(dm, req);
+		kfree(req);
+	}
+	xa_destroy(&dm->inflight);
+}
+
+static int bao_dm_release(struct inode *inode, struct file *filp)
+{
+	struct bao_dm *dm = filp->private_data;
+	struct bao_dm_info info;
+
+	if (WARN_ON_ONCE(!dm))
+		return 0;
+
+	info = dm->info;
+	filp->private_data = NULL;
+	bao_intc_destroy(dm);
+	bao_dm_destroy(dm);
+	/*
+	 * Nothing serves the DM any more: complete what its frontend still has
+	 * pending in the hypervisor, before the id can be reused.
+	 */
+	bao_io_dispatcher_complete_pending(info.id);
+	release_mem_region(info.shmem_addr, info.shmem_size);
+	xa_erase(&bao_dm_ids, info.id);
+
+	return 0;
+}
+
+static long bao_dm_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	struct bao_dm *dm = filp->private_data;
+	int rc;
+
+	if (WARN_ON_ONCE(!dm))
+		return -ENODEV;
+
+	switch (cmd) {
+	case BAO_IOCTL_DM_GET_INFO: {
+		struct bao_dm_info info;
+
+		/* Zero-fill so nothing uninitialized is leaked to userspace. */
+		memset(&info, 0, sizeof(info));
+		info.shmem_addr = dm->info.shmem_addr;
+		info.shmem_size = dm->info.shmem_size;
+		info.id = dm->info.id;
+		info.irq = dm->info.irq;
+
+		if (copy_to_user((void __user *)arg, &info, sizeof(info)))
+			return -EFAULT;
+
+		rc = 0;
+		break;
+	}
+	case BAO_IOCTL_IO_CLIENT_ATTACH: {
+		struct bao_virtio_request req, *inflight;
+
+		if (!dm->control_client) {
+			rc = -ENOENT;
+			break;
+		}
+
+		rc = bao_io_client_attach(dm->control_client);
+		if (rc)
+			break;
+
+		rc = bao_io_client_request(dm->control_client, &req);
+		if (rc)
+			break;
+
+		/*
+		 * The request is tracked until userspace completes it, so that
+		 * one the VMM never completes (it exited or crashed) is still
+		 * completed when the DM goes away instead of leaving the
+		 * frontend vCPU waiting for it forever. It is off the queue
+		 * now: if it cannot be handed out, complete it with an error so
+		 * the frontend is resumed.
+		 */
+		inflight = kmemdup(&req, sizeof(req), GFP_KERNEL);
+		if (!inflight) {
+			bao_io_request_complete_error(dm, &req);
+			rc = -ENOMEM;
+			break;
+		}
+
+		if (copy_to_user((void __user *)arg, &req, sizeof(req))) {
+			kfree(inflight);
+			bao_io_request_complete_error(dm, &req);
+			rc = -EFAULT;
+			break;
+		}
+
+		/*
+		 * Publish it only once userspace has it, so that no other
+		 * thread can complete it before it is handed out.
+		 */
+		rc = xa_insert(&dm->inflight, req.request_id, inflight,
+			       GFP_KERNEL);
+		if (rc) {
+			kfree(inflight);
+			bao_io_request_complete_error(dm, &req);
+		}
+		break;
+	}
+	case BAO_IOCTL_IO_REQUEST_COMPLETE: {
+		struct bao_virtio_request req, *inflight;
+		struct bao_remio_hypercall_ctx ctx;
+
+		if (copy_from_user(&req, (void __user *)arg, sizeof(req)))
+			return -EFAULT;
+
+		/*
+		 * Only a request handed out by IO_CLIENT_ATTACH, a write or a
+		 * read, can be completed. The other operations of the hypercall
+		 * belong to the kernel: an ASK from here would fetch a request
+		 * and lose it, leaving its frontend blocked.
+		 */
+		if (req.op != BAO_IO_WRITE && req.op != BAO_IO_READ)
+			return -EINVAL;
+
+		inflight = xa_erase(&dm->inflight, req.request_id);
+		if (!inflight)
+			return -ENOENT;
+
+		/*
+		 * Only the value comes from userspace. The DM is the one bound
+		 * to this fd and the rest is the request as it was handed out,
+		 * so a client can neither complete requests of another DM nor
+		 * change the operation being completed.
+		 */
+		ctx.dm_id = dm->info.id;
+		ctx.addr = inflight->addr;
+		ctx.op = inflight->op;
+		ctx.value = req.value;
+		ctx.access_width = inflight->access_width;
+		ctx.request_id = inflight->request_id;
+		kfree(inflight);
+
+		rc = bao_remio_hypercall(&ctx) ? -EIO : 0;
+		break;
+	}
+	case BAO_IOCTL_IOEVENTFD: {
+		struct bao_ioeventfd ioeventfd;
+
+		if (copy_from_user(&ioeventfd, (void __user *)arg,
+				   sizeof(struct bao_ioeventfd)))
+			return -EFAULT;
+
+		rc = bao_ioeventfd_client_config(dm, &ioeventfd);
+		break;
+	}
+	case BAO_IOCTL_IRQFD: {
+		struct bao_irqfd irqfd;
+
+		if (copy_from_user(&irqfd, (void __user *)arg,
+				   sizeof(struct bao_irqfd)))
+			return -EFAULT;
+
+		rc = bao_irqfd_server_config(dm, &irqfd);
+		break;
+	}
+	default:
+		rc = -ENOTTY;
+		break;
+	}
+
+	return rc;
+}
+
+/**
+ * bao_dm_mmap_prepare - Map the DM shared memory into userspace
+ * @desc: Description of the mapping being set up
+ *
+ * The region is mapped from offset 0, in whole or in part. Only shared
+ * mappings are allowed: what is written to a private copy of the region
+ * would never reach the frontend.
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static int bao_dm_mmap_prepare(struct vm_area_desc *desc)
+{
+	struct bao_dm *dm = desc->file->private_data;
+
+	if (WARN_ON_ONCE(!dm))
+		return -ENODEV;
+
+	if (!vma_desc_test(desc, VMA_MAYSHARE_BIT))
+		return -EINVAL;
+
+	if (desc->pgoff || vma_desc_size(desc) > dm->info.shmem_size)
+		return -EINVAL;
+
+	mmap_action_remap_full(desc, PHYS_PFN(dm->info.shmem_addr));
+
+	return 0;
+}
+
+static loff_t bao_dm_llseek(struct file *file, loff_t offset, int whence)
+{
+	struct bao_dm *dm = file->private_data;
+
+	if (WARN_ON_ONCE(!dm))
+		return -ENODEV;
+
+	return fixed_size_llseek(file, offset, whence, dm->info.shmem_size);
+}
+
+static const struct file_operations bao_dm_fops = {
+	.owner = THIS_MODULE,
+	.release = bao_dm_release,
+	.unlocked_ioctl = bao_dm_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
+	.llseek = bao_dm_llseek,
+	.mmap_prepare = bao_dm_mmap_prepare,
+};
+
+struct bao_dm *bao_dm_create(struct bao_dm_info *info)
+{
+	struct bao_dm *dm;
+	int ret;
+
+	if (WARN_ON(!info))
+		return ERR_PTR(-EINVAL);
+
+	dm = kzalloc_obj(*dm);
+	if (!dm)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&dm->io_clients);
+	init_rwsem(&dm->io_clients_lock);
+	xa_init(&dm->inflight);
+
+	dm->info = *info;
+
+	ret = bao_io_dispatcher_init(dm);
+	if (ret) {
+		pr_err("failed to init I/O dispatcher for DM %u\n",
+		       dm->info.id);
+		goto err_free;
+	}
+
+	snprintf(dm->name, sizeof(dm->name), "bao-ioctlc%u", dm->info.id);
+	dm->control_client = bao_io_client_create(dm, NULL, NULL, true,
+						  dm->name);
+	if (!dm->control_client) {
+		pr_err("failed to create control client for DM %u\n",
+		       dm->info.id);
+		ret = -ENOMEM;
+		goto err_destroy_dispatcher;
+	}
+
+	ret = bao_ioeventfd_client_init(dm);
+	if (ret) {
+		pr_err("failed to initialize ioeventfd for DM %u\n",
+		       dm->info.id);
+		goto err_destroy_io_clients;
+	}
+
+	ret = bao_irqfd_server_init(dm);
+	if (ret) {
+		pr_err("failed to initialize irqfd for DM %u\n",
+		       dm->info.id);
+		goto err_destroy_io_clients;
+	}
+
+	return dm;
+
+err_destroy_io_clients:
+	bao_io_clients_destroy(dm);
+err_destroy_dispatcher:
+	bao_io_dispatcher_destroy(dm);
+err_free:
+	kfree(dm);
+
+	return ERR_PTR(ret);
+}
+
+void bao_dm_destroy(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	/*
+	 * Stop dispatching first, so no request reaches a client going away.
+	 * The notification interrupt is already freed, or not requested yet.
+	 */
+	bao_io_dispatcher_destroy(dm);
+	bao_irqfd_server_destroy(dm);
+	bao_io_clients_destroy(dm);
+	bao_dm_inflight_complete_all(dm);
+
+	kfree(dm);
+}
+
+/**
+ * bao_dm_info_valid - Check the shared-memory region of a DM description
+ * @info: DM description supplied by userspace
+ *
+ * The region must be non-empty, page-aligned and must not wrap around. It is
+ * memory the hypervisor shares between the backend and its frontend, never part
+ * of this guest's RAM, so anything overlapping System RAM is refused: the
+ * descriptor is later mapped into userspace and must not be a way to reach
+ * kernel memory.
+ *
+ * Return: True if the description can be used.
+ */
+static bool bao_dm_info_valid(const struct bao_dm_info *info)
+{
+	u64 end;
+
+	if (!info->shmem_size || !PAGE_ALIGNED(info->shmem_addr) ||
+	    !PAGE_ALIGNED(info->shmem_size))
+		return false;
+
+	end = info->shmem_addr + info->shmem_size - 1;
+	if (end < info->shmem_addr)
+		return false;
+
+	if (region_intersects(info->shmem_addr, info->shmem_size,
+			      IORESOURCE_SYSTEM_RAM,
+			      IORES_DESC_NONE) != REGION_DISJOINT)
+		return false;
+
+	return true;
+}
+
+int bao_dm_create_fd(struct bao_dm_info *info)
+{
+	struct file *file;
+	struct bao_dm *dm;
+	int fd, ret;
+
+	if (WARN_ON(!info))
+		return -EINVAL;
+
+	/*
+	 * Creating a DM maps a physical region chosen by userspace and claims
+	 * an interrupt line: like /dev/mem, that takes CAP_SYS_RAWIO and is
+	 * not available under lockdown.
+	 */
+	if (!capable(CAP_SYS_RAWIO))
+		return -EPERM;
+
+	ret = security_locked_down(LOCKDOWN_DEV_MEM);
+	if (ret)
+		return ret;
+
+	if (!bao_dm_info_valid(info))
+		return -EINVAL;
+
+	/* Claim the id; it is released once the DM is fully torn down. */
+	ret = xa_insert(&bao_dm_ids, info->id, NULL, GFP_KERNEL);
+	if (ret)
+		return ret == -EBUSY ? -EEXIST : ret;
+
+	/*
+	 * Claim the region as a driver claims its MMIO, so that it cannot be
+	 * a range another driver owns nor the region of another DM.
+	 */
+	if (!request_mem_region(info->shmem_addr, info->shmem_size, "bao-dm")) {
+		ret = -EBUSY;
+		goto err_release_id;
+	}
+
+	dm = bao_dm_create(info);
+	if (IS_ERR(dm)) {
+		ret = PTR_ERR(dm);
+		goto err_release_region;
+	}
+
+	ret = bao_intc_init(dm);
+	if (ret) {
+		pr_err("failed to register interrupt %u for DM %u: %d\n",
+		       info->irq, info->id, ret);
+		goto err_destroy_dm;
+	}
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0) {
+		ret = fd;
+		goto err_destroy_intc;
+	}
+
+	file = anon_inode_getfile("[bao-dm]", &bao_dm_fops, dm, O_RDWR);
+	if (IS_ERR(file)) {
+		put_unused_fd(fd);
+		ret = PTR_ERR(file);
+		goto err_destroy_intc;
+	}
+
+	/*
+	 * Nothing can fail any more. Look for requests once: some may already
+	 * be pending, raised while the line was not requested yet (a frontend
+	 * that started first, a VMM that restarted), and their notification
+	 * does not come again.
+	 */
+	queue_work(dm->io_wq, &dm->io_work);
+	fd_install(fd, file);
+
+	return fd;
+
+err_destroy_intc:
+	bao_intc_destroy(dm);
+err_destroy_dm:
+	bao_dm_destroy(dm);
+err_release_region:
+	release_mem_region(info->shmem_addr, info->shmem_size);
+err_release_id:
+	xa_erase(&bao_dm_ids, info->id);
+	return ret;
+}
diff --git a/drivers/virt/bao/io-dispatcher/driver.c b/drivers/virt/bao/io-dispatcher/driver.c
new file mode 100644
index 000000000000..037787c8be6a
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/driver.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor I/O Dispatcher Kernel Driver
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ *
+ * The set of device models a backend guest serves is a pure software contract
+ * between the Bao hypervisor and its userspace VMM, so it is not described in
+ * the device tree. Following the model used by other hypervisor drivers (e.g.
+ * drivers/virt/acrn), the driver exposes a single /dev/bao control device and
+ * the VMM instantiates each device model from its own configuration through the
+ * BAO_IOCTL_CREATE_DM ioctl, which returns a per-DM file descriptor.
+ */
+
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/uaccess.h>
+#include "bao_drv.h"
+
+static long bao_ctl_ioctl(struct file *filp, unsigned int cmd,
+			  unsigned long arg)
+{
+	struct bao_dm_info info;
+
+	switch (cmd) {
+	case BAO_IOCTL_CREATE_DM:
+		if (copy_from_user(&info, (void __user *)arg, sizeof(info)))
+			return -EFAULT;
+
+		return bao_dm_create_fd(&info);
+	default:
+		return -ENOTTY;
+	}
+}
+
+static const struct file_operations bao_ctl_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = bao_ctl_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
+	.llseek = noop_llseek,
+};
+
+static struct miscdevice bao_ctl_dev = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "bao",
+	.fops = &bao_ctl_fops,
+};
+
+static int __init bao_io_dispatcher_driver_init(void)
+{
+	return misc_register(&bao_ctl_dev);
+}
+
+static void __exit bao_io_dispatcher_driver_exit(void)
+{
+	misc_deregister(&bao_ctl_dev);
+}
+
+module_init(bao_io_dispatcher_driver_init);
+module_exit(bao_io_dispatcher_driver_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("João Peixoto <jpeixoto@osyx.tech>");
+MODULE_AUTHOR("David Cerdeira <davidmcerdeira@osyx.tech>");
+MODULE_AUTHOR("José Martins <jose@osyx.tech>");
+MODULE_DESCRIPTION("Bao Hypervisor I/O Dispatcher Kernel Driver");
diff --git a/drivers/virt/bao/io-dispatcher/intc.c b/drivers/virt/bao/io-dispatcher/intc.c
new file mode 100644
index 000000000000..27b17e35a38a
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/intc.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor I/O Dispatcher Interrupt Controller
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "bao_drv.h"
+
+/**
+ * bao_interrupt_handler - Top-level interrupt handler for Bao DM
+ * @irq: Interrupt number
+ * @dev: Pointer to the Bao device model (struct bao_dm)
+ *
+ * Invokes the DM's registered interrupt controller handler, if any.
+ *
+ * Return: IRQ_HANDLED
+ */
+static irqreturn_t bao_interrupt_handler(int irq, void *dev)
+{
+	struct bao_dm *dm = dev;
+	bao_intc_handler_t handler = READ_ONCE(dm->intc_handler);
+
+	if (handler)
+		handler(dm);
+
+	return IRQ_HANDLED;
+}
+
+void bao_intc_setup_handler(struct bao_dm *dm, bao_intc_handler_t handler)
+{
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	WRITE_ONCE(dm->intc_handler, handler);
+}
+
+void bao_intc_remove_handler(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	WRITE_ONCE(dm->intc_handler, NULL);
+}
+
+/**
+ * bao_intc_map_irq - Map the hypervisor notification line to a Linux IRQ
+ * @line: Line of the system's root interrupt controller (e.g. a GIC SPI on
+ *        arm64, a PLIC source on riscv)
+ *
+ * The I/O dispatcher is not a device-tree device, so its notification
+ * interrupt cannot be resolved from an "interrupts" property. Resolve it
+ * against the root interrupt parent instead, i.e. the controller the device
+ * tree's root node points at, which is the one any device without an explicit
+ * interrupt-parent would use. Only the controller's "#interrupt-cells" is
+ * needed to build the specifier: a single-cell controller (e.g. a PLIC) takes
+ * the line directly, a two-cell one (e.g. an APLIC) the line and the trigger
+ * type, and a GIC-style three-cell one an edge-triggered SPI.
+ *
+ * The irqchip drivers trust the specifiers they are given, which normally come
+ * from the device tree, so the line is checked against the number of sources
+ * the controller declares (a PLIC or APLIC) or against the SPI range (a GIC)
+ * before it is mapped.
+ *
+ * Return: A Linux virtual IRQ number on success, negative error code on failure.
+ */
+static int bao_intc_map_irq(u32 line)
+{
+	struct of_phandle_args oirq = {};
+	struct device_node *parent;
+	unsigned int virq;
+	u32 cells, nr_sources;
+	int ret;
+
+	parent = of_irq_find_parent(of_root);
+	if (!parent) {
+		pr_err("no root interrupt-parent in the device tree\n");
+		return -ENODEV;
+	}
+
+	ret = of_property_read_u32(parent, "#interrupt-cells", &cells);
+	if (ret)
+		goto out_put;
+
+	oirq.np = parent;
+	oirq.args_count = cells;
+
+	switch (cells) {
+	case 1:
+		/* PLIC: sources 1 to riscv,ndev */
+		if (of_property_read_u32(parent, "riscv,ndev", &nr_sources) ||
+		    !line || line > nr_sources)
+			goto out_bad_line;
+		oirq.args[0] = line;
+		break;
+	case 2:
+		/* APLIC: sources 1 to riscv,num-sources */
+		if (of_property_read_u32(parent, "riscv,num-sources",
+					 &nr_sources) ||
+		    !line || line > nr_sources)
+			goto out_bad_line;
+		oirq.args[0] = line;
+		oirq.args[1] = IRQ_TYPE_EDGE_RISING;
+		break;
+	case 3:
+	case 4:
+		/* GIC: SPIs 0 to 987, i.e. INTIDs 32 to 1019 */
+		if (line > 987)
+			goto out_bad_line;
+		oirq.args[0] = GIC_SPI;
+		oirq.args[1] = line;
+		oirq.args[2] = IRQ_TYPE_EDGE_RISING;
+		break;
+	default:
+		pr_err("unsupported #interrupt-cells = %u on %pOF\n",
+		       cells, parent);
+		ret = -EINVAL;
+		goto out_put;
+	}
+
+	virq = irq_create_of_mapping(&oirq);
+	ret = virq ? (int)virq : -EINVAL;
+	goto out_put;
+
+out_bad_line:
+	pr_err("line %u is not a valid source of %pOF\n", line, parent);
+	ret = -EINVAL;
+out_put:
+	of_node_put(parent);
+	return ret;
+}
+
+int bao_intc_init(struct bao_dm *dm)
+{
+	int virq, ret;
+
+	if (WARN_ON_ONCE(!dm))
+		return -EINVAL;
+
+	virq = bao_intc_map_irq(dm->info.irq);
+	if (virq < 0)
+		return virq;
+
+	dm->virq = virq;
+
+	scnprintf(dm->intc_name, sizeof(dm->intc_name), "bao-iodintc%u",
+		  dm->info.id);
+
+	/*
+	 * The line is requested exclusively: one that is already in use (a
+	 * device interrupt, another DM's line) is refused rather than shared.
+	 *
+	 * The mapping is never disposed, here or in bao_intc_destroy():
+	 * irq_create_of_mapping() hands back the existing mapping when the line
+	 * is already mapped and does not count its users, so disposing it could
+	 * free a descriptor someone else still uses. A mapping left behind is
+	 * reused the next time the same line is mapped.
+	 */
+	ret = request_irq(dm->virq, bao_interrupt_handler, 0, dm->intc_name,
+			  dm);
+	if (ret)
+		dm->virq = 0;
+
+	return ret;
+}
+
+void bao_intc_destroy(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	free_irq(dm->virq, dm);
+}
diff --git a/drivers/virt/bao/io-dispatcher/io_client.c b/drivers/virt/bao/io-dispatcher/io_client.c
new file mode 100644
index 000000000000..a4adb872a757
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/io_client.c
@@ -0,0 +1,475 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor I/O Client
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/kthread.h>
+#include <linux/slab.h>
+#include "bao_drv.h"
+
+/**
+ * struct bao_io_request - Bao I/O request structure
+ * @list: List node linking all requests
+ * @virtio_request: The VirtIO request payload
+ *
+ * Represents a single I/O request for a Bao I/O client.
+ */
+struct bao_io_request {
+	struct list_head list;
+	struct bao_virtio_request virtio_request;
+};
+
+/**
+ * bao_io_client_has_pending_requests - Check if an I/O client has pending requests
+ * @client: The bao_io_client to check
+ *
+ * Return: True if has pending I/O requests, false otherwise.
+ */
+static inline bool
+bao_io_client_has_pending_requests(struct bao_io_client *client)
+{
+	if (WARN_ON_ONCE(!client))
+		return false;
+
+	return !list_empty(&client->virtio_requests);
+}
+
+/**
+ * bao_io_client_is_destroying - Check if an I/O client is being destroyed
+ * @client: The bao_io_client to check
+ *
+ * Return: True if the client is being destroyed, false otherwise.
+ */
+static inline bool bao_io_client_is_destroying(struct bao_io_client *client)
+{
+	if (WARN_ON_ONCE(!client))
+		return true;
+
+	return test_bit(BAO_IO_CLIENT_DESTROYING, &client->flags);
+}
+
+bool bao_io_client_push_request(struct bao_io_client *client,
+				struct bao_virtio_request *req)
+{
+	struct bao_io_request *io_req;
+
+	if (WARN_ON_ONCE(!client || !req))
+		return false;
+
+	io_req = kzalloc_obj(*io_req);
+	if (!io_req)
+		return false;
+
+	io_req->virtio_request = *req;
+
+	mutex_lock(&client->virtio_requests_lock);
+	if (client->nr_requests >= BAO_IO_CLIENT_MAX_REQUESTS) {
+		mutex_unlock(&client->virtio_requests_lock);
+		kfree(io_req);
+		return false;
+	}
+	list_add_tail(&io_req->list, &client->virtio_requests);
+	client->nr_requests++;
+	mutex_unlock(&client->virtio_requests_lock);
+
+	return true;
+}
+
+bool bao_io_client_pop_request(struct bao_io_client *client,
+			       struct bao_virtio_request *ret)
+{
+	struct bao_io_request *req;
+
+	if (WARN_ON_ONCE(!client || !ret))
+		return false;
+
+	mutex_lock(&client->virtio_requests_lock);
+
+	req = list_first_entry_or_null(&client->virtio_requests,
+				       struct bao_io_request, list);
+	if (!req) {
+		mutex_unlock(&client->virtio_requests_lock);
+		return false;
+	}
+
+	list_del(&req->list);
+	if (!WARN_ON_ONCE(client->nr_requests == 0))
+		client->nr_requests--;
+	*ret = req->virtio_request;
+
+	mutex_unlock(&client->virtio_requests_lock);
+
+	kfree(req);
+
+	return true;
+}
+
+/**
+ * bao_io_client_stop - Stop an I/O client from processing requests
+ * @client: The bao_io_client to stop
+ *
+ * Wakes up a control client's waiters, which see the client going away, and
+ * stops a kernel client's thread. The thread first serves what it already
+ * dequeued; requests still queued when it stops are left for
+ * bao_io_client_destroy().
+ */
+static void bao_io_client_stop(struct bao_io_client *client)
+{
+	set_bit(BAO_IO_CLIENT_DESTROYING, &client->flags);
+
+	if (client->is_control) {
+		wake_up_interruptible(&client->wq);
+	} else if (client->thread) {
+		kthread_stop(client->thread);
+		client->thread = NULL;
+	}
+}
+
+/**
+ * bao_io_client_destroy - Destroy a stopped I/O client
+ * @client: The bao_io_client to destroy
+ */
+static void bao_io_client_destroy(struct bao_io_client *client)
+{
+	struct bao_io_range *range;
+	struct bao_io_range *next;
+	struct bao_io_request *io_req;
+	struct bao_io_request *io_next;
+	struct bao_dm *dm;
+
+	if (WARN_ON_ONCE(!client))
+		return;
+
+	dm = client->dm;
+
+	/* The thread is gone, so nothing uses the ioeventfds any more. */
+	if (!client->is_control)
+		bao_ioeventfd_client_destroy(dm);
+
+	down_write(&client->range_lock);
+	list_for_each_entry_safe(range, next, &client->range_list, list) {
+		list_del(&range->list);
+		kfree(range);
+	}
+	up_write(&client->range_lock);
+
+	down_write(&dm->io_clients_lock);
+	if (client->is_control)
+		dm->control_client = NULL;
+	else
+		dm->ioeventfd_client = NULL;
+
+	list_del(&client->list);
+	up_write(&dm->io_clients_lock);
+
+	/*
+	 * Requests still queued will never be served: complete them back to
+	 * the hypervisor with an error so the frontends waiting on them are
+	 * resumed, then free them.
+	 */
+	mutex_lock(&client->virtio_requests_lock);
+	list_for_each_entry_safe(io_req, io_next, &client->virtio_requests,
+				 list) {
+		list_del(&io_req->list);
+		bao_io_request_complete_error(dm, &io_req->virtio_request);
+		kfree(io_req);
+	}
+	client->nr_requests = 0;
+	mutex_unlock(&client->virtio_requests_lock);
+
+	kfree(client);
+}
+
+void bao_io_clients_destroy(struct bao_dm *dm)
+{
+	struct bao_io_client *client, *next;
+
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	/*
+	 * Stop every client before destroying any: a kernel client hands the
+	 * requests it does not handle to the control client, which must still
+	 * be there.
+	 */
+	list_for_each_entry(client, &dm->io_clients, list)
+		bao_io_client_stop(client);
+
+	list_for_each_entry_safe(client, next, &dm->io_clients, list)
+		bao_io_client_destroy(client);
+}
+
+int bao_io_client_attach(struct bao_io_client *client)
+{
+	int ret;
+
+	if (WARN_ON_ONCE(!client))
+		return -EINVAL;
+
+	if (client->is_control) {
+		ret = wait_event_interruptible(client->wq,
+					       bao_io_client_has_pending_requests(client) ||
+					       bao_io_client_is_destroying(client));
+		/* Let a caught signal restart the syscall instead of erroring. */
+		if (ret)
+			return ret;
+		if (bao_io_client_is_destroying(client))
+			return -EPERM;
+	} else {
+		/*
+		 * The kernel thread only ever leaves through kthread_stop(),
+		 * which wakes it up; teardown sets BAO_IO_CLIENT_DESTROYING
+		 * and then stops the thread, so there is no need to wait on
+		 * the flag here.
+		 */
+		ret = wait_event_interruptible(client->wq,
+					       bao_io_client_has_pending_requests(client) ||
+					       kthread_should_stop());
+		if (ret)
+			return ret;
+		if (kthread_should_stop())
+			return -EPERM;
+	}
+
+	return 0;
+}
+
+/**
+ * bao_io_client_kernel_thread - Thread for processing a kernel I/O client
+ * @data: Pointer to the bao_io_client structure
+ *
+ * Runs the client handler on every queued request and completes the request
+ * back to the hypervisor, unless the handler forwarded it to the control
+ * client. The thread never exits on its own: kthread_stop()
+ * relies on the task still being around, so errors are logged and the thread
+ * goes back to waiting for requests.
+ *
+ * Return: 0 on completion
+ */
+static int bao_io_client_kernel_thread(void *data)
+{
+	struct bao_io_client *client = data;
+	struct bao_virtio_request req;
+	struct bao_remio_hypercall_ctx ctx;
+	int ret;
+
+	if (WARN_ON_ONCE(!client))
+		return -EINVAL;
+
+	while (!kthread_should_stop()) {
+		if (bao_io_client_attach(client))
+			continue;
+
+		while (bao_io_client_pop_request(client, &req)) {
+			ret = client->handler(client, &req);
+			if (ret == BAO_IO_REQUEST_FORWARDED)
+				continue;
+			if (ret < 0) {
+				pr_warn_ratelimited("%s: handler returned %d\n",
+						    client->name, ret);
+				bao_io_request_complete_error(client->dm,
+							      &req);
+				continue;
+			}
+
+			ctx.dm_id = client->dm->info.id;
+			ctx.op = req.op;
+			ctx.addr = req.addr;
+			ctx.value = req.value;
+			ctx.access_width = req.access_width;
+			ctx.request_id = req.request_id;
+
+			if (bao_remio_hypercall(&ctx))
+				pr_warn_ratelimited("%s: failed to complete request %llu\n",
+						    client->name,
+						    req.request_id);
+		}
+	}
+
+	return 0;
+}
+
+struct bao_io_client *bao_io_client_create(struct bao_dm *dm,
+					   bao_io_client_handler_t handler,
+					   void *data, bool is_control,
+					   const char *name)
+{
+	struct bao_io_client *client;
+
+	if (WARN_ON_ONCE(!dm || !name))
+		return NULL;
+
+	if (!handler && !is_control)
+		return NULL;
+
+	client = kzalloc_obj(*client);
+	if (!client)
+		return NULL;
+
+	client->handler = handler;
+	client->dm = dm;
+	client->priv = data;
+	client->is_control = is_control;
+	strscpy(client->name, name, sizeof(client->name));
+
+	INIT_LIST_HEAD(&client->virtio_requests);
+	mutex_init(&client->virtio_requests_lock);
+	init_rwsem(&client->range_lock);
+	INIT_LIST_HEAD(&client->range_list);
+	init_waitqueue_head(&client->wq);
+
+	if (client->handler) {
+		client->thread = kthread_run(bao_io_client_kernel_thread,
+					     client, "%s", client->name);
+		if (IS_ERR(client->thread)) {
+			kfree(client);
+			return NULL;
+		}
+	}
+
+	down_write(&dm->io_clients_lock);
+	if (is_control)
+		dm->control_client = client;
+	else
+		dm->ioeventfd_client = client;
+
+	list_add(&client->list, &dm->io_clients);
+	up_write(&dm->io_clients_lock);
+
+	return client;
+}
+
+int bao_io_client_request(struct bao_io_client *client,
+			  struct bao_virtio_request *req)
+{
+	if (WARN_ON_ONCE(!client))
+		return -EINVAL;
+
+	if (!bao_io_client_pop_request(client, req))
+		return -EAGAIN;
+
+	return 0;
+}
+
+int bao_io_client_range_add(struct bao_io_client *client, u64 start, u64 end)
+{
+	struct bao_io_range *range;
+
+	if (WARN_ON_ONCE(!client))
+		return -EINVAL;
+
+	if (end < start)
+		return -EINVAL;
+
+	range = kzalloc_obj(*range);
+	if (!range)
+		return -ENOMEM;
+
+	range->start = start;
+	range->end = end;
+
+	down_write(&client->range_lock);
+	list_add(&range->list, &client->range_list);
+	up_write(&client->range_lock);
+
+	return 0;
+}
+
+void bao_io_client_range_del(struct bao_io_client *client, u64 start, u64 end)
+{
+	struct bao_io_range *range;
+	struct bao_io_range *tmp;
+
+	if (WARN_ON_ONCE(!client))
+		return;
+
+	down_write(&client->range_lock);
+	list_for_each_entry_safe(range, tmp, &client->range_list, list) {
+		if (range->start == start && range->end == end) {
+			list_del(&range->list);
+			kfree(range);
+			break;
+		}
+	}
+	up_write(&client->range_lock);
+}
+
+/**
+ * bao_io_request_in_range - Check if the I/O request is in the range
+ * @range: The I/O request range
+ * @req: The I/O request to be checked
+ *
+ * Return: True if the I/O request is in the range, false otherwise
+ */
+static bool bao_io_request_in_range(struct bao_io_range *range,
+				    struct bao_virtio_request *req)
+{
+	u64 last;
+
+	if (WARN_ON_ONCE(!range || !req))
+		return false;
+
+	/* An access is 1 to 8 bytes wide and does not wrap around. */
+	if (!req->access_width || req->access_width > sizeof(u64))
+		return false;
+
+	last = req->addr + req->access_width - 1;
+	if (last < req->addr)
+		return false;
+
+	return req->addr >= range->start && last <= range->end;
+}
+
+int bao_io_client_forward(struct bao_dm *dm, struct bao_virtio_request *req)
+{
+	struct bao_io_client *control;
+	int ret = BAO_IO_REQUEST_FORWARDED;
+
+	down_read(&dm->io_clients_lock);
+	control = dm->control_client;
+	if (!control)
+		ret = -ENODEV;
+	else if (!bao_io_client_push_request(control, req))
+		ret = -ENOSPC;
+	else
+		wake_up_interruptible(&control->wq);
+	up_read(&dm->io_clients_lock);
+
+	return ret;
+}
+
+struct bao_io_client *bao_io_client_find(struct bao_dm *dm,
+					 struct bao_virtio_request *req)
+{
+	struct bao_io_client *client;
+	struct bao_io_client *found = NULL;
+	struct bao_io_range *range;
+
+	if (WARN_ON_ONCE(!dm || !req))
+		return NULL;
+
+	list_for_each_entry(client, &dm->io_clients, list) {
+		down_read(&client->range_lock);
+		list_for_each_entry(range, &client->range_list, list) {
+			if (bao_io_request_in_range(range, req)) {
+				found = client;
+				break;
+			}
+		}
+		up_read(&client->range_lock);
+
+		if (found)
+			break;
+	}
+
+	return found ? found : dm->control_client;
+}
diff --git a/drivers/virt/bao/io-dispatcher/io_dispatcher.c b/drivers/virt/bao/io-dispatcher/io_dispatcher.c
new file mode 100644
index 000000000000..530748bf8ba9
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/io_dispatcher.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor I/O Dispatcher
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/workqueue.h>
+#include "bao_drv.h"
+
+void bao_io_dispatcher_destroy(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	if (!dm->io_wq)
+		return;
+
+	/* No new dispatch, and wait for the one that may be running. */
+	bao_intc_remove_handler(dm);
+	destroy_workqueue(dm->io_wq);
+	dm->io_wq = NULL;
+}
+
+static void bao_io_complete_error(u32 dm_id, u64 op, u64 addr,
+				  u64 access_width, u64 request_id)
+{
+	struct bao_remio_hypercall_ctx ctx = {
+		.dm_id = dm_id,
+		.op = op,
+		.addr = addr,
+		.value = 0,
+		.access_width = access_width,
+		.request_id = request_id,
+	};
+
+	bao_remio_hypercall(&ctx);
+}
+
+void bao_io_request_complete_error(struct bao_dm *dm,
+				   struct bao_virtio_request *req)
+{
+	bao_io_complete_error(dm->info.id, req->op, req->addr,
+			      req->access_width, req->request_id);
+}
+
+void bao_io_dispatcher_complete_pending(u32 dm_id)
+{
+	struct bao_remio_hypercall_ctx ctx;
+	unsigned int n;
+
+	/*
+	 * Each ASK hands out one pending request and fails once there is none
+	 * left. Bound the loop anyway: the hypervisor holds at most one request
+	 * per frontend vCPU.
+	 */
+	for (n = 0; n < BAO_IO_CLIENT_MAX_REQUESTS; n++) {
+		ctx = (struct bao_remio_hypercall_ctx) {
+			.dm_id = dm_id,
+			.op = BAO_IO_ASK,
+		};
+		if (bao_remio_hypercall(&ctx))
+			break;
+
+		bao_io_complete_error(dm_id, ctx.op, ctx.addr,
+				      ctx.access_width, ctx.request_id);
+		cond_resched();
+	}
+}
+
+int bao_dispatch_io(struct bao_dm *dm)
+{
+	struct bao_io_client *client;
+	struct bao_remio_hypercall_ctx ctx;
+	struct bao_virtio_request req;
+
+	if (WARN_ON_ONCE(!dm))
+		return -EINVAL;
+
+	ctx.dm_id = dm->info.id;
+	ctx.op = BAO_IO_ASK;
+	ctx.addr = 0;
+	ctx.value = 0;
+	ctx.request_id = 0;
+	ctx.access_width = 0;
+	ctx.npend_req = 0;
+
+	if (bao_remio_hypercall(&ctx))
+		return -EIO;
+
+	/* Only "more" or "no more" matters; keep the count in the int range. */
+	ctx.npend_req = min_t(u64, ctx.npend_req, INT_MAX);
+
+	req.dm_id = ctx.dm_id;
+	req.op = ctx.op;
+	req.addr = ctx.addr;
+	req.value = ctx.value;
+	req.access_width = ctx.access_width;
+	req.request_id = ctx.request_id;
+
+	/*
+	 * A request that cannot be delivered is completed with an error and
+	 * fetching goes on: the notification interrupt is edge-triggered, so
+	 * stopping here would strand the requests still pending.
+	 */
+	down_read(&dm->io_clients_lock);
+	client = bao_io_client_find(dm, &req);
+	if (!client) {
+		up_read(&dm->io_clients_lock);
+		pr_warn_ratelimited("DM %u: no client for request %llu at %#llx\n",
+				    dm->info.id, req.request_id, req.addr);
+		bao_io_request_complete_error(dm, &req);
+		return ctx.npend_req;
+	}
+
+	if (!bao_io_client_push_request(client, &req)) {
+		up_read(&dm->io_clients_lock);
+		pr_warn_ratelimited("DM %u: dropping request %llu, client queue full\n",
+				    dm->info.id, req.request_id);
+		bao_io_request_complete_error(dm, &req);
+		return ctx.npend_req;
+	}
+
+	wake_up_interruptible(&client->wq);
+	up_read(&dm->io_clients_lock);
+
+	return ctx.npend_req;
+}
+
+/**
+ * io_dispatcher - Workqueue handler for dispatching I/O
+ * @work: Work struct representing this dispatch operation
+ *
+ * Handles all pending I/O requests for the associated Bao DM.
+ * Executed in process context by the workqueue.
+ */
+static void io_dispatcher(struct work_struct *work)
+{
+	struct bao_dm *dm = container_of(work, struct bao_dm, io_work);
+
+	while (bao_dispatch_io(dm) > 0)
+		cond_resched();
+}
+
+/**
+ * io_dispatcher_intc_handler - Interrupt handler for I/O requests
+ * @dm: Bao device model that triggered the interrupt
+ *
+ * Invoked by the interrupt controller when a new I/O request is available.
+ * Queues the DM's work item onto its I/O dispatcher workqueue for processing
+ * in process context.
+ */
+static void io_dispatcher_intc_handler(struct bao_dm *dm)
+{
+	queue_work(dm->io_wq, &dm->io_work);
+}
+
+int bao_io_dispatcher_init(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm))
+		return -EINVAL;
+
+	if (dm->io_wq)
+		return -EBUSY;
+
+	dm->io_wq = alloc_workqueue("bao-iodwq%u",
+				    WQ_HIGHPRI | WQ_MEM_RECLAIM | WQ_PERCPU, 1,
+				    dm->info.id);
+	if (!dm->io_wq)
+		return -ENOMEM;
+
+	INIT_WORK(&dm->io_work, io_dispatcher);
+
+	bao_intc_setup_handler(dm, io_dispatcher_intc_handler);
+
+	return 0;
+}
diff --git a/drivers/virt/bao/io-dispatcher/ioeventfd.c b/drivers/virt/bao/io-dispatcher/ioeventfd.c
new file mode 100644
index 000000000000..1d3a90f704b7
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/ioeventfd.c
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor Ioeventfd Client
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#include <linux/eventfd.h>
+#include <linux/slab.h>
+#include "bao_drv.h"
+
+/**
+ * struct ioeventfd - Properties of an I/O eventfd
+ * @list: List node linking this ioeventfd
+ * @eventfd: Associated eventfd context
+ * @addr: Start address of the I/O range
+ * @data: Data used for matching (if not wildcard)
+ * @length: Length of the I/O range (1, 2, 4 or 8 bytes)
+ * @wildcard: True if data matching is not required
+ *
+ * Represents an I/O eventfd registered for a Bao device model.
+ */
+struct ioeventfd {
+	struct list_head list;
+	struct eventfd_ctx *eventfd;
+	u64 addr;
+	u64 data;
+	u32 length;
+	bool wildcard;
+};
+
+/**
+ * bao_ioeventfd_shutdown - Release and remove an ioeventfd
+ * @dm: Bao device model owning the ioeventfd
+ * @p: Ioeventfd to shut down
+ */
+static void bao_ioeventfd_shutdown(struct bao_dm *dm, struct ioeventfd *p)
+{
+	lockdep_assert_held(&dm->ioeventfds_lock);
+
+	if (WARN_ON_ONCE(!p))
+		return;
+
+	eventfd_ctx_put(p->eventfd);
+	list_del(&p->list);
+	dm->nr_ioeventfds--;
+	kfree(p);
+}
+
+/**
+ * bao_ioeventfd_config_valid - Validate ioeventfd configuration
+ * @config: Ioeventfd configuration
+ *
+ * Return: True if config is non-NULL, only known flags are set, the reserved
+ * field is zero, address+length does not wrap, and length is 1, 2, 4, or 8
+ * bytes.
+ */
+static bool bao_ioeventfd_config_valid(struct bao_ioeventfd *config)
+{
+	if (WARN_ON_ONCE(!config))
+		return false;
+
+	if (config->flags & ~(BAO_IOEVENTFD_FLAG_DATAMATCH |
+			      BAO_IOEVENTFD_FLAG_DEASSIGN))
+		return false;
+
+	if (config->reserved)
+		return false;
+
+	if (config->addr + config->len < config->addr)
+		return false;
+
+	if (!(config->len == 1 || config->len == 2 || config->len == 4 ||
+	      config->len == 8))
+		return false;
+
+	return true;
+}
+
+/**
+ * bao_ioeventfd_is_conflict - Check if an ioeventfd conflicts with existing ones
+ * @dm: Bao device model
+ * @ioeventfd: Ioeventfd to check
+ *
+ * Two ioeventfds conflict when a write could match both, whichever eventfds
+ * they signal: only one of them would ever be signaled.
+ *
+ * Return: True if an existing ioeventfd has the same address and length and
+ * an overlapping data match.
+ */
+static bool bao_ioeventfd_is_conflict(struct bao_dm *dm,
+				      struct ioeventfd *ioeventfd)
+{
+	struct ioeventfd *p;
+
+	lockdep_assert_held(&dm->ioeventfds_lock);
+
+	if (WARN_ON_ONCE(!dm || !ioeventfd))
+		return true;
+
+	list_for_each_entry(p, &dm->ioeventfds, list) {
+		if (p->addr == ioeventfd->addr &&
+		    p->length == ioeventfd->length &&
+		    (p->wildcard || ioeventfd->wildcard ||
+		     p->data == ioeventfd->data)) {
+			return true;
+		}
+	}
+
+	return false;
+}
+
+/**
+ * bao_ioeventfd_match - Find ioeventfd matching an I/O request
+ * @dm: Bao device model
+ * @addr: I/O request address
+ * @data: I/O request data
+ * @len: I/O request length
+ *
+ * An ioeventfd matches a write of exactly its address and length, and of its
+ * data unless it is a wildcard.
+ *
+ * Return: The matching ioeventfd, NULL if none matches.
+ */
+static struct ioeventfd *bao_ioeventfd_match(struct bao_dm *dm, u64 addr,
+					     u64 data, u64 len)
+{
+	struct ioeventfd *p;
+
+	lockdep_assert_held(&dm->ioeventfds_lock);
+
+	if (WARN_ON_ONCE(!dm))
+		return NULL;
+
+	list_for_each_entry(p, &dm->ioeventfds, list) {
+		if (p->addr == addr && p->length == len &&
+		    (p->wildcard || p->data == data)) {
+			return p;
+		}
+	}
+
+	return NULL;
+}
+
+/**
+ * bao_ioeventfd_assign - Assign and create an eventfd for a DM
+ * @dm: Bao device model to assign the eventfd to
+ * @config: Configuration of the eventfd to create
+ *
+ * Creates a new ioeventfd associated with the given eventfd and
+ * adds it to the Bao DM. Validates the configuration, checks for
+ * conflicts with existing ioeventfds, and registers the corresponding
+ * I/O client address range. Supports optional data matching for
+ * virtio 1.0 notifications; if not set, wildcard matching is used.
+ *
+ * Return: 0 on success, a negative error code on failure
+ */
+static int bao_ioeventfd_assign(struct bao_dm *dm, struct bao_ioeventfd *config)
+{
+	struct eventfd_ctx *eventfd;
+	struct ioeventfd *new;
+	int rc = 0;
+
+	if (WARN_ON_ONCE(!dm || !config))
+		return -EINVAL;
+
+	eventfd = eventfd_ctx_fdget(config->fd);
+	if (IS_ERR(eventfd))
+		return PTR_ERR(eventfd);
+
+	new = kzalloc_obj(*new);
+	if (!new) {
+		rc = -ENOMEM;
+		goto err_put_eventfd;
+	}
+
+	INIT_LIST_HEAD(&new->list);
+	new->addr = config->addr;
+	new->length = config->len;
+	new->eventfd = eventfd;
+	new->wildcard = !(config->flags & BAO_IOEVENTFD_FLAG_DATAMATCH);
+	if (!new->wildcard)
+		new->data = config->data;
+
+	mutex_lock(&dm->ioeventfds_lock);
+
+	if (dm->nr_ioeventfds >= BAO_IOEVENTFD_MAX) {
+		rc = -ENOSPC;
+		goto err_unlock_free;
+	}
+
+	if (bao_ioeventfd_is_conflict(dm, new)) {
+		rc = -EEXIST;
+		goto err_unlock_free;
+	}
+
+	rc = bao_io_client_range_add(dm->ioeventfd_client, new->addr,
+				     new->addr + new->length - 1);
+	if (rc < 0)
+		goto err_unlock_free;
+
+	list_add_tail(&new->list, &dm->ioeventfds);
+	dm->nr_ioeventfds++;
+	mutex_unlock(&dm->ioeventfds_lock);
+
+	return 0;
+
+err_unlock_free:
+	mutex_unlock(&dm->ioeventfds_lock);
+	kfree(new);
+err_put_eventfd:
+	eventfd_ctx_put(eventfd);
+	return rc;
+}
+
+/**
+ * bao_ioeventfd_deassign - Deassign and destroy an eventfd from a DM
+ * @dm: Bao device model to deassign the eventfd from
+ * @config: Configuration of the eventfd to remove
+ *
+ * Return: 0 on success, -ENOENT if no such ioeventfd is registered, another
+ * negative error code on failure
+ */
+static int bao_ioeventfd_deassign(struct bao_dm *dm,
+				  struct bao_ioeventfd *config)
+{
+	bool wildcard = !(config->flags & BAO_IOEVENTFD_FLAG_DATAMATCH);
+	struct ioeventfd *p;
+	struct eventfd_ctx *eventfd;
+	int ret = -ENOENT;
+
+	if (WARN_ON_ONCE(!dm || !config))
+		return -EINVAL;
+
+	eventfd = eventfd_ctx_fdget(config->fd);
+	if (IS_ERR(eventfd))
+		return PTR_ERR(eventfd);
+
+	mutex_lock(&dm->ioeventfds_lock);
+
+	list_for_each_entry(p, &dm->ioeventfds, list) {
+		/*
+		 * Match the full registration, data match included, so that
+		 * removing one of several ioeventfds of an address that only
+		 * differ by their data leaves the others in place.
+		 */
+		if (p->eventfd != eventfd || p->addr != config->addr ||
+		    p->length != config->len || p->wildcard != wildcard ||
+		    (!wildcard && p->data != config->data))
+			continue;
+
+		bao_io_client_range_del(dm->ioeventfd_client, p->addr,
+					p->addr + p->length - 1);
+
+		bao_ioeventfd_shutdown(dm, p);
+		ret = 0;
+		break;
+	}
+
+	mutex_unlock(&dm->ioeventfds_lock);
+	eventfd_ctx_put(eventfd);
+
+	return ret;
+}
+
+/**
+ * bao_ioeventfd_handler - Handle an Ioeventfd client I/O request
+ * @client: Ioeventfd client associated with the request
+ * @req: I/O request to process
+ *
+ * Processes I/O requests from the Bao I/O client kernel thread
+ * (bao_io_client_kernel_thread). WRITE operations are checked against
+ * the registered ioeventfds and the matching eventfd is signaled. As with
+ * KVM, ioeventfds only take writes: a read, or a write that no ioeventfd
+ * matches (e.g. the notification of a queue without an ioeventfd sharing
+ * the register with ones that have one), is handed to the control client
+ * so that userspace handles it.
+ *
+ * Return: 0 if the request was served, BAO_IO_REQUEST_FORWARDED if it was
+ * handed to the control client, a negative error code on failure
+ */
+static int bao_ioeventfd_handler(struct bao_io_client *client,
+				 struct bao_virtio_request *req)
+{
+	struct ioeventfd *p;
+
+	if (WARN_ON_ONCE(!client || !req))
+		return -EINVAL;
+
+	if (req->op == BAO_IO_READ)
+		return bao_io_client_forward(client->dm, req);
+
+	mutex_lock(&client->dm->ioeventfds_lock);
+
+	p = bao_ioeventfd_match(client->dm, req->addr, req->value,
+				req->access_width);
+	if (p)
+		eventfd_signal(p->eventfd);
+
+	mutex_unlock(&client->dm->ioeventfds_lock);
+
+	if (!p)
+		return bao_io_client_forward(client->dm, req);
+
+	return 0;
+}
+
+int bao_ioeventfd_client_config(struct bao_dm *dm, struct bao_ioeventfd *config)
+{
+	if (WARN_ON_ONCE(!dm || !config))
+		return -EINVAL;
+
+	if (!bao_ioeventfd_config_valid(config))
+		return -EINVAL;
+
+	if (config->flags & BAO_IOEVENTFD_FLAG_DEASSIGN)
+		return bao_ioeventfd_deassign(dm, config);
+
+	return bao_ioeventfd_assign(dm, config);
+}
+
+int bao_ioeventfd_client_init(struct bao_dm *dm)
+{
+	char name[BAO_NAME_MAX_LEN];
+
+	if (WARN_ON_ONCE(!dm))
+		return -EINVAL;
+
+	mutex_init(&dm->ioeventfds_lock);
+	INIT_LIST_HEAD(&dm->ioeventfds);
+
+	snprintf(name, sizeof(name), "bao-ioevfdc%u", dm->info.id);
+
+	dm->ioeventfd_client = bao_io_client_create(dm, bao_ioeventfd_handler,
+						    NULL, false, name);
+	if (!dm->ioeventfd_client)
+		return -ENOMEM;
+
+	return 0;
+}
+
+void bao_ioeventfd_client_destroy(struct bao_dm *dm)
+{
+	struct ioeventfd *p;
+	struct ioeventfd *next;
+
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	mutex_lock(&dm->ioeventfds_lock);
+	list_for_each_entry_safe(p, next, &dm->ioeventfds, list)
+		bao_ioeventfd_shutdown(dm, p);
+	mutex_unlock(&dm->ioeventfds_lock);
+}
diff --git a/drivers/virt/bao/io-dispatcher/irqfd.c b/drivers/virt/bao/io-dispatcher/irqfd.c
new file mode 100644
index 000000000000..8d01bef4e7ab
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/irqfd.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor Irqfd Server
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#include <linux/eventfd.h>
+#include <linux/file.h>
+#include <linux/poll.h>
+#include <linux/slab.h>
+#include "bao_drv.h"
+
+/* Cleanup work has been queued; set via test_and_set_bit(). */
+#define BAO_IRQFD_SHUTDOWN 0
+
+/**
+ * struct irqfd - Properties of an IRQ eventfd
+ * @dm: Associated Bao device model
+ * @wait: Wait queue entry for blocking/waking
+ * @shutdown: Work struct for async shutdown
+ * @eventfd: Eventfd used to signal interrupts
+ * @list: List node within &bao_dm.irqfds
+ * @pt: Poll table for select/poll on the eventfd
+ * @flags: Internal lifecycle flags (BAO_IRQFD_*)
+ *
+ * Represents an IRQ eventfd registered to a Bao device model.
+ */
+struct irqfd {
+	struct bao_dm *dm;
+	wait_queue_entry_t wait;
+	struct work_struct shutdown;
+	struct eventfd_ctx *eventfd;
+	struct list_head list;
+	poll_table pt;
+	unsigned long flags;
+};
+
+/* Queue the cleanup work at most once. Safe from atomic context. */
+static void bao_irqfd_queue_shutdown(struct irqfd *irqfd)
+{
+	if (!test_and_set_bit(BAO_IRQFD_SHUTDOWN, &irqfd->flags))
+		queue_work(irqfd->dm->irqfd_server, &irqfd->shutdown);
+}
+
+/**
+ * bao_irqfd_inject - Inject a notify hypercall into the Bao hypervisor
+ * @id: Bao DM ID
+ *
+ * Return: 0 on success, -EIO if the hypercall fails.
+ */
+static int bao_irqfd_inject(u32 id)
+{
+	struct bao_remio_hypercall_ctx ctx = {
+		.dm_id = id,
+		.addr = 0,
+		.op = BAO_IO_NOTIFY,
+		.value = 0,
+		.access_width = 0,
+		.request_id = 0,
+	};
+
+	if (bao_remio_hypercall(&ctx))
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * bao_irqfd_wakeup - Custom wake-up handler for eventfd signaling
+ * @wait: Wait queue entry
+ * @mode: Mode flags
+ * @sync: Sync indicator
+ * @key: Poll bits (cast from void *)
+ *
+ * Called by the Linux kernel poll table when the underlying eventfd is signaled,
+ * with the eventfd's wait queue lock held. On EPOLLIN, consumes the eventfd
+ * counter, so the eventfd does not stay readable, and injects a Bao notify
+ * hypercall; on EPOLLHUP, schedules the shutdown.
+ *
+ * Return: 0, so the other waiters on the eventfd are woken up too.
+ */
+static int bao_irqfd_wakeup(wait_queue_entry_t *wait, unsigned int mode,
+			    int sync, void *key)
+{
+	struct irqfd *irqfd = container_of(wait, struct irqfd, wait);
+	__poll_t flags = key_to_poll(key);
+	u64 cnt;
+
+	if (flags & EPOLLIN) {
+		eventfd_ctx_do_read(irqfd->eventfd, &cnt);
+		bao_irqfd_inject(irqfd->dm->info.id);
+	}
+
+	if (flags & EPOLLHUP)
+		/* Defer teardown to the cleanup work; can't sleep here. */
+		bao_irqfd_queue_shutdown(irqfd);
+
+	return 0;
+}
+
+/**
+ * bao_irqfd_poll_func - Register an IRQFD with a poll table
+ * @file: File to poll
+ * @wqh: Wait queue head
+ * @pt: Poll table
+ *
+ * Adds the irqfd's wait queue entry to the kernel wait queue for event monitoring.
+ */
+static void bao_irqfd_poll_func(struct file *file, wait_queue_head_t *wqh,
+				poll_table *pt)
+{
+	struct irqfd *irqfd;
+
+	if (WARN_ON_ONCE(!pt || !wqh))
+		return;
+
+	irqfd = container_of(pt, struct irqfd, pt);
+	add_wait_queue(wqh, &irqfd->wait);
+}
+
+/**
+ * irqfd_shutdown_work - Workqueue handler to shutdown an irqfd
+ * @work: Work struct for the shutdown operation
+ *
+ * Sole owner of @irqfd: unlinks it (if still linked), detaches its waitqueue
+ * entry, drops the eventfd reference and frees it.
+ */
+static void irqfd_shutdown_work(struct work_struct *work)
+{
+	struct irqfd *irqfd = container_of(work, struct irqfd, shutdown);
+	struct bao_dm *dm = irqfd->dm;
+	u64 cnt;
+
+	mutex_lock(&dm->irqfds_lock);
+	if (!list_empty(&irqfd->list)) {
+		list_del_init(&irqfd->list);
+		dm->nr_irqfds--;
+	}
+	mutex_unlock(&dm->irqfds_lock);
+
+	eventfd_ctx_remove_wait_queue(irqfd->eventfd, &irqfd->wait, &cnt);
+	eventfd_ctx_put(irqfd->eventfd);
+	kfree(irqfd);
+}
+
+/**
+ * bao_irqfd_assign - Assign an eventfd to a DM and create an irqfd
+ * @dm: Bao device model to assign the eventfd
+ * @args: Configuration of the irqfd to assign
+ *
+ * Return: 0 on success, a negative error code on failure
+ */
+static int bao_irqfd_assign(struct bao_dm *dm, struct bao_irqfd *args)
+{
+	struct eventfd_ctx *eventfd = NULL;
+	struct irqfd *irqfd;
+	struct irqfd *tmp;
+	__poll_t events;
+	struct fd f;
+	int ret = 0;
+
+	if (WARN_ON_ONCE(!dm || !args))
+		return -EINVAL;
+
+	irqfd = kzalloc_obj(*irqfd);
+	if (!irqfd)
+		return -ENOMEM;
+
+	irqfd->dm = dm;
+	INIT_LIST_HEAD(&irqfd->list);
+	INIT_WORK(&irqfd->shutdown, irqfd_shutdown_work);
+
+	f = fdget(args->fd);
+	if (!fd_file(f)) {
+		ret = -EBADF;
+		goto out_free_irqfd;
+	}
+
+	eventfd = eventfd_ctx_fileget(fd_file(f));
+	if (IS_ERR(eventfd)) {
+		ret = PTR_ERR(eventfd);
+		goto out_fdput;
+	}
+	irqfd->eventfd = eventfd;
+
+	init_waitqueue_func_entry(&irqfd->wait, bao_irqfd_wakeup);
+	init_poll_funcptr(&irqfd->pt, bao_irqfd_poll_func);
+
+	/*
+	 * Hold irqfds_lock across the waitqueue install (vfs_poll) and list_add
+	 * so the irqfd is not visible to deassign/destroy before its waitqueue
+	 * entry is in place, and any racing POLLHUP cleanup work blocks on
+	 * irqfds_lock until publication completes.
+	 */
+	mutex_lock(&dm->irqfds_lock);
+	if (dm->nr_irqfds >= BAO_IRQFD_MAX) {
+		ret = -ENOSPC;
+		mutex_unlock(&dm->irqfds_lock);
+		goto out_put_eventfd;
+	}
+
+	list_for_each_entry(tmp, &dm->irqfds, list) {
+		if (irqfd->eventfd == tmp->eventfd) {
+			ret = -EBUSY;
+			mutex_unlock(&dm->irqfds_lock);
+			goto out_put_eventfd;
+		}
+	}
+
+	events = vfs_poll(fd_file(f), &irqfd->pt);
+	list_add_tail(&irqfd->list, &dm->irqfds);
+	dm->nr_irqfds++;
+	if (events & EPOLLIN)
+		bao_irqfd_inject(dm->info.id);
+	mutex_unlock(&dm->irqfds_lock);
+
+	fdput(f);
+	return 0;
+
+out_put_eventfd:
+	eventfd_ctx_put(eventfd);
+out_fdput:
+	fdput(f);
+out_free_irqfd:
+	kfree(irqfd);
+	return ret;
+}
+
+/**
+ * bao_irqfd_deassign - Deassign an eventfd and destroy the associated irqfd
+ * @dm: Bao device model to remove the irqfd from
+ * @args: Configuration of the irqfd to deassign
+ *
+ * Return: 0 on success, -ENOENT if no irqfd uses that eventfd, another
+ * negative error code on failure
+ */
+static int bao_irqfd_deassign(struct bao_dm *dm, struct bao_irqfd *args)
+{
+	struct irqfd *irqfd;
+	struct irqfd *tmp;
+	struct eventfd_ctx *eventfd;
+	int ret = -ENOENT;
+
+	if (WARN_ON_ONCE(!dm || !args))
+		return -EINVAL;
+
+	eventfd = eventfd_ctx_fdget(args->fd);
+	if (IS_ERR(eventfd))
+		return PTR_ERR(eventfd);
+
+	mutex_lock(&dm->irqfds_lock);
+	list_for_each_entry_safe(irqfd, tmp, &dm->irqfds, list) {
+		if (irqfd->eventfd == eventfd) {
+			list_del_init(&irqfd->list);
+			dm->nr_irqfds--;
+			bao_irqfd_queue_shutdown(irqfd);
+			ret = 0;
+			break;
+		}
+	}
+	mutex_unlock(&dm->irqfds_lock);
+
+	eventfd_ctx_put(eventfd);
+
+	/* Wait for cleanup work to finish so the eventfd is fully detached. */
+	if (!ret)
+		flush_workqueue(dm->irqfd_server);
+
+	return ret;
+}
+
+int bao_irqfd_server_config(struct bao_dm *dm, struct bao_irqfd *config)
+{
+	if (WARN_ON_ONCE(!dm || !config))
+		return -EINVAL;
+
+	if (config->flags & ~BAO_IRQFD_FLAG_DEASSIGN)
+		return -EINVAL;
+
+	if (config->flags & BAO_IRQFD_FLAG_DEASSIGN)
+		return bao_irqfd_deassign(dm, config);
+
+	return bao_irqfd_assign(dm, config);
+}
+
+int bao_irqfd_server_init(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm))
+		return -EINVAL;
+
+	mutex_init(&dm->irqfds_lock);
+	INIT_LIST_HEAD(&dm->irqfds);
+
+	dm->irqfd_server = alloc_workqueue("bao-ioirqfds%u",
+					   WQ_UNBOUND | WQ_HIGHPRI, 0,
+					   dm->info.id);
+	if (!dm->irqfd_server)
+		return -ENOMEM;
+
+	return 0;
+}
+
+void bao_irqfd_server_destroy(struct bao_dm *dm)
+{
+	struct irqfd *irqfd;
+	struct irqfd *next;
+
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	mutex_lock(&dm->irqfds_lock);
+	list_for_each_entry_safe(irqfd, next, &dm->irqfds, list) {
+		list_del_init(&irqfd->list);
+		dm->nr_irqfds--;
+		bao_irqfd_queue_shutdown(irqfd);
+	}
+	mutex_unlock(&dm->irqfds_lock);
+
+	/* Drain all cleanup work before tearing the workqueue down. */
+	if (dm->irqfd_server) {
+		flush_workqueue(dm->irqfd_server);
+		destroy_workqueue(dm->irqfd_server);
+	}
+}
diff --git a/include/uapi/linux/bao.h b/include/uapi/linux/bao.h
new file mode 100644
index 000000000000..162880d0cbdf
--- /dev/null
+++ b/include/uapi/linux/bao.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Provides the Bao Hypervisor IOCTLs and global structures
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#ifndef _UAPI_BAO_H
+#define _UAPI_BAO_H
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+/**
+ * struct bao_virtio_request - Parameters of a Bao VirtIO request
+ * @dm_id: Device model ID (set by the kernel; ignored on input, the DM is
+ *         the one bound to the file descriptor)
+ * @addr: MMIO register address accessed
+ * @op: Operation type, BAO_IO_WRITE or BAO_IO_READ
+ * @value: Value to write or read
+ * @access_width: Access width (VirtIO MMIO supports 4-byte aligned accesses)
+ * @request_id: Request ID of the I/O request
+ *
+ * BAO_IOCTL_IO_CLIENT_ATTACH fills in a request; BAO_IOCTL_IO_REQUEST_COMPLETE
+ * completes the request with that @request_id, which must be a read or a write
+ * handed out on the same file descriptor, taking only @value from userspace.
+ */
+struct bao_virtio_request {
+	__u64 dm_id;
+	__u64 addr;
+	__u64 op;
+	__u64 value;
+	__u64 access_width;
+	__u64 request_id;
+};
+
+/* Values of bao_virtio_request.op: the frontend wrote to, or read from, @addr */
+#define BAO_IO_WRITE 0
+#define BAO_IO_READ 1
+
+/**
+ * struct bao_ioeventfd - Parameters of an ioeventfd request
+ * @fd: Eventfd file descriptor associated with the I/O request
+ * @flags: Logical OR of BAO_IOEVENTFD_FLAG_*
+ * @addr: Start address of the I/O range
+ * @len: Length of the I/O range
+ * @reserved: Reserved, must be 0
+ * @data: Data for matching (used if data matching is enabled)
+ */
+struct bao_ioeventfd {
+	__s32 fd;
+	__u32 flags;
+	__u64 addr;
+	__u32 len;
+	__u32 reserved;
+	__u64 data;
+};
+
+/* Only signal the eventfd when the written value equals bao_ioeventfd.data */
+#define BAO_IOEVENTFD_FLAG_DATAMATCH (1U << 1)
+/* Remove the ioeventfd instead of adding it */
+#define BAO_IOEVENTFD_FLAG_DEASSIGN (1U << 2)
+
+/**
+ * struct bao_irqfd - Parameters of an IRQFD request
+ * @fd: File descriptor of the eventfd
+ * @flags: Logical OR of BAO_IRQFD_FLAG_*
+ */
+struct bao_irqfd {
+	__s32 fd;
+	__u32 flags;
+};
+
+/* Remove the irqfd instead of adding it */
+#define BAO_IRQFD_FLAG_DEASSIGN (1U << 0)
+
+/**
+ * struct bao_dm_info - Parameters of a Bao device model
+ * @shmem_addr: Base address of the shared memory
+ * @shmem_size: Size of the shared memory
+ * @id: Virtual ID of the DM
+ * @irq: Hypervisor notification line, as a line of the system's root
+ *       interrupt controller (e.g. a GIC SPI on arm64, a PLIC source on
+ *       riscv), which the driver maps and uses as the backend I/O doorbell
+ *
+ * The layout is free of implicit padding so it is identical on every
+ * architecture.
+ */
+struct bao_dm_info {
+	__u64 shmem_addr;
+	__u64 shmem_size;
+	__u32 id;
+	__u32 irq;
+};
+
+/*
+ * The ioctl type for Bao, documented in
+ * Documentation/userspace-api/ioctl/ioctl-number.rst
+ */
+#define BAO_IOCTL_TYPE 0xA7
+
+/*
+ * Bao userspace IOCTL commands
+ * Follows Linux kernel convention, see Documentation/driver-api/ioctl.rst
+ */
+/*
+ * Issued on the /dev/bao control device by the userspace VMM to instantiate a
+ * device model from its own configuration. On success returns a new file
+ * descriptor bound to that DM; all other commands below operate on that fd.
+ */
+#define BAO_IOCTL_CREATE_DM _IOW(BAO_IOCTL_TYPE, 0x00, struct bao_dm_info)
+#define BAO_IOCTL_DM_GET_INFO _IOR(BAO_IOCTL_TYPE, 0x01, struct bao_dm_info)
+/* Waits for the next I/O request of the DM and returns it */
+#define BAO_IOCTL_IO_CLIENT_ATTACH \
+	_IOR(BAO_IOCTL_TYPE, 0x02, struct bao_virtio_request)
+#define BAO_IOCTL_IO_REQUEST_COMPLETE \
+	_IOW(BAO_IOCTL_TYPE, 0x03, struct bao_virtio_request)
+#define BAO_IOCTL_IOEVENTFD _IOW(BAO_IOCTL_TYPE, 0x04, struct bao_ioeventfd)
+#define BAO_IOCTL_IRQFD _IOW(BAO_IOCTL_TYPE, 0x05, struct bao_irqfd)
+
+#endif /* _UAPI_BAO_H */
-- 
2.53.0


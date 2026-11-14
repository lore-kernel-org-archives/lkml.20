Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650461;
	b=B9UeOvl8w/X00AeDmp8yqr9AhHp9tzIZQOCyzg7BBrE/Ko2MhDDvnxX2TJA3+DoWMZTd
	 R5IKiHr4YHgo4OYMKap5XFl2lPehOTrbsqgjGkaCM0bJsIJJqldadJ0maY2tm/w2IjldA
	 KeuPdu/u9i3S0jGRKRQAYl1SbSdW0HuY08R0Q+14xHeLrakisO+nr9HWJA/Uv5xWc/0W0
	 D/bkzgSXotSM2qhXGZP44OI9Rl3I6FrSnkal5RekLX/ZbZOhEhsOPpqX1WD4uLqQZZMnI
	 xN+HPYFFNDpGXcfN1O7bACS8ajvjmgt9dx2W/b7QiDTU6e3ev1U9XEy2FNMIYDB8QDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qF+3vxELRVpyCrlAHf6qIqSNuHytCJhCff2ZCt5jj5Y=;
	b=gzWcSRHKCvxUfrrsglN37FgD8AIgM/LLNIQr3nph9R+7QZmlhsA/lbs7yHrLwlp/1tqu
	 oYA281RgQdAqpGSJ0vu3T6++nucHS4u0cJR7orD6OF7ZcbODAq9MKiaJDMhQquXXRjpEu
	 qot5p8a4DQWxP0ostAiu6/O3wNH5fIVPD3J4W78ApsELBxpL/KzZ1D6yewa7iD7jwEQ5Q
	 9xOrpThvjDO53++3L9UZDyHwr1U7747cWYHTb4kzgmqFTD5T4VvOHGWOgT4jXNrUA0pwu
	 eK+yNNUVM9DPJgRnxlEOVmAULp82YjjTJV0gASHVKG4wU7crwautvAdeud06n9pTxhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RSr4PMUu;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB6F606A886
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB6F606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RSr4PMUu
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-498f5fa5103so737863f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794650458; x=1795255258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qF+3vxELRVpyCrlAHf6qIqSNuHytCJhCff2ZCt5jj5Y=;
        b=RSr4PMUuhYTOJuQUYBT9LIk7/4vC4n5rSKgEMngc63DWc4nwhOgCNWiST6bic5Esje
         f2UdcdLdKrR9mJJ1OxyA+PwrLWZEAduTEJ6qZJ25QrOvb3jAwyvP1piwnkhRmmhBPKDV
         cd2VKdBcM4mLa7IdtEGRLnxoNli1TK56Nm4ALZss3ORKk+VHOZhdGtFUUDuLOk9Ol/Mb
         XQ+RwNM6pZDfAKqT/VaYDQK3dqZiSgg4cIQmIcYw2MKlgAgm1xlb4KWoYkYnW0fqxkj9
         3NMUtnN2tnrDPKCJUPl8EGA2l+cYxPvoE4wL2sLv2b5mlK+pOk3DUyPidcon2LcmjGzf
         a7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650458; x=1795255258;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qF+3vxELRVpyCrlAHf6qIqSNuHytCJhCff2ZCt5jj5Y=;
        b=v3jewzgpeNj3mmO/iJlKWMacAZMBUGcdYZGeWrZCa9/s7RJb8Cc75qvERQL3MFShpB
         yK3iyCUGsstiKBkyrkIuM72QIMwcufhA0ZpL4b4hRvB3OrZMxF+89Q+dbvEc7sXqqZn+
         wJ9ynREJvwSxRsjuaWkbKhN5/PUmX7eMGd/0PsJO2om/I2lHKtzSl3tm1Gcxdgy2Jsrt
         oR0BDZnwQUXJgxX6lGI9R0IB+ESPDyjhEB+AnIhMfPZy/gbPagEQwKWHHzyRRZBCR0yJ
         yEr+9rhPc5e0EMBgZja7oYkd46Ow6yEBxbXqKWrXf1/8HSgfAtf2NuK+TJ6vy1ykw0qE
         K9kA==
X-Forwarded-Encrypted: i=1; AL+hErEqrEvZPl72fI9m/ArxpFfEmw0mSjX07A3UfCNIX41b1E/+p06GREppWW2Qv5zsdXWkLhuxUeljNrYuAWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aUfppL3N0wmtzPM0uYb4aruTT9CTn0sNqVomysubjrwIoFszc
	6VqO+lu994hAt54/dcSiAWmHSV87N+hn2MpT/dB6zo9k/r72e+fLy/gdUMsxgL7VfI7UQvmCV61
	eEEIEW+pn
X-Gm-Gg: AYBFou14YrfIjawUcvHJBo7wg3JVNdDue9aKGRTNdexcbQas89G3jA2h4Thbwb1XwSv
	+20uAZF6+Gtce1L135wzSaW9nvvrYdaE0sB6DyLF2uBHBBkN2XUisgyt22UmPcla6B2EqGK0OyN
	c1nzpPhI1vghNeIck0e75sbpNchauSa1b/MZ1SXjEdtplZXkLhtkAlW1M1O8O3Mr3aMoooepHqG
	eXkJM43yKo5QFbcm6aGlAGn5nG6fdW3Guc7aWKk9HdjZw0UmjWFLopmKJjec0woQsHblolki6VW
	1yx7Pqqq64ac3CSDu42NpzeT1zmMfs9jNlHc/Pxjn38TZqc/KXc2RnXR2JTejpgbFo8lOqB3AFn
	wPte2RFCiw5PRmj7lM2VIu/fB9uvbe6zvipn4D6Fz0K/VaPROueo9vHjuA9rv/6nWyBmmHmMbyt
	rPUX1/VeXxu4M7r3dty6daD3mYsdhqHhocUDauz26tKKxyJkXbSzBpygIXgEbKFwl/hFMFEWztF
	zszE1pg36+EOUpF22G64C0wkFQsDgN+Ls72VL9WlDZ9rAmNFe/VwsUxw4JTEz5y18UTRDGAjkIP
	SF4YQIou6h+25MMbvlBnMpdgeifPyRD4kcjJlHi58pQabLVhs7oTSlo=
X-Received: by 2002:a05:6000:29cf:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-49c712ac8edmr5896985f8f.18.1794650457845;
        Sat, 14 Nov 2026 02:00:57 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:a084:d599:46a5:5c31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm16920053f8f.44.2026.11.14.02.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:00:57 -0800 (PST)
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
Subject: [PATCH v7 1/3] virt: bao: add IPC shared-memory driver
Date: Sat, 14 Nov 2026 10:00:47 +0000
Message-ID: <bd1eb97aa4a264fef07108c97cd1017bfbfed370.1794649714.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794649714.git.jpeixoto@osyx.tech>
References: <cover.1794649714.git.jpeixoto@osyx.tech>
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

Add a driver that lets guests running on the Bao static-partitioning
hypervisor communicate through shared memory. Each guest is assigned a
read and a write region within a shared-memory area.

The IPC channels are a pure software contract between the Bao hypervisor
and its guests, so they are not described in the device tree. Each
channel is instead declared on the kernel command line:

  bao_ipcshmem.channels=<channel>[;<channel>...]

where each <channel> is

  <id>,<read_base>,<read_size>,<write_base>,<write_size>

The parameter is documented in kernel-parameters.txt.

Userspace accesses the regions through a misc character device using
read(), write() and mmap(). The read region is written by the peer and
mapped read-only at stage 2, so a writable mapping of it is refused, and
so are private mappings, whose writes would never reach the peer. A
write() notifies the peer guest through a hypercall issued with the
architecture's standard hypervisor call convention: an SMCCC fast call
in the vendor-specific hypervisor service range (HVC) on arm/arm64 and
an SBI extension call (ecall) on RISC-V. The helpers live in the driver
directory, built on the generic SMCCC and SBI support, so no
architecture code is needed.

The regions are validated when parsed (page-aligned, not wrapping, not
overlapping System RAM, so a channel cannot be pointed at kernel
memory). The misc devices are only registered once every channel is set
up, and once one of them is registered a later failure only drops its
own channel, so module init never fails with a device already open.

Co-developed-by: José Martins <jose@osyx.tech>
Signed-off-by: José Martins <jose@osyx.tech>
Co-developed-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v7:
- No change.
v6:
- No change.
v5:
- Register the misc devices only once every channel has been parsed and
  mapped (Sashiko review), and never unregister one from module init:
  once a device is registered, a later misc_register() failure only
  drops its own channel, since the device may already be open. Refuse
  duplicate channel ids.
- Refuse regions overlapping System RAM (region_intersects()), so a
  channel cannot be pointed at kernel memory.
- Fail write() with -EIO when the notification hypercall fails.
- Use .mmap_prepare (.mmap is deprecated) and refuse private mappings,
  whose writes would never reach the peer.
- RISC-V: take the hypercall status from the SBI value (a1), where Bao
  returns it; the SBI error (a0) only says whether the extension exists.
- Kconfig: depend on RISCV_SBI instead of RISCV; sbi_ecall() does not
  exist in M-mode kernels, which failed to build the driver.
- Document bao_ipcshmem.channels= in kernel-parameters.txt.
- Rebase on v7.4-rc1; use kzalloc_obj().
v4:
- Drop the device-tree binding and the platform driver; the channels are
  declared on the kernel command line (bao_ipcshmem.channels=<id>,<read_base>,
  <read_size>,<write_base>,<write_size>[;...]) and the misc devices are
  created from module init (Krzysztof Kozlowski).
- Move the hypercall helper out of arch/ into drivers/virt/bao/bao_hypercall.h,
  built on arm_smccc_hvc() (arm/arm64) and sbi_ecall() (RISC-V); the hypercall
  ID is defined there, folding the v3 "consolidate the IPC hypercall ID" patch
  (Will Deacon, Andrew Jones).
- Kconfig: depend on HAVE_ARM_SMCCC || RISCV; the module is now bao_ipcshmem,
  so the documented parameter name is real.
- Add wmb() before the notify hypercall; refuse writable mappings of the read
  region and clear VM_MAYWRITE; require page-aligned regions and reject ranges
  that do not fit phys_addr_t/size_t; add .llseek; enlarge the label buffer;
  do the mmap offset arithmetic in u64 (Sashiko review).
- Devices live and die with the module and open files pin it, closing the
  unbind use-after-free of v3.

 .../admin-guide/kernel-parameters.txt         |  15 +
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/Makefile                         |   1 +
 drivers/virt/bao/Kconfig                      |   3 +
 drivers/virt/bao/Makefile                     |   3 +
 drivers/virt/bao/bao_hypercall.h              |  97 ++++
 drivers/virt/bao/ipcshmem/Kconfig             |  16 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 421 ++++++++++++++++++
 9 files changed, 561 insertions(+)
 create mode 100644 drivers/virt/bao/Kconfig
 create mode 100644 drivers/virt/bao/Makefile
 create mode 100644 drivers/virt/bao/bao_hypercall.h
 create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
 create mode 100644 drivers/virt/bao/ipcshmem/Makefile
 create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..91ee34e7c410 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -621,6 +621,21 @@ Kernel parameters
 			Format: <int> (must be >=0)
 			Default: 64
 
+	bao_ipcshmem.channels=
+			[ARM,ARM64,RISCV] Shared-memory IPC channels of a
+			guest of the Bao hypervisor (CONFIG_BAO_SHMEM), each
+			exposed as /dev/baoipc<id>.
+			Format: <channel>[;<channel>...]
+			where <channel> is
+			<id>,<read_base>,<read_size>,<write_base>,<write_size>
+			<id> is the channel id assigned by the hypervisor
+			and passed to its notification hypercall. The read
+			region is written by the peer guest, the write
+			region by this one. Bases and sizes are physical
+			addresses and sizes, decimal or 0x-prefixed hex,
+			page-aligned and outside System RAM.
+			Example: 0,0xf0000000,0x2000,0xf0002000,0x2000
+
 	bdev_allow_write_mounted=
 			Format: <bool>
 			Control the ability to open a mounted block device
diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index eeb84e578ddf..77e10b59e386 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -64,6 +64,8 @@ source "drivers/virt/nitro_enclaves/Kconfig"
 
 source "drivers/virt/acrn/Kconfig"
 
+source "drivers/virt/bao/Kconfig"
+
 endif
 
 source "drivers/virt/coco/Kconfig"
diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index 05fb075ef5b8..878b87469bb3 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -11,3 +11,4 @@ obj-y				+= vboxguest/
 obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
 obj-$(CONFIG_ACRN_HSM)		+= acrn/
 obj-y				+= coco/
+obj-y				+= bao/
diff --git a/drivers/virt/bao/Kconfig b/drivers/virt/bao/Kconfig
new file mode 100644
index 000000000000..4f7929d57475
--- /dev/null
+++ b/drivers/virt/bao/Kconfig
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+source "drivers/virt/bao/ipcshmem/Kconfig"
diff --git a/drivers/virt/bao/Makefile b/drivers/virt/bao/Makefile
new file mode 100644
index 000000000000..68f5d3f282c4
--- /dev/null
+++ b/drivers/virt/bao/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_BAO_SHMEM) += ipcshmem/
diff --git a/drivers/virt/bao/bao_hypercall.h b/drivers/virt/bao/bao_hypercall.h
new file mode 100644
index 000000000000..7a68c29feb48
--- /dev/null
+++ b/drivers/virt/bao/bao_hypercall.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Bao Hypervisor hypercall interface
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ *
+ * Bao exposes its hypercalls through the architecture's standard hypervisor
+ * call convention: SMCCC fast calls in the vendor-specific hypervisor service
+ * range, issued with HVC, on arm/arm64 and an SBI extension, issued with
+ * ecall, on RISC-V. The helpers below are built on the generic SMCCC and SBI
+ * support, so no architecture-specific code is needed.
+ */
+
+#ifndef __BAO_HYPERCALL_H
+#define __BAO_HYPERCALL_H
+
+#include <linux/types.h>
+
+/* IPC through shared-memory hypercall ID */
+#define BAO_IPCSHMEM_HYPERCALL_ID 0x1
+
+#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
+
+#include <linux/arm-smccc.h>
+
+#ifdef CONFIG_ARM64
+#define BAO_SMCCC_CONV ARM_SMCCC_SMC_64
+#else
+#define BAO_SMCCC_CONV ARM_SMCCC_SMC_32
+#endif
+
+/* Bao hypercalls are fast calls in the vendor-specific hypervisor range. */
+#define BAO_HYPERCALL_FID(id)						\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, BAO_SMCCC_CONV,		\
+			   ARM_SMCCC_OWNER_VENDOR_HYP, (id))
+
+/**
+ * bao_ipcshmem_hypercall - Notify the peer of an IPC shared-memory channel
+ * @ipcshmem_id: Hypervisor-assigned channel identifier
+ *
+ * Return: The hypervisor status code, 0 on success.
+ */
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_hvc(BAO_HYPERCALL_FID(BAO_IPCSHMEM_HYPERCALL_ID), ipcshmem_id,
+		      0, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+#elif defined(CONFIG_RISCV)
+
+#include <asm/sbi.h>
+
+/*
+ * Bao SBI extension ID.
+ *
+ * This currently lives in the SBI experimental extension space
+ * (0x08000000-0x08FFFFFF). A permanent ID has to be assigned through the
+ * RISC-V SBI specification before the RISC-V support can be considered
+ * stable; until then the RISC-V backend is experimental.
+ *
+ * Every call of the extension succeeds from the SBI point of view: the SBI
+ * error (a0) only tells whether the extension is implemented, and the status
+ * of the hypercall itself is returned as the SBI value (a1).
+ */
+#define BAO_SBI_EXT_ID 0x08000ba0
+
+/**
+ * bao_ipcshmem_hypercall - Notify the peer of an IPC shared-memory channel
+ * @ipcshmem_id: Hypervisor-assigned channel identifier
+ *
+ * Return: The hypervisor status code, 0 on success, or the SBI error if the
+ * extension is not implemented.
+ */
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(BAO_SBI_EXT_ID, BAO_IPCSHMEM_HYPERCALL_ID, ipcshmem_id,
+			0, 0, 0, 0, 0);
+	if (ret.error)
+		return ret.error;
+
+	return ret.value;
+}
+
+#endif
+
+#endif /* __BAO_HYPERCALL_H */
diff --git a/drivers/virt/bao/ipcshmem/Kconfig b/drivers/virt/bao/ipcshmem/Kconfig
new file mode 100644
index 000000000000..517d761a3c08
--- /dev/null
+++ b/drivers/virt/bao/ipcshmem/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+config BAO_SHMEM
+	tristate "Bao hypervisor shared memory support"
+	depends on HAVE_ARM_SMCCC || RISCV_SBI
+	help
+	  This enables support for Bao shared memory communication.
+	  It allows the kernel to interface with guests running under
+	  the Bao hypervisor, providing a character device interface
+	  for exchanging data through dedicated shared-memory regions.
+	  Channels are declared on the kernel command line via
+	  "bao_ipcshmem.channels=".
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called bao_ipcshmem.
+
+	  If unsure, say N.
diff --git a/drivers/virt/bao/ipcshmem/Makefile b/drivers/virt/bao/ipcshmem/Makefile
new file mode 100644
index 000000000000..2fa38c301ee0
--- /dev/null
+++ b/drivers/virt/bao/ipcshmem/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_BAO_SHMEM) += bao_ipcshmem.o
+bao_ipcshmem-y := ipcshmem.o
diff --git a/drivers/virt/bao/ipcshmem/ipcshmem.c b/drivers/virt/bao/ipcshmem/ipcshmem.c
new file mode 100644
index 000000000000..3850abf3d4f3
--- /dev/null
+++ b/drivers/virt/bao/ipcshmem/ipcshmem.c
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor IPC Through Shared-memory Driver
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * The IPC shared-memory channels are a pure software contract between the Bao
+ * hypervisor and its guests, so they are not described in the device tree.
+ * Each channel is instead declared on the kernel command line:
+ *
+ *   bao_ipcshmem.channels=<channel>[;<channel>...]
+ *
+ * where each <channel> is
+ *
+ *   <id>,<read_base>,<read_size>,<write_base>,<write_size>
+ *
+ * Addresses and sizes are parsed with kstrtoull() (so "0x" hex is accepted)
+ * and must be page-aligned.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/list.h>
+#include <linux/miscdevice.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/wordpart.h>
+#include "../bao_hypercall.h"
+
+/* "baoipc" + up to 10 digits of a u32 + NUL. */
+#define BAO_IPCSHMEM_NAME_LEN 24
+
+static char *channels;
+module_param(channels, charp, 0444);
+MODULE_PARM_DESC(channels,
+		 "Bao IPC channels: <id>,<read_base>,<read_size>,<write_base>,<write_size>[;...]");
+
+/**
+ * struct bao_ipcshmem - a single Bao IPC shared-memory channel
+ * @list: entry in the global channel list
+ * @miscdev: character device exposing the channel to userspace
+ * @id: hypervisor-assigned channel identifier, passed to the notify hypercall
+ * @label: backing storage for @miscdev.name
+ * @read_base: kernel mapping of the region this guest reads from
+ * @read_phys: physical base of the read region
+ * @read_size: size of the read region
+ * @write_base: kernel mapping of the region this guest writes to
+ * @write_phys: physical base of the write region
+ * @write_size: size of the write region
+ * @registered: @miscdev is registered
+ */
+struct bao_ipcshmem {
+	struct list_head list;
+	struct miscdevice miscdev;
+	u32 id;
+	bool registered;
+	char label[BAO_IPCSHMEM_NAME_LEN];
+	void *read_base;
+	phys_addr_t read_phys;
+	size_t read_size;
+	void *write_base;
+	phys_addr_t write_phys;
+	size_t write_size;
+};
+
+static LIST_HEAD(bao_ipcshmem_devices);
+
+static int bao_ipcshmem_mmap_prepare(struct vm_area_desc *desc)
+{
+	struct bao_ipcshmem *bao = desc->file->private_data;
+	unsigned long vsize = vma_desc_size(desc);
+	u64 offset = (u64)desc->pgoff << PAGE_SHIFT;
+	phys_addr_t region_phys;
+	size_t region_size;
+	bool read_region;
+
+	/*
+	 * The regions are shared with the peer guest: what is written to a
+	 * private copy of them would never reach it.
+	 */
+	if (!vma_desc_test(desc, VMA_MAYSHARE_BIT))
+		return -EINVAL;
+
+	/*
+	 * The read region is exposed at offset 0 and the write region right
+	 * after it. A single mapping cannot span both regions, since they are
+	 * not guaranteed to be physically contiguous.
+	 */
+	if (offset < bao->read_size) {
+		region_phys = bao->read_phys;
+		region_size = bao->read_size;
+		read_region = true;
+	} else if (offset < (u64)bao->read_size + bao->write_size) {
+		offset -= bao->read_size;
+		region_phys = bao->write_phys;
+		region_size = bao->write_size;
+		read_region = false;
+	} else {
+		return -EINVAL;
+	}
+
+	/*
+	 * The read region is written by the peer and is read-only for this
+	 * guest; the hypervisor maps it read-only at stage 2, so refuse a
+	 * writable mapping rather than let userspace take a stage-2 fault,
+	 * and make sure a later mprotect(PROT_WRITE) cannot re-enable it.
+	 */
+	if (read_region) {
+		if (vma_desc_test(desc, VMA_WRITE_BIT))
+			return -EACCES;
+		vma_desc_clear_flags(desc, VMA_MAYWRITE_BIT);
+	}
+
+	if (vsize > region_size - offset)
+		return -EINVAL;
+
+	mmap_action_remap_full(desc, PHYS_PFN(region_phys + offset));
+
+	return 0;
+}
+
+static ssize_t bao_ipcshmem_read(struct file *filp, char __user *buf,
+				 size_t count, loff_t *ppos)
+{
+	struct bao_ipcshmem *bao = filp->private_data;
+	size_t available;
+
+	if (*ppos >= bao->read_size)
+		return 0;
+
+	available = bao->read_size - *ppos;
+	count = min(count, available);
+
+	if (copy_to_user(buf, bao->read_base + *ppos, count))
+		return -EFAULT;
+
+	*ppos += count;
+	return count;
+}
+
+static ssize_t bao_ipcshmem_write(struct file *filp, const char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	struct bao_ipcshmem *bao = filp->private_data;
+	size_t available;
+
+	if (*ppos >= bao->write_size)
+		return 0;
+
+	available = bao->write_size - *ppos;
+	count = min(count, available);
+
+	if (copy_from_user(bao->write_base + *ppos, buf, count))
+		return -EFAULT;
+
+	/*
+	 * Ensure the data written above is globally visible before the
+	 * hypercall notifies the peer guest (SMCCC requires the caller to make
+	 * memory updates visible before the SMC/HVC).
+	 */
+	wmb();
+
+	/*
+	 * Notify the peer through the hypervisor. The data is in place, but a
+	 * write the peer is never told about did not complete: report it and
+	 * leave the position alone so a retry rewrites the same bytes.
+	 */
+	if (bao_ipcshmem_hypercall(bao->id)) {
+		pr_warn_ratelimited("channel %u: notification failed\n", bao->id);
+		return -EIO;
+	}
+
+	*ppos += count;
+
+	return count;
+}
+
+static int bao_ipcshmem_open(struct inode *inode, struct file *filp)
+{
+	struct bao_ipcshmem *bao;
+
+	bao = container_of(filp->private_data, struct bao_ipcshmem, miscdev);
+	filp->private_data = bao;
+
+	return 0;
+}
+
+static int bao_ipcshmem_release(struct inode *inode, struct file *filp)
+{
+	filp->private_data = NULL;
+	return 0;
+}
+
+static const struct file_operations bao_ipcshmem_fops = {
+	.owner = THIS_MODULE,
+	.read = bao_ipcshmem_read,
+	.write = bao_ipcshmem_write,
+	.mmap_prepare = bao_ipcshmem_mmap_prepare,
+	.open = bao_ipcshmem_open,
+	.release = bao_ipcshmem_release,
+	.llseek = default_llseek,
+};
+
+static void bao_ipcshmem_free(struct bao_ipcshmem *bao)
+{
+	if (bao->write_base)
+		memunmap(bao->write_base);
+	if (bao->read_base)
+		memunmap(bao->read_base);
+	kfree(bao);
+}
+
+/*
+ * A region must be non-empty and page-aligned, must not wrap around and must
+ * be addressable on this architecture (the command line values are 64-bit).
+ * It is memory the hypervisor shares between guests, never part of this
+ * guest's RAM, so anything overlapping System RAM is refused: a channel can
+ * not be pointed at kernel memory.
+ */
+static bool bao_ipcshmem_region_valid(u64 base, u64 size)
+{
+	u64 end;
+
+	if (!size || !PAGE_ALIGNED(base) || !PAGE_ALIGNED(size))
+		return false;
+
+	end = base + size - 1;
+	if (end < base)
+		return false;
+
+	if (sizeof(phys_addr_t) < sizeof(u64) && upper_32_bits(end))
+		return false;
+
+	if (sizeof(size_t) < sizeof(u64) && upper_32_bits(size))
+		return false;
+
+	if (region_intersects(base, size, IORESOURCE_SYSTEM_RAM,
+			      IORES_DESC_NONE) != REGION_DISJOINT)
+		return false;
+
+	return true;
+}
+
+static bool bao_ipcshmem_id_in_use(u32 id)
+{
+	struct bao_ipcshmem *bao;
+
+	list_for_each_entry(bao, &bao_ipcshmem_devices, list) {
+		if (bao->id == id)
+			return true;
+	}
+
+	return false;
+}
+
+static int bao_ipcshmem_add(u32 id, u64 read_base, u64 read_size,
+			    u64 write_base, u64 write_size)
+{
+	struct bao_ipcshmem *bao;
+	int ret;
+
+	if (!bao_ipcshmem_region_valid(read_base, read_size) ||
+	    !bao_ipcshmem_region_valid(write_base, write_size)) {
+		pr_err("channel %u: invalid region\n", id);
+		return -EINVAL;
+	}
+
+	if (bao_ipcshmem_id_in_use(id)) {
+		pr_err("channel %u: duplicate id\n", id);
+		return -EEXIST;
+	}
+
+	bao = kzalloc_obj(*bao);
+	if (!bao)
+		return -ENOMEM;
+
+	bao->id = id;
+	bao->read_phys = read_base;
+	bao->read_size = read_size;
+	bao->write_phys = write_base;
+	bao->write_size = write_size;
+
+	bao->read_base = memremap(bao->read_phys, bao->read_size, MEMREMAP_WB);
+	if (!bao->read_base) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
+
+	bao->write_base = memremap(bao->write_phys, bao->write_size,
+				   MEMREMAP_WB);
+	if (!bao->write_base) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
+
+	scnprintf(bao->label, sizeof(bao->label), "baoipc%u", id);
+	bao->miscdev.minor = MISC_DYNAMIC_MINOR;
+	bao->miscdev.name = bao->label;
+	bao->miscdev.fops = &bao_ipcshmem_fops;
+
+	list_add_tail(&bao->list, &bao_ipcshmem_devices);
+	return 0;
+
+err_free:
+	bao_ipcshmem_free(bao);
+	return ret;
+}
+
+/*
+ * The devices are only exposed to userspace once every channel has been
+ * parsed and mapped, so a bad descriptor cannot make module_init() fail
+ * while a device it already registered is open. For the same reason, once
+ * one device is registered a failure to register another one only drops
+ * that channel.
+ */
+static int bao_ipcshmem_register_all(void)
+{
+	struct bao_ipcshmem *bao, *tmp;
+	bool registered = false;
+	int ret = 0;
+
+	list_for_each_entry_safe(bao, tmp, &bao_ipcshmem_devices, list) {
+		ret = misc_register(&bao->miscdev);
+		if (ret) {
+			pr_err("channel %u: misc_register failed: %d\n",
+			       bao->id, ret);
+			list_del(&bao->list);
+			bao_ipcshmem_free(bao);
+			continue;
+		}
+		bao->registered = true;
+		registered = true;
+	}
+
+	return registered ? 0 : ret;
+}
+
+static void bao_ipcshmem_remove_all(void)
+{
+	struct bao_ipcshmem *bao, *tmp;
+
+	list_for_each_entry_safe(bao, tmp, &bao_ipcshmem_devices, list) {
+		list_del(&bao->list);
+		if (bao->registered)
+			misc_deregister(&bao->miscdev);
+		bao_ipcshmem_free(bao);
+	}
+}
+
+/* Parse one "<id>,<rbase>,<rsize>,<wbase>,<wsize>" channel descriptor. */
+static int bao_ipcshmem_parse_one(char *desc)
+{
+	u64 vals[4];
+	char *tok;
+	u32 id;
+	int i;
+
+	tok = strsep(&desc, ",");
+	if (!tok || kstrtou32(tok, 0, &id))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(vals); i++) {
+		tok = strsep(&desc, ",");
+		if (!tok || kstrtoull(tok, 0, &vals[i]))
+			return -EINVAL;
+	}
+
+	if (desc && *desc)
+		return -EINVAL;
+
+	return bao_ipcshmem_add(id, vals[0], vals[1], vals[2], vals[3]);
+}
+
+static int __init bao_ipcshmem_init(void)
+{
+	char *buf, *p, *desc;
+	int ret = 0;
+
+	if (!channels || !*channels)
+		return 0;
+
+	buf = kstrdup(channels, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	p = buf;
+	while ((desc = strsep(&p, ";")) != NULL) {
+		if (!*desc)
+			continue;
+		ret = bao_ipcshmem_parse_one(desc);
+		if (ret) {
+			pr_err("bad 'channels' descriptor\n");
+			break;
+		}
+	}
+	kfree(buf);
+
+	if (!ret)
+		ret = bao_ipcshmem_register_all();
+	if (ret)
+		bao_ipcshmem_remove_all();
+
+	return ret;
+}
+
+static void __exit bao_ipcshmem_exit(void)
+{
+	bao_ipcshmem_remove_all();
+}
+
+module_init(bao_ipcshmem_init);
+module_exit(bao_ipcshmem_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("David Cerdeira <davidmcerdeira@osyx.tech>");
+MODULE_AUTHOR("José Martins <jose@osyx.tech>");
+MODULE_AUTHOR("João Peixoto <jpeixoto@osyx.tech>");
+MODULE_DESCRIPTION("Bao Hypervisor IPC Through Shared-memory Driver");
-- 
2.53.0


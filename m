Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822AA3E3150
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790509804; cv=none; b=emhWAQ66D7ZJ1P5f/vVQDCZxj7gUQWMuy4eGeF8tY9SWkE7GLgBuBm642HjrsXb4ZkQzoMDUFX8X+eqP1F1j5X6XknOwPRRtq6RSMcdTwG3cElPDwVe6Sh4y8frOqhlxIxRBSUU3dRbNruc388YPL5rXIQzcyli2jEeEajjOIZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790509804; c=relaxed/simple;
	bh=ZfkJnwc1dvUQE278thR+YKQACuP1WgcG6LmyNv4gI48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M7lxmpO52wQytaW58jzon6X++4jRQEsyzabFZuWfzsLxRJyzGjpmKosZHyZNIbvHT8Xu4X2MZe4eT8zPI0s9IZwPNceg2UBIFQ3Ew1zGeaWp+GMXr7TAijeZxdghS4KtHFgZKejrFrIcIyaL0MKWWtQWX1s/nx4fFUdYy3ecmdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=GkKHXog/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="GkKHXog/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso6922565e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1790509795; x=1791114595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h8cUGdLk/wrS0klc1AXN7w5DcoCD4QoG4iuCSnLPyTM=;
        b=GkKHXog/OQXc4cSrBFOzfPkYNrYQHav16T4En5jxYY3utogI/sHlQRfBsXnV4XeFR3
         2FV2mr0uQlaS/uwlhD2+j+PG89SYvdkKP2KX9l/74JBm6NvTZ+Wfwg5i5dpZw1hk/euH
         3B2NB9kEyztlQRWYqSLa39f3074N153Oh/rnlM8xGrLlNbDjK/ZzwfFdMJckF591boIL
         h1mj4fwX0ZDjlGl3DfBsVRwujLhYyZvkEBs/cQZg0FoWx0DfXyp3QcfBx2FYOaVD5W5/
         rN8jeIHTtQ70nNif+AKu+FIG3Vhp5XwnO2ho7W9GdSjmCd7Lss09OLmw5knQe00aS0Dv
         I5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790509795; x=1791114595;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8cUGdLk/wrS0klc1AXN7w5DcoCD4QoG4iuCSnLPyTM=;
        b=yMNLKvVRylaE0gbURT+UwnsAI0SBrlXR/0NAfg7nk3R0Z9SbdJaA+W0GHJJ2f7vx0d
         EdmK1TSEOXN/ffIW9XPiXhejJ1nl2UdfHEGTncVqexVsDJREQeGHfXA+UnmOvKfh/bcg
         lH5G5dnbwf6Qv4Xx732iRmrLjWLs3BbJ1WV4PQW4vtdwYu4u+A3COUa+AVGF5UTh4gGr
         S1JIN3pY4EAzyLLM7tJGuo0pq23fRRwbFcJM1yom9i2gQgHIRbnlhAYogHQtKVp8eh7W
         i3j0MZDXvgFmabSlY2PcogAatBCMxd803Vc5HwSLPcZHFj45HNDoDKLQYeg0d+F3tCjP
         Rhvg==
X-Forwarded-Encrypted: i=1; AKwUvBw9wm9whUGDZ5t6Uq7X7At4tnx8ij7lzJ58dvneOo7On/mmfGPKdiR4xAU3WYHCp6Y9v5SNoPCETGX6pJM=@vger.kernel.org
X-Gm-Message-State: AFuF++koYzlwPiFLY0tt0i6NYGShZs/0vT/CjWbVnBmHUCqb2lhzF1yk
	5Sb18h6S7wGXU+8UTYMq9DzUGuO9aCrS/Ha6K+cAOXqPSYeKK0qe4sJfoNGf/yFJkmdh
X-Gm-Gg: AYBFou0n4xvgWjYdsw5lgYndcKwjwPjrnN2xHHDQI0WqG8x2+kh4k1P2odCxRbLSXL9
	HpfA0Ei6a6uUnEnwSpYHHtXp3JXpK2KLtw08XrYaB6VTjGrLSeEJEXXxoyW+pLx6jlJktQm0Upl
	oSh4Ae8Tapde5p5s6DxHB/BnJs21QxBKDCp9DulwtXnpMl7VOMYN2tAQxfss/7QsMHYUi5MjjIG
	HP9mJyepN+ys27lZCAtCTXjYnj2h+hdb+wDhBTjm6y268+IP/sCSzVLRfSmNp+Ryq0jUlFh6aRz
	JXo4PMsgPWcWyUPnCi6hnrVha1kS/mRbcJv7I4kxrAm2JdsPh8I2y/J9bBpsSvky001dzZjJMzE
	NyreN3qgMAysd5gr2Z6tPbuLBgRItmLMoxXTpIOFC5Kd6HzuhOhWF15yIh9/at0lcW1TKaMgpKw
	F29VSsOKn3frPZ7WD1p2mQeh36mSBYjdGVeCwE0i9HVNp/DzqE4XFgbXEfDrVcRFkoFBzniUbfF
	ZyKXrTGcAxbsq1RiAo=
X-Received: by 2002:a05:600c:628c:b0:4a0:f4:1c76 with SMTP id 5b1f17b1804b1-4a000f41d51mr28526665e9.4.1790509794614;
        Sun, 27 Sep 2026 04:49:54 -0700 (PDT)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:6d6e:8514:ff1c:6c57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178bebasm57095935e9.11.2026.09.27.04.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:49:53 -0700 (PDT)
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
Subject: [PATCH v4 2/3] virt: bao: add I/O dispatcher driver
Date: Sun, 27 Sep 2026 12:49:23 +0100
Message-ID: <93a45bf74dc864c1cf3ef8f9164ef0051ef50c48.1790357735.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790357735.git.jpeixoto@osyx.tech>
References: <cover.1790357735.git.jpeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

The Remote I/O hypercall returns the pending request in x1-x6 on top of
the status in x0, so on arm64 it is issued as an SMCCC v1.2 call through
arm_smccc_1_2_hvc(); no architecture code is needed. 32-bit Arm has no
SMCCC v1.2 helper, so the I/O dispatcher is limited to arm64 and RISC-V
for now. On RISC-V the request comes back in a2-a7 through the
(experimental) Bao SBI extension, which sbi_ecall() cannot express,
hence the local ecall helper.

Co-developed-by: José Martins <jose@osyx.tech>
Signed-off-by: José Martins <jose@osyx.tech>
Co-developed-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
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
 drivers/virt/bao/bao_hypercall.h              | 100 +++++
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
 include/uapi/linux/bao.h                      | 116 +++++
 15 files changed, 2411 insertions(+)
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
index 2fc53093752d..636fa02bbfd4 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -348,6 +348,8 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:luzmaximilian@gmail.com>
 0xA6  00-0F  uapi/linux/alloc_tag.h                                    Memory allocation profiling
                                                                        <mailto:surenb@google.com>
+0xA7  all    uapi/linux/bao.h                                          Bao hypervisor
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
index 9875e27f312d..ff6718c3c2d5 100644
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
@@ -55,6 +82,42 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
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
+
+	ctx->addr = res.a1;
+	ctx->op = res.a2;
+	ctx->value = res.a3;
+	ctx->access_width = res.a4;
+	ctx->request_id = res.a5;
+	ctx->npend_req = res.a6;
+
+	return res.a0;
+}
+#endif /* CONFIG_ARM64 */
+
 #elif defined(CONFIG_RISCV)
 
 #include <asm/sbi.h>
@@ -85,6 +148,43 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
 	return ret.error;
 }
 
+/**
+ * bao_remio_hypercall - Issue a Remote I/O hypercall
+ * @ctx: Hypercall context, updated with the values returned by the hypervisor
+ *
+ * The hypervisor returns the request in a2-a7 on top of the SBI error in a0,
+ * which sbi_ecall() cannot express as it only exposes a0 and a1.
+ *
+ * Return: The SBI error code, 0 on success.
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
+
+	ctx->addr = a2;
+	ctx->op = a3;
+	ctx->value = a4;
+	ctx->access_width = a5;
+	ctx->request_id = a6;
+	ctx->npend_req = a7;
+
+	return a0;
+}
+
 #endif
 
 #endif /* __BAO_HYPERCALL_H */
diff --git a/drivers/virt/bao/io-dispatcher/Kconfig b/drivers/virt/bao/io-dispatcher/Kconfig
new file mode 100644
index 000000000000..1776590fa79b
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0
+config BAO_IO_DISPATCHER
+	tristate "Bao Hypervisor I/O Dispatcher"
+	depends on ARM64 || RISCV
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
index 000000000000..bc48031f616b
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/bao_drv.h
@@ -0,0 +1,389 @@
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
+/* Bit in &bao_io_client.flags: the client is being torn down. */
+#define BAO_IO_CLIENT_DESTROYING 0U
+
+struct bao_dm;
+struct bao_io_client;
+
+typedef int (*bao_io_client_handler_t)(struct bao_io_client *client,
+				       struct bao_virtio_request *req);
+typedef void (*bao_intc_handler_t)(struct bao_dm *dm);
+
+/**
+ * enum bao_io_op - Bao hypervisor I/O operation types
+ * @BAO_IO_WRITE:   Write operation
+ * @BAO_IO_READ:    Read operation
+ * @BAO_IO_ASK:     Request operation information (e.g., MMIO address)
+ * @BAO_IO_NOTIFY:  Notify I/O completion
+ */
+enum bao_io_op {
+	BAO_IO_WRITE = 0,
+	BAO_IO_READ,
+	BAO_IO_ASK,
+	BAO_IO_NOTIFY,
+};
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
+ * @ioeventfds_lock: Protects @ioeventfds
+ * @ioeventfd_client: Ioeventfd client
+ * @irqfds: List of all irqfds
+ * @irqfds_lock: Protects @irqfds
+ * @irqfd_server: Workqueue responsible for irqfd handling
+ * @io_clients_lock: Protects @io_clients
+ * @io_clients: List of all bao_io_client
+ * @control_client: Control client
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
+	/* protects ioeventfds */
+	struct mutex ioeventfds_lock;
+	struct bao_io_client *ioeventfd_client;
+
+	struct list_head irqfds;
+	/* protects irqfds */
+	struct mutex irqfds_lock;
+	struct workqueue_struct *irqfd_server;
+
+	/* protects io_clients */
+	struct rw_semaphore io_clients_lock;
+	struct list_head io_clients;
+	struct bao_io_client *control_client;
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
+ */
+void bao_io_dispatcher_destroy(struct bao_dm *dm);
+
+/**
+ * bao_dispatch_io - Acquire and dispatch I/O requests from the Bao Hypervisor
+ * @dm: DM whose I/O clients will handle the requests
+ *
+ * Return: The number of requests still pending on success, negative error
+ * code on failure.
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
+ * bao_io_dispatcher_pause - Pause the I/O Dispatcher for a DM
+ * @dm: DM to pause
+ */
+void bao_io_dispatcher_pause(struct bao_dm *dm);
+
+/**
+ * bao_io_dispatcher_resume - Resume the I/O Dispatcher for a DM
+ * @dm: DM to resume
+ */
+void bao_io_dispatcher_resume(struct bao_dm *dm);
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
index 000000000000..64ca34624ab1
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/dm.c
@@ -0,0 +1,334 @@
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
+#include <linux/anon_inodes.h>
+#include <linux/err.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/mm.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/uaccess.h>
+#include "bao_drv.h"
+
+static int bao_dm_release(struct inode *inode, struct file *filp)
+{
+	struct bao_dm *dm = filp->private_data;
+
+	if (WARN_ON_ONCE(!dm))
+		return 0;
+
+	filp->private_data = NULL;
+	bao_intc_destroy(dm);
+	bao_dm_destroy(dm);
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
+		struct bao_virtio_request *req;
+
+		req = memdup_user((void __user *)arg, sizeof(*req));
+		if (IS_ERR(req)) {
+			rc = PTR_ERR(req);
+			break;
+		}
+
+		if (!dm->control_client) {
+			rc = -ENOENT;
+			goto out_free;
+		}
+
+		rc = bao_io_client_attach(dm->control_client);
+		if (rc)
+			goto out_free;
+
+		rc = bao_io_client_request(dm->control_client, req);
+		if (rc)
+			goto out_free;
+
+		if (copy_to_user((void __user *)arg, req, sizeof(*req))) {
+			/*
+			 * The request is already off the queue and userspace
+			 * will never see it: complete it with an error so the
+			 * frontend is resumed instead of hanging forever.
+			 */
+			bao_io_request_complete_error(dm, req);
+			rc = -EFAULT;
+		}
+
+out_free:
+		kfree(req);
+		break;
+	}
+	case BAO_IOCTL_IO_REQUEST_COMPLETE: {
+		struct bao_virtio_request *req;
+		struct bao_remio_hypercall_ctx ctx;
+
+		req = memdup_user((void __user *)arg, sizeof(*req));
+		if (IS_ERR(req)) {
+			rc = PTR_ERR(req);
+			break;
+		}
+
+		/*
+		 * Trust the DM bound to this fd, not the id supplied by
+		 * userspace, so a client cannot complete requests on another DM.
+		 */
+		ctx.dm_id = dm->info.id;
+		ctx.addr = req->addr;
+		ctx.op = req->op;
+		ctx.value = req->value;
+		ctx.access_width = req->access_width;
+		ctx.request_id = req->request_id;
+
+		rc = bao_remio_hypercall(&ctx) ? -EIO : 0;
+		kfree(req);
+
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
+ * bao_dm_mmap - mmap backend DM shared memory to userspace
+ * @filp: File pointer for the DM device
+ * @vma: Virtual memory area for mapping
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static int bao_dm_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct bao_dm *dm = filp->private_data;
+	unsigned long vsize;
+	unsigned long offset;
+	phys_addr_t phys;
+
+	if (WARN_ON_ONCE(!dm))
+		return -ENODEV;
+
+	vsize = vma->vm_end - vma->vm_start;
+	offset = vma->vm_pgoff << PAGE_SHIFT;
+
+	if (!vsize || offset)
+		return -EINVAL;
+
+	if (vsize > dm->info.shmem_size)
+		return -EINVAL;
+
+	phys = dm->info.shmem_addr;
+	if (!PAGE_ALIGNED(phys))
+		return -EINVAL;
+
+	if (remap_pfn_range(vma, vma->vm_start, phys >> PAGE_SHIFT, vsize,
+			    vma->vm_page_prot))
+		return -EFAULT;
+
+	return 0;
+}
+
+/**
+ * bao_dm_llseek - Adjust file offset for backend DM device
+ * @file: File pointer for the DM device
+ * @offset: Offset to seek
+ * @whence: Reference point (SEEK_SET, SEEK_CUR, SEEK_END)
+ *
+ * Return: New file position on success, negative errno on failure
+ */
+static loff_t bao_dm_llseek(struct file *file, loff_t offset, int whence)
+{
+	struct bao_dm *dm = file->private_data;
+	loff_t new_pos;
+
+	if (WARN_ON_ONCE(!dm))
+		return -ENODEV;
+
+	switch (whence) {
+	case SEEK_SET:
+		new_pos = offset;
+		break;
+	case SEEK_CUR:
+		new_pos = file->f_pos + offset;
+		break;
+	case SEEK_END:
+		new_pos = dm->info.shmem_size + offset;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (new_pos < 0 || new_pos > dm->info.shmem_size)
+		return -EINVAL;
+
+	file->f_pos = new_pos;
+	return new_pos;
+}
+
+static const struct file_operations bao_dm_fops = {
+	.owner = THIS_MODULE,
+	.release = bao_dm_release,
+	.unlocked_ioctl = bao_dm_ioctl,
+	.llseek = bao_dm_llseek,
+	.mmap = bao_dm_mmap,
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
+	dm = kzalloc_obj(*dm, GFP_KERNEL);
+	if (!dm)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&dm->io_clients);
+	init_rwsem(&dm->io_clients_lock);
+
+	dm->info = *info;
+
+	ret = bao_io_dispatcher_init(dm);
+	if (ret) {
+		pr_err("bao: failed to init I/O dispatcher for DM %u\n",
+		       dm->info.id);
+		goto err_free;
+	}
+
+	snprintf(dm->name, sizeof(dm->name), "bao-ioctlc%u", dm->info.id);
+	dm->control_client = bao_io_client_create(dm, NULL, NULL, true,
+						  dm->name);
+	if (!dm->control_client) {
+		pr_err("bao: failed to create control client for DM %u\n",
+		       dm->info.id);
+		ret = -ENOMEM;
+		goto err_destroy_dispatcher;
+	}
+
+	ret = bao_ioeventfd_client_init(dm);
+	if (ret) {
+		pr_err("bao: failed to initialize ioeventfd for DM %u\n",
+		       dm->info.id);
+		goto err_destroy_io_clients;
+	}
+
+	ret = bao_irqfd_server_init(dm);
+	if (ret) {
+		pr_err("bao: failed to initialize irqfd for DM %u\n",
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
+	bao_irqfd_server_destroy(dm);
+	bao_io_clients_destroy(dm);
+	bao_io_dispatcher_destroy(dm);
+
+	kfree(dm);
+}
+
+int bao_dm_create_fd(struct bao_dm_info *info)
+{
+	struct bao_dm *dm;
+	int fd, ret;
+
+	if (WARN_ON(!info))
+		return -EINVAL;
+
+	dm = bao_dm_create(info);
+	if (IS_ERR(dm))
+		return PTR_ERR(dm);
+
+	ret = bao_intc_init(dm);
+	if (ret) {
+		pr_err("bao: failed to register interrupt %u for DM %u: %d\n",
+		       info->irq, info->id, ret);
+		bao_dm_destroy(dm);
+		return ret;
+	}
+
+	fd = anon_inode_getfd("[bao-dm]", &bao_dm_fops, dm, O_RDWR | O_CLOEXEC);
+	if (fd < 0) {
+		bao_intc_destroy(dm);
+		bao_dm_destroy(dm);
+		return fd;
+	}
+
+	return fd;
+}
diff --git a/drivers/virt/bao/io-dispatcher/driver.c b/drivers/virt/bao/io-dispatcher/driver.c
new file mode 100644
index 000000000000..61380815f4d9
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/driver.c
@@ -0,0 +1,70 @@
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
index 000000000000..7729cb8896ea
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/intc.c
@@ -0,0 +1,150 @@
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
+ * Return: A Linux virtual IRQ number on success, negative error code on failure.
+ */
+static int bao_intc_map_irq(u32 line)
+{
+	struct of_phandle_args oirq = {};
+	struct device_node *parent;
+	unsigned int virq;
+	u32 cells;
+	int ret;
+
+	parent = of_irq_find_parent(of_root);
+	if (!parent) {
+		pr_err("bao: no root interrupt-parent in the device tree\n");
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
+		oirq.args[0] = line;
+		break;
+	case 2:
+		oirq.args[0] = line;
+		oirq.args[1] = IRQ_TYPE_EDGE_RISING;
+		break;
+	case 3:
+	case 4:
+		oirq.args[0] = GIC_SPI;
+		oirq.args[1] = line;
+		oirq.args[2] = IRQ_TYPE_EDGE_RISING;
+		break;
+	default:
+		pr_err("bao: unsupported #interrupt-cells = %u on %pOF\n",
+		       cells, parent);
+		ret = -EINVAL;
+		goto out_put;
+	}
+
+	virq = irq_create_of_mapping(&oirq);
+	ret = virq ? (int)virq : -EINVAL;
+
+out_put:
+	of_node_put(parent);
+	return ret;
+}
+
+int bao_intc_init(struct bao_dm *dm)
+{
+	int virq;
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
+	return request_irq(dm->virq, bao_interrupt_handler, 0, dm->intc_name,
+			   dm);
+}
+
+void bao_intc_destroy(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	free_irq(dm->virq, dm);
+	irq_dispose_mapping(dm->virq);
+}
diff --git a/drivers/virt/bao/io-dispatcher/io_client.c b/drivers/virt/bao/io-dispatcher/io_client.c
new file mode 100644
index 000000000000..01c2242aeba8
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/io_client.c
@@ -0,0 +1,423 @@
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
+	io_req = kzalloc_obj(*io_req, GFP_KERNEL);
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
+ * bao_io_client_destroy - Destroy an I/O client
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
+	bao_io_dispatcher_pause(dm);
+
+	set_bit(BAO_IO_CLIENT_DESTROYING, &client->flags);
+
+	if (client->is_control) {
+		wake_up_interruptible(&client->wq);
+	} else {
+		bao_ioeventfd_client_destroy(dm);
+		if (client->thread)
+			kthread_stop(client->thread);
+	}
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
+	bao_io_dispatcher_resume(dm);
+
+	/* Free any I/O requests still queued but never consumed. */
+	mutex_lock(&client->virtio_requests_lock);
+	list_for_each_entry_safe(io_req, io_next, &client->virtio_requests,
+				 list) {
+		list_del(&io_req->list);
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
+	list_for_each_entry_safe(client, next, &dm->io_clients, list) {
+		bao_io_client_destroy(client);
+	}
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
+ * back to the hypervisor. The thread never exits on its own: kthread_stop()
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
+	client = kzalloc_obj(*client, GFP_KERNEL);
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
+	range = kzalloc_obj(*range, GFP_KERNEL);
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
+	if (WARN_ON_ONCE(!range || !req))
+		return false;
+
+	if (req->addr >= range->start &&
+	    (req->addr + req->access_width - 1) <= range->end)
+		return true;
+
+	return false;
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
index 000000000000..94c571751564
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/io_dispatcher.c
@@ -0,0 +1,159 @@
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
+	bao_io_dispatcher_pause(dm);
+
+	destroy_workqueue(dm->io_wq);
+	dm->io_wq = NULL;
+}
+
+void bao_io_request_complete_error(struct bao_dm *dm,
+				   struct bao_virtio_request *req)
+{
+	struct bao_remio_hypercall_ctx ctx = {
+		.dm_id = dm->info.id,
+		.op = req->op,
+		.addr = req->addr,
+		.value = 0,
+		.access_width = req->access_width,
+		.request_id = req->request_id,
+	};
+
+	bao_remio_hypercall(&ctx);
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
+	req.dm_id = ctx.dm_id;
+	req.op = ctx.op;
+	req.addr = ctx.addr;
+	req.value = ctx.value;
+	req.access_width = ctx.access_width;
+	req.request_id = ctx.request_id;
+
+	down_read(&dm->io_clients_lock);
+	client = bao_io_client_find(dm, &req);
+	if (!client) {
+		up_read(&dm->io_clients_lock);
+		bao_io_request_complete_error(dm, &req);
+		return -ENODEV;
+	}
+
+	if (!bao_io_client_push_request(client, &req)) {
+		up_read(&dm->io_clients_lock);
+		bao_io_request_complete_error(dm, &req);
+		return -ENOMEM;
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
+		cpu_relax();
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
+void bao_io_dispatcher_pause(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm || !dm->io_wq))
+		return;
+
+	bao_intc_remove_handler(dm);
+
+	drain_workqueue(dm->io_wq);
+}
+
+void bao_io_dispatcher_resume(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm || !dm->io_wq))
+		return;
+
+	bao_intc_setup_handler(dm, io_dispatcher_intc_handler);
+
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
index 000000000000..4a5913293383
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/ioeventfd.c
@@ -0,0 +1,326 @@
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
+ * @length: Length of the I/O range
+ * @wildcard: True if data matching is not required
+ *
+ * Represents an I/O eventfd registered for a Bao device model.
+ */
+struct ioeventfd {
+	struct list_head list;
+	struct eventfd_ctx *eventfd;
+	u64 addr;
+	u64 data;
+	int length;
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
+	kfree(p);
+}
+
+/**
+ * bao_ioeventfd_config_valid - Validate ioeventfd configuration
+ * @config: Ioeventfd configuration
+ *
+ * Return: True if config is non-NULL, address+length does not wrap,
+ * and length is 1, 2, 4, or 8 bytes.
+ */
+static bool bao_ioeventfd_config_valid(struct bao_ioeventfd *config)
+{
+	if (WARN_ON_ONCE(!config))
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
+ * Return: True if an existing ioeventfd matches address, eventfd,
+ * and optionally data.
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
+		if (p->eventfd == ioeventfd->eventfd &&
+		    p->addr == ioeventfd->addr &&
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
+ * Return: The matching ioeventfd, NULL if none matches.
+ */
+static struct ioeventfd *bao_ioeventfd_match(struct bao_dm *dm, u64 addr,
+					     u64 data, int len)
+{
+	struct ioeventfd *p;
+
+	lockdep_assert_held(&dm->ioeventfds_lock);
+
+	if (WARN_ON_ONCE(!dm))
+		return NULL;
+
+	list_for_each_entry(p, &dm->ioeventfds, list) {
+		if (p->addr == addr && p->length >= len &&
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
+	if (!bao_ioeventfd_config_valid(config))
+		return -EINVAL;
+
+	eventfd = eventfd_ctx_fdget(config->fd);
+	if (IS_ERR(eventfd))
+		return PTR_ERR(eventfd);
+
+	new = kzalloc_obj(*new, GFP_KERNEL);
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
+ * Return: 0 on success, a negative error code on failure
+ */
+static int bao_ioeventfd_deassign(struct bao_dm *dm,
+				  struct bao_ioeventfd *config)
+{
+	struct ioeventfd *p;
+	struct eventfd_ctx *eventfd;
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
+		/* Match the full registration, not just the eventfd. */
+		if (p->eventfd != eventfd || p->addr != config->addr ||
+		    p->length != config->len)
+			continue;
+
+		bao_io_client_range_del(dm->ioeventfd_client, p->addr,
+					p->addr + p->length - 1);
+
+		bao_ioeventfd_shutdown(dm, p);
+		break;
+	}
+
+	mutex_unlock(&dm->ioeventfds_lock);
+	eventfd_ctx_put(eventfd);
+
+	return 0;
+}
+
+/**
+ * bao_ioeventfd_handler - Handle an Ioeventfd client I/O request
+ * @client: Ioeventfd client associated with the request
+ * @req: I/O request to process
+ *
+ * Processes I/O requests from the Bao I/O client kernel thread
+ * (bao_io_client_kernel_thread). For READ operations, the value is
+ * ignored and set to 0 since virtio MMIO drivers only write to the
+ * `QueueNotify` field. WRITE operations are checked against the
+ * registered ioeventfds, and the corresponding eventfd is signaled
+ * if a match is found.
+ *
+ * Return: 0 on success, a negative error code on failure
+ */
+static int bao_ioeventfd_handler(struct bao_io_client *client,
+				 struct bao_virtio_request *req)
+{
+	struct ioeventfd *p;
+
+	if (WARN_ON_ONCE(!client || !req))
+		return -EINVAL;
+
+	if (req->op == BAO_IO_READ) {
+		req->value = 0;
+		return 0;
+	}
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
+	return 0;
+}
+
+int bao_ioeventfd_client_config(struct bao_dm *dm, struct bao_ioeventfd *config)
+{
+	if (WARN_ON_ONCE(!dm || !config))
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
index 000000000000..536808af75e9
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/irqfd.c
@@ -0,0 +1,315 @@
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
+ * Return: 0 on success, -EFAULT if the hypercall fails.
+ */
+static int bao_irqfd_inject(int id)
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
+		return -EFAULT;
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
+ * Called by the Linux kernel poll table when the underlying eventfd is signaled.
+ * Injects a Bao notify hypercall on POLLIN or schedules shutdown on POLLHUP.
+ *
+ * Return: 0 on success, a negative error code on failure
+ */
+static int bao_irqfd_wakeup(wait_queue_entry_t *wait, unsigned int mode,
+			    int sync, void *key)
+{
+	struct irqfd *irqfd;
+	struct bao_dm *dm;
+	unsigned long poll_bits;
+
+	if (WARN_ON_ONCE(!wait || !key))
+		return -EINVAL;
+
+	irqfd = container_of(wait, struct irqfd, wait);
+	dm = irqfd->dm;
+	poll_bits = (unsigned long)key;
+
+	if (poll_bits & POLLIN)
+		bao_irqfd_inject(dm->info.id);
+
+	if (poll_bits & POLLHUP)
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
+	if (!list_empty(&irqfd->list))
+		list_del_init(&irqfd->list);
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
+	irqfd = kzalloc_obj(*irqfd, GFP_KERNEL);
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
+ * Return: 0 on success, a negative error code on failure
+ */
+static int bao_irqfd_deassign(struct bao_dm *dm, struct bao_irqfd *args)
+{
+	struct irqfd *irqfd;
+	struct irqfd *tmp;
+	struct eventfd_ctx *eventfd;
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
+			bao_irqfd_queue_shutdown(irqfd);
+			break;
+		}
+	}
+	mutex_unlock(&dm->irqfds_lock);
+
+	eventfd_ctx_put(eventfd);
+
+	/* Wait for cleanup work to finish so the eventfd is fully detached. */
+	flush_workqueue(dm->irqfd_server);
+
+	return 0;
+}
+
+int bao_irqfd_server_config(struct bao_dm *dm, struct bao_irqfd *config)
+{
+	if (WARN_ON_ONCE(!dm || !config))
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
index 000000000000..9c9081478c10
--- /dev/null
+++ b/include/uapi/linux/bao.h
@@ -0,0 +1,116 @@
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
+ * @dm_id: Device model ID
+ * @addr: MMIO register address accessed
+ * @op: Operation type (WRITE = 0, READ, ASK, NOTIFY)
+ * @value: Value to write or read
+ * @access_width: Access width (VirtIO MMIO supports 4-byte aligned accesses)
+ * @request_id: Request ID of the I/O request
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
+#define BAO_IOCTL_DM_GET_INFO _IOWR(BAO_IOCTL_TYPE, 0x01, struct bao_dm_info)
+#define BAO_IOCTL_IO_CLIENT_ATTACH \
+	_IOWR(BAO_IOCTL_TYPE, 0x02, struct bao_virtio_request)
+#define BAO_IOCTL_IO_REQUEST_COMPLETE \
+	_IOW(BAO_IOCTL_TYPE, 0x03, struct bao_virtio_request)
+#define BAO_IOCTL_IOEVENTFD _IOW(BAO_IOCTL_TYPE, 0x04, struct bao_ioeventfd)
+#define BAO_IOCTL_IRQFD _IOW(BAO_IOCTL_TYPE, 0x05, struct bao_irqfd)
+
+#endif /* _UAPI_BAO_H */
-- 
2.43.0


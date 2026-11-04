Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810951;
	b=2QN4hGD4lgZx8Eg5Vr9zBxgWAyPqNOLUeDwgY8ux3W2u+0LicCg6JbhXDcUzlcWjTAPU
	 ULm8IXewXK0cLE0h27/LPf9hWQJBa43/oat48LQU0u/mkBq0fgb8EJ4Nm96b5qoczGFVr
	 RG2/eT2s8Oo9DZM/zr+GPAonLXzD84xNI2e8hsULNFCqkyVmeDIhX7zZlPUuhyVsxEdv1
	 7AlYxLncB/8D7Tja6Cw+neNlBpaboE2t/LE6YIPODsuI3ZgqDhgnQMcfol1cWiSY7/OuN
	 yj2D+UdNITayfv0ir1cytShZ04Ym4YCWa0DL8jMsbIHL9jhgZNEJ5F2nbwreDb/WNlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810951;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=F/M/lPoPYDv5QuG08ux7Y7v6XDCHlnCuipoH1kWtVnw=;
	b=Ow0P3oQ8uauWNnW+tqTCSW9TsiZp/JV/AtbkgRfOCnjaV4UxYNNvLz1/Vn1x8ZBRbIvZ
	 8EVkjjD+pmW/CL72ahuEGJ8S5ji4ViCET5JyL0NNWFAvHWYgFL2+Z0ryNdLnr0Kk6gv1A
	 Iy+13iFgroTzZDfp55jMT+RD7SZf4oRFN32Q0kb+YuH2fVm9DbXjN5IoIWsKGZF6w9Nx3
	 bdSYl7xHqfYWtRS0FOvbxW5JaA+wq3WR7FWKEKNSLSEc0P5sY8pkZaPTDGzLV55owOyYI
	 iZTrNV8g2pA7W8KXq0s1wxQ1+BPZt/bILFzbUiHo8tNA6Cilvk2QzQIL7+KWzy8H4Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dotg8eeQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB36606D808;
	Wed,  4 Nov 2026 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dotg8eeQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F651F00A1B;
	Wed,  4 Nov 2026 16:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810950;
	bh=F/M/lPoPYDv5QuG08ux7Y7v6XDCHlnCuipoH1kWtVnw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dotg8eeQ8CX+pgGTiFePG97p0krplD9O7dmPkf/wJNrb5emf1wSxny/p3jMuiXNtj
	 Vdzmm8beo2L6DTKEzZ72Mvmd2a9zpWsLyyrHhxfxJjYYpE5iY3yCn6W7D6Gd7Y1Fk/
	 t3SG4VKFw8dxwc4N2C6+U8UJcTD3J+RzRff0sUQ9MldcPrOQjPpr0T4DDhsMflrjpc
	 lCaAyVQK2R4xdAW03l9DZhKd8+P2ceYG0mriEs1YrV9SmtoHZkil/jck9EpFVFFOIt
	 AnXgHizEdzpsYnjmVmsa9xa8wc4AWTn9xUJr+bXGwDVLYAYdIvQwN0137KAosOnNjk
	 grGZzMo4keerA==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 04 Nov 2026 08:35:18 -0800
Subject: [PATCH v10 1/6] riscv_cbqri: Add capacity controller core
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-dfustini-atl-sc-cbqri-dt-v10-1-1636a003a3c0@kernel.org>
References: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
In-Reply-To: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sunil V L <sunilvl@oss.qualcomm.com>, Tony Luck <tony.luck@intel.com>, 
 Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=27116; i=fustini@kernel.org;
 h=from:subject:message-id; bh=mSknnQGOrvX6QqYtEhiPsLjGjUhO5JodbUhHWQMtJ7I=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWS9TmJNtDPrzU46nqx6OOdghYvf8ilWur7ORkJT70Q+n
 SEpwsXVUcrCIMbFICumyLLpQ96FJV6hXxfMf7ENZg4rE8gQBi5OAZjI8xmMDDN2icRdfLf2zrVt
 UStOc8+oKNads/y+6j3RB99miH3/oviakaH1ktdBp+cfLWuiJzCzG0yXdJ+cuu+E7aNJxRGd4WG
 CZ5gA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010

Add the core for RISC-V CBQRI capacity controllers: the register
layout, the capability probe, and the allocation operations that
program a capacity block mask for an RCID and read it back.

A discovery layer maps the register block and describes the controller
in a cbqri_controller_info descriptor. riscv_cbqri_register_cc() probes
the controller from that descriptor and adds it to the controller list,
which stays private to the core. The core owns all state after
registration, so nothing in it depends on how the controller was
discovered.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS                      |   3 +
 drivers/resctrl/Kconfig          |   9 +
 drivers/resctrl/Makefile         |   3 +
 drivers/resctrl/cbqri_devices.c  | 562 +++++++++++++++++++++++++++++++++++++++
 drivers/resctrl/cbqri_internal.h | 114 ++++++++
 include/linux/riscv_cbqri.h      |  49 ++++
 6 files changed, 740 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..6b3060bdfa89 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24139,6 +24139,9 @@ L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/include/asm/qos.h
 F:	arch/riscv/kernel/qos.c
+F:	drivers/resctrl/cbqri_devices.c
+F:	drivers/resctrl/cbqri_internal.h
+F:	include/linux/riscv_cbqri.h
 
 RISC-V RPMI AND MPXY DRIVERS
 M:	Rahul Pathak <rahul@summations.net>
diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
index f5ff9b1f6c48..c0c252e6f5e7 100644
--- a/drivers/resctrl/Kconfig
+++ b/drivers/resctrl/Kconfig
@@ -31,3 +31,12 @@ config ARM64_MPAM_RESCTRL_FS
 	default y if ARM64_MPAM_DRIVER && RESCTRL_FS
 	select RESCTRL_RMID_DEPENDS_ON_CLOSID
 	select RESCTRL_ASSIGN_FIXED
+
+menuconfig RISCV_CBQRI
+	bool "RISC-V CBQRI support"
+	depends on RISCV && RISCV_ISA_SSQOSID
+	help
+	  Capacity and Bandwidth QoS Register Interface (CBQRI) support for
+	  RISC-V cache QoS resources. CBQRI exposes cache capacity
+	  allocation through the resctrl filesystem at /sys/fs/resctrl when
+	  RESCTRL_FS is also enabled.
diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
index 097c036724e9..e86a873208ad 100644
--- a/drivers/resctrl/Makefile
+++ b/drivers/resctrl/Makefile
@@ -3,3 +3,6 @@ mpam-y						+= mpam_devices.o mpam_fb.o
 mpam-$(CONFIG_ARM64_MPAM_RESCTRL_FS)		+= mpam_resctrl.o
 
 ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
+
+obj-$(CONFIG_RISCV_CBQRI)			+= cbqri.o
+cbqri-y						+= cbqri_devices.o
diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devices.c
new file mode 100644
index 000000000000..05f65c10093a
--- /dev/null
+++ b/drivers/resctrl/cbqri_devices.c
@@ -0,0 +1,562 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/printk.h>
+#include <linux/riscv_cbqri.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include <asm/csr.h>
+
+#include "cbqri_internal.h"
+
+static LIST_HEAD(cbqri_controllers);
+
+/*
+ * Serializes cbqri_controllers mutations against a concurrent insert under
+ * asynchronous driver probing, and against the boot-time copy that
+ * cbqri_get_controllers() hands to cbqri_resctrl.c. That code keeps its
+ * own array of the controllers it picked, so its cpuhp paths never walk
+ * this list.
+ */
+static DEFINE_MUTEX(cbqri_controllers_lock);
+
+/**
+ * cbqri_get_controllers() - return the registered controllers
+ * @ctrls: receives a kcalloc'd array that the caller frees
+ *
+ * Controllers are never unregistered, so the pointers stay valid after the
+ * lock drops.
+ *
+ * Return: the number of controllers, or -ENOMEM.
+ */
+int cbqri_get_controllers(struct cbqri_controller ***ctrls)
+{
+	struct cbqri_controller **arr, *ctrl;
+	unsigned int n = 0;
+
+	guard(mutex)(&cbqri_controllers_lock);
+
+	list_for_each_entry(ctrl, &cbqri_controllers, list)
+		n++;
+
+	arr = kcalloc(n, sizeof(*arr), GFP_KERNEL);
+	if (!arr)
+		return -ENOMEM;
+
+	n = 0;
+	list_for_each_entry(ctrl, &cbqri_controllers, list)
+		arr[n++] = ctrl;
+
+	*ctrls = arr;
+	return n;
+}
+
+/*
+ * CBQRI registers are 64-bit, but the spec only guarantees single-copy
+ * atomicity for naturally aligned 4-byte accesses. Read the two halves and
+ * reconstruct, so the driver does not rely on native 64-bit MMIO.
+ *
+ * The halves are not sampled atomically, but a tear is harmless. The fields
+ * that change while an operation runs, BUSY (bit 39) and STATUS (bits
+ * 38:32), are in the high half and read by the single high readl(). The low
+ * half (OP/AT/RCID) is software-written and constant for the operation.
+ */
+static u64 cbqri_readq(void __iomem *addr)
+{
+	u32 lo = readl(addr);
+	u32 hi = readl(addr + 4);
+
+	return (u64)hi << 32 | lo;
+}
+
+/* Set capacity block mask (cc_block_mask) */
+static void cbqri_set_cbm(struct cbqri_controller *ctrl, u64 cbm)
+{
+	/*
+	 * cbqri_probe_cc() rejects ncblks > 32, so the mask fits the low word.
+	 * The cc_block_mask bits above NCBLKS are read-only zero, so the upper
+	 * word needs no write.
+	 */
+	writel(lower_32_bits(cbm), ctrl->base + CBQRI_CC_BLOCK_MASK_OFF);
+}
+
+/*
+ * Clear cc_cunits so a CONFIG_LIMIT on a CUNITS-capable controller imposes no
+ * capacity-unit limit. resctrl models only the block mask. On controllers
+ * with cc_capabilities.CUNITS == 0 the register is read-only zero, so there is
+ * nothing to do.
+ */
+static void cbqri_clear_cunits(struct cbqri_controller *ctrl)
+{
+	if (ctrl->cc.cunits) {
+		writel(0, ctrl->base + CBQRI_CC_CUNITS_OFF);
+		writel(0, ctrl->base + CBQRI_CC_CUNITS_OFF + 4);
+	}
+}
+
+static int cbqri_wait_busy_flag(struct cbqri_controller *ctrl, int reg_offset,
+				u64 *regp)
+{
+	u64 reg;
+	int ret;
+
+	ret = read_poll_timeout(cbqri_readq, reg,
+				!FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg),
+				10, 1000, false, ctrl->base + reg_offset);
+	if (ret)
+		return ret;
+	if (regp)
+		*regp = reg;
+	return 0;
+}
+
+/*
+ * Perform a capacity allocation control operation on a capacity controller.
+ * cbm is staged in cc_block_mask and cc_cunits is cleared only after BUSY
+ * reads 0, since writes to those registers are UNSPECIFIED while an
+ * operation is in flight. READ_LIMIT overwrites both on success, so
+ * staging 0 before a read makes a silent firmware no-op visible.
+ * Caller must hold ctrl->lock.
+ */
+static int cbqri_cc_alloc_op(struct cbqri_controller *ctrl, int operation,
+			     int rcid, u32 at, u64 cbm)
+{
+	int reg_offset = CBQRI_CC_ALLOC_CTL_OFF;
+	int status;
+	u64 reg;
+
+	lockdep_assert_held(&ctrl->lock);
+
+	if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
+		pr_err_ratelimited("BUSY timeout before starting operation\n");
+		return -EIO;
+	}
+
+	cbqri_set_cbm(ctrl, cbm);
+	cbqri_clear_cunits(ctrl);
+
+	FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_OP_MASK, &reg, operation);
+	FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_RCID_MASK, &reg, rcid);
+
+	/*
+	 * CBQRI Access Type (AT): 0=Data, 1=Code. Program AT on controllers
+	 * that report supports_alloc_at_code. On controllers that don't,
+	 * AT is reserved-zero and the op acts on both halves.
+	 */
+	reg &= ~CBQRI_CONTROL_REGISTERS_AT_MASK;
+	if (ctrl->cc.supports_alloc_at_code)
+		reg |= FIELD_PREP(CBQRI_CONTROL_REGISTERS_AT_MASK, at);
+
+	writel(lower_32_bits(reg), ctrl->base + reg_offset);
+
+	if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
+		pr_err_ratelimited("BUSY timeout during operation\n");
+		return -EIO;
+	}
+
+	status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
+	if (status != CBQRI_CC_ALLOC_CTL_STATUS_SUCCESS) {
+		pr_err_ratelimited("operation %d failed: status=%d\n", operation, status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/*
+ * Apply a capacity block mask and verify via CONFIG_LIMIT + READ_LIMIT.
+ *
+ * AT-capable controllers with CDP off need a second CONFIG_LIMIT on the
+ * other AT half (AT is 0=Data or 1=Code, there is no "both halves"
+ * value). With CDP on, resctrl writes each half separately, so a single
+ * CONFIG_LIMIT per call is correct.
+ */
+int cbqri_apply_cache_config(struct cbqri_controller *ctrl, u32 closid,
+			     const struct cbqri_cc_config *cfg)
+{
+	bool need_at_mirror;
+	u64 saved_cbm = 0;
+	int err = 0;
+	u64 reg;
+
+	mutex_lock(&ctrl->lock);
+
+	need_at_mirror = ctrl->cc.supports_alloc_at_code && !cfg->cdp_enabled;
+
+	/*
+	 * Capture the cfg->at half CBM before any write so a partial
+	 * AT-mirror failure can revert and keep the two halves consistent.
+	 */
+	if (need_at_mirror) {
+		err = cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT,
+					closid, cfg->at, 0);
+		if (err < 0)
+			goto out;
+		saved_cbm = cbqri_readq(ctrl->base + CBQRI_CC_BLOCK_MASK_OFF);
+	}
+
+	/* Capacity config limit operation for the AT half implied by cfg->at */
+	err = cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_CONFIG_LIMIT,
+				closid, cfg->at, cfg->cbm);
+	if (err < 0)
+		goto out;
+
+	/*
+	 * CDP-off mirror: on AT-capable controllers, also program the
+	 * other AT half with the same mask so the two halves stay in sync.
+	 */
+	if (need_at_mirror) {
+		u32 other = (cfg->at == CBQRI_CONTROL_REGISTERS_AT_CODE) ?
+			    CBQRI_CONTROL_REGISTERS_AT_DATA :
+			    CBQRI_CONTROL_REGISTERS_AT_CODE;
+
+		err = cbqri_cc_alloc_op(ctrl,
+					CBQRI_CC_ALLOC_CTL_OP_CONFIG_LIMIT,
+					closid, other, cfg->cbm);
+		if (err < 0) {
+			int rerr;
+
+			/*
+			 * Best-effort revert of the cfg->at half so the two
+			 * halves stay in sync. A schemata read sees only one
+			 * half, so silent divergence would otherwise report
+			 * the new value as if the write had succeeded.
+			 */
+			rerr = cbqri_cc_alloc_op(ctrl,
+						 CBQRI_CC_ALLOC_CTL_OP_CONFIG_LIMIT,
+						 closid, cfg->at, saved_cbm);
+			if (rerr < 0)
+				pr_err_ratelimited("AT-mirror revert failed (err=%d), AT halves diverged\n",
+						   rerr);
+			goto out;
+		}
+	}
+
+	/* Read the limit back to verify the block mask landed */
+	err = cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT,
+				closid, cfg->at, 0);
+	if (err < 0)
+		goto out;
+
+	/*
+	 * Read the capacity block mask and narrow to u32 to match resctrl's CBM
+	 * width. cbqri_probe_cc() rejects ncblks > 32 so the upper bits are
+	 * reserved zero.
+	 */
+	reg = cbqri_readq(ctrl->base + CBQRI_CC_BLOCK_MASK_OFF);
+	if (lower_32_bits(reg) != cfg->cbm) {
+		pr_err_ratelimited("CBM verify mismatch (reg=%llx != cbm=%llx)\n",
+				   reg, cfg->cbm);
+		err = -EIO;
+	}
+
+out:
+	mutex_unlock(&ctrl->lock);
+	return err;
+}
+
+/* Read the configured CBM for closid on the AT half via READ_LIMIT. */
+int cbqri_read_cache_config(struct cbqri_controller *ctrl, u32 closid,
+			    u32 at, u32 *cbm_out)
+{
+	int err;
+
+	mutex_lock(&ctrl->lock);
+	err = cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT, closid, at, 0);
+	if (err == 0) {
+		/*
+		 * resctrl exposes the CBM as a u32 and cbqri_probe_cc() rejects
+		 * ncblks > 32, so the mask fits the low 32-bit word of the
+		 * cc_block_mask register.
+		 */
+		*cbm_out = readl(ctrl->base + CBQRI_CC_BLOCK_MASK_OFF);
+	}
+	mutex_unlock(&ctrl->lock);
+	return err;
+}
+
+static int cbqri_probe_feature(struct cbqri_controller *ctrl, int reg_offset,
+			       int operation, int *status, bool *access_type_supported)
+{
+	const u64 active_mask = CBQRI_CONTROL_REGISTERS_OP_MASK |
+				CBQRI_CONTROL_REGISTERS_AT_MASK |
+				CBQRI_CONTROL_REGISTERS_RCID_MASK;
+	u64 reg, saved_reg;
+	int at;
+
+	/*
+	 * Default the output to false so the status==0 (feature not
+	 * implemented) path returns a deterministic value to the caller
+	 * rather than leaving an uninitialized bool.
+	 */
+	*access_type_supported = false;
+
+	/* Keep the initial register value to preserve the WPRI fields */
+	reg = cbqri_readq(ctrl->base + reg_offset);
+	saved_reg = reg;
+
+	/* Drain any in-flight firmware op before issuing our own write. */
+	if (cbqri_wait_busy_flag(ctrl, reg_offset, &saved_reg) < 0) {
+		pr_err("BUSY timeout before probe operation\n");
+		return -EIO;
+	}
+
+	/*
+	 * Execute the requested operation with all active fields
+	 * (OP/AT/RCID) zeroed except OP itself. Every bit not in
+	 * active_mask is WPRI and gets carried over from saved_reg.
+	 */
+	reg = (saved_reg & ~active_mask) |
+	      FIELD_PREP(CBQRI_CONTROL_REGISTERS_OP_MASK, operation);
+	writel(lower_32_bits(reg), ctrl->base + reg_offset);
+	if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
+		pr_err_ratelimited("BUSY timeout during operation\n");
+		return -EIO;
+	}
+
+	/* Get the operation status */
+	*status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
+
+	/*
+	 * Check for AT support if the register is implemented
+	 * (if not, the status value will remain 0)
+	 */
+	if (*status != 0) {
+		/*
+		 * Re-issue operation with AT=CODE so the controller
+		 * latches AT=CODE on supported hardware (or resets it to 0
+		 * on hardware that doesn't). OP must be a defined CBQRI op
+		 * here. OP=0 is a no-op and would silently disable CDP.
+		 */
+		reg = (saved_reg & ~active_mask) |
+		      FIELD_PREP(CBQRI_CONTROL_REGISTERS_OP_MASK, operation) |
+		      FIELD_PREP(CBQRI_CONTROL_REGISTERS_AT_MASK,
+				 CBQRI_CONTROL_REGISTERS_AT_CODE);
+		writel(lower_32_bits(reg), ctrl->base + reg_offset);
+		if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
+			pr_err("BUSY timeout setting AT field\n");
+			return -EIO;
+		}
+
+		/*
+		 * If the AT field value has been reset to zero,
+		 * then AT support is not present
+		 */
+		at = FIELD_GET(CBQRI_CONTROL_REGISTERS_AT_MASK, reg);
+		if (at == CBQRI_CONTROL_REGISTERS_AT_CODE)
+			*access_type_supported = true;
+	}
+
+	/*
+	 * Restore the original register value.
+	 * Clear OP to avoid re-triggering the probe op.
+	 */
+	saved_reg &= ~CBQRI_CONTROL_REGISTERS_OP_MASK;
+	writel(lower_32_bits(saved_reg), ctrl->base + reg_offset);
+	if (cbqri_wait_busy_flag(ctrl, reg_offset, NULL) < 0) {
+		pr_err("BUSY timeout restoring register value\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int cbqri_probe_cc(struct cbqri_controller *ctrl)
+{
+	int err, status;
+	int ver_major, ver_minor;
+	u64 reg;
+
+	reg = cbqri_readq(ctrl->base + CBQRI_CC_CAPABILITIES_OFF);
+	if (reg == 0) {
+		pr_warn("CC at %pa: cc_capabilities reads 0, skipping\n",
+			&ctrl->addr);
+		return -ENODEV;
+	}
+
+	ver_minor = FIELD_GET(CBQRI_CC_CAPABILITIES_VER_MINOR_MASK, reg);
+	ver_major = FIELD_GET(CBQRI_CC_CAPABILITIES_VER_MAJOR_MASK, reg);
+	ctrl->cc.ncblks = FIELD_GET(CBQRI_CC_CAPABILITIES_NCBLKS_MASK, reg);
+
+	pr_debug("version=%d.%d ncblks=%d cache_level=%d\n",
+		 ver_major, ver_minor,
+		 ctrl->cc.ncblks, ctrl->cache.cache_level);
+
+	/*
+	 * The driver programs the v1.0 register layout. Controllers that
+	 * report 0.x differ only in capability bits that read as zero, so
+	 * they are accepted. Anything newer than 1.0 may move fields.
+	 */
+	if (ver_major > 1 || (ver_major == 1 && ver_minor > 0)) {
+		pr_warn("CC at %pa reports CBQRI version %d.%d, skipping\n",
+			&ctrl->addr, ver_major, ver_minor);
+		return -ENODEV;
+	}
+
+	/*
+	 * NCBLKS == 0 would divide-by-zero in rdtgroup_cbm_to_size(), which
+	 * divides the cache size by cbm_len.
+	 */
+	if (!ctrl->cc.ncblks) {
+		pr_warn("CC at %pa has 0 capacity blocks, skipping\n",
+			&ctrl->addr);
+		return -ENODEV;
+	}
+
+	/*
+	 * resctrl represents the capacity bitmask (CBM) as a u32, so a
+	 * controller with more than 32 capacity blocks cannot be expressed
+	 * through the schemata interface. Skip it rather than truncate.
+	 */
+	if (ctrl->cc.ncblks > 32) {
+		pr_warn("CC at %pa has ncblks=%u > 32 (resctrl CBM is u32), skipping\n",
+			&ctrl->addr, ctrl->cc.ncblks);
+		return -ENODEV;
+	}
+
+	/*
+	 * On a CUNITS-capable controller, CONFIG_LIMIT also consumes cc_cunits,
+	 * whose reset value is unspecified. The driver clears it to 0 (no limit)
+	 * on every CONFIG_LIMIT, so cc_cunits at 0x28 must be within the mapping.
+	 */
+	ctrl->cc.cunits = FIELD_GET(CBQRI_CC_CAPABILITIES_CUNITS_MASK, reg);
+	if (ctrl->cc.cunits && ctrl->size < CBQRI_CC_CUNITS_OFF + 8) {
+		pr_warn("CC at %pa supports CUNITS but maps only %pa, skipping\n",
+			&ctrl->addr, &ctrl->size);
+		return -ENODEV;
+	}
+
+	/* Probe allocation features */
+	err = cbqri_probe_feature(ctrl, CBQRI_CC_ALLOC_CTL_OFF,
+				  CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT,
+				  &status, &ctrl->cc.supports_alloc_at_code);
+	if (err)
+		return err;
+
+	if (status == CBQRI_CC_ALLOC_CTL_STATUS_SUCCESS)
+		ctrl->alloc_capable = true;
+
+	return 0;
+}
+
+static int cbqri_probe_controller(struct cbqri_controller *ctrl)
+{
+	pr_debug("controller info: type=%d addr=%pa size=%pa max-rcid=%u\n",
+		 ctrl->type, &ctrl->addr, &ctrl->size, ctrl->rcid_count);
+
+	if (!ctrl->addr) {
+		pr_warn("controller has invalid addr=0x0, skipping\n");
+		return -EINVAL;
+	}
+
+	if (ctrl->size < CBQRI_CTRL_MIN_REG_SPAN) {
+		pr_warn("controller at %pa: size %pa < minimum 0x%x, skipping\n",
+			&ctrl->addr, &ctrl->size, CBQRI_CTRL_MIN_REG_SPAN);
+		return -EINVAL;
+	}
+
+	switch (ctrl->type) {
+	case CBQRI_CONTROLLER_TYPE_CAPACITY:
+		return cbqri_probe_cc(ctrl);
+	default:
+		pr_err("unknown controller type %d\n", ctrl->type);
+		return -ENODEV;
+	}
+}
+
+/**
+ * riscv_cbqri_register_cc() - register a capacity controller
+ * @info: registration descriptor. info->type must be CAPACITY. The resctrl
+ *        glue maps info->cache_level to the L2/L3 resource and uses
+ *        info->cache_id as the domain id.
+ *
+ * The caller resolves the cache level and id from its firmware description.
+ * Domain membership is resolved per CPU at hotplug, so no cpu mask is stored.
+ *
+ * Return: 0 on success, -EEXIST when a controller for the same cache level
+ * and id is already registered, or another negative errno on failure.
+ */
+int riscv_cbqri_register_cc(const struct cbqri_controller_info *info)
+{
+	struct cbqri_controller *other;
+	int err;
+
+	if (!info->addr) {
+		pr_warn("skipping controller with invalid addr=0x0\n");
+		return -EINVAL;
+	}
+
+	if (info->type != CBQRI_CONTROLLER_TYPE_CAPACITY) {
+		pr_warn("register_cc called with non-capacity type %u\n",
+			info->type);
+		return -EINVAL;
+	}
+
+	/*
+	 * SRMCFG encodes RCID in 12 bits. Reject an out-of-range count rather
+	 * than let FIELD_PREP(SRMCFG_RCID_MASK, closid) truncate it silently.
+	 */
+	if (info->rcid_count > FIELD_MAX(SRMCFG_RCID_MASK) + 1) {
+		pr_warn("CC at %pa has RCID count %u beyond the 12-bit SRMCFG field, skipping\n",
+			&info->addr, info->rcid_count);
+		return -EINVAL;
+	}
+
+	struct cbqri_controller *ctrl __free(kfree) =
+		kzalloc(sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	mutex_init(&ctrl->lock);
+
+	ctrl->base = info->base;
+	ctrl->addr = info->addr;
+	ctrl->size = info->size;
+	ctrl->type = info->type;
+	ctrl->rcid_count = info->rcid_count;
+	ctrl->cache.cache_id = info->cache_id;
+	ctrl->cache.cache_level = info->cache_level;
+
+	err = cbqri_probe_controller(ctrl);
+	if (err)
+		return err;
+
+	/*
+	 * Allocation capability comes from the capabilities register probed
+	 * above, not from device tree. rcid_count only bounds the RCID range,
+	 * so a controller the hardware reports as alloc-capable but described
+	 * with no RCID count cannot be driven. Reject that inconsistency. A
+	 * monitoring-only controller (not alloc_capable) needs no RCID count.
+	 */
+	if (ctrl->alloc_capable && !ctrl->rcid_count) {
+		pr_warn("CC at %pa is alloc-capable but has no RCID count, skipping\n",
+			&ctrl->addr);
+		return -EINVAL;
+	}
+
+	guard(mutex)(&cbqri_controllers_lock);
+
+	/* The resctrl glue keys its domains on cache_id, one controller each. */
+	list_for_each_entry(other, &cbqri_controllers, list) {
+		if (other->cache.cache_level == info->cache_level &&
+		    other->cache.cache_id == info->cache_id) {
+			pr_warn("CC at %pa duplicates the L%u cache id %u controller at %pa, skipping\n",
+				&ctrl->addr, info->cache_level, info->cache_id,
+				&other->addr);
+			return -EEXIST;
+		}
+	}
+
+	list_add_tail(&ctrl->list, &cbqri_controllers);
+	retain_and_null_ptr(ctrl);
+	return 0;
+}
diff --git a/drivers/resctrl/cbqri_internal.h b/drivers/resctrl/cbqri_internal.h
new file mode 100644
index 000000000000..fb8246b9aee7
--- /dev/null
+++ b/drivers/resctrl/cbqri_internal.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _DRIVERS_RESCTRL_CBQRI_INTERNAL_H
+#define _DRIVERS_RESCTRL_CBQRI_INTERNAL_H
+
+#include <linux/bitfield.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/riscv_cbqri.h>
+#include <linux/types.h>
+
+/* Capacity Controller (CC) MMIO register offsets. */
+#define CBQRI_CC_CAPABILITIES_OFF 0
+#define CBQRI_CC_ALLOC_CTL_OFF   24
+#define CBQRI_CC_BLOCK_MASK_OFF  32
+
+/*
+ * The block-mask width BMW is the smallest multiple of 64 bits that holds
+ * NCBLKS, so cc_cunits sits at 32 + BMW/8 bytes. This constant is valid
+ * only while NCBLKS <= 64. cbqri_probe_cc() rejects ncblks > 32 before it
+ * reads cc_capabilities.CUNITS, forcing BMW to 64 bits, one 8-byte block
+ * mask, and cc_cunits at 0x28. Raising that cap above 64 would require
+ * computing 32 + roundup(ncblks, 64) / 8 instead of a constant.
+ */
+#define CBQRI_CC_CUNITS_OFF      40
+
+/*
+ * Highest base register offset (cc_block_mask at 0x20) plus its 8-byte width.
+ * cbqri_probe_controller() rejects smaller mappings. cc_cunits at 0x28 is
+ * optional and only required when cc_capabilities.CUNITS is set, which
+ * cbqri_probe_cc() checks against the mapping size separately.
+ */
+#define CBQRI_CTRL_MIN_REG_SPAN  0x28u
+
+#define CBQRI_CC_CAPABILITIES_VER_MINOR_MASK  GENMASK_ULL(3, 0)
+#define CBQRI_CC_CAPABILITIES_VER_MAJOR_MASK  GENMASK_ULL(7, 4)
+#define CBQRI_CC_CAPABILITIES_NCBLKS_MASK     GENMASK_ULL(23, 8)
+#define CBQRI_CC_CAPABILITIES_CUNITS_MASK     BIT_ULL(25)
+
+/*
+ * CC control registers are 64-bit, but the CBQRI spec only guarantees
+ * single-copy atomicity for naturally aligned 4-byte accesses. They are read
+ * as two 32-bit halves (cbqri_readq) reconstructed into a u64 for field
+ * extraction, and written via the low 32-bit half, so the driver does not
+ * depend on native 64-bit MMIO. Keep every field mask GENMASK_ULL so
+ * FIELD_MODIFY() or ~mask on the reconstructed u64 never zero-extends a
+ * 32-bit mask and clobbers STATUS/BUSY/WPRI in bits 63:32.
+ */
+#define CBQRI_CONTROL_REGISTERS_OP_MASK      GENMASK_ULL(4, 0)
+#define CBQRI_CONTROL_REGISTERS_AT_MASK      GENMASK_ULL(7, 5)
+/* CBQRI Access Type (AT) selects the data or code half, used for CDP */
+#define CBQRI_CONTROL_REGISTERS_AT_DATA      0
+#define CBQRI_CONTROL_REGISTERS_AT_CODE      1
+#define CBQRI_CONTROL_REGISTERS_RCID_MASK    GENMASK_ULL(19, 8)
+#define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK_ULL(38, 32)
+#define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK_ULL(39, 39)
+
+#define CBQRI_CC_ALLOC_CTL_OP_CONFIG_LIMIT 1
+#define CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT   2
+#define CBQRI_CC_ALLOC_CTL_STATUS_SUCCESS  1
+
+/* Capacity Controller hardware capabilities */
+struct riscv_cbqri_capacity_caps {
+	u16 ncblks;
+	bool supports_alloc_at_code;
+	/* cc_capabilities.CUNITS: controller enforces a capacity-unit limit */
+	bool cunits;
+};
+
+/**
+ * struct cbqri_cc_config - desired capacity allocation state for one rcid
+ * @cbm:         capacity block mask
+ * @at:          AT half the @cbm applies to (CBQRI_CONTROL_REGISTERS_AT_DATA
+ *               or CBQRI_CONTROL_REGISTERS_AT_CODE)
+ * @cdp_enabled: when false and the controller supports AT, mirror @cbm
+ *               into the other AT half so both stay in sync
+ */
+struct cbqri_cc_config {
+	u64  cbm;
+	u32  at;
+	bool cdp_enabled;
+};
+
+struct cbqri_controller {
+	void __iomem *base;
+	/* Serializes the multi-register operations on this controller. */
+	struct mutex lock;
+
+	struct riscv_cbqri_capacity_caps cc;
+
+	bool alloc_capable;
+
+	phys_addr_t addr;
+	phys_addr_t size;
+	enum cbqri_controller_type type;
+	u32 rcid_count;
+
+	struct list_head list;
+
+	struct cache_controller {
+		u32 cache_level;
+		/* Cache id used as the resctrl domain id */
+		u32 cache_id;
+	} cache;
+};
+
+int cbqri_get_controllers(struct cbqri_controller ***ctrls);
+
+int cbqri_apply_cache_config(struct cbqri_controller *ctrl, u32 closid,
+			     const struct cbqri_cc_config *cfg);
+
+int cbqri_read_cache_config(struct cbqri_controller *ctrl, u32 closid,
+			    u32 at, u32 *cbm_out);
+
+#endif /* _DRIVERS_RESCTRL_CBQRI_INTERNAL_H */
diff --git a/include/linux/riscv_cbqri.h b/include/linux/riscv_cbqri.h
new file mode 100644
index 000000000000..b0daa1a7e42f
--- /dev/null
+++ b/include/linux/riscv_cbqri.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Public registration API for the RISC-V Capacity and Bandwidth QoS
+ * Register Interface (CBQRI) core. Discovery layers call
+ * riscv_cbqri_register_cc() to hand a capacity controller descriptor to
+ * the core, which owns all subsequent state.
+ */
+#ifndef _LINUX_RISCV_CBQRI_H
+#define _LINUX_RISCV_CBQRI_H
+
+#include <linux/errno.h>
+#include <linux/types.h>
+
+enum cbqri_controller_type {
+	CBQRI_CONTROLLER_TYPE_CAPACITY,
+};
+
+/**
+ * struct cbqri_controller_info - registration descriptor
+ * @addr:        MMIO base address of the controller's register interface
+ * @size:        size of the MMIO region
+ * @type:        controller type (capacity)
+ * @rcid_count:  number of supported RCIDs
+ * @cache_id:    cache id used as the resctrl domain id
+ * @cache_level: cache level (2 or 3) the controller backs
+ * @base:        mapped register block, which the caller keeps mapped for
+ *               the life of the system
+ */
+struct cbqri_controller_info {
+	phys_addr_t			addr;
+	phys_addr_t			size;
+	void __iomem			*base;
+	enum cbqri_controller_type	type;
+	u32				rcid_count;
+	u32				cache_id;
+	u32				cache_level;
+};
+
+#if IS_ENABLED(CONFIG_RISCV_CBQRI)
+int riscv_cbqri_register_cc(const struct cbqri_controller_info *info);
+#else
+static inline int
+riscv_cbqri_register_cc(const struct cbqri_controller_info *info)
+{
+	return -ENODEV;
+}
+#endif
+
+#endif /* _LINUX_RISCV_CBQRI_H */

-- 
2.43.0


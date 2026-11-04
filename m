Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810952;
	b=KnqcMAip4pDwoqwUe21guoOF48S/YZ397daIvs8MGQUhEYW3xs9/Dw7xlT3/0CqVy3s5
	 kzqq/nMXdnsueIFlBo6sh48nsmwvUXL3PQCqUK5aIINqED9Jo1xbwznX02tE4kuyDynX2
	 uce54BhFRtWhSnl+t5ip2/rC7upPMB52DacecM7wuuen7QVCwJsfuAb8CBPcodjchH5XA
	 ybhV9eIAFdYLGnxHS8DoeFfsoqevggdPGBf1bfzydkYiy+cI0yjpdRfrfnNZL48ilnRT3
	 EbsJcmaCyRikpknK3FLkFo7n2k5dxalS1tTaDyyTYMhYP0DcaCa7U9SNF6N6FxMN52w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810952;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=80Qpsyrc0GiA/7VBZSLXp5vdnHVpardq1RD6XtWCuUs=;
	b=Jqc8O9SC7R8nPdLH5bJlS+k4BaQi1JtLve8oOaNi1HW3Inxg7aam073OMI2N3U/+q3uz
	 4dssj9OH7jJJMy5cYi/R2qDT87/7bJN0+bfmqV3zm2Zh4kN0ewa4nlQxl5sH9GegNvHVl
	 lBd0pNfokGPxOdLrshrCPCwIVCswWTg3nM2/tdhJ9vC1KeWUCUrhUK7dieD0e36vixoc2
	 +pZqsce52Z3b7ctQjGx16jVBukhTNMQUKXKE3DnYQkseN4oEKDvCnKdNLaEcpp10mnIqL
	 IcJ6YwkPpm/eb5Byoy9lIHCz+1Va54hjZlYANUHdddBLa2rLrZBkBVnxBhunZ5AJYVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S37w0jkx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A06E606D818;
	Wed,  4 Nov 2026 16:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S37w0jkx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C471D1F00A1D;
	Wed,  4 Nov 2026 16:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810951;
	bh=80Qpsyrc0GiA/7VBZSLXp5vdnHVpardq1RD6XtWCuUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=S37w0jkxDJ9YJo+sZZ/VqbKl2F/TMzvP8TldmtzT2ZJJaMz4WLrxMBDdQWezHJ4Ix
	 aNgUP2/IuVX34dzo/h5GuftWqRKhCV7iP2qHDOB3NuJ8Fdhm9eZGUExlLNVv3gL/h/
	 KCSS3oQCg34vxRc6hH81qyU/0WwxIBSoUwfghP6LIDyMeK4XDTNKV0/empaconovTK
	 EYVWwC5LqKBH40l3c6esHIZ6xlhd0AQ4tjZ4qxXN3bv7pHu1itmZ8/HsfM4o0dZx/3
	 gYiXvq4jDNdeluzvl2kXaAgdM3k2vuuH2R0FRhNOfx4iuiEn6XPRcArcVH+i4swMw8
	 /ngfu/iiB2syg==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 04 Nov 2026 08:35:19 -0800
Subject: [PATCH v10 2/6] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
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
Message-Id: <20261104-dfustini-atl-sc-cbqri-dt-v10-2-1636a003a3c0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=31898; i=fustini@kernel.org;
 h=from:subject:message-id; bh=lxOlxv1vFyyV8t7PGWyCh8wNILniGqWvOqtGYNrJbcw=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWS9TmLlU7a+LRL4pOp/57TnRtbvzxd6PnY7Zmpd9HRyz
 70eI9cpHaUsDGJcDLJiiiybPuRdWOIV+nXB/BfbYOawMoEMYeDiFICJ7HvD8Ffcrlg0YUrp1L85
 0evtz13v3l/zf8L8MlMjieUHPJiSI78w/E9xlpTkSMoI0Y3snMpzdwr/ZLZJWx9fPyI5Z3JG9DY
 hAwYA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010

Wire CBQRI capacity controllers into resctrl as the L2 and L3 cache
resources.

resctrl exposes a single capacity mask per resource, so when more than
one capacity controller backs a cache level they must report the same
number of capacity blocks. The same holds for the other capabilities
resctrl exposes once per resource. A level whose controllers disagree
is left unexposed. Other levels are unaffected.

The set of controllers backing each level is fixed when resctrl is set
up at late_initcall. Control domains are created in the cpuhp online
callback and keyed on the onlining CPU's cache id from cacheinfo, so a
CPU that is offline at probe time still joins its domain once it comes
online, provided a controller for its cache is in that set.

A CPU whose cache has no controller, or whose domain cannot be created,
still comes online. It is left out of that level and a warning is
logged, since bringing the CPU up matters more than controlling its
cache traffic. A domain is published on the ctrl_domains RCU list only
after it is fully initialized and brought online, and removed from the
list before it is taken offline, following the documented safe
traversal rules.

Tested-by: Chen Pei <cp0613@linux.alibaba.com>
Acked-by: Reinette Chatre <reinette.chatre@intel.com>
Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS                      |   2 +
 arch/riscv/include/asm/resctrl.h | 149 +++++++
 drivers/resctrl/Kconfig          |   4 +
 drivers/resctrl/Makefile         |   1 +
 drivers/resctrl/cbqri_resctrl.c  | 823 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 979 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b3060bdfa89..1ba75a57c77b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24138,9 +24138,11 @@ R:	yunhui cui <cuiyunhui@bytedance.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/include/asm/qos.h
+F:	arch/riscv/include/asm/resctrl.h
 F:	arch/riscv/kernel/qos.c
 F:	drivers/resctrl/cbqri_devices.c
 F:	drivers/resctrl/cbqri_internal.h
+F:	drivers/resctrl/cbqri_resctrl.c
 F:	include/linux/riscv_cbqri.h
 
 RISC-V RPMI AND MPXY DRIVERS
diff --git a/arch/riscv/include/asm/resctrl.h b/arch/riscv/include/asm/resctrl.h
new file mode 100644
index 000000000000..d79ba0b3e9b8
--- /dev/null
+++ b/arch/riscv/include/asm/resctrl.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_RISCV_RESCTRL_H
+#define _ASM_RISCV_RESCTRL_H
+
+#include <linux/resctrl_types.h>
+#include <linux/sched.h>
+#include <linux/types.h>
+
+#include <asm/qos.h>
+
+struct rdt_resource;
+
+/*
+ * Sentinel "no CLOSID assigned" used by resctrl_arch_rmid_idx_decode().
+ * resctrl treats this opaquely. CBQRI uses MCID directly as the linear
+ * rmid index, so closid is unused on decode.
+ */
+#define RISCV_RESCTRL_EMPTY_CLOSID	((u32)~0)
+
+/*
+ * Terminology mapping between x86 (Intel RDT/AMD QoS) and RISC-V:
+ *
+ *  CLOSID on x86 is RCID on RISC-V
+ *    RMID on x86 is MCID on RISC-V
+ *     CDP on x86 is AT (access type) on RISC-V
+ */
+
+/**
+ * resctrl_arch_alloc_capable() - any CBQRI controller exposes resctrl alloc
+ *
+ * True while at least one resource set up by cbqri_resctrl_setup() has
+ * rdt_resource::alloc_capable set, so it gives the same answer as walking
+ * the resources. Only meaningful after late_initcall.
+ */
+bool resctrl_arch_alloc_capable(void);
+
+/**
+ * resctrl_arch_mon_capable() - any CBQRI controller exposes resctrl monitoring
+ *
+ * The CBQRI driver implements capacity allocation only and wires up no
+ * monitoring events, so this always returns false. resctrl references it
+ * unconditionally, hence the stub.
+ */
+bool resctrl_arch_mon_capable(void);
+
+/**
+ * resctrl_arch_rmid_idx_encode() - encode (RCID, MCID) into a linear index
+ * @closid: RCID (resource control id)
+ * @rmid:   MCID (monitoring counter id)
+ *
+ * RISC-V uses MCID directly as the linear index into per-RMID arrays
+ * managed by resctrl, since CBQRI controllers admit any MCID for any
+ * RCID. closid is unused here. CDP is encoded via the AT field on each
+ * CBQRI op rather than via the index.
+ */
+u32  resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
+
+/**
+ * resctrl_arch_rmid_idx_decode() - inverse of resctrl_arch_rmid_idx_encode()
+ * @idx:    linear index
+ * @closid: out: always RISCV_RESCTRL_EMPTY_CLOSID
+ * @rmid:   out: the MCID that @idx encodes
+ */
+void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
+
+/**
+ * resctrl_arch_set_cpu_default_closid_rmid() - install per-CPU srmcfg default
+ * @cpu:    CPU number
+ * @closid: the CPU's default RCID
+ * @rmid:   the CPU's default MCID
+ *
+ * Sets the per-CPU cpu_srmcfg_default that __switch_to_srmcfg() falls back
+ * to, field by field: a task whose RCID is RESCTRL_RESERVED_CLOSID (0)
+ * takes the CPU's RCID, and one whose MCID is RESCTRL_RESERVED_RMID (0)
+ * takes the CPU's MCID. Implements resctrl allocation rule 2 ("CPU
+ * default") on RISC-V.
+ */
+void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid);
+
+/**
+ * resctrl_arch_sched_in() - install the current task's RCID/MCID on this CPU
+ * @tsk: the task to install, always the current task
+ *
+ * Writes tsk->thread.srmcfg into the srmcfg CSR through
+ * __switch_to_srmcfg(), the same path switch_to() takes. resctrl calls it
+ * on the task's own CPU after retagging the task or changing the CPU
+ * default. A zero RCID or MCID field takes the per-CPU default set via
+ * resctrl_arch_set_cpu_default_closid_rmid().
+ */
+void resctrl_arch_sched_in(struct task_struct *tsk);
+
+/**
+ * resctrl_arch_set_closid_rmid() - tag a task with an RCID/MCID
+ * @tsk:    task to tag
+ * @closid: RCID to install
+ * @rmid:   MCID to install
+ *
+ * Updates tsk->thread.srmcfg with the encoded (RCID, MCID) pair. The new
+ * value reaches the CSR at the task's next switch_to(), or right away
+ * through resctrl_arch_sched_in() when resctrl retags a running task.
+ */
+void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
+
+/**
+ * resctrl_arch_match_closid() - test whether a task carries a given RCID
+ * @tsk:    task
+ * @closid: RCID
+ */
+bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
+
+/**
+ * resctrl_arch_match_rmid() - test whether a task carries a given (RCID, MCID)
+ * @tsk:    task
+ * @closid: RCID
+ * @rmid:   MCID
+ */
+bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
+
+/**
+ * resctrl_arch_mon_ctx_alloc() - allocate per-monitor-event arch context
+ * @r:     resctrl resource being monitored
+ * @evtid: which monitor event needs context
+ *
+ * The CBQRI driver implements no monitoring events, so there is no per-event
+ * context to allocate and the stub returns NULL.
+ */
+void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
+
+/**
+ * resctrl_arch_mon_ctx_free() - release context returned by mon_ctx_alloc()
+ * @r:            resctrl resource
+ * @evtid:        monitor event id
+ * @arch_mon_ctx: pointer returned by resctrl_arch_mon_ctx_alloc()
+ */
+void resctrl_arch_mon_ctx_free(struct rdt_resource *r, enum resctrl_event_id evtid,
+			       void *arch_mon_ctx);
+
+static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
+{
+	return val;
+}
+
+/* Not needed for RISC-V */
+static inline void resctrl_arch_enable_mon(void) { }
+static inline void resctrl_arch_disable_mon(void) { }
+static inline void resctrl_arch_enable_alloc(void) { }
+static inline void resctrl_arch_disable_alloc(void) { }
+
+#endif /* _ASM_RISCV_RESCTRL_H */
diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
index c0c252e6f5e7..0d7ca2dec308 100644
--- a/drivers/resctrl/Kconfig
+++ b/drivers/resctrl/Kconfig
@@ -40,3 +40,7 @@ menuconfig RISCV_CBQRI
 	  RISC-V cache QoS resources. CBQRI exposes cache capacity
 	  allocation through the resctrl filesystem at /sys/fs/resctrl when
 	  RESCTRL_FS is also enabled.
+
+config RISCV_CBQRI_RESCTRL_FS
+	bool
+	default y if RISCV_CBQRI && RESCTRL_FS
diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
index e86a873208ad..9473b47c93d5 100644
--- a/drivers/resctrl/Makefile
+++ b/drivers/resctrl/Makefile
@@ -6,3 +6,4 @@ ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
 
 obj-$(CONFIG_RISCV_CBQRI)			+= cbqri.o
 cbqri-y						+= cbqri_devices.o
+cbqri-$(CONFIG_RISCV_CBQRI_RESCTRL_FS)		+= cbqri_resctrl.o
diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
new file mode 100644
index 000000000000..165b0027bbe0
--- /dev/null
+++ b/drivers/resctrl/cbqri_resctrl.c
@@ -0,0 +1,823 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
+
+#include <linux/bitfield.h>
+#include <linux/cacheinfo.h>
+#include <linux/cleanup.h>
+#include <linux/cpu.h>
+#include <linux/cpufeature.h>
+#include <linux/cpuhotplug.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/rculist.h>
+#include <linux/resctrl.h>
+#include <linux/riscv_cbqri.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include <asm/csr.h>
+#include <asm/qos.h>
+
+#include "cbqri_internal.h"
+
+struct cbqri_resctrl_res {
+	/*
+	 * Capacity controllers picked for this resource at late_initcall,
+	 * one per cache instance at its level. cbqri_resctrl_pick_caches()
+	 * only accepts a set that agrees on the capabilities resctrl exposes
+	 * once per resource, so ctrls[0] speaks for all of them.
+	 */
+	struct cbqri_controller **ctrls;
+	unsigned int            nr_ctrls;
+	struct rdt_resource     resctrl_res;
+	bool                    cdp_enabled;
+};
+
+struct cbqri_resctrl_dom {
+	struct rdt_ctrl_domain  resctrl_ctrl_dom;
+	struct cbqri_controller *hw_ctrl;
+};
+
+static struct cbqri_resctrl_res cbqri_resctrl_resources[RDT_NUM_RESOURCES];
+
+/* Protects ctrl_domain list mutations across CPU hotplug. */
+static DEFINE_MUTEX(cbqri_domain_list_lock);
+
+/*
+ * Look up the ctrl_domain with this id. When there is none and pos is
+ * given, pos receives the list position a new domain with this id has to
+ * be inserted before, so the caller can add it without a second walk.
+ */
+static struct rdt_ctrl_domain *
+cbqri_find_ctrl_domain(struct list_head *h, int id, struct list_head **pos)
+{
+	struct rdt_domain_hdr *hdr = resctrl_find_domain(h, id, pos);
+
+	return hdr ? container_of(hdr, struct rdt_ctrl_domain, hdr) : NULL;
+}
+
+/* The picked controller backing cache instance cache_id, or NULL. */
+static struct cbqri_controller *
+cbqri_resctrl_find_ctrl(const struct cbqri_resctrl_res *hw_res, u32 cache_id)
+{
+	unsigned int i;
+
+	for (i = 0; i < hw_res->nr_ctrls; i++) {
+		if (hw_res->ctrls[i]->cache.cache_id == cache_id)
+			return hw_res->ctrls[i];
+	}
+
+	return NULL;
+}
+
+/* Map a hardware cache level to its resctrl resource id, or -ENODEV. */
+static int cbqri_cache_level_to_rid(u32 cache_level)
+{
+	switch (cache_level) {
+	case 2:
+		return RDT_RESOURCE_L2;
+	case 3:
+		return RDT_RESOURCE_L3;
+	default:
+		return -ENODEV;
+	}
+}
+
+static int cbqri_apply_cache_config_dom(struct cbqri_resctrl_dom *hw_dom,
+					struct rdt_resource *r,
+					u32 closid, enum resctrl_conf_type t,
+					u64 cbm)
+{
+	struct cbqri_resctrl_res *hw_res =
+		container_of(r, struct cbqri_resctrl_res, resctrl_res);
+	struct cbqri_cc_config cfg = {
+		.cbm = cbm,
+		.at = (t == CDP_CODE) ? CBQRI_CONTROL_REGISTERS_AT_CODE :
+					CBQRI_CONTROL_REGISTERS_AT_DATA,
+		.cdp_enabled = hw_res->cdp_enabled,
+	};
+
+	return cbqri_apply_cache_config(hw_dom->hw_ctrl, closid, &cfg);
+}
+
+/* True while at least one picked resource offers capacity allocation. */
+static bool cbqri_resctrl_any_alloc_capable(void)
+{
+	int rid;
+
+	for (rid = 0; rid < RDT_NUM_RESOURCES; rid++) {
+		if (cbqri_resctrl_resources[rid].resctrl_res.alloc_capable)
+			return true;
+	}
+
+	return false;
+}
+
+bool resctrl_arch_alloc_capable(void)
+{
+	return cbqri_resctrl_any_alloc_capable();
+}
+
+bool resctrl_arch_mon_capable(void)
+{
+	return false;
+}
+
+bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
+{
+	if (rid != RDT_RESOURCE_L2 && rid != RDT_RESOURCE_L3)
+		return false;
+	return cbqri_resctrl_resources[rid].cdp_enabled;
+}
+
+int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
+{
+	struct cbqri_resctrl_res *cbqri_res;
+
+	if (rid != RDT_RESOURCE_L2 && rid != RDT_RESOURCE_L3)
+		return -ENODEV;
+
+	cbqri_res = &cbqri_resctrl_resources[rid];
+	if (!cbqri_res->resctrl_res.cdp_capable)
+		return -ENODEV;
+
+	cbqri_res->cdp_enabled = enable;
+	return 0;
+}
+
+struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
+{
+	if (l >= RDT_NUM_RESOURCES)
+		return NULL;
+
+	return &cbqri_resctrl_resources[l].resctrl_res;
+}
+
+bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
+{
+	return false;
+}
+
+void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
+				 enum resctrl_event_id evtid)
+{
+	return NULL;
+}
+
+void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
+			       enum resctrl_event_id evtid, void *arch_mon_ctx)
+{
+}
+
+void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
+			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
+			      u32 cntr_id, bool assign)
+{
+}
+
+int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
+			   u32 unused, u32 rmid, int cntr_id,
+			   enum resctrl_event_id eventid, u64 *val)
+{
+	return -EOPNOTSUPP;
+}
+
+bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
+{
+	return false;
+}
+
+int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
+{
+	return -EOPNOTSUPP;
+}
+
+void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
+			     u32 unused, u32 rmid, int cntr_id,
+			     enum resctrl_event_id eventid)
+{
+}
+
+bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
+{
+	return false;
+}
+
+int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
+{
+	return -EOPNOTSUPP;
+}
+
+void resctrl_arch_mon_event_config_read(void *info)
+{
+}
+
+void resctrl_arch_mon_event_config_write(void *info)
+{
+}
+
+void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_l3_mon_domain *d)
+{
+}
+
+void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
+			     u32 unused, u32 rmid, enum resctrl_event_id eventid)
+{
+}
+
+int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
+			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
+			   void *arch_priv, u64 *val, void *arch_mon_ctx)
+{
+	return -ENODATA;
+}
+
+/*
+ * Note about terminology between x86 (Intel RDT/AMD QoS) and RISC-V:
+ *   CLOSID on x86 is RCID on RISC-V
+ *     RMID on x86 is MCID on RISC-V
+ *
+ * schemata_list_add() halves this count when CDP is enabled because a
+ * CDP CLOSID takes two hardware IDs on x86. CBQRI selects the code or
+ * data allocation with the AT field next to the RCID, so every CLOSID
+ * resctrl hands out under CDP is already a distinct RCID and the RCIDs
+ * from rcid_count/2 upward sit idle. Skipping the halving would need a
+ * resctrl change, so it is left as is.
+ */
+u32 resctrl_arch_get_num_closid(struct rdt_resource *res)
+{
+	struct cbqri_resctrl_res *hw_res;
+
+	hw_res = container_of(res, struct cbqri_resctrl_res, resctrl_res);
+
+	if (!hw_res->nr_ctrls)
+		return 0;
+
+	return hw_res->ctrls[0]->rcid_count;
+}
+
+u32 resctrl_arch_system_num_rmid_idx(void)
+{
+	return 1;
+}
+
+u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
+{
+	return rmid;
+}
+
+void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
+{
+	*closid = RISCV_RESCTRL_EMPTY_CLOSID;
+	*rmid = idx;
+}
+
+void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid)
+{
+	u32 srmcfg = FIELD_PREP(SRMCFG_RCID_MASK, closid) |
+		     FIELD_PREP(SRMCFG_MCID_MASK, rmid);
+
+	WRITE_ONCE(per_cpu(cpu_srmcfg_default, cpu), srmcfg);
+}
+
+void resctrl_arch_sched_in(struct task_struct *tsk)
+{
+	__switch_to_srmcfg(tsk);
+}
+
+void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
+{
+	u32 srmcfg = FIELD_PREP(SRMCFG_RCID_MASK, closid) |
+		     FIELD_PREP(SRMCFG_MCID_MASK, rmid);
+
+	WRITE_ONCE(tsk->thread.srmcfg, srmcfg);
+}
+
+void resctrl_arch_sync_cpu_closid_rmid(void *info)
+{
+	struct resctrl_cpu_defaults *r = info;
+
+	lockdep_assert_preemption_disabled();
+
+	if (r) {
+		resctrl_arch_set_cpu_default_closid_rmid(smp_processor_id(),
+							 r->closid, r->rmid);
+	}
+
+	resctrl_arch_sched_in(current);
+}
+
+bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
+{
+	return FIELD_GET(SRMCFG_RCID_MASK, READ_ONCE(tsk->thread.srmcfg)) == closid;
+}
+
+bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
+{
+	return FIELD_GET(SRMCFG_MCID_MASK, READ_ONCE(tsk->thread.srmcfg)) == rmid;
+}
+
+void resctrl_arch_pre_mount(void)
+{
+	/* All controllers are picked at boot in late_initcall. Nothing to do. */
+}
+
+/* No MB resource is exposed, so there is no bandwidth value to convert. */
+u32 resctrl_arch_preconvert_bw(const struct rdt_resource *r, u32 val)
+{
+	return val;
+}
+
+int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
+			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
+{
+	struct cbqri_resctrl_dom *dom;
+
+	dom = container_of(d, struct cbqri_resctrl_dom, resctrl_ctrl_dom);
+
+	if (!r->alloc_capable)
+		return -EINVAL;
+
+	switch (r->rid) {
+	case RDT_RESOURCE_L2:
+	case RDT_RESOURCE_L3:
+		return cbqri_apply_cache_config_dom(dom, r, closid, t, cfg_val);
+	default:
+		return -EINVAL;
+	}
+}
+
+int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
+{
+	struct resctrl_staged_config *cfg;
+	enum resctrl_conf_type t;
+	struct rdt_ctrl_domain *d;
+	int err = 0;
+
+	/* Walking r->ctrl_domains, ensure it can't race with cpuhp */
+	lockdep_assert_cpus_held();
+
+	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
+		for (t = 0; t < CDP_NUM_TYPES; t++) {
+			cfg = &d->staged_config[t];
+			if (!cfg->have_new_ctrl)
+				continue;
+			err = resctrl_arch_update_one(r, d, closid, t, cfg->new_ctrl);
+			if (err)
+				return err;
+		}
+	}
+	return err;
+}
+
+u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
+			    u32 closid, enum resctrl_conf_type type)
+{
+	struct cbqri_resctrl_dom *hw_dom;
+	struct cbqri_controller *ctrl;
+	u32 at;
+	u32 val;
+	int err;
+
+	hw_dom = container_of(d, struct cbqri_resctrl_dom, resctrl_ctrl_dom);
+	ctrl = hw_dom->hw_ctrl;
+	val = resctrl_get_default_ctrl(r);
+
+	if (!r->alloc_capable)
+		return val;
+
+	switch (r->rid) {
+	case RDT_RESOURCE_L2:
+	case RDT_RESOURCE_L3:
+		at = (type == CDP_CODE) ? CBQRI_CONTROL_REGISTERS_AT_CODE :
+					  CBQRI_CONTROL_REGISTERS_AT_DATA;
+		err = cbqri_read_cache_config(ctrl, closid, at, &val);
+		if (err < 0)
+			val = resctrl_get_default_ctrl(r);
+		break;
+	default:
+		break;
+	}
+
+	return val;
+}
+
+static int cbqri_init_domain_ctrlval(struct rdt_resource *r, struct rdt_ctrl_domain *d)
+{
+	u32 num_closid = resctrl_arch_get_num_closid(r);
+	enum resctrl_conf_type t;
+	int err = 0;
+	u32 i;
+
+	for (i = 0; i < num_closid; i++) {
+		/*
+		 * Program the default mask into both AT halves, CDP_CODE and
+		 * CDP_DATA, so a later mount with -o cdp does not see stale
+		 * CODE values. CDP_NONE selects the same half as CDP_DATA, so
+		 * it is skipped. With CDP off cbqri_apply_cache_config()
+		 * mirrors each write into the other half, and non-AT
+		 * controllers take AT=0 for both, so the second pass is
+		 * redundant there but harmless.
+		 */
+		for (t = CDP_CODE; t < CDP_NUM_TYPES; t++) {
+			err = resctrl_arch_update_one(r, d, i, t,
+						      resctrl_get_default_ctrl(r));
+			if (err)
+				return err;
+		}
+	}
+	return 0;
+}
+
+void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
+{
+	struct rdt_ctrl_domain *d;
+	int err;
+
+	lockdep_assert_cpus_held();
+
+	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
+		err = cbqri_init_domain_ctrlval(r, d);
+		if (err)
+			pr_err_ratelimited("rid=%d reset of domain %d failed (%d)\n",
+					   r->rid, d->hdr.id, err);
+	}
+}
+
+static struct rdt_ctrl_domain *cbqri_new_domain(struct cbqri_controller *ctrl)
+{
+	struct cbqri_resctrl_dom *hw_dom;
+	struct rdt_ctrl_domain *domain;
+
+	hw_dom = kzalloc_obj(*hw_dom, GFP_KERNEL);
+	if (!hw_dom)
+		return NULL;
+
+	hw_dom->hw_ctrl = ctrl;
+	domain = &hw_dom->resctrl_ctrl_dom;
+
+	INIT_LIST_HEAD(&domain->hdr.list);
+
+	return domain;
+}
+
+/*
+ * Two capacity controllers at the same cache level are interchangeable to
+ * resctrl only if they expose identical caps, since resctrl publishes one
+ * set of caps per rid but any of the level's controllers may service a
+ * given RCID.
+ */
+static bool cbqri_cc_caps_agree(const struct cbqri_controller *a,
+				const struct cbqri_controller *b)
+{
+	return a->rcid_count == b->rcid_count &&
+	       a->cc.ncblks == b->cc.ncblks &&
+	       a->cc.supports_alloc_at_code == b->cc.supports_alloc_at_code &&
+	       a->alloc_capable == b->alloc_capable;
+}
+
+/* An alloc-capable capacity controller at the cache level rid stands for. */
+static bool cbqri_ctrl_backs_rid(const struct cbqri_controller *ctrl, int rid)
+{
+	return ctrl->type == CBQRI_CONTROLLER_TYPE_CAPACITY &&
+	       ctrl->alloc_capable &&
+	       cbqri_cache_level_to_rid(ctrl->cache.cache_level) == rid;
+}
+
+/*
+ * Fetch the registered controllers once and keep, per cache level
+ * (L2/L3), every capacity controller (CC) that backs the corresponding
+ * RDT_RESOURCE_L*. When more than one CC sits at the same level (e.g. one
+ * per socket) they must agree on rcid_count / ncblks /
+ * supports_alloc_at_code, since resctrl exposes a single set of caps per
+ * rid. A level whose controllers disagree is dropped, but the other level
+ * is still picked. Controllers registered after this point are not part
+ * of any set and resctrl never sees them.
+ */
+static int cbqri_resctrl_pick_caches(void)
+{
+	struct cbqri_controller **all __free(kfree) = NULL;
+	struct cbqri_controller *ctrl;
+	int nr_all, i, rid;
+
+	nr_all = cbqri_get_controllers(&all);
+	if (nr_all < 0)
+		return nr_all;
+
+	for (rid = 0; rid < RDT_NUM_RESOURCES; rid++) {
+		struct cbqri_resctrl_res *hw_res = &cbqri_resctrl_resources[rid];
+		unsigned int n = 0;
+
+		for (i = 0; i < nr_all; i++) {
+			if (cbqri_ctrl_backs_rid(all[i], rid))
+				n++;
+		}
+		if (!n)
+			continue;
+
+		hw_res->ctrls = kcalloc(n, sizeof(*hw_res->ctrls), GFP_KERNEL);
+		if (!hw_res->ctrls)
+			return -ENOMEM;
+
+		for (i = 0; i < nr_all; i++) {
+			ctrl = all[i];
+			if (!cbqri_ctrl_backs_rid(ctrl, rid))
+				continue;
+
+			if (hw_res->nr_ctrls &&
+			    !cbqri_cc_caps_agree(hw_res->ctrls[0], ctrl)) {
+				pr_err("L%u controllers have mismatched capabilities, skipping this level\n",
+				       ctrl->cache.cache_level);
+				kfree(hw_res->ctrls);
+				hw_res->ctrls = NULL;
+				hw_res->nr_ctrls = 0;
+				break;
+			}
+
+			hw_res->ctrls[hw_res->nr_ctrls++] = ctrl;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Fill the rdt_resource fields for one picked rid. An rid with no picked
+ * controller is left untouched so it stays out of resctrl_arch_get_resource().
+ */
+static void cbqri_resctrl_control_init(struct cbqri_resctrl_res *cbqri_res)
+{
+	struct rdt_resource *res = &cbqri_res->resctrl_res;
+	struct cbqri_controller *ctrl;
+
+	if (!cbqri_res->nr_ctrls)
+		return;
+	ctrl = cbqri_res->ctrls[0];
+
+	switch (res->rid) {
+	case RDT_RESOURCE_L2:
+	case RDT_RESOURCE_L3:
+		res->name = (res->rid == RDT_RESOURCE_L2) ? "L2" : "L3";
+		res->schema_fmt = RESCTRL_SCHEMA_BITMAP;
+		res->ctrl_scope = (res->rid == RDT_RESOURCE_L2) ?
+				    RESCTRL_L2_CACHE : RESCTRL_L3_CACHE;
+		res->cache.cbm_len = ctrl->cc.ncblks;
+		res->cache.shareable_bits = 0;
+		res->cache.min_cbm_bits = 1;
+		res->cache.arch_has_sparse_bitmasks = false;
+		res->cdp_capable = ctrl->cc.supports_alloc_at_code;
+		res->alloc_capable = ctrl->alloc_capable;
+		INIT_LIST_HEAD(&res->ctrl_domains);
+		INIT_LIST_HEAD(&res->mon_domains);
+		break;
+	default:
+		break;
+	}
+}
+
+/*
+ * Create, list-insert, and online a fresh ctrl_domain backing ctrl on
+ * resource res, seeded with cpu and identified by dom_id. Caller must
+ * hold cbqri_domain_list_lock, must have already verified that no
+ * existing ctrl_domain on res carries this id, and passes the list
+ * position cbqri_find_ctrl_domain() returned for it as pos.
+ */
+static struct rdt_ctrl_domain *cbqri_create_ctrl_domain(struct cbqri_controller *ctrl,
+							struct rdt_resource *res,
+							unsigned int cpu, int dom_id,
+							struct list_head *pos)
+{
+	struct rdt_ctrl_domain *domain;
+	int err;
+
+	domain = cbqri_new_domain(ctrl);
+	if (!domain)
+		return ERR_PTR(-ENOMEM);
+
+	cpumask_set_cpu(cpu, &domain->hdr.cpu_mask);
+	domain->hdr.id = dom_id;
+	domain->hdr.type = RESCTRL_CTRL_DOMAIN;
+	domain->hdr.rid = res->rid;
+
+	err = cbqri_init_domain_ctrlval(res, domain);
+	if (err)
+		goto free;
+
+	err = resctrl_online_ctrl_domain(res, domain);
+	if (err)
+		goto free;
+
+	/*
+	 * Publish only after the domain is fully initialized and online, so a
+	 * reader walking the RCU list never sees a half-built domain.
+	 */
+	list_add_tail_rcu(&domain->hdr.list, pos);
+
+	return domain;
+free:
+	kfree(container_of(domain, struct cbqri_resctrl_dom, resctrl_ctrl_dom));
+	return ERR_PTR(err);
+}
+
+/*
+ * Remove a CPU from the domain at each level whose cache it shares. The
+ * domain is looked up by the CPU's own cache id and the lookup returns NULL
+ * if the CPU was never added at that level. Caller holds
+ * cbqri_domain_list_lock.
+ */
+static void cbqri_detach_cpu_from_all_ctrls(unsigned int cpu)
+{
+	static const u32 levels[] = { 2, 3 };
+	struct cbqri_resctrl_res *hw_res;
+	struct rdt_ctrl_domain *d;
+	struct rdt_resource *res;
+	struct cacheinfo *ci;
+	int i, rid;
+
+	lockdep_assert_held(&cbqri_domain_list_lock);
+
+	for (i = 0; i < ARRAY_SIZE(levels); i++) {
+		ci = get_cpu_cacheinfo_level(cpu, levels[i]);
+		if (!ci)
+			continue;
+
+		rid = cbqri_cache_level_to_rid(levels[i]);
+		hw_res = &cbqri_resctrl_resources[rid];
+		if (!hw_res->nr_ctrls)
+			continue;
+
+		res = &hw_res->resctrl_res;
+		d = cbqri_find_ctrl_domain(&res->ctrl_domains, ci->id, NULL);
+		if (!d)
+			continue;
+
+		cpumask_clear_cpu(cpu, &d->hdr.cpu_mask);
+		if (cpumask_empty(&d->hdr.cpu_mask)) {
+			list_del_rcu(&d->hdr.list);
+			synchronize_rcu();
+			resctrl_offline_ctrl_domain(res, d);
+			kfree(container_of(d, struct cbqri_resctrl_dom,
+					   resctrl_ctrl_dom));
+		}
+	}
+}
+
+/*
+ * Attach a CPU to the picked capacity controller at each cache level whose
+ * cache the CPU shares. A missing controller or a failed domain creation
+ * does not fail the CPU online. The CPU is left out of that level with a
+ * warning, since bringing the CPU up matters more than controlling its
+ * cache traffic. Caller holds cbqri_domain_list_lock.
+ */
+static void cbqri_attach_cpu_to_all_ctrls(unsigned int cpu)
+{
+	static const u32 levels[] = { 2, 3 };
+	struct cbqri_resctrl_res *hw_res;
+	struct cbqri_controller *ctrl;
+	struct rdt_ctrl_domain *d;
+	struct list_head *pos;
+	struct cacheinfo *ci;
+	int i, rid;
+
+	lockdep_assert_held(&cbqri_domain_list_lock);
+
+	for (i = 0; i < ARRAY_SIZE(levels); i++) {
+		ci = get_cpu_cacheinfo_level(cpu, levels[i]);
+		if (!ci)
+			continue;
+
+		rid = cbqri_cache_level_to_rid(levels[i]);
+		hw_res = &cbqri_resctrl_resources[rid];
+		if (!hw_res->nr_ctrls)
+			continue;
+
+		ctrl = cbqri_resctrl_find_ctrl(hw_res, ci->id);
+		if (!ctrl) {
+			pr_warn_once("no L%u controller for cache id %u, CPU %u is not controlled at this level\n",
+				     levels[i], ci->id, cpu);
+			continue;
+		}
+
+		d = cbqri_find_ctrl_domain(&hw_res->resctrl_res.ctrl_domains,
+					   ci->id, &pos);
+		if (d) {
+			cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
+			continue;
+		}
+
+		d = cbqri_create_ctrl_domain(ctrl, &hw_res->resctrl_res, cpu,
+					     ci->id, pos);
+		if (IS_ERR(d))
+			pr_warn("L%u domain for cache id %u failed (%pe), CPU %u is not in a resctrl domain at this level\n",
+				levels[i], ci->id, d, cpu);
+	}
+}
+
+/* Undo cbqri_resctrl_setup(). Only reached before resctrl_init() succeeded. */
+static void cbqri_resctrl_teardown(void)
+{
+	int rid;
+
+	for (rid = 0; rid < RDT_NUM_RESOURCES; rid++) {
+		struct cbqri_resctrl_res *hw_res = &cbqri_resctrl_resources[rid];
+
+		kfree(hw_res->ctrls);
+		hw_res->ctrls = NULL;
+		hw_res->nr_ctrls = 0;
+		hw_res->cdp_enabled = false;
+		hw_res->resctrl_res.alloc_capable = false;
+		hw_res->resctrl_res.cdp_capable = false;
+	}
+}
+
+static int cbqri_resctrl_setup(void)
+{
+	int rid;
+	int err;
+
+	for (rid = 0; rid < RDT_NUM_RESOURCES; rid++)
+		cbqri_resctrl_resources[rid].resctrl_res.rid = rid;
+
+	err = cbqri_resctrl_pick_caches();
+	if (err)
+		goto teardown;
+
+	for (rid = 0; rid < RDT_NUM_RESOURCES; rid++)
+		cbqri_resctrl_control_init(&cbqri_resctrl_resources[rid]);
+
+	if (!cbqri_resctrl_any_alloc_capable()) {
+		pr_debug("no resctrl-capable CBQRI controllers found\n");
+		err = -ENODEV;
+		goto teardown;
+	}
+
+	return 0;
+
+teardown:
+	cbqri_resctrl_teardown();
+	return err;
+}
+
+static int cbqri_resctrl_online_cpu(unsigned int cpu)
+{
+	mutex_lock(&cbqri_domain_list_lock);
+	cbqri_attach_cpu_to_all_ctrls(cpu);
+	mutex_unlock(&cbqri_domain_list_lock);
+
+	/*
+	 * Seed the per-CPU default RCID/MCID to the reserved (0, 0) pair and
+	 * notify the resctrl core so it tracks this CPU in the default group.
+	 */
+	resctrl_arch_set_cpu_default_closid_rmid(cpu, 0, 0);
+	resctrl_online_cpu(cpu);
+	return 0;
+}
+
+static int cbqri_resctrl_offline_cpu(unsigned int cpu)
+{
+	resctrl_offline_cpu(cpu);
+
+	mutex_lock(&cbqri_domain_list_lock);
+	cbqri_detach_cpu_from_all_ctrls(cpu);
+	mutex_unlock(&cbqri_domain_list_lock);
+	return 0;
+}
+
+/*
+ * Same order as x86: the cpuhp callbacks build the domains first and
+ * resctrl_init() runs last, so a failure here has no filesystem state
+ * to unwind and cpuhp_remove_state() takes the domains down again.
+ */
+static int __init cbqri_arch_late_init(void)
+{
+	int err, state;
+
+	if (!riscv_isa_extension_available(NULL, SSQOSID))
+		return -ENODEV;
+
+	err = cbqri_resctrl_setup();
+	if (err)
+		return err;
+
+	state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "cbqri:online",
+				  cbqri_resctrl_online_cpu,
+				  cbqri_resctrl_offline_cpu);
+	if (state < 0) {
+		err = state;
+		goto teardown;
+	}
+
+	err = resctrl_init();
+	if (err) {
+		cpuhp_remove_state(state);
+		goto teardown;
+	}
+
+	return 0;
+
+teardown:
+	cbqri_resctrl_teardown();
+	return err;
+}
+late_initcall(cbqri_arch_late_init);

-- 
2.43.0


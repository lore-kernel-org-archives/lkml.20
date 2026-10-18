Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0063937267C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322106; cv=none; b=d4EtMmlEJS8Ja6PF8k+Mgf8DBxI85ikCvZTAinlRyuV8k4/NL+qS7IWoADaOq1lTf2eyjg9eLs/gF68yooIb3Nw8SHsK3XQI/npPioMULG79EjfOkdHGFtlAwexjqRrp66CqM+gGybXLVW/DDVH+RjX9a8MCfg/+UyMH6Wj989Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322106; c=relaxed/simple;
	bh=yr3idxF5DsYVxq3dsg21zdeLqHm9kxupF3PGSgpHfj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ue7QZiMeDcha57zNTEEpIB5/UR1s+9vMksyL4nS0PboDMwP9YM37H7dyNifvAzN9Dr/TWu+yilf4nO6hSZmti9Np96JKJS3WB5LdS9msy9MHL0vpJAcEKO2fBC22bDSrIPLpkrD2x5YOhDQ28V5P5hjfIBpzDpwCXVRxgt2FnIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dv5MHho/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dv5MHho/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a01933b584so8717355e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792322103; x=1792926903; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1iS+aDvo9a/a0HnT8eGETEVhbdCL6jdar4VvWG749Xw=;
        b=dv5MHho/HoENRjYSogvHwqQY4Tsap5a5Osbs+zX0SbssUIYFw+1digGHTzZnrlTrYy
         9sWvto3+n2Po8o01RmDRv+CwTBXKO3NCLAA1fru0GopWai0ryK0jwlH83/7dZ5RAV1Jt
         PAgbIFPlbZInZZ6uRFsKcxkdwMc03w+v0ikLkk/n/hMoHvpFF0MSlh/zA0CWZ3vuKrER
         jLekctiXO2pLULMXy9Vv7XITKEaLWjrhTjLYX0Cq6/DU4pK7m3ooql0ktjPU9LQEDYyX
         rpsQWEuN4kkjFE+EaBnog8vJZc60/7EXCd8rRln/BBLkX2eo/BifsklmbQHcoMCaxUWJ
         S9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322103; x=1792926903;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1iS+aDvo9a/a0HnT8eGETEVhbdCL6jdar4VvWG749Xw=;
        b=Q43TuIRBesUAXnnytx7Sr4TTSUG2oxJMt0li3L0CfD4eowVtzGmuUts1VJlhaM+sX1
         52olfglB6SyhknA5+GeSUNMIGQqfQOroteFxLs5Z7j/BIKaKlsqzx57E6+nEvhQSxd1J
         WsZVYXufcqAZAF4qAU4u0ehf0jn+Kwy+jDsWeRfiaRHcdeSeSchM8pYdxd/Ot38CwFd+
         v9V1LJCZZZyxcvry5i0+igo1J6A3B4j1hhflN5RFVkCc1xM+vkJvnE6hiOz72S4cwHBp
         buvnvi9X/wZvAUv3bZhhQ1iIEHCKhx7ghg12stVdzgldHPDkGV8DFLlEmCe2JDS2f4Ic
         jy7Q==
X-Forwarded-Encrypted: i=1; AKwUvBze8Eke4lrjajXvwtB6pX3UyI79dOOItDZw+X5VsKzZumEcVgjwg6iAO77gCr8gIqF0Rz/thrvt9BfmrEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCtpLeYNGrgrhJ18/5WmaRhO1kn9CC4cx6MpD6nCD2rgBgp8f7
	hj67hrd0iRcKLGbcuzE5kBa7UOx0Vq2XPKi+Zh0ABIE0uFDzV+EJmlgtQ8q/uvZi
X-Gm-Gg: AYBFou3Tyf5O5qwT+knevuUhfo4rd7DSTJ4ZI4R0xq94q1TY5PZ5j9lPfeND131L+vG
	Sxo4ji85Gd7FPGSMwUoAxA25hwnfsmnpSlzYyQfdjGUb75pGVUKRnLPhoXaddFzrHIA0FE9H4gu
	7shKMjMylYrjAdR3o/EpMyhB0BotiUHuWEPv86ZeBZfF+tFMgWB2JCIf6iQRWI+EMjpJLUjlONu
	H34u/51CSEFqWz+4me4JgH55+C+ybD+AIKnUKEoXo4FUFtrXxmvcpzNxAwphImJluD464Rk/G6l
	HBSKukWS2UoLjhgnwITz9sVzvMcbhFW2qDr2ac4tVGdVjm/kxAmBkiCgfOyVlVKwDsf0RXwpaoG
	TMYKWQGBQSZcPqdkmdOF1Nf+shbBNLjOCOa7SSjMjo28HL9sL2LLPou3MDl4gmMdwpFUDf7ACyn
	CAtLp+aOVwI7IXB3C+qyeOTFkxFHmp1+8GFCJjxxx9EwueL8gkL3jMBXoi+uz+KB+C7BadaRqtr
	yV9fUEYw4iwuZuDc+MLM1Df8qhP4GXu
X-Received: by 2002:a05:600c:e555:20b0:4a1:d272:a911 with SMTP id 5b1f17b1804b1-4a1d7601b23mr62187785e9.21.1792322102906;
        Sun, 18 Oct 2026 04:15:02 -0700 (PDT)
Received: from [127.0.1.1] (89-65-152-218.dynamic.play.pl. [89.65.152.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm23853576f8f.16.2026.10.18.04.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:15:02 -0700 (PDT)
From: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
Date: Sun, 18 Oct 2026 13:14:59 +0200
Subject: [PATCH v6] riscv: mm: Trace TLB flush requests
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-tlb_tracepoint-v6-1-14476427870f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PTWrDMBCG4asErasizUiWnFXvUULRzygRJHaQj
 UkJvnvlLIqxaZffwPPCPNlAJdPAjocnKzTlIfddHc3bgYWL687Ec6ybgYBGWGj5ePVfY3GB7n3
 uRm6VkkI7r0ULrKJ7oZQfr+Dnqe5LHsa+fL/6k1yuf6YmySWPKTqKZMgo+XG+uXx9D/2NLakJV
 hzFjkPlhMHaACom7bccf7kUUu84LpwS1m/Q+wa3XP3PVeUJ0Drw0SZDW67X3Oy4rhx0k7zGFp1
 Jaz7P8w8RrUN9qAEAAA==
X-Change-ID: 20260829-tlb_tracepoint-844105ab5092
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, 
 Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
X-Mailer: b4 0.14.3

Make RISC-V TLB flush requests observable together with the
architecture-specific context available when the request reaches
the RISC-V implementation.

The generic tlb:tlb_flush event provides reason and page-count
information. At the RISC-V implementation level, additional
context is available, including the invalidation range and stride,
ASID, target CPU mask, and invalidation scope.

This context is useful for debugging and workload analysis. The
target CPU mask shows the address-space CPU footprint involved in
an invalidation, while range and stride distinguish requests at
different mapping granularities. The ASID and scope help correlate
requests with MM, scheduler, IPI, and firmware activity.

Add riscv_tlb:riscv_tlb_flush_request in flush_tlb_all() and
__flush_tlb_range(). Record start, size, stride, ASID (or the
no-ASID sentinel), whether an mm is associated with the request,
the target CPU mask and its weight, and the derived scope.

Record the complete target mask because CPU identity cannot be
reconstructed from a count. Calculate its weight from the recorded
bitmap so both fields agree even if mm_cpumask() changes during
recording.

The event describes an invalidation request before dispatch. It
does not report whether a remote flush uses SBI RFENCE or Linux
cross-CPU coordination, since that choice is effectively established
during initialization rather than made for each request.

The address field (start) may contain kernel virtual addresses
for flushes involving kernel mappings. Require perf tracepoint
permissions even for counting-only events, since perf filters
could otherwise reveal address information through event counts.

Tested on QEMU virt with OpenSBI using local and shared-mm
mprotect()/munmap() workloads, exercising single, range, and
address-space invalidations. A MADV_PAGEOUT reclaim workload
exercised global flushes. All four scope values were observed.

Confirmed that trace-cmd records the event and that perf can count
it with sufficient privileges. With perf_event_paranoid=0,
unprivileged attempts to count the event using perf were denied,
as intended.

Tested local and shared-mm invalidations with
CONFIG_UBSAN_ALIGNMENT=y on QEMU virt without tracepoint-related
alignment warnings.

Built with and without CONFIG_PERF_EVENTS.

Signed-off-by: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
---
Add a RISC-V tracepoint for observing TLB invalidation requests
before they are dispatched by the architecture-specific
implementation.

The generic tlb:tlb_flush event describes TLB flush activity using
reason and page-count information. The RISC-V event records
additional context, including the invalidation range and stride,
ASID, target CPU mask and its weight, and derived request scope.

This context helps correlate TLB invalidation activity with MM,
scheduler, IPI, and firmware activity. The event describes the
request rather than the execution backend. SBI RFENCE versus Linux
cross-CPU coordination is effectively determined at initialization
rather than selected independently for each request.

The target CPU mask weight is derived from the recorded bitmap to
keep both fields consistent under concurrent mm_cpumask() updates.
Since the address field (start) may contain kernel virtual
addresses, the event requires perf tracepoint permissions even
for counting-only access.

Tested on QEMU virt with OpenSBI using local and shared-mm
mprotect()/munmap() workloads. A MADV_PAGEOUT reclaim workload
on QEMU virt with APLIC+IMSIC exercised global flushes. All four
scope values -- single, range, address-space, and all -- were
observed.

Confirmed trace-cmd recording and privileged perf counting.
With perf_event_paranoid=0, unprivileged attempts to count the
event using perf were denied, as intended. The kernel was built
with and without CONFIG_PERF_EVENTS.

Tested local and shared-mm invalidations with
CONFIG_UBSAN_ALIGNMENT=y on QEMU virt without tracepoint-related
alignment warnings.
---
Changes in v6:
- Change the scope field from u8 to u32 to ensure the dynamic
  CPU mask is properly aligned for bitmap operations.
- Verify local and shared-mm TLB flush tracing with
  CONFIG_UBSAN_ALIGNMENT=y on QEMU virt.
- Link to v5: https://lore.kernel.org/r/20261017-tlb_tracepoint-v5-1-256fb5393a7f@gmail.com

Changes in v5:
- Move the architecture-specific trace event definition under
  arch/riscv/, as requested by Steven Rostedt.
- Calculate target_mask_weight from the recorded CPU mask to
  keep both fields consistent under concurrent updates.
- Require perf tracepoint permissions for counting-only access,
  since the event may expose kernel virtual addresses.
- Link to v4: https://lore.kernel.org/r/20261015-tlb_tracepoint-v4-1-f238a2bd8f7e@gmail.com

Changes in v4:
- Drop unrelated whitespace-only changes in arch/riscv/mm/tlbflush.c.
- Link to v3: https://lore.kernel.org/all/20261015-tlb_tracepoint-v3-1-eef305a3bb63@gmail.com/

Changes in v3:
- Rebase on current RISC-V for-next.
- Thanks to Jisheng Zhang for pointing out that SBI RFENCE versus Linux
  cross-CPU coordination is effectively a system-wide choice established
  during initialization rather than a per-request decision.
- Drop the local/SBI RFENCE/cross-CPU path field.
- Rename the event from riscv_tlb_flush_path to
  riscv_tlb_flush_request and refocus it on the semantic TLB
  invalidation request.
- Emit one request event independently of the mechanism subsequently
  used to perform the invalidation.
- Address checkpatch.pl --strict alignment issues.
- Link to v2: https://lore.kernel.org/r/20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com

Changes in v2:
- Use trace_call__riscv_tlb_flush_path() after the explicit
  trace_riscv_tlb_flush_path_enabled() check to avoid a second
  tracepoint static-key test, as suggested by Steven Rostedt.
- Link to v1: https://lore.kernel.org/r/20260829-tlb_tracepoint-v1-1-dfdaede7e741@gmail.com
---
 arch/riscv/include/asm/riscv_tlb.h | 103 +++++++++++++++++++++++++++++++++++++
 arch/riscv/mm/tlbflush.c           |  45 ++++++++++++++--
 2 files changed, 144 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/riscv_tlb.h b/arch/riscv/include/asm/riscv_tlb.h
new file mode 100644
index 000000000000..4d5f48112941
--- /dev/null
+++ b/arch/riscv/include/asm/riscv_tlb.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM riscv_tlb
+
+#if !defined(_TRACE_RISCV_TLB_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_RISCV_TLB_H
+
+#include <linux/cpumask.h>
+#include <linux/tracepoint.h>
+#include <linux/perf_event.h>
+
+#ifndef _TRACE_RISCV_TLB_ENUMS
+#define _TRACE_RISCV_TLB_ENUMS
+
+enum riscv_tlb_flush_scope {
+	RISCV_TLB_FLUSH_SCOPE_SINGLE,
+	RISCV_TLB_FLUSH_SCOPE_RANGE,
+	RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE,
+	RISCV_TLB_FLUSH_SCOPE_ALL,
+};
+
+#endif /* _TRACE_RISCV_TLB_ENUMS */
+
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_SINGLE);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_RANGE);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ALL);
+
+#define show_riscv_tlb_flush_scope(scope) \
+	__print_symbolic(scope, \
+		{ RISCV_TLB_FLUSH_SCOPE_SINGLE,        "single" }, \
+		{ RISCV_TLB_FLUSH_SCOPE_RANGE,         "range" }, \
+		{ RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE, "address-space" }, \
+		{ RISCV_TLB_FLUSH_SCOPE_ALL,           "all" })
+
+/*
+ * Record the invalidation request received by the RISC-V architecture code
+ *
+ * The target CPU mask represents the CPUs Linux intends to cover for the
+ * request. It can be correlated with per-CPU activity, but does not describe
+ * which harts ultimately performed an invalidation.
+ *
+ * The ASID is hardware-visible and may be reused. It must not be treated as a
+ * persistent identifier for an mm.
+ *
+ * The stride describes the invalidation granularity supplied to the RISC-V
+ * implementation.
+ *
+ * The event records the invalidation request before it is dispatched. It does
+ * not describe the mechanism used to execute the request.
+ *
+ */
+TRACE_EVENT(riscv_tlb_flush_request,
+	    TP_PROTO(unsigned long start, unsigned long size,
+		     unsigned long stride, unsigned long asid, bool has_mm,
+		     const struct cpumask *cmask,
+		     enum riscv_tlb_flush_scope scope),
+
+	TP_ARGS(start, size, stride, asid, has_mm, cmask, scope),
+
+	TP_STRUCT__entry(__field(unsigned long, start)
+		__field(unsigned long, size)
+		__field(unsigned long, stride)
+		__field(unsigned long, asid)
+		__field(bool, has_mm)
+		__field(unsigned int, target_mask_weight)
+		__cpumask(target_cpus)
+		__field(u32, scope)
+	),
+
+	TP_fast_assign(__entry->start = start;
+		__entry->size = size;
+		__entry->stride = stride;
+		__entry->asid = asid;
+		__entry->has_mm = has_mm;
+		__assign_cpumask(target_cpus, cpumask_bits(cmask));
+		__entry->target_mask_weight = cpumask_weight((const struct cpumask *)
+						     __get_cpumask(target_cpus));
+		__entry->scope = scope;
+	),
+
+	TP_printk("start=%#lx size=%#lx stride=%#lx asid=%#lx has_mm=%d target_mask_weight=%u target_cpus=%s scope=%s",
+		  __entry->start, __entry->size, __entry->stride,
+		  __entry->asid, __entry->has_mm,
+		  __entry->target_mask_weight, __get_cpumask(target_cpus),
+		  show_riscv_tlb_flush_scope(__entry->scope))
+);
+
+#ifdef CONFIG_PERF_EVENTS
+TRACE_EVENT_PERF_PERM(riscv_tlb_flush_request,
+		      perf_allow_tracepoint());
+#endif
+
+#endif /* _TRACE_RISCV_TLB_H */
+
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+
+#define TRACE_INCLUDE_PATH asm
+#define TRACE_INCLUDE_FILE riscv_tlb
+
+/* This part must be outside protection. */
+#include <trace/define_trace.h>
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 962db300a166..f66348a9b999 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -9,6 +9,9 @@
 #include <asm/mmu_context.h>
 #include <asm/cpufeature.h>
 
+#define CREATE_TRACE_POINTS
+#include <asm/riscv_tlb.h>
+
 #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
 
 /*
@@ -63,6 +66,32 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 	local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
 }
 
+static enum riscv_tlb_flush_scope
+riscv_tlb_get_flush_scope(unsigned long size, unsigned long stride, bool has_mm)
+{
+	if (size == FLUSH_TLB_MAX_SIZE)
+		return has_mm ? RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE :
+			RISCV_TLB_FLUSH_SCOPE_ALL;
+
+	return size <= stride ? RISCV_TLB_FLUSH_SCOPE_SINGLE :
+		RISCV_TLB_FLUSH_SCOPE_RANGE;
+}
+
+static __always_inline void
+riscv_tlb_trace_flush_request(const struct cpumask *cmask, unsigned long start,
+			      unsigned long size, unsigned long stride,
+			      unsigned long asid, bool has_mm)
+{
+	enum riscv_tlb_flush_scope scope;
+
+	if (!trace_riscv_tlb_flush_request_enabled())
+		return;
+
+	scope = riscv_tlb_get_flush_scope(size, stride, has_mm);
+	trace_call__riscv_tlb_flush_request(start, size, stride, asid, has_mm,
+					    cmask, scope);
+}
+
 static void __ipi_flush_tlb_all(void *info)
 {
 	local_flush_tlb_all();
@@ -70,12 +99,18 @@ static void __ipi_flush_tlb_all(void *info)
 
 void flush_tlb_all(void)
 {
-	if (num_online_cpus() < 2)
+	riscv_tlb_trace_flush_request(cpu_online_mask, 0,
+				      FLUSH_TLB_MAX_SIZE, 0,
+				      FLUSH_TLB_NO_ASID, false);
+
+	if (num_online_cpus() < 2) {
 		local_flush_tlb_all();
-	else if (riscv_use_sbi_for_rfence())
-		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
-	else
+	} else if (riscv_use_sbi_for_rfence()) {
+		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE,
+					   FLUSH_TLB_NO_ASID);
+	} else {
 		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
+	}
 }
 
 struct flush_tlb_range_data {
@@ -105,6 +140,8 @@ static void __flush_tlb_range(struct mm_struct *mm,
 
 	cpu = get_cpu();
 
+	riscv_tlb_trace_flush_request(cmask, start, size, stride, asid, !!mm);
+
 	/* Check if the TLB flush needs to be sent to other CPUs. */
 	if (cpumask_any_but(cmask, cpu) >= nr_cpu_ids) {
 		local_flush_tlb_range_asid(start, size, stride, asid);

---
base-commit: a5ae1bf65cee84bcc121d659e7e22a767853f5f5
change-id: 20260829-tlb_tracepoint-844105ab5092

Best regards,
-- 
Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>


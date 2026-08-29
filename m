Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CE33BB102
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788018280; cv=none; b=d8g35AZsi1ET0qDJXV8AAj7vA6Xr+2a7K614k4ghn83gCII03QMhy+OD875crZR0g3R2ArTpH0KLd8Ulzeb4QFeoemDqKs5Yfn/JFK4e8WQ8stmMrABoFIajK9KCAVzmmb7QiLYmhuxrmCI2nt3aGJ33B3ZYI2XPjvBIRtBATIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788018280; c=relaxed/simple;
	bh=69ibjPTZgG7ViZ+H6zCd1OgPqca2VPP/2QSRmsSjLfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZAVEVPGvCo5h6O9iO1jK64tETNu0drpsbmMA+XxhnR+n8TP27PSmmzswYISFMI6DHqz5UfV4MDKwcE7GOVU3YOctQSLld61IXlK+uIOuLSQZdiU13nh7WTyprdl3GEe7tX9ei1ZH2GusR8FTNL26Pm5kV3Xjf+OAlmu8Mwrq0mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBj99KUy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBj99KUy"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b965570d7so16492495e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788018276; x=1788623076; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n8nQYQ7Cl9qztsEwnAxBh67Qx5SoTbCnvhZ8LBGAfp4=;
        b=OBj99KUykDJ5OQBb4pPBxJEzAcsjTmwWocWbdtzlBgQYo945ZKuuVWbIUAVOxdLIQO
         J3cqub4FrAn9coufu8E/6nZFrRATPLN2ftn3/BqqTS2sjprghe3NdAQ5yfW0gYUIvTVU
         CWxv6ZNVWk/XwHoXMRpiDTZAY+4YTUpMOQr1k+jBG8p1MGEg7JxxNG/+tiCGyO7kFxBW
         7batMpSTLTLJGPdBfSu25UxHI1P6VEQmguEELZTYfg4fCX8ZxnEjdvnXcIP8G6TtMTjY
         J88Eu9CoD6+d5Ur4kZUISGrwngVO633VFmSnWbkr5/rIJifma2HhgB4ooqaW3JJ0+P0N
         85hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788018276; x=1788623076;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n8nQYQ7Cl9qztsEwnAxBh67Qx5SoTbCnvhZ8LBGAfp4=;
        b=cjAouELmidm1w7wOj4Kd6gBBmQOs0ZZHhaL25vHQxio7tQszrze0/OmdI2hZsR0a62
         PYpbK/TJDc7xF1YXV5fcAsEerViuUwt4ipQ4miZtGkbb5shJh6Gv+LlQr5vnO3mrjNHf
         C+mrVpFOam3vcw/ihu7f2jno7DyyRbRTBtE1OBjTh6OJY4inHXIniqmy9fiHFOFvyRhC
         lUF3spuP2z148+yRST2aC06m6W9WUbw3crUo148Fq/KQ/0sIcfOAcWv//wIUKkdZxHij
         Tcfo+IQTNp+KHYikFDYzuKrX8yobqmYxVKb3dHNb7F97Kih835odU9oETWaedLIhhgoQ
         gVDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4/IIEtVcOuTFNXqqT5dHzezKBvyWvA+QvyXqjHknWaScIHbQWTn/IjLqM/d+ELGVS0ceYenBNGc/jZm8=@vger.kernel.org
X-Gm-Message-State: AFuF++lYsp//kVbdnkoKrs2Tou5CUw23bm9N1aw9baVJQ9w04wHhvEL4
	SsKBiyNigBQeyIOz6NpJGW0TBEgR05ZaSraaQdp3C9DZKDEcb5pJmFgd
X-Gm-Gg: AR+sD12/1UqyEQycPxqNdpS7P+O/htPI013ncl0K1PNFl587TVKCCLIBbejcgcS1Jow
	N3jlWuEFGiRCPYlYDPvZx08nQcitxtwo6MQi1Adz7Qfp4BzkW0wsELRrzhYW4RZ7nl0WeAb4Bsn
	mrAXeuji6Y3NNzKA5EuOJZuqrCfoz/B8jUo7ohMuEtW1cdIA35kYNPMp0o58NZjXUIZeNQ/BdVT
	N+HfhujNVKyKgvSUsvF1aXpJn33f+/ePaOwLMoOx22JN9l2+Ux28/o8MpjKcFN4dFoTTb4SFnOe
	9o3CSxBEkqiYX1hpDftZWcZPZ9/jatMlkM35X3BeLgTKx8Uu/PH5o30/a+NuWCS9mD2ctJJ4G8p
	FgrcLOQ3yTYgeFVbqPxnyd9Zg5flXSzKdPPLpfQukT2Ng3s2vFWJAZJ7ahBc0S7WgEaGJ38mXFW
	9DZ/lgecoxEtCcynvQGfaQh9ZGie7ErSNMa0AZ56bP5wFu7AHyGrO4030BmssoTceghFjyQSMuK
	osjcnga3gHlRc36upHT
X-Received: by 2002:a05:600c:a01:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-49b91c33792mr190881725e9.7.1788018275680;
        Sat, 29 Aug 2026 08:44:35 -0700 (PDT)
Received: from [127.0.1.1] (89-65-152-218.dynamic.play.pl. [89.65.152.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm161111375e9.9.2026.08.29.08.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:44:35 -0700 (PDT)
From: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
Date: Sat, 29 Aug 2026 17:44:18 +0200
Subject: [PATCH] riscv: mm: Trace TLB flush path selection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-tlb_tracepoint-v1-1-dfdaede7e741@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFH+kmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyNL3ZKcpPiSosTk1IL8zLwSXQsTE0MD08QkUwNLIyWgpoKi1LTMCrC
 B0bG1tQAPu5MbYAAAAA==
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, 
 Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
X-Mailer: b4 0.13.0

Make RISC-V TLB flush path selection observable. Record whether Linux
handles an invalidation locally, delegates it to SBI RFENCE, or executes
it through a cross-CPU call, so MM activity can be correlated with the
RISC-V, firmware, or Linux cross-CPU path carrying the request.

The generic tlb:tlb_flush event describes TLB flush activity using
architecture-independent reason and page-count information. The RISC-V
implementation subsequently selects between local invalidation, SBI
RFENCE, and Linux cross-CPU coordination, with additional
architecture-specific request context available at that point.

Making this selection observable is useful when debugging RISC-V TLB
shootdowns. When a remote invalidation is observed to be slow, the
selected path determines whether to investigate SBI firmware and
platform handling or Linux cross-CPU and IPI handling. An unexpectedly
broad target mask can reveal an unintended address-space CPU footprint,
while the range and stride distinguish invalidation requests with
different mapping granularities.

Place the event in the RISC-V implementation because the local, SBI
RFENCE, or cross-CPU choice is made there, and SBI RFENCE and the
invalidation stride are RISC-V-specific semantics rather than properties
of the generic MM flush request.

Add riscv_tlb:riscv_tlb_flush_path in flush_tlb_all() and
__flush_tlb_range(). Record start, size, stride, the hardware-visible
ASID, whether a specific mm is associated with the request, the target
CPU mask and its weight, the requested scope, and the selected path.

Record the complete target mask in addition to its weight because CPU
identity cannot be reconstructed from a count and is needed to correlate
the request with per-CPU scheduler, IPI, and firmware activity.

The event records the invalidation request and the path selected by Linux
before the operation is dispatched. In particular, selecting the SBI
RFENCE path means that Linux delegated the request to firmware; the event
does not describe the implementation or outcome of that delegated
operation.

Tested on QEMU virt with OpenSBI using local and shared-mm
mprotect()/munmap() workloads. Local requests reported path=local,
while remote requests reported path=sbi-rfence and were followed by the
existing riscv:sbi_call RFENCE event.

The cross-CPU-call path was tested with QEMU virt using APLIC+IMSIC.
A MADV_PAGEOUT reclaim workload was used to exercise mm-independent
global flushes. All reported path values (local, sbi-rfence and
cross-cpu-call) and scope values (single, range, address-space and all)
were observed.

Signed-off-by: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
---
Add a RISC-V tracepoint for observing the path selected by Linux for TLB
invalidation requests: local invalidation, SBI RFENCE, or Linux
cross-CPU coordination.

The tracepoint is intended to make RISC-V TLB shootdown behavior easier
to correlate with MM activity, CPU targeting, SBI calls, and IPI
handling. The patch records the invalidation request context and the
Linux path-selection decision before the operation is dispatched.

The patch was tested on QEMU virt with both the SBI RFENCE path and an
APLIC+IMSIC configuration. Local, SBI RFENCE, and cross-CPU-call paths
were exercised. All reported scope values -- single, range,
address-space, and all -- were also observed.
---
 arch/riscv/mm/tlbflush.c         |  60 +++++++++++++++++++--
 include/trace/events/riscv_tlb.h | 113 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 169 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 962db300a166..87cc409779f6 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -9,6 +9,9 @@
 #include <asm/mmu_context.h>
 #include <asm/cpufeature.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/riscv_tlb.h>
+
 #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
 
 /*
@@ -63,6 +66,33 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
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
+riscv_tlb_trace_flush_path(const struct cpumask *cmask, unsigned long start,
+			   unsigned long size, unsigned long stride,
+			   unsigned long asid, bool has_mm,
+			   enum riscv_tlb_flush_path path)
+{
+	enum riscv_tlb_flush_scope scope;
+
+	if (!trace_riscv_tlb_flush_path_enabled())
+		return;
+
+	scope = riscv_tlb_get_flush_scope(size, stride, has_mm);
+	trace_riscv_tlb_flush_path(start, size, stride, asid, has_mm, cmask,
+				   scope, path);
+}
+
 static void __ipi_flush_tlb_all(void *info)
 {
 	local_flush_tlb_all();
@@ -70,12 +100,26 @@ static void __ipi_flush_tlb_all(void *info)
 
 void flush_tlb_all(void)
 {
-	if (num_online_cpus() < 2)
+	if (num_online_cpus() < 2) {
+		riscv_tlb_trace_flush_path(cpu_online_mask, 0,
+					   FLUSH_TLB_MAX_SIZE, 0,
+					   FLUSH_TLB_NO_ASID, false,
+					   RISCV_TLB_FLUSH_PATH_LOCAL);
 		local_flush_tlb_all();
-	else if (riscv_use_sbi_for_rfence())
-		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
-	else
+	} else if (riscv_use_sbi_for_rfence()) {
+		riscv_tlb_trace_flush_path(cpu_online_mask, 0,
+					   FLUSH_TLB_MAX_SIZE, 0,
+					   FLUSH_TLB_NO_ASID, false,
+					   RISCV_TLB_FLUSH_PATH_SBI_RFENCE);
+		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE,
+					   FLUSH_TLB_NO_ASID);
+	} else {
+		riscv_tlb_trace_flush_path(cpu_online_mask, 0,
+					   FLUSH_TLB_MAX_SIZE, 0,
+					   FLUSH_TLB_NO_ASID, false,
+					   RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL);
 		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
+	}
 }
 
 struct flush_tlb_range_data {
@@ -107,12 +151,20 @@ static void __flush_tlb_range(struct mm_struct *mm,
 
 	/* Check if the TLB flush needs to be sent to other CPUs. */
 	if (cpumask_any_but(cmask, cpu) >= nr_cpu_ids) {
+		riscv_tlb_trace_flush_path(cmask, start, size, stride, asid,
+					   !!mm, RISCV_TLB_FLUSH_PATH_LOCAL);
 		local_flush_tlb_range_asid(start, size, stride, asid);
 	} else if (riscv_use_sbi_for_rfence()) {
+		riscv_tlb_trace_flush_path(cmask, start, size, stride, asid,
+					   !!mm, RISCV_TLB_FLUSH_PATH_SBI_RFENCE);
 		sbi_remote_sfence_vma_asid(cmask, start, size, asid);
 	} else {
 		struct flush_tlb_range_data ftd;
 
+		riscv_tlb_trace_flush_path(cmask, start, size, stride, asid,
+					   !!mm,
+					   RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL);
+
 		ftd.asid = asid;
 		ftd.start = start;
 		ftd.size = size;
diff --git a/include/trace/events/riscv_tlb.h b/include/trace/events/riscv_tlb.h
new file mode 100644
index 000000000000..3eff171ec54f
--- /dev/null
+++ b/include/trace/events/riscv_tlb.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM riscv_tlb
+
+#if !defined(_TRACE_RISCV_TLB_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_RISCV_TLB_H
+
+#include <linux/cpumask.h>
+#include <linux/tracepoint.h>
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
+enum riscv_tlb_flush_path {
+	RISCV_TLB_FLUSH_PATH_LOCAL,
+	RISCV_TLB_FLUSH_PATH_SBI_RFENCE,
+	RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL,
+};
+
+#endif /* _TRACE_RISCV_TLB_ENUMS */
+
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_SINGLE);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_RANGE);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ALL);
+
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_LOCAL);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_SBI_RFENCE);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL);
+
+#define show_riscv_tlb_flush_scope(scope) \
+	__print_symbolic(scope, \
+		{ RISCV_TLB_FLUSH_SCOPE_SINGLE,        "single" }, \
+		{ RISCV_TLB_FLUSH_SCOPE_RANGE,         "range" }, \
+		{ RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE, "address-space" }, \
+		{ RISCV_TLB_FLUSH_SCOPE_ALL,           "all" })
+
+#define show_riscv_tlb_flush_path(path) \
+	__print_symbolic(path, \
+		{ RISCV_TLB_FLUSH_PATH_LOCAL,          "local" }, \
+		{ RISCV_TLB_FLUSH_PATH_SBI_RFENCE,     "sbi-rfence" }, \
+		{ RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL, "cross-cpu-call" })
+
+/*
+ * Record the invalidation request received by the RISC-V architecture code
+ * and the path selected by Linux.
+ *
+ * The target CPU mask represents the CPUs Linux intends to cover for the
+ * request. It can be correlated with per-CPU activity, but does not describe
+ * which harts ultimately performed an invalidation.
+ *
+ * The ASID is hardware-visible and may be reused. It must not be treated as a
+ * persistent identifier for an mm.
+ *
+ * The stride describes the invalidation granularity supplied to the RISC-V
+ * implementation. SBI RFENCE receives start, size and ASID, but not stride.
+ *
+ * The event is emitted at path selection time. For SBI RFENCE, it records
+ * delegation of the request to firmware; firmware processing after that
+ * point is outside the event's scope.
+ */
+TRACE_EVENT(riscv_tlb_flush_path,
+	TP_PROTO(unsigned long start, unsigned long size,
+		 unsigned long stride, unsigned long asid, bool has_mm,
+		 const struct cpumask *cmask,
+		 enum riscv_tlb_flush_scope scope,
+		 enum riscv_tlb_flush_path path),
+
+	TP_ARGS(start, size, stride, asid, has_mm, cmask, scope, path),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, start)
+		__field(unsigned long, size)
+		__field(unsigned long, stride)
+		__field(unsigned long, asid)
+		__field(bool, has_mm)
+		__field(unsigned int, target_mask_weight)
+		__cpumask(target_cpus)
+		__field(u8, scope)
+		__field(u8, path)
+	),
+
+	TP_fast_assign(
+		__entry->start = start;
+		__entry->size = size;
+		__entry->stride = stride;
+		__entry->asid = asid;
+		__entry->has_mm = has_mm;
+		__entry->target_mask_weight = cpumask_weight(cmask);
+		__assign_cpumask(target_cpus, cpumask_bits(cmask));
+		__entry->scope = scope;
+		__entry->path = path;
+	),
+
+	TP_printk("start=%#lx size=%#lx stride=%#lx asid=%#lx has_mm=%d target_mask_weight=%u target_cpus=%s scope=%s path=%s",
+		  __entry->start, __entry->size, __entry->stride,
+		  __entry->asid, __entry->has_mm,
+		  __entry->target_mask_weight, __get_cpumask(target_cpus),
+		  show_riscv_tlb_flush_scope(__entry->scope),
+		  show_riscv_tlb_flush_path(__entry->path))
+);
+
+#endif /* _TRACE_RISCV_TLB_H */
+
+/* This part must be outside protection. */
+#include <trace/define_trace.h>

---
base-commit: 77ae27fd98f3b548797c9f22c10ab5cf1c4ada53
change-id: 20260829-tlb_tracepoint-844105ab5092

Best regards,
-- 
Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>


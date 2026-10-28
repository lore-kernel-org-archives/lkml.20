Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182196;
	b=Ulym6DgwAmbPlu2jtsiuELLUG1rt/uzhT8rcK5oZEywGJDXIU7tI8rbpCYZyW+2mwq0F
	 P6I2DlEAofuQFCDfQRiSHJxha6iskDLXzUBXalwgMgmlcATH+XLfUhnCD17Pfnzvo3gDN
	 zzrCKflGzPrRriGM1EzlYpZLwr51b6JW9rjtyQFHVmlKX4mjbSw8vWY6p+Tg3J0uj2Y6P
	 hbvWGKW/FogWul8aA40Ka+Dnyym7G9ZvhiFmKMaFzaY57goSpGfu+edjsPsghQrsfmHB/
	 DSgjdjUupP9Wd5ANIxEqWVCB3PXOnw3uke2jXNmKyJw9kKfXt+9fc98OQr+qlesFYXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182196;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Bad-Reply;
	bh=UaAMBt0M7fytje9obiSckvadBN7geaFIvY0a1pcfao4=;
	b=G3CafRURlfOkhcQrPXKGUXhM4vYDnbqhwQVm+8W8Lqvg/CIwuhMlSWki3Brc0e83bDD3
	 qMcIM7IOv3bRZbndnUfReXWQvZ/FzcyGrGiPJcZp57Br80VgYz2DHrb55as28f3YkkO15
	 w/unTu1UkVlpWNPOgNmxdx/It/Pfy0zRydhr/sR5FGcNiVfvO55wWNb70vYs/p7wUBBZ0
	 fr+ZkCSJb1ZqZmF0lSboRYyx2Kz//KPQCnDnA/oJaJ7VDcUMfkReE4EMtakGYZNkQhKeF
	 m5YRIfdkS3rJ8BZ0/72ZXBEV9OXuEe9aPycjixNksiiWPALNayZQho159Utxoi7xIKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aQdsKYio;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE87E606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE87E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aQdsKYio
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UaAMBt0M7fytje9obiSckvadBN7geaFIvY0a1pcfao4=; b=aQdsKYioEr2aA2SwuXtgLyM/5V
	nyI0IDg18Ebu43Pw1O4XgYUobzzrxAr0WGm2xqzvY5Kej9AG/rxD82tkbNQPnRutTmZti2SNJrY9d
	vzy9ulDV1doBYEZAd4L3N080Q3GUoDjji7kirsCzbCYSZQXrycwYwfg1DdAr8fk0ZAnGAYUphh7GN
	3XMVnPXMsN6rApoqCm7T341tCDnDEtUX1K5h357Czru1dO4Zqo551ubcqCkdExIsgfU0XWCdgeDHz
	lGJLenI1vcf/OwGqoEKAzU9r1ozKSe4NWWhOukb92cPn+qgFwrCS4+PkWJ6m6EUvS1Hx+r/FVF8iI
	sB2oizzw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0b6-0000000FsBy-14Sc;
	Wed, 28 Oct 2026 10:09:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 340BC30120E; Wed, 28 Oct 2026 11:09:30 +0100 (CET)
Date: Wed, 28 Oct 2026 11:09:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Bharata B Rao <bharata@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
	gourry@gourry.net, mgorman@techsingularity.net, mingo@redhat.com,
	raghavendra.kt@amd.com, riel@surriel.com, rientjes@google.com,
	sj@kernel.org, weixugc@google.com, willy@infradead.org,
	ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
	nifan.cxl@gmail.com, xuezhengchu@huawei.com, yiannis@zptcorp.com,
	akpm@linux-foundation.org, david@kernel.org, byungchul@sk.com,
	kinseyho@google.com, joshua.hahnjy@gmail.com, yuanchu@google.com,
	balbirs@nvidia.com, alok.rathore@samsung.com, shivankg@amd.com,
	donettom@linux.ibm.com, xin@zytor.com, hpa@zytor.com,
	luto@kernel.org, tglx@kernel.org, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jgross@suse.com,
	boris.ostrovsky@oracle.com
Subject: [RFC] x86: Remove CALL_FUNCTION_VECTOR
Message-ID: <20261028100930.GP2668564@noisy.programming.kicks-ass.net>
References: <20260728054356.291998-1-bharata@amd.com>
 <20260728054356.291998-8-bharata@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728054356.291998-8-bharata@amd.com>
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.

On Tue, Jul 28, 2026 at 11:13:55AM +0530, Bharata B Rao wrote:

> diff --git a/arch/x86/include/asm/irq_vectors.h b/arch/x86/include/asm/irq_vectors.h
> index 85253fc8e384..575f880cb147 100644
> --- a/arch/x86/include/asm/irq_vectors.h
> +++ b/arch/x86/include/asm/irq_vectors.h
> @@ -105,10 +105,12 @@
>   */
>  #define POSTED_MSI_NOTIFICATION_VECTOR	0xeb
>  
> +#define IBS_MEMPROF_VECTOR		0xea
> +
>  #define NR_VECTORS			 256
>  
>  #ifdef CONFIG_X86_LOCAL_APIC
> -#define FIRST_SYSTEM_VECTOR		POSTED_MSI_NOTIFICATION_VECTOR
> +#define FIRST_SYSTEM_VECTOR		IBS_MEMPROF_VECTOR
>  #else
>  #define FIRST_SYSTEM_VECTOR		NR_VECTORS
>  #endif

Right, so while looking at this, I noticed a few things; and I think we
can do the below.

---
Subject: x86: Remove CALL_FUNCTION_VECTOR

Per the lines in linux/smp.h:

  #define generic_smp_call_function_interrupt \
	  generic_smp_call_function_single_interrupt

The CALL_FUNCTION_VECTOR and CALL_FUNCTION_SINGLE_VECTOR have the exact
same handler and are thus identical.

Boot tested with vng; Xen parts completely untested.

Not-Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
Note: we could also move HYPERV_*_VECTOR to the bottom and compress
FIRST_SYSTEM_VECTOR depending on CONFIG_HYPERV, giving 2 interrupts back
to !HYPERV peeps.

 arch/x86/entry/entry_fred.c        |  1 -
 arch/x86/include/asm/idtentry.h    |  1 -
 arch/x86/include/asm/irq_vectors.h | 39 +++++++++++++++++++-------------------
 arch/x86/include/asm/xen/events.h  |  1 -
 arch/x86/kernel/apic/ipi.c         |  6 +++---
 arch/x86/kernel/idt.c              |  1 -
 arch/x86/kernel/smp.c              |  9 ---------
 arch/x86/xen/smp.c                 | 22 +--------------------
 8 files changed, 23 insertions(+), 57 deletions(-)

diff --git a/arch/x86/entry/entry_fred.c b/arch/x86/entry/entry_fred.c
index 854899bfec5d..661e125ed936 100644
--- a/arch/x86/entry/entry_fred.c
+++ b/arch/x86/entry/entry_fred.c
@@ -114,7 +114,6 @@ static idtentry_t sysvec_table[NR_SYSTEM_VECTORS] __ro_after_init = {
 
 	SYSVEC(RESCHEDULE_VECTOR,		reschedule_ipi),
 	SYSVEC(CALL_FUNCTION_SINGLE_VECTOR,	call_function_single),
-	SYSVEC(CALL_FUNCTION_VECTOR,		call_function),
 	SYSVEC(REBOOT_VECTOR,			reboot),
 
 	SYSVEC(THRESHOLD_APIC_VECTOR,		threshold),
diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index f400cfac69a6..d429a2720e8e 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -679,7 +679,6 @@ DECLARE_IDTENTRY_SYSVEC(X86_PLATFORM_IPI_VECTOR,	sysvec_x86_platform_ipi);
 DECLARE_IDTENTRY(RESCHEDULE_VECTOR,			sysvec_reschedule_ipi);
 DECLARE_IDTENTRY_SYSVEC(REBOOT_VECTOR,			sysvec_reboot);
 DECLARE_IDTENTRY_SYSVEC(CALL_FUNCTION_SINGLE_VECTOR,	sysvec_call_function_single);
-DECLARE_IDTENTRY_SYSVEC(CALL_FUNCTION_VECTOR,		sysvec_call_function);
 #else
 # define fred_sysvec_reschedule_ipi			NULL
 # define fred_sysvec_reboot				NULL
diff --git a/arch/x86/include/asm/irq_vectors.h b/arch/x86/include/asm/irq_vectors.h
index 85253fc8e384..ca8f2045f915 100644
--- a/arch/x86/include/asm/irq_vectors.h
+++ b/arch/x86/include/asm/irq_vectors.h
@@ -44,10 +44,10 @@
 #define ISA_IRQ_VECTOR(irq)		(((FIRST_EXTERNAL_VECTOR + 16) & ~15) + irq)
 
 /*
- * Special IRQ vectors used by the SMP architecture, 0xf0-0xff
+ * Special IRQ vectors used by the SMP architecture, 0xec-0xff
  *
  *  some of the following vectors are 'rare', they are merged
- *  into a single vector (CALL_FUNCTION_VECTOR) to save vector space.
+ *  into a single vector to save vector space.
  *  TLB, reschedule and local APIC vectors are performance-critical.
  */
 
@@ -61,49 +61,48 @@
 
 #define ERROR_APIC_VECTOR		0xfe
 #define RESCHEDULE_VECTOR		0xfd
-#define CALL_FUNCTION_VECTOR		0xfc
-#define CALL_FUNCTION_SINGLE_VECTOR	0xfb
-#define THERMAL_APIC_VECTOR		0xfa
-#define THRESHOLD_APIC_VECTOR		0xf9
-#define REBOOT_VECTOR			0xf8
+#define CALL_FUNCTION_SINGLE_VECTOR	0xfc
+#define THERMAL_APIC_VECTOR		0xfb
+#define THRESHOLD_APIC_VECTOR		0xfa
+#define REBOOT_VECTOR			0xf9
 
 /*
  * Generic system vector for platform specific use
  */
-#define X86_PLATFORM_IPI_VECTOR		0xf7
+#define X86_PLATFORM_IPI_VECTOR		0xf8
 
 /*
  * IRQ work vector:
  */
-#define IRQ_WORK_VECTOR			0xf6
+#define IRQ_WORK_VECTOR			0xf7
 
 /* IRQ vector for PMIs when running a guest with a mediated PMU. */
-#define PERF_GUEST_MEDIATED_PMI_VECTOR	0xf5
+#define PERF_GUEST_MEDIATED_PMI_VECTOR	0xf6
 
-#define DEFERRED_ERROR_VECTOR		0xf4
+#define DEFERRED_ERROR_VECTOR		0xf5
 
 /* Vector on which hypervisor callbacks will be delivered */
-#define HYPERVISOR_CALLBACK_VECTOR	0xf3
+#define HYPERVISOR_CALLBACK_VECTOR	0xf4
 
 /* Vector for KVM to deliver posted interrupt IPI */
-#define POSTED_INTR_VECTOR		0xf2
-#define POSTED_INTR_WAKEUP_VECTOR	0xf1
-#define POSTED_INTR_NESTED_VECTOR	0xf0
+#define POSTED_INTR_VECTOR		0xf3
+#define POSTED_INTR_WAKEUP_VECTOR	0xf2
+#define POSTED_INTR_NESTED_VECTOR	0xf1
 
-#define MANAGED_IRQ_SHUTDOWN_VECTOR	0xef
+#define MANAGED_IRQ_SHUTDOWN_VECTOR	0xf0
 
 #if IS_ENABLED(CONFIG_HYPERV)
-#define HYPERV_REENLIGHTENMENT_VECTOR	0xee
-#define HYPERV_STIMER0_VECTOR		0xed
+#define HYPERV_REENLIGHTENMENT_VECTOR	0xef
+#define HYPERV_STIMER0_VECTOR		0xee
 #endif
 
-#define LOCAL_TIMER_VECTOR		0xec
+#define LOCAL_TIMER_VECTOR		0xed
 
 /*
  * Posted interrupt notification vector for all device MSIs delivered to
  * the host kernel.
  */
-#define POSTED_MSI_NOTIFICATION_VECTOR	0xeb
+#define POSTED_MSI_NOTIFICATION_VECTOR	0xec
 
 #define NR_VECTORS			 256
 
diff --git a/arch/x86/include/asm/xen/events.h b/arch/x86/include/asm/xen/events.h
index 62bdceb594f1..11eeceb91fd6 100644
--- a/arch/x86/include/asm/xen/events.h
+++ b/arch/x86/include/asm/xen/events.h
@@ -6,7 +6,6 @@
 
 enum ipi_vector {
 	XEN_RESCHEDULE_VECTOR,
-	XEN_CALL_FUNCTION_VECTOR,
 	XEN_CALL_FUNCTION_SINGLE_VECTOR,
 	XEN_SPIN_UNLOCK_VECTOR,
 	XEN_IRQ_WORK_VECTOR,
diff --git a/arch/x86/kernel/apic/ipi.c b/arch/x86/kernel/apic/ipi.c
index c627bee3b14f..499bb3b8803b 100644
--- a/arch/x86/kernel/apic/ipi.c
+++ b/arch/x86/kernel/apic/ipi.c
@@ -88,14 +88,14 @@ void native_send_call_func_ipi(const struct cpumask *mask)
 			goto sendmask;
 
 		if (cpumask_test_cpu(cpu, mask))
-			__apic_send_IPI_all(CALL_FUNCTION_VECTOR);
+			__apic_send_IPI_all(CALL_FUNCTION_SINGLE_VECTOR);
 		else if (num_online_cpus() > 1)
-			__apic_send_IPI_allbutself(CALL_FUNCTION_VECTOR);
+			__apic_send_IPI_allbutself(CALL_FUNCTION_SINGLE_VECTOR);
 		return;
 	}
 
 sendmask:
-	__apic_send_IPI_mask(mask, CALL_FUNCTION_VECTOR);
+	__apic_send_IPI_mask(mask, CALL_FUNCTION_SINGLE_VECTOR);
 }
 
 void apic_send_nmi_to_offline_cpu(unsigned int cpu)
diff --git a/arch/x86/kernel/idt.c b/arch/x86/kernel/idt.c
index 90a22e24a9eb..b48e0e33ff03 100644
--- a/arch/x86/kernel/idt.c
+++ b/arch/x86/kernel/idt.c
@@ -133,7 +133,6 @@ static const struct idt_data ia32_idt[] __initconst = {
 static const __initconst struct idt_data apic_idts[] = {
 #ifdef CONFIG_SMP
 	INTG(RESCHEDULE_VECTOR,			asm_sysvec_reschedule_ipi),
-	INTG(CALL_FUNCTION_VECTOR,		asm_sysvec_call_function),
 	INTG(CALL_FUNCTION_SINGLE_VECTOR,	asm_sysvec_call_function_single),
 	INTG(REBOOT_VECTOR,			asm_sysvec_reboot),
 #endif
diff --git a/arch/x86/kernel/smp.c b/arch/x86/kernel/smp.c
index 985103cab16c..c7397816b311 100644
--- a/arch/x86/kernel/smp.c
+++ b/arch/x86/kernel/smp.c
@@ -255,15 +255,6 @@ DEFINE_IDTENTRY_SYSVEC_SIMPLE(sysvec_reschedule_ipi)
 	trace_reschedule_exit(RESCHEDULE_VECTOR);
 }
 
-DEFINE_IDTENTRY_SYSVEC(sysvec_call_function)
-{
-	apic_eoi();
-	trace_call_function_entry(CALL_FUNCTION_VECTOR);
-	inc_irq_stat(CALL_FUNCTION);
-	generic_smp_call_function_interrupt();
-	trace_call_function_exit(CALL_FUNCTION_VECTOR);
-}
-
 DEFINE_IDTENTRY_SYSVEC(sysvec_call_function_single)
 {
 	apic_eoi();
diff --git a/arch/x86/xen/smp.c b/arch/x86/xen/smp.c
index 05ee0d3b0874..d5544026ede5 100644
--- a/arch/x86/xen/smp.c
+++ b/arch/x86/xen/smp.c
@@ -11,7 +11,6 @@
 #include "xen-ops.h"
 
 static DEFINE_PER_CPU(struct xen_common_irq, xen_resched_irq) = { .irq = -1 };
-static DEFINE_PER_CPU(struct xen_common_irq, xen_callfunc_irq) = { .irq = -1 };
 static DEFINE_PER_CPU(struct xen_common_irq, xen_callfuncsingle_irq) = { .irq = -1 };
 static DEFINE_PER_CPU(struct xen_common_irq, xen_debug_irq) = { .irq = -1 };
 
@@ -37,12 +36,6 @@ void xen_smp_intr_free(unsigned int cpu)
 		unbind_from_irqhandler(per_cpu(xen_resched_irq, cpu).irq, NULL);
 		per_cpu(xen_resched_irq, cpu).irq = -1;
 	}
-	kfree(per_cpu(xen_callfunc_irq, cpu).name);
-	per_cpu(xen_callfunc_irq, cpu).name = NULL;
-	if (per_cpu(xen_callfunc_irq, cpu).irq >= 0) {
-		unbind_from_irqhandler(per_cpu(xen_callfunc_irq, cpu).irq, NULL);
-		per_cpu(xen_callfunc_irq, cpu).irq = -1;
-	}
 	kfree(per_cpu(xen_debug_irq, cpu).name);
 	per_cpu(xen_debug_irq, cpu).name = NULL;
 	if (per_cpu(xen_debug_irq, cpu).irq >= 0) {
@@ -80,16 +73,6 @@ int xen_smp_intr_init(unsigned int cpu)
 	callfunc_name = kasprintf(GFP_KERNEL, "callfunc%d", cpu);
 	if (!callfunc_name)
 		goto fail_mem;
-	per_cpu(xen_callfunc_irq, cpu).name = callfunc_name;
-	rc = bind_ipi_to_irqhandler(XEN_CALL_FUNCTION_VECTOR,
-				    cpu,
-				    xen_call_function_interrupt,
-				    IRQF_PERCPU|IRQF_NOBALANCING,
-				    callfunc_name,
-				    NULL);
-	if (rc < 0)
-		goto fail;
-	per_cpu(xen_callfunc_irq, cpu).irq = rc;
 
 	if (!xen_fifo_events) {
 		debug_name = kasprintf(GFP_KERNEL, "debug%d", cpu);
@@ -154,7 +137,7 @@ void xen_smp_send_call_function_ipi(const struct cpumask *mask)
 {
 	int cpu;
 
-	__xen_send_IPI_mask(mask, XEN_CALL_FUNCTION_VECTOR);
+	__xen_send_IPI_mask(mask, XEN_CALL_FUNCTION_SINGLE_VECTOR);
 
 	/* Make sure other vcpus get a chance to run if they need to. */
 	for_each_cpu(cpu, mask) {
@@ -179,9 +162,6 @@ static inline int xen_map_vector(int vector)
 	case RESCHEDULE_VECTOR:
 		xen_vector = XEN_RESCHEDULE_VECTOR;
 		break;
-	case CALL_FUNCTION_VECTOR:
-		xen_vector = XEN_CALL_FUNCTION_VECTOR;
-		break;
 	case CALL_FUNCTION_SINGLE_VECTOR:
 		xen_vector = XEN_CALL_FUNCTION_SINGLE_VECTOR;
 		break;

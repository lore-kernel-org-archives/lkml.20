Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7070B42E408;
	Fri, 25 Sep 2026 10:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333317; cv=none; b=OCAKWVw/sCtLVskV+ifol08P+rDRgmN/xvVanRcY/6kTpRvjvoh9CkzkeDU3JDenLh82H7jiR7iP8hKl3VTkj7CJ2GgK4aMtxX9XMLxWCC8VvHxypfmtisDH6hS6KGlGNSOCZD6JKx4yZJUhUaYr99v0XjI9jCMKhPgtbHBoGRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333317; c=relaxed/simple;
	bh=BfoJjpwX8aie25AWeGAD3njgcSpy984yr1WWCtqmY/A=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=l3vlOLZmvHP7Hw9y8y4eXgUvpUTq1tvpQhyB4Df+qwjymQs4zYum2Q0nyWnuClcuEq8zirlje+hjJWmBo9BRLZErCYHOKV104vzeLvOQMB20YsBG/K++GaNLwflLqveogY8dK15su6egnDwV1rlgQumEZvqTOxSuRSC4og8c/lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rSZY0H1A; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=w8xGqeG4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rSZY0H1A";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w8xGqeG4"
Date: Fri, 25 Sep 2026 10:48:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333305;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D9BGTarbLaa+7/X7cyKCHcxI7jLjS7hd+tEFaaUxWis=;
	b=rSZY0H1AmIMe/dRerui7Najn26WqiB7RSw4Fu9xoOoEjsO9DGTbSHs2KWPNDwYg+iK6kc4
	ytfGlD4XMbwKLoUOcqfOP4rh+P076h7He0JbMhP8few5PuIFnmgOmGzUeLVi3NUiRG9qeb
	FDGuTdeHcFOs3qiZbO+O99NyoVFDMMooFYk1Ja9R/HfHoDp3PTlPLS8SVTcmcQRR/vbBR8
	oq9W8bpaARRr8nSAVh8ySK+CD8DcCpKd8QFrydhJc8aHrP7igHSI1QsCOhkodyyd/+cvvw
	SP7t1I4b2KVE6LH7XIXOZkSCuiRl1TXIvfSL2DAuPVttA/Ew6DneDcF1fbU3UQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333305;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D9BGTarbLaa+7/X7cyKCHcxI7jLjS7hd+tEFaaUxWis=;
	b=w8xGqeG4alxOt48Dj3bumMM8tTyg+EhpOm/fTt5S2sLRU/25Z/jjum0dkkxioLrN+2qY09
	sqTM/KFFAMp6BoDw==
From: "tip-bot2 for Sean Christopherson" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86: KVM: Have perf define a dedicated struct
 for getting guest PEBS data
Cc: Sean Christopherson <seanjc@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, Jim Mattson <jmattson@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260921191418.950933-7-seanjc@google.com>
References: <20260921191418.950933-7-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033330414.2819794.5313001985712809252.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     a634e4536ec22a17e2391fd5ed38c06ad99cbf99
Gitweb:        https://git.kernel.org/tip/a634e4536ec22a17e2391fd5ed38c06ad99=
cbf99
Author:        Sean Christopherson <seanjc@google.com>
AuthorDate:    Mon, 21 Sep 2026 12:14:14 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:53 +02:00

perf/x86: KVM: Have perf define a dedicated struct for getting guest PEBS data

Have perf define a struct for getting guest PEBS data from KVM instead of
poking into the kvm_pmu structure.  Passing in an entire "struct kvm_pmu"
_as an opaque pointer_ to get at four fields is silly, especially since
one of the fields exists purely to convey information to perf, i.e. isn't
used by KVM.

Perf should also own its APIs, i.e. define what fields/data it needs, not
rely on KVM to throw fields into data structures that effectively hold
KVM-internal state.

Opportunistically rephrase the comment about cross-mapped counters to
explain *why* PEBS needs to be disabled.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
Link: https://patch.msgid.link/20260921191418.950933-7-seanjc@google.com
---
 arch/x86/events/core.c            |  5 +++--
 arch/x86/events/intel/core.c      | 16 ++++++++--------
 arch/x86/events/perf_event.h      |  3 ++-
 arch/x86/include/asm/kvm_host.h   |  9 ---------
 arch/x86/include/asm/perf_event.h | 12 ++++++++++--
 arch/x86/kvm/vmx/pmu_intel.c      | 17 ++++++++++++++---
 arch/x86/kvm/vmx/vmx.c            | 11 ++++++++---
 arch/x86/kvm/vmx/vmx.h            |  2 +-
 8 files changed, 46 insertions(+), 29 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index ef9b8df..9b1a903 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -862,9 +862,10 @@ void x86_pmu_disable_all(void)
 	}
 }
=20
-struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr, void *data)
+struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr,
+						  struct x86_guest_pebs *guest_pebs)
 {
-	return static_call(x86_pmu_guest_get_msrs)(nr, data);
+	return static_call(x86_pmu_guest_get_msrs)(nr, guest_pebs);
 }
 EXPORT_SYMBOL_FOR_KVM(perf_guest_get_msrs);
=20
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 0765187..87274b3 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -14,7 +14,6 @@
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <linux/nmi.h>
-#include <linux/kvm_host.h>
=20
 #include <asm/cpufeature.h>
 #include <asm/cpuid/api.h>
@@ -5328,11 +5327,11 @@ static int intel_pmu_hw_config(struct perf_event *eve=
nt)
  * when it uses {RD,WR}MSR, which should be handled by the KVM context,
  * specifically in the intel_pmu_{get,set}_msr().
  */
-static struct perf_guest_switch_msr *intel_guest_get_msrs(int *nr, void *dat=
a)
+static struct perf_guest_switch_msr *intel_guest_get_msrs(int *nr,
+							  struct x86_guest_pebs *guest_pebs)
 {
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
 	struct perf_guest_switch_msr *arr =3D cpuc->guest_switch_msrs;
-	struct kvm_pmu *kvm_pmu =3D (struct kvm_pmu *)data;
 	u64 intel_ctrl =3D hybrid(cpuc->pmu, intel_ctrl);
 	u64 pebs_mask =3D cpuc->pebs_enabled & x86_pmu.pebs_capable;
 	u64 guest_pebs_mask;
@@ -5386,7 +5385,7 @@ static struct perf_guest_switch_msr *intel_guest_get_ms=
rs(int *nr, void *data)
 	 * the guest wants to use for PEBS, (c) are not excluded from counting
 	 * in the guest, and (d) _are_ excluded from counting in the host.
 	 */
-	guest_pebs_mask =3D pebs_mask & intel_ctrl & kvm_pmu->pebs_enable &
+	guest_pebs_mask =3D pebs_mask & intel_ctrl & guest_pebs->enable &
 			  ~cpuc->intel_ctrl_exclude_guest_mask &
 			  cpuc->intel_ctrl_exclude_host_mask;
=20
@@ -5396,7 +5395,7 @@ static struct perf_guest_switch_msr *intel_guest_get_ms=
rs(int *nr, void *data)
 	 * PERF_GLOBAL_STATUS, i.e. the guest will see overflow status for the
 	 * wrong counter(s).
 	 */
-	guest_pebs_mask &=3D ~kvm_pmu->host_cross_mapped_mask;
+	guest_pebs_mask &=3D ~guest_pebs->cross_mapped_mask;
=20
 	/*
 	 * FIXME: Allow guest and host usage of PEBS events to co-exist instead
@@ -5415,14 +5414,14 @@ static struct perf_guest_switch_msr *intel_guest_get_=
msrs(int *nr, void *data)
 	arr[(*nr)++] =3D (struct perf_guest_switch_msr){
 		.msr =3D MSR_IA32_DS_AREA,
 		.host =3D (unsigned long)cpuc->ds,
-		.guest =3D guest_pebs_mask ? kvm_pmu->ds_area : (unsigned long)cpuc->ds,
+		.guest =3D guest_pebs_mask ? guest_pebs->ds_area : (unsigned long)cpuc->ds,
 	};
=20
 	if (x86_pmu.intel_cap.pebs_baseline) {
 		arr[(*nr)++] =3D (struct perf_guest_switch_msr){
 			.msr =3D MSR_PEBS_DATA_CFG,
 			.host =3D cpuc->active_pebs_data_cfg,
-			.guest =3D guest_pebs_mask ? kvm_pmu->pebs_data_cfg :
+			.guest =3D guest_pebs_mask ? guest_pebs->data_cfg :
 						   cpuc->active_pebs_data_cfg,
 		};
 	}
@@ -5438,7 +5437,8 @@ static struct perf_guest_switch_msr *intel_guest_get_ms=
rs(int *nr, void *data)
 	return arr;
 }
=20
-static struct perf_guest_switch_msr *core_guest_get_msrs(int *nr, void *data)
+static struct perf_guest_switch_msr *core_guest_get_msrs(int *nr,
+							 struct x86_guest_pebs *guest_pebs)
 {
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
 	struct perf_guest_switch_msr *arr =3D cpuc->guest_switch_msrs;
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 7c3a84e..e274802 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -1226,7 +1226,8 @@ struct x86_pmu {
 	/*
 	 * Intel host/guest support (KVM)
 	 */
-	struct perf_guest_switch_msr *(*guest_get_msrs)(int *nr, void *data);
+	struct perf_guest_switch_msr *(*guest_get_msrs)(int *nr,
+							struct x86_guest_pebs *guest_pebs);
=20
 	/*
 	 * Check period value for PERF_EVENT_IOC_PERIOD ioctl.
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 683bb8b..5e8aecf 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -609,15 +609,6 @@ struct kvm_pmu {
 	u64 pebs_data_cfg_rsvd;
=20
 	/*
-	 * If a guest counter is cross-mapped to host counter with different
-	 * index, its PEBS capability will be temporarily disabled.
-	 *
-	 * The user should make sure that this mask is updated
-	 * after disabling interrupts and before perf_guest_get_msrs();
-	 */
-	u64 host_cross_mapped_mask;
-
-	/*
 	 * The gate to release perf_events not marked in
 	 * pmc_in_use only once in a vcpu time slice.
 	 */
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_ev=
ent.h
index 12f7db8..27f9c5b 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -819,11 +819,19 @@ extern void perf_load_guest_lvtpc(u32 guest_lvtpc);
 extern void perf_put_guest_lvtpc(void);
 #endif
=20
+struct x86_guest_pebs {
+	u64	enable;
+	u64	ds_area;
+	u64	data_cfg;
+	u64	cross_mapped_mask;
+};
 #if defined(CONFIG_PERF_EVENTS) && defined(CONFIG_CPU_SUP_INTEL)
-extern struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr, void *data=
);
+extern struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr,
+							 struct x86_guest_pebs *guest_pebs);
 extern void x86_perf_get_lbr(struct x86_pmu_lbr *lbr);
 #else
-struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr, void *data);
+struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr,
+						  struct x86_guest_pebs *guest_pebs);
 static inline void x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
 {
 	memset(lbr, 0, sizeof(*lbr));
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index bfa8612..a21e146 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -747,11 +747,21 @@ static void intel_pmu_cleanup(struct kvm_vcpu *vcpu)
 		intel_pmu_release_guest_lbr_event(vcpu);
 }
=20
-void intel_pmu_cross_mapped_check(struct kvm_pmu *pmu)
+u64 intel_pmu_get_cross_mapped_mask(struct kvm_pmu *pmu)
 {
-	struct kvm_pmc *pmc =3D NULL;
+	u64 host_cross_mapped_mask;
+	struct kvm_pmc *pmc;
 	int bit, hw_idx;
=20
+	/*
+	 * Provide a mask of counters that are cross-mapped between the guest
+	 * and the host, i.e. where a guest PMC is mapped to a host PMC with a
+	 * different index.  PEBS records hold a PERF_GLOBAL_STATUS snapshot,
+	 * and so PEBS-enabled counters need to hold the correct index so as
+	 * not to confuse the guest.
+	 */
+	host_cross_mapped_mask =3D 0;
+
 	kvm_for_each_pmc(pmu, pmc, bit, (unsigned long *)&pmu->global_ctrl) {
 		if (!pmc_is_locally_enabled(pmc) ||
 		    !pmc_is_globally_enabled(pmc) || !pmc->perf_event)
@@ -763,8 +773,9 @@ void intel_pmu_cross_mapped_check(struct kvm_pmu *pmu)
 		 */
 		hw_idx =3D pmc->perf_event->hw.idx;
 		if (hw_idx !=3D pmc->idx && hw_idx > -1)
-			pmu->host_cross_mapped_mask |=3D BIT_ULL(hw_idx);
+			host_cross_mapped_mask |=3D BIT_ULL(hw_idx);
 	}
+	return host_cross_mapped_mask;
 }
=20
 static bool intel_pmu_is_mediated_pmu_supported(struct x86_pmu_capability *h=
ost_pmu)
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 612ab07..b097db2 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7363,12 +7363,17 @@ static void atomic_switch_perf_msrs(struct vcpu_vmx *=
vmx)
 	if (kvm_vcpu_has_mediated_pmu(&vmx->vcpu))
 		return;
=20
-	pmu->host_cross_mapped_mask =3D 0;
+	struct x86_guest_pebs guest_pebs =3D {
+		.enable =3D pmu->pebs_enable,
+		.ds_area =3D pmu->ds_area,
+		.data_cfg =3D pmu->pebs_data_cfg,
+	};
+
 	if (pmu->pebs_enable & pmu->global_ctrl)
-		intel_pmu_cross_mapped_check(pmu);
+		guest_pebs.cross_mapped_mask =3D intel_pmu_get_cross_mapped_mask(pmu);
=20
 	/* Note, nr_msrs may be garbage if perf_guest_get_msrs() returns NULL. */
-	msrs =3D perf_guest_get_msrs(&nr_msrs, (void *)pmu);
+	msrs =3D perf_guest_get_msrs(&nr_msrs, &guest_pebs);
 	if (!msrs)
 		return;
=20
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index dc8517f..5c4e2cf 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -664,7 +664,7 @@ static __always_inline struct vcpu_vmx *to_vmx(struct kvm=
_vcpu *vcpu)
 	return container_of(vcpu, struct vcpu_vmx, vcpu);
 }
=20
-void intel_pmu_cross_mapped_check(struct kvm_pmu *pmu);
+u64 intel_pmu_get_cross_mapped_mask(struct kvm_pmu *pmu);
 int intel_pmu_create_guest_lbr_event(struct kvm_vcpu *vcpu);
 void vmx_passthrough_lbr_msrs(struct kvm_vcpu *vcpu);
=20

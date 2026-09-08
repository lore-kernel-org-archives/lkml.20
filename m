Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D613D0BEC;
	Tue,  8 Sep 2026 20:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900710; cv=none; b=UQt31ip5e1lkOTWTT3pJAsZ16973FC20xOMjSw/2s+HtFd078a6AlzDg65E0BLMfu6pYnfKmlWji4Xp3+zaL6VIB0J6dLUcNAwXiL6bnAodg/RwDtZ8eTfBPGIlU0U24laUgD5KCFk9rmIW8GVATe5FPvXvSCqC9WTpdZF+GrQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900710; c=relaxed/simple;
	bh=m4GsUVRSgkln8+b1HMcM5pWs9v9iaXytZwez6BhcVLA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=bADFIuq7HufwyJQYIRega9qP/F+PPn2yatkLAE6ZmSOAwYDmpKZcYqOtJoYUVIpajhXr9ii8jvGAyKgWSsnE7z+Gf5P6/rjXJaUWg4hs3hRP4vI900no4mUJsVXLGiDhTb8mSVM2sBlzwbd6CCDgrPg//U7LkBVQYPNBq4/3fJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IHuR6fIp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lyKt9Lq6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IHuR6fIp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lyKt9Lq6"
Date: Tue, 08 Sep 2026 20:51:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900706;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pBr6UQ8Nf4OyTcfEaDNxO5HWedc/up7YykVcY601OIg=;
	b=IHuR6fIp8mjojXRK4nnue74OwpJ8wB6m6afGQoI4g+D4HEpVSvOIJPI2vpke78NTC7fFrj
	OK+gl+EYXcIAJL2eykpyqJZWieQRGZLS9sr5bzuw65ddaOML8JgS1vCBBbubBPqJ6gBDVG
	5BnU4EWQHoTy+HGVKb6K8Wr6ozVGrUe0/GN1LNEsRiLt1KOGG8+hRf++MpbuROzIESblr3
	T87uF0YN5Nd6K/wgxfWyJeQn1mpLZjQ0yTbIBNSOUqWE8WSh5TYX/+bsdt7lcdvjPBEHZZ
	9xTRnolI8jpS3iDCqzWy8I7ejRlvaVADk1LDZ2PZJxxR5CHHy8+ZqSw6Hh9okA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900706;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pBr6UQ8Nf4OyTcfEaDNxO5HWedc/up7YykVcY601OIg=;
	b=lyKt9Lq6Jr1DdVpM2nJnbo/oclhCB5ipKd2qlQhFZ0UOffaOVZk60yaQ4KeVfFHJSWLlOm
	MQqZ0NFeB6N+xOAg==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/core] perf/x86: Enable XMM register sampling for REGS_USER case
Cc: Kan Liang <kan.liang@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-12-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-12-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890070522.623050.6065243907268437284.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     edd9aec51213debb788d50ad8d7aeaac59fde6d6
Gitweb:        https://git.kernel.org/tip/edd9aec51213debb788d50ad8d7aeaac59f=
de6d6
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:19 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:43 +02:00

perf/x86: Enable XMM register sampling for REGS_USER case

Support XMM register sampling for the REGS_USER case.

To handle simultaneous sampling of XMM registers for both REGS_INTR and
REGS_USER cases, a per-CPU x86_user_regs is introduced to store
REGS_USER-specific XMM registers. This prevents REGS_USER-specific XMM
register data from being overwritten by REGS_INTR-specific data if they
share the same x86_perf_regs structure.

To sample user-space XMM registers, the x86_pmu_update_user_xregs()
helper function is added. It checks if the user-space FPU state has been
cached into task FPU state. If so, the user-space XMM register data
can be directly retrieved from the cached task FPU state, as the
corresponding hardware registers have been cleared or switched to
kernel-space state or guest state. Otherwise, the data could be read
from the hardware registers using the xsaves instruction.

For PEBS events, x86_pmu_update_user_xregs() checks if the PEBS-sampled
XMM register data belongs to user-space. If so, no further action is
needed. Otherwise, the user-space XMM register data needs to be
re-sampled using the same method as for non-PEBS events.

Co-developed-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-12-dapeng1.mi@linux.int=
el.com
---
 arch/x86/events/core.c       | 154 +++++++++++++++++++++++++++++++---
 arch/x86/events/intel/core.c |   6 +-
 arch/x86/events/intel/ds.c   |   5 +-
 3 files changed, 147 insertions(+), 18 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 1c3e2bf..2014064 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -702,12 +702,12 @@ int x86_pmu_hw_config(struct perf_event *event)
 			return -EINVAL;
 	}
=20
-	if (event->attr.sample_type & PERF_SAMPLE_REGS_INTR) {
+	if (event->attr.sample_type & (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USE=
R)) {
 		/*
 		 * Besides the general purpose registers, XMM registers may
 		 * be collected as well.
 		 */
-		if (event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK) {
+		if (event_has_extended_regs(event)) {
 			if (!(event->pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS))
 				return -EINVAL;
=20
@@ -724,12 +724,6 @@ int x86_pmu_hw_config(struct perf_event *event)
 		}
 	}
=20
-	if (event->attr.sample_type & PERF_SAMPLE_REGS_USER) {
-		/* XMM registers sampling for REGS_USER is not supported yet. */
-		if (event->attr.sample_regs_user & PERF_REG_EXTENDED_MASK)
-			return -EINVAL;
-	}
-
 	return x86_setup_perfctr(event);
 }
=20
@@ -1832,14 +1826,129 @@ static void x86_pmu_update_regs_intr(struct perf_eve=
nt *event,
 	data->sample_flags |=3D PERF_SAMPLE_REGS_INTR;
 }
=20
+static DEFINE_PER_CPU(struct x86_perf_regs, x86_user_regs);
+
+static void x86_pmu_get_regs_user(struct perf_sample_data *data,
+				  struct pt_regs *regs)
+{
+	struct x86_perf_regs *x86_regs_user =3D this_cpu_ptr(&x86_user_regs);
+	struct perf_regs regs_user;
+
+	x86_pmu_clear_perf_regs(&x86_regs_user->regs);
+
+	perf_get_regs_user(&regs_user, regs);
+	data->regs_user.abi =3D regs_user.abi;
+	if (regs_user.regs) {
+		x86_regs_user->regs =3D *regs_user.regs;
+		data->regs_user.regs =3D &x86_regs_user->regs;
+	} else {
+		data->regs_user.regs =3D NULL;
+	}
+}
+
+/*
+ * The x86 specific variant of perf_sample_regs_user().
+ * Update data->regs_user fields for extended registers (e.g., SIMD).
+ */
+static void x86_pmu_update_regs_user(struct perf_event *event,
+				     struct perf_sample_data *data,
+				     struct pt_regs *regs)
+{
+	struct x86_perf_regs *x86_regs_user =3D this_cpu_ptr(&x86_user_regs);
+	struct perf_event_attr *attr =3D &event->attr;
+	struct x86_perf_regs *perf_regs;
+
+	/*
+	 * PERF_SAMPLE_REGS_INTR and PERF_SAMPLE_REGS_USER can both be
+	 * requested for one event. Keep user regs in a separate x86_perf_regs
+	 * instance, so intr-reg collection does not overwrite user-reg data.
+	 */
+	if (user_mode(regs)) {
+		x86_pmu_clear_perf_regs(&x86_regs_user->regs);
+		perf_regs =3D container_of(regs, struct x86_perf_regs, regs);
+		/* Copy all sampled regs data to x86_regs_user. */
+		*x86_regs_user =3D *perf_regs;
+		data->regs_user.regs =3D &x86_regs_user->regs;
+		data->regs_user.abi =3D perf_reg_abi(current);
+	} else if (is_user_task(current)) {
+		x86_pmu_get_regs_user(data, regs);
+	} else {
+		data->regs_user.abi =3D PERF_SAMPLE_REGS_ABI_NONE;
+		data->regs_user.regs =3D NULL;
+	}
+
+	data->dyn_size +=3D sizeof(u64);
+	if (data->regs_user.regs)
+		data->dyn_size +=3D hweight64(attr->sample_regs_user) * sizeof(u64);
+
+	/*
+	 * Set PERF_SAMPLE_REGS_USER to bypass perf_sample_regs_user() call
+	 * in perf_prepare_sample() function.
+	 */
+	data->sample_flags |=3D PERF_SAMPLE_REGS_USER;
+}
+
+/*
+ * This function retrieves cached user-space fpu registers (XMM/YMM/ZMM).
+ * If TIF_NEED_FPU_LOAD is set or PMI hits into guest, it indicates that
+ * the user-space FPU state is cached. Otherwise, the data should be read
+ * directly from the hardware registers.
+ */
+static inline u64 x86_pmu_update_user_xregs(struct perf_sample_data *data,
+					    struct pt_regs *regs,
+					    u64 mask, bool from_pebs)
+{
+	struct x86_perf_regs *perf_regs;
+	struct xregs_state *xsave;
+	struct fpu *fpu;
+	struct fpstate *fps;
+	u64 user_mask =3D mask;
+
+	if (!is_user_task(current))
+		return 0;
+
+	if (data->regs_user.abi =3D=3D PERF_SAMPLE_REGS_ABI_NONE)
+		return 0;
+
+	/*
+	 * If PEBS hits kernel space, need to re-sample extended
+	 * registers for user space.
+	 */
+	if (user_mode(regs))
+		user_mask =3D from_pebs ? 0 : mask;
+
+	fpu =3D x86_task_fpu(current);
+	fps =3D READ_ONCE(fpu->__task_fpstate);
+	/*
+	 * If fpu->__task_fpstate is set, it points to the cached user
+	 * FPU state (e.g. with KVM guest-state swapping). Otherwise,
+	 * when TIF_NEED_FPU_LOAD is set, fpu->fpstate holds the cached
+	 * user state. If neither is true, the user state is live in hardware.
+	 */
+	if (user_mask && (test_thread_flag(TIF_NEED_FPU_LOAD) || fps)) {
+		perf_regs =3D container_of(data->regs_user.regs,
+					 struct x86_perf_regs, regs);
+		if (!fps)
+			fps =3D fpu->fpstate;
+		xsave =3D &fps->regs.xsave;
+
+		update_perf_regs(perf_regs, xsave, user_mask);
+		return 0;
+	}
+
+	return user_mask;
+}
+
 static void x86_pmu_sample_xregs(struct perf_event *event,
 				 struct perf_sample_data *data,
+				 struct pt_regs *regs,
 				 bool from_pebs)
 {
 	struct xregs_state *xsave =3D get_ext_regs_buf(smp_processor_id());
 	u64 sample_type =3D event->attr.sample_type;
 	struct x86_perf_regs *perf_regs;
 	u64 intr_mask =3D 0;
+	u64 user_mask =3D 0;
=20
 	if (WARN_ON_ONCE(!xsave) || !in_nmi())
 		return;
@@ -1852,13 +1961,31 @@ static void x86_pmu_sample_xregs(struct perf_event *e=
vent,
 		intr_mask =3D from_pebs ? 0 : intr_mask;
 	}
=20
+	if ((sample_type & PERF_SAMPLE_REGS_USER) && data->regs_user.regs) {
+		if (event->attr.sample_regs_user & PERF_REG_EXTENDED_MASK)
+			user_mask |=3D XFEATURE_MASK_SSE;
+
+		user_mask &=3D x86_pmu.ext_regs_mask;
+		user_mask =3D x86_pmu_update_user_xregs(data, regs,
+						      user_mask, from_pebs);
+	}
+
+	if (user_mask | intr_mask) {
+		xsave->header.xfeatures =3D 0;
+		xsaves_nmi(xsave, user_mask | intr_mask);
+	}
+
 	if (intr_mask) {
 		perf_regs =3D container_of(data->regs_intr.regs,
 					 struct x86_perf_regs, regs);
-		xsave->header.xfeatures =3D 0;
-		xsaves_nmi(xsave, intr_mask);
 		update_perf_regs(perf_regs, xsave, intr_mask);
 	}
+
+	if (user_mask) {
+		perf_regs =3D container_of(data->regs_user.regs,
+					 struct x86_perf_regs, regs);
+		update_perf_regs(perf_regs, xsave, user_mask);
+	}
 }
=20
 void x86_pmu_update_perf_regs(struct perf_event *event,
@@ -1868,16 +1995,17 @@ void x86_pmu_update_perf_regs(struct perf_event *even=
t,
 {
 	u64 sample_type =3D event->attr.sample_type;
=20
-	if (!((sample_type & PERF_SAMPLE_REGS_INTR) &&
-	      (event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK)))
+	if (!event_has_extended_regs(event))
 		return;
=20
 	if (sample_type & PERF_SAMPLE_REGS_INTR) {
 		x86_pmu_update_regs_intr(event, data, regs,
 					 event->attr.exclude_kernel);
 	}
+	if (sample_type & PERF_SAMPLE_REGS_USER)
+		x86_pmu_update_regs_user(event, data, regs);
=20
-	x86_pmu_sample_xregs(event, data, from_pebs);
+	x86_pmu_sample_xregs(event, data, regs, from_pebs);
 }
=20
 int x86_pmu_handle_irq(struct pt_regs *regs)
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index ddf7261..5cb8083 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -4695,15 +4695,15 @@ static void intel_pebs_aliases_skl(struct perf_event =
*event)
 static unsigned long intel_pmu_large_pebs_flags(struct perf_event *event)
 {
 	unsigned long flags =3D x86_pmu.large_pebs_flags;
+	u64 gprs_mask =3D PEBS_GP_REGS | PERF_REG_EXTENDED_MASK;
=20
 	if (event->attr.use_clockid)
 		flags &=3D ~PERF_SAMPLE_TIME;
 	if (!event->attr.exclude_kernel)
 		flags &=3D ~PERF_SAMPLE_REGS_USER;
-	if (event->attr.sample_regs_user & ~PEBS_GP_REGS)
+	if (event->attr.sample_regs_user & ~gprs_mask)
 		flags &=3D ~PERF_SAMPLE_REGS_USER;
-	if (event->attr.sample_regs_intr &
-	    ~(PEBS_GP_REGS | PERF_REG_EXTENDED_MASK))
+	if (event->attr.sample_regs_intr & ~gprs_mask)
 		flags &=3D ~PERF_SAMPLE_REGS_INTR;
 	return flags;
 }
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index e14f8c2..d216234 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -1733,8 +1733,7 @@ static u64 pebs_update_adaptive_cfg(struct perf_event *=
event)
 	if (gprs || (attr->precise_ip < 2) || tsx_weight)
 		pebs_data_cfg |=3D PEBS_DATACFG_GP;
=20
-	if ((sample_type & PERF_SAMPLE_REGS_INTR) &&
-	    (attr->sample_regs_intr & PERF_REG_EXTENDED_MASK))
+	if (event_has_extended_regs(event))
 		pebs_data_cfg |=3D PEBS_DATACFG_XMMS;
=20
 	if (sample_type & PERF_SAMPLE_BRANCH_STACK) {
@@ -2937,6 +2936,8 @@ __intel_pmu_pebs_events(struct perf_event *event,
 	void *at =3D get_next_pebs_record_by_bit(base, top, bit);
 	int cnt =3D count;
=20
+	x86_pmu_clear_perf_regs(regs);
+
 	if (!iregs)
 		iregs =3D &dummy_iregs;
=20

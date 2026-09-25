Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB3E2D6E64;
	Fri, 25 Sep 2026 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333308; cv=none; b=huxpmK79DXWdg/33jNqqXfQ2Ok0C3Lmz36OGw03CdKczW1PCWf1tStt1NDqsRETWte3uQDaj74X2yWDjIFT3D4PMZGjD4G9ZemqdynPTXm749Hc/CS/fiiFK3mVU6P4Sq4DiU3JDXOFUlbyN2skLScYo/Jm+AaV/8VeYzobE5Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333308; c=relaxed/simple;
	bh=mAW+65Y9kwXFtL/5Z1uOAM9c+eVihN8jVj1y7IonUYE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=WYTdP1jUvkoWKcHrG9UKZY54Li1gdiJcBR++jbr3xMFg4/MvuFc5tskxuENn6SXVpD3Mpxanega3sA9+ETUsRBtsTBQ4gP0P4ZFWOtwkd5pltMJg43wBoyHfNNheUq1Ob4FVPOBQq6rNhFOWfYkVt9jLfxRgC+Uw/qaugOzaoas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1Cx1tULp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4Mhs6uQ4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1Cx1tULp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4Mhs6uQ4"
Date: Fri, 25 Sep 2026 10:48:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333301;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WpPPgfM8Mgi8jMGEyWzonpOskzNTjHWfqVjlR3iI3Ko=;
	b=1Cx1tULpZPdA2jVkyESqN3Vst5KYHKS1fPeKexch9yqc5bCOcdJ/9Jt6Ic9j4p6NHNQEvw
	OkZxF9gd3hOFY2vQbQEveP/rYKPGJL99fUwwWP3A9abX5beYWzCo9J3kWvXJHzgX7lqlnV
	pBd9QbLYV3g0ZxQp1K7TIi40oe8eKHSppvID5+cIQQSC8RmNjO6LdsUXLNSsz01dG98jNW
	kKepBdt7s8FFqeHvq90CYVyQTjXulDPb9MhMDBF7jacoEXZBLYNJGb25TxKW/bsnUrJNgH
	Xd4yUFPwEh1G0Knjr94reh8bBczGT17tr9hW81/BLQVzFv9UMWWGSKdB6B7OwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333301;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WpPPgfM8Mgi8jMGEyWzonpOskzNTjHWfqVjlR3iI3Ko=;
	b=4Mhs6uQ4Uc0OI98HxupogaR8rQM77AwhJSV5SeBcON+I2q7qlYiqdrkbLKAN9CTBvHC+4I
	g0jHo51KADbXV2Aw==
From: "tip-bot2 for Sean Christopherson" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] KVM: VMX: Only tell perf to enable PEBS counters for
 fully enabled PMCs
Cc: Sean Christopherson <seanjc@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921191418.950933-10-seanjc@google.com>
References: <20260921191418.950933-10-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033329918.2819794.9972074988977555129.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     193ef44e32619550478fce9d0b91edc0046ed8c3
Gitweb:        https://git.kernel.org/tip/193ef44e32619550478fce9d0b91edc0046=
ed8c3
Author:        Sean Christopherson <seanjc@google.com>
AuthorDate:    Mon, 21 Sep 2026 12:14:17 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:54 +02:00

KVM: VMX: Only tell perf to enable PEBS counters for fully enabled PMCs

When passing the guest's requested PEBS_ENABLE (or rather, KVM's version
of PEBS_ENABLE on behalf of the guest), omit counters that are locally
disable and/or don't have a perf event (due to contention), in addition to
omitting counters that are cross-mapped in the host.

In practice, this should be a nop as perf will already have disabled the
associated counter, i.e. cpuc->pebs_enabled should have been cleared, but
paranoia is cheap, and the existing code _looks_ wrong.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Link: https://patch.msgid.link/20260921191418.950933-10-seanjc@google.com
---
 arch/x86/kvm/vmx/pmu_intel.c | 30 ++++++++++++++++--------------
 arch/x86/kvm/vmx/vmx.c       | 11 +----------
 arch/x86/kvm/vmx/vmx.h       | 15 ++++++++++++++-
 3 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 040b8e8..472cf51 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -747,34 +747,36 @@ static void intel_pmu_cleanup(struct kvm_vcpu *vcpu)
 		intel_pmu_release_guest_lbr_event(vcpu);
 }
=20
-u64 intel_pmu_get_cross_mapped_mask(struct kvm_pmu *pmu)
+u64 __intel_pmu_compute_pebs_enable(struct kvm_pmu *pmu)
 {
-	u64 host_cross_mapped_mask;
+	u64 guest_pebs_enable =3D pmu->pebs_enable & pmu->global_ctrl;
+	u64 pebs_enable =3D 0;
 	struct kvm_pmc *pmc;
 	int bit, hw_idx;
=20
 	/*
-	 * Provide a mask of counters that are cross-mapped between the guest
-	 * and the host, i.e. where a guest PMC is mapped to a host PMC with a
-	 * different index.  PEBS records hold a PERF_GLOBAL_STATUS snapshot,
-	 * and so PEBS-enabled counters need to hold the correct index so as
-	 * not to confuse the guest.
+	 * Omit counters that are locally disabled, don't have a perf event, or
+	 * ended up with a perf event that is using a different counter than
+	 * the guest, i.e. where the guest PMC is different than the host PMC
+	 * being used on behalf of the guest.  PEBS records include
+	 * PERF_GLOBAL_STATUS, and so using a counter with a different index
+	 * means the guest will see overflow status for the wrong counter(s).
 	 */
-	host_cross_mapped_mask =3D 0;
-
-	kvm_for_each_pmc(pmu, pmc, bit, (unsigned long *)&pmu->global_ctrl) {
+	kvm_for_each_pmc(pmu, pmc, bit, (unsigned long *)&guest_pebs_enable) {
 		if (!pmc_is_locally_enabled(pmc) || !pmc->perf_event)
 			continue;
=20
 		/*
-		 * A negative index indicates the event isn't mapped to a
+		 * Note, a negative index indicates the event isn't mapped to a
 		 * physical counter in the host, e.g. due to contention.
 		 */
 		hw_idx =3D pmc->perf_event->hw.idx;
-		if (hw_idx !=3D pmc->idx && hw_idx > -1)
-			host_cross_mapped_mask |=3D BIT_ULL(hw_idx);
+		if (hw_idx !=3D pmc->idx)
+			continue;
+
+		pebs_enable |=3D BIT_ULL(pmc->idx);
 	}
-	return host_cross_mapped_mask;
+	return pebs_enable;
 }
=20
 static bool intel_pmu_is_mediated_pmu_supported(struct x86_pmu_capability *h=
ost_pmu)
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 8f7d062..2d04435 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7364,20 +7364,11 @@ static void atomic_switch_perf_msrs(struct vcpu_vmx *=
vmx)
 		return;
=20
 	struct x86_guest_pebs guest_pebs =3D {
-		.enable =3D pmu->pebs_enable,
+		.enable =3D intel_pmu_compute_pebs_enable(pmu),
 		.ds_area =3D pmu->ds_area,
 		.data_cfg =3D pmu->pebs_data_cfg,
 	};
=20
-	/*
-	 * Disable counters where the guest PMC is different than the host PMC
-	 * being used on behalf of the guest, as the PEBS record includes
-	 * PERF_GLOBAL_STATUS, i.e. the guest will see overflow status for the
-	 * wrong counter(s).
-	 */
-	if (guest_pebs.enable & pmu->global_ctrl)
-		guest_pebs.enable &=3D ~intel_pmu_get_cross_mapped_mask(pmu);
-
 	/* Note, nr_msrs may be garbage if perf_guest_get_msrs() returns NULL. */
 	msrs =3D perf_guest_get_msrs(&nr_msrs, &guest_pebs);
 	if (!msrs)
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index 5c4e2cf..1db4610 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -664,7 +664,20 @@ static __always_inline struct vcpu_vmx *to_vmx(struct kv=
m_vcpu *vcpu)
 	return container_of(vcpu, struct vcpu_vmx, vcpu);
 }
=20
-u64 intel_pmu_get_cross_mapped_mask(struct kvm_pmu *pmu);
+u64 __intel_pmu_compute_pebs_enable(struct kvm_pmu *pmu);
+
+static inline u64 intel_pmu_compute_pebs_enable(struct kvm_pmu *pmu)
+{
+	/*
+	 * Avoid the function call overhead in the common case that the guest
+	 * isn't using PEBS.
+	 */
+	if (!(pmu->pebs_enable & pmu->global_ctrl))
+		return 0;
+
+	return __intel_pmu_compute_pebs_enable(pmu);
+}
+
 int intel_pmu_create_guest_lbr_event(struct kvm_vcpu *vcpu);
 void vmx_passthrough_lbr_msrs(struct kvm_vcpu *vcpu);
=20

Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCDC2D46A2;
	Fri, 25 Sep 2026 10:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333313; cv=none; b=bQtGRBPCN24t+MQVdrc04cPLwxUyDn9UJeCBKFtL3BoWeytIZvBom2U0IGB77LfFAVdWnwCg5tiuwI0wM0dBYaMP/nbf15NdN/v6SMFubYvlIizc/As2UlBvnvOOb0fusVnNTMQxa/mY6IUOLeeWbN5Q+CavM5LiV60RxCKV9Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333313; c=relaxed/simple;
	bh=A0iCdrdp0Ymd9xd3tzaf71If6VAOgelKJOPjtkVR0A4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=d06prZRnkczAA96hFRwh4pjp7mVpntqPms4UQkzUSyKSzwlKtxR037cy6mAALhvWzCQ43XXnJ1EXRJ/28k2dbbTastoBAJXJcSw+x3VpLUF1gdBDz4I2VhT7lV/X72aWUzaxp4XAVqJs8iHNOrrQR5pFQt+/8GBgWsbGSyVdjXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=T9u+D+mN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7NZCi+64; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="T9u+D+mN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7NZCi+64"
Date: Fri, 25 Sep 2026 10:48:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333304;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FdlDyA268K+OWLPL/zNy/tZgp6sJQQENT08Ys72crXg=;
	b=T9u+D+mNg80f5tqwuU3Zk/HK9f90NS+RV1MWYgUqHN6mL1lw1IwvRFMyfiFs6tRvyXAiHi
	EWgskngmCkk+wuy4ZJyNe79UfCbLDGwBmQ3G43LRSMdCMje4rmO/Ry6kLJfeq4p1sixViI
	RMaEr1uqos43p/rkUxesVUeiZr0zqHi4jiGYJGrO1qhN4yjLv4/0+L+XCOoNjgdRrEa7xQ
	F1s1DIzrk/iHgJn0LojJQADoWC9LWd06ThitvM/K2JfN7gCEuhVTzN2dQEsqcyRZW7bmwx
	f0HkW1ZaVLEiRHTOet1A9myeEI1tioSN4iagDFumgy9KitXrzPWikeG6XlLxoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333304;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FdlDyA268K+OWLPL/zNy/tZgp6sJQQENT08Ys72crXg=;
	b=7NZCi+64nljneW5b+/sJj7bZGVLUSvlSYleWwPMM70vdRJxPCaeBH2PcunnAe8xQTLV9j0
	FWFFEyx+dLpd20CQ==
From: "tip-bot2 for Sean Christopherson" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86/intel: KVM: Handle cross-mapped PEBS PMCs
 entirely within KVM
Cc: Sean Christopherson <seanjc@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921191418.950933-8-seanjc@google.com>
References: <20260921191418.950933-8-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033330267.2819794.11536927536259897972.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     31f7cf337ce717666ce29fbd793f06435eb48408
Gitweb:        https://git.kernel.org/tip/31f7cf337ce717666ce29fbd793f06435eb=
48408
Author:        Sean Christopherson <seanjc@google.com>
AuthorDate:    Mon, 21 Sep 2026 12:14:15 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:53 +02:00

perf/x86/intel: KVM: Handle cross-mapped PEBS PMCs entirely within KVM

Now that perf operates on a KVM-provided snapshot of PMU state, handled
cross-mapped PEBS counters entirely in KVM by clearing unusable counters
from the to-be-enabled mask instead of foisting the work on perf.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Link: https://patch.msgid.link/20260921191418.950933-8-seanjc@google.com
---
 arch/x86/events/intel/core.c      |  8 --------
 arch/x86/include/asm/perf_event.h |  1 -
 arch/x86/kvm/vmx/vmx.c            | 10 ++++++++--
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 87274b3..1bc96b9 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5390,14 +5390,6 @@ static struct perf_guest_switch_msr *intel_guest_get_m=
srs(int *nr,
 			  cpuc->intel_ctrl_exclude_host_mask;
=20
 	/*
-	 * Disable counters where the guest PMC is different than the host PMC
-	 * being used on behalf of the guest, as the PEBS record includes
-	 * PERF_GLOBAL_STATUS, i.e. the guest will see overflow status for the
-	 * wrong counter(s).
-	 */
-	guest_pebs_mask &=3D ~guest_pebs->cross_mapped_mask;
-
-	/*
 	 * FIXME: Allow guest and host usage of PEBS events to co-exist instead
 	 *        of disabling guest PEBS entirely if the host is using PEBS.
 	 *        What exactly goes wrong if guest and host are using PEBS is
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_ev=
ent.h
index 27f9c5b..5c92d43 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -823,7 +823,6 @@ struct x86_guest_pebs {
 	u64	enable;
 	u64	ds_area;
 	u64	data_cfg;
-	u64	cross_mapped_mask;
 };
 #if defined(CONFIG_PERF_EVENTS) && defined(CONFIG_CPU_SUP_INTEL)
 extern struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr,
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b097db2..8f7d062 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7369,8 +7369,14 @@ static void atomic_switch_perf_msrs(struct vcpu_vmx *v=
mx)
 		.data_cfg =3D pmu->pebs_data_cfg,
 	};
=20
-	if (pmu->pebs_enable & pmu->global_ctrl)
-		guest_pebs.cross_mapped_mask =3D intel_pmu_get_cross_mapped_mask(pmu);
+	/*
+	 * Disable counters where the guest PMC is different than the host PMC
+	 * being used on behalf of the guest, as the PEBS record includes
+	 * PERF_GLOBAL_STATUS, i.e. the guest will see overflow status for the
+	 * wrong counter(s).
+	 */
+	if (guest_pebs.enable & pmu->global_ctrl)
+		guest_pebs.enable &=3D ~intel_pmu_get_cross_mapped_mask(pmu);
=20
 	/* Note, nr_msrs may be garbage if perf_guest_get_msrs() returns NULL. */
 	msrs =3D perf_guest_get_msrs(&nr_msrs, &guest_pebs);

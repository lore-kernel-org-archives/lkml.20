Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD3F52FE21;
	Tue, 22 Sep 2026 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070408; cv=none; b=C+FuCgZvNdsq5XjLZ1BCQGgH/9vurPIsut0PgRmn4UE8UDSLVtkUJOspjKSdRYnoZOOyiAQLJJA9dWXFzv66cR4VyBMhUtMWfVpxDHPI1CNcsbPjwtp8u0LQF5NaR67PAFz7Qi7ivtxDEQbUclAEhrSfe5opeaUmn1QAopY3IU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070408; c=relaxed/simple;
	bh=u4EuQ8myYzhogC+ITAczzGmQR2MaSSz9INmdEDqU/rw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=nmxkS4WjfbcEZhu8G5a/yuFF/fBKoVz1e7OKU/0uXSOLMSO5Nyow1BxezExV3vLr2xasIVq8Pd1gO6ZB7XRPRcuOTYFa/LzkAH144PFXxlkcGz415aWgQAlipiUBo4TTzKJcyTKEpkAdQAu6P57Mx1MQqb9uqvLGFT5F1f53IwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MVeD4KHE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AR5n7LpS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MVeD4KHE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AR5n7LpS"
Date: Tue, 22 Sep 2026 09:46:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790070405;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LnHk2qXqYv7YlcpQM9JkjmLLWMY/21/8RFeRXYyE+rM=;
	b=MVeD4KHEExcbMOGhXGm4E6ODlJwP2qd+ptxg/F/YofJKoNSMMa1znA8RnfjQ9v3sNfxz+6
	SFPsVK3dKkd6o5UC3aOhH4EHdCh3VBiaJCxOa3Lp2izT3/Y9umNjgLBn6h9drQwXvhn0YJ
	1jKrT5MAYPa3BHo4ciHn3GrpB6f5E2B9Od3WoBVp5cnTmcRaouuB2negzcJ1D5TCGXxZ1L
	eBqZR3Pjrm7JAlyernQcdjEpex0PJTuAsR5WeXjoYWsPTYVFUC+JRdOkfU5OhTtZttV8ub
	fX/w0ZpsgDJu5YaU01cRR69txWPA7AFsAhi469+eOjrbn9BGh8H31ytkd+S3pw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790070405;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LnHk2qXqYv7YlcpQM9JkjmLLWMY/21/8RFeRXYyE+rM=;
	b=AR5n7LpSEUs29G1IDqEX5JUftHRmufZKxRmG/HCkFbQmtdQzcZT1+/dPRSK/Wu5rjTodg9
	pYrqoieqmd98x0Bg==
From: "tip-bot2 for Sean Christopherson" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/x86/intel: Don't write PEBS_ENABLED on
 host<=>guest xfers if CPU has PEBS isolation, to fix stuck PEBS_ENABLED
Cc: Sean Christopherson <seanjc@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260921191418.950933-3-seanjc@google.com>
References: <20260921191418.950933-3-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179007040333.2819794.6398148316303417519.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     4b64dbdc5861477f148e13d1ed127e7fe7182e4f
Gitweb:        https://git.kernel.org/tip/4b64dbdc5861477f148e13d1ed127e7fe71=
82e4f
Author:        Sean Christopherson <seanjc@google.com>
AuthorDate:    Mon, 21 Sep 2026 12:14:10 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 11:07:00 +02:00

perf/x86/intel: Don't write PEBS_ENABLED on host<=3D>guest xfers if CPU has P=
EBS isolation, to fix stuck PEBS_ENABLED

When filling the list of MSRs to be loaded by KVM on VM-Enter and VM-Exit,
*never* insert an entry for PEBS_ENABLED if the CPU properly isolates PEBS
events, in which case disabling counters via PERF_GLOBAL_CTRL is sufficient
to prevent unwanted PEBS events in the guest (or host).  Because perf loads
PEBS_ENABLE with the unfiltered cpu_hw_events.pebs_enabled, i.e. with both
host and guest masks, there is no need to load different values for the
guest versus host, perf+KVM can and should simply control which counters
are enabled/disabled via PERF_GLOBAL_CTRL.

Avoiding touching PEBS_ENABLED "fixes" a bug where PEBS_ENABLED can end up
with "stuck" bits if a PEBS event is throttled between generating the list
and actually entering the guest (Intel CPUs can't arbtitrarily block NMIs).
Fixes in quotes because leaving PEBS_ENABLED as-is doesn't fix the
underlying problem of perf (via PMIs) being able to modify state after the
perf<=3D>KVM handoff.

But not writing PEBS_ENABLED is desirable no matter what, as stating the
obvious, leaving PEBS_ENABLED as-is avoids three MSR writes on every VMX
transition: one each on entry/exit, and one more explicit WRMSR to zero
PEBS_ENABLED before VM-Entry (KVM assumes the only reason PEBS_ENABLED is
in the load list is if the CPU lacks PEBS isolation and thus needs a
quiescent period).

Opportunistically add comments to (better) explain the rules for generating
the set of PEBS counters that will be active while the guest is running,
along with a FIXME for the suspected hack-a-fix where perf disables guest
PEBS if _any_ PEBS event is configured to count in the host (commit
854250329c02 ("KVM: x86/pmu: Disable guest PEBS temporarily in two rare
situations") doesn't explain the motivation, at all).

Fixes: c59a1f106f5c ("KVM: x86/pmu: Add IA32_PEBS_ENABLE MSR emulation for ex=
tended PEBS")
Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Link: https://patch.msgid.link/20260921191418.950933-3-seanjc@google.com
---
 arch/x86/events/intel/core.c | 55 +++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 0400b51..5ac8fe3 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5292,12 +5292,15 @@ static struct perf_guest_switch_msr *intel_guest_get_=
msrs(int *nr, void *data)
 	struct kvm_pmu *kvm_pmu =3D (struct kvm_pmu *)data;
 	u64 intel_ctrl =3D hybrid(cpuc->pmu, intel_ctrl);
 	u64 pebs_mask =3D cpuc->pebs_enabled & x86_pmu.pebs_capable;
-	int global_ctrl, pebs_enable;
+	u64 guest_pebs_mask;
+	int global_ctrl;
=20
 	/*
 	 * In addition to obeying exclude_guest/exclude_host, remove bits being
 	 * used for PEBS when running a guest, because PEBS writes to virtual
-	 * addresses (not physical addresses).
+	 * addresses (not physical addresses).  If the guest wants to utilize
+	 * PEBS, and PEBS can be safely enabled in the guest, bits for the guest's
+	 * PEBS-enabled counters will be OR'd back in as appropriate.
 	 */
 	*nr =3D 0;
 	global_ctrl =3D (*nr)++;
@@ -5344,24 +5347,40 @@ static struct perf_guest_switch_msr *intel_guest_get_=
msrs(int *nr, void *data)
 		};
 	}
=20
-	pebs_enable =3D (*nr)++;
-	arr[pebs_enable] =3D (struct perf_guest_switch_msr){
-		.msr =3D MSR_IA32_PEBS_ENABLE,
-		.host =3D cpuc->pebs_enabled & ~cpuc->intel_ctrl_guest_mask,
-		.guest =3D pebs_mask & ~cpuc->intel_ctrl_host_mask & kvm_pmu->pebs_enable,
-	};
+	/*
+	 * Restrict guest PEBS events to counters that (a) perf supports, (b)
+	 * the guest wants to use for PEBS, (c) are not excluded from counting
+	 * in the guest, and (d) _are_ excluded from counting in the host.
+	 */
+	guest_pebs_mask =3D pebs_mask & intel_ctrl & kvm_pmu->pebs_enable &
+			  ~cpuc->intel_ctrl_host_mask &
+			  cpuc->intel_ctrl_guest_mask;
=20
-	if (arr[pebs_enable].host) {
-		/* Disable guest PEBS if host PEBS is enabled. */
-		arr[pebs_enable].guest =3D 0;
-	} else {
-		/* Disable guest PEBS thoroughly for cross-mapped PEBS counters. */
-		arr[pebs_enable].guest &=3D ~kvm_pmu->host_cross_mapped_mask;
-		arr[global_ctrl].guest &=3D ~kvm_pmu->host_cross_mapped_mask;
-		/* Set hw GLOBAL_CTRL bits for PEBS counter when it runs for guest */
-		arr[global_ctrl].guest |=3D intel_ctrl & arr[pebs_enable].guest;
-	}
+	/*
+	 * Disable counters where the guest PMC is different than the host PMC
+	 * being used on behalf of the guest, as the PEBS record includes
+	 * PERF_GLOBAL_STATUS, i.e. the guest will see overflow status for the
+	 * wrong counter(s).
+	 */
+	guest_pebs_mask &=3D ~kvm_pmu->host_cross_mapped_mask;
+
+	/*
+	 * FIXME: Allow guest and host usage of PEBS events to co-exist instead
+	 *        of disabling guest PEBS entirely if the host is using PEBS.
+	 *        What exactly goes wrong if guest and host are using PEBS is
+	 *        unknown.
+	 */
+	if (pebs_mask & ~cpuc->intel_ctrl_guest_mask)
+		guest_pebs_mask =3D 0;
=20
+	/*
+	 * Do NOT mess with PEBS_ENABLED.  As above, disabling counters via
+	 * PERF_GLOBAL_CTRL is sufficient, and loading a stale PEBS_ENABLED,
+	 * e.g. on VM-Exit, can put the system in a bad state.  Simply enable
+	 * counters in PERF_GLOBAL_CTRL, as perf load PEBS_ENABLED with the
+	 * full value, i.e. perf *also* relies on PERF_GLOBAL_CTRL.
+	 */
+	arr[global_ctrl].guest |=3D guest_pebs_mask;
 	return arr;
 }
=20

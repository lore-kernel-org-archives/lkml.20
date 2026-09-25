Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9C642A154;
	Fri, 25 Sep 2026 10:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333313; cv=none; b=HubKt0pPdu1/ENu/P+y/VXL8DH2nXAfH9Q2mgO4jp8Jw/rpzIvZ9DkgvrQ5bh43CWs4bLAmMAQuZ/kwKtvIHb9N5v2uNXF89zNcqUPrCE4FpwGcFSD9zjbTffVOygw2+PtZmz+MZ78BXfBetzSSrD2EQmYEYZ0nYSSTRhtMApUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333313; c=relaxed/simple;
	bh=78FHExcaQ8UgqzH6M3Jca+v2jNOMO2DaImtfqTtJtcA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=AJtXTGNew6eoxsQnAx8P3ksaAzd024NG+Cz3C5uxe3Sc89p1YzZDWsBYSMs+mz60jztZ0jyF9Y+5zeVjiFYGqDQegdC1bGBvu3KPk7d/7OtR/HhD//myowUFV8f2u/p3nCp71PcfiDtqz89JZbLUYnUxSK1YTdx9L5TNEWnJwdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XLxXOPzs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qnIeOS4l; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XLxXOPzs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qnIeOS4l"
Date: Fri, 25 Sep 2026 10:48:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333302;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=giIZUwU9jOfZbqcPFlB94RKxNtJSl/iw2XCUH247YQM=;
	b=XLxXOPzsDbejBPIJjN2a9OaxGNyy98a8MXTSzRJYPWxHDX2fvHEpHD8M4RQibFitavBtUd
	km5I5notccT/O4SiAI4IVVqMKbsRNSkUtOewmeVn3ivjeOO8TH62kpI7c+TY8kNKwzGS2E
	p37dYxlufDNBhbrIOX2D+m2czT+PHPixwQjlAc+M/DWVojHQHtSun8kDDGDsBgzbszY0/k
	BlwWCSf9GYD38JAFvtwszLesQR8Yf3mKzhF1kgO0DIyvTmf9rsILIt/iMW5xXRhaUuhwE2
	5rVPrvenYaEfXfZH5X2JrVFPqrf8LpFmdhtl6y6KJcXMt+NPy0SpAN9okwsxYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333302;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=giIZUwU9jOfZbqcPFlB94RKxNtJSl/iw2XCUH247YQM=;
	b=qnIeOS4l0NTm/oU0Qh4jv5gjt8KoQkIAn6C1dlKvP6beTV+Jjt9dgR/df1gZ6PVitG6I/+
	9f8hEtuTLlLBY+DQ==
From: "tip-bot2 for Sean Christopherson" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] KVM: VMX: Drop a redundant pmu->global_ctrl check
 when processing pebs_enable
Cc: Sean Christopherson <seanjc@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921191418.950933-9-seanjc@google.com>
References: <20260921191418.950933-9-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033330109.2819794.11602281884884071345.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     57c76478333012159b5cbec89527f925011cdefd
Gitweb:        https://git.kernel.org/tip/57c76478333012159b5cbec89527f925011=
cdefd
Author:        Sean Christopherson <seanjc@google.com>
AuthorDate:    Mon, 21 Sep 2026 12:14:16 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:53 +02:00

KVM: VMX: Drop a redundant pmu->global_ctrl check when processing pebs_enable

Drop a redundant check that a PMC is globally enabled when looking for
PEBS counters that are cross-mapped between the guest and the host.  The
for-loop explicitly iterates over pmu->global_ctrl, and since PEBS requires
PMU v2+, kvm_pmu_has_perf_global_ctrl() must be true, and thus
pmc_is_globally_enabled() is simply checking that the bit is set in
pmu->global_ctrl.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Link: https://patch.msgid.link/20260921191418.950933-9-seanjc@google.com
---
 arch/x86/kvm/vmx/pmu_intel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index a21e146..040b8e8 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -763,8 +763,7 @@ u64 intel_pmu_get_cross_mapped_mask(struct kvm_pmu *pmu)
 	host_cross_mapped_mask =3D 0;
=20
 	kvm_for_each_pmc(pmu, pmc, bit, (unsigned long *)&pmu->global_ctrl) {
-		if (!pmc_is_locally_enabled(pmc) ||
-		    !pmc_is_globally_enabled(pmc) || !pmc->perf_event)
+		if (!pmc_is_locally_enabled(pmc) || !pmc->perf_event)
 			continue;
=20
 		/*

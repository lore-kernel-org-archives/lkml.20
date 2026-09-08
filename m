Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEECE3D3486;
	Tue,  8 Sep 2026 20:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900713; cv=none; b=kszRTBOgLjURMdE6S4xB51b8XV6CPaWhWZU/4hVtKAxIGYxOIgS06SJZrFEr4rPF+HpxY/9irl/iVPlm7RmkdLeXGP4Xoc+Is5VDELlMsTtv5cLOFP7xEhVKGEjWR7hOrES4pjU8p5ZRbyxN4BEoHTWUhYNFOmSBya0Kmsuztt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900713; c=relaxed/simple;
	bh=yxqI3WVH4SWo0ThWcnwTNUQZanlmqJ9diGeSma93O0U=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=bdpt504zoPhIvu25ro16zGqkB1tvJx3puPN8Qr4COpRbRcB5qWlipPAFazdXfmr3HWEEs4W55TzQMGah/9VwbdQIFF9/vzZCyZzdyBFwpixCY/8HyvhhRs9osKJB0t1JK4pEUU9RHFwdltse2M8uzGp0Ov/tPoCS8OJBMW2KjJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ctl9vD+t; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c8SMHpGh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ctl9vD+t";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c8SMHpGh"
Date: Tue, 08 Sep 2026 20:51:48 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900709;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XpjIOax/NzOMvSFwUtgfBdtEHIeTlMFoRoryhJKGbjU=;
	b=ctl9vD+tDJluLLbXmvMkUPxtNpGEhoNPFhUzMZDzGUJXHO4pku7I3grC2Sut/w4G+oKdev
	tmAI6LGnx6y8z673wQZ/z85iPKG7LVfgSeIfXQVWG0hBv7fqKi6lNkS9OH9iuSIxD/2nqo
	sn0nbCu2QqesRcRliLkF5KwfIv4v4Zy/F4EnRwGcOxy7SZzwp4hMAJ6Cf6GDfeqU2pzQaT
	GwLDpmLqK8SMIuxe6TOwZibC9xF983+f5kCCnpH/Iw0sXUGYTWGcjkDXwhBZPx+betZbg8
	uPRv36wXqhWd2fFqRaTaF2zqfbHq+Yk71Fjwvz/WtKzHacrStoSYir/Q/YlQFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900709;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XpjIOax/NzOMvSFwUtgfBdtEHIeTlMFoRoryhJKGbjU=;
	b=c8SMHpGh3mGd2/QO9dQphqpF6zZA+viV06SyiDNO4j74MnRpMNxkq9n+Ib+TApJAg/do7E
	aNBao1hrYLngTUBg==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86/intel: Centralize
 PERF_PMU_CAP_EXTENDED_REGS updates
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-10-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-10-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890070806.623050.10937603354021833938.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     c09466807467860f4d92b05bd4ca7db96f654ed0
Gitweb:        https://git.kernel.org/tip/c09466807467860f4d92b05bd4ca7db96f6=
54ed0
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:17 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:42 +02:00

perf/x86/intel: Centralize PERF_PMU_CAP_EXTENDED_REGS updates

PERF_PMU_CAP_EXTENDED_REGS is currently updated in multiple paths:
intel_ds_pebs_init() and __intel_update_pmu_caps() for adaptive and
architectural PEBS. This split makes the capability flow harder to
reason about and is awkward for upcoming XSAVES-based SIMD register
sampling, which also needs consistent capability setup and validation.

Refactor the update logic into a single helper,
__intel_update_pmu_xregs_caps(), so adaptive and architectural PEBS
share one implementation.

Call this helper from intel_update_pmu_caps() to keep PMU capability
handling centralized in one place and avoid duplicated or conflicting
updates.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-10-dapeng1.mi@linux.int=
el.com
---
 arch/x86/events/intel/core.c | 16 ++++++++--------
 arch/x86/events/intel/ds.c   |  1 -
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index e412e28..44332ec 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -6162,11 +6162,14 @@ static inline bool intel_pmu_broken_perf_cap(void)
 	return false;
 }
=20
-static inline void __intel_update_pmu_caps(struct pmu *pmu)
+static inline void __intel_update_pmu_xregs_caps(struct pmu *pmu)
 {
 	struct pmu *dest_pmu =3D pmu ? pmu : x86_get_pmu(smp_processor_id());
+	u64 caps =3D hybrid(pmu, arch_pebs_cap).caps;
=20
-	if (hybrid(pmu, arch_pebs_cap).caps & ARCH_PEBS_VECR_XMM)
+	if ((x86_pmu.arch_pebs && (caps & ARCH_PEBS_VECR_XMM)) ||
+	    (!x86_pmu.arch_pebs && x86_pmu.intel_cap.pebs_format >=3D 4 &&
+	     x86_pmu.intel_cap.pebs_baseline))
 		dest_pmu->capabilities |=3D PERF_PMU_CAP_EXTENDED_REGS;
 }
=20
@@ -6238,12 +6241,10 @@ static void update_pmu_cap_from_perfmonext(struct pmu=
 *pmu)
 		hybrid(pmu, arch_pebs_cap).counters =3D pebs_mask;
 		hybrid(pmu, arch_pebs_cap).pdists =3D pdists_mask;
=20
-		if (WARN_ON((pebs_mask | pdists_mask) & ~cntrs_mask)) {
+		if (WARN_ON((pebs_mask | pdists_mask) & ~cntrs_mask))
 			x86_pmu.arch_pebs =3D 0;
-		} else {
-			__intel_update_pmu_caps(pmu);
+		else
 			__intel_update_large_pebs_flags(pmu);
-		}
 	} else {
 		WARN_ON(x86_pmu.arch_pebs =3D=3D 1);
 		x86_pmu.arch_pebs =3D 0;
@@ -6267,6 +6268,7 @@ static void intel_update_pmu_caps(struct pmu *pmu)
 		    hybrid_pmu(pmu)->pmu_type =3D=3D hybrid_big)
 			hybrid(pmu, intel_cap).perf_metrics =3D 1;
 	}
+	__intel_update_pmu_xregs_caps(pmu);
 }
=20
 static void intel_pmu_check_hybrid_pmus(struct x86_hybrid_pmu *pmu)
@@ -6420,8 +6422,6 @@ static void intel_pmu_cpu_starting(int cpu)
 		}
 	}
=20
-	__intel_update_pmu_caps(cpuc->pmu);
-
 	if (!cpuc->shared_regs)
 		return;
=20
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index d592a72..e18906a 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -3396,7 +3396,6 @@ static void __init intel_ds_pebs_init(void)
 				x86_pmu.flags |=3D PMU_FL_PEBS_ALL;
 				x86_pmu.pebs_capable =3D ~0ULL;
 				pebs_qual =3D "-baseline";
-				x86_get_pmu(smp_processor_id())->capabilities |=3D PERF_PMU_CAP_EXTENDED=
_REGS;
 			} else {
 				/* Only basic record supported */
 				x86_pmu.large_pebs_flags &=3D

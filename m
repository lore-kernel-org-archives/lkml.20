Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E5F3B8944;
	Tue,  8 Sep 2026 20:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900695; cv=none; b=LaKwdjDveW4TYxAskSWfj7xS0DB1C8y0SoaRz8mQrONQUXHVjfp7dnemV6S6FuW1BF5WUvnayteUrgT6p5tlQ6zxnw49mATRGM2wJgz+4ySuyVocGsYrfuAuoTYsnckdgFc5NZXB7svilC3F7wxkx9mjGNKg71JEp1YDkeL80Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900695; c=relaxed/simple;
	bh=vDPsPvH8sh3keDL2cm3YL5cL8UNz0NqkQRG1z+kYmSs=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=jlL8zGDTUxQdlO2FhZTIR5N8nUnBfp6oSB4B7JC56z0ohv7AEJ6yY93xt9ECMuyV04Gdgob4Q7I83JSazrbS/QzukxpfPqlknxsGd6tq+UjS8iUVOQDvzcSrZndcG75vvYe/jxWaQlNiT3/LNQcuZ0nN5vX6u/GoWMKxt1lVoZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=p4fVJ0Gq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hM34t/sV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="p4fVJ0Gq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hM34t/sV"
Date: Tue, 08 Sep 2026 20:51:30 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900691;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mZr+Fbo5F41TbouzkYpnaHfAdBZDD0pndJJ8/P7mdIk=;
	b=p4fVJ0GqNDUL/H08GfcdnOXntO42ikocuDRvJaxA5mWP4zzJwGa2OKY9bYZAClsWyq7eMg
	bDgMczsdt4VjFYW0oL0qq8bKHIZ8PBx3fF3XTYE1psSDZVKDx3JUXDcP09wNrRcNLlwFZl
	Pnnco4g7CesvkAVMe7cm75yiuxJRFq6yLOXXZ4nanDMNW66jR7UJPDf2L7aJRZVicuXjNo
	pHWYwIsDJLCLlnd/rqgOa1e+HorWSLq+CR7qaUbW5a60xZjRUBVXG/GwgI+DKAxFgSonxo
	l/WcfUegx3Vca+GBjhllEr8EoNouU0pk4KyvkqlFIlMx6qYA1Swse2QsdeBHtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900691;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mZr+Fbo5F41TbouzkYpnaHfAdBZDD0pndJJ8/P7mdIk=;
	b=hM34t/sVgsgSmiy3wClKPgG0r7PJJkgtwpDRtVOgPDo4Gkh7T8Fds5rONMXDP4lOnQw4pZ
	hK4tQZOSxIoWCjBw==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/core] perf/x86/intel: Advertise PERF_PMU_CAP_SIMD_REGS capability
Cc: Kan Liang <kan.liang@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-22-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-22-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890069007.623050.7377688771654111542.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     00cf8daabe2bfd45e7283e44ad7cb3977089259b
Gitweb:        https://git.kernel.org/tip/00cf8daabe2bfd45e7283e44ad7cb397708=
9259b
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:29 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:46 +02:00

perf/x86/intel: Advertise PERF_PMU_CAP_SIMD_REGS capability

Set PERF_PMU_CAP_SIMD_REGS once XSAVES-backed extended state beyond XMM
is available for sampling, e.g. YMM, ZMM, OPMASK, eGPRs, or SSP.

Keep backward compatibility unchanged. When only XMM sampling is
available, continue to expose only PERF_PMU_CAP_EXTENDED_REGS. Expose
PERF_PMU_CAP_SIMD_REGS only when additional SIMD/predicate register state
is supported.

Co-developed-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-22-dapeng1.mi@linux.int=
el.com
---
 arch/x86/events/intel/core.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index f873462..a919168 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -6204,7 +6204,27 @@ static inline void __intel_update_pmu_xregs_caps(struc=
t pmu *pmu)
 	 */
 	x86_pmu.ext_regs_mask |=3D XFEATURE_MASK_SSE;
=20
+	if (boot_cpu_has(X86_FEATURE_AVX) &&
+	    cpu_has_xfeatures(XFEATURE_MASK_YMM, NULL))
+		x86_pmu.ext_regs_mask |=3D XFEATURE_MASK_YMM;
+	if (boot_cpu_has(X86_FEATURE_APX) &&
+	    cpu_has_xfeatures(XFEATURE_MASK_APX, NULL))
+		x86_pmu.ext_regs_mask |=3D XFEATURE_MASK_APX;
+	if (boot_cpu_has(X86_FEATURE_AVX512F)) {
+		if (cpu_has_xfeatures(XFEATURE_MASK_OPMASK, NULL))
+			x86_pmu.ext_regs_mask |=3D XFEATURE_MASK_OPMASK;
+		if (cpu_has_xfeatures(XFEATURE_MASK_ZMM_Hi256, NULL))
+			x86_pmu.ext_regs_mask |=3D XFEATURE_MASK_ZMM_Hi256;
+		if (cpu_has_xfeatures(XFEATURE_MASK_Hi16_ZMM, NULL))
+			x86_pmu.ext_regs_mask |=3D XFEATURE_MASK_Hi16_ZMM;
+	}
+	if (cpu_feature_enabled(X86_FEATURE_USER_SHSTK) &&
+	    cpu_has_xfeatures(XFEATURE_MASK_CET_USER, NULL))
+		x86_pmu.ext_regs_mask |=3D XFEATURE_MASK_CET_USER;
+
 	dest_pmu->capabilities |=3D PERF_PMU_CAP_EXTENDED_REGS;
+	if (x86_pmu.ext_regs_mask > XFEATURE_MASK_SSE)
+		dest_pmu->capabilities |=3D PERF_PMU_CAP_SIMD_REGS;
 }
=20
 static inline void __intel_update_large_pebs_flags(struct pmu *pmu)

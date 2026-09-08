Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC9B3DAAC3;
	Tue,  8 Sep 2026 20:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900721; cv=none; b=qouvU15z+SrVTuihXEdza3j69ZQ09D56eCbSHDrLF6DC2T1mfYGgghysI1UrOCg+FGMI9kOb8XDV+dQi8sOXa/EGFXlhc6KbesySrVyGC4uUhOy4f5spyKXxDQFAF1JmQdwvbPlnUJiI3Ql+mBQ6+traKVnK0i8F48qYGwVDHQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900721; c=relaxed/simple;
	bh=DyD53dEsgl0XArLQdauqln3ystuKQY03cCY6Ozcu6aw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=SiUE77vbzxU/SE932OdmfHvMQl70nGY3cQEBgRlC9NpRUIXsMmEYWgIQQXjDXXsuKoVFVZ0d/1DBapkXJDjNGVlCXbs5miCV6CNGtfU2AufyygllykhU8eAqkqYC1GWeO/KTMznpMWfEGGqYBfa5vgRb/0ypi8v0mBrMkergRH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HyPF9XJg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3/V5/7FM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HyPF9XJg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3/V5/7FM"
Date: Tue, 08 Sep 2026 20:51:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900718;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jiYTR7QZCHxM5pYIVaxCo5E7W+HMgT3yhBwzp8mqS4I=;
	b=HyPF9XJgYGgC+r7oHmI2ItcfBofRLJtifMuggJzzLqPt9leB9VehBKs6njYmuWBSFagJh9
	Msy2yn20rdnu2QaWUehtr8KsKet1rCBsJVvhxVJi4M7N9P9I36XI2+rDBvFk3e+7Sjl+n3
	NKG+18RZe74owC3vaHH7FF2TiczmznDhmLvmmZHrMLqeIGAm8frajNsF23JSCJAdgoWW9H
	5J+k4md4QioZ0mqjagHAci+KR31PYHc07nwnH+ztaJ9KllB9KjKAl9jTwYGCNF8Ocy8x28
	HJ00SQerNgj1jxfYtYnwl2EFOffsTkxXXluEzSqgKmdNnpnxz6QaJm7wvduPIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900718;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jiYTR7QZCHxM5pYIVaxCo5E7W+HMgT3yhBwzp8mqS4I=;
	b=3/V5/7FMD+bWKUyiLF998UV0nEHVNf2nwmEd+EPisy4ogoDQT3MDPq+3zuZCXgTq5P7wBx
	VgeXNhB5p95l+VAw==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/core] perf/x86/intel: Convert x86_perf_regs to per-cpu variables
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-4-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-4-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890071666.623050.15454347972897214000.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     bbdf84fcedfa4f1e570e12e7657f7095f6e7d340
Gitweb:        https://git.kernel.org/tip/bbdf84fcedfa4f1e570e12e7657f7095f6e=
7d340
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:11 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:40 +02:00

perf/x86/intel: Convert x86_perf_regs to per-cpu variables

Currently, the drain_pebs() helpers, e.g., intel_pmu_drain_arch_pebs()
define an on-stack x86_perf_regs. Upcoming patches will add new fields
like *ymm_regs and *zmm_regs to the x86_perf_regs structure to support
sampling for these SIMD registers. This would increase the stack size
consumed by these helpers, potentially triggering the warning:

"the frame size of 1048 bytes is larger than 1024 bytes
 [-Wframe-larger-than=3D]".

To eliminate this warning, convert x86_perf_regs to per-cpu variables.

Please note drain_pebs() can't be interrupted by other NMIs since
either it's already in NMI context or PMU is already disabled.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-4-dapeng1.mi@linux.inte=
l.com
---
 arch/x86/events/intel/ds.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index 8940f02..d592a72 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -2917,6 +2917,8 @@ __intel_pmu_pebs_last_event(struct perf_event *event,
 	}
 }
=20
+static DEFINE_PER_CPU(struct x86_perf_regs, x86_pebs_regs);
+
 static __always_inline void
 __intel_pmu_pebs_events(struct perf_event *event,
 			struct pt_regs *iregs,
@@ -2926,8 +2928,8 @@ __intel_pmu_pebs_events(struct perf_event *event,
 			setup_fn setup_sample)
 {
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
-	struct x86_perf_regs perf_regs;
-	struct pt_regs *regs =3D &perf_regs.regs;
+	struct x86_perf_regs *perf_regs =3D this_cpu_ptr(&x86_pebs_regs);
+	struct pt_regs *regs =3D &perf_regs->regs;
 	void *at =3D get_next_pebs_record_by_bit(base, top, bit);
 	int cnt =3D count;
=20
@@ -3175,8 +3177,8 @@ static void intel_pmu_drain_pebs_icl(struct pt_regs *ir=
egs, struct perf_sample_d
 	void *last[INTEL_PMC_IDX_FIXED + MAX_FIXED_PEBS_EVENTS];
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
 	struct debug_store *ds =3D cpuc->ds;
-	struct x86_perf_regs perf_regs;
-	struct pt_regs *regs =3D &perf_regs.regs;
+	struct x86_perf_regs *perf_regs =3D this_cpu_ptr(&x86_pebs_regs);
+	struct pt_regs *regs =3D &perf_regs->regs;
 	struct pebs_basic *basic;
 	void *base, *at, *top;
 	u64 mask;
@@ -3226,8 +3228,8 @@ static void intel_pmu_drain_arch_pebs(struct pt_regs *i=
regs,
 	void *last[INTEL_PMC_IDX_FIXED + MAX_FIXED_PEBS_EVENTS];
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
 	union arch_pebs_index index;
-	struct x86_perf_regs perf_regs;
-	struct pt_regs *regs =3D &perf_regs.regs;
+	struct x86_perf_regs *perf_regs =3D this_cpu_ptr(&x86_pebs_regs);
+	struct pt_regs *regs =3D &perf_regs->regs;
 	void *base, *at, *top;
 	u64 mask;
=20

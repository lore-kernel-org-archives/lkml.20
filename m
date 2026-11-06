Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958623;
	b=igEYap/E+0WVe+LPs5CtYWvM1+V33fTKglIVfb/eS+sxTDtpBld1lFZZvhZsCzXTNWh/
	 xz1NQM8s8MGg2Qgl6DbiQfCkOn2bwFYObJj7OFR0q/0LD9YAyLDZHWGfX1b0fXIFiPKH0
	 75iwda8pGVzPAdPKTQZ/I3H5PWmza7qGsDTHZlqT61KpkvSx7hBjDKs1Lnd1GUFMdhqo5
	 xOJYBubcGjYK07iV/TRF69Sy55KzDXie2tSyav5BRHxqDtOnNzB2ztFbJRnvyNnUwttLn
	 jqDDfAEHYuYawp5zDcaQbtt48TayVJPeNX0y00Qtac7DuLuPxBQvnEI4q88mDkswSQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958623;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=NAKuvuZEzUVCw79xQcFqn2glQI+ubr72wYQP3xWIYHg=;
	b=Bk32WDh0qvCLJUbp9/XWwwV2O4QbIcp76JffY0FIsLYKyET9gjfzG5G0tysvmuaBC66I
	 GPTDAbmMsNgVCD8bFIMsL5eMZSGzqoH7eumqon3eKKKMESGdUpuTFSw3B8aBnr9GLzFR7
	 8GgeT1jKXUWm1ihuqxtxKmUYx/tBza97lB2fanr6wBF5UylUX33Ru399p5EmBw5JLHpZv
	 +UgozTlbOu5i1JNT5IMkrr2lFOCVQH5j3lrn2nj6/EGQPF0HGpV3EgY2A8qXlTQ8ALo4J
	 IRKu4kW6tGMnHjK4qjiDQj0KifpIpEJqVrBiRLz7S5NIu/TcnfILwviYHftGvrqtg/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="QGe/UCZq";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8BaXNb8X;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B15E606A328;
	Fri,  6 Nov 2026 09:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B15E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QGe/UCZq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8BaXNb8X
Date: Fri, 06 Nov 2026 09:50:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793958620;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NAKuvuZEzUVCw79xQcFqn2glQI+ubr72wYQP3xWIYHg=;
	b=QGe/UCZqczqRNU8DD79/641qxk4CHn9xcf3J9X0IRqeRqsyE2PuV3oEH/jHRgJhS97O5V6
	9O/s9xr3uQ4aKp9s4fiSj0u3bFG0dGrRZlZwF2E7wmt0UbgkKtucnN7WmAgEMS2sgsFlrz
	14TIsCOpz/OF8tpQBuyr3gi4CTDKFDzvLvvkCgT2naZVzvXa3ullz5pdIkCVqrPVLwKpzi
	vLugHBw1Ia1y4rOjNBjmhkE67WKwYg7LRuzkU26zQuXnhcF/Kx6jyicFfLbktTGKNottpw
	nt0cQwv9P3WTi/9y2yBxq00EQylO7k6gqwOdTloeTvMwmr5CpgK5jeuw3pQ69g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793958620;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NAKuvuZEzUVCw79xQcFqn2glQI+ubr72wYQP3xWIYHg=;
	b=8BaXNb8XkUCHHhrzfhldjVuTeC66iQSEuZ53Vz5d4hALkgMdsk49qcSjoh0rP9ixM5TTJr
	ggFk3OJfPqTSxrDA==
From: "tip-bot2 for Leo Yan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] Revert "perf/aux: Allocate non-contiguous AUX
 pages by default"
Cc: Leo Yan <leo.yan@arm.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, James Clark <james.clark@linaro.org>,
 Dev Jain <dev.jain@arm.com>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20261025-perf_revert_prefer_large_alloc-v1-1-5fb431bbd624@arm.com>
References:
 <20261025-perf_revert_prefer_large_alloc-v1-1-5fb431bbd624@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179395861895.1009794.8348264739147746810.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     526d945ad9c09d42f2482f058e1f41376681627e
Gitweb:        https://git.kernel.org/tip/526d945ad9c09d42f2482f058e1f4137668=
1627e
Author:        Leo Yan <leo.yan@arm.com>
AuthorDate:    Sun, 25 Oct 2026 16:24:06=20
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 09:50:37 +01:00

Revert "perf/aux: Allocate non-contiguous AUX pages by default"

This reverts commit 18049c8cff9cc89daadc4df6975f7d9069638926.

The original commit claimed that contiguous AUX pages unnecessarily
exacerbate fragmentation for SPE, TRBE and ETR. This is not generally
valid: larger allocations can keep pages with the same lifetime
together, while order-0 allocations can scatter them across large
blocks and prevent free pages from coalescing [1]. The follow-up
discussion [2] has not established how forcing order-0 allocations
addresses the reported problem.

TRBE and SPE write to virtually addressed buffers. The TRBE L1 TLB
has one entry on Neoverse V2 [3] and two on Neoverse V3 [4]. Small
mappings increase translation pressure, and TTW stalls can contribute
to FIFO overflow and trace loss on TRBE.

Larger allocations provide contiguous, aligned chunks for PMD or
contiguous-PTE mappings with the proposed vmap() support [5].
With the proposed vmap() support already applied, the tests in [2]
showed that preferring larger AUX allocations reduced L2 data TLB
refills by 99.68% in the TRBE test and 34.74% in the SPE test.

Restore the previous policy of trying higher-order allocations first.
The allocator already uses __GFP_NORETRY and falls back to smaller
orders, including order 0, when larger allocations fail.

Remove PERF_PMU_CAP_AUX_PREFER_LARGE, since the restored default
provides that preference. Intel PT retains its existing allocation
behaviour, with no functional change.

[1] https://lore.kernel.org/all/aPjrRkjiIt6HmXmT@casper.infradead.org/
[2] https://lore.kernel.org/linux-arm-kernel/20260810-perf_aux_trace_large_gr=
anule-v1-0-03306c9339e3@arm.com/
[3] https://documentation-service.arm.com/static/633fe1ec4c59b30b517730b8#pag=
e=3D52
[4] https://documentation-service.arm.com/static/67361bd2c7fc0d1f211da382#pag=
e=3D54
[5] https://lore.kernel.org/linux-mm/20260715120813.3609949-1-jiangwen6@xiaom=
i.com/

Signed-off-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: James Clark <james.clark@linaro.org>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Link: https://patch.msgid.link/20261025-perf_revert_prefer_large_alloc-v1-1-5=
fb431bbd624@arm.com
---
 arch/x86/events/intel/pt.c  |  2 --
 include/linux/perf_event.h  |  5 ++---
 kernel/events/ring_buffer.c | 29 +++++++++--------------------
 3 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
index 49349af..3782af4 100644
--- a/arch/x86/events/intel/pt.c
+++ b/arch/x86/events/intel/pt.c
@@ -1896,8 +1896,6 @@ static __init int pt_init(void)
=20
 	if (!intel_pt_validate_hw_cap(PT_CAP_topa_multiple_entries))
 		pt_pmu.pmu.capabilities =3D PERF_PMU_CAP_AUX_NO_SG;
-	else
-		pt_pmu.pmu.capabilities =3D PERF_PMU_CAP_AUX_PREFER_LARGE;
=20
 	pt_pmu.pmu.capabilities		|=3D PERF_PMU_CAP_EXCLUSIVE |
 					   PERF_PMU_CAP_ITRACE |
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 7884489..e1e1150 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -304,9 +304,8 @@ struct perf_event_pmu_context;
 #define PERF_PMU_CAP_AUX_OUTPUT		0x0080
 #define PERF_PMU_CAP_EXTENDED_HW_TYPE	0x0100
 #define PERF_PMU_CAP_AUX_PAUSE		0x0200
-#define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
-#define PERF_PMU_CAP_MEDIATED_VPMU	0x0800
-#define PERF_PMU_CAP_SIMD_REGS		0x1000
+#define PERF_PMU_CAP_MEDIATED_VPMU	0x0400
+#define PERF_PMU_CAP_SIMD_REGS		0x0800
=20
 /**
  * pmu::scope
diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index 64d4dbd..95f4fbd 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -684,15 +684,7 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_eve=
nt *event,
 {
 	bool overwrite =3D !(flags & RING_BUFFER_WRITABLE);
 	int node =3D (event->cpu =3D=3D -1) ? -1 : cpu_to_node(event->cpu);
-	bool use_contiguous_pages =3D event->pmu->capabilities & (
-		PERF_PMU_CAP_AUX_NO_SG | PERF_PMU_CAP_AUX_PREFER_LARGE);
-	/*
-	 * Initialize max_order to 0 for page allocation. This allocates single
-	 * pages to minimize memory fragmentation. This is overridden if the
-	 * PMU needs or prefers contiguous pages (use_contiguous_pages =3D true).
-	 */
-	int max_order =3D 0;
-	int ret =3D -ENOMEM;
+	int ret =3D -ENOMEM, max_order;
=20
 	if (!has_aux(event))
 		return -EOPNOTSUPP;
@@ -702,8 +694,8 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_even=
t *event,
=20
 	if (!overwrite) {
 		/*
-		 * Watermark defaults to half the buffer, to aid PMU drivers
-		 * in double buffering.
+		 * Watermark defaults to half the buffer, and so does the
+		 * max_order, to aid PMU drivers in double buffering.
 		 */
 		if (!watermark)
 			watermark =3D min_t(unsigned long,
@@ -711,19 +703,16 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_ev=
ent *event,
 					  (unsigned long)nr_pages << (PAGE_SHIFT - 1));
=20
 		/*
-		 * If using contiguous pages, use aux_watermark as the basis
-		 * for chunking to help PMU drivers honor the watermark.
+		 * Use aux_watermark as the basis for chunking to
+		 * help PMU drivers honor the watermark.
 		 */
-		if (use_contiguous_pages)
-			max_order =3D get_order(watermark);
+		max_order =3D get_order(watermark);
 	} else {
 		/*
-		 * If using contiguous pages, we need to start with the
-		 * max_order that fits in nr_pages, not the other way around,
-		 * hence ilog2() and not get_order.
+		 * We need to start with the max_order that fits in nr_pages,
+		 * not the other way around, hence ilog2() and not get_order.
 		 */
-		if (use_contiguous_pages)
-			max_order =3D ilog2(nr_pages);
+		max_order =3D ilog2(nr_pages);
 		watermark =3D 0;
 	}
=20

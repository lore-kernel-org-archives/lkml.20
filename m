Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706FF3EDE7C;
	Fri, 25 Sep 2026 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333302; cv=none; b=fRJ5QdJ4Is7MO2eusg6RAfHtNQ3gbKzM/68jod7E3RvFN8QfKW5GC7C6U7VdRW4mC1hviGYdRwQIhqIxRRUFzywWsodgtLzKWJoSfaROu761Ajf5vj3MP1oDL4FZYE6z0PtWVlligN2veR/pSjtExayYwK+R6CsKo+Nh8cUqA6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333302; c=relaxed/simple;
	bh=dCYyiXTafVpArRlSB10kVsaE63rH6Ulx49zQxk4KibM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=YM17JWlfHj8pycbbEZhR84ZPrZ4SEbKx+Dq3oke2TvKPFERLA7FZDvEeDhNGRlFIYBSHoUJqA1Gk5nT0Ir/spPRXtwFj4ijDvmgyQ/w1yPSaevpmML+rH/iByEJWSDabgOvHzwV4PMhsX0aMYltKU4D7DRlg1Lk+zyY49q74LYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SXBs8cwO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eKpL4qAa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SXBs8cwO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eKpL4qAa"
Date: Fri, 25 Sep 2026 10:48:14 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333296;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WltbbXD0VqwxiEUghdLrRiyzcWCOr9KYjUeeKzTZJ78=;
	b=SXBs8cwOv6rE9JqEiOt2nnSML5kn0xl1P1yag9cYpy7Ir1iHFkpB+NZW/9tcLe0C+SCNpW
	yVU+87UAd+1z+Lau3Q9g6g4BzztDW2Q0O7eyS2Me14zb94txVlBzRiHG0wYpEbDGshdIg0
	6xXxd0XXrbebK1/8W6/8pwfIjDTZ2eiV828KJjZE9gCgZ6puipdMbq7/FhRBkeQYB/lsof
	2SzY/sdDocwxysK7gsmJCfxCnz2tKXKe7t0MHDXcgbO+cL4RvTlwyMAGvN2mHHSeerhc6g
	BSD/AC1i6/Qe0MikFO2BZVczFcu3m1g/18nK4gJkh/zLpMRubi0+C47JR0ab+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333296;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WltbbXD0VqwxiEUghdLrRiyzcWCOr9KYjUeeKzTZJ78=;
	b=eKpL4qAaDB7KeyNl0rzmCBymjv6CgCOvDJcbZ3DK7y9uaL4YpisKACH6l7PwsV5LZjgcEJ
	wQt04IZ1j2ka9RAg==
From: "tip-bot2 for Usama Arif" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86/amd/uncore: Free counter slot by index
Cc: Usama Arif <usama.arif@linux.dev>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Sandipan Das <sandipan.das@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921153108.2713179-3-usama.arif@linux.dev>
References: <20260921153108.2713179-3-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033329484.2819794.3713465503109198542.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     6350de8671b94afb7691d110f63bcda42f658a69
Gitweb:        https://git.kernel.org/tip/6350de8671b94afb7691d110f63bcda42f6=
58a69
Author:        Usama Arif <usama.arif@linux.dev>
AuthorDate:    Mon, 21 Sep 2026 08:30:15 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:55 +02:00

perf/x86/amd/uncore: Free counter slot by index

amd_uncore_del() scans ctx->events[] from slot zero and attempts a
compare-exchange until it finds the event.

amd_uncore_add() records the slot it claimed in event->hw.idx. Perf
calls ->del() only after a successful ->add(), and the driver never
moves an installed event between slots. The index therefore remains
valid until deletion.

Use the recorded index directly and retain the compare-exchange
ownership check. Warn if it fails, as that means the driver lost track
of the slot.

Deleting all events from a full PMU with N counters now requires N
compare-exchanges instead of N * (N + 1) / 2.

On a host running a production workload in the Meta fleet, amd_uncore_del()
was called 56,575 times per second from mux rotation.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Sandipan Das <sandipan.das@amd.com>
Link: https://patch.msgid.link/20260921153108.2713179-3-usama.arif@linux.dev
---
 arch/x86/events/amd/uncore.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
index c1158f3..7aa5a5b 100644
--- a/arch/x86/events/amd/uncore.c
+++ b/arch/x86/events/amd/uncore.c
@@ -246,19 +246,15 @@ out:
=20
 static void amd_uncore_del(struct perf_event *event, int flags)
 {
-	int i;
 	struct amd_uncore_pmu *pmu =3D event_to_amd_uncore_pmu(event);
 	struct amd_uncore_ctx *ctx =3D *per_cpu_ptr(pmu->ctx, event->cpu);
 	struct hw_perf_event *hwc =3D &event->hw;
+	struct perf_event *old =3D event;
=20
 	event->pmu->stop(event, PERF_EF_UPDATE);
=20
-	for (i =3D 0; i < pmu->num_counters; i++) {
-		struct perf_event *tmp =3D event;
-
-		if (try_cmpxchg(&ctx->events[i], &tmp, NULL))
-			break;
-	}
+	/* ->del() follows a successful ->add(), so hwc->idx owns this slot. */
+	WARN_ON_ONCE(!try_cmpxchg(&ctx->events[hwc->idx], &old, NULL));
=20
 	hwc->idx =3D -1;
 }

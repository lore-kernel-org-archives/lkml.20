Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2018A41BA62;
	Thu, 10 Sep 2026 09:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030928; cv=none; b=SBHa7u+i8RFE7kmj+YQsW5IuL4WHJOzQEoBONP/BfB4kFuQ8YlEv6lyR4C1tkf2llcuK1MW11pBB2UUDPlODWyYmYxv8tYC+LwLgbBXrS63tI3T15mjAap7ZAxAD06FO2sRU3k5R7O3SSQHTj+fw733j37ARUoDdJhVYkdOe3sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030928; c=relaxed/simple;
	bh=+mJ52qKXP6hDuXm5eIYHJKu/sLZE0jSfda7KESf4GrM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=A9MLw2EIidjUcwwgUU9Xap9j8eK0K5wOTCUUIiIz7IabOIAXc/NJhvAGzfyp8/noee6kv1WKjffTxwCySxE5HNNQXiXqmDQOxvjlESG28LOrsR4WMFS2ZI9PXuR5Y7Y4QxjaxNIagjDayNwFOamn/otN73YlFuFCCsXFajFfC9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GTFx2GUw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wVGWqKhw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GTFx2GUw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wVGWqKhw"
Date: Thu, 10 Sep 2026 09:01:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789030917;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1DbE09Fy9wC+J806+srxVMo1ocfHQbHxxHyyX30d+I=;
	b=GTFx2GUwcjXk5Q5d2JoLa6awV2a6Ljjz7EELW00mB1sDvA19R7/a14GtllzJ53EuEdAOvj
	HEwcZwGzd5VfjCBLyRZONn43htC67y6BtzggKHS5KWGOxSj3b13BVswFOAVuIQszKnX3PX
	W3SapDEnTR/nnwaIVoz6qOF1Y5nozg0tVP5I/bp9PWJh/yPy7lrCFq/AMBLxlHZlq3/dtL
	FUArD0Qpx2OMu0glb+l2xumTvF6T3G6JcPJLGvSUabBqCvU1QgXP3Go1WYCPnxuUFPzOfj
	EMJHQqp2WSTFVkQbVYBPdQeGenD8fR9HdDt0n9i42wc9wSXSkXEzRqPYyHIT0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789030917;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1DbE09Fy9wC+J806+srxVMo1ocfHQbHxxHyyX30d+I=;
	b=wVGWqKhwNL76FbJpQ2W182mb7JBXbr1hL7ekshnhsyhsP+PGkoO6ng2O1N3CUENJTsNom8
	Th1cfSEam8RGqyAg==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/x86/intel: Correct pt_regs->flags update for
 PEBS path
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260908075102.540715-1-dapeng1.mi@linux.intel.com>
References: <20260908075102.540715-1-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178903091589.623050.3795015000882992080.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     88aa1223bfffb1a0a98c639e9e1f71058f0d9178
Gitweb:        https://git.kernel.org/tip/88aa1223bfffb1a0a98c639e9e1f71058f0=
d9178
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Tue, 08 Sep 2026 15:51:01 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 10 Sep 2026 10:22:50 +02:00

perf/x86/intel: Correct pt_regs->flags update for PEBS path

pt_regs->flags holds the saved CPU FLAGS register. In the PEBS path,
it was incorrectly set to PERF_EFLAGS_EXACT instead of being populated
from the PEBS flags snapshot.

Update pt_regs->flags from PEBS GPR flags if GPRs group is present.

Fixes: c22497f5838c ("perf/x86/intel: Support adaptive PEBS v4")
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260908075102.540715-1-dapeng1.mi@linux.intel=
.com
---
 arch/x86/events/intel/ds.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index 8940f02..d0bb767 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -2432,7 +2432,7 @@ static inline void __setup_pebs_basic_group(struct perf=
_event *event,
 {
 	/* The ip in basic is EventingIP */
 	set_linear_ip(regs, ip);
-	regs->flags =3D PERF_EFLAGS_EXACT;
+	regs->flags |=3D PERF_EFLAGS_EXACT;
 	setup_pebs_time(event, data, tsc);
=20
 	if (sample_type & PERF_SAMPLE_WEIGHT_STRUCT)
@@ -2444,9 +2444,17 @@ static inline void __setup_pebs_gpr_group(struct perf_=
event *event,
 					  struct pebs_gprs *gprs,
 					  u64 sample_type)
 {
+	/*
+	 * Update flags with PEBS data. PERF_EFLAGS_EXACT must be set
+	 * in previous basic group handling.
+	 */
+	regs->flags =3D gprs->flags | PERF_EFLAGS_EXACT;
+
 	if (event->attr.precise_ip < 2) {
 		set_linear_ip(regs, gprs->ip);
 		regs->flags &=3D ~PERF_EFLAGS_EXACT;
+	} else if (regs->flags & X86_VM_MASK) {
+		regs->flags ^=3D (PERF_EFLAGS_VM | X86_VM_MASK);
 	}
=20
 	if (sample_type & (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER))

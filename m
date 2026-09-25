Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13E441D4F1;
	Fri, 25 Sep 2026 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333304; cv=none; b=pEb37hhatWRjjC8RbAKOlZhbV3tAZPnaxT9OdhLCJ3htoSpZXKY66HobL0gBuDAHZIYsr5ECc8Aa/fB1B0VSYe6q+yQuYMMnSbVyVCf7wlcmGJ2Q98TsjvfsL0oIXSwUAPS1pkSE+EVBihi2Qzow8aqrEyFuMzSbJodMVK4W4Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333304; c=relaxed/simple;
	bh=KGo7SAYRHPHlkw27eSuwfkyHEaUUBf2ABWvQHs8PDl8=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=qHRzuP1lWx0uF5z90y4+Nic7bnVEKJZ3cKUldBjoCy8nXL/L+gCH+ml3YTp8DMEx5BiRIU+qkQUUk4AGKAt7een8HPeR/iQC75V6LJuHLRFyk4eIwBaqvLNimDEFf4n/y0V0axkzHOyInkqHT4hiYHSMfICOxnVtNQ9VTS3cx+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z8lyXnME; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W8MeZEpP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z8lyXnME";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W8MeZEpP"
Date: Fri, 25 Sep 2026 10:48:17 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333299;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mlvuBuyPAV89o0t7C//wOhowCho/F7g49Aje4jFyPmA=;
	b=z8lyXnMEbv3J/WQFAMuHsMhVBqLUWxZiiAZrr6YFNjqOI/wEpC+3yhN5FarmxDAjP1Ellz
	XMS1Y0oBe+t+ecPmb6lmTlbKQMUwMKG3pqS/HUQSDwjXUPaChLdwuOYsSdfhZydSlKWU7v
	tu/ClHWRpRJqLLvFdaOQt/FA3xrb8VpMrcd5XUQpDNGaW2hDRw+7d0bCf6Mpy9ndjx7lEV
	SqPR+KCWWHqjklvb8XDmZX3iz4pbL5mBn3C5LhlPmR6PqHJaKEZZb5NkNzLZGY0hpdPSiA
	JuE5+31GgKsz5AY5Y48cqvA2wNjAXrfD5O8Xx1MSdp4bFQZ1JMSfu8d94f9zzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333299;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mlvuBuyPAV89o0t7C//wOhowCho/F7g49Aje4jFyPmA=;
	b=W8MeZEpPQNqqWRvYOBd4IDmsiILWyvrZKj8t1lFnc/GMl7+OIjwxsATJdXv54BoXE4yIQ8
	Ek+HY05c/7Jb29Dw==
From: "tip-bot2 for Sean Christopherson" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86/intel: Check only PMC bits in PEBS_ENABLED
 when detecting host PEBS usage
Cc: Sashiko Bot <sashiko-bot@kernel.org>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921191418.950933-11-seanjc@google.com>
References: <20260921191418.950933-11-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033329777.2819794.6781609752464469695.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     ba29babd881e09a7bb8b01fcfeda3d637d8115c5
Gitweb:        https://git.kernel.org/tip/ba29babd881e09a7bb8b01fcfeda3d637d8=
115c5
Author:        Sean Christopherson <seanjc@google.com>
AuthorDate:    Mon, 21 Sep 2026 12:14:18 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:54 +02:00

perf/x86/intel: Check only PMC bits in PEBS_ENABLED when detecting host PEBS =
usage

When checking to see if guest PEBS usage should be disabled due to host
PEBS usage, filter out non-counter bits in PEBS_ENABLE to avoid getting
false positives in the unlikely scenario that "Enable Precise Store" is
enabled without PEBS actually being active for any PMCs.

Note, the other "hidden" usage of pebs_mask is already explicitly masked
with intel_ctrl:

  .guest =3D intel_ctrl & ~cpuc->intel_ctrl_exclude_guest_mask & ~pebs_mask,

I.e. removing the non-counter bits from pebs_mask doesn't change the value
that is loaded into arr[global_ctrl].guest.

Fixes: 854250329c02 ("KVM: x86/pmu: Disable guest PEBS temporarily in two rar=
e situations")
Closes: https://lore.kernel.org/all/20260508234018.F06AEC2BCB0@smtp.kernel.org
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Suggested-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Link: https://patch.msgid.link/20260921191418.950933-11-seanjc@google.com
---
 arch/x86/events/intel/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 1bc96b9..0a34d67 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5333,7 +5333,7 @@ static struct perf_guest_switch_msr *intel_guest_get_ms=
rs(int *nr,
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
 	struct perf_guest_switch_msr *arr =3D cpuc->guest_switch_msrs;
 	u64 intel_ctrl =3D hybrid(cpuc->pmu, intel_ctrl);
-	u64 pebs_mask =3D cpuc->pebs_enabled & x86_pmu.pebs_capable;
+	u64 pebs_mask =3D intel_ctrl & cpuc->pebs_enabled & x86_pmu.pebs_capable;
 	u64 guest_pebs_mask;
 	int global_ctrl;
=20
@@ -5385,7 +5385,7 @@ static struct perf_guest_switch_msr *intel_guest_get_ms=
rs(int *nr,
 	 * the guest wants to use for PEBS, (c) are not excluded from counting
 	 * in the guest, and (d) _are_ excluded from counting in the host.
 	 */
-	guest_pebs_mask =3D pebs_mask & intel_ctrl & guest_pebs->enable &
+	guest_pebs_mask =3D pebs_mask & guest_pebs->enable &
 			  ~cpuc->intel_ctrl_exclude_guest_mask &
 			  cpuc->intel_ctrl_exclude_host_mask;
=20

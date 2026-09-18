Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969554398EE;
	Fri, 18 Sep 2026 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727235; cv=none; b=N4WIRa7V+li35y9L/eP9m33T+U8eoTiqtQ5uJQtraofQlbOfo9QgenOEX4Wf2Wj6D2oel7yeMEjOq+Oztcx2LODYmkOdGJfd3Dc7l7PPks2JqIAicaqyknnOW/5fmj+txT3y9PGDtamU5B/NlpEWLnY0Ej6Yso9KliEdkU/DUxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727235; c=relaxed/simple;
	bh=pny9G3Y4EVaeCbsTOl12Dfznh7BpC/pWbYBOBdGosPI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Ke0SCPT78SpLecRpuURqsArrIzpocF9BIL2B8rO4R+a1j+y8Mg+yEjigH3K7XJeTTE0fEMnt07GfxuY4fprJRUX2eYFvnmkY8/SDj/keLtSpaAXWFFXYfxiR8EihByPPVZELxto8l4UGDZvRwK368nnTbrsvHJsoLRWMrM2+Kps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xgsoK0M1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SWaGTayj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xgsoK0M1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SWaGTayj"
Date: Fri, 18 Sep 2026 10:27:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789727230;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=im7sl8/u/U/l5frklr8klTSRJ6g9FHokLMVmPyvyPWQ=;
	b=xgsoK0M1R6CwO6OE3+f/0dTJrOg5RGtoQw8yy5c6AijNX23mcUefSjQHKglcJ2/ZoyEula
	mK0uuM0dxsRCiimN1Uphke6eVDHzPpXoAqJG6UwS8pFzRsXSWNvKa5CEqGy6cPCKhLE5Vo
	Q31OBeVVJn8bkNCQw7bcCMM0A/7z8FAa4l1BUwcbQctLco9TtGdSKQoIK14syLjFWvdvDQ
	zTfsBNd3jKCFdnoJqaV6qeQzP9fO5wt3Ucv6sbzFKQc1Tn+HhMv98lR+EpaavdKhLIyCBR
	V39gNEjyS4xxNcFRcfwulgBPi8UZM4bd/FNc4weBB5YH4EL6zypz9X/IWp62Ng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789727230;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=im7sl8/u/U/l5frklr8klTSRJ6g9FHokLMVmPyvyPWQ=;
	b=SWaGTayjac7OsjNoqI35tc9VImQPByJCnRL++jXRAhSCCZpcyQTOjbFoXWpuT0sjvjND54
	7qBODshZyOMOWUAA==
From: "tip-bot2 for Vinay Belgaumkar" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/urgent] perf: Fix null pointer access in is_include_guest_event()
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904181625.1394082-1-vinay.belgaumkar@intel.com>
References: <20260904181625.1394082-1-vinay.belgaumkar@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972722836.1720534.7916727098003717090.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     88aed0422f39b22406f35f1e758cea25e7bbcfb5
Gitweb:        https://git.kernel.org/tip/88aed0422f39b22406f35f1e758cea25e7b=
bcfb5
Author:        Vinay Belgaumkar <vinay.belgaumkar@intel.com>
AuthorDate:    Fri, 04 Sep 2026 11:16:24 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 18 Sep 2026 12:19:43 +02:00

perf: Fix null pointer access in is_include_guest_event()

A typical module unload occurring event when there is an active perf
connection leads to freeing of the pmu pointer. The call log is something
like:
 ..
 __pmu_detach_event
 pmu_detach_event
 pmu_detach_events
 perf_pmu_unregister
 ..

__pmu_detach_event() sets event->pmu to null. When the perf connection
finally is closed, the following stack trace is observed:

 Oops: general protection fault, kernel NULL pointer dereference
 ...
 RIP: 0010:_free_event+0x3e/0x370
 ...
 Call Trace:
 ...
 perf_event_release_kernel+0x260/0x2d0
 perf_release+0x12/0x20

A call to mediated_pmu_unaccount_event() inside _free_event() is the root
cause of this crash. Adding a check inside is_include_guest_event() ensures
we don't accidentally access a null pmu ptr. In addition to this, we will
now call mediated_pmu_unaccount_event() before clearing the pmu ptr so that
nr_include_guest_events counts are maintained correctly.

Fixes: eff95e170275 ("perf: Add APIs to create/release mediated guest vPMUs")
Assisted-by: Claude:Claude-Sonnet-5
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Link: https://patch.msgid.link/20260904181625.1394082-1-vinay.belgaumkar@inte=
l.com
---
 kernel/events/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index fe33fe1..db7b76d 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6350,6 +6350,9 @@ static DEFINE_MUTEX(perf_mediated_pmu_mutex);
 /* !exclude_guest event of PMU with PERF_PMU_CAP_MEDIATED_VPMU */
 static inline bool is_include_guest_event(struct perf_event *event)
 {
+	if (!event->pmu)
+		return false;
+
 	if ((event->pmu->capabilities & PERF_PMU_CAP_MEDIATED_VPMU) &&
 	    !event->attr.exclude_guest)
 		return true;
@@ -13002,6 +13005,7 @@ static void __pmu_detach_event(struct pmu *pmu, struc=
t perf_event *event,
 	exclusive_event_destroy(event);
 	module_put(pmu->module);
=20
+	mediated_pmu_unaccount_event(event);
 	event->pmu =3D NULL; /* force fault instead of UAF */
 }
=20

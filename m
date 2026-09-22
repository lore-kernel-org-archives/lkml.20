Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78DC4D37DD;
	Tue, 22 Sep 2026 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070388; cv=none; b=Q7/k/mREUqdaFbpa+wa/PmUdZP1X9ykXQLPxKJ7X5/AzIRiPSXSwAjKrqrV8+PMhJhNZHb8+29xnNeyNfLE20oXSwmQWSs+iYnX/tyu4STbQl3HAn3Wgn7Byg4EgbedZRcQDnzmQhv7SdF4SWPGpKacHxuVoRSdDEzmILha+8SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070388; c=relaxed/simple;
	bh=f92gd1KIoGOGncrjsuRW/cJeqbFK1x8YdQJwB8BbviE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=bouibZwCAxPTYGyE5y7B2WF82aP6KFGsIbUVxNql4uktlEkP+J8facKrZROMrjBa4cJVdXVhqG+NRgsjNs0YC64mzPBlRPWsHmDQoZ6Qb7Rp9iFi+jEjB1WmvJbL0duQDH8V/awh+ZEAJ89SGXjLP6SLAHKAYy2GIyvK6CqfMqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=34ajk+dU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ycUZQGBj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="34ajk+dU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ycUZQGBj"
Date: Tue, 22 Sep 2026 09:46:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790070383;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xhzjd9PnIW2PsreNN1yoqW4Qq/sSRe+LDT597GpHz2g=;
	b=34ajk+dUi8yoRP7KjR44/uSHUnkbJWj1NOtmwX9P5pNpU9zuRV2wCfo0qa8j9wU/ySnm85
	WdzSWafw66kGQ/76XNbgLKfC0DX7am3NPMkLh+7HMvN7wFIUqY+avEDLStl+Rlv+bn9rB0
	M37gYqcLNUVGoal2F0DcIwv//zFERFBDSK+1WLHSFVHOAhP7NQ2k2f+Vthu2Wj4qNXTZb4
	TGEF3Vdl8Uu0KI0MjSU/5pR1EeF5jLZ6JRiXMtdiqLDoFiniT14+10isozdGMvcjEBhoFR
	ktA3nKvRVxtzIs3eXadQej54F+KclUeJbjxId5IPMm+xkxbRSpFgyczL5irY3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790070383;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xhzjd9PnIW2PsreNN1yoqW4Qq/sSRe+LDT597GpHz2g=;
	b=ycUZQGBjN7UN1EVY5iQUboCM75FnFDid2rtPmE22L2QOkmZEEa/28WpwXzPYBZVrIyHh4n
	TkPSymDrpiS6CoAA==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/x86/intel: Rename NVL offcore_rsp attribute
 to offmodule_rsp
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260917015234.981153-13-dapeng1.mi@linux.intel.com>
References: <20260917015234.981153-13-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179007038199.2819794.1960252155196219959.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     d4d9ccbad527af115b8e83a7a2b74785c0e8dfea
Gitweb:        https://git.kernel.org/tip/d4d9ccbad527af115b8e83a7a2b74785c0e=
8dfea
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Thu, 17 Sep 2026 09:52:34 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 11:38:17 +02:00

perf/x86/intel: Rename NVL offcore_rsp attribute to offmodule_rsp

NVL introduces Offmodule Response events in place of the legacy
Offcore Response events, but it still exposes the inherited
offcore_rsp PMU attribute for programming the corresponding MSR data.

Rename the NVL PMU attribute to offmodule_rsp so the sysfs interface
matches the underlying event name and avoids user & tooling confusion.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260917015234.981153-13-dapeng1.mi@linux.inte=
l.com
---
 arch/x86/events/intel/core.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 3843dbe..3ef8088 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -7530,6 +7530,7 @@ static struct attribute *adl_hybrid_tsx_attrs[] =3D {
 FORMAT_ATTR_HYBRID(in_tx,       hybrid_big);
 FORMAT_ATTR_HYBRID(in_tx_cp,    hybrid_big);
 FORMAT_ATTR_HYBRID(offcore_rsp, hybrid_big_small_tiny);
+FORMAT_ATTR_HYBRID(offmodule_rsp, hybrid_big_small_tiny);
 FORMAT_ATTR_HYBRID(ldlat,       hybrid_big_small_tiny);
 FORMAT_ATTR_HYBRID(frontend,    hybrid_big);
=20
@@ -7568,6 +7569,23 @@ static struct attribute *mtl_hybrid_extra_attr[] =3D {
 	NULL
 };
=20
+static struct attribute *nvl_hybrid_extra_attr_rtm[] =3D {
+	ADL_HYBRID_RTM_FORMAT_ATTR,
+	FORMAT_HYBRID_PTR(offmodule_rsp),
+	FORMAT_HYBRID_PTR(ldlat),
+	FORMAT_HYBRID_PTR(frontend),
+	FORMAT_HYBRID_PTR(snoop_rsp),
+	NULL
+};
+
+static struct attribute *nvl_hybrid_extra_attr[] =3D {
+	FORMAT_HYBRID_PTR(offmodule_rsp),
+	FORMAT_HYBRID_PTR(ldlat),
+	FORMAT_HYBRID_PTR(frontend),
+	FORMAT_HYBRID_PTR(snoop_rsp),
+	NULL
+};
+
 static bool is_attr_for_this_pmu(struct kobject *kobj, struct attribute *att=
r)
 {
 	struct device *dev =3D kobj_to_dev(kobj);
@@ -8842,7 +8860,7 @@ __init int intel_pmu_init(void)
 		mem_attr =3D mtl_hybrid_mem_attrs;
 		tsx_attr =3D adl_hybrid_tsx_attrs;
 		extra_attr =3D boot_cpu_has(X86_FEATURE_RTM) ?
-			mtl_hybrid_extra_attr_rtm : mtl_hybrid_extra_attr;
+			nvl_hybrid_extra_attr_rtm : nvl_hybrid_extra_attr;
=20
 		/* Initialize big core specific PerfMon capabilities.*/
 		pmu =3D &x86_pmu.hybrid_pmu[X86_HYBRID_PMU_CORE_IDX];

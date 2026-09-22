Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33704D4895;
	Tue, 22 Sep 2026 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070388; cv=none; b=DI3m6kwRzpp687L9j366pagkaHNEdXNyU6mEnrlPtBagrvu7slng22NqxWs9oucCAB+uEa2xV/zMf4sOACzAc4YH4cuakWQ5y4FtiRaTUTgvG86R82s4OxBUHQTG1WEwPbKtBuQNh2491dfIHOwK0TqjUXH6eTzdVpX886IX0a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070388; c=relaxed/simple;
	bh=CzbxccdV9DtM9xkqEDC/35JgXKSCheHavYYrSBtNcus=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=XfvOg1zfVu6gHJIWSf3NEM3ep4AY/VJS4JVToYGdse6aMucDjyC6IXN92Re/1kheARfOKDZEWZ4KKk7Wnqj0X6HoQnLlkIyddO6rVM6rvn/Itdg3e/VQy9s0l1a9PEhgpEcy13sbr0qvUiXlrMgd6gBj9a4U38E1hlyg6Hau2lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pgytekXj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3EXx8mdG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pgytekXj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3EXx8mdG"
Date: Tue, 22 Sep 2026 09:46:23 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790070385;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgSna7e0ViSE/qVQRre1S+Ft6yDwIO+N2TCvS0VzZ9I=;
	b=pgytekXjy2SmY16RYuxSudIn+39J1t/FM7JnqUmrE+180voQ1UTgGUrCzwXlBusOrzUaPs
	LLs/T781by9Y07bJz3q6AKvRGD1OLRdC5Rx/XWdO80OOF+T6ILei/IfHiSkhU62gblHDZd
	0AF1+ITgWEqS/rAxYcxTtZy0AtMpPLl+5UlnoeM18rKb7DSQHO2U9CWatR4zv+XoCUzOhk
	nvX80rqjqgdFeY4MxB/ZyDNQk67EYlgJMoOWSCnM+A0MljLBztH3gB64nxxhgL/KDaKvyj
	pZ3c2G65J976SQb4nfrys3R1ekt0Z5Apee7Rp09xGhgVQJ9GEY6lEzKteEyb+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790070385;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgSna7e0ViSE/qVQRre1S+Ft6yDwIO+N2TCvS0VzZ9I=;
	b=3EXx8mdGSTZnZ5tS4SFty53Mka3X04AJXS6qWL4qCAeqD82eAlE1S2KIfc1SDD3oo+Jq1b
	UbQFJoombThImMBg==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/x86/intel: Rename DMR offcore_rsp attribute
 to offmodule_rsp
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260917015234.981153-12-dapeng1.mi@linux.intel.com>
References: <20260917015234.981153-12-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179007038351.2819794.7267033618209092060.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     0102c8c7fdfc4bd700971daff2b94470f4eafae4
Gitweb:        https://git.kernel.org/tip/0102c8c7fdfc4bd700971daff2b94470f4e=
afae4
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Thu, 17 Sep 2026 09:52:33 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 11:37:46 +02:00

perf/x86/intel: Rename DMR offcore_rsp attribute to offmodule_rsp

DMR introduces Offmodule Response events in place of the legacy
Offcore Response events, but it still exposes the inherited
offcore_rsp PMU attribute for programming the corresponding MSR data.

Rename the DMR PMU attribute to offmodule_rsp so the sysfs interface
matches the underlying event name and avoids user & tooling confusion.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260917015234.981153-12-dapeng1.mi@linux.inte=
l.com
---
 arch/x86/events/intel/core.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 2271560..3843dbe 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -6601,6 +6601,8 @@ static void intel_pmu_filter(struct pmu *pmu, int cpu, =
bool *ret)
=20
 PMU_FORMAT_ATTR(offcore_rsp, "config1:0-63");
=20
+PMU_FORMAT_ATTR(offmodule_rsp, "config1:0-63");
+
 PMU_FORMAT_ATTR(ldlat, "config1:0-15");
=20
 PMU_FORMAT_ATTR(frontend, "config1:0-23");
@@ -6649,6 +6651,20 @@ static struct attribute *skl_format_attr[] =3D {
 	NULL,
 };
=20
+static struct attribute *pnc_format_attr_rtm[] =3D {
+	&format_attr_in_tx.attr,
+	&format_attr_in_tx_cp.attr,
+	&format_attr_offmodule_rsp.attr,
+	&format_attr_ldlat.attr,
+	NULL
+};
+
+static struct attribute *pnc_format_attr[] =3D {
+	&format_attr_offmodule_rsp.attr,
+	&format_attr_ldlat.attr,
+	NULL
+};
+
 static __initconst const struct x86_pmu core_pmu =3D {
 	.name			=3D "core",
 	.handle_irq		=3D x86_pmu_handle_irq,
@@ -8589,6 +8605,8 @@ __init int intel_pmu_init(void)
 	case INTEL_DIAMONDRAPIDS_X:
 		intel_pmu_init_pnc(NULL);
 		x86_pmu.pebs_latency_data =3D pnc_latency_data;
+		extra_attr =3D boot_cpu_has(X86_FEATURE_RTM) ?
+			     pnc_format_attr_rtm : pnc_format_attr;
=20
 		pr_cont("Panthercove events, ");
 		name =3D "panthercove";
@@ -8597,13 +8615,12 @@ __init int intel_pmu_init(void)
 	glc_common:
 		intel_pmu_init_glc(NULL);
 		intel_pmu_pebs_data_source_skl(true);
-
+		extra_attr =3D boot_cpu_has(X86_FEATURE_RTM) ?
+			hsw_format_attr : nhm_format_attr;
 	glc_base:
 		x86_pmu.pebs_ept =3D 1;
 		x86_pmu.hw_config =3D hsw_hw_config;
 		x86_pmu.get_event_constraints =3D glc_get_event_constraints;
-		extra_attr =3D boot_cpu_has(X86_FEATURE_RTM) ?
-			hsw_format_attr : nhm_format_attr;
 		extra_skl_attr =3D skl_format_attr;
 		mem_attr =3D glc_events_attrs;
 		td_attr =3D glc_td_events_attrs;

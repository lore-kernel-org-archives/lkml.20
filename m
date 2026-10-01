Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F77E455607;
	Thu,  1 Oct 2026 06:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834484; cv=none; b=SK98VS6RI1J5GQZozHl6WydzAhxPvhgjDo0VbXyTXXpJy0VaH8fTgCZ6S3ejRFla/lIIiQH7QEKW31gjk0QRnxp8ArxudpAfu3U0rdpTeMWd2p+qgC5FPNPNGQTCLK4IKoIIVdU0y0XjE3hPCPiQCMHbGp+zBpm0Gwpu76ADU4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834484; c=relaxed/simple;
	bh=Nz6HpxVNT98YiE8R1ScwUfFUcyldIz6j+q0sb/NX6aM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=WwADnY7U5famUrC0QPOnhwoUKv440dPfRWK/yn17/jYUBEsPRGtN7y1hfUZwONGWGBbSljNcdwHYumVcHBWwaE838PYQBymjy8qxAgJ4Gh/8EeyWAo4mVUexJzHDtB1B5CB/DN9Jh9hn9LkIrc0yNmLa/u25rKft9eya8rvWxSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=m4UMAvLg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3mpcDnEs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="m4UMAvLg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3mpcDnEs"
Date: Thu, 01 Oct 2026 06:01:15 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790834478;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bnYvIBKFFjq1tRvfJcQDNM3L4QGtFYPDt5LMkqCKHdc=;
	b=m4UMAvLgswWVIKAkrpCs7LMbnHBQv2n4P3LH23eJ/rmQ6lpoVcoAoVPXtRkEmQfUVNpMnr
	23SxpJ4NVJM9H5VKBlCoQt2Tnz6m3CZY9PxlfM5oPWVE30s3fC/p9lCRc+DK66i3o5WRFN
	nWA22MwDHMzq3SZO6+G5weaSDNpotXIhuYHhitr2WHetaPVC/X8YxdJbv7Ldp6bk4dAPHM
	QmMUxYBI1tyaOrZ36TFNJExKyy4TuxN4fVkfBS5R4vlSO7VBhj/I7zco6eSe/RDgkp2jIc
	3y5JGXN3BKG3a3MAgIphXODtq46ndHZgIQs7Lon6NjuHq4x9uFHTyYYBCznxeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790834478;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bnYvIBKFFjq1tRvfJcQDNM3L4QGtFYPDt5LMkqCKHdc=;
	b=3mpcDnEsowXYZZJF53o0vtB2+2dgFfdtQRZPypg+tesMVvsFtnMYUIeGjCdj11qoAmbRcr
	Y58jJsVaBAIgypBA==
From: "tip-bot2 for Tony Luck" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cache] x86,fs/resctrl: Add event group descriptions for
 Intel Diamond Rapids
Cc: Tony Luck <tony.luck@intel.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260930171554.12794-1-tony.luck@intel.com>
References: <20260930171554.12794-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179083447575.3910103.5605043048790091336.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     50e5282df427830fcd810e553f0e355d9cccb3e2
Gitweb:        https://git.kernel.org/tip/50e5282df427830fcd810e553f0e355d9cc=
cb3e2
Author:        Tony Luck <tony.luck@intel.com>
AuthorDate:    Wed, 30 Sep 2026 10:15:54 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Wed, 30 Sep 2026 22:47:08 -07:00

x86,fs/resctrl: Add event group descriptions for Intel Diamond Rapids

Intel Diamond Rapids exposes Application Energy Telemetry through two new PMT
aggregator GUIDs: one covering the "energy" feature, and one covering the
"perf" feature, both documented in the Intel-PMT XML repository at
https://github.com/intel/Intel-PMT

The "perf" aggregator references two events not previously enumerated by
resctrl: retired instructions (INST_RETIRED), and a count of unhalted core
clock cycles perceived by hardware as contributing to instruction execution
(PCNT).

Add definitions for both aggregators, and add the two new events to the
resctrl filesystem so they can be exposed to user space.

Signed-off-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Link: https://patch.msgid.link/20260930171554.12794-1-tony.luck@intel.com
---
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 34 ++++++++++++++++++++++++-
 fs/resctrl/monitor.c                    |  2 +-
 include/linux/resctrl_types.h           |  2 +-
 3 files changed, 38 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/re=
sctrl/intel_aet.c
index c22c3cf..66cd8c2 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -125,9 +125,43 @@ static struct event_group perf_0x26557651 =3D {
 	}
 };
=20
+/*
+ * Link: https://github.com/intel/Intel-PMT/blob/main/xml/DMR/OOBMSM/RMID-EN=
ERGY/dmr_aggregator.xml
+ */
+static struct event_group energy_0x47903099 =3D {
+	.pfname		=3D "energy",
+	.guid		=3D 0x47903099,
+	.num_rmid	=3D 256,
+	.mmio_size	=3D XML_MMIO_SIZE(256, 2, 3),
+	.num_events	=3D 2,
+	.evts		=3D {
+		EVT(PMT_EVENT_ENERGY, 0, 18),
+		EVT(PMT_EVENT_ACTIVITY, 1, 18),
+	}
+};
+
+/*
+ * Link: https://github.com/intel/Intel-PMT/blob/main/xml/DMR/OOBMSM/RMID-PE=
RF/dmr_aggregator.xml
+ */
+static struct event_group perf_0x1415910a =3D {
+	.pfname		=3D "perf",
+	.guid		=3D 0x1415910a,
+	.num_rmid	=3D 256,
+	.mmio_size	=3D XML_MMIO_SIZE(256, 4, 3),
+	.num_events	=3D 4,
+	.evts		=3D {
+		EVT(PMT_EVENT_UNHALTED_REF_CYCLES, 0, 0),
+		EVT(PMT_EVENT_UNHALTED_CORE_CYCLES, 1, 0),
+		EVT(PMT_EVENT_INST_RETIRED, 2, 0),
+		EVT(PMT_EVENT_PCNT, 3, 0),
+	}
+};
+
 static struct event_group *known_event_groups[] =3D {
 	&energy_0x26696143,
+	&energy_0x47903099,
 	&perf_0x26557651,
+	&perf_0x1415910a,
 };
=20
 #define for_each_event_group(_peg)						\
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 73413cb..04e4ea6 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -1041,6 +1041,8 @@ struct mon_evt mon_event_all[QOS_NUM_EVENTS] =3D {
 	MON_EVENT(PMT_EVENT_AUTO_C6_RES,		"c6_res",		RDT_RESOURCE_PERF_PKG,	false),
 	MON_EVENT(PMT_EVENT_UNHALTED_REF_CYCLES,	"unhalted_ref_cycles",	RDT_RESOURC=
E_PERF_PKG,	false),
 	MON_EVENT(PMT_EVENT_UOPS_RETIRED,		"uops_retired",		RDT_RESOURCE_PERF_PKG,	=
false),
+	MON_EVENT(PMT_EVENT_INST_RETIRED,		"inst_retired",		RDT_RESOURCE_PERF_PKG,	=
false),
+	MON_EVENT(PMT_EVENT_PCNT,			"pcnt",			RDT_RESOURCE_PERF_PKG,	false),
 };
=20
 bool resctrl_enable_mon_event(enum resctrl_event_id eventid, bool any_cpu,
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index a5f56fa..e2e2cf3 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -60,6 +60,8 @@ enum resctrl_event_id {
 	PMT_EVENT_AUTO_C6_RES,
 	PMT_EVENT_UNHALTED_REF_CYCLES,
 	PMT_EVENT_UOPS_RETIRED,
+	PMT_EVENT_INST_RETIRED,
+	PMT_EVENT_PCNT,
=20
 	/* Must be the last */
 	QOS_NUM_EVENTS,

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E035D4E0B8B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026356; cv=none; b=embnYx+t1cr/3iuG7pmg7G6AuscvAlOkbnCdUqwwLjcAVVEMon+uix9HYXTR3lP6yIb+HPr/iEXI/4ieduv1/6wArPaFnauC6cKT++OC3iQhmLD8t6mTLi0PYfwUL5y1HUdR34exdzbreU1MvIu4cT5QhCF8xAfCxpKnj5r2830=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026356; c=relaxed/simple;
	bh=9VKhnn0mFWCc3rfo8O81MYp6aAXV3EfOfsfLb/YT4vc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aamvYOlb1VOj7NfJS0lOhLB/aIP2LHLsXUIML4NbAAVoeY5Kj7WaPWbymd4pT8UEplwKVO24osB7vHLwYczIq0u/CaB5YWxaZ+ijdi43DTPFKt6crzxM0XrcQdwwWZh5umvHzZIW+W/DYbaBotWJgwdGn1ZFzvuG5FH7wm6/hGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOjhYDy4; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOjhYDy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790026354; x=1821562354;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9VKhnn0mFWCc3rfo8O81MYp6aAXV3EfOfsfLb/YT4vc=;
  b=aOjhYDy45adQMGUVLZ0S3z92Of0BGwwUXtwM1G9GBTORMFUa6f/THsZH
   pvV+1LhjOkQ3WOejsmmva9rzIx3PHAnBgggz4r0EY+KOyUee8SzTfp7vq
   b5tBntcOiqSjKHFQGR+EcLuJbtdxreEne9SgG8MuTb1Kts1/uLJFuKo3G
   2k0p0y6qTpeY6V9eZzY+ownUNuaIWff8dqnljNkvsTma8K6khHvv0e0hM
   0l425N87tjOI0Nvb7icA1/ZdxvXkJM12Ue49DsZaJtRVTPinOvRXhqhNz
   BWeZ55ONocQ9BpPpa8UOD3iDRNxKgGp8FD82ycgADVTwBlaR0DLCFlJN6
   w==;
X-CSE-ConnectionGUID: mohp+NFvReCHfnkBZiFeMQ==
X-CSE-MsgGUID: dVoSCKiERUeu+Rscn/BHkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1082842"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="1082842"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 14:32:33 -0700
X-CSE-ConnectionGUID: joxqktQTRKWIuk+RvD2Tdg==
X-CSE-MsgGUID: AiW8NtXqQoatnTmh1Uim0A==
X-ExtLoop1: 1
Received: from aschofie-mobl2.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.225])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 14:32:33 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH] x86,fs/resctrl: Add event_group information for Intel Diamond Rapids
Date: Mon, 21 Sep 2026 14:32:26 -0700
Message-ID: <20260921213226.14997-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel published XML descriptions for the Application Energy Telemetry
events on Diamond Rapids here: https://github.com/intel/Intel-PMT.

Add event_group structures for both new GUIDs.

There are two new "perf" events. Add them to the resctrl file system.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/resctrl_types.h           |  2 ++
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 34 +++++++++++++++++++++++++
 fs/resctrl/monitor.c                    |  2 ++
 3 files changed, 38 insertions(+)

diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index a5f56faa18d2..e2e2cf3d9ff6 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -60,6 +60,8 @@ enum resctrl_event_id {
 	PMT_EVENT_AUTO_C6_RES,
 	PMT_EVENT_UNHALTED_REF_CYCLES,
 	PMT_EVENT_UOPS_RETIRED,
+	PMT_EVENT_INST_RETIRED,
+	PMT_EVENT_PCNT,
 
 	/* Must be the last */
 	QOS_NUM_EVENTS,
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index c22c3cf5167d..3555b0aa33ce 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -125,9 +125,43 @@ static struct event_group perf_0x26557651 = {
 	}
 };
 
+/*
+ * Link: https://github.com/intel/Intel-PMT/blob/main/xml/DMR/OOBMSM/RMID-ENERGY/dmr_aggregator.xml
+ */
+static struct event_group energy_0x47903099 = {
+	.pfname		= "energy",
+	.guid		= 0x47903099,
+	.num_rmid	= 256,
+	.mmio_size	= XML_MMIO_SIZE(256, 2, 3),
+	.num_events	= 2,
+	.evts		= {
+		EVT(PMT_EVENT_ENERGY, 0, 18),
+		EVT(PMT_EVENT_ACTIVITY, 1, 18),
+	}
+};
+
+/*
+ * Link: https://github.com/intel/Intel-PMT/blob/main/xml/DMR/OOBMSM/RMID-PERF/dmr_aggregator.xml
+ */
+static struct event_group perf_0x1415910A = {
+	.pfname		= "perf",
+	.guid		= 0x1415910A,
+	.num_rmid	= 256,
+	.mmio_size	= XML_MMIO_SIZE(256, 4, 3),
+	.num_events	= 4,
+	.evts		= {
+		EVT(PMT_EVENT_UNHALTED_REF_CYCLES, 0, 0),
+		EVT(PMT_EVENT_UNHALTED_CORE_CYCLES, 1, 0),
+		EVT(PMT_EVENT_INST_RETIRED, 2, 0),
+		EVT(PMT_EVENT_PCNT, 3, 0),
+	}
+};
+
 static struct event_group *known_event_groups[] = {
 	&energy_0x26696143,
+	&energy_0x47903099,
 	&perf_0x26557651,
+	&perf_0x1415910A,
 };
 
 #define for_each_event_group(_peg)						\
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 73413cb128ea..04e4ea612b7c 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -1041,6 +1041,8 @@ struct mon_evt mon_event_all[QOS_NUM_EVENTS] = {
 	MON_EVENT(PMT_EVENT_AUTO_C6_RES,		"c6_res",		RDT_RESOURCE_PERF_PKG,	false),
 	MON_EVENT(PMT_EVENT_UNHALTED_REF_CYCLES,	"unhalted_ref_cycles",	RDT_RESOURCE_PERF_PKG,	false),
 	MON_EVENT(PMT_EVENT_UOPS_RETIRED,		"uops_retired",		RDT_RESOURCE_PERF_PKG,	false),
+	MON_EVENT(PMT_EVENT_INST_RETIRED,		"inst_retired",		RDT_RESOURCE_PERF_PKG,	false),
+	MON_EVENT(PMT_EVENT_PCNT,			"pcnt",			RDT_RESOURCE_PERF_PKG,	false),
 };
 
 bool resctrl_enable_mon_event(enum resctrl_event_id eventid, bool any_cpu,
-- 
2.55.0


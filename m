Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658936;
	b=PTDmXwBpWjAi5bbCqrW8lCgpUEBuzGvDT/7mV4IHryb/svgFAlqsMr65HTz96c9Rt9hS
	 lItXQ5qVNCgPdyiZNxz4J/i2LvnQpWf7UJMk3PNg1J3uz5DL7uSW65fqh8Ucxfx6YgnPI
	 3kxHJpjt37PolhjXZ6zAfBlBMbTpOeiOJJzvlcfj/Uh94SmcOCpInuKAzSlYX2alqj54+
	 U9Y+5F30fVTEz1KGS3WOsjWZzhzwmwz1/VnxIL+J32g6SDdW04gwLQdVydeuIoDyQS1yO
	 83fKU4EN0d31NdWuu4AClrL/QWVvLSgkfHxZ65cwSBbDzpumKGpioiE1+QUcd+ydTxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658936;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=zwnkwYmhLzhEKJg+U7p50UnqjYbQ/FzJRIwMkHplZOY=;
	b=J+/mjKXND1G5Yk8AwskZQN6rHHwCjfxCazZLsg0H5s71N7FQjx3tEEVneMMuUKzwjs9p
	 8a/lg1X0vStwtw/zrjQOB/jrMTRiNHhMZ/JZWUZzSvckGtItvcgHVT5M0E1KX7aXqgk9w
	 OFac9c/dSnrUFdURf4ytSDHICnG4dXWrA/hwS2xnKfSPk+dAs6FmOtaudgOoRcgA0MK/+
	 xkXTOekqy+XPPwGDcboCOYMezBqyETt8nNNBRYr4sVbKls41R0oe/m3WmVoAlXQZNkBza
	 QNQEJTvW1LU+ipYg5wl0LhKWQlKw2+yatELsmscrx8uiuxnBl6yqVKHvtkUv6nCMU9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=rubo54JP;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD32C606A336;
	Thu, 22 Oct 2026 08:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD32C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=rubo54JP
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zwnkwYmhLzhEKJg+U7p50UnqjYbQ/FzJRIwMkHplZOY=;
	b=rubo54JPTGrIBz4b1PiDbWS16Xkx7CuU84EBhVhdvDGVyBFQOyHT1PNlvUi/RZCd2hd5ES5eD
	g0wkPRBp1tSNixcPk8GD0MxrGxtqCB6UmAY3pd7M587lQO/scb9ZsSBabtTtycrtkQPPMbzd/BX
	tV7iviiipHFuaAOxADqrJqI=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ73Xb6zcb3K;
	Thu, 22 Oct 2026 16:48:47 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2FA1F40537;
	Thu, 22 Oct 2026 16:48:50 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:48:49 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 2/7] fs/resctrl: Add the L2 monitor events
Date: Thu, 22 Oct 2026 16:48:16 +0800
Message-ID: <20261022084821.4014873-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022084821.4014873-1-ruanjinjie@huawei.com>
References: <20261022084821.4014873-1-ruanjinjie@huawei.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Add the L2 cache occupancy (l2c_occupancy) and L2 bandwidth
(mbm_core_bytes) monitor events, and route RDT_RESOURCE_L2 through the
same per-domain read path as the L3.

As ARM MPAM Specification said, MPAM resource monitors are associated
with a shared partitionable resource in an MSC, not with a particular
cache level: the level comes from firmware's description of the MSC.
L2 monitors were only missing a resctrl scope. The events are
exposed once an architecture reports the L2 resource
mon_capable; x86 never does.

Update Documentation/arch/arm64/mpam.rst to mention L2.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/arch/arm64/mpam.rst | 23 ++++++++++++++---------
 fs/resctrl/monitor.c              |  9 +++++++++
 include/linux/resctrl_types.h     | 13 ++++++++++++-
 3 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
index 67fe515ed501..f0697dedde03 100644
--- a/Documentation/arch/arm64/mpam.rst
+++ b/Documentation/arch/arm64/mpam.rst
@@ -32,8 +32,9 @@ Because the user interface to MPAM is via resctrl, only MPAM features that are
 compatible with resctrl can be exposed to user-space.
 
 MSC are considered as a group based on the topology. MSC that correspond with
-the L3 cache are considered together, it is not possible to mix MSC between L2
-and L3 to 'cover' a resctrl schema.
+the L3 cache are considered together, as are MSC that correspond with the L2
+cache; it is not possible to mix MSC between L2 and L3 to 'cover' a resctrl
+schema.
 
 The supported features are:
 
@@ -61,9 +62,11 @@ The supported features are:
   When the MPAM driver finds multiple groups of MSC it can use for the 'MB'
   schema, it prefers the group closest to the L3 cache.
 
-* Cache Storage Usage (CSU) counters can expose the 'llc_occupancy' provided
-  there is at least one CSU monitor on each MSC that makes up the L3 group.
-  Exposing CSU counters from other caches or devices is not supported.
+* Cache Storage Usage (CSU) counters expose the occupancy of the cache they
+  monitor: 'llc_occupancy' for the L3 group and 'l2c_occupancy' for the L2
+  group, provided there is at least one CSU monitor on each MSC that makes up
+  the group. Exposing CSU counters from other caches or devices is not
+  supported.
 
 * Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
   L3 cache-id to identify where the memory bandwidth is measured. For this
@@ -82,10 +85,12 @@ The supported features are:
   have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
   cannot distinguish local traffic from global traffic.
 
-  All these restrictions based on L3 cache are due to resctrl, currently, only
-  supporting monitoring at the L3 scope. It is expected that going forward more
-  MBWU monitors can be exposed to the user after support for more monitoring
-  scopes is added to resctrl.
+  MBWU monitors on an L2 MSC expose the bandwidth the cache sees as the
+  'mbm_core_bytes' event on the L2 resource.
+
+  These restrictions are due to resctrl only supporting monitoring at the L2
+  and L3 cache scopes. MBWU monitors on caches at other levels, or on devices,
+  are not exposed.
 
 Reporting Bugs
 ==============
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index f9f4d4486c1b..ee296c27c6e8 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -543,6 +543,13 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 			return __mon_event_count_one_domain(rdtgrp, rr);
 		else
 			return __l3_mon_event_count_sum(rdtgrp, rr);
+	case RDT_RESOURCE_L2:
+		WARN_ON_ONCE(rr->evt->any_cpu);
+		if (WARN_ON_ONCE(!rr->hdr)) {
+			rr->err = -EINVAL;
+			return -EINVAL;
+		}
+		return __mon_event_count_one_domain(rdtgrp, rr);
 	case RDT_RESOURCE_PERF_PKG: {
 		u64 tval = 0;
 
@@ -1032,6 +1039,8 @@ struct mon_evt mon_event_all[QOS_NUM_EVENTS] = {
 	MON_EVENT(QOS_L3_OCCUP_EVENT_ID,		"llc_occupancy",	RDT_RESOURCE_L3,	false),
 	MON_EVENT(QOS_L3_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	RDT_RESOURCE_L3,	false),
 	MON_EVENT(QOS_L3_MBM_LOCAL_EVENT_ID,		"mbm_local_bytes",	RDT_RESOURCE_L3,	false),
+	MON_EVENT(QOS_L2_OCCUP_EVENT_ID,		"l2c_occupancy",	RDT_RESOURCE_L2,	false),
+	MON_EVENT(QOS_L2_MBM_CORE_EVENT_ID,		"mbm_core_bytes",	RDT_RESOURCE_L2,	false),
 	MON_EVENT(PMT_EVENT_ENERGY,			"core_energy",		RDT_RESOURCE_PERF_PKG,	true),
 	MON_EVENT(PMT_EVENT_ACTIVITY,			"activity",		RDT_RESOURCE_PERF_PKG,	true),
 	MON_EVENT(PMT_EVENT_STALLS_LLC_HIT,		"stalls_llc_hit",	RDT_RESOURCE_PERF_PKG,	false),
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index a5f56faa18d2..f31b8f2ccb8b 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -37,7 +37,14 @@
 /* Number of memory transactions that an MBM event can be configured with */
 #define NUM_MBM_TRANSACTIONS		7
 
-/* Event IDs */
+/*
+ * Monitor Event IDs, representative a variety of monitoring events:
+ * QOS_L3_OCCUP_EVENT_ID:     L3 Cache Occupancy statistics event
+ * QOS_L3_MBM_TOTAL_EVENT_ID: Global Memory Bandwidth statistics event
+ * QOS_L3_MBM_LOCAL_EVENT_ID: L3 Cache Bandwidth statistics event
+ * QOS_L2_OCCUP_EVENT_ID:     L2 Cache Occupancy statistics event
+ * QOS_L2_MBM_CORE_EVENT_ID:  L2 Cache Bandwidth statistics event
+ */
 enum resctrl_event_id {
 	/* Must match value of first event below */
 	QOS_FIRST_EVENT			= 0x01,
@@ -50,6 +57,10 @@ enum resctrl_event_id {
 	QOS_L3_MBM_TOTAL_EVENT_ID	= 0x02,
 	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
 
+	/* ARM MPAM L2 Events */
+	QOS_L2_OCCUP_EVENT_ID,
+	QOS_L2_MBM_CORE_EVENT_ID,
+
 	/* Intel Telemetry Events */
 	PMT_EVENT_ENERGY,
 	PMT_EVENT_ACTIVITY,
-- 
2.43.0


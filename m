Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658940;
	b=ePwE9oEX1dJo78ScRt2nMIYP3bsXIUFSXJs1GTx04Omc0y0JjRwIKRi0TVf9CG42glvy
	 Ogtm9OQtOnJdGIGncvkpSgmVW4gFS4QpZp16HESJeusxZpKwPDXyCiZExHp/OV1IucBFs
	 S/2GFfdviLFo7JCVK90Gnq2Z3tzeH3lMUeQL3as9CxPy2d5JrcbL60xgwtSkolU0QwKFo
	 nxYY70TFLYLY5irxzT9HxFwhYWATNgoNSmYtkJiOQ8y3Ue4IkfiGxxg7Z4wBDIZZnjn8r
	 OP5iB6zXx2OpZNMUX6/bXHFwiJdu1hrSFZ5RJvPnAMPZWdCIJ2pAl4lv2AUMJ/p4KHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658940;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Npg9y1GXnueQN65R8UeXXt5YG0F2yx26M10/k3Llflw=;
	b=WDQDeZ1PJWkqEN89AeuRWWmdvZc6HTXff1vb/4o8QflSE1vTUNmwxJ9lmejolD2RD0V6
	 MXnFeAYGdfXDDQm45Y6FJSPwZYauMs16mjr9kf1PNvphj9JhNQrdwrkO2Aca/FK0LHK2I
	 rREZ79Zknic/8DP7t14PQsYjZDyO8bIE2S57aNgeIYXdJYopCzk3UtLGrKYronw+Ho0aA
	 TeNIIqI6tU3yn0ZkZRc6BGj18G3eMU4QHaEyp5f2zm2NA/E4L71I66Eks+SjGCPVYXd9u
	 58vp2N0vowtQRuEoMu7vfdRNjQINurl0/+eTP17Mtm+SSXJQraM04OwdxUT+CCtFpew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=57o66HfQ;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD376606A337;
	Thu, 22 Oct 2026 08:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD376606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=57o66HfQ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Npg9y1GXnueQN65R8UeXXt5YG0F2yx26M10/k3Llflw=;
	b=57o66HfQ6jIfNh+NnSejPIp9KSbUD4EEkFVzbPIkdG3x9oj20VTiwpV88IB+O+Y/efdR0i18g
	SJzaOXHsrHVtnQ4nz1AlsCF+KGrlAnvzabBtQhvM0iIGQYQXFV3lwi5u5cQo8Vo/p0hQvSggkcg
	8+OzzYzq2hd0ezKFdo5fN9U=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ902ZRzcb3K;
	Thu, 22 Oct 2026 16:48:49 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id AB3C14057D;
	Thu, 22 Oct 2026 16:48:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:48:50 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 5/7] arm_mpam: resctrl: Describe the L2 monitor events with the L2 resource
Date: Thu, 22 Oct 2026 16:48:19 +0800
Message-ID: <20261022084821.4014873-6-ruanjinjie@huawei.com>
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

mpam_resctrl_monitor_init() forced every event onto the L3 resource.
Describe the L2 events with the L2 resource instead: the occupancy and
bandwidth events of an L2 cache belong to the L2 resource, which keeps
info/L2_MON in step with the hardware it measures.

No behaviour change yet: the events are only initialised once the caller
starts iterating over them.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 52 +++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index efb9ce76acb4..50e5035dcc9d 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1336,26 +1336,47 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 				     enum resctrl_event_id type)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	struct rdt_resource *l3 = &res->resctrl_res;
+	enum resctrl_res_level res_level;
+	struct mpam_resctrl_res *res;
+	struct rdt_resource *r;
+	int cache_level;
 
 	lockdep_assert_cpus_held();
 
+	switch (type) {
+	case QOS_L2_OCCUP_EVENT_ID:
+	case QOS_L2_MBM_CORE_EVENT_ID:
+		cache_level = 2;
+		res_level = RDT_RESOURCE_L2;
+		break;
+	case QOS_L3_OCCUP_EVENT_ID:
+	case QOS_L3_MBM_LOCAL_EVENT_ID:
+	case QOS_L3_MBM_TOTAL_EVENT_ID:
+		cache_level = 3;
+		res_level = RDT_RESOURCE_L3;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	res = &mpam_resctrl_controls[res_level];
+	r = &res->resctrl_res;
+
 	/*
-	 * There also needs to be an L3 cache present.
+	 * There also needs to be a cache at the level we're describing.
 	 * The check just requires any online CPU and it can't go offline as we
 	 * hold the cpu lock.
 	 */
-	if (get_cpu_cacheinfo_id(raw_smp_processor_id(), 3) == -1)
+	if (get_cpu_cacheinfo_id(raw_smp_processor_id(), cache_level) == -1)
 		return 0;
 
 	/*
-	 * If there are no MPAM resources on L3, force it into existence.
-	 * topology_matches_l3() already ensures this looks like the L3.
-	 * The domain-ids will be fixed up by mpam_resctrl_domain_hdr_init().
+	 * If there are no MPAM resources at this level, force it into
+	 * existence so the counters have somewhere to live. The domain-ids
+	 * will be fixed up by mpam_resctrl_domain_hdr_init().
 	 */
 	if (!res->class) {
-		pr_warn_once("Faking L3 MSC to enable counters.\n");
+		pr_warn_once("Faking L%d MSC to enable counters.\n", cache_level);
 		res->class = mpam_resctrl_counters[type].class;
 	}
 
@@ -1364,8 +1385,13 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * monitoring class.
 	 * Setting name is necessary on monitor only platforms.
 	 */
-	l3->name = "L3";
-	l3->mon_scope = RESCTRL_L3_CACHE;
+	if (cache_level == 3) {
+		r->name = "L3";
+		r->mon_scope = RESCTRL_L3_CACHE;
+	} else {
+		r->name = "L2";
+		r->mon_scope = RESCTRL_L2_CACHE;
+	}
 
 	/*
 	 * num-rmid is the upper bound for the number of monitoring groups that
@@ -1375,7 +1401,7 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * this does mean userspace needs to know the architecture to correctly
 	 * interpret this value.
 	 */
-	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	r->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
 
 	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
 		int err;
@@ -1385,13 +1411,13 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 			return err;
 
 		static_assert(MAX_EVT_CONFIG_BITS == 0x7f);
-		l3->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
+		r->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
 	}
 
 	if (!resctrl_enable_mon_event(type, false, 0, NULL))
 		return -EINVAL;
 
-	l3->mon_capable = true;
+	r->mon_capable = true;
 
 	return 0;
 }
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277408;
	b=YYYK+rJSiQXnRgb1KW+4T4QQDc9QS0Pnd5rvyToUMiMk37hj1E/NAdi7xDnhvy94hyTH
	 AGUL+IznkM5yk2cl/2zGRyy9y0bFJdf+NS/l2ZUyW2UI5Bq6MXGlVljvkDcLR07BfjRcD
	 kpDRgWG6TNVVgha5zsP7xeUa7Sld3Ns3Co/nNW5xqjncO/ivjHB8rKjwHQllWF71OmWbl
	 4/sy50p9YDMU43nCo35HxCFBSptiuqkiLRqeylvVfvwT98W9SPmMJvZmwuPkyJ0/tpTY8
	 5/5a12UybpW2MNvb7Pygn5pJgWOTlt/0qUH2oCQxu9EG79kwUlObOUmf1RoWtj+gKaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277408;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=XmJpCilJ0NrhUf/tBqHBeO1E7rwkKvK5lUeDCabogN4=;
	b=zHne5hlfQPayjt+6aZW4Y+uNTTiis+SzasGVWBYiSokKl1qKzxwyc8R9XLLDG8SbL3un
	 3e43sZVmyqXhQv2eMlccR2bHfvTizET5gpKT+scmoD8F/lL+6s9Ze8kdisJDkopggNrNe
	 eUJTSBS5Z5QV/ny1PiCnB5JpfFxBZ44euXkDXJGML+KThybUd2RyuscMz23asr186fwfA
	 nH0U0uU1qYx2gqrAfvqIAondhXeIDh57ZXxbkVdntCXkeddfTShM7NMnhRTfl8L4RTXNG
	 3rVTHnJnDA50mKC1VVp4O/pk/5dQd0DHYuLKtKsnFjUOWzjiJ9Eo6VmlR043ezaNu3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=nKJc9w+Z;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D741606A31A;
	Thu, 29 Oct 2026 12:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D741606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=nKJc9w+Z
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XmJpCilJ0NrhUf/tBqHBeO1E7rwkKvK5lUeDCabogN4=;
	b=nKJc9w+ZL78VOOjkz6CwWvxh4dcm6an9Y6V1AmIHDvM0kCdquSFORkclnDUOrrN9v+lY8Egyn
	2JCujhqw2SIlL9Rik4LpDNNnS/qBR63xkpazH+Vzg+mUisfeMOE717EWSWWHqgutG+EaTGjAlxn
	Mqoiu/pPap2YWZiQdjWmwwc=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHZ0QJ2zcb3s;
	Thu, 29 Oct 2026 20:36:26 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id F2D38202E6;
	Thu, 29 Oct 2026 20:36:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 05/19] arm_mpam: resctrl: Use the resource-agnostic monitor event names
Date: Thu, 29 Oct 2026 20:35:57 +0800
Message-ID: <20261029123611.1108424-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The monitor event IDs no longer carry L3 in their names. Switch the MPAM
driver over to the new names.

No functional change.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 886f0595d364..e436c3e6d4fc 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -45,7 +45,7 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
  * to those supported by MPAM.
  * Class pointer may be NULL.
  */
-#define MPAM_MAX_EVENT QOS_L3_MBM_TOTAL_EVENT_ID
+#define MPAM_MAX_EVENT QOS_MBM_TOTAL_EVENT_ID
 static struct mpam_resctrl_mon mpam_resctrl_counters[MPAM_MAX_EVENT + 1];
 
 #define for_each_mpam_resctrl_mon(mon, eventid)					\
@@ -173,7 +173,7 @@ static void resctrl_reset_task_closids(void)
 
 static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID];
+	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[QOS_MBM_TOTAL_EVENT_ID];
 
 	if (!mon->class)
 		return;
@@ -392,11 +392,11 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid)
 		return -EINVAL;
 
 	switch (evtid) {
-	case QOS_L3_OCCUP_EVENT_ID:
+	case QOS_OCCUP_EVENT_ID:
 		/* With CDP, one monitor gets used for both code/data reads */
 		return mpam_alloc_csu_mon(mon->class);
-	case QOS_L3_MBM_LOCAL_EVENT_ID:
-	case QOS_L3_MBM_TOTAL_EVENT_ID:
+	case QOS_MBM_LOCAL_EVENT_ID:
+	case QOS_MBM_TOTAL_EVENT_ID:
 		return USE_PRE_ALLOCATED;
 	default:
 		return -EOPNOTSUPP;
@@ -436,7 +436,7 @@ static void resctrl_arch_mon_ctx_free_no_wait(enum resctrl_event_id evtid,
 	if (!mon->class)
 		return;
 
-	if (evtid == QOS_L3_OCCUP_EVENT_ID)
+	if (evtid == QOS_OCCUP_EVENT_ID)
 		mpam_free_csu_mon(mon->class, mon_idx);
 
 	wake_up(&resctrl_mon_ctx_waiters);
@@ -536,7 +536,7 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 	l3_dom = container_of(hdr, struct mpam_resctrl_dom, resctrl_mon_dom.hdr);
 	mon_comp = l3_dom->mon_comp[eventid];
 
-	if (eventid != QOS_L3_OCCUP_EVENT_ID)
+	if (eventid != QOS_OCCUP_EVENT_ID)
 		return -EINVAL;
 
 	mon_type = mpam_feat_msmon_csu;
@@ -557,7 +557,7 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 	if (!mpam_is_enabled())
 		return -EINVAL;
 
-	if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
+	if (eventid == QOS_OCCUP_EVENT_ID || !mon->class)
 		return -EINVAL;
 
 	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
@@ -614,7 +614,7 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 	if (!mpam_is_enabled())
 		return;
 
-	if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
+	if (eventid == QOS_OCCUP_EVENT_ID || !mon->class)
 		return;
 
 	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
@@ -1131,7 +1131,7 @@ static void mpam_resctrl_pick_counters(void)
 				if (update_rmid_limits(class))
 					break;
 
-				counter_update_class(QOS_L3_OCCUP_EVENT_ID, class);
+				counter_update_class(QOS_OCCUP_EVENT_ID, class);
 				break;
 			default:
 				break;
@@ -1153,7 +1153,7 @@ static void mpam_resctrl_pick_counters(void)
 			 * and it's equivalent to mbm_total and so always use
 			 * mbm_total.
 			 */
-			counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
+			counter_update_class(QOS_MBM_TOTAL_EVENT_ID, class);
 		}
 	}
 }
@@ -1180,7 +1180,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 {
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
 
-	if (evtid != QOS_L3_MBM_TOTAL_EVENT_ID) {
+	if (evtid != QOS_MBM_TOTAL_EVENT_ID) {
 		pr_debug("unexpected event id\n");
 		return;
 	}
@@ -1197,7 +1197,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 		__config_cntr(mon, cntr_id, CDP_NONE, closid, rmid, assign);
 	}
 
-	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, QOS_L3_MBM_TOTAL_EVENT_ID);
+	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, QOS_MBM_TOTAL_EVENT_ID);
 }
 
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
@@ -1358,7 +1358,7 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 */
 	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
 
-	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
+	if (type == QOS_MBM_TOTAL_EVENT_ID) {
 		int err;
 
 		err = mpam_resctrl_monitor_init_abmc(mon);
-- 
2.34.1


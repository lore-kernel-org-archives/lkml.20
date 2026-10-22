Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658940;
	b=DwSPkFmxZbiOyJUYq9G50hKBCxbdA9m0StFhlbpkidIO+s8pqKFaoPmAKx7/OCIg2faD
	 v0C4udkfOy61NblNsxSW5jPvtfZCeSGfwuNrhaPuBgBEFNcRok8t/n3UG3VqpEQSYz3Ga
	 gLRS036WU0k5sw2PmjnbKTxO1I/qgSKPX5LJhiQ6kCSgj2cxkqMytdZypvBgkUpFE++Id
	 BP7taVkoTRFOwpo9PSzxQ7jJz0hoNgq7hosMUx0k5yTecqS0otjvm2l3zR9FfFTNVXkOa
	 Uc5XON2KRLllEg12x8NjGUtt3ilJS9GPGSgoW37RBuCzsB10L96ziNTcktvkHty7nvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658940;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=MSj8Z2rdiJcCmb6g+ksU9pujYJJSBwXRRnHKZsAXkzM=;
	b=LZyLdFtCaePWDHfVs0rwVPirrPKdU/pFSl4IQrEGVnTI432S57QUxKk/6lEwPisL7izp
	 32pu/rGbCB0oVEvCieQStrXLMuCAkzAR5xrOfuexx5Cdd4MABVx3ysbSqhwpvD8rnuYUP
	 yQvM3d+I5fv8SdppGfhH4UAAyo5LWqltJWsJoz+lQDHeG7AvKqergWXZn5SSvRjK7qPSm
	 NlBBqVvNXdVm01K5s6W/0j5O1fE/gLatYoFquDcYVLC7qmJrfzOTIQ8BrLCfKYUr26ApX
	 8KgoZNbE3xT7WuiqhkhahbvFnLFj8PiIWupq6dfgQDs24jfkw/GXLtXAmZrEfTqe03w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=DXm9RIM8;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B994606A335;
	Thu, 22 Oct 2026 08:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B994606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=DXm9RIM8
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MSj8Z2rdiJcCmb6g+ksU9pujYJJSBwXRRnHKZsAXkzM=;
	b=DXm9RIM8qiuobe+ZROE2pradlOxRflOwNz1pekBkK/ugRTTImsDmjyLBuSYanaDzTdScKVnzZ
	Mm/Z/CP6wBvEAzYS61ivVUsNObQgNzu5hnkegwsYdqdf6Bd5TYL6ouP4afAQfm/yu6S2DYYwJ3n
	6QaZpevzI6K3nG1rdIGf3jc=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ74gzpz1prjX;
	Thu, 22 Oct 2026 16:48:47 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 29EDD40538;
	Thu, 22 Oct 2026 16:48:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:48:51 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 6/7] arm_mpam: resctrl: Pick L2 classes for the L2 monitor events
Date: Thu, 22 Oct 2026 16:48:20 +0800
Message-ID: <20261022084821.4014873-7-ruanjinjie@huawei.com>
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

mpam_resctrl_pick_counters() previously skipped every cache class that
was not the L3. Allow L2 classes through, route the CSU pick to the
l2c_occupancy event by cache level, and pick a class for the L2
bandwidth event from any L2 class with usable MBWU counters.

Grow MPAM_MAX_EVENT so the counters array, the monitor-init loop and
the per-domain mon_comp array cover the L2 events. Once a platform has
an L2 class the L2 events are described and enabled; the read paths
come next.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 48 +++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 50e5035dcc9d..293122c0d0d9 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -37,15 +37,16 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
 	     rid++, res = &mpam_resctrl_controls[rid])
 
 /*
- * The classes we've picked to map to resctrl events.
- * Resctrl believes all the worlds a Xeon, and these are all on the L3. This
- * array lets us find the actual class backing the event counters. e.g.
- * the only memory bandwidth counters may be on the memory controller, but to
- * make use of them, we pretend they are on L3. Restrict the events considered
- * to those supported by MPAM.
+ * The classes we've picked to map to resctrl events, indexed by event id.
+ * This array lets us find the actual class backing the event counters: the
+ * L2 events use the L2 class, while the L3 bandwidth counters may sit on the
+ * memory controller or another class close to the L3.
+ *
+ * The range also covers QOS_L3_MBM_LOCAL_EVENT_ID, which is left classless:
+ * MPAM cannot distinguish local from remote traffic.
  * Class pointer may be NULL.
  */
-#define MPAM_MAX_EVENT QOS_L3_MBM_TOTAL_EVENT_ID
+#define MPAM_MAX_EVENT QOS_L2_MBM_CORE_EVENT_ID
 static struct mpam_resctrl_mon mpam_resctrl_counters[MPAM_MAX_EVENT + 1];
 
 #define for_each_mpam_resctrl_mon(mon, eventid)					\
@@ -93,7 +94,10 @@ bool resctrl_arch_mon_capable(void)
 	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
 	struct rdt_resource *l3 = &res->resctrl_res;
 
-	/* All monitors are presented as being on the L3 cache */
+	/*
+	 * resctrl monitoring is anchored on the L3 group; L2 monitors are
+	 * additional resources, and monitor-only platforms fake the L3 group.
+	 */
 	return l3->mon_capable;
 }
 
@@ -1128,9 +1132,13 @@ static void mpam_resctrl_pick_counters(void)
 	guard(srcu)(&mpam_srcu);
 	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
 				 srcu_read_lock_held(&mpam_srcu)) {
-		/* The name of the resource is L3... */
-		if (class->type == MPAM_CLASS_CACHE && class->level != 3) {
-			pr_debug("class %u is a cache but not the L3", class->level);
+		/*
+		 * Cache counters are presented as the L2 or L3 resource,
+		 * matching the cache the MSCs were built with.
+		 */
+		if (class->type == MPAM_CLASS_CACHE && class->level != 2 &&
+		    class->level != 3) {
+			pr_debug("class %u is a cache but not L2 or L3", class->level);
 			continue;
 		}
 
@@ -1150,7 +1158,10 @@ static void mpam_resctrl_pick_counters(void)
 				if (update_rmid_limits(class))
 					break;
 
-				counter_update_class(QOS_L3_OCCUP_EVENT_ID, class);
+				counter_update_class(class->level == 2 ?
+						     QOS_L2_OCCUP_EVENT_ID :
+						     QOS_L3_OCCUP_EVENT_ID,
+						     class);
 				break;
 			default:
 				break;
@@ -1174,6 +1185,19 @@ static void mpam_resctrl_pick_counters(void)
 			 */
 			counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
 		}
+
+		/*
+		 * An L2 MSC measures the bandwidth of the traffic its cache
+		 * sees from the CPUs that share it, which is what resctrl
+		 * presents as the per-L2 mbm_core_bytes event.
+		 */
+		if (class->type == MPAM_CLASS_CACHE && class->level == 2 &&
+		    class_has_usable_mbwu(class)) {
+			pr_debug("class %u has usable MBWU for the L2 resource\n",
+				 class->level);
+
+			counter_update_class(QOS_L2_MBM_CORE_EVENT_ID, class);
+		}
 	}
 }
 
-- 
2.43.0


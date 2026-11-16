Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833986;
	b=kp6RDjuHwxs9R+rbmiTc8SKPSqbRegNkZMcQ3rZ+EjfXGl35Rqveq24QAd3RHpJNJO0Z
	 xKySCJC48XOCieyX6ZSDfSvDM7dJaeUshp3eFiQVrOgh/oCp65vN+IPe6pxPW6Sy3JbIv
	 Q8pIb1U8owbBTXwIEgvIker7zB2LIf1Me8jXAMQf6TfKbpyyoewuwVdq4dv3FV2zzo8v+
	 BWm6QLEipOqhVJu4Fkm7E0k0ig0+wW77b+6f6pm6kekGxPH40MW5uTf6jH/bWkJsCDrC1
	 803kCWHq1HfIQK1dpI+vixZTa4FVTc/f/qtM5K5M4S3u0ZdwN8/tUJR5bfH9sJvwy0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833986;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=VOsnbNrX5S/Mt4Sph9gcGarh/50vZrJN8p3w2gZBk6k=;
	b=3TUayKvasDs8sBptaZuvi1tQmmj03XC1rp3hdVdJpvdzQt75PpJM8LG9p+2GFJNWrOAc
	 II3RlgyQwJf/Y/aH9b4bvwXvSle8eEk37VqHramklfrHx1SxCnSudyUZq8CMCmDfdKMvd
	 11raZiHxkjZYcAPDn0H5/BHQmVs5qa4pDRMA/nGzZMCLMNhGVaY31P37BmcZZNDyPgMbp
	 x1WED1oR9lCwt9BnBZah9nsEu0TTHE9sZ58+6G51jRSRJD7iSTz9jeydhfgUuAqCBy2EQ
	 wFwQaE01t7gM2IMG42y2+ZLYTZNJiboDT1+t1iAGmaCzS2y8T04PYITmUUsTg6q3bjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=gc6GFrA2;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082AA606A88D;
	Mon, 16 Nov 2026 12:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 082AA606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=gc6GFrA2
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VOsnbNrX5S/Mt4Sph9gcGarh/50vZrJN8p3w2gZBk6k=;
	b=gc6GFrA26FNAoCXvWzrWATyoL8hVY/iDtaQ+NLYTzx2XMPiZs7Waz9wWVqBModd2e+TFlCUnY
	N5I/ESeAJNpjldfleI/U28YRiOEYC2FQGTAcG8GuSAsLWAi1GyNJRhK4UUjnbCdAj8bO83GlS6X
	UUWJgJl4MQ1RyJ671W3Cm8Y=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxm0m6JzmV6s;
	Mon, 16 Nov 2026 20:59:24 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 61ADF4056C;
	Mon, 16 Nov 2026 20:59:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:41 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <fustini@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 18/19] arm_mpam: resctrl: Expose the L2 monitor events
Date: Mon, 16 Nov 2026 20:59:13 +0800
Message-ID: <20261116125914.498841-19-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116125914.498841-1-ruanjinjie@huawei.com>
References: <20261116125914.498841-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

mpam_resctrl_pick_counters() skips cache classes that are not the L3, so
the CSU and MBWU monitors of an L2 MSC are never used. Allow L2 cache
classes to supply the L2 resource, and let an L2 class with usable MBWU
counters become the L2 bandwidth event.

Check the traffic match before the topology match. An L2 class can never
match the L3 traffic, and topology_matches_l3() warns when a cache has no
online CPU, which is reachable for an L2 cache during boot.

The L3 checks describe where memory bandwidth is measured.
'mbm_core_bytes' is the number of bytes the L2 cache sees rather than the
memory bandwidth, and an L2 class has its own scope and domain ids, so
neither check is needed for it.

No function change for the L3.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 704383304f6b..ce16afcdc1b0 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1128,9 +1128,10 @@ static void mpam_resctrl_pick_counters(void)
 	guard(srcu)(&mpam_srcu);
 	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
 				 srcu_read_lock_held(&mpam_srcu)) {
-		/* The name of the resource is L3... */
-		if (class->type == MPAM_CLASS_CACHE && class->level != 3) {
-			pr_debug("class %u is a cache but not the L3", class->level);
+		if (class->type == MPAM_CLASS_CACHE && class->level != 2 &&
+		    class->level != 3) {
+			pr_debug("class %u is a cache but not L2 or L3",
+				 class->level);
 			continue;
 		}
 
@@ -1150,13 +1151,22 @@ static void mpam_resctrl_pick_counters(void)
 				if (update_rmid_limits(class))
 					break;
 
-				counter_update_class(RDT_RESOURCE_L3, QOS_OCCUP_EVENT_ID, class);
+				counter_update_class(mpam_class_rid(class),
+						     QOS_OCCUP_EVENT_ID, class);
 				break;
 			default:
 				break;
 			}
 		}
 
+		if (class->type == MPAM_CLASS_CACHE && class->level == 2 &&
+		    class_has_usable_mbwu(class)) {
+			pr_debug("class %u has usable MBWU for the L2 resource\n",
+				 class->level);
+			counter_update_class(RDT_RESOURCE_L2, QOS_MBM_TOTAL_EVENT_ID, class);
+			continue;
+		}
+
 		if (class_has_usable_mbwu(class) &&
 		    topology_matches_l3(class) &&
 		    traffic_matches_l3(class)) {
-- 
2.34.1


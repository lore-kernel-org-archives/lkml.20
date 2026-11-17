Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=180.76.5.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794882647;
	b=2DyKGsDKyBiXA0A0Pe1XdfCOHCpMiMQO6wW3RE8N4k/aKizMBOaIXOGXuCCQYTE46eCq
	 Z6q0obuA+5I+oMwz0s5znX6vinM1OghuJ0veAVDao6+J2it976morpcypxEyUAi/kO4F2
	 tgsSvrlSvEFcPthuVoXNvPt6zt63w4+yYg9qbLqKj2iXr9w+yF86w6lcJ1vn8NjHyAzah
	 naNHTOi0ypd3Q3hCsY0FGkTwRu8lHJNrn8A6pSmtTLpA+yL6QayzNVV37lKRHBztw+4Rs
	 ktne790ZqjH+7wKikj1TYrUifTTi78OHryELPRNy6x1LUDSp3U7s5sg7fbslSVYC2wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882647;
	h=DMARC-Filter:X-MD-Sfrom:X-MD-SrcIP:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:DKIM-Signature;
	bh=ZQGH11NNGtGCKX69RvrJdeNlo+f5zRfWTGjLyXVC3po=;
	b=WbMIcoSEstxRH+8Hi91HcFBNR1oWdYdy7BROhmElRvcRlyoc+8EcTXvfthqeRU9UivMI
	 c0jHUX3vhUPVL6daeXQxAw0KqR+ReYouN31IaU3lq7aSpHBtzENVAkNoOwR+sEHIbKWhT
	 OPF6Bxnz48ht3TiMK1LukukD3ic12HDyjwRUO9skM2+kzIrrRuczp+iZHs7CrTXLNTGZL
	 IClG63YE6VaeMTKV6Z2lgDur407tUAFlqkVJpNw4qmtKiufJ04KK80XzCWc9IX6mJ2rsT
	 4DdDgKsb75tzAeSxpbK1MTTqgiXUYVQjdFmyhgB/8wHcPTBCRS3TbKuLXWDUsimFIsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baidu.com;
	spf=pass smtp.mailfrom=baidu.com;
	dkim=pass header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=W+6eg7Kd;
	arc=none smtp.remote-ip=180.76.5.236
Received: from outbound.baidu.com (outbound.baidu.com [180.76.5.236])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 1E9DF606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E9DF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=W+6eg7Kd
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Joerg Roedel <joro@8bytes.org>, Vasant Hegde <vasant.hegde@amd.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon
	<will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH v2] iommu/amd: RCU-protect iommu_ga_log_notifier
Date: Tue, 17 Nov 2026 10:30:31 +0800
Message-ID: <20261117023031.2124-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjhj-exc11.internal.baidu.com (172.31.3.21) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1794882642;
	bh=ZQGH11NNGtGCKX69RvrJdeNlo+f5zRfWTGjLyXVC3po=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=W+6eg7Kdz36lGtgdeEtnz1F1+e1LSfxxjM0x4nICY0ouDSKRkLEjUP4vVj3uctpPZ
	 7PUgrEOrsEOaAv/1EIjMiJmrjR7ZXFnk3+5GU/CxSoEoFtgFM3J1V/F+tPn+F+0Rvy
	 XY5lObK+53J/O7yVfbl15D9fgzhyoQkSfYH0tQxOyzPKMmg/cOepgRqn954DJyJElH
	 LUyd9/qYHnI0iRbfYcEUGL83G5Q81ru6T2NPlGaoS+KpusAscFM3IbPhaXl4AFd9y4
	 arZ/GlmjJjb9/LMaGDq0oxRZKcq/plEXmVE1l5SOIMcbNwo390Ji8wTbDr25JQlrOe
	 gc+DULxT80+Xg==

From: Li RongQing <lirongqing@baidu.com>

iommu_poll_ga_log() accesses iommu_ga_log_notifier without an RCU
read-side critical section, so synchronize_rcu() in the unregister
path does not wait for an in-flight notifier callback.

Use rcu_assign_pointer() when updating the notifier and
rcu_dereference() under rcu_read_lock() when invoking it. Load the
pointer once so the NULL check and the call observe the same value.

Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
Diff with v1:
Changes since v1:
- Replace scoped_guard(rcu) with rcu_read_lock()/rcu_read_unlock().
  There is a single call site and no early return, so the scoped guard
  is unnecessary.
- Keep pr_debug() and pr_err() inside the RCU read-side section.
  printk() does not sleep, so this is legal, and the notifier pointer
  is checked only once.

 drivers/iommu/amd/iommu.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 1df0807..bdf2ed0 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1035,11 +1035,11 @@ static void iommu_poll_events(struct amd_iommu *iommu)
 }
 
 #ifdef CONFIG_IRQ_REMAP
-static int (*iommu_ga_log_notifier)(u32);
+static int (__rcu *iommu_ga_log_notifier)(u32 ga_tag);
 
 int amd_iommu_register_ga_log_notifier(int (*notifier)(u32))
 {
-	iommu_ga_log_notifier = notifier;
+	rcu_assign_pointer(iommu_ga_log_notifier, notifier);
 
 	/*
 	 * Ensure all in-flight IRQ handlers run to completion before returning
@@ -1075,17 +1075,21 @@ static void iommu_poll_ga_log(struct amd_iommu *iommu)
 
 		/* Handle GA entry */
 		switch (GA_REQ_TYPE(log_entry)) {
-		case GA_GUEST_NR:
-			if (!iommu_ga_log_notifier)
-				break;
-
-			pr_debug("%s: devid=%#x, ga_tag=%#x\n",
-				 __func__, GA_DEVID(log_entry),
-				 GA_TAG(log_entry));
-
-			if (iommu_ga_log_notifier(GA_TAG(log_entry)) != 0)
-				pr_err("GA log notifier failed.\n");
+		case GA_GUEST_NR: {
+			int (*notifier)(u32 ga_tag);
+
+			rcu_read_lock();
+			notifier = rcu_dereference(iommu_ga_log_notifier);
+			if (notifier) {
+				pr_debug("%s: devid=%#x, ga_tag=%#x\n",
+					 __func__, GA_DEVID(log_entry),
+					 GA_TAG(log_entry));
+				if (notifier(GA_TAG(log_entry)))
+					pr_err("GA log notifier failed.\n");
+			}
+			rcu_read_unlock();
 			break;
+		}
 		default:
 			break;
 		}
-- 
2.9.4


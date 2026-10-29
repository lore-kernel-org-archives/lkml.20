Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261768;
	b=pDYRp8mDjwGG5PGaT+Hpz2qbmM7XEbJxZ8s59A9gNZWDuAPyDA2HZGkkXBk89dslwiMe
	 zBkFWxhZgcfRC1Guztr+bRkNNw0KXnKuCS/6fgHnAZT9mc3bcHTKxgtsieYYrbkEIHMK5
	 1vDD6h2w91xB17DbkBGimsU2ApWrAUlyVQrTmFCFZLdfM9/D0lRohdd31VKBhMddYu8Bp
	 F6uXLCQGxHIVfSvDptCAGOJ86iNuX2R7IKv2r2QZMAjUA90Y5BxXyB3vHXDzPowXqA0P8
	 G8irLJCFr7vu5G82wJd+I1eXBQPo30r+Zq+oLmaGpY1hdJZ5U6qGiRFd11mlc8akgmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261768;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=N7rfg2aprWIU9nEElbZk+dygg/+VqX7ln1PfCQUsp44=;
	b=LBFpdlj/hmOqslTd9K9ISTdHHxK+/38qRCWVPfPIfV1zAzK7mT1wOuVBeaM/S6mcZj9a
	 gDSbEZnHNNclPNijaYwKekDnIBZhP3RCWmgMps3MAlJSlcjPIJVZxSOlO7y/RONo63/RE
	 5p4obqTirj/mlZumyYsWf39wbN20VPcAa4Kfp0C+dRPAxed4JY97pxX5jE49Wz6a73VBa
	 /Vx4vFkHxF5HZ3iof2hhk3izlzREFGuSpB328qJIBXe2LN425uFgRRkXn0MREnSY+8jdP
	 uaE0QczNCdVahOR6ILSE1GvtwCzOX2U1vjrgfuJIBNehMenwRIBy15TT13fO8nA3S+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RaPpxk7Z;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8FC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F8FC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RaPpxk7Z
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=N7rfg2aprWIU9nEElbZk+dygg/+VqX7ln1PfCQUsp44=;
	b=RaPpxk7ZLgDNzYANp3iqNH/+rOYLLRazvM5H995zvb8mjULMlaiqn5VOUa5nIVT4WUsBEoriN
	lsDxXd9gaqY3t94zE7H0WYDMYyVx1PmKw9ckO3lAKz9JasVOFIMlZaHSFFd+34tsPerQljhN8Pg
	EvU8iCKROB7F/6VICRrAg4o=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jFcVz3fRFz1prN8;
	Thu, 29 Oct 2026 16:15:55 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3264040537;
	Thu, 29 Oct 2026 16:16:04 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 16:16:03 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 1/2] fs/resctrl: Return -EBUSY when per-CLOSID RMIDs are in limbo
Date: Thu, 29 Oct 2026 16:15:12 +0800
Message-ID: <20261029081513.924019-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029081513.924019-1-ruanjinjie@huawei.com>
References: <20261029081513.924019-1-ruanjinjie@huawei.com>
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

resctrl_find_free_rmid() returns -ENOSPC when no matching RMID is
found. With CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID the target CLOSID may
have RMIDs in limbo rather than permanently exhausted.

Check closid_num_dirty_rmid[] for the target CLOSID before returning
-ENOSPC, and return -EBUSY so userspace can retry.

Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>
Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 04e4ea612b7c..b8f4e1ff4083 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -207,9 +207,6 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 	struct rmid_entry *itr;
 	u32 itr_idx, cmp_idx;
 
-	if (list_empty(&rmid_free_lru))
-		return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
-
 	list_for_each_entry(itr, &rmid_free_lru, list) {
 		/*
 		 * Get the index of this free RMID, and the index it would need
@@ -225,7 +222,17 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 			return itr;
 	}
 
-	return ERR_PTR(-ENOSPC);
+	/*
+	 * No free RMID matched. If this CLOSID has RMIDs in limbo, return
+	 * -EBUSY so userspace can retry. Otherwise, the CLOSID is genuinely
+	 * out of RMIDs. When RMIDs are not per-CLOSID, any RMID in limbo
+	 * delays the allocation.
+	 */
+	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
+		return closid_num_dirty_rmid[closid] ? ERR_PTR(-EBUSY) :
+						       ERR_PTR(-ENOSPC);
+
+	return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
 }
 
 /**
-- 
2.34.1


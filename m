Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862602;
	b=aK67FU8F3diRPaOy6voM9YjXci8fdUc0TtBq9G/SCrpTmnYbUibbw1rO7EBJ/QhnKNYA
	 OHxqjkXEw3pGvzrdmP/e73u66xoQE/7l4cfBIDQ9Pb41cdBM/EDKb1U4KQcZF8zQKh84O
	 XFr9pyAtcgcE62sBQvJV7gaASfcDX24/JJqT+yCAObhz7kBIFo1C/TacDn5W8CXkfJYLc
	 MxsT+Hm2HSNMVjWk5tbeTdUPdQFkPCCbWMLmbkvqZFX8K8qKo8RSWij4gqSlfT/W+cn/7
	 JK5vOf2GSC0Yd8c+zVpan6SZ2Vpwam1O5JJzVN9g05ArMV6rJZn+rm4q2FgLcR6t9eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862602;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=W3bFR+OUCXuMRaMVIMQtSVJNUtZFw95ONNKlxIG9dQw=;
	b=E4rDmJGAI1341PkRzlZ7FGW83HCVb8kVWh7SXWhduOU85mJ1B2w4sVdQTodgAwFg6YKk
	 MYfZrDxFyxE4dFM4aEW9btiKrpX/5ouQsvKsPETHj/ZsNVaDnjogawW+aIqfRlNJFjZ/A
	 H5Ped2/10ZeSy1jTJ3tgx5Fb3HSN9jdIsHPZ1qrtFn90H3oCrdtDXsvIPt68Ekayo21JI
	 SJoXZCgnFEY4FImfZ5SWyWF/K1NxS4fb4BWaFoYoPfg5nZ14RvKmVdI2ZnxTI6WTboMYY
	 DHMx/il71HQLFjx+1JEM9aV5itDK78T02wdWTLbh000BO37oiL8ERofLuCnJ74KloqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="OMRqr/on";
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AC1606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81AC1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=OMRqr/on
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=W3bFR+OUCXuMRaMVIMQtSVJNUtZFw95ONNKlxIG9dQw=;
	b=OMRqr/onJ4fN5f/qsW6iI8KkpcQ+NHinFMRSJA8lR9FT/cUFn/PZfFbTVIC2XgLiGYicWsdhM
	YEwZP90BidhKs0Lybrtbd0SsaLTZb1s7p5S64+iaQF5p5D7eOmlP4klUiK2xhERAL5MNlFmG1Os
	oNRWO+buC+dCq5C9nH/I4xE=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jKtjV6hGLzKmZp;
	Thu,  5 Nov 2026 15:09:50 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 259BA4048B;
	Thu,  5 Nov 2026 15:09:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:09:56 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<jic23@kernel.org>, <ben.horgan@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 1/3] fs/resctrl: Report a temporary RMID shortage per CLOSID
Date: Thu, 5 Nov 2026 15:09:32 +0800
Message-ID: <20261105070934.2258613-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105070934.2258613-1-ruanjinjie@huawei.com>
References: <20261105070934.2258613-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)

An RMID that is freed is held in limbo until its cache occupancy drops
below the threshold, after which it returns to the free list. A request
that fails because of limbo is thus temporary and worth retrying, which
resctrl reports to userspace as -EBUSY. A request that fails because
every RMID is in use is permanent and reported as -ENOSPC.

Where an RMID is only meaningful together with a CLOSID, a request can
only be satisfied by an RMID belonging to the requested CLOSID, so the
distinction has to be drawn per CLOSID. Instead it is drawn system wide.
-ENOSPC is reported when the free list holds no RMID for the requested
CLOSID, even when that CLOSID has RMIDs in limbo. -EBUSY is reported
when the free list is empty and another CLOSID has an RMID in limbo,
even when the requested CLOSID has none. Userspace is thus told to give
up on a shortage that may clear on its own, and to retry one that cannot
clear until it removes a group itself.

Architectures where the RMID is independent of the CLOSID always match
the first entry on the free list, so neither case arises there and only
MPAM systems are affected.

Draw the distinction from the number of RMIDs the requested CLOSID has
in limbo where the RMID depends on the CLOSID, and from the system wide
count otherwise. Drop the separate test for an empty free list, which
the search handles on its own.

Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>
Cc: <stable@vger.kernel.org> # 7.1.x
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318011;
	b=pDDR43knDRfl0fSCDxme3qISWr/4tZqi77AqWgM/zKZK4+P8MX3r7uPCgbrvtbb/qmEN
	 CI/HFFtpQHPLEyCd9th3STgvxYczFuEWlxW74WHnkE3jOXydeQMcEVDLOIxmOWzdXz2LE
	 3lTqDDe16TIkdZozUHHRGjS0nnMdeCLY9lv+ybFga2wNkupG5zSmsMkQtXqJS5REP3vhB
	 e/vnvQ43tV70yIkE7SMCbwOSrKRPITmCEkNNxgEeSpgtbtB1LIDc+v7cfWlppDnhvrhoq
	 OecUtBunSO/asD27zURTyE2hWKf1NyGClxFQ4iilBRJsOJfYvjQ2QLg+5MJXDERKSCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318011;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=zSBnRfstLFOLJk+BY0dtRWMawegjn8REAGRmsm4ud7c=;
	b=PC1UZf6y6dHCnfLtl7kRoCAI8CD0DtrMLji/urDZovfEI6uyK2wTfT/6x1Te/F8Npw9i
	 HIY2yBUICLr4LtGt0QPCmw7+qvpRyUC9bqOYL59GQJOqzVnfnCXys4GKuuUVylM8IjjHS
	 Iimyob0O9QLNnG3o5rVnNDTpzbLROnrzyxBCg+AtDscews4e79rre9vVXZX9yUjMQGh79
	 nfg1sezkis7AxFsRSPJJg4zEhIrlEc2BMnvliGzoRJs4CIfsuGhkhbxt7ETS5Xj40jkqB
	 ym/vL8qeoxtk/pes9uZX966OId2kapmpl1ygwVtv6eVlukIkwQJi0t7Hyp1+LO1Nimg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=UBCYnugU;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC1D606A7C9;
	Tue, 10 Nov 2026 13:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EC1D606A7C9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=UBCYnugU
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zSBnRfstLFOLJk+BY0dtRWMawegjn8REAGRmsm4ud7c=;
	b=UBCYnugURFX2k+6sGCKv3+d1buWao2ZJIOw6lCh4G0PlmvVPfGr8eS0EK4Vs3n5zLI8fgincE
	TyAxs1KYK+Eo4djWGTuh0nlj1qDMg0RrbSwP5VS6oRaNiYCWdWC+GWIdh3FIfc7X/CDuas7Tyi4
	qHqf1YDaWGm3WQIZkdNgR08=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jP77D0RDyzRhSl;
	Tue, 10 Nov 2026 21:39:52 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id F33B240538;
	Tue, 10 Nov 2026 21:40:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 21:40:00 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <will@kernel.org>, <gshan@redhat.com>,
	<zengheng4@huawei.com>, <jic23@kernel.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v5 RESEND 1/7] fs/resctrl: Report a temporary RMID shortage per CLOSID
Date: Tue, 10 Nov 2026 21:39:32 +0800
Message-ID: <20261110133938.3768632-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110133938.3768632-1-ruanjinjie@huawei.com>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
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
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
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


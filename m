Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793428636;
	b=TkLG3/TTwGnY4ho+p+6cR69/iX9RXMKRKV4GkrFpCIvhCQWo3hVfQmsTyDiLHYhsdZQo
	 v0hvrhOpBmtG3IWai+0/Xg/VdFD8iip9OGFzRDwJTE3aHkNxkOkpVQQkU/YQ3tU235ceT
	 sjPmFZre0SvjZvDmdNdGzPyRRCtDnhInP5db1qnfZ8bH3Tbg0l6I87ee4FRagnQdpOjm3
	 Dx6wqbDg7KSF/3SCJk3567HFYVO8lGA/ZwCZTOkjh4Tt4AUkbjTMHoBVge2iGqmvrHflT
	 0RzZJIPrK4xNLYlwzV7LJclGAhpl0ya7M5qaBeatFdxr99bMBm55BRZkmP/h57U0+EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793428636;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ZaU92wQOKtZlhr0N7Xv6iaFNmTDPTrxP4sRgQMzCUB4=;
	b=XizlI1qtkPdLf0jAJ2SjO0k1Rq26PO/K0j0kQi+SfGlMYZpr/pSpyQVIeod76qlZ4SD6
	 SOzMd00ulM63Y8hNtgyT5XDuv3EYNjG24Ofjitv7seISGAlFXJRNtGkwcrgJtNT8xGE2v
	 O6ECY++k6tzdjHoSgkYXJtwL3lp6OMyIfvMBcNKQjKTfsDOwERDPM+zBvMOSJA1mMMEsC
	 L/HcHpIHX6oDsOaCwQJUfp8l/3YPMlJ4SvJBVxakTXzfonPCLEs9hmmOCTwTrW8a3FYkV
	 2TCypJN7ytTan89PpbDmcgY0RkfebQ99swnf8Sa6Yfya4RigZrW9a0gIJLHwQ6b/heA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=n+6KDBva;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1197606A323
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1197606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=n+6KDBva
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZaU92wQOKtZlhr0N7Xv6iaFNmTDPTrxP4sRgQMzCUB4=;
	b=n+6KDBvaOE1D85wjEDmglys4+uO1EX4b88F0YY3B7DXsu7A/uIpTOpiNj9fTFV0zILH2zSTsi
	VO99vX7WwevKPWF1/XxOtWXuWT5FQ3d5SbMNym7+zcKiX5jdywCi+cIyRgNeI42iLLMKB0RxFeD
	YLLrLWZYtOo7fRbgqhkmNYI=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jGpCy23ZTz1prRK;
	Sat, 31 Oct 2026 14:37:02 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A8564056E;
	Sat, 31 Oct 2026 14:37:04 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 31 Oct
 2026 14:37:03 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 1/2] fs/resctrl: Report a temporary RMID shortage per CLOSID
Date: Sat, 31 Oct 2026 14:36:33 +0800
Message-ID: <20261031063634.1678345-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031063634.1678345-1-ruanjinjie@huawei.com>
References: <20261031063634.1678345-1-ruanjinjie@huawei.com>
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
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>
Cc: <stable@vger.kernel.org> # 7.1.x
---
 fs/resctrl/monitor.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 73413cb128ea..88674e28b2f8 100644
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


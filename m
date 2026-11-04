Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787627;
	b=Xb1xrHN4Heqwg7fq3DpDycPPjXNKAYC5JaJbu8/Cc2mumkbYkWfSXHjSGwXOS6PJuG1G
	 +T/KklumYU7G4ov7wM7oAND1jkoQ7xHHH1PlIRSfBZS6lmmc/zi8tlQ6TOsOUR1bXBMXM
	 uZuq+MzTQ00TOwMo8Q9ZBgyVHZ+p0kLcL0vaAytUHSd5FeLsx/w9Zf1aWhPRTwLTwLhj+
	 6dpq8vaUQF+KTObspPvr9la7W9WwI4QyydLLSYLwu5qhwsAArY1VVr7eIhAQsxsqnA/Py
	 Ny6qMPjaSO/RP1sh0BP3QqQQBnlPIUlvQZORph6FDXCnmTZWPX5EbOiRix1M5EGkLxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787627;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=hvy80TOOnpyiMTofQTbLc58BIBQ/JRGZ4BGlqL0QRns=;
	b=elf4a/jDjX3xtbI91aDgkGhkLfh2lpZov3n5AnItwIPhcGeagpZhV8McLy/8fzlm1Mgd
	 AQzYHft0ff/kNFOM4NInoiQhQ+7WoTrM73Uu/9e5kN6xU2s9sq+tuLYcfo49GRqloA+nH
	 cg34IE39ad6GgoTkOMF9fbAUotaErPAXNvVUtCiXMbV605NiiytUYLY0OdVF+9/0zddXU
	 AMhDBf1p7F50GaOMFRJdruqgUhkarT//utwrLwlNIIDD6LHwb4O5ebZ16gB7DATEvdDnG
	 P+jQi0/lfSqcr1GVlEaoF6y+XtM4bXu5iSB2sDtRynbssqfmFZHMbWozaPSxABUNM4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=iCVp53+P;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9428606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9428606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=iCVp53+P
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hvy80TOOnpyiMTofQTbLc58BIBQ/JRGZ4BGlqL0QRns=;
	b=iCVp53+PMdGcmkdYpcO3bVWfKMysFB7UfTCvF9AhhprOY6YP9ZbQNo52DutpfypSjv9GmLUmT
	rxBCaiN2JdcW/iA7Tl+Ayn/Nri5vIHHC/k6wpLTJL6T2I7J520yZ9BfbldWSELl3Z1ERh3wjfL+
	FyuSWJIzdB9rPk7epfpK41Q=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jKLzb4f7Dz1cySB;
	Wed,  4 Nov 2026 18:20:11 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C6D8540561;
	Wed,  4 Nov 2026 18:20:22 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 18:20:22 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] fs/resctrl: Allocate the RMID array with kvzalloc
Date: Wed, 4 Nov 2026 18:20:04 +0800
Message-ID: <20261104102004.609259-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

setup_rmid_lru_list() sizes rmid_ptrs[] by the whole RMID index space.
On x86 the index is the RMID, so the array stays small. On MPAM the
index space is the product of the PARTID and PMG ranges, and with a
large range the array is megabytes in size.

kzalloc() needs a high-order page allocation for it, which fails once
memory is fragmented, and a size above KMALLOC_MAX_SIZE always fails.
resctrl then fails to mount.

Use kvzalloc(), which falls back to vmalloc().

Fixes: 6791e0ea3071 ("x86/resctrl: Access per-rmid structures by index")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1.x
Cc: Tony Luck <tony.luck@intel.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Babu Moger <babu.moger@amd.com>
---
 fs/resctrl/monitor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index f69dbf66f42e..7713aa5d3996 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -1029,7 +1029,7 @@ int setup_rmid_lru_list(void)
 		return 0;
 
 	idx_limit = resctrl_arch_system_num_rmid_idx();
-	rmid_ptrs = kzalloc_objs(struct rmid_entry, idx_limit);
+	rmid_ptrs = kvzalloc_objs(struct rmid_entry, idx_limit);
 	if (!rmid_ptrs)
 		return -ENOMEM;
 
@@ -1125,7 +1125,7 @@ void free_rmid_lru_list(void)
 		return;
 
 	mutex_lock(&rdtgroup_mutex);
-	kfree(rmid_ptrs);
+	kvfree(rmid_ptrs);
 	rmid_ptrs = NULL;
 	mutex_unlock(&rdtgroup_mutex);
 }
-- 
2.34.1


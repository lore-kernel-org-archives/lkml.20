Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2424948F830
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847896; cv=none; b=LddNmNyKWoCKfSbk2tHYb1heOYUcA2Ty75RiBxJiWg92amUTeivrS81ejdscu14hTjBJIWa7oo+xfvl8zTTG/78+bqvx5Ju3z49ziXUyp+LvtzJZUhumA/X1nv7TpAH0xPEchk6kaDgm4Cc9srd21+dXYbCJn/TVydFv+AvxXsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847896; c=relaxed/simple;
	bh=Hzhaxw/Y44kMWGiScMy4uMzYjI1VVlV4Rpa3MtTyC1U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PtX6CPdjN919b9+RyfIfDMne9jdLuoDlbu7RNNLKKLNJVFWc/dqHk3RiFab2SFRxRQq1HQtCq9ZDy4lnS9BLz6pusHHFbQehwKzwNqSLP0VqgstB0DO47jT8fYUFq+3IrwJn0qO+fV21q0vk5KY5a3TQ+I5a1NLGXyRimqLqdIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=CccpWaUs; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="CccpWaUs"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fUa7pS4OHibv7k1aZNkFDzTCnQ9Tn89o+Rildjw0B6k=;
	b=CccpWaUsRgM2J3CMlge2JDc32pT8dih8KCHNscYv2r+jgWhSa/BbR/8RILkH8O5kbpzttbHXn
	6tbp/SC/chqJ3BbIXL3K7I04ctuktFcHeXy6i4fEkUR+lXXsoWpfO3tQGirIX0pTiGi04wxJ/z+
	pCpZ1bHP36L3Y9WHJC9YEtw=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KF5v67zHnH3h;
	Fri, 28 Aug 2026 00:24:01 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id D049140572;
	Fri, 28 Aug 2026 00:24:37 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:37 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 15/18] arm64: add support of NUMA replication for ptdump
Date: Fri, 28 Aug 2026 00:11:55 +0800
Message-ID: <20260827161158.3618409-16-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
Reply-To: <artem.kuzin@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)

Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
Acked-by: Denis Darvish <darvish.denis@huawei.com>
Signed-off-by: Nikita Panov <panov.nikita@huawei.com>
---
 arch/arm64/mm/ptdump.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 5a76c59b5ada..17c4de4b9b3e 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -18,6 +18,7 @@
 #include <linux/ptdump.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
+#include <linux/numa_kernel_replication.h>
 
 #include <asm/fixmap.h>
 #include <asm/kasan.h>
@@ -328,7 +329,7 @@ static struct ptdump_info kernel_ptdump_info __ro_after_init = {
 	.mm		= &init_mm,
 };
 
-bool ptdump_check_wx(void)
+static bool ptdump_check_wx_pgd(struct mm_struct *mm, pgd_t *pgd)
 {
 	struct ptdump_pg_state st = {
 		.seq = NULL,
@@ -353,7 +354,7 @@ bool ptdump_check_wx(void)
 		}
 	};
 
-	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
+	ptdump_walk_pgd(&st.ptdump, mm, pgd);
 
 	if (st.wx_pages || st.uxn_pages) {
 		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found, %lu non-UXN pages found\n",
@@ -367,6 +368,25 @@ bool ptdump_check_wx(void)
 	}
 }
 
+
+#ifdef CONFIG_KERNEL_REPLICATION
+bool ptdump_check_wx(void)
+{
+	bool res = false;
+	int nid;
+
+	for_each_memory_node(nid)
+		res |= ptdump_check_wx_pgd(&init_mm, per_node_pgd(&init_mm, nid));
+
+	return res;
+}
+#else
+bool ptdump_check_wx(void)
+{
+	return ptdump_check_wx_pgd(&init_mm, init_mm->pgd);
+}
+#endif
+
 static int __init ptdump_init(void)
 {
 	u64 page_offset = _PAGE_OFFSET(vabits_actual);
-- 
2.34.1


Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB637485CCB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847893; cv=none; b=XrYzoA2j1GgbYMvl12uMUw3qCE/FfkxtqkRlv7/EnfCUAS+vwrjf2wPTvRkyo0VxwP9IK48Ze4mW5SPg2Fqi9IOSKEjE9hb6gMMU2wFOdhNwQNo/4WFgQVJfnq4v63yWfQj+nJyIgzNJ0cGV9aTJBl9Sb38OwVTXtIljAK570i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847893; c=relaxed/simple;
	bh=CYqTiCgLA71tvPjxzXDbgehBFPEQs0cWBX5qVOFNlX0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tu0uP34vk9883LHXl0Co6tmsva1UVN/HMa638g3gvohkC+nsZ/kaRlhBwjgen9UBVwbj3hw4bL0cxJARFki0hHUyBMBy4trcGllFEfAVDiCWk3ZJIXSOEzir/EQXROqWSQIJJWMeAFjXUfoY2RBRkVF7z1csuOKoP9uLAzsGTgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=C5IJTV4J; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="C5IJTV4J"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nKuenaCAMTLlNwdMoPfzm2hy+Pt0nBKVk4JpQv+n4NM=;
	b=C5IJTV4J1n9lw97V91/ERsJm3aHcbmynLEqmLveBrW9NAaQwfyJydojAtXyn2UNJqUnmRe9/R
	/2NlQfieQix/TjmZIknLChLnXdZdbA6mhO+V26YMdxKCAX2+4toDfUmszt5rt6Z8uN6/UWCOrqY
	YeCb5qZebuNEjUDCVmnBgbg=
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KW1nY9zJ469r;
	Fri, 28 Aug 2026 00:24:15 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id C651A4058D;
	Fri, 28 Aug 2026 00:24:36 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:36 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 07/18] arm64: add support of memory protection for NUMA replicas
Date: Fri, 28 Aug 2026 00:11:47 +0800
Message-ID: <20260827161158.3618409-8-panov.nikita@huawei.com>
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
 arch/arm64/mm/pageattr.c | 72 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index bbe98ac9ad8c..50a76385b184 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -9,6 +9,7 @@
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
 #include <linux/pagewalk.h>
+#include <linux/numa_kernel_replication.h>
 
 #include <asm/cacheflush.h>
 #include <asm/pgtable-prot.h>
@@ -102,7 +103,7 @@ bool can_set_direct_map(void)
 		arm64_kfence_can_set_direct_map() || is_realm_world();
 }
 
-static int update_range_prot(unsigned long start, unsigned long size,
+static int update_range_prot_pgd(pgd_t *pgtable, unsigned long start, unsigned long size,
 			     pgprot_t set_mask, pgprot_t clear_mask)
 {
 	struct page_change_data data;
@@ -123,12 +124,19 @@ static int update_range_prot(unsigned long start, unsigned long size,
 	 * must be eliminated by splitting the mapping.
 	 */
 	ret = walk_kernel_page_table_range_lockless(start, start + size,
-						    &pageattr_ops, NULL, &data);
+						    &pageattr_ops, pgtable, &data);
 	lazy_mmu_mode_disable();
 
 	return ret;
 }
 
+static int update_range_prot(unsigned long start, unsigned long size,
+			     pgprot_t set_mask, pgprot_t clear_mask)
+{
+	return update_range_prot_pgd(NULL, start, size, set_mask, clear_mask);
+}
+
+
 static int __change_memory_common(unsigned long start, unsigned long size,
 				  pgprot_t set_mask, pgprot_t clear_mask)
 {
@@ -147,6 +155,22 @@ static int __change_memory_common(unsigned long start, unsigned long size,
 	return ret;
 }
 
+#ifdef CONFIG_KERNEL_REPLICATION
+static int __change_memory_common_replicas(unsigned long start, unsigned long size,
+					pgprot_t set_mask, pgprot_t clear_mask)
+{
+	int nid;
+	int ret;
+
+	for_each_memory_node(nid) {
+		ret |= update_range_prot_pgd(per_node_pgd(&init_mm, nid), start, size, set_mask, clear_mask);
+	}
+
+	flush_tlb_kernel_range(start, start + size);
+	return ret;
+}
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 static int change_memory_common(unsigned long addr, int numpages,
 				pgprot_t set_mask, pgprot_t clear_mask)
 {
@@ -211,6 +235,20 @@ static int change_memory_common(unsigned long addr, int numpages,
 	return __change_memory_common(start, size, set_mask, clear_mask);
 }
 
+#ifdef CONFIG_KERNEL_REPLICATION
+static int numa_change_memory_common(unsigned long addr, int numpages,
+				pgprot_t set_mask, pgprot_t clear_mask)
+{
+	int ret;
+
+	ret = change_memory_common(addr, numpages, set_mask, clear_mask);
+	if (ret)
+		return ret;
+
+	return __change_memory_common_replicas(addr, numpages * PAGE_SIZE, set_mask, clear_mask);
+}
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 int set_memory_ro(unsigned long addr, int numpages)
 {
 	return change_memory_common(addr, numpages,
@@ -239,6 +277,36 @@ int set_memory_x(unsigned long addr, int numpages)
 					__pgprot(PTE_PXN));
 }
 
+#ifdef CONFIG_KERNEL_REPLICATION
+int numa_set_memory_x(unsigned long addr, int numpages)
+{
+	return numa_change_memory_common(addr, numpages,
+					__pgprot(PTE_MAYBE_GP),
+					__pgprot(PTE_PXN));
+}
+
+int numa_set_memory_nx(unsigned long addr, int numpages)
+{
+	return numa_change_memory_common(addr, numpages,
+					__pgprot(PTE_PXN),
+					__pgprot(PTE_MAYBE_GP));
+}
+
+int numa_set_memory_ro(unsigned long addr, int numpages)
+{
+	return numa_change_memory_common(addr, numpages,
+					__pgprot(PTE_RDONLY),
+					__pgprot(PTE_WRITE));
+}
+
+int numa_set_memory_rw(unsigned long addr, int numpages)
+{
+	return numa_change_memory_common(addr, numpages,
+					__pgprot(PTE_WRITE),
+					__pgprot(PTE_RDONLY));
+}
+#endif /*CONFIG_KERNEL_REPLICATION*/
+
 int set_memory_valid(unsigned long addr, int numpages, int enable)
 {
 	if (enable)
-- 
2.34.1


Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F4484241
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847890; cv=none; b=P4tDyLNrCzf5DYAtdHD1yV3rpT21PbatdY3SGohCahr2o8Pzz7ouuIt0dqJjKTK/Hl4XRDBzmLv4BoyGCrqWpO2EfgKvYMy8ZzT24aryJY6Y+UDBUi2Se9KRpxx7wPAiOpWS0fHHurrzH2vqBjgHeLRF0vdUtCn7pS3I+iolAhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847890; c=relaxed/simple;
	bh=3Zi2sFCCUVjDBomdDDl7ydJXjOBy1jc6tc/I4IKpFzE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dqngE39uuhK10b0tqu8FvIKMGYkgnAvHCVv5KBgkVfiDXsklcyiJn+mnA0/CDlj750lRJplQP+ZgyK9tnF1SgADsBdS7ew4IyZjKaIM8h8KR9tyzonY2jpA87FAJ48fvkJC5VU0Ly5PEs6r/wOnXgiVh/AGNHk52bhe7uAe1Z/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ggXzahVa; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ggXzahVa"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ubyjPs0XPl7ANEpl0YX14bjSE3xYgWesyhGRSLOi9nc=;
	b=ggXzahVaaBfCtHNRVFOrt6bSpyceyYC+W328qh5SyVVXpU7ve6ADh6fJGtgRPWvJ1Ro+sDJKs
	grtkf31gGgNDbjaZXxwrccLWpDTBTV9bFUMtSs+XQZKgw7pfzz3bMSYuJ9U/ZgkMRlD0E1zNXPT
	VnMYHbLlgtfayKqSH8rHPFE=
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KD6DMWzHnH3v;
	Fri, 28 Aug 2026 00:24:00 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id DB7054058E;
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
Subject: [RFC PATCH 06/18] mm: add support of memory protection for NUMA replicas
Date: Fri, 28 Aug 2026 00:11:46 +0800
Message-ID: <20260827161158.3618409-7-panov.nikita@huawei.com>
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
 include/linux/set_memory.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 3030d9245f5a..03fccacef037 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -7,11 +7,32 @@
 
 #ifdef CONFIG_ARCH_HAS_SET_MEMORY
 #include <asm/set_memory.h>
+
+#ifdef CONFIG_KERNEL_REPLICATION
+int numa_set_memory_ro(unsigned long addr, int numpages);
+int numa_set_memory_rw(unsigned long addr, int numpages);
+int numa_set_memory_x(unsigned long addr, int numpages);
+int numa_set_memory_nx(unsigned long addr, int numpages);
+#else
+
+#define numa_set_memory_ro set_memory_ro
+#define numa_set_memory_rw set_memory_rw
+#define numa_set_memory_x  set_memory_x
+#define numa_set_memory_nx set_memory_nx
+
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 #else
 static inline int __must_check set_memory_ro(unsigned long addr, int numpages) { return 0; }
 static inline int __must_check set_memory_rw(unsigned long addr, int numpages) { return 0; }
 static inline int __must_check set_memory_x(unsigned long addr,  int numpages) { return 0; }
 static inline int __must_check set_memory_nx(unsigned long addr, int numpages) { return 0; }
+
+#define numa_set_memory_ro set_memory_ro
+#define numa_set_memory_rw set_memory_rw
+#define numa_set_memory_x  set_memory_x
+#define numa_set_memory_nx set_memory_nx
+
 #endif
 
 #ifndef set_memory_rox
@@ -24,6 +45,20 @@ static inline int set_memory_rox(unsigned long addr, int numpages)
 }
 #endif
 
+#ifndef numa_set_memory_rox
+#ifdef CONFIG_KERNEL_REPLICATION
+static inline int numa_set_memory_rox(unsigned long addr, int numpages)
+{
+	int ret = numa_set_memory_ro(addr, numpages);
+	if (ret)
+		return ret;
+	return numa_set_memory_x(addr, numpages);
+}
+#else
+#define numa_set_memory_rox set_memory_rox
+#endif
+#endif
+
 #ifndef CONFIG_ARCH_HAS_SET_DIRECT_MAP
 static inline int set_direct_map_invalid_noflush(struct page *page)
 {
-- 
2.34.1


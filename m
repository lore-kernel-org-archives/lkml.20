Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20AB48F821
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847895; cv=none; b=IkWLpu9Fg7HToHaGerDI6KNtBks1V26rfeuPFQozqWi3THpDms9z5lA4aSH13X79CKjSYZFRapT+FBEArRA/ge6f3TtYTyYqa04dWcCk4kB0YG0KayQqDZcA4PRfGPvC5ztXtwkVACVfjGFAgkrqLhcte1RF7+mJdds6O+e8NH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847895; c=relaxed/simple;
	bh=BGWZvSQWJSKKeNHeHVkuEinhxork/JYU52fkZCLmHGU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jmm4aQQWToiJx3sUrCDL53XGOhB5sefFLlHuHouIpvf2ao8D8nmBiKSX5WA4lfvza69UaKrxHPAL2UYasyP9inCZLghsjwh1dccSYApbz+wUnGeK2c2+Sj9/tEEQ5HGj9p7zvK8Ld1JvTvcQaZ6+QBubj7rArrUkJ2LgaJaaigI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=xLmUHxdt; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="xLmUHxdt"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xAGNWJtbQb3AJ1HJQX61n/LHCCEcBpCaICJCBWpxqGI=;
	b=xLmUHxdtznvn14bKKb3Ae8Py9BGbsGZqW/mdynm2ysF18alkLLyUC/mTjbs9FM+IA4EMsY9Eg
	zCsPR8FkLdAC+gJ2+MTxLuwMlQQc1uJIXoR8zHE4WD/zGUWFsZXsiVf3Rr2lo/hmf4hDucR9LZt
	dUOIyHkNGI1TeXQ0Xw9IW6M=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KF4jbczHnH3h;
	Fri, 28 Aug 2026 00:24:01 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id A74DA40572;
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
Subject: [RFC PATCH 13/18] arm64: make kernel text patching aware about replicas
Date: Fri, 28 Aug 2026 00:11:53 +0800
Message-ID: <20260827161158.3618409-14-panov.nikita@huawei.com>
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
 arch/arm64/kernel/alternative.c | 33 +++++++++++-
 arch/arm64/kernel/patching.c    | 96 +++++++++++++++++++++++++++++++++
 2 files changed, 128 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/alternative.c b/arch/arm64/kernel/alternative.c
index f5ec7e7c1d3f..e85644d64bbd 100644
--- a/arch/arm64/kernel/alternative.c
+++ b/arch/arm64/kernel/alternative.c
@@ -10,6 +10,7 @@
 
 #include <linux/init.h>
 #include <linux/cpu.h>
+#include <linux/numa_kernel_replication.h>
 #include <linux/elf.h>
 #include <asm/cacheflush.h>
 #include <asm/alternative.h>
@@ -139,6 +140,36 @@ static noinstr void clean_dcache_range_nopatch(u64 start, u64 end)
 	} while (cur += d_size, cur < end);
 }
 
+#ifdef CONFIG_KERNEL_REPLICATION
+static void __write_alternatives(struct alt_instr *alt,
+					 alternative_cb_t alt_cb,
+					 __le32 *origptr, __le32 *updptr,
+					 int nr_inst)
+{
+	if (is_text_replicated() && is_kernel_text((unsigned long)origptr)) {
+		int nid;
+
+		for_each_memory_node(nid) {
+			__le32 *ptr = numa_get_replica(origptr, nid);
+
+			alt_cb(alt, origptr, ptr, nr_inst);
+			clean_dcache_range_nopatch((u64)ptr,
+						   (u64)(ptr + nr_inst));
+		}
+	} else {
+		alt_cb(alt, origptr, updptr, nr_inst);
+	}
+}
+#else
+static void __write_alternatives(struct alt_instr *alt,
+					 alternative_cb_t alt_cb,
+					 __le32 *origptr, __le32 *updptr,
+					 int nr_inst)
+{
+	alt_cb(alt, origptr, updptr, nr_inst);
+}
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 static int __apply_alternatives(const struct alt_region *region,
 				bool is_module,
 				unsigned long *cpucap_mask)
@@ -174,7 +205,7 @@ static int __apply_alternatives(const struct alt_region *region,
 			alt_cb = patch_alternative;
 		}
 
-		alt_cb(alt, origptr, updptr, nr_inst);
+		__write_alternatives(alt, alt_cb, origptr, updptr, nr_inst);
 
 		if (!is_module) {
 			clean_dcache_range_nopatch((u64)origptr,
diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 09f019c6547a..8bac14198459 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -5,6 +5,7 @@
 #include <linux/spinlock.h>
 #include <linux/stop_machine.h>
 #include <linux/uaccess.h>
+#include <linux/numa_kernel_replication.h>
 
 #include <asm/cacheflush.h>
 #include <asm/fixmap.h>
@@ -15,6 +16,7 @@
 
 static DEFINE_RAW_SPINLOCK(patch_lock);
 
+#ifndef CONFIG_KERNEL_REPLICATION
 static bool is_exit_text(unsigned long addr)
 {
 	/* discarded with init text/data */
@@ -42,6 +44,17 @@ static void __kprobes *patch_map(void *addr, int fixmap)
 
 	return (void *)set_fixmap_offset(fixmap, phys);
 }
+#else
+static void __kprobes *patch_map(void *addr, int fixmap, int nid)
+{
+	struct page *page;
+
+	page = walk_to_page_node(nid, addr);
+	BUG_ON(!page);
+
+	return (void *)set_fixmap_offset(fixmap, page_to_phys(page) + offset_in_page(addr));
+}
+#endif /* CONFIG_KERNEL_REPLICATION */
 
 static void __kprobes patch_unmap(int fixmap)
 {
@@ -63,6 +76,28 @@ int __kprobes aarch64_insn_read(void *addr, u32 *insnp)
 	return ret;
 }
 
+#ifdef CONFIG_KERNEL_REPLICATION
+static int __kprobes __aarch64_insn_write(void *addr, __le32 insn)
+{
+	int nid;
+	void *waddr = addr;
+	unsigned long flags = 0;
+	int ret;
+
+	raw_spin_lock_irqsave(&patch_lock, flags);
+	for_each_memory_node(nid) {
+		waddr = patch_map(addr, FIX_TEXT_POKE0, nid);
+		ret = copy_to_kernel_nofault(waddr, &insn, AARCH64_INSN_SIZE);
+		patch_unmap(FIX_TEXT_POKE0);
+
+		if (ret || !is_text_replicated())
+			break;
+	}
+	raw_spin_unlock_irqrestore(&patch_lock, flags);
+
+	return ret;
+}
+#else
 static int __kprobes __aarch64_insn_write(void *addr, __le32 insn)
 {
 	void *waddr = addr;
@@ -79,12 +114,37 @@ static int __kprobes __aarch64_insn_write(void *addr, __le32 insn)
 
 	return ret;
 }
+#endif /* CONFIG_KERNEL_REPLICATION */
 
 int __kprobes aarch64_insn_write(void *addr, u32 insn)
 {
 	return __aarch64_insn_write(addr, cpu_to_le32(insn));
 }
 
+#ifdef CONFIG_KERNEL_REPLICATION
+noinstr int aarch64_insn_write_literal_u64(void *addr, u64 val)
+{
+	int nid;
+	u64 *waddr;
+	unsigned long flags;
+	int ret;
+
+	raw_spin_lock_irqsave(&patch_lock, flags);
+	for_each_memory_node(nid) {
+		waddr = patch_map(addr, FIX_TEXT_POKE0, nid);
+
+		ret = copy_to_kernel_nofault(waddr, &val, sizeof(val));
+
+		patch_unmap(FIX_TEXT_POKE0);
+
+		if (ret || !is_text_replicated())
+			break;
+	}
+	raw_spin_unlock_irqrestore(&patch_lock, flags);
+
+	return ret;
+}
+#else
 noinstr int aarch64_insn_write_literal_u64(void *addr, u64 val)
 {
 	u64 *waddr;
@@ -101,9 +161,44 @@ noinstr int aarch64_insn_write_literal_u64(void *addr, u64 val)
 
 	return ret;
 }
+#endif /* CONFIG_KERNEL_REPLICATION */
 
 typedef void text_poke_f(void *dst, void *src, size_t patched, size_t len);
 
+#ifdef CONFIG_KERNEL_REPLICATION
+static void *__text_poke(text_poke_f func, void *addr, void *src, size_t len)
+{
+	unsigned long flags;
+	size_t patched = 0;
+	size_t size;
+	void *waddr;
+	void *ptr;
+
+	raw_spin_lock_irqsave(&patch_lock, flags);
+
+	while (patched < len) {
+		int nid;
+
+		ptr = addr + patched;
+		size = min(PAGE_SIZE - offset_in_page(ptr), len - patched);
+
+		for_each_memory_node(nid) {
+			waddr = patch_map(ptr, FIX_TEXT_POKE0, nid);
+			func(waddr, src, patched, size);
+			patch_unmap(FIX_TEXT_POKE0);
+
+			if (!is_text_replicated())
+				break;
+		}
+		patched += size;
+	}
+	raw_spin_unlock_irqrestore(&patch_lock, flags);
+
+	flush_icache_range((uintptr_t)addr, (uintptr_t)addr + len);
+
+	return addr;
+}
+#else
 static void *__text_poke(text_poke_f func, void *addr, void *src, size_t len)
 {
 	unsigned long flags;
@@ -130,6 +225,7 @@ static void *__text_poke(text_poke_f func, void *addr, void *src, size_t len)
 
 	return addr;
 }
+#endif
 
 static void text_poke_memcpy(void *dst, void *src, size_t patched, size_t len)
 {
-- 
2.34.1


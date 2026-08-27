Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A17A48D89B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847894; cv=none; b=ExoLo++KPc/0wfT1Fdh9FrppP8tn68bkzoDk1CfQeDgaCw9f8gwGxbBytvLQLUUFUf2M70s/hdSxJsSqZpKS/Ezc7d06fh3b/BsxFI6VMhPLj5S3ZOIBlb8U8tBiduES1ywu2Dj4Sc6LKPc9hFrhzSUYwmp34sy0IzoxcpGW4y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847894; c=relaxed/simple;
	bh=5REAQAlkVUwymRdU7RMs3rA+NWvSBeETX2y/IIFVBpQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vm3L+iNPoYhUBp5adX0yYHPyYFOrABVi6Kwq6L80SZVSR8mGzXwxUXF+//6JGDZy+vk/oVbE4nfef49Y7jEMyqm497RNbsqt/hAJM3S8J4WLgpGI0yH1TnWy81uMpH6pZcC6tfC4znxhUhDDB7ctuq2iu5rXb9DDPqvtX1T6bgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=CFxplSWM; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="CFxplSWM"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MKq7Nh2gcYohgYrYR5axiDJ4p1s9We/3CeTSchjvn7A=;
	b=CFxplSWMhRpP8AAbiY91FEFGTrBwzp0iMlr33Qf/OYA54NMunuxvtLsKNFYazG/V7FN0tYbCW
	qVnSK4U881PmSGi5eEBaNy7Ih6oUsQdS4opo6Pbu87KJhzl/SLUUsws+oXRpCITmnkyZjeHgHeG
	yehCK3Lv097Ecr7CG8SvsTI=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KX0GPXzJ46Yq;
	Fri, 28 Aug 2026 00:24:16 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 92A1F40570;
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
Subject: [RFC PATCH 12/18] arm64: make power management aware about kernel replication
Date: Fri, 28 Aug 2026 00:11:52 +0800
Message-ID: <20260827161158.3618409-13-panov.nikita@huawei.com>
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
 arch/arm64/include/asm/mmu_context.h | 4 ++++
 arch/arm64/kernel/hibernate.c        | 5 +++++
 arch/arm64/kernel/sleep.S            | 8 ++++++++
 mm/numa_kernel_replication.c         | 5 +++++
 4 files changed, 22 insertions(+)

diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 803b68758152..f364281d3442 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -136,10 +136,14 @@ static inline void cpu_install_ttbr0(phys_addr_t ttbr0, unsigned long t0sz)
 
 void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp);
 
+#ifndef CONFIG_KERNEL_REPLICATION
 static inline void cpu_enable_swapper_cnp(void)
 {
 	__cpu_replace_ttbr1(lm_alias(swapper_pg_dir), true);
 }
+#else
+void cpu_enable_swapper_cnp(void);
+#endif
 
 static inline void cpu_replace_ttbr1(pgd_t *pgdp)
 {
diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 7bf117427777..e9f5ddf37c4a 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -16,6 +16,7 @@
 #include <linux/sched.h>
 #include <linux/suspend.h>
 #include <linux/utsname.h>
+#include <linux/numa_kernel_replication.h>
 
 #include <asm/barrier.h>
 #include <asm/cacheflush.h>
@@ -113,7 +114,11 @@ int arch_hibernation_header_save(void *addr, unsigned int max_size)
 		return -EOVERFLOW;
 
 	arch_hdr_invariants(&hdr->invariants);
+#ifdef CONFIG_KERNEL_REPLICATION
+	hdr->ttbr1_el1		= virt_to_phys(this_node_pgd(&init_mm));
+#else
 	hdr->ttbr1_el1		= __pa_symbol(swapper_pg_dir);
+#endif /* CONFIG_KERNEL_REPLICATION */
 	hdr->reenter_kernel	= _cpu_resume;
 
 	/* We can't use __hyp_get_vectors() because kvm may still be loaded */
diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
index f093cdf71be1..8ad66ed70122 100644
--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -5,6 +5,10 @@
 #include <asm/assembler.h>
 #include <asm/smp.h>
 
+#ifdef CONFIG_KERNEL_REPLICATION
+.extern numa_setup_pgd
+#endif
+
 	.text
 /*
  * Implementation of MPIDR_EL1 hash algorithm through shifting
@@ -144,6 +148,10 @@ SYM_FUNC_START(_cpu_resume)
 	bl	kasan_unpoison_task_stack_below
 #endif
 
+#ifdef CONFIG_KERNEL_REPLICATION
+	bl 	numa_setup_pgd
+#endif
+
 	ldp	x19, x20, [x29, #16]
 	ldp	x21, x22, [x29, #32]
 	ldp	x23, x24, [x29, #48]
diff --git a/mm/numa_kernel_replication.c b/mm/numa_kernel_replication.c
index 082aabc6b8bc..b1c5cd2a1fa1 100644
--- a/mm/numa_kernel_replication.c
+++ b/mm/numa_kernel_replication.c
@@ -67,6 +67,11 @@ static int node_to_memory_node[MAX_NUMNODES];
 static bool pgtables_extra;
 static DEFINE_SPINLOCK(debugfs_lock);
 
+void cpu_enable_swapper_cnp(void)
+{
+	__cpu_replace_ttbr1(this_node_pgd(&init_mm), true);
+}
+
 bool is_text_replicated(void)
 {
 	return text_replicated;
-- 
2.34.1


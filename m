Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490495;
	b=nY8pxzOttbPFpgbDq+E4lRFfV733KBF+cpSwzh1mywcQicS5HwppsvnxZM/tr7pKcCkU
	 x3iJxVbfnrt7/KxwYgXuANF7y+3dpAtbgTLu+Bz5zX4v5AxLIXfcuI1kKcKNqaRmXuE8x
	 DPbxXKYp9wjsRv+a2jFnXT4+gfO6lnQjdjnE/gyYPLPOTbUa7bWRnAhYTEJQLNg5OcP3w
	 0eml+JGYTalKmL0oufomkC3J5xOJkeU+Z8k7Cy8ENA1OIloblGGT9PO8Vl1c9tZ7CTrpG
	 1B2l0SmJJs/w6Xx49v+1Ea9NbyHTeZbkiYJXpEZcYmLjbf5v/I5iTkvAo2BXmp4KtXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490495;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=LDrMUXDiGwEodm+UO1zYbp0STV2HpN8QjsxDMPk/zv4=;
	b=zGeeo7RemRd/ae/suyXSAT8oNyZFXWCq4UOxrwK/ZKLGBZIbCHeSe06Cfv3/r0WG9vSW
	 HgQ1ThQVdCj2hjUeXGSBQvsW8G9ZxyARPgLQSC2Cf4BxiAlacpKH2TsvS2s14KNcfXelB
	 Bkwg0UGhAHFFtf5pOPY4lDCeN3GfltanLG0ALu+fiExA3ktLiFu+8Vx+wfVYW2S1idMdV
	 0wa6RvHKr3Hg8lSBBko8iXb4eel7dw+MAUkTQ7IiR9OMy3+3dz4fragacfAnE6qG7bnaq
	 12rW/HHrjdwhdz3RVFqkHKUOCekFoEdH5hyfscDHU7L9+sYVuQ7OqhPuPD2YNkFd9GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=B4ZY9D3j;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B8460A381E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7B8460A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=B4ZY9D3j
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LDrMUXDiGwEodm+UO1zYbp0STV2HpN8QjsxDMPk/zv4=;
	b=B4ZY9D3jYXEUivvy5xzhpPy/FAqMkWeNLbZEsmKs9U6vsxCJ8fSWmCWeg5u7pyPrHGer38JHp
	a6Oi2PTBdFwcS3EuQuyWqRyzHBTMMFyH5wKsaKfm5bZju6VsHXuho8Z2+uNpRyrXiGeyk358NBC
	THl9TyI1Ur49hbWWTOT/wlI=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jQLwG1Msnz1prLQ;
	Thu, 12 Nov 2026 21:34:38 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9DBC540537;
	Thu, 12 Nov 2026 21:34:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:34:46 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <rppt@kernel.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <ruanjinjie@huawei.com>, <leitao@debian.org>,
	<yeoreum.yun@arm.com>, <mpilaniy@redhat.com>, <robh@kernel.org>,
	<coiby.xu@gmail.com>, <Yeking@Red54.com>, <prudo@redhat.com>,
	<brads@mainlining.org>, <sourabhjain@linux.ibm.com>, <mkchauras@gmail.com>,
	<blum@kernel.org>, <adityag@linux.ibm.com>, <qirui.001@bytedance.com>,
	<hui.wang@canonical.com>, <sohammetha01@gmail.com>, <guoren@kernel.org>,
	<gaohan@iscas.ac.cn>, <ionut.nechita@windriver.com>,
	<vishal.l.verma@intel.com>, <seanjc@google.com>, <ardb@kernel.org>,
	<richard.lyu@suse.com>, <arnd@arndb.de>, <tzimmermann@suse.de>,
	<rick.p.edgecombe@intel.com>, <kai.huang@intel.com>, <kas@kernel.org>,
	<piliu@redhat.com>, <thuth@redhat.com>, <shradhagupta@linux.microsoft.com>,
	<ebiggers@kernel.org>, <jbouron@amazon.com>, <me@linux.beauty>,
	<mclapinski@google.com>, <graf@amazon.com>, <tangyouling@kylinos.cn>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<kexec@lists.infradead.org>
Subject: [PATCH v8 08/11] kexec: Extract kexec_free_segment_cma() from kimage_free_cma()
Date: Thu, 12 Nov 2026 21:34:15 +0800
Message-ID: <20261112133418.4044428-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112133418.4044428-1-ruanjinjie@huawei.com>
References: <20261112133418.4044428-1-ruanjinjie@huawei.com>
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

Arch loaders truncate nr_segments when a placement fails, so the CMA
pages of the dropped segments become unreachable.  Export a per-segment
helper so they can be released first.

No functional change intended.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Breno Leitao <leitao@debian.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/kexec.h |  2 ++
 kernel/kexec_core.c   | 25 ++++++++++++++-----------
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 89cb47521d6d..be7c827e8f7e 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -529,6 +529,7 @@ extern bool kexec_file_dbg_print;
 
 extern void *kimage_map_segment(struct kimage *image, int idx);
 extern void kimage_unmap_segment(void *buffer);
+void kexec_free_segment_cma(struct kimage *image, unsigned long idx);
 #else /* !CONFIG_KEXEC_CORE */
 struct pt_regs;
 struct task_struct;
@@ -540,6 +541,7 @@ static inline int kexec_crash_loaded(void) { return 0; }
 static inline void *kimage_map_segment(struct kimage *image, int idx)
 { return NULL; }
 static inline void kimage_unmap_segment(void *buffer) { }
+static inline void kexec_free_segment_cma(struct kimage *image, unsigned long idx) { }
 #define kexec_in_progress false
 static inline bool kexec_is_in_progress(void) { return false; }
 #endif /* CONFIG_KEXEC_CORE */
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index f4a31565c447..03b396869e34 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -571,22 +571,25 @@ static void kimage_free_entry(kimage_entry_t entry)
 	kimage_free_pages(page);
 }
 
-static void kimage_free_cma(struct kimage *image)
+void kexec_free_segment_cma(struct kimage *image, unsigned long idx)
 {
-	unsigned long i;
+	u32 nr_pages = image->segment[idx].memsz >> PAGE_SHIFT;
+	struct page *cma = image->segment_cma[idx];
 
-	for (i = 0; i < image->nr_segments; i++) {
-		struct page *cma = image->segment_cma[i];
-		u32 nr_pages = image->segment[i].memsz >> PAGE_SHIFT;
+	if (!cma)
+		return;
 
-		if (!cma)
-			continue;
+	arch_kexec_pre_free_pages(page_address(cma), nr_pages);
+	dma_release_from_contiguous(NULL, cma, nr_pages);
+	image->segment_cma[idx] = NULL;
+}
 
-		arch_kexec_pre_free_pages(page_address(cma), nr_pages);
-		dma_release_from_contiguous(NULL, cma, nr_pages);
-		image->segment_cma[i] = NULL;
-	}
+static void kimage_free_cma(struct kimage *image)
+{
+	unsigned long i;
 
+	for (i = 0; i < image->nr_segments; i++)
+		kexec_free_segment_cma(image, i);
 }
 
 void kimage_free(struct kimage *image)
-- 
2.34.1


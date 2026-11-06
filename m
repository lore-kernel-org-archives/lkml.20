Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986082;
	b=wJ8D45J1W3xP6ngr7TWhlirT5o+XwchOQP2gASu1neWq2WHqO0kC+MnTqBMNl3FxQPjC
	 HPj2uxN59w1kw6GEZVxL9dsU2UKQDlTGDGJrH9f8l2vdRSW3pFScCLVpoQlgTzozdvF/9
	 0cPqrBOMXpaK8iRzShjL/byqbMc/lm8AazMJ3WXsGLOzqrgZAu/Xf366SQ/QZ7Eaz5Zsy
	 eBvQ6fzfN1E5wYZgqjh28lOgB+Xtg+Hu+glMwmNmO1MqLtxPBMST1zrBYkxU+EZaJPZNP
	 fRMnk4h7PJOZx18MYqmteyL35QLFkoQO7pTMaqDcjotr7IzeOl8R9q10I/dyXKNGeSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=MLkiO5+iQTmH9kwercp9zyxtA2cVUMT1WfXqJlOm5MI=;
	b=PzvosuNoAbesUz3Ln1zNOR1nHiWjNs+H5CGzZfGSAsh8MlLC5RrN5s8bM9mMMEvLVEbS
	 IPQYYXUiHZTIRSIfOYbAy93MwlULKUT4tmUnVCUAFGTucavcCDK6uzz+nTUUdTDIEH26/
	 kTzFvFqT8qmmOvbgejXiDDPCYGUFdAdRafX7GOkwq5TvFD1RpWtLPV7+iFgUgzs6yaUOh
	 AB205VIeK0VxkPEuvcvMRGpi2znka2RQBdnArfwjDE+/I6lasfOsBR0fl2Ib6a9Sm1dtM
	 YDwmdSBrcjDUQpQxn5JO2lMjW9b+84p56vJFao3pdCjBecxktXqvEa1AfPGgi/JQIBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PObIiuBB;
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C53606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40C53606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PObIiuBB
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b1e00100eeso779322a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793986081; x=1794590881; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLkiO5+iQTmH9kwercp9zyxtA2cVUMT1WfXqJlOm5MI=;
        b=PObIiuBBR8pKGmX/yraRVX5YxjEOgtoPVonCTLeVvprAHiy95DsifucdyxVQduFBYz
         7zclmZrsFixT4HnzNr9frcjKDlJy3Jk+PsGFOGpNrH7BQD5BxTRwsd4DwirJzVGzdAzs
         WOa59tZLuhCUSZafOSq3fDjmfJl8pBakSjtuAoNQ0+Ku3bGGtyJnp34/+7je6cK7s2LV
         W72tb++YjDQDx3J8fmtrlFBTNRaJ+ePbs3jmpj2dq70S55/QTISogOC7qfCrDuXXrLDZ
         iW/ISPDXm/riLiNSymLhLQi+O6yzEEguamLSUQAxVqJmfs0iuwWhHb28bx3mEh2RAw/r
         PFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986081; x=1794590881;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLkiO5+iQTmH9kwercp9zyxtA2cVUMT1WfXqJlOm5MI=;
        b=08FBz5kUY4hKVlLq5owNEGXit1T7s1n6a4FabJCb5OnCzbFMk6jRnwsdMq0Q0m2TZv
         2DU2/VKiYyc0+3vj15xKPzabHU/+gIlQebVmLgjoLfOulkjKym0Tq/meM0MXhzsRfW6o
         D6iO1VkuRhuFGst+AG2yH+qTp/Id3PmkXzj1ZtU4PRJm15Aavegxxf6A8VOBhW3LLnKE
         BSNUwkPYedNU9gttzkdIBV/0kFqhY2LdJzK0yTjGf9ydRNF/LcP/Scab0KNMU4VAR/Yj
         dnjUskt3zobfIJ3BbJOxQZblKI/Lq7yUHSCPz1IBom7vXPGFRIrM67JEaEDlpiC3bv8g
         x3Rg==
X-Gm-Message-State: APuU4Z9Q8mpl6E5COz2nOExkLzzmIAB2axrBYcvt7MfUmQ+tEUC6+p3i
	8yJQqvUQCCAanTZ5upuFHtftoFqBMKZztcLk82pdkQfgY1vMw635iFtkuSgV6/SYesCF0C9STEL
	aMmDlF/NFr+qgsk//uvTCiXq+DFdvGC4Ezudi03cacmpPHNkgXgQveV/OtBw3IKQbXSYTq/iw6S
	zoH00h6ZwLKdAL4SWmUCTnfVwksaKgo23vK49FuJb9eA08Tiv7oHt4jmk=
X-Received: from edzd18.prod.google.com ([2002:a05:6402:8d2:b0:6b4:6266:6380])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5191:b0:6b4:641:baed with SMTP id 4fb4d7f45d1cf-6b59783b40amr2200349a12.30.1793986080211;
 Fri, 06 Nov 2026 09:28:00 -0800 (PST)
Date: Fri,  6 Nov 2026 17:27:49 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106172750.2678873-1-smostafa@google.com>
Subject: [PATCH v3] KVM: arm64: Use consistent type for pool size
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, xuheng@cs.columbia.edu, Mostafa Saleh <smostafa@google.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"

All the pool sizes in the hypervisor are "unsigned long" but when
they get passed to hyp_early_alloc_contig() or hyp_pool_init() they get
truncated to 32-bits.

That is not a big problem at the moment as to overflow this we need
4G bytes of carveout (2 TB of host or guest system memory).

However when new users are added (as IOMMU) it is hard to reason
about the carveout size anymore.

Fixes: e75960408723 ("KVM: arm64: Introduce an early Hyp page allocator")
Fixes: 8e17c66249e9 ("KVM: arm64: Introduce a Hyp buddy page allocator")
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/early_alloc.h | 2 +-
 arch/arm64/kvm/hyp/include/nvhe/gfp.h         | 4 ++--
 arch/arm64/kvm/hyp/nvhe/early_alloc.c         | 2 +-
 arch/arm64/kvm/hyp/nvhe/page_alloc.c          | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h b/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
index dc61aaa56f31..462883c4e325 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
@@ -7,7 +7,7 @@
 void hyp_early_alloc_init(void *virt, unsigned long size);
 unsigned long hyp_early_alloc_nr_used_pages(void);
 void *hyp_early_alloc_page(void *arg);
-void *hyp_early_alloc_contig(unsigned int nr_pages);
+void *hyp_early_alloc_contig(unsigned long nr_pages);
 
 extern struct kvm_pgtable_mm_ops hyp_early_alloc_mm_ops;
 
diff --git a/arch/arm64/kvm/hyp/include/nvhe/gfp.h b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
index 3766333bace9..3a428dc40b14 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/gfp.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
@@ -29,6 +29,6 @@ void hyp_get_page(struct hyp_pool *pool, void *addr);
 void hyp_put_page(struct hyp_pool *pool, void *addr);
 
 /* Used pages cannot be freed */
-int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
-		  unsigned int reserved_pages);
+int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned long nr_pages,
+		  unsigned long reserved_pages);
 #endif /* __KVM_HYP_GFP_H */
diff --git a/arch/arm64/kvm/hyp/nvhe/early_alloc.c b/arch/arm64/kvm/hyp/nvhe/early_alloc.c
index 00de04153cc6..9fef0c7d2185 100644
--- a/arch/arm64/kvm/hyp/nvhe/early_alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/early_alloc.c
@@ -21,7 +21,7 @@ unsigned long hyp_early_alloc_nr_used_pages(void)
 	return (cur - base) >> PAGE_SHIFT;
 }
 
-void *hyp_early_alloc_contig(unsigned int nr_pages)
+void *hyp_early_alloc_contig(unsigned long nr_pages)
 {
 	unsigned long size = (nr_pages << PAGE_SHIFT);
 	void *ret = (void *)cur;
diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
index 57f86aa0f82f..51460d420c94 100644
--- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
@@ -229,12 +229,12 @@ void *hyp_alloc_pages(struct hyp_pool *pool, u8 order)
 	return hyp_page_to_virt(p);
 }
 
-int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
-		  unsigned int reserved_pages)
+int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned long nr_pages,
+		  unsigned long reserved_pages)
 {
 	phys_addr_t phys = hyp_pfn_to_phys(pfn);
 	struct hyp_page *p;
-	int i;
+	unsigned long i;
 
 	hyp_spin_lock_init(&pool->lock);
 	pool->max_order = min(MAX_PAGE_ORDER,
-- 
2.56.0.455.g6c5a503b38-goog


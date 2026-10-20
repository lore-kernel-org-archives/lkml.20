Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497513;
	b=kZNsXeOF3kzAv/PXgwipkiFO3Gl2agaUMgqKsJ/sjrXRydVYL4F9n8o+JKLHfeFYc0ZK
	 S6stFFKk0EMCeUgARlYa2/2+i0oaj8UfhJknP6NMvXls4zc3X1RH/6YkU8MH2NrBfNZ+5
	 v1LuhKr1Ax8r7BTICBeoGC6IR91MlrgUSrLXIt9xpDA1eTq0CpxO58UQDJTbQDZ9F8vC6
	 1BdkASMj/wR7MDFsSxuEWx9kO9OufbaYYd09I95ZQgI6qWHMH/nG6M/ILPfGEJ7yexRJn
	 bd7BYyr8+sX5JZvGK8MNt/E7BdKJdOYPF1sxB2b/VfYLr8916EVF40CpnhXwpOONg1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jpuez3gyskb3VAlGg3DcMx9gb6CiW0/rZ3601UfyRuA=;
	b=F7eQ/lv9cWY3/GPaGH3v+JaGiOSp0xigfbhap0gbYoR3W6qzm1OAHeX1i/6CZpNg+qQK
	 uoj5Hz+4HQE583MEmTz+ONmuUbL7q4Hv0NBLO6INSacx088JSOquu4l5o18zJqF9Jouc7
	 3oiHIJE1N5/tKNn6H+4yHPOCR3IpsJHFxO+Vmag3K2yygFi125JmL7EiguCCpa4wApg2w
	 aQ9ixvciDjUzMLjP/gfM1mLYDVkeVGmOfRyUs3yE+rZFcrPJvuCdGmz27P6FfeCcyDh7+
	 4ECBWcg0JEmkS0kEw3cPjnlsxS66Mht7LJJ9LBk18RNBsA1V1in8ordkVcHnQis5xFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="caZ6f+/Y";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B618C606A333
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B618C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=caZ6f+/Y
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso2305778a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792497512; x=1793102312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jpuez3gyskb3VAlGg3DcMx9gb6CiW0/rZ3601UfyRuA=;
        b=caZ6f+/YOwKGAvs08zsRM4U1wRNqSrAjwAM5nsFn2+Ro5NQJKoNzuLAFIapcuvA2hl
         Pr0upRZB429MedxboQfZH7Yl7T4UxkGOlKM8mFpU4zbZ8t326OxHZ57cYjCV7ckh0NPU
         ncuQXqczRdkUk9R0IkSFOFMxhi9KuTShiyznbcDRs8QoaJ/MQxyI6TsatIMy1HxoaI/q
         qOTFM4GMmmnq/dXfRu6RA35zOyaED2f5iRnib1Mwj0HUNXiU3b5P3lecydeV1Z4kKgIM
         btJqOuu6jC2YsFfHFRItNcOA8b2pPDjtK2LwM4IAfpyjz7fIQx7O8Fi5b2pso5QtrzkI
         vMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497512; x=1793102312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jpuez3gyskb3VAlGg3DcMx9gb6CiW0/rZ3601UfyRuA=;
        b=lqCQTM1tgoXSrsRdvdFGZx7nlG3d2rpNhPd0qXTyBS3EljSI6Ylt1/uTUgYlnedpxc
         ca8owPdQmfvC2TFCQJEaxSDqfHs5EquJD5j5COqEnGmfJ99MXXtCK2KnDJ0cbKfv5Ry3
         gjt8GMJKF+m7JQA5WIbhqgw+oFzGXDqAxBtPn2bVzNoLo80RRkiLVexj3oX5SAXXU4hy
         cVYiV4W45zaPKB1gq/ASiBhmuafBwCyKsbHjw3WttjXVBvqAU2vvm2zSfwCzF0oxtIQT
         RsQ2cbcPp7fEYDk07hzNo7yGe8yJabEdPTm2Ny/UcY3OugFQm5ju/PzoOYbhG4EbEChe
         Glnw==
X-Forwarded-Encrypted: i=1; AKwUvBx2hMJYzhIz2HDHKNFcA8EafsWFpV3U8jGs2JQjSj2QN7SJ7f+8GXDaZPwfVs0rPMqiTqjo1gVCQOpKbeM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKP7YD8sMfmW+tifpC3KimC07PmWrd/QNhtz2xTfiog1j7yRubw
	n+E0ZWc5LkpzAaDFSHvfrS8ntku03Lhqiy1diw5AeLmS56frJ0WCLTUn84ubSFYh2Dw=
X-Gm-Gg: AYBFou3397xE8I56MmFv1kHa9kfpRxEbz3Vvv2WWP4yZO+o7auIcgFedhIepEHgmBFc
	07sHAZrCq9orzGBZaW3WRAzi5spLuYkqIf35hAtfMG2AikGZIgA84HMDLslWLVyMp+Iyji1XTHu
	FmsvtwDd/sl6iETQXsX8NY3icrfy/FXp3lhA2qAM9iFQ1tvM3erIWI85ciIK9DWHqiK9dl2IPcL
	nsOdEtMrQrogJ+D871MPO5tSTbZLt8EuBbpk8KCPg9Qhqt6Rz4dYohBR0DoFi9rJV5R7MTo9UYm
	PfpN+wOR6Jkf6JgMqMQKzAO+5juJxupralSkuJfhbAwUYKmU4rQdKGOZN7XJNuKPstnv1+sa3PP
	Cdj1oZjQ0PRPcKaFZKtiCjkEEBpdg0U+Lvc8kgcsOPIy6RW+zq7Jmut7t2dtuE8kKpaUlj/WSTT
	+GuL5kvc3ihj/kY0ezJ1YGwhol+JxlnhrNqn3uea47ClaKEy8DM8m5q2aLb5WZ7Skz0pecuUpDY
	UbTnpyTpx3kw7G7z/PJY+9hcecK8jYnpnSbOx5BFaTbrJKsU1gGkGYVDsCKX1/dz4XnSOVbPs9L
	qA==
X-Received: by 2002:a17:90b:1d49:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3acef56d593mr8517817a91.47.1792497511899;
        Tue, 20 Oct 2026 04:58:31 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60274fc1sm3448095a91.0.2026.10.20.04.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:58:31 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 02/12] mm: hugetlb_vmemmap: unify VMEMMAP_{SPLIT,REMAP}_NO_TLB_FLUSH
Date: Tue, 20 Oct 2026 19:58:14 +0800
Message-ID: <20261020115824.823278-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020115306.813483-1-songmuchun@bytedance.com>
References: <20261020115306.813483-1-songmuchun@bytedance.com>
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

VMEMMAP_SPLIT_NO_TLB_FLUSH and VMEMMAP_REMAP_NO_TLB_FLUSH do not
describe fully independent choices. A split-only walk can defer the
PMD-split flush to a later global flush, and a remap-only walk can
defer the final remap flush. However, when a PMD split is followed
by PTE remapping, the split flush must happen before the PTEs are
changed, because stale large-page translations must not overlap with
new small-page translations that map different physical pages.

Replace the two flags with a single VMEMMAP_REMAP_NO_TLB_FLUSH flag.
Keep split-only walks able to defer the flush, but force the split
flush whenever a remap_pte callback is present. Callers that batch
HVO work can still defer the final remap flush and issue their own
global flush.

Current callers keep the same flushing behavior.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 1105aa925acc..8b3abb562599 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -42,10 +42,8 @@ struct vmemmap_remap_walk {
 	struct list_head	*vmemmap_pages;
 
 
-/* Skip the TLB flush when we split the PMD */
-#define VMEMMAP_SPLIT_NO_TLB_FLUSH	BIT(0)
-/* Skip the TLB flush when we remap the PTE */
-#define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(1)
+/* Skip the TLB flush while updating the vmemmap page tables. */
+#define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(0)
 	unsigned long		flags;
 };
 
@@ -85,7 +83,12 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 		/* Make pte visible before pmd. See comment in pmd_install(). */
 		smp_wmb();
 		pmd_populate_kernel(&init_mm, pmd, pgtable);
-		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
+		/*
+		 * Modern MMUs allow overlapping TLB entries with different mapping
+		 * granularities only if they map the same physical address. So
+		 * remapping must not proceed without first flushing the TLB.
+		 */
+		if (walk->remap_pte || !(walk->flags & VMEMMAP_REMAP_NO_TLB_FLUSH))
 			flush_tlb_kernel_range(start, start + PMD_SIZE);
 	} else {
 		pte_free_kernel(&init_mm, pgtable);
@@ -272,7 +275,7 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
 {
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= NULL,
-		.flags		= VMEMMAP_SPLIT_NO_TLB_FLUSH,
+		.flags		= VMEMMAP_REMAP_NO_TLB_FLUSH,
 	};
 
 	return vmemmap_remap_range(start, end, &walk);
-- 
2.54.0


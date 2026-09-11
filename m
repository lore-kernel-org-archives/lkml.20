Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137A33101B2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103023; cv=none; b=D4eG1i3T9Wt8sXdPANzpC3269LvIW6ZorPs2buYw5ZOUwFW0Hr+vfz4IJEl8H0gl/iO6r7LLGE412Ml/wj1PrPHmZVYOmCCMMKjS3zm1xvf9zassQrT+4ziHSzlHtSq7ik828VgTlCiN3OVG8m/LextT37j/he+j8AVwStaXPLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103023; c=relaxed/simple;
	bh=o93Z9Y+DL/D2s+9gaMivcy0VdYP+V7A91VZF+QexHA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgqmZz8Iq7QJfIowuVwR5Xu8PyvExhSilfDuP756IKNRAaDg3kyyxOrZDRs9BaUCMYtakTUIKFGQ4ErcVlDwbzDmB3FO/dEziZadqrgVQ0Q3rgZiBLvmeDD+5Tdkgf+TybRV2UGvp8Y+e0FFmAGAlZk8ihewxvy8TlEtjjIcncI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AURoCfLQ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AURoCfLQ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so454677a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103021; x=1789707821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=otJyn0+LhJb8oZRc2DA2ivaMEPoP7qIjxigOuUE5KLU=;
        b=AURoCfLQJ8uQDhpBI1nyCRQ3l5kb5f6Osmb0qnvILyHTajkmIDE1x4Ge5hm6JAqP68
         /wjJSG69CWv6JTEt8dw/GV91tIeBKamMnj/4XlG40k0PvDs2jigZd87k6Kle1bjzBr3B
         9C9wtWPqmXSwXIJ45r2UpiHvXsDw9oCc7u9p9tWVDlQxUVcImI3ruCZ/h/n0CCuzg+05
         l4Gnv32oOHt4mQt8fz+hkmhdf4cFMjJ0y6VRVzHk1y57X99AUw0heWibv7F1cJyk16pC
         /8OSW2974Beg++5SmUZphB/MtYOGD9bAFOQoShSzm4UMSGePMWdhcIzj6ciD8q1JQqN4
         Lwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103021; x=1789707821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=otJyn0+LhJb8oZRc2DA2ivaMEPoP7qIjxigOuUE5KLU=;
        b=IG90Z43oAZFAj5ZUZUfP3nJUPzuxh6mbqsrk7caq6pNKKSLyucnMxjTX7OEYgFEfst
         7jsG2aYOmai+om7sGEIaH+xjZZVcDmt5YPCeaBk99zFq5FRa9ix/1O3AjOIdCXn/2LAI
         DtYrCC/vrJfgzDbkP6EDcy5Xfzd5uFDAWDIBOgB18rkVBDjdz/6C1JCXcD+f8wmjic/2
         KkzjmqUEzNuuKaxNaZcWE9W5mzVLrD7nVJOuGhm3gfn5Czl5gOHE6XFGvzKGTnVNlXnQ
         ejpvUvchrv+ppRyb0tMd/p92pwlqDd/W4hzqnM5ovlqWJ5HNjOEdujKh2VImoJbEq7cT
         o1cg==
X-Forwarded-Encrypted: i=1; AKwUvBzaHJjb/jBYYQv7kVOyswsIhfbzTbDRCo8z/3aHT2xg1jCg6UuEYieKtZEV/B2fU5NEPgpA3RqwF8rD0W0=@vger.kernel.org
X-Gm-Message-State: AFuF++mucHFeE+8vcOdiQQOY307H/h7Hpt2EQZtvaPVCwsOhkwbIThRK
	tTf3j/DLAb+0xCC7Dwx8eSz0XRn/uvxFkIH0o+/TCiZmmXaFCIGJ9KIyquhPxo76lVM=
X-Gm-Gg: AYBFou0LHszCv372xNzRTD/57meC05gmKNrXtRxI9D5dY2bVfaFnJ/s4vDb6DKIExwS
	4DWHld2dh/Gv2a0mCvyWIQaZiLDiZT2AFSSJZPwTmOFo6IP/6eA3+feXMnunqMymvWKNIQx/6ef
	YNG+QAadLf6nZh1pDzHMq64m0FBK7IVLCWXiddIhB/3Bmn9vlJK8APAZ0LkcSTWSD6cCy8WrsNy
	tMUVcgIaJVpN4FmYLLbAPQU1Jw7AIKVEk7hNGxmSCaLtU62Han4gAV4U9M3EywzgEv3cW4a8lB3
	+imOAFUWZPcaoE+SmpmNmZrDBu8faMSHQI3LIGrktxkSiAmqkR/MoYI4swxTLRiZNNRLzWvQ9Q1
	05MviPPEFKbyRwQ2uCpPeAVdzhNkOjKyMuoOX39uibrb0EOuIGCr0iWklAIZKP1Sh0nyN3QrgL2
	o7vw2K+U733+t7D3KDBpG1qIlJT9EmhdeSPW9GpvYHV6ctbJvBZhOMeh2UDilPj3CoECGlNdHVV
	Yuucaf3XMyAvaq0Eyz+zomU4PFItN8ZeGyI8Q==
X-Received: by 2002:a17:90b:588d:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39d9bbc823fmr4102685a91.5.1789103021399;
        Thu, 10 Sep 2026 22:03:41 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.03.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:03:41 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 03/11] mm/sparse-vmemmap: open-code init_compound_tail()
Date: Fri, 11 Sep 2026 13:02:20 +0800
Message-ID: <20260911050228.58884-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911050228.58884-1-songmuchun@bytedance.com>
References: <20260911050228.58884-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_compound_tail() is only used by vmemmap_shared_tail_page(), where
the shared tail page setup intentionally passes NULL as the compound head.

Keeping this helper in mm/internal.h exposes that special case to the rest
of the MM code and can make the NULL head argument look generally valid.
Open-code the initialization at the only call site so the special-case use
stays local to sparse vmemmap optimization.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v3:
- Collect Acked-by from David Hildenbrand

v2:
- Collect Acked-by from Qi Zheng
---
 mm/internal.h       | 9 ---------
 mm/sparse-vmemmap.c | 5 ++++-
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index da14c56fb24e..0dca33db068f 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -786,15 +786,6 @@ static inline void prep_compound_tail(struct page *tail,
 	VM_WARN_ON_ONCE(tail->private);
 }
 
-static inline void init_compound_tail(struct page *tail,
-		const struct page *head, unsigned int order, struct zone *zone)
-{
-	atomic_set(&tail->_mapcount, -1);
-	set_page_node(tail, zone_to_nid(zone));
-	set_page_zone(tail, zone_idx(zone));
-	prep_compound_tail(tail, head, order);
-}
-
 #if defined CONFIG_COMPACTION || defined CONFIG_CMA
 
 /*
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 7388a5b5cce3..861e09b2b096 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -189,7 +189,10 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++) {
 		page = (struct page *)addr + i;
 		mm_zero_struct_page(page);
-		init_compound_tail(page, NULL, order, zone);
+		atomic_set(&page->_mapcount, -1);
+		set_page_node(page, zone_to_nid(zone));
+		set_page_zone(page, zone_idx(zone));
+		prep_compound_tail(page, NULL, order);
 	}
 
 	page = virt_to_page(addr);
-- 
2.54.0


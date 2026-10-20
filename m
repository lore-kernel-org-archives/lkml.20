Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497530;
	b=QRry3yK9gWWzgpDxnT1B15VPnayS/9WSnI56Xr4u78VOqVIi5OnNsYCoUQBX0M1QuPPs
	 CL8A1crwz2CWMvICJQNb/O0PWaMOJd81X2EignTJE/ZttpezF+Ed9m/w/KDqmdtER38Na
	 W8ftaV4xwDVQF5IrA/K56RoFuCCNh3KkamKDbMLMHCRBEOMVNN68e+v1tdyakxngvkwOi
	 YJp2HuSmz1F9QR84NqrGeo90bFNGCKMdRABo1PvG6ahSHHd9OWAjOislnoA0EiTShNdr+
	 Q7qW+hUnqeAn+8Ga5oHrYMMKI1oJhWOYn81Lcuzp1qNtQmRpj3msOwFOX8A4CiJzTxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MHNwkvG7CIHMd+9+4XBKNgiQU2Iv+Eklqp5XAskVI5Q=;
	b=l687QYlnefrosisPn0Wbgeeip26TBPFvcIBYCgOyB5+lrD+UD3dpwtnlp9HUNk90g6Xj
	 B75kTeD2E2fSogE1wxYYKJhBnuR/1I7W66CbnxAlez1rbNWOB2L/n0etNi0xZJm31RtPY
	 y4Dz8pWvNcVz7yhVftA7MUo44eaOgo2KFV5ShHA8JHzHpHEBobowznORA/vG+FU+6bm0P
	 8bMC2dEQ6By/u4ZSLySngJbcSZedmt08f+Z1wgiDGJD3rRwySywQRUXYTebMCicj/7wAT
	 I/U7BG3mbkmNmTdkIQCUc19b/UVByXOa87Z/aHklmIILXLqHVA6ezqZwIwexg+nF8YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=lAUkF4Ln;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC63B606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC63B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=lAUkF4Ln
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2558864a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792497529; x=1793102329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHNwkvG7CIHMd+9+4XBKNgiQU2Iv+Eklqp5XAskVI5Q=;
        b=lAUkF4LnSrjiKE20pqdyaoaXmuY/FtKWuTEPHxlhJylMFWgsGvZ3oA9IwhDAF+35oM
         5qg13hqTW6LgciB66II1J0MXKJ9bgngPA4A9B3fmZ9LBciRyh9t7t9CPc0M2tTPxp4W+
         VCFlLJss7dSJv/zt3UABL6+yECzrQMJGS19W2x1jEWSEx6Ajrn6PHzxK4dPCZtZ7RAAr
         +jLmIY4APhLHRahXn1H4Nggfdb3HzYURnpPU9/678IGpHTevGK5F2bGN0/DUpZquXoJZ
         dQwK7oh8wLJRbT1G7hgO6NPQ5ULu4F+YIsacWsCnt2IMMQulZJTkofubA91eColT+6aG
         jF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497529; x=1793102329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MHNwkvG7CIHMd+9+4XBKNgiQU2Iv+Eklqp5XAskVI5Q=;
        b=mXAubb1YgYjvai82RDtHxFj+wO4bSqFzMwG+05cy8VqXNRO521lzbMa7vpSklEyPd8
         Fuc8KX02S++smtZGmauPwrhYBH/vGFnwdpfiVruKc8Lt8JnTYw+hzvPRmqbua8VmnTVk
         eYcdTx2M4Z+OxyPVhVDoh/bEJa+U43owtgJ+b4Bnb0SQS7MMcr9bY5pNn8FcYhSG6MA3
         LTlYinLcGagGZQkKRyfcdk5XVJJbcn1obrYTXUF8IIJNwhh1GgTjUtkZ9UyI7u9fL1qA
         DNifd6hrezVedMXbm0EeH1HAgnfe81xlrfohSu+Adrjke2CtnpjZL/29RAbVAS9Tlwft
         BDEw==
X-Forwarded-Encrypted: i=1; AKwUvBzGVSL4fpuYrmFS833i7y90ZplM7rH7NH3+xAKMRrQXnExliXwAKnXzyFB5KpDc8nZJP7HK8kISnmlxlWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLymgnnqnmdl8PoE2eewwOXcJHnoQRE0tyO0yhTVUzFfc9j1BFZ
	7Esnnm7Mptovn0qLcrnkku3s4zTJmgVwJjVHF0fTJES1i/UzhQ621HKy8BAnz11Swms=
X-Gm-Gg: AYBFou35oNktM35BHcsP8PJg3HL5N6sBsFxWKAMnF/mMRPfhpYhz/y27T2tiHXwUpsz
	BgY/mDSgfPSmovoEGRNi+IWi5FOi4hd1qcClsjOFl7b7AV2STfs4ZJrMTSRW+0k/hVoDVEdVYr5
	l9EpFlorCqEzRMZXcZjouUsnCMs9iIeAGhaBTxzA0ZHGwzaRA8D32JZ7Yp/Hxe0yHFoYpuFORpt
	V8vKjEtv0Hfm5kiqeZyRgeZ0XlpXn7jZSfOgpEvpdzRIBHHqxG9/RC8+tBg4K7e9OvG+UH3nzGS
	UAODxKHvpzAnc4/nAUYYVAK54IViQmtbRRmDlAFsFrD8qb/RmQagQLZ/v5EGWCB9KIGAaBoT8rV
	IDRvdSYP4+B+chcHx8mWO2HQ2Wh2Ksre2cfAx+JbO4lYJ1K1vZesRns+plIS+VrhDunTCAdfNmU
	ZXBS1vul0Gw6MKQcokKVOAQUiP6Dcmoqy+3KwRlbrYkuvalWG0o/Tb7t8eNMYn2dnfg6cjv9g9C
	QTK4py8yYMQ9nTRmokVRw==
X-Received: by 2002:a17:90b:1d4f:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3acef3ce33fmr9815015a91.55.1792497528082;
        Tue, 20 Oct 2026 04:58:48 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60274fc1sm3448095a91.0.2026.10.20.04.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:58:47 -0700 (PDT)
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
Subject: [PATCH 06/12] mm: hugetlb_vmemmap: rename vmemmap_remap_pte() to vmemmap_optimize_pte()
Date: Tue, 20 Oct 2026 19:58:18 +0800
Message-ID: <20261020115824.823278-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020115824.823278-1-songmuchun@bytedance.com>
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
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

Both optimization and restoration update vmemmap PTEs by remapping them,
so "remap" does not identify the callback's role.  Use "optimize" for the
optimization callback to match "restore" and make the two directions
explicit and consistent.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 9ea961291b3a..18b72d553955 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -213,8 +213,8 @@ static struct page *vmemmap_dup_page_from_list(const struct page *src,
 	return dst;
 }
 
-static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
-			      struct vmemmap_remap_walk *walk)
+static void vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
+				 struct vmemmap_remap_walk *walk)
 {
 	struct page *page = pte_page(ptep_get(pte));
 	pte_t entry;
@@ -301,7 +301,7 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 {
 	int ret;
 	struct vmemmap_remap_walk walk = {
-		.remap_pte	= vmemmap_remap_pte,
+		.remap_pte	= vmemmap_optimize_pte,
 		.vmemmap_tail	= vmemmap_tail,
 		.vmemmap_pages	= vmemmap_pages,
 		.flags		= flags,
-- 
2.54.0


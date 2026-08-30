Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C267C2F7EE1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788086030; cv=none; b=UhO1GGLJRT8g+rHUKlq9AjUp7WRDJWJSmtocEfmC0/PeLIFXIOoR+iAnPeCaTmcskE2uVoRAW8RagMnaeBHAoyYQWVMkw6ZrdVwiHWAnG00AN2XuHuJT9M+oOiV0e/a8EGQl3N8VB8WWaPrU+e6uuRwsgljqk7HX8697F/AX3RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788086030; c=relaxed/simple;
	bh=zHKyX7u/bn4nak9pCenYEmsbJoOA3IZ5m1jHPNOzKoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RcuATRac41S9vXreb7SbweGh1nWGq0G0E4aWTN5tz98X95GJKCNTunm+hjn+xNHh9AeyPjDrd+ZNugrA/1wwgOn5txo6ezLHbC7poen2q77VQUEdXb6fRR1aA6NN8oJDCToXfsUwVua9mrhYLXv5b5H/lU4PRaeZTK1jcSrVefg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=D8u1sq1d; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=a9WthKJU; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="D8u1sq1d";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="a9WthKJU"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UA0C7u3243259
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=5hv7
	UB85+3sed5S3Bw6RQxVg14F7gqMHHFVjFXK3+ME=; b=D8u1sq1d7VwcqZO3Q3C+
	o140neDrpn6FYbpDuNcy11Mpm/cKasG/+o6veAJEI3BO/Rsc1KJWrYTwwwXAoDT3
	VjZ+nncd0mFRsbL225J1tQ8H2RFTZWvaeQbPSlWP64oXd3phUUb1Q2YZtzye8gFt
	yoHfhJ0JvGUspsm6NJzAoyz9bVVUIXp22xCl2nNXgscFko5Ogpc8axyoRovjNCus
	QljAheSEYgDqkd0WqgbBAOWFo+nDTBK7qPEoPb7u315/J6hYsNPCcK1WhCEuHIo1
	OAZCLkpA2gnN6UABkyZe4YXg0RsHVRxYswQPc7cxurnuh8r9XZkDB9Dhd3dIdSQZ
	jg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbs0pvvre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:47 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fc16ac179so37853731cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086027; x=1788690827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5hv7UB85+3sed5S3Bw6RQxVg14F7gqMHHFVjFXK3+ME=;
        b=a9WthKJUx7FoOPiL3YR7Bd5Q7K0rndnik6Q3oht6AwjlmVd3wXczHdd+ASGxnw6X/H
         h4EFBjhin2A5+n7mNHZaSLrLwHyXMn/IdBXhJsZy0TlFbLp/xdqsR+EDB9uftkz08f9o
         rrdPBWFoquxsT8RdLTsdfDyOMYsZiKo31gERXvbAQESIwi1OETy40XOoEuEcxpEEuBxU
         TrLFevljVaa4vuQNISSH+fDuU4XjUuA84KB6S5GfA8pXRk1AkgwN6TERjRKRrUO6VEJL
         I5F/fwuwvTZAZEE+621FM2MdeBvXKRTfXhMX7AsvzPPe08/3ZYeck9FKiu9ivLapVv72
         DQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086027; x=1788690827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hv7UB85+3sed5S3Bw6RQxVg14F7gqMHHFVjFXK3+ME=;
        b=qE0rP4hu+xBK8nfK/rr0+hyV19h0DfnUUfQPQ016fa2OE4dtA66glNUXskFWRiszmW
         5BWFoNcc2iVB3Z4mCt2tgJIWKu0hJmNk8RRMDCBjoAXg9dIYWQS5h8ogiW4T3Sq6hjXs
         zvcn5+Bg9X/MkNB3bnKceMvk1um6x8UP2cl7FEkjwFcvzXShQ3gkcipWqS//eZHtMEcr
         q4tpx9MH/iZS4TlPEQX5zMMCdBRlVCUAhPHhJ+OTIUuaYOhLZ+m5B+YcNiBRfwvlBYeJ
         g0fKK1W5+1S1Kj2tLz+vAgqFvhBAE//rogbBtz8ndqzU52/u8nxrbVmBCiz5ZqFxU8kb
         rybg==
X-Forwarded-Encrypted: i=1; AHgh+RrZNsuCLrCQ1nJiglD2MUPcr9VQK0JlNU84dnlBocSEbqN8/s2q/TbBaXhc+h5xyQYRRa1SsmPNmPcRtto=@vger.kernel.org
X-Gm-Message-State: AFuF++kXDtY8fZWtLBruTPv2UrgEvsqkjn0s12rrO8RsibiBEl2YeclX
	haBFl8h/M0HLXV3ybkNLwkNnI/zwZAo0+zz0ZTcUQ4D3OdRIt078r42eXT97GPuOVUKx5PlyiNo
	IvcC7iQdFjBfIJfv8jjHAbK9MI3BPDFePzaAfqfnxQnnYM/2e9JcQnAkPWp4xzw==
X-Gm-Gg: AR+sD12uyBieE4G4mH2MnKq4ci3dnocMD5Tgu+PYXCpJsLStLs0yCoxj9uELjuEEqcK
	y0Qh9GSXhhKUJL8cJWCqzqC4a6Wt9ZsVJV/c9zb2onIRYybwLRxGU8wSg2eyXEznY0Ej0FNurp3
	aXQz/LqgaRGFJHCa5MpBgaeROPoVBzv9IIYUpd8t0Vr1E97aubPzM5KtxFeakUhnvHb+w7TMWLa
	aXqMRypjqI5xDYiIS0dFN+0x5yJDGPL5RWf4Bab34/xHOwjTOcSqEhM82J9WvpKs50oJvMstsGZ
	cbalOZtduQX1GrHydo6uLf5cwfXiF/oarJ8OyMPhMQFL3AUT93pCSpm8x6rQRqrco6bFa7JYHt0
	KxgJ34TnkIormhQSD+FdnQod3fG68hC5zDSqjt5fllQ==
X-Received: by 2002:a05:622a:1dcf:b0:50e:474a:47e1 with SMTP id d75a77b69052e-5300b8aea8amr14547311cf.10.1788086021894;
        Sun, 30 Aug 2026 03:33:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1dcf:b0:50e:474a:47e1 with SMTP id d75a77b69052e-5300b8aea8amr14546791cf.10.1788086021397;
        Sun, 30 Aug 2026 03:33:41 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:40 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:26 -0400
Subject: [PATCH 4/8] mm/zswap: convert the store path to take a folio and
 index
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-4-7786b52acbc8@columbia.edu>
References: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
In-Reply-To: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
        Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
        Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=3733;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=zHKyX7u/bn4nak9pCenYEmsbJoOA3IZ5m1jHPNOzKoA=;
 b=4eGm5s3wMRhMtyl2KDA7tHu6Ni8dzHC/clJdeLywA4tmCGasoudESZYVbGlzGooeyJ5yCSNiB
 DqkznY1tScvD7VGLmhid2OffaI9AHRU0q7WT5HvTmnC+5CEXfKFG3Cp
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX+YatHyzayIb8
 5SKDHKstsCsKD+IxmC9oRq/kfAk9jmiIegv4Gp4Zl32kg2//BrpjC2Gy45djDExLi7rXd9oX2zn
 egU1vdwxyZrvDsyKnwT4M0B5ozKb+gdHyibuc2Xo+XDEVy+S00ylwaqy0kwJ51Cvra+PvlkR40N
 fJbS760ZJgvCk9JJejJh3v1e+3AJAlJI/MmZV4IkYg2tkigGG64l5gwiZpnzzA2yf5g0Fvyw1qB
 UTLmXb7ELJAKYUwupitzW+eyb7461EeTXTwK94R9hdvT3hZamaT0EDuLSpfnb56dummzX7DIRpl
 Y5BVWafy+ufM2s/BCnETSUOvDRGa29XxN6aKLbF1a3mIULDa8qWMVvzR+ZP9nlWrizy+ZWZKGUP
 0kayg8aD+pllDo5YzSQrjMYcH8VeNRvrkdX3kqeL6pKoF6eL0LaPRveLuuGgn7KmOdQTC6c5Sox
 B88sLzVg79+pgnvdQIQ==
X-Authority-Analysis: v=2.4 cv=EtbiaycA c=1 sm=1 tr=0 ts=6a94070b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=Zkbyt3CucH-xCIxE:21 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10
 a=A0y_DWxS2BwA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22
 a=QOCMdifcju39GKoXhKua:22 a=ASlJD9JRYGfELUMjv9QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX1fNWRQrs3HUV
 RpJ+R02TXJERzolXQsVP5cyqRpdVQtWQIHAsqKNcmmTuZhGxFQvznOZ2H3s55nd8SAylpdHqPG0
 O1jv0/l2TDnkOYe+RmxBvbGWefwGilsqhof3DfiIQuEbaTykjeiE
X-Proofpoint-ORIG-GUID: 5-2IOwnE9nieJRF7Tz5_I3w6oYfTxfuY
X-Proofpoint-GUID: 5-2IOwnE9nieJRF7Tz5_I3w6oYfTxfuY
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=10
 spamscore=0 clxscore=1015 impostorscore=10 phishscore=0 bulkscore=10
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300088

zswap_store_page() and zswap_compress() take a page that zswap_store()
just derived from a folio, then convert back to a folio for the swap
entry, memcg, and node. Pass the folio and page index down instead, and
use sg_set_folio() and kmap_local_folio(). zswap_decompress() already
takes a folio, so this also makes the two paths match.

This removes the last struct page usage from the zswap store path and
saves two calls to compound_head().

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/zswap.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index f3ae3c81e48e..3a6f89017646 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -824,8 +824,8 @@ static int zswap_cpu_comp_prepare(unsigned int cpu, struct hlist_node *node)
 	return ret;
 }
 
-static bool zswap_compress(struct page *page, struct zswap_entry *entry,
-			   struct zswap_pool *pool)
+static bool zswap_compress(struct folio *folio, long index,
+			   struct zswap_entry *entry, struct zswap_pool *pool)
 {
 	struct crypto_acomp_ctx *acomp_ctx;
 	struct scatterlist input, output;
@@ -841,7 +841,7 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 
 	dst = acomp_ctx->buffer;
 	sg_init_table(&input, 1);
-	sg_set_page(&input, page, PAGE_SIZE, 0);
+	sg_set_folio(&input, folio, PAGE_SIZE, index * PAGE_SIZE);
 
 	sg_init_one(&output, dst, PAGE_SIZE);
 	acomp_request_set_params(acomp_ctx->req, &input, &output, PAGE_SIZE, dlen);
@@ -870,8 +870,7 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 	 */
 	if (comp_ret || !dlen || dlen >= PAGE_SIZE) {
 		rcu_read_lock();
-		if (!mem_cgroup_zswap_writeback_enabled(
-					folio_memcg(page_folio(page)))) {
+		if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio))) {
 			rcu_read_unlock();
 			comp_ret = comp_ret ? comp_ret : -EINVAL;
 			goto unlock;
@@ -879,12 +878,12 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 		rcu_read_unlock();
 		comp_ret = 0;
 		dlen = PAGE_SIZE;
-		dst = kmap_local_page(page);
+		dst = kmap_local_folio(folio, index * PAGE_SIZE);
 		mapped = true;
 	}
 
 	gfp = GFP_NOWAIT | __GFP_NORETRY | __GFP_HIGHMEM | __GFP_MOVABLE;
-	handle = zs_malloc(pool->zs_pool, dlen, gfp, page_to_nid(page));
+	handle = zs_malloc(pool->zs_pool, dlen, gfp, folio_nid(folio));
 	if (IS_ERR_VALUE(handle)) {
 		alloc_ret = PTR_ERR((void *)handle);
 		goto unlock;
@@ -1392,21 +1391,21 @@ static void shrink_worker(struct work_struct *w)
 * main API
 **********************************/
 
-static bool zswap_store_page(struct page *page,
+static bool zswap_store_page(struct folio *folio, long index,
 			     struct obj_cgroup *objcg,
 			     struct zswap_pool *pool)
 {
-	swp_entry_t page_swpentry = page_swap_entry(page);
+	swp_entry_t page_swpentry = folio_swap_entry(folio, index);
 	struct zswap_entry *entry, *old;
 
 	/* allocate entry */
-	entry = zswap_entry_cache_alloc(GFP_KERNEL, page_to_nid(page));
+	entry = zswap_entry_cache_alloc(GFP_KERNEL, folio_nid(folio));
 	if (!entry) {
 		zswap_reject_kmemcache_fail++;
 		return false;
 	}
 
-	if (!zswap_compress(page, entry, pool))
+	if (!zswap_compress(folio, index, entry, pool))
 		goto compress_failed;
 
 	old = xa_store(swap_zswap_tree(page_swpentry),
@@ -1515,9 +1514,7 @@ bool zswap_store(struct folio *folio)
 	}
 
 	for (index = 0; index < nr_pages; ++index) {
-		struct page *page = folio_page(folio, index);
-
-		if (!zswap_store_page(page, objcg, pool))
+		if (!zswap_store_page(folio, index, objcg, pool))
 			goto put_pool;
 	}
 

-- 
2.39.5


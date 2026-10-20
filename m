Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487822;
	b=fRq+jDsAHPC1b2iqqrbrhn01PtLdl50RawibuZ8Dp/kpecAedz9rmssHjvahikVsuGde
	 nlA1JSScb28VEAIdZgf1WHYVRM1n+UEuVWWV8ItlN4/wRmfaN2YM9FQfkMnjpHtcOOati
	 7sSfZilkhZcbOr8mRM5281YSnVSee2dkdHO7Ya2JhKfEOSl8QhDtoxE35wPPcFuY1Cmn4
	 cWOVVJ87WwKvQOBCAXMZ5JeCipEQk37nB5gHOfNUFZYKRnyx1CKbLPB6QIRtmREImk0Ta
	 fTUjnjxypEE6ojCbWu/GN8sgUuTQhbV11i2orlIlZDiHukTQZD+tjdlsTOdl3+fsUGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487822;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2OJQneVXzHsU6jtIwV8VLa8IKZc3t0bX3hcGv+HLpME=;
	b=TbWE3JYK6DVVqx0BJflCYbdMpYVYIJlm4TtUSKo4oCeF5lgqho9oOglMDA4y2v6NCFFv
	 d52PRkhBjY0xmKHc0aZ49MoETd3O9mMVUo5ue5DBvJqu4JKlw2oaEyY/YAqPv9to4VOiz
	 2inuQ5GrwZxdjRYT1kw9tzsJ0IjcpnhZNlFU9BO4Q5sat+1WGegv5lZ287UqdG0Wy2mpA
	 2IX40CTq8rLcFp+WQkLUQKRAGng/Qn754sM/VOpSw8PBcN/fs3p4mIbXDeyqFlI6f7SF/
	 jV+dk9jm+eBIzpxV5oOTIvVvfq771c/GspCYVHcCTrBRkI2d0vX86a/A5JDNoXLGnsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="k/L5jPXy";
	arc=none smtp.remote-ip=91.218.175.82
Received: from mta0.migadu.com (out-82.mta0.migadu.com [91.218.175.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA500606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA500606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k/L5jPXy
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dYX2kPoxWrbNwBfYkNtIIo7jKtdrSVqmblUTcmMldi4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792487819; v=1; x=1793092619;
 b=k/L5jPXyGgLlI67mkLu6pAyH8ojK/x/WvfhH1WZOXWJr2T3fwfFO7ntq5zkDa6OWtMumudT/
 Mavu0+1xq/+D0ChWfoyRElhhqlkTarmYeGzKF7gqb0eFm/t8DP2qkLzx4i3NMXPsqSm82vt2GnL
 FMl1uL/OZMGj4kT9ko2WQkZI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 70351ff65c024f16;
	Tue, 20 Oct 2026 09:16:59 +0000
X-Mizu-Trace-ID: 70351ff65c024f16
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: qi.zheng@linux.dev
Cc: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	zhengqi.arch@bytedance.com
Subject: Re: [PATCH 5/5] mm: hugetlb: enable CMA allocation for PMD-sized pages
Date: Tue, 20 Oct 2026 17:16:53 +0800
Message-ID: <20261020091653.14959-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <df6eee954b62f41d65c4d087d17a7a7cf60da791.1792136742.git.zhengqi.arch@bytedance.com>
References: <df6eee954b62f41d65c4d087d17a7a7cf60da791.1792136742.git.zhengqi.arch@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Fri, Oct 16, 2026 at 06:07:36PM +0800, Qi Zheng wrote:
>From: Qi Zheng <zhengqi.arch@bytedance.com>
[...]
>diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>index 218fbaee6f7e5..8c00fd9d0658d 100644
>--- a/mm/hugetlb.c
>+++ b/mm/hugetlb.c
>@@ -1362,18 +1362,8 @@ static struct folio *dequeue_hugetlb_folio(struct hstate *h, gfp_t gfp_mask,
> static struct folio *alloc_gigantic_frozen_folio(int order, gfp_t gfp_mask,
> 		int nid, nodemask_t *nodemask)
> {
>-	struct folio *folio;
>-
>-	folio = hugetlb_cma_alloc_frozen_folio(order, gfp_mask, nid, nodemask);
>-	if (folio)
>-		return folio;
>-
>-	if (hugetlb_cma_exclusive_alloc(order))
>-		return NULL;
>-
>-	folio = (struct folio *)alloc_contig_frozen_pages(1 << order, gfp_mask,
>-							  nid, nodemask);
>-	return folio;
>+	return (struct folio *)alloc_contig_frozen_pages(1 << order, gfp_mask,
>+							 nid, nodemask);
> }
> #else /* !CONFIG_ARCH_HAS_GIGANTIC_PAGE || !CONFIG_CONTIG_ALLOC */
> static struct folio *alloc_gigantic_frozen_folio(int order, gfp_t gfp_mask, int nid,
>@@ -1849,11 +1839,18 @@ static struct folio *only_alloc_fresh_hugetlb_folio(struct hstate *h,
> 	if (nid == NUMA_NO_NODE)
> 		nid = numa_mem_id();
> 
>-	if (order_is_gigantic(order))
>-		folio = alloc_gigantic_frozen_folio(order, gfp_mask, nid, nmask);
>-	else
>-		folio = alloc_buddy_frozen_folio(order, gfp_mask, nid, nmask,
>-						 node_alloc_noretry);
>+	folio = hugetlb_cma_alloc_frozen_folio(order, gfp_mask, nid, nmask);
>+	if (!folio) {

Emm ... what about PF_MEMALLOC_PIN here?

If a FOLL_LONGTERM migration out of CMA needs a fresh hugetlb folio,
this can allocate another CMA folio as the target.

With HVO disabled, the old folio is freed back to CMA and can be picked
again again again.

I guess we'd keep migrating between CMA folios without ever completing
the pin ... even if pinnable buddy memory is available, no?

[...]

Cheers, Lance

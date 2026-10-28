Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195801;
	b=3w7g00X3lloykxI2tAmUG/F+UeqGDHpkeT/a/eAIKDl/NaCHXK5w4cLRdsp48wwwVtub
	 4MzIfMIqLw7OXtWvS+BYRbLqchX68nYvOwvV5GwG/qWbUiKkS/r+Bb9FJRxDk2rohdYq/
	 6y0xS8YdQQ9t31vFoVKP03b2OgDVAIV/mW2KQn151OGbud+u9aLANggLd+WjscYN4RmeG
	 VRLFD95HWLvJArA+lOiFJvsvfH6H33mdqJiZxC4tWJPO7b+5nIPJcz727bFfbmC1d5p6X
	 CcvkY22mcveFYhnq65ZNI3hHw407F7ibSHTEj1sMKuGJjkbmkJ8pDkxEuRMaJfvUO/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195801;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=MOy5rZipXXkhcaK0HM+VbL7SQtsFC89tD9F7riLKLfE=;
	b=JglTNEp0YczwcLQmjlBajtHTB70ymmQiFQTGlopZ5u3Z5lqYBRze0fHDqv56nl522rmF
	 FEoAFC5nXZVjgf7D0zw/XVwnE7aTMUhpAdbnWaS3AiGfWFkmlCIP71XlRTHNYHiEIBpK2
	 ejeiOqTeiCLA6Pnc6p9xoS12gQwZIdDbSjKu4m1kGNquY2ERqlc7l0PKYPff/R0aM5h1b
	 6t5wrSH7y3LCMP6lSjYv/Rsc//uRHoLfGiy7hr4dMmuib9gKL6OG1iQ/eMZHu7bJkf5MA
	 HKS4Is4rk6hraxfyZ5V+pNl+9cNrdjUw2U0HxA76DrqElu3Qn4dx7CspM69z5vLp+nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FjOywHBV;
	arc=none smtp.remote-ip=95.215.58.15
Received: from mta1.migadu.com (out-15.mta1.migadu.com [95.215.58.15])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F60606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F60606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FjOywHBV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Gr1tCLiWG+AKW5n0i5TvbesSC1XjxBlWg6zWvuFNVus=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793195798; v=1; x=1793800598;
 b=FjOywHBVm/r1Ws8hz8di1G6VXcyFBPKX3/ZbQXHGbvQYnNdmdsmw4W/23ya1cAPKMIWhh/vr
 z1IPtP1g5OxWDX1g4Y3MiF7YNoOsAKUWqDTulbhdpbgffDlOz2taSs9RzeUvnDtqyo4yGSEHwi5
 NxQz7fn62HZrS4DsgQ6OMmhY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id fb71a9c2f9e0e65d;
	Wed, 28 Oct 2026 13:56:38 +0000
X-Mizu-Trace-ID: fb71a9c2f9e0e65d
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 2/3] mm/hugetlb: preserve CMA flag when returning folios
 to the pool
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261028113319.38544-3-kaitao.cheng@linux.dev>
Date: Wed, 28 Oct 2026 21:56:09 +0800
Cc: Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Frank van der Linden <fvdl@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>,
 Chris Down <chris@chrisdown.name>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0005A5C9-47ED-45EF-BEA8-2693DAA7C46E@linux.dev>
References: <20261028113319.38544-1-kaitao.cheng@linux.dev>
 <20261028113319.38544-3-kaitao.cheng@linux.dev>
To: Kaitao Cheng <kaitao.cheng@linux.dev>,
 Zi Yan <ziy@nvidia.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 28, 2026, at 19:33, Kaitao Cheng <kaitao.cheng@linux.dev> =
wrote:
>=20
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>=20
> When vmemmap restoration fails, add_hugetlb_folio() returns the folio
> to the hugetlb pool. It clears folio->private and restores only
> HPG_vmemmap_optimized, losing HPG_cma on CMA-allocated folios.
>=20
> A later successful free then bypasses hugetlb_cma_free_frozen_folio()
> and returns the pages through free_frozen_pages(). The CMA allocation
> bitmap remains set, so the range is unavailable for future CMA
> allocations.
>=20
> Save the CMA flag before resetting folio->private and restore it along
> with the vmemmap optimization flag.

We already knew this issue. Cc Zi Yan. Seems he hasn't sent a fix.

But we want a different solution. See:

=
https://lore.kernel.org/linux-mm/A1A14368-7A43-40ED-B2AB-C2EC2C5FFB1D@linu=
x.dev/

Thanks,
Muchun

>=20
> Fixes: d2d786714080 ("mm/hugetlb: enable bootmem allocation from CMA =
areas")
> Closes: =
https://sashiko.dev/#/bug/linux-5363eb09-9c3c-4f8b-9f3c-a998a8c4b258
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
> mm/hugetlb.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 4a008afaedf9..8da4bab676c9 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1437,6 +1437,7 @@ void remove_hugetlb_folio(struct hstate *h, =
struct folio *folio,
> void add_hugetlb_folio(struct hstate *h, struct folio *folio,
> 		       bool adjust_surplus)
> {
> +	bool cma =3D folio_test_hugetlb_cma(folio);
> 	int nid =3D folio_nid(folio);
>=20
> 	VM_BUG_ON_FOLIO(!folio_test_hugetlb_vmemmap_optimized(folio), =
folio);
> @@ -1453,9 +1454,11 @@ void add_hugetlb_folio(struct hstate *h, struct =
folio *folio,
> 	}
>=20
> 	__folio_set_hugetlb(folio);
> -	/* Clear all folio->private flags except =
hugetlb_vmemmap_optimized. */
> +	/* Preserve the vmemmap optimization state and CMA allocation =
origin. */
> 	folio->private =3D NULL;
> 	folio_set_hugetlb_vmemmap_optimized(folio);
> +	if (cma)
> +		folio_set_hugetlb_cma(folio);
>=20
> 	arch_clear_hugetlb_flags(folio);
> 	enqueue_hugetlb_folio(h, folio);
> --=20
> 2.53.0
>=20


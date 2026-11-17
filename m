Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914126;
	b=Fwp8dHp0c7ywwRknd56ndNop10JZQQOIPbvXPLTKsTQIvTrgBwabLE+V0GvLskwJknsm
	 j0nwTM05EWQY6fJ62kwyTbejrF7rgqT2h6N7koAFFxBE2733bp9yEU4mcVEDHdfuikSFi
	 MZI/QFCDwB7DHK0RZxftDlOJ1aME8V+f7rsuHfKgdt0CLvXvjVEBh+xBFaWxqylMxWKIm
	 /6Mc7Vrlqb3yq8olNpfioj8i+TXjxbph9MSsBQYbsNPlNP+Tp78ZPF8rxrmjCXBqS8joB
	 khiDPAH3KFLcNllkPRAvhrpFQgozX91XQxWp1oy1JB5GCG3Eb6aWG/BGoN48PJsW8Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914126;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=eJA2MCmjb1P7IxhgFgaHgcq/Fcrb54LrvxuYSklnXNc=;
	b=sXa/N5adRcf829Whzc0yANTeFfNpLKQ2ifApKJ00kXX+jWfz5gVeo3chEZR6i+jAjtZq
	 Gd7qlTIF5uBl+VAOI9boF4RB279miMbv1mX4ynEJj0bU0eQ6yqJLF5VKndfIJl/wh3jmi
	 wi8TLbHiHR6DwPAYpW8MhXVR1DQ7htT8MCDhnLY0KxVRLG1Qc3nAYsr0tXqK7j+6TpH8P
	 2PAGnfGktWbv4O/3ASiykx7W3Hm2fUUU53Ng+y62SlorjaG73uxQuRxkzv9t/hycH6gxZ
	 g7f3l+SuVXCdsR7te8vVsnxB80XMC1ua0SYFiYIfB5OUwulaqtL1tJS/MX5Rw0Om92Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WtAuPwrH;
	arc=none smtp.remote-ip=91.218.175.81
Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B762606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B762606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WtAuPwrH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Qdvw5YG0QTbLXakfG7ZIquI7spJ/+YwHooiKLh0MV1M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794914123; v=1; x=1795518923;
 b=WtAuPwrH0bLfMsyfieVv+5tELmVcNUIe6liL1OZH0qNiEzD2e9y3bdABY+yvLdDCmRGMzAse
 PqE+Ic3opJyXs0VYueOCcuWca5dJZo1FxOnS8zX2OqBS1ZMLcB98u+feL2bWcfO/X8lq7AVNPV8
 MMvdVOvUg9apaIJF/jN4lg+I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id aeaa08e42b06b611;
	Tue, 17 Nov 2026 11:15:21 +0000
X-Mizu-Trace-ID: aeaa08e42b06b611
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 2/2] mm/hugetlb: remove the gfp_mask argument from
 alloc_hugetlb_folio_reserve()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261117-for-memfd-v1-2-fa68f433171e@kylinos.cn>
Date: Tue, 17 Nov 2026 19:15:05 +0800
Cc: Hugh Dickins <hughd@google.com>,
 David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DF9FCBFB-C1E3-497F-B7AB-567F44873B05@linux.dev>
References: <20261117-for-memfd-v1-0-fa68f433171e@kylinos.cn>
 <20261117-for-memfd-v1-2-fa68f433171e@kylinos.cn>
To: Hongfu Li <hongfu.li@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 17, 2026, at 18:53, Hongfu Li <hongfu.li@linux.dev> wrote:
>=20
> From: Hongfu Li <lihongfu@kylinos.cn>
>=20
> alloc_hugetlb_folio_reserve() takes a gfp_mask argument that
> memfd_alloc_folio() always sets to exactly htlb_alloc_mask(h), which =
the
> helper can derive by itself.
>=20
> Derive the mask inside alloc_hugetlb_folio_reserve() as
> alloc_hugetlb_folio() does, and drop the argument.
>=20
> No functional change intended.
>=20
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> ---
> include/linux/hugetlb.h |  4 ++--
> mm/hugetlb.c            |  3 ++-
> mm/memfd.c              | 13 +------------
> 3 files changed, 5 insertions(+), 15 deletions(-)
>=20
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 69732e4cc03e..a88c59476e79 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -735,7 +735,7 @@ struct folio *alloc_hugetlb_folio_nodemask(struct =
hstate *h, int preferred_nid,
> 				nodemask_t *nmask, gfp_t gfp_mask,
> 				bool allow_alloc_fallback);
> struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int =
preferred_nid,
> -					  nodemask_t *nmask, gfp_t =
gfp_mask);
> +					  nodemask_t *nmask);

To be honest, I'm not a fan of this change. This is a memory allocation
interface, and we shouldn't couple it with a fixed GFP mask. Sorry, I
can't ack.

Thanks,
Muchun

>=20
> int hugetlb_add_to_page_cache(struct folio *folio, struct =
address_space *mapping,
> 			pgoff_t idx);
> @@ -1161,7 +1161,7 @@ static inline struct folio =
*alloc_hugetlb_folio(struct vm_area_struct *vma,
>=20
> static inline struct folio *
> alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
> -			    nodemask_t *nmask, gfp_t gfp_mask)
> +			    nodemask_t *nmask)
> {
> 	return NULL;
> }
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 88c9aa700533..e84203406da3 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2221,8 +2221,9 @@ struct folio *alloc_buddy_hugetlb_folio(struct =
hstate *h,
> }
>=20
> struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int =
preferred_nid,
> -		nodemask_t *nmask, gfp_t gfp_mask)
> +		nodemask_t *nmask)
> {
> +	gfp_t gfp_mask =3D htlb_alloc_mask(h);
> 	struct hugetlb_cgroup *h_cg =3D NULL;
> 	size_t nr_pages =3D pages_per_huge_page(h);
> 	struct folio *folio;
> diff --git a/mm/memfd.c b/mm/memfd.c
> index 8905e3e9efc8..08b9d54b0d8a 100644
> --- a/mm/memfd.c
> +++ b/mm/memfd.c
> @@ -69,22 +69,14 @@ struct folio *memfd_alloc_folio(struct file =
*memfd, pgoff_t idx)
> {
> #ifdef CONFIG_HUGETLB_PAGE
> 	struct folio *folio;
> -	gfp_t gfp_mask;
>=20
> 	if (is_file_hugepages(memfd)) {
> -		/*
> -		 * The folio would most likely be accessed by a DMA =
driver,
> -		 * therefore, we have zone memory constraints where we =
can
> -		 * alloc from. Also, the folio will be pinned for an =
indefinite
> -		 * amount of time, so it is not expected to be migrated =
away.
> -		 */
> 		struct inode *inode =3D file_inode(memfd);
> 		struct hstate *h =3D hstate_file(memfd);
> 		int err =3D -ENOMEM;
> 		long nr_resv;
> 		u32 hash;
>=20
> -		gfp_mask =3D htlb_alloc_mask(h);
> 		idx >>=3D huge_page_order(h);
>=20
> 		/*
> @@ -101,10 +93,7 @@ struct folio *memfd_alloc_folio(struct file =
*memfd, pgoff_t idx)
> 			goto out_unlock;
> 		}
>=20
> -		folio =3D alloc_hugetlb_folio_reserve(h,
> -						    numa_node_id(),
> -						    NULL,
> -						    gfp_mask);
> +		folio =3D alloc_hugetlb_folio_reserve(h, numa_node_id(), =
NULL);
> 		if (folio) {
> 			/*
> 			 * Zero the folio to prevent information leaks =
to userspace.
>=20
> --=20
> 2.54.0
>=20


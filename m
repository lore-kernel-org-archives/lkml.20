Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987931;
	b=ZJHqqcA/6SfPb/tyPw0JxxR17ZY7MgqQjOj78iF39fvcVnNUzw04Q7C+gKpY/KUopJtQ
	 T/0E988cyKV/tx/IPie0SdeYNb/MV1DNIQchIM8asylWe5+5VgrSrPmY7qJAee8kPFAlI
	 NNFo8c6KM5qDWiFYQmmILZ6r8xCn/sPZM7RyUwBxNOJntnbrzzJ9V1WMMXbBw6GOZbs+c
	 JXZUNPBoGWucqslrTCy11EoVEY8TvaIUgL/mplsRnWHuM1WHpfwq7Ecdsq7oRLe54IMSC
	 txN7jXC19Ge1fof6dQDvf22LM5VlS0Ns5S80FWae2VGCh54YZocYavz8hmBDaV1I+LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KoOh0KgSmAnOjKaKpi/0YYF58G7PTa1KHqz+Z6PRDOg=;
	b=GPKwuRHotn9UuvnEgXZvV9EmUYQUY9Hlh7nIOWyqDAAxtT9GZgcDUDp5MzA1tRDQJ1H3
	 opTM9TRLdPs6t077g1PK3ZPylvjeQ7sxzMbWzaSE2Ny1TVzDzmnSQtM5CmwG00nTvtena
	 TJz388VLZnGLu+NhWmFIkKML5FuPJDz3+FfdspfpodKYvFCRDLE0i/8sCgVGTKSeyj/5s
	 VUibwPCSuibqAELiworNlfHgteWEESgLGZq3kJuzm2NPlp2VWNQfkEf3yCMzWHh3suHYf
	 HoXYylACHW2O4H8M4Xrm3DP6wjzGvbhWUS8ru7cXZrLFv5lRTPDjbffAurlSdcZ4m1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ckldtfAp;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06C5606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C06C5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ckldtfAp
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533778ab0bdso10265311cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793987929; x=1794592729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KoOh0KgSmAnOjKaKpi/0YYF58G7PTa1KHqz+Z6PRDOg=;
        b=ckldtfApc2a+8xtbx8tMkucEhxUCvF+Cw+JJDVJ6f2f8qLw6otsyHydoCal9Y8PQVE
         wSqegXOmaHckcVudPQ6CSb2Ruksh9t0YwF/s+5BHasjKno/b/Le3QZHOw9O0Wc9bTYas
         64ujbEgDlUftzzRM+Sn0H/9m6rO6xhL4b6YUYLPi6ml4aKmlxBzTkTsjvjBY/T4aOWRE
         Tt8FwlEUCSShEOsz+aE75gU78VQ7uHBKnzZICLAFdSlDCyXdndFhhzq7QHroTgLCaOhy
         ZDPDzp6HoM1U3pQJpMpalCQZ3F3o6QTXHe2VyZogcz6GpPK/vb29LOX3GA5Sf3zaycH6
         LJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987929; x=1794592729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KoOh0KgSmAnOjKaKpi/0YYF58G7PTa1KHqz+Z6PRDOg=;
        b=Dnyej9lqz+1NlB2SmoS1upID/Bbjqo703bo5lRTmi2b9IPt5MnBUe5xn4dFpEcpD1j
         jye1OASTqBzibNyat9dschmrd1sASi3RQcmhccTVa8c9forgP2n+VrROxa0VZa5wxgDO
         RfEl9JeATO/oJz8EP9F6lhQBukN4WjcsnwDV8Sn9jKnOQ/7M2+ZuzSaiNgl1FtL9wEnN
         CE8vdZ7Ihck8gKmIz6jWNPGHL0VJFH5JpWjdg5wLVzrZb30uB37kz7XC6eh+7sVhBEYb
         oL5pedRuWv8qL6QE5A8HPN6YjVelliqlLMpqzXVBYngCAx9uFmccNkgSC/StX3t8RM2U
         8V5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwsfNXdxETLu89LUcfQOnExXmTLAdMDJ8bG1c9/uNyBpMvF6q4XEc63vo17cdSmMTWxwS+vN+Xlzo/n02g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PhyLhW/NNEbw/39O7VQTUN86d8VHNqlvv6zDoic2I8Fe2uTdA
	nI2nExJDi+Kjcxb4aXqkdPi+C4HfAsWoV7S6gohMg3hFEeO4ocfgCR+tteJ/nkqCDBo=
X-Gm-Gg: AYBFou3I0YT8r8fcnZ+JGHmY2fMPMskiGFNG0AHeXDomuBO7g8iz3NYBYwukTJJZAUV
	R6rFDZYWSG4q33nY4v5HW/jpnTWEEkGrF2a1tPwh5qiARnSkGRYMGhckhieWWtGVTGp5mVNHxmN
	oaBPZzrtSvUbi7jOTo/GhPZMve8niLw3iQjHct9WzHN4Enj4Y0xUp/5nb8uisJaKv+pU/y85/df
	GC0Hd+LHfTw5qb2+0rk++WTKZOq3Na0rGqM9aaHHWa/6Sk+1Z5e9Ok8P+OfFbNhVxhHjeHjrMwy
	qxY1RU1lEqeB/8jzuPpZVf/oSCuInrY/WQ6k4WHgdZV2h5c1lTx8QPQ+ji9tGd6UwITzu9nUQk8
	2Iy1X6AbRSQG/txjq+s35UOKPo/YRUwjszOQRUQAr5ZVuKjRk6o9kUhccuxpsdE8Su7QzRv0ILG
	P7QuAv/Avo6M+Jaofs6iw6qUOuDk+yluFfeV6njghDKCIuk6m/F6C2/IdXj0qvtBRwhH4ooALbB
	UzZOXiHa6FTybM1QAvRlSlrYtjl+60UxL8v06T48yj60baIUg5g60DSB/SI9JU7R3t8auCWooTO
	m70dRLrXGt2Bjw6lCt+vGG2BBBxLBkLoakfP2LwXhrt/
X-Received: by 2002:ac8:5d08:0:b0:536:699d:9a22 with SMTP id d75a77b69052e-54e157646f3mr53331201cf.57.1793987929323;
        Fri, 06 Nov 2026 09:58:49 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e27013e83sm25509581cf.24.2026.11.06.09.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:58:48 -0800 (PST)
Date: Fri, 6 Nov 2026 17:58:36 +0000
From: Josef Bacik <josef@toxicpanda.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Song Liu <songliubraving@fb.com>, 
	Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Steve Sistare <steven.sistare@oracle.com>, 
	John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, iommu@lists.linux.dev, 
	stable@vger.kernel.org
Subject: Re: [PATCH 2/5] mm: limit pagecache folio refcount when splicing
 into pipes
Message-ID: <n3l2cnx6d25jovloqyoxiz566mh62janclmiewjvumtmqfezo7@zmsmco5vvssn>
References: <20261105-refcount_overflow_stable-v1-0-70b9c655da3e@kernel.org>
 <20261105-refcount_overflow_stable-v1-2-70b9c655da3e@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-refcount_overflow_stable-v1-2-70b9c655da3e@kernel.org>

On Thu, Nov 05, 2026 at 02:10:11PM +0100, David Hildenbrand (Arm) wrote:
> Similar to mapping pagecache folios into page tables, let's reject splicing
> folios into a pipe if the refcount is at it's limit, similar to how we
> handle it during GUP.
> 
> This will prevent more cases of possible folio refcount overflows with
> large pagecache folios.
> 
> Let's keep it simple and check in the two callers of
> splice_folio_into_pipe().
> 
> Also check in try_get_page() to cover pipe-buffer duplication by tee()
> and partial pipe-to-pipe splicing.
> 
> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  include/linux/mm.h | 9 ++++++---
>  mm/filemap.c       | 4 ++++
>  mm/shmem.c         | 4 ++++
>  3 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 79ae8fc0d6bb4..a82cfbce18215 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2287,10 +2287,13 @@ static inline void get_page(struct page *page)
>  
>  static inline __must_check bool try_get_page(struct page *page)
>  {
> -	page = compound_head(page);
> -	if (WARN_ON_ONCE(page_ref_count(page) <= 0))
> +	struct folio *folio = page_folio(page);
> +
> +	if (WARN_ON_ONCE(folio_ref_count(folio) <= 0))

Since you're here anyway can you change this to something other than
WARN_ON_ONCE, since that results in an OOPS with panic_on_warn set?
Thanks,

Josef

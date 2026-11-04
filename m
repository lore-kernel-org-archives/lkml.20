Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810317;
	b=XV204NHtlJRlT2OeBBWc9lGir33zBQgX4uW8kQmTsVkApTQabW7CSVIrJrjhM4xX0yJK
	 ZhaXV4hM4j/esOv4AOkb55LdhuQ0T+Rys+kDrndEW7X5RMP5gtmfbr4OA4PsTM5h5NgWb
	 MZYb7pgJl4A4m3kJ7+72i8eiXi+AnTtRXXwHnvr72jOGdj7jcvBFbBtPxYbGpsmWzzwJ6
	 XuLvJ8B31gjYg4KYlJ9QXT7b1vMw+BPuPUpIV8TELCgeV8qYSujq7ukEPORbuq1p2DY+j
	 ygsRBmXGQmM8fO9UNAIswXHhs4LOW44dat+FkeSUBDpUgt4mg250ashlQE8XCWC3RBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810317;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hG3RiTzW4rOzvFwLuSqxJwT5QWl3KAEwMYSeXlW3oLQ=;
	b=d1sjIRh+JL7WjcnMMQBiHQ4TklE7CV7xeb4POrJtXoObcnfzJnvVlqhcFnfNX6zcEha2
	 +tnu9Ky3c3qK7kBEMThrXtev4Gc2gkJGTDBoIcyWAqnkVamnPURiAGmj9c5pseDIKrmyv
	 GobcjGKufdW8vbjeIaCrme7aIO2sHMNGbF8pbxbR5RjaWLopaVXAz9781OnSLrQlckQHx
	 IDOLadrJNgIoiMbS2bzO13cYiiqjRa5OUg6UXVgHjAF7SJ/39iRYEdIoZ1a52clhJGnco
	 HjTegP/xjqd58nhI09gdVdr5Fq2U4zBIwNu0rL6rJhw72qVMQR92nA5HjveLEy5SFMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Tv+MUOQH;
	arc=none smtp.remote-ip=91.218.175.192
Received: from mta0.migadu.com (out-192.mta0.migadu.com [91.218.175.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87333606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87333606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Tv+MUOQH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7Cg4Ez7Vn04vdChf0EIzG0v+x6mvneURKcF64tPZr+A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793810314; v=1; x=1794415114;
 b=Tv+MUOQHV4qew5/g4754f80AI5tU5/F1HTu/I+UxwKUvIKTyKSznhMAiU9ubR/mAAdOaazwx
 mRORZzzzUpCwUKHy28o7VLQl7PDEgcXl7Olmk8sos7gXF2SCrtt7fsHFlUa2lKQvdgn5xwv3Wj0
 YZrzGotU/vdQoECcW9izQCoY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8ed0b4cf6e12cb23;
	Wed, 04 Nov 2026 16:38:34 +0000
X-Mizu-Trace-ID: 8ed0b4cf6e12cb23
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: "Zi Yan" <ziy@nvidia.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	linux-mm@kvack.org,
	ying.huang@linux.alibaba.com,
	"Baoquan He" <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	"Nico Pache" <nico.pache@linux.dev>,
	"Liam R.Howlett" <liam@infradead.org>,
	ryan.roberts@arm.com,
	"Vlastimil Babka" <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com
Subject: Re: [PATCH v8 08/30] mm: recognize PMD swap entries in the softleaf layer
Date: Wed,  4 Nov 2026 08:38:29 -0800
Message-ID: <20261104163830.3586103-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DLZ38NR21UU6.QIKBG8SO7189@nvidia.com>
References: 
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

On Wed, 07 Oct 2026 22:06:57 -0400 "Zi Yan" <ziy@nvidia.com> wrote:

> On Fri Oct 2, 2026 at 5:52 AM EDT, Usama Arif wrote:
> > Reclaim splits a PMD-mapped anonymous THP into PTE-level swap entries
> > before unmapping it, so an ordinary swap entry has never had to appear in a
> > PMD. Prepare for installing one there instead: the softleaf layer is where
> > every consumer decodes non-present PMDs.
> >
> > Accept swap entries as valid PMD softleaves and add pmd_is_swap_entry().
> > A swap entry carries no PFN, so make pmd_softleaf_to_folio() warn and
> > return NULL rather than interpret a swap offset as a page frame number.
> >
> > Unlike migration and device-private entries, a PMD swap entry can also
> > carry the swap-exclusive marker, which softleaf_from_pmd() has to strip
> > before decoding. Strip all three overlays unconditionally while we are
> > here: each clear is a plain bit clear, so testing first only buys a branch.
> >
> > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> > Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > ---
> >  include/linux/leafops.h | 40 ++++++++++++++++++++++++++++------------
> >  include/linux/pgtable.h | 17 +++++++++++++++++
> >  2 files changed, 45 insertions(+), 12 deletions(-)
> >
> > diff --git a/include/linux/leafops.h b/include/linux/leafops.h
> > index 7c13c58a5e218..ce176c78cefd4 100644
> > --- a/include/linux/leafops.h
> > +++ b/include/linux/leafops.h
> > @@ -98,10 +98,9 @@ static inline softleaf_t softleaf_from_pmd(pmd_t pmd)
> >  	if (pmd_present(pmd) || pmd_none(pmd))
> >  		return softleaf_mk_none();
> >  
> > -	if (pmd_swp_soft_dirty(pmd))
> > -		pmd = pmd_swp_clear_soft_dirty(pmd);
> > -	if (pmd_swp_uffd(pmd))
> > -		pmd = pmd_swp_clear_uffd(pmd);
> > +	pmd = pmd_swp_clear_soft_dirty(pmd);
> > +	pmd = pmd_swp_clear_uffd(pmd);
> > +	pmd = pmd_swp_clear_exclusive(pmd);
> 
> I notice there is pte_swp_clear_flags() and wonder if we want
> pmd_swp_clear_flags() to match it.

Added pmd_swp_clear_flags() alongside pte_swp_clear_flags() and used
it in softleaf_from_pmd() for the next revision.

> 
> >  	arch_entry = __pmd_to_swp_entry(pmd);
> >  
> >  	/* Temporary until swp_entry_t eliminated. */
> > @@ -634,18 +633,29 @@ static inline bool pmd_is_migration_entry(pmd_t pmd)
> >   */
> >  static inline bool softleaf_is_valid_pmd_entry(softleaf_t entry)
> >  {
> > -	/* Only device private, migration entries valid for PMD. */
> >  	return softleaf_is_device_private(entry) ||
> > -		softleaf_is_migration(entry);
> > +		softleaf_is_migration(entry) ||
> > +		softleaf_is_swap(entry);
> 
> Using softleaf_is_swap() here makes softleaf_is_valid_pmd_entry() return
> false positive when pmd swap entry is not possible at the moment. Adding
> it only after pmd swap entry is possible can close the gap. But the
> whole series should be applied together, so it should be fine.
> 
> Otherwise, LGTM.
> 

The predicate accepts the new encoding before the producer is enabled,
but no PMD swap entry can be installed at that point. Reclaim still
uses TTU_SPLIT_HUGE_PMD until the final swap-out patch. I kept the
ordering so each consumer is ready before entries can be produced.
As you said, there is no reachable intermediate PMD swap entry to mishandle.

> Reviewed-by: Zi Yan <ziy@nvidia.com>
> 

Thanks for the reviews!

> -- 
> Best Regards,
> Yan, Zi
> 
> 

Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AC4539763
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988120; cv=none; b=I5hTmS4INoPhkEzBe+ApH/P75UgIHC1xvMuuaKce63sZvyj9eQeeWnUGwu2OUD0GJE/J9tnfSHBNMr++c57OVHKxfHq3lOUp1X8n8eeAfx7w/eIWMIEDtZ1nTsp4crZBEiEW6pln1Cc9T1HQc6bEAOKzmU2bYKCM4sVqTfy+FjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988120; c=relaxed/simple;
	bh=3Gc27KaESD4Zm5M8W+YEErJ2deocBptMWNskB4QSf8s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ui2XaqmW1NTbSvjwPsn8O/MuptJdy+JFPj+kCzzzgzJ6RgxIrDtshdLIlm+rTj1OR+pmoWCxhy84O2SCdf004/kWE2PVW3l/ECXEBDCQNM4Mryz4tSa/0lK+lg1XnR9T5uDvUTZzODhtPioudQT+FoHAeIvC4SoNuYNG+QwxvxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=nHaT7scX; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="nHaT7scX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=rsATh2NvdfjYssyKDxNkJtZ2YWaOMp/Hif/9TBiSHDk=; b=nHaT7s
	cXU1WXU6CO3hd6w6vappdCuPeAFBZCKamSkG2eanWhFG5ef7XFK4lpomusUIbqBABgVlsT+XlXteg
	2mMFrQwqUTSZ9kP3F3MsFx2A46M9MTDc0ndj67/y9ni7/JAghqLwhiddCULH6Q1yu9ZYtETTjkeNO
	WqIwl2/gjC7jTKra5m8FJ7seZU+T8PpPCqCVXYaxUZb9Vueaa3fHz56WJjILh7DU5BUqAW2ypWDkV
	gdUF9yM1Esri2XdhHpZmMBTMs/xp+eYfN2JpZuGXTwufa6A/eDVi17XuSoPr8uVW145eIVfTcsiq4
	ANwzrdEJzrUvdGynMUHv6rgUtkSg==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xGzxS-00000007OmE-0fd6;
	Wed, 14 Oct 2026 14:27:54 +0000
Message-ID: <038db2e68469e74077264a490e104391bdffe35e.camel@surriel.com>
Subject: Re: [RFC PATCH 2/5] mm/page_alloc: count a merged buddy's pages
 under the merged type
From: Rik van Riel <riel@surriel.com>
To: Dev Jain <dev.jain@arm.com>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka	
 <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko	
 <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, Johannes
 Weiner	 <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Kairui Song
 <kasong@tencent.com>,  Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt
 <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>,  Axel Rasmussen
 <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu
 <weixugc@google.com>,  Baoquan He <baoquan.he@linux.dev>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, David Hildenbrand	 <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"	 <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org
Date: Wed, 14 Oct 2026 10:27:54 -0400
In-Reply-To: <55f51fb8-9777-424a-b45f-a6a5bd9a4693@arm.com>
References: <20261007021250.1665929-1-riel@surriel.com>
	 <20261007021250.1665929-3-riel@surriel.com>
	 <55f51fb8-9777-424a-b45f-a6a5bd9a4693@arm.com>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-10-14 at 19:46 +0530, Dev Jain wrote:
>=20
>=20
> > +++ b/mm/page_alloc.c
> > @@ -993,6 +993,11 @@ static inline void __free_one_page(struct page
> > *page,
> > =C2=A0			account_freepages(zone, 1 << order,
> > migratetype);
> > =C2=A0		} else {
> > =C2=A0			__del_page_from_free_list(buddy, zone,
> > order, buddy_mt);
> > +			/* The buddy's free pages join the merged
> > block's type. */
> > +			if (unlikely(buddy_mt !=3D migratetype)) {
> > +				account_freepages(zone, -(1 <<
> > order), buddy_mt);
> > +				account_freepages(zone, 1 <<
> > order, migratetype);
> > +			}
> > =C2=A0		}
> > =C2=A0
>=20
> MAX_PAGE_ORDER > pageblock_order confuses things so much : (

I'm not a fan, either. It trips me up every time.

>=20
> Sashiko raises something:
> https://sashiko.dev/#/patchset/20261007021250.1665929-1-riel%40surriel.co=
m
>=20
> Although feels like it is exaggerating.

I suppose if we switch the two lines around, doing
the increment on migratetype before decrementing
buddy_mt we could avoid that transient underflow?

>=20
> My concern is for systems with a high diff between MAX_PAGE_ORDER and
> pageblock_order. So on arm64 systems with 64K pagesize but pageblock
> size as 2M (and PMD size 512M), the pageblock order is 5. We use this
> configuration to reliably get TLB optimization from contpte size
> mappings.
>=20
> Will we then repeatedly overflow the pcpu counter into the zone
> counter,
> regressing stuff?

The per_cpu_pages struct does not seem to keep
counts on a per migratetype basis at all. It
has per migratetype lists, but only one
pcp->count.

Also doesn't the pcp only carry order zero
pages currently?

I don't really understand your worry.

>=20
> Perhaps I am overthinking. Your approach is clean, but perhaps we
> could
> also do:
>=20
> void account_freepages_move(zone, order, buddy_mt, mt)
>=20
> 	/* PCP-types do not have per-migratetype free counts. */
> 	if (likely (buddy_mt < MIGRATE_PCPTYPES && mt <
> MIGRATE_PCPTYPES))
> 		return;

Wouldn't that throw off the counts when we merge
e.g. a MIGRATE_UNMOVABLE page with a MIGRATE_MOVABLE
buddy?

With your test we would only ever do the free count
adjustment for mismatched types if one of the pages
was HIGHATOMIC or CMA. That leaves the common case
without coverage.

--=20
All Rights Reversed.

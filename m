Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921694;
	b=3nb5RIQhpNCSRTb/3Bj/gmq/hSbd5HKlIRdOiSr39tfCAW7Yrp2vt6C444b4fhkX5PdB
	 MMTecEMfB/uJcQ8JJSEEQhttVsHlpkqHZn677BSmQjPmVdn40+PwtiqxE53DtsfIWCTIR
	 Xi0Yrmzty66Ro6cltW8SJj/niR5U010vnSlGnz5z8smBbIj8CSFRVTdELDY9o0jg2Hs8K
	 96c5YmCVB+6KKbJqn1C4g4mP+4v6M1Q3g/pVbCiFmT11JhDf5DFy+mAmURKtBVb85p5Nt
	 Vn4rFhwEeZvKyNMX/23VaKZzEbwd3b/KBjnprna7kdco2jcCtgK/bGEorYiyVgGKqkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921694;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Zi8OAGVQukL/w4MsMi+hTnD2T6SHZKyI0yT1q7MBUxo=;
	b=BGLuiGriEOlIEoTywbS5OKTHLJl4ai98R5637DBpCQWSRfcTyfA4C01eUySAXHIadoi2
	 1UYlN+LolfS+iw0vTML21SV/3pRJfcguarpmSkceVDXDdb8RPoZU46Rwf7rTE/sfJD6No
	 gRQPN64wjfpMFeHp4gS1iih3soh9wgg262D6NqRt3zMl2uXG2GRpyy82bmhIgagGZb1Mw
	 QEhb5tfshbRQMZPn3tsYrIHS7Zd9Vgnb33c27+lZ5dxN02sni2bjeto90gPX8ORAdY/Ys
	 z7AOfx1VWItdQ2on+3rIj44j7ZzhRvAkHXMct+x1j6wyE++XTO0I0q+kCJ0T2v2JY+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3hLoxO5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE27606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3hLoxO5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC3D1F000C4;
	Tue, 17 Nov 2026 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921694;
	bh=Zi8OAGVQukL/w4MsMi+hTnD2T6SHZKyI0yT1q7MBUxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c3hLoxO5ZMuNEHZiJATEkpv8p+udzJFUOp2pu1gs8MW23Tyjvpd3D5du5cH0GIhSj
	 Bebp/aNm3kBkENkyreMiaaRbw5sq5B+odL+4I/OoYt/D+eq54cF1xVwOpr0ITYdl9T
	 vFQ8MCk7K2Rv4I4qO5gXK/vWG9ZjwMRyJKbFL/jvCR6LjxpncbNktpakZhu1sTJwB9
	 B3R1lCX99cdmrzSMZYqCxRqLSKToEIIMwr9qlspSLiulHVbGM36Uj6elUKrnV/i4i0
	 2tey4lBw3qiOmYs4BqUHA9ian1oPvcab/cuHfj8C6pFzjqrRVluLMZ02KuMLv4qJH8
	 tkdcJye7wDIGw==
Date: Tue, 17 Nov 2026 15:21:25 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>, Li Zhe <lizhe.67@bytedance.com>,
	Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>, Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v2 04/14] mm/mm_init: factor out common struct page
 initialization
Message-ID: <avxU1Ypb6Vy4Sp4O@kernel.org>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
 <20261113033442.62970-5-songmuchun@bytedance.com>
 <179482576829.2379196.2091312590305150578.b4-review@b4>
 <44fc03e4-a545-465b-a7f4-174be2038884@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44fc03e4-a545-465b-a7f4-174be2038884@linux.dev>

On Tue, Nov 17, 2026 at 11:13:42AM +0800, Muchun Song wrote:
> On 2026/11/16 18:42, Mike Rapoport wrote:
> 
> > >   	page_cpupid_reset_last(page);
> > >   	page_kasan_tag_reset(page);
> > > +	atomic_set(&page->_mapcount, -1);
> > > +#ifdef CONFIG_ZONE_DEVICE
> > > +	if (zone == ZONE_DEVICE)
> > > +		__SetPageReserved(page);
> > > +#endif
> > Can't we keep this in ZONE_DEVICE part?
> 
> We can. But I put it here because there are at least two places where
> we need to mark a ZONE_DEVICE page as reserved. Handling it in
> memmap_init_page_common is simpler — it reduces the number of places
> where we have to set reserved individually. Otherwise, we would need
> to explicitly set reserved in multiple places.
> 
> > 
> > If we can't, __init_single_page() sets PG_reserved for ZONE_DEVICE pages
> > and the
> > 
> > if (zone == ZONE_DEVICE)
> > 	__SetPageReserved(page);
> > 
> > in the MEMINIT_HOTPLUG part of memmap_init_range() becomes redundant.
> > 
> 
> Good catch. I think I could remove this redundancy next version if you
> think handing it in memmap_init_page_common is okay.

Let's keep the #ifdef, still better than duplication.
 
> Thanks,
> Muchun

-- 
Sincerely yours,
Mike.

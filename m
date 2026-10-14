Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169ED4A9D62
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792011277; cv=none; b=k9o9IV2Dvo3JLbkR/LyEyM9XaVsBm70wxx2xww+5nfr7h05ewk+HxROZlFBFk2CQWNgh4dAGI782FHCOQ/OoQY7d5HmNOnPqbOPSNdmyxQmjkJGs053Vw+2+cyfprrtRTcWU4VmKjsO/j2MvChTTMteiVua1BzXReIWGpeOj0/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792011277; c=relaxed/simple;
	bh=4KW72QuKC9gmv1jraMYGyizq1JNJIfjBAssCJEpMUQE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UhmbyVlh4EeH1CRwuOUWJWN9JOYSIKckMHUCMTnfBX8+ryYAk9R/8x7Wz/sIWly+EG0CdWiXfI9K0bwgoVXq1pM97+3IKPjcnHVVG7c7KQH+mHTxJTPek4LuCfT7LZBOv9OMDxvjt+CeKqmKe0O3W/n/aqzk1AegLo+UyrVMjZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=mlsfcTY3; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="mlsfcTY3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=nDxZe5zkbk1pmGSLhA7tLfIExZwUZ0obZcnML/ZunGs=; b=mlsfcT
	Y3ePSJP/O8uZJ3sGdAzB8HRGmMsa9DMIwYZe3Wb0uhIyu7BGynAAxMkvzlc8osprofyVObT62geNO
	cUXorem5pPYeNg9q2h4j1ICTEsVU0njVVYiBiD6zwL2SOfcrLoL6YJKtxaW6Umev9EmqrgyAcXS77
	zmOl2Uddms80l5ls6TL6MHAxKEAMCvzQWOWZ9FsRhwXRxfOINABGo2u46O7vhuaz7j5862ZCoKZLR
	C5sHmwxKC2e8W6Ah6EYE1Ggige664IwgZYqVLZhiqHnRAmZ/kq620sT8nnOrJs8CuBGWX4rptQLLS
	xI7iTlkELzdyByW9w9WCkXvJh1bw==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xH5z6-00000007lrR-3Dab;
	Wed, 14 Oct 2026 20:54:00 +0000
Message-ID: <5234543d2c1b44706501d2e079b41e95a6a1d200.camel@surriel.com>
Subject: Re: [RFC PATCH 3/5] mm/page_alloc: convert any movable pageblock on
 a non-movable allocation
From: Rik van Riel <riel@surriel.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
  Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>,  Brendan Jackman
 <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Kairui Song
 <kasong@tencent.com>, Qi Zheng	 <qi.zheng@linux.dev>, Shakeel Butt
 <shakeel.butt@linux.dev>, Barry Song	 <baohua@kernel.org>, Axel Rasmussen
 <axelrasmussen@google.com>, Yuanchu Xie	 <yuanchu@google.com>, Wei Xu
 <weixugc@google.com>, Baoquan He	 <baoquan.he@linux.dev>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org
Date: Wed, 14 Oct 2026 16:53:59 -0400
In-Reply-To: <20261014204836.GI371161@cmpxchg.org>
References: <20261007021250.1665929-1-riel@surriel.com>
	 <20261007021250.1665929-4-riel@surriel.com>
	 <20261014204836.GI371161@cmpxchg.org>
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

On Wed, 2026-10-14 at 22:48 +0200, Johannes Weiner wrote:
> On Tue, Oct 06, 2026 at 10:12:48PM -0400, Rik van Riel wrote:
> > try_to_claim_block() converts a movable pageblock for a non-movable
> > allocation only when half its pages are free or compatible.
> > Otherwise the steal path takes pages without converting, and
> > non-movable content sits in a block still typed movable.
> >=20
> > Convert a movable block on any non-movable claim, however few of
> > its pages are free, so the block's type matches the allocation it
> > serves.
> >=20
> > When other pages in the block are freed later, they end up on the
> > non-movable free lists, directing more non-movable allocations to
> > the already non-movable page blocks.
> >=20
> > Converting a non-movable pageblock to movable is made stricter:
> > a movable claim takes a non-movable block only when every page
> > is free or movable.
> >=20
> > Blocks straddling a zone edge are never claimed;
> > zone_spans_pageblock() tests for a block wholly inside its zone.
> >=20
> > Assisted-by: LLM
> > Signed-off-by: Rik van Riel <riel@surriel.com>
>=20
> I like this in theory, but wonder how this behaves in practice.
>=20
> The block is claimed, but the movable constituents aren't proactively
> kicked out.

I have code for that, too, but it seems like
it's a lot easier to get things reviewed in
small portions.

If you want I can resend this as a larger
series, with:
1) the pageblock claiming
2) per migrate type free lists
3) evacuation of movable pages from unmovable=C2=A0
   pageblocks, when the kernel free lists fall=C2=A0
   below a watermark

That would be the full extent of the 2MB granularity
fragmentation avoidance stuff I have here.

Just let me know your preference.

--=20
All Rights Reversed.

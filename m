Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12A947DD4E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367852; cv=none; b=l8UG5QstvsZluBhNiPhHoyNoCnLQrG942/51VbRKingQKzINCaF2OwxKG43R7uXDVV02nS05tmVd2hyDcYDJxbZz6Zhc2CmzZu8nfCjyk3SA65iOMOmWAfaX2kAAew+N/HJvCDM1fCwfCNPBU4mwuzOnzO4nKHQkyrDJ1nLegw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367852; c=relaxed/simple;
	bh=7e69kFUwkZGJvCU9G8Z+9oS71uNrW8NRzXwhyF1TWDw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K4qb8Tm1dk0X2XbrVtTpk18kUIlO7961lzW2c5aidKM7rPFhdqT5uhsSKP6rgRQ26jA+pv6Xnf03bIoe5OXiJgIf8iq7xfhGSp6rFWh5F0g0mXD9qsLw/xK9bSuxoCGMLP4A9cFvY+08FQF8+8m3ViBGB9ImQTihhUQH3YiCfyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=oMGUxywy; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="oMGUxywy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=7e69kFUwkZGJvCU9G8Z+9oS71uNrW8NRzXwhyF1TWDw=; b=oMGUxy
	wyLKL7FU/3mZQ2paX7J1caF6MGcfuGr0ryZoOJyqga/8K2AQNniwzYMTECAtjPD+oLE0cA5NYRvT4
	5/DsFor5W4dFU/+N/7MSdYu2ZyqGc4yPYy0jW2VHANUM1f05mhwTS/dAWRVLaL0kzyKo0Z3H+0UcZ
	ihNc1MipFUl+wabzzuJdRZjNx1fGPpXRyey2aagMz+4U6a9mwx3lK1I3wVmPGQOH2EHU85dpoERvq
	JlcQ21X96iXCGBW6A8HLjsfYjchJ3Er8uZxz4Hux7JUEZoq2KdApudvEexZFs/vt5gKrbtP+LA7EW
	U0CBadTtIzGSIk2jY4nEy0QxA4vQ==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xEOZ1-0000000B68R-3Iey;
	Wed, 07 Oct 2026 10:07:55 +0000
Message-ID: <fca681e9e9af66c8bbc43a181409ef44a24d9250.camel@surriel.com>
Subject: Re: [PATCH] mm/gup: batch PTE-mapped large folios in
 gup_fast_pte_range()
From: Rik van Riel <riel@surriel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, Yuan-Hao Hsu
	 <aa9736195201@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 liam@infradead.org, Vlastimil Babka	 <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan	 <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Aristeu Rozanski	 <aris@ruivo.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 	linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Date: Wed, 07 Oct 2026 06:07:55 -0400
In-Reply-To: <f8f6d553-d818-4cc6-a1a1-a9c9149a17e9@kernel.org>
References: <20260917083747.786-1-aa9736195201@gmail.com>
	 <f8f6d553-d818-4cc6-a1a1-a9c9149a17e9@kernel.org>
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

On Thu, 2026-09-17 at 10:42 +0200, David Hildenbrand (Arm) wrote:
> On 9/17/26 10:37, Yuan-Hao Hsu wrote:
> > GUP-fast grabs a PTE-mapped large folio one page at a time.=C2=A0 Every
> > PTE
> > costs a try_grab_folio_fast() (a refcount cmpxchg, plus the
> > pincount
> > atomic, a full barrier and a node stat update for FOLL_PIN), a
> > gup_fast_folio_allowed() and a folio_set_referenced(), so a 64 kB
> > mTHP
> > pays sixteen of each and a PTE-mapped 2 MB THP pays 512.=C2=A0 The PMD
> > and
> > PUD leaf paths already take the whole range with one
> > try_grab_folio_fast() call, and the slow path is getting the same
> > treatment for PTEs in Rik's follow_page_mask() series.
> >=20
> > IORING_REGISTER_BUFFERS of 1 GB, median of 15:
> >=20
> > =C2=A0 64 kB mTHP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 6179/5998 us=C2=A0 ->=C2=A0 1599 us
> > =C2=A0 1 MB mTHP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 5790/5801 us=C2=A0 ->=C2=A0=C2=A0 893 us
> > =C2=A0 4 kB pages=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 7173/6741 us=C2=A0 ->=C2=A0 6763 us
> >=20
>=20
> I think Rik was already working on this and sent some patches.
> Anyhow, there is
> quite some GUP review backlog I have t go through, so this will have
> to wait.

My patches are for the regular gup path, in
follow_pages_mask()

This is for the gup_fast path.

Unfortunately there is some nearly duplicated
code between them. Last I looked I did not
find any clear ways to merge them, but I
can take another look if you want.

--=20
All Rights Reversed.

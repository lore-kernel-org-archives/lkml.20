Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3665E4D7D2A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357327; cv=none; b=i0nSOubTVF1f30X5UU6STST6YNYEHEpx1AOO1ctF9FVC346QEucUFn2WjAtYtPAiqYvn82euJJUVM0pEogTcLoGWdkDNEJfryJ0J4+fZJP8bI5sNr57IgeX+sWfWoRNpX3rYr1ijJ/icFJ8hXAMhFO2rEHzCQrnlp/5QnVDUwG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357327; c=relaxed/simple;
	bh=83wOCRK/bwy9L660WV5b1gU76W+7QPnUrUylFYSXBl4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WX0MWHkCx1hD4MQMbdexrsvyapW2UWoY7SkRA6sKiGW74y1ByVl7dVKmcUbouu+4CeWCXg8I5lT7UhDwhyLCVrXEYCV7AjzYhdqHdwZv/kIyP/bJFXLvsnVSahX6zaCfXA1j9ermkcTGC/gYt0HGzBO0IPsSXt5SxPq0Qom2JMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=dn+nZaKT; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="dn+nZaKT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=83wOCRK/bwy9L660WV5b1gU76W+7QPnUrUylFYSXBl4=; b=dn+nZa
	KTAD2bYgUXJJit3XHbUO8Jg08g4kgGjLThBoD0kanK7RzYhOjD7dqpAZxsKN6zWV++BwW7XC92P1B
	3pb7wPODWSfepqP/DyBATP1044B/S2zcAKunKRrTsbxZAEVdsCiZWt3/Tz5HcWgiOWtAiUBUiYnC3
	IyL759dijGI84iTjbhsQGsQEV7xXlUU5E85Hc5PC8dGDssa2Q8ElmPK6E4zEXBVSFFjMSdqK1y8N8
	CLX41qRACRXu5jiyInar6erpneDSzsMFHOPxepf6tdiFZ4GueHmt/O7+7i3+9alWFgXFzNr0QEz4q
	zR4giyVz/QTDo7s8E4QdftwoVP9g==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xIY0v-0000000Doky-2uO5;
	Sun, 18 Oct 2026 21:01:53 +0000
Message-ID: <c155b536e79ebfc9eb384dc8046cf31865d08843.camel@surriel.com>
Subject: Re: [RFC PATCH v3 8/8] mm/gup: batch contiguous same-folio PTEs
 into one refcount grab
From: Rik van Riel <riel@surriel.com>
To: Yuan-Hao Hsu <aa9736195201@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, Andrew Morton	
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Jason
 Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu
 <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>,
 linux-mm@kvack.org
Date: Sun, 18 Oct 2026 17:01:53 -0400
In-Reply-To: <20261018182652.691-1-aa9736195201@gmail.com>
References: <20260811025157.1632867-1-riel@surriel.com>
	 <20260811025157.1632867-9-riel@surriel.com>
	 <20261018182652.691-1-aa9736195201@gmail.com>
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

On Mon, 2026-10-19 at 02:26 +0800, Yuan-Hao Hsu wrote:
> On Mon, 10 Aug 2026 22:51:57 -0400, Rik van Riel wrote:
> > Add follow_pte_batch() and give follow_page_pte_commit() a run
> > length.
> > Each run starts with a full per-PTE resolve, then
> > follow_pte_batch()
> > finds how many more PTEs extend it with a pte_same() scan rather
> > than a
> > re-derivation of each page, and the run is committed with one
> > refcount
> > grab. Runs stop at folio boundaries, so plain base pages are
> > unaffected.
>=20
> One side effect worth a sentence in the changelog: with FOLL_TOUCH,
> folio_mark_accessed() now runs once per run instead of once per page.
> On the classic LRU the first call only sets PG_referenced and the
> second one activates the folio, so the old per-page loop activated a
> PTE-mapped large folio from its second page on, and a run now leaves
> it referenced but inactive.
>=20
> Measured with one get_user_pages() call over 2 MB of freshly faulted
> 64 kB folios (kprobe on folio_mark_accessed(), flags from
> /proc/kpageflags):
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 before=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 after
> =C2=A0 folio_mark_accessed=C2=A0 512 per call=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 32 per call
> =C2=A0 after 1st call=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32 folios activ=
e=C2=A0 32 referenced, 0 active
> =C2=A0 after 2nd call=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32 active=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32 active
>=20
> That matches what the other two paths already do (follow_huge_pmd()
> only calls touch_pmd(), GUP-fast only calls folio_set_referenced()),
> so it looks like the right outcome.=C2=A0 It is still a visible change in
> aging for anything that reaches these folios through get_user_pages()
> rather than the fast path.
>=20
Nice catch.

You are right that this should be in the changelog!

I'll get that in for v4.


--=20
All Rights Reversed.

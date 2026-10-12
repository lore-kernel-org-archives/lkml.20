Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9952B4C652E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827976; cv=none; b=FhC6zy1M+PqhKyJo+fhteUbRfo1zXbP+BnObAjs9F1c4lCsH9ftMomJP3isddKAcx62Suf4D1/j2vNimzx8O/hyn7z+0eJhbjkoSyQNKNBCVFcQQw57yON4SAiorOfjacQhJj5oS2Dod6Dus5/W++QAADkey0y7xZ++dEK/JItU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827976; c=relaxed/simple;
	bh=sSqVsa7i9/0F94O69MwWRbVlnv3K0SgetLyAuG6UTWE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bWtQUeFJF5LJ9CtV/2yUkAi6yFJc0ZjjO1+0gFTe4BWWPuSxTtKTmWP80BegmedzGYFt3c70V3BcxLPZXn/P2TjcB0ym81h9934cCEWKZozHaVrV23O5mbm/ZXO1FedDmosbvS4y/7U8aVD71Kk8M5fYqzSQTANkC1U6N/8KSrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=jeSTUYDe; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="jeSTUYDe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=sSqVsa7i9/0F94O69MwWRbVlnv3K0SgetLyAuG6UTWE=; b=jeSTUY
	DeUDo17lXLykd9R+RCjk8/w/Gp84CsB78GurqVbeBQC8q01gsTjH1Q/FHw8TpAvChnH93OQLvCcDw
	Gew0ci9/BDMbTKqN46a0eaYh3pakexQT42lD20jPc9LlBle9F0nyghOaVN7SH3Odvpsnwq6Nz3et9
	KHQDC0nKt+gNl+0hHtZc937gdIwTb0Ke94/lmcCXRVTFKBt7kCN9x8/tPytSkNTkhAdF5Zpp0ggvQ
	wAErXvl2P5WpbBPXAFykQpnWTNqZ5Omj8moMZx2VcRAfMPS3PP/D5QA9eX5ywWDkggngkpdgyzJiZ
	xu4wwoW6went70/oJttxl7NVZq/g==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xGKIU-00000003Uxj-3Uz3;
	Mon, 12 Oct 2026 17:58:50 +0000
Message-ID: <ff62aeaeb5ced49640c959c047b2e9f320f5c10f.camel@surriel.com>
Subject: Re: [PATCH] mm/gup: batch PTE-mapped large folios in
 gup_fast_pte_range()
From: Rik van Riel <riel@surriel.com>
To: Yuan-Hao Hsu <aa9736195201@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand	
 <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard	
 <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Lorenzo Stoakes	
 <ljs@kernel.org>, liam@infradead.org, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,  Aristeu Rozanski	 <aris@ruivo.org>, Ryan
 Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Date: Mon, 12 Oct 2026 13:58:50 -0400
In-Reply-To: <20261010195202.689-1-aa9736195201@gmail.com>
References: <20260917083747.786-1-aa9736195201@gmail.com>
	 <7dd4ec994502233cdc09fe5c4369adc89168d738.camel@surriel.com>
	 <20261010195202.689-1-aa9736195201@gmail.com>
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

On Sun, 2026-10-11 at 03:52 +0800, Yuan-Hao Hsu wrote:
> On Wed, 07 Oct 2026 06:47:06 -0400, Rik van Riel wrote:
> > Since this is lockless, the PTEs could change under
> > us between when we walk them in folio_pte_batch_flags()
> > and the batched try_grab_folio().
> >=20
> > Is that race condition safe, or do we need to re-check
> > afterward that:
> > 1) the ptes still point at the same folio, and/or
> > 2) the folio still spans the entire range, and was
> > =C2=A0=C2=A0 not split before we grabbed the refcount?
>=20
> It is safe, because the batch only runs after the first page of the
> run has gone through the unchanged per-page path: the folio reference
> is already held (and for FOLL_PIN the _pincount already raised, with
> the smp_mb__after_atomic() in try_grab_folio_fast()) before any of
> the other ptes is read.
>=20
> 2) With that reference held the folio cannot be split:

You are right. The page tables can still be remapped
to point at something else after gup_fast_pte_range()
grabs a reference to the folio, but that can happen
no matter what precautions we take inside gup_fast,
because it can happen after gup_fast has returned.

I have no other concerns, so feel free to add my:

Reviewed-by: Rik van Riel <riel@surriel.com>


Could I convince you to take a look through my
earlier series to make regular GUP go faster?

If there are any issues left in that, I would
like to fix them before the maintainers get
around to reviewing that series:

https://lore.kernel.org/r/20260811025157.1632867-1-riel@surriel.com/

--=20
All Rights Reversed.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282649;
	b=x580BZVoPfvoBGTpgt6fTme1lSjLGQbqESVqGELc5muZkCWCeCea6Ij20ZhibOfbPImc
	 FiVSRGH3BAI7uLZSYdshFfv1UOr0VIhmo3NTtcoCwwN7fPy0ZkJYuBaZSCVEqeS4aah+N
	 msyYzbCXYzupSvKWpZuQg5V83d/nFhPQgQBLBB2m2DuP8umvv31Gw9T0XemszXATBQLLJ
	 Cr0Eo4fuDDCyi3pwY0LZVI40prOlALqn+BYMyvaIm0bMcPoHnyohUEs2AXbv05c52/OL5
	 +mbU5y17A87ewkpfYj/b3yki9YzxdTXlKZ5DDjcQXH6Z6fw3o3mQM6Zlo2eKIUgK2yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282649;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=28EHKTd5g7GgnDMc0iqNKE3KenijVI7p8oAI1MBlUbA=;
	b=TK07Pa4N7WhsqkjSzwwsNIfF5d3Lum3JSsxDUQ6CtZAfzoW1w2+DsrKBiUl+QfHXMchC
	 j7dO3g6w+eGpXvGLiF/3KvifmSOaohwfeOlm7Fv7QY4M1H12QJc+BMD1XAmHfRhbZsv9W
	 6ak7jxOfkFkTPp3raggdw/PYGKosEPaYXH5kSV0APpl4kxklpQlbTQ7epI3G4kfTLEuD7
	 CZ51cqui8xMcs3aUxHbwNGEjbA3/zW2o2/wcZm/Fwre+XRCv+BBV3WEmhz2z/mEpfVBj4
	 F/G18Ags9ZFgcoVpF0+GzLC98GPBYvRvXTFGd00OLh72eYQe11IGH3Ik3OJrKU68BfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=MRkMaR8E;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9569B60A261D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9569B60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=MRkMaR8E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=28EHKTd5g7GgnDMc0iqNKE3KenijVI7p8oAI1MBlUbA=; b=MRkMaR
	8EV3mQT04NyuGBfJ4GAxJ318uyqe+jfErfFX7HXI3DsXV/m6bxcNJttQHm8ZR7Wm0ry9obhmmMMg8
	9JckodjwPv+QuYrUqgFbRoK/IdP5Zwskijnn6D1KiUkg7Vt4mu5d8PBo2Jos2qvWGh3EROvnbTLbZ
	2tnESEXqm51BVywMepAa94NhznjvnPINpCZvZ6uHkiyRh5waAJdixK6XYhzOle7Hx+17Z7GBqDhs0
	gL4AnR4rDDat4NF/0aznKRrQrw9vj3zJqanGhjTr8t/2N1vqXwZotGh+Dl4k1Ro+CUcyAOZ8Cesoq
	Zr822Qng/IF7Y0x9x0I0+ILG8yHg==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xQcsS-00000003Vwm-2DAC;
	Tue, 10 Nov 2026 03:50:32 +0000
Message-ID: <a6d539cbab73091647fc2308b69fdab3069b0fe5.camel@surriel.com>
Subject: Re: [PATCH v3 2/6] mm: gup: clarify a reason to check pte/pmd in
 gup_fast_pte_range()
From: Rik van Riel <riel@surriel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>,  Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,  Michal
 Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand	 <david@kernel.org>, Yuan-Hao Hsu <aa9736195201@gmail.com>
Date: Mon, 09 Nov 2026 22:50:32 -0500
In-Reply-To: <20261109-refactor_gup_fast-v3-2-2aaef02df0e1@arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
	 <20261109-refactor_gup_fast-v3-2-2aaef02df0e1@arm.com>
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
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-09 at 12:32 +0000, Yeoreum Yun wrote:
> Clarify a reason to check pte/pmd in gup_fast_pte_range().
>=20
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
> =C2=A0mm/gup.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/mm/gup.c b/mm/gup.c
> index 7d43ce717b246..7f9348c633d58 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2881,6 +2881,14 @@ static unsigned long gup_fast_pte_range(pmd_t
> pmd, pmd_t *pmdp,
> =C2=A0		if (!folio)
> =C2=A0			goto pte_unmap;
> =C2=A0
> +		/*
> +		 * Recheck the PTE after grabbing the folio to
> detect concurrent
> +		 * unmapping or protection changes such as by KSM.
> +		 *
> +		 * Also, recheck the PMD: THP collpase can detach
> the PTE table

collapse

> +		 * while its entries remain unchaged. Checking the
> PTE alone

unchanged

> +		 * would not dtect that we are walking a detached
> page table.

detect

Other than that, Reviewed-by: Rik van Riel <riel@surriel.com>

> +		 */
> =C2=A0		if (unlikely(pmd_val(pmd) !=3D
> pmd_val(pmdp_get_lockless(pmdp))) ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 unlikely(pte_val(pte) !=3D
> pte_val(ptep_get_lockless(ptep)))) {
> =C2=A0			gup_put_folio(folio, 1, flags);

--=20
All Rights Reversed.

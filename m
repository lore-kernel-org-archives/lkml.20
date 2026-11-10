Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342220;
	b=XvNm1xaO63j4vpasPW9ZyEr/ayUTiX8UhDrsoG6D3oX2TtWmqegcKGdQ0YNG+3H1QODP
	 uavTvzEccXe6akX6qBCLTooy2ux+CkD43mDh6YSWYC6R+bZ8bUwda9UpvQPQs/4GJv7tz
	 mtMSR+0GJfN1/pWfo3XcO0QlruYBzPky8Q/E9lchXQjsLdYJT61LXOdzUqKFRrVi/dt9a
	 AKHpSZ5Bl5YFhop/sveBmEUQd64z9lrASL9MqtHf4Az3gf9IiYgNYqzs8Uq/mbckI7bFs
	 poQ1fTNBhBI1sAxWTTPjYCemy/NZEC6N/kEh2j49e4ZqxaVDkjjTwoT8173lSe7OLZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342220;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=6hA3MfN1BbBCvTGqSHg5RbmX88uNEM87rEQGr3yVhnA=;
	b=4Hx9GENrAmY466J8oByPa1q0+ezDrbForCVcprZQBTFJf1Mw4jbhQVvMCRFcteSR4CHz
	 1jiPYLpviYXKH1o+8OBMTjJBeuYCklZocxkTcO2zUrkUPbrlvYZtJscmJIBZrpB2Mi4jZ
	 Y0HuyNNp3ZI5Bjpu9rONWGYsvrslizYZukFdxQaLYSwPKDE+tFs6XrNj25ud/vle39Jzm
	 UTc5/drgViGa/Phr9B5+0oao1GETg/8oy/f9gVgZ8FKOB/J5UnKUvOp84g0uFMRs90ezM
	 QuDqHN2l3YsOqzBmiDdkoLe8W6wZ+ec+k7FmdyxNZBCteXWmfnNz33dDCruzIAlYeEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=nuRrXCJb;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F59D60A3808
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F59D60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=nuRrXCJb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=6hA3MfN1BbBCvTGqSHg5RbmX88uNEM87rEQGr3yVhnA=; b=nuRrXC
	JblYDcQlT7M+FY0Fw+jCUrv6dIe352eRe3+z1Hr9DVVo8CYLForaq7+mhXy2yZZoyaybdsubaLNeY
	rI8clDBgELyStdptyGcWpgot+Cm41srvMkD3PhoRiCxOh2LJmuFzva+GsJwfc9CE13iqjRoFXAjRn
	xcw6+cgDc6bjiP6gUg7ImfCPliFxHVIWDGm7nTjdSZ+QU7Yocy4QfIoldxBkxpIpripccVbENuthR
	2zt3hEkKzz7nIAv1T1DTro3SC2Kg+YSvTvaNwgfBhazuh/PRO12G1iLwlHCFb+gQ4c3zruKAo5tAm
	aqix980rD2xv8ND8l3Y53x4iB/qQ==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xQsNA-00000003hWy-0yIi;
	Tue, 10 Nov 2026 20:23:16 +0000
Message-ID: <5db7a358c293393a93984ac3c3cc58e810edd75a.camel@surriel.com>
Subject: Re: [PATCH v3 5/6] mm: gup: introduce gup_unshared_pages()
From: Rik van Riel <riel@surriel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard
	 <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Lorenzo Stoakes
	 <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
	 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
	 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Andrew Morton
	 <akpm@linux-foundation.org>, Yuan-Hao Hsu <aa9736195201@gmail.com>
Date: Tue, 10 Nov 2026 15:23:15 -0500
In-Reply-To: <avN8WISVUF7u4bXl@e129823.arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
	 <20261109-refactor_gup_fast-v3-5-2aaef02df0e1@arm.com>
	 <7627c0d90188b581e7740bf8d17c8dd07b460f89.camel@surriel.com>
	 <avLqwIWHa5CAbHO2@e129823.arm.com>
	 <aa227fea-d22b-4c0f-bd11-bf9ec36b0767@kernel.org>
	 <699499e46ace0875fd0f32052399e665c8209ea9.camel@surriel.com>
	 <avN8WISVUF7u4bXl@e129823.arm.com>
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

On Tue, 2026-11-10 at 20:19 +0000, Yeoreum Yun wrote:
> On Tue, Nov 10, 2026 at 02:21:18PM -0500, Rik van Riel wrote:
> > On Tue, 2026-11-10 at 14:04 +0100, David Hildenbrand (Arm) wrote:
> > >=20
> > > So it's all about "number of pages that don't need unsharing".
> > >=20
> > gup_no_unshare_len() ?
> >=20
> > a little awkward sounding, but it describes
> > what it's doing?
>=20
> Hmm, Wouldn't this name be semantically much the same as keeping
> the existing gup_unshared_page(), since both essentially convey that
> no unsharing is required from GUP's perspective?

The function measures how many pages in
this current interval do not need to be
unshared.

I'm happy with any name, though.

I would really like to just see this
code go in, so I can post my two
GUP series on top, first the batching
for the GUP-slow path, and then the
series that allows access_remote_vm()
and friends to work under the per-VMA
lock.

--=20
All Rights Reversed.

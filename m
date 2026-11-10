Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338493;
	b=t3Ps9kUBxAS5LRw5M0pbx7cUMkFRshT9Y9rwR9JdDL/oUIp4EELD/RPYy/xWariwGBG4
	 7MQdYeOEs5bjnQCuu2iaoJatc6B7XlnA4OS8iEznzLQRKCRKGnYhIS/eDRQGbGuD+GQYk
	 YbFrftNTl5IA30urwlIzFb2b76yM032hQU3MAdb5euFnGfi0OGqCzve6Y+zAIaqYlaADM
	 +k8AhfPjV+s3whgM3APgcRX8OE5vVRlfENYPY/5la71u/uP54IbpK4G9sv1GN4jdAcSnR
	 uauS5UpMc253DofstOcmSCbMmQbZLjZzBQe+pb1Upj0zXEA+7uoIi8Cld8Fd2/C34/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338493;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=1t73b5ZSa12OsN3iPrfbLNmR1n1bS9CZocRd+GhLFbo=;
	b=Uiky9+J57+s9JOBoCFv4nwNa4ur3kW73Nlbttv8rwMFm/QghyHuuNgjxgSe0+Jyb+tGd
	 9YlMXtJaZtI6eWihFhe3tRADyaKF7N1Y0cxRjeFSNni3mVkQheuvilAASI+ethQuljD22
	 AiO3SzuhTiQ2o35KTLy9gCbOlOjpq8/RjR7mkZqdIrg8XAJbU8ukKMtbtCj5btFP8ngOF
	 6bmJKwj/JrAbQopfVoCvbOPi3Q/SO4wF4L3UB0OHsTc1uw7zNExVZvR/rT6/1S91B0MKo
	 RbqdDeHzXlf7rB8i6wy+PAGrttSGc5x8eWdHGggYYXWeoDmjpoH+TgYNxT0bJtNrDgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=La82y597;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E28C606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E28C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=La82y597
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=1t73b5ZSa12OsN3iPrfbLNmR1n1bS9CZocRd+GhLFbo=; b=La82y5
	97ml0CQGynNL0ie1/M+r2AMEH6r0CUjXrEOt8hBih5Yayt9jYw5yR2vnqfofWCOo23FjTfexiCHqH
	Aoct88cTpSYIbbhnnU3p97+EeDxJDGsdZv4cegHk2SXkSlecCxPlX4JQi13Fb+p1sQIYly/M5CY1A
	PyPXgHDfUPBaUOgKH6Y3spdl/56HRudd37a/zhjET2rumoAxrCFyhaujJgQkvLIkmTjUGvqiy+BYk
	2UK1jpdqYo95Daomv5UtIuJrnNYP75/8+gH3Ng4k/ufLRE6O/RTXGqVV+2GZZwEZfnehLqgi0BCyD
	CLiddLOdwCa4KrJN13Zk/KWbC4oQ==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xQrPC-00000003grc-2AWO;
	Tue, 10 Nov 2026 19:21:18 +0000
Message-ID: <699499e46ace0875fd0f32052399e665c8209ea9.camel@surriel.com>
Subject: Re: [PATCH v3 5/6] mm: gup: introduce gup_unshared_pages()
From: Rik van Riel <riel@surriel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, Yeoreum Yun
	 <yeoreum.yun@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Jason Gunthorpe	
 <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu
 <peterx@redhat.com>,  Lorenzo Stoakes	 <ljs@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka	 <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan	 <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Andrew Morton	 <akpm@linux-foundation.org>, Yuan-Hao Hsu
 <aa9736195201@gmail.com>
Date: Tue, 10 Nov 2026 14:21:18 -0500
In-Reply-To: <aa227fea-d22b-4c0f-bd11-bf9ec36b0767@kernel.org>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
	 <20261109-refactor_gup_fast-v3-5-2aaef02df0e1@arm.com>
	 <7627c0d90188b581e7740bf8d17c8dd07b460f89.camel@surriel.com>
	 <avLqwIWHa5CAbHO2@e129823.arm.com>
	 <aa227fea-d22b-4c0f-bd11-bf9ec36b0767@kernel.org>
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

On Tue, 2026-11-10 at 14:04 +0100, David Hildenbrand (Arm) wrote:
> On 11/10/26 10:58, Yeoreum Yun wrote:
> > Hi Rik,
> >=20
> > > On Mon, 2026-11-09 at 12:32 +0000, Yeoreum Yun wrote:
> > > > This is preparatory patch to make gup_fast_pte_range()
> > > > batchable.
> > > >=20
> > > > Introduce gup_unshared_pages() to count consecutive pages
> > > > within a
> > > > folio
> > > > that do not require unsharing, and use it to implement
> > > > gup_must_unshare().
> > > >=20
> > > Could gup_exclusive_pages() be a better name?
> >=20
> > Yes. This seems much better for me. I'll change it in next-spin.
>=20
> Not quite the right semantics. For pagecache folios we simply don't
> need
> unsharing in MAP_SHARED VMAs. That does not imply that these are
> exclusive.
>=20
> So it's all about "number of pages that don't need unsharing".
>=20
gup_no_unshare_len() ?

a little awkward sounding, but it describes
what it's doing?


--=20
All Rights Reversed.

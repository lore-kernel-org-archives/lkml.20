Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A9031ED7C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791755092; cv=none; b=KP+M84vnVAX/k7MsJ5cXSFreBiiEpNidLK6Ug4o2KLMfmERfWGwa55RPNEqenZftDcWYnVhD2SXKWotvcO4jW9NjUjKKZ3DAx373ZgS8tav/4fOWt6bPXO11njUurKUKI0T2UzJzuJ2FDFhQt0tziUkUg77kefEicZlMbCZPMn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791755092; c=relaxed/simple;
	bh=dbf7Z2VFPiTT53lRwlSp/xE5y81p6hF8UBpX7LIzQ/c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oS+7AAI3TjOSdVSF6svLOY0/YAox+FK3hH3J9GZQLM3XKZqhlUI+1Lr6oa3gAz7cxB5Gvpd9CaSaOj7qwRB+e7Sf/nPhISFKYv4JzOcDq+by+7+RLcDaeIZu8NaLBydbqUUfHfxgPbEzJ21OMMxQlBpLZQyIoA2znYW+yZA0FJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=EV4Zdlw4; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="EV4Zdlw4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=dbf7Z2VFPiTT53lRwlSp/xE5y81p6hF8UBpX7LIzQ/c=; b=EV4Zdl
	w435M3Kk1dbk8mAM9muIWjItRwj+bSQYYoxZms2gdJuyJw/R6DXrBAxpCIoncZ6sBfcWhiN597FoW
	aR+/EHtKRBt/n92s48UuYEbmV9wi+nxZNTDi0UOpQnt0P0kBuiBgE+WXsPPt5vLgs8E2i4HOxfUiQ
	Be+zWT+oErTFHbxhp6y1Pg3RYkEb3g/yKFMOksl+0VykZpBBF/R8EITDAL1Gjx2ABRHxDSLs5IcWg
	QAJbEWTk73YfB2pGDp8lwkkrUa0wNGcgCNKUdvok3v/b4P+tzmt3wfvmf7zDB5p1gHKn0zeEFn6WD
	oI3fHOZWKk98t6AEa7T+1pRfneEQ==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xG1L3-00000003Bmh-3JvA;
	Sun, 11 Oct 2026 21:44:13 +0000
Message-ID: <003fdeb213ca0460c8681d4ae7baa562b337ed1a.camel@surriel.com>
Subject: Re: [RFC PROTOTYPE] mm: reliable 1GB page allocation
From: Rik van Riel <riel@surriel.com>
To: Dev Jain <dev.jain@arm.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>,  Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,  Michal
 Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>, Qi Zheng
 <qi.zheng@linux.dev>, Shakeel Butt	 <shakeel.butt@linux.dev>, Johannes
 Weiner <hannes@cmpxchg.org>, Brendan Jackman	 <brendan.jackman@linux.dev>,
 Zi Yan <ziy@nvidia.com>
Date: Sun, 11 Oct 2026 17:44:11 -0400
In-Reply-To: <55adcc67-e545-4bf5-93ba-7e4180f1b523@arm.com>
References: <20261004013657.03a63c4c@fangorn>
	 <55adcc67-e545-4bf5-93ba-7e4180f1b523@arm.com>
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

On Sun, 2026-10-11 at 22:58 +0530, Dev Jain wrote:
>=20
>=20
> On 04/10/26 11:06 am, Rik van Riel wrote:
> >=20
> > When the kernel free lists run low, the slow path moves pages and
> > page
> > blocks from inside mixed gigablocks onto the kernel free lists.
>=20
> Did you consider a design to introduce MIGRATE_POLLUTED: simply
> have another migratetype which stores polluted pageblocks.
> This idea can work in general, not sure how relevant it is
> for gigablock concept.
>=20
Don't the first half a dozen or so changes from this
prototype do that already?

What differences do you have in mind?


--=20
All Rights Reversed.

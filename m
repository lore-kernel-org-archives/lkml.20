Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286181;
	b=1nLjtWnpBvhKHRV/hNNqEbpGjSwXa0hF9g3LvwPVuMWlAqQLNuS89qvLBsJMXyyOIVM6
	 T5tRe4AHOtedJgb1rxEHidvvwYC9+VMOQ6QxVGmg/09IFZH2QG5YP6z98x45HUPsu8K2G
	 p37O/fwQfqTWgRg8jrGNZTNctHvvFCEAQ5FiG+aNLnkKUT2lUsZeUDjvU/N5YTvY55jPa
	 sc0iNCU80DEh2We6u8X7oSkniedtz+gKsjNqLpL0tle8wFS2l0vDIL9IMR6AsQipD/Xgw
	 nTfvorixxJCYSRxb6gyCPA3v0kr+hbs+O2mUGX8feSyobyjLRML3T35L/DMg5NHBzdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286181;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=zESBlF9yMWYDqGeYj3vcFt5dsseLPnqBkvoSTsbw2vg=;
	b=ajcC8YK8wRhN6sSYzl+hdCkvQkzG3id/PvSFLGs0X20mYtAp8FyCdUYGPlKBxFKcFENi
	 XeLyLS9DMGJnTzPLrL8yZjxQE+CmZrPUuqolPY/B7Jh+8OQ8kGMbtssuJhecRY7NMjKNV
	 qXVub5F2P+zCuGELVKBioEKMaUjmsbNm4reekThmED7AXuYDe5d4CPIY38HNtqbktDa+i
	 xFL1B+XC4UCAuWXjkpQJV1/Fdh0LB9R9nsU1OhmWjQ8HJ95DgAfAvYSoPfV5Khr0kb9WB
	 HtZl4MwpW7B7pD210TpPdQj61Js4GYrY9i8o5yPJergWupVV++zlxLTegZkW80c1E0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=BQc2216W;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFACF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFACF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=BQc2216W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=zESBlF9yMWYDqGeYj3vcFt5dsseLPnqBkvoSTsbw2vg=; b=BQc221
	6WwZ7i769dfufowPW3gY8yxmHx3SDNl8ja/1tsSP8rRziuB5x8UoI4tOQE/8XxrcX7h2MOyilYq6b
	n0nY2mJt7w0xMjzArPm6kVVB2qaJQx8UxvO4/QmqNespCqYHeiAImeJG9PB4cW0VqD2ksQUhRFoFJ
	q7EpSh0j67D4tdjtXo4//Q/Qk9VIZ6PokaMv1ugPAlOfzALj6I5Vnfpf1U6eNlUpxWPDgSyeM+DpI
	qdQEPygFFKdq7GB+jP+w2dDn67yJBwQWNcZ3q6LMpe0Kv1276kIl9THr7b47R0volSr9wLGViJKWz
	CQMimulXpzXGeqviYyFkQycjeIIQ==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xQdnX-00000003WVz-2kI3;
	Tue, 10 Nov 2026 04:49:31 +0000
Message-ID: <401ec8b3e4da18381af8f3157d680045829f5ed8.camel@surriel.com>
Subject: Re: [PATCH v3 3/6] mm: gup: move gup_must_unshare() and
 INTERNAL_GUP_FLAGS to gup.c
From: Rik van Riel <riel@surriel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>,  Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,  Michal
 Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand	 <david@kernel.org>, Yuan-Hao Hsu <aa9736195201@gmail.com>
Date: Mon, 09 Nov 2026 23:49:31 -0500
In-Reply-To: <20261109-refactor_gup_fast-v3-3-2aaef02df0e1@arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
	 <20261109-refactor_gup_fast-v3-3-2aaef02df0e1@arm.com>
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
> gup_must_unshare() and INTERNAL_GUP_FLAGS are used in gup.c only.
> Move gup_must_unshare() and INTERNAL_GUP_FLAGS from internal.h to
> gup.c
>=20
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Rik van Riel <riel@surriel.com>

--=20
All Rights Reversed.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288379;
	b=UwbFaE+5zmgAAzXNtvNW82/INyx6p8pPNjC0UCzs47HX1MOisNJDXVP5tUXHf0EnUP3j
	 xS9De+iZJ5XOUscc88l+VSJtiVVHX46XaxEN3Dvtc+WP71DKEEFK7kYs/V8QxI6elyAdT
	 PqRZt1QUSVDChvtv04TQOc97jPBLvgWzm/NUXOWenp6C/U4R4IPZ7VA8uN0soE9K48rJ1
	 gLlNhHjaGUTm+MJBcjkejU05FTnUBSw3dScmZRWQeQK/ESbV2e+khzABCX7a0rR8C2ioZ
	 flLl670CY7paSnWUrzcBSiLQ9evFcHeWlcM3QagtWorZk+Q6AyTk3XkZ1vIvqLHbtCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288379;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=Jn/JURTzNSN702gufOjyuihJkt0/ufyCIq9CJgAj7Ss=;
	b=KE6pTgI3FGn88Dy70Ensh4vLNdmiIxWff+hejJFx8IB2j00f+Hy/nsSYNfAqbbRFBhWk
	 chYiAjzxuIsvTObIJvHtcdITkcDDAxDLTcdzEx4JISxfJylV/7KZxOL/v+V67RSgUvRB7
	 nrGQgs9qrUxbJpmYQRTZxHmhC6lo0Wm+GVDgQnUWSP7rFrZmg9bmnOsK6GIdj9spoIpxB
	 Qkd7PzfYabbR4CM8Ihn5mPCxZ4Fr7qKD6Yr8BpzIu/x0NFwV3v7RUczel7a/twgt7ZvFl
	 AkcquwiGGk8Po3LR5DUXxmLBkMFL7uQqgIT6HDddRaJBKhzv5juJjSlM82LjhNHZJOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=l2AqlyJL;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A5A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3A5A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=l2AqlyJL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=Jn/JURTzNSN702gufOjyuihJkt0/ufyCIq9CJgAj7Ss=; b=l2Aqly
	JLF/ZWWhtNYgzeru75YDr+PlygIIgxmigulBaWiPo62y8dOR3x6vaJEpnBGUAWYDv8KcIsvOXv+S2
	WuPz8ck72BKhBDQVq7O20goXlRT4fz+lCRXIN3qVGWnMr80nFvs6NFboaaLC60IATEnGYyopDyhqh
	xdUfMvPaPPbFpA0glNLu+Sj4nHsr0R3BvNhblcmjv33h6HRlqudUaGAtPvKGAVMFepSPcLzp1Jid0
	jQWD8eyHI/cXTWxEPnayLl4+KxPXcGmEHs1XhaIMWRqea/hAaAbcLEpxp+bjSH/8oS+V1FBLkUGlI
	RFWDSe3x97aoO3AKeHM+D332ZWiA==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xQeMz-00000003Wu8-0jjJ;
	Tue, 10 Nov 2026 05:26:09 +0000
Message-ID: <7627c0d90188b581e7740bf8d17c8dd07b460f89.camel@surriel.com>
Subject: Re: [PATCH v3 5/6] mm: gup: introduce gup_unshared_pages()
From: Rik van Riel <riel@surriel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>,  Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,  Michal
 Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand	 <david@kernel.org>, Yuan-Hao Hsu <aa9736195201@gmail.com>
Date: Tue, 10 Nov 2026 00:26:08 -0500
In-Reply-To: <20261109-refactor_gup_fast-v3-5-2aaef02df0e1@arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
	 <20261109-refactor_gup_fast-v3-5-2aaef02df0e1@arm.com>
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
> This is preparatory patch to make gup_fast_pte_range() batchable.
>=20
> Introduce gup_unshared_pages() to count consecutive pages within a
> folio
> that do not require unsharing, and use it to implement
> gup_must_unshare().
>=20
Could gup_exclusive_pages() be a better name?

The code all looks good, though.

> Also add a folio argument to gup_must_unshare() so callers can reuse
> an
> existing folio and avoid the compound_head() call implicit in
> PageAnon().

Does that count as a functional change? ;)

>=20
> There is no functional change.
>=20
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Rik van Riel <riel@surriel.com>

--=20
All Rights Reversed.

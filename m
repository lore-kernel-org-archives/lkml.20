Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409425;
	b=utTIPLehDh5Iy/oTeVIP/sxILjpUL3OQMalBvqol7185llylGtmlPa15Mm3/wkLXw26A
	 JON9nkEvENOZcnDSYo0LpfXRcuf4d8R3zpHKRUKhUtrs3z0JJh9dFTK17uC/3K31v9HN6
	 ovA9JKoCTvwpnqcnAnY81uM0CgJJrxQT1xE/r6gLCVlLk1Oy8qD/aIw6UhkW9x5qWpJlT
	 l2E8aDO5AnStEbLYvjkje58ZhpPce+IioalaIfjV6YS89AO03TxtKzTnGSe2CoTRqyhC9
	 Isj9seRb8F2eUu5NhY8g3O2t010IgshV5lQD62vLrYqQRaRVJhpXkESBYB4ZBwy4yDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409425;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=jQnYAB/C+eI6pAG5l/jjeI/RO+deMqGieJdX8Y7TK6A=;
	b=R44mtN2BLDnfdVDvJllD67mfrNMI0yLAKQThah0zj722JXw6PQEX0u9X8bQOzsHdlYGu
	 geiaCM1nI5QCm5zua0GeyvjOjZBZIxvH0xtxDBXf/Rz6DJ4UcV8mjWcyEbnjgH6nb2PcV
	 TRbbz+bYxBgEt3PXmxSbizmdUlm0fxdE6ZnHuUYSXsaDaAMLq9DQcueEvboCfIUQZ5Y7a
	 Qad6XDNHOg9QgC8JjZhIm2Hc3BFjHHAIqo/HxiTh6AlJhFQgzmziYO/JgLBrVTbFwcsHh
	 /J9mhpBZe2jz39MBxn6xusCx9dncjZTX5b2/kvrBfu1Uleq88YRQjNGlCS8oPz6KxZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=HgFHX5p1;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C83606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33C83606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=HgFHX5p1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=jQnYAB/C+eI6pAG5l/jjeI/RO+deMqGieJdX8Y7TK6A=; b=HgFHX5
	p1xD+9V4hYBFwoBJgAOChZw+EZPBAOyznwTsK/glQXufjeIEIGrJxCOwxlfv5dD1o0S8DY0q81upd
	Q/7sXAKQNY/jL8Amq6tpsw2lCIISxj1908XlikRepR2CBw7dpbinbb2qLvc/E7Q1ZC5fLQzeY89Ys
	IusdWe8CyD5h0X+V3Z+Pkh5aJ4XhA1BhsxSJATTTQEa9PofXayAB17swIQnTns+YQFatGBJwAD2Td
	EUdUY0JwQ9/KapZy1611x5prmDlIcQrj3hCiZHjVQLrokKZQbebJY0E5yZOkeg4f1D9aHLCv+aeFy
	J3u4VccK6HPK98V0RD1xhfO9aMJQ==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xR9rI-00000003uO1-0I6q;
	Wed, 11 Nov 2026 15:03:32 +0000
Message-ID: <9e91f87f0ede919746557da8de0de19a27b410ff.camel@surriel.com>
Subject: Re: [PATCH v3 5/6] mm: gup: introduce gup_unshared_pages()
From: Rik van Riel <riel@surriel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, Yeoreum Yun
	 <yeoreum.yun@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>,  Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,  Michal
 Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Yuan-Hao Hsu	 <aa9736195201@gmail.com>
Date: Wed, 11 Nov 2026 10:03:31 -0500
In-Reply-To: <e66b6c19-95d2-459a-926c-8429df693acb@kernel.org>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
	 <20261109-refactor_gup_fast-v3-5-2aaef02df0e1@arm.com>
	 <e66b6c19-95d2-459a-926c-8429df693acb@kernel.org>
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

On Tue, 2026-11-10 at 14:06 +0100, David Hildenbrand (Arm) wrote:
> On 11/9/26 13:32, Yeoreum Yun wrote:
> >=20
> > -static inline bool gup_must_unshare(struct vm_area_struct *vma,
> > -				=C2=A0=C2=A0=C2=A0 unsigned int flags, struct
> > page *page)
> > +static unsigned long gup_unshared_pages(struct vm_area_struct
> > *vma,
>=20
> Besides the function name, LGTM.
>=20
> gup_pages_requiring_unsharing() ? Don't quite like it, but something
> along those
> lines.

FWIW, I'd ack the gup_skip_unshare_pages you proposed
last night ;)

--=20
All Rights Reversed.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724130;
	b=n3X25B9Ppv94UPQi3bmuZowMdAWT+faz8ue1Ppfy8BtEAr+6P4VY3gqq+69o1DMt+MF6
	 jmfPhjzBDxCaUErQGE6mDPaiVxVpf4yYoWmDWyv8UHrZseSCKlD0FN4A2k1WCCmpz+OYn
	 FbZ941NZVKHFEi/v5Beyo5rnwRjIP7n+25btvoyz2wZNLQH7cYmtLexD41q/kSU/P4O4k
	 yAhzwn5AO11ubm/hPNbeqLAuiaheRt6qUBD7qzTNcBwRZmKpTorbaZtBYqgMMNQwZJW8x
	 9G1Zwq9l2oYhucVLNxi8u0NK/WWby2NbJ06Mn7ITVZyRmevlXBwTZLxS+HjYFLm1gRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724130;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=+KBTYiCTGi2sfHFb+ylNKvCOHc/5SD8paEIRVfvfyPA=;
	b=mqdMD6za8LaqUpV1b09MWuLtp6HiIh9sEs8o90m9FDJ10XKXM4CrNcIL+UQntzMgEmyJ
	 HjOK26IgK3AtFQ+HsE7qWsbNij8PMmQcARfa8jG9YIwSBGM1OFVQo3Pgnk2WofLpDztZa
	 Lws7Cq+lR9LzVAurc0p+PXfklY85LXpZ6auAyKIx7/hGh4fqhIFTf898iVKfGOcpSjllm
	 OF1rDX57bVZ52JynAC3FqH36uVCdRRBoKtqyDeNAcBKWUYL5R5hERkqRKr5YUFq97jvVs
	 v6hSd2bkcSGnVgJL0kjtianz8pAk5vqaJBilBXs4aH8tGbTt3UdPP3bX3ce+sjnEiDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=cITr+3C2;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF7C60A3821
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DF7C60A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=cITr+3C2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=+KBTYiCTGi2sfHFb+ylNKvCOHc/5SD8paEIRVfvfyPA=; b=cITr+3
	C2MeIecJ/GpGBDjLBPpEl0hTxQgHVowYX59sIFLnQC0arsUPQt3PkxoUtuGut+r1X9e0JaBJ1zyJF
	Kkf/BTm/rUNl5y/wgy85Fb0mHm+PG4Sj25eTy3xbXfnjE3T4T1MDMP2+uJdpnkGKklkiC9JJ7xMEz
	xPaCrvem51fKdX2lxrgwxf49ZzU7zq1CZE7+t8mqOt2IWoluWYyUjU4bonTY+zUEc7q/3lUYyuudP
	27kyxe4SPuD0p06Tzdc2GiWTcHIad3xEV7iW97pBWjHqKhk1lKIvLCFawqvc0c5A04OEyPPQGzZAH
	X1U5Ru73/2ytyNnRLGMmoQoFfnyA==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xOHaF-00000001jlZ-1oMy;
	Tue, 03 Nov 2026 16:42:03 +0000
Message-ID: <9d1572bd5e868d3c9d953aa5fae81967cc81ba55.camel@surriel.com>
Subject: Re: [PATCH 8/8] mm/gup: batch contiguous same-folio PTEs into one
 refcount grab
From: Rik van Riel <riel@surriel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	linux-kernel@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe
 <jgg@ziepe.ca>,  John Hubbard <jhubbard@nvidia.com>, Peter Xu
 <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>,  Yuan-Hao Hsu
 <aa9736195201@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org
Date: Tue, 03 Nov 2026 11:42:03 -0500
In-Reply-To: <fa017227-448b-468f-9797-33c02854f018@kernel.org>
References: <20261102193026.3860700-1-riel@surriel.com>
	 <20261102193026.3860700-9-riel@surriel.com>
	 <fa017227-448b-468f-9797-33c02854f018@kernel.org>
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
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-03 at 09:35 +0100, David Hildenbrand (Arm) wrote:
> On 11/2/26 20:30, Rik van Riel wrote:
> >=20
> > +/*
> > + * Return how many PTEs map consecutive pages of the same folio
> > and can be
> > + * committed as one run. Always at least 1.
> > + *
> > + * The write-fault and unshare checks in gup_lookup_pte() are per
> > PTE, but a
> > + * writable run needs no repeat: a writable anon page is
> > exclusive. A read-only
> > + * run under FOLL_WRITE or FOLL_PIN does need the per-page check,
> > so it stays
> > + * one page at a time.
>=20
> That's a clear indication that this needs more work.
>=20
> I'll try to get to it soon and see how it could be done in a cleaner
> way, likely
> it should be based on top of the gup-fast series where we will have
> helpers to
> check for required unsharing of multiple PTEs.

I'm all for sharing the same helpers.

How would you like to sequence things?

Do you prefer to merge both series separately,
and then get a follow-up series that merges
the helper functions?

Would you like Yeoreum Yun and me to combine
the series, merge the helper functions beforehand,
and then send you one larger, combined series?

I have spent enough time in gup.c that I would
be happy to get rid of some more of that code.

--=20
All Rights Reversed.

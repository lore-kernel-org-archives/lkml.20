Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923CB3D891D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751429; cv=none; b=Bj/X96CQdHR0FuU/KeR3qqKKgnTP1575gpUfLewLL28lqQdd2WOaaKAjgQtAEv+rAJJVVGfjXAnjNtLKK6HgpKomSa53gT8hQEonNVa+KZQv6CnRX5mHa+DIct8zX7SYSl91yMiyw99jPg/Z64m1JMbp8dL1d+S3Xct01FrZudY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751429; c=relaxed/simple;
	bh=i3ANaNg2oL63LSUznheA13Z4ntLs2tbjJ1OmjixfiOw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j2IV0wjr2JFeWKp7XC2fUIMQFl0rdOoHE6K8qsc9h+qZUkvKtRgTxuSds9SB87N2Coy/a4t9gc39cOMN8VqkYEPkxg8kdrKsrHx4dZqiEoQRd17ksOxog7FE5cbr9RZ7KucZubH4voTS9pc1npI7MGL4uB7mix4DC2N2ZUR+HZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=JTiB8SKK; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="JTiB8SKK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=i3ANaNg2oL63LSUznheA13Z4ntLs2tbjJ1OmjixfiOw=; b=JTiB8S
	KKuvAZUMv/NpTG1/D3G84YSevncWjHJnEbkYiyQF8+tHdUfmjynQtP29cHhakDHAmXwoGphuSRMSm
	01hB+watI6hliEGW4NH07c7PdLWPdii0AxcVfSP1677D5D2x9Q0UwIDgwKz1pLfj5ldwgUKY8TyUm
	xwgqOSr01Peji3DyI7x6C5ReM9XBnXwOQPsNwrpnWDzpgDQo77uKKEnGeLAEviy29iuMjGS+4Mnl1
	5q5nsEPSz14MnJMGKde5xDUjUMINKj6Q3ZAi256WL5SRy/y1lDAFyzwwaz8XvAYIQ3hvsOpZ3jEnO
	ImJWhgwQHZmLfnm3tfx8BIEKkVoA==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1wzDoB-000000084lK-0kMl;
	Wed, 26 Aug 2026 13:36:51 +0000
Message-ID: <282ef22ff621eb5d1f079b89d067dde29686e08b.camel@surriel.com>
Subject: Re: [RFC PATCH v3 0/8] batch lookups in follow_page_mask()
From: Rik van Riel <riel@surriel.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, Andrew Morton	
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Jason
 Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu
 <peterx@redhat.com>, 	linux-mm@kvack.org
Date: Wed, 26 Aug 2026 09:36:51 -0400
In-Reply-To: <ao5t8lxaCWQvph-l@infradead.org>
References: <20260811025157.1632867-1-riel@surriel.com>
	 <ao1JwEAeNcP9OyKR@infradead.org>
	 <a10c74df79e1db6a9a2448220fe4c4fd6a0e5bdb.camel@surriel.com>
	 <ao5t8lxaCWQvph-l@infradead.org>
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

On Tue, 2026-08-25 at 21:39 -0700, Christoph Hellwig wrote:
> On Tue, Aug 25, 2026 at 09:37:09AM -0400, Rik van Riel wrote:
> > > And what many including the most performance critical callers
> > > want
> > > instead is really a single bio_vec.=C2=A0 Maybe we can go the extra
> > > step
> > > for
> > > that, as it would reduce the number of calls into gup
> > > significantly.
> > >=20
> > Which code are you referring to here?
> >=20
> > blk_rq_map_user() seems to end up calling pin_user_pages_fast(),
> > via iov_iter_extract_user_pages, and it directly fills in the
> > bio_vec's pages array.
> >=20
> > Is there another performance critical path that goes
> > through the slower get_user_pages() path?
>=20
> The other callers of iov_iter_extract_bvecs matter more, but this is
> the main user.
>=20
> And iov_iter_extract_bvecs right now is very inefficient when used
> on larger folios,

I think it would be possible to create a path
into follow_page_mask() that passes a bio_vec,
and where we fill in the bio_vec fields the
same way bvec_set_page() does.

Then iov_iter_extract_bvecs would no longer
need to iterate over the pages returned by
get_user_pages_fast.

That seems like a follow-up series though,
and we need to think carefully about whether
we would also want to unify part of the=C2=A0
gup_fast and gup code.

Currently the gup code depends on locking
to keep page tables from going away, while
the gup_fast code depends on disabling irqs.

--=20
All Rights Reversed.

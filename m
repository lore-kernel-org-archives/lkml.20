Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725235;
	b=Od8+axhgshMssN3b02Q6GzYuCSkVyQ551fKgmp+FwSE6fzMYsH74luIGcUufx3KUnvWt
	 xebEziZg2JIavxlohQSLQXxnhdSpgei2QSF7dc5QrcGbmKmtLRAGHBiWKIK46h9pWhtXw
	 RuqAfB1yJDQUW4YRtagfGV9wL0tVgnsanirhs2zcUyIQ74qRmCEvvHVOACMfOVhPpKNo1
	 HF6qWo6Sev73ajg8KT5nmlfgcs7KdbKtjQWESQbl9s2lgZkd0Ci3AniWb09u8+BnBBCpt
	 Xik5mK5n2spRfFQkUOrt3/QuaiK0Yax4Vwz5pWx4edGf2hhafU6lxly1Q3WboYxI1Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725235;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=/6eTsVMU7wzPcLEhAlHwWLBgmE+T6X9oA4apa/G9TRs=;
	b=h6yzFF9ROYvR05VDFImrjxPUDZ7AeJspuGypEjmO6cx/r7kIHryqvj4A8OgvPU480NXH
	 nYhJdXE5haDSnHuDrQ3ZvjT3GRQh2khRBciYTg4sBe5DAA1ruTgegb1UYiz1GVG+ZZVtC
	 eBLoLSSieKSzxrO2yWzctpzThsxWoX8kOnk3duxFu8qBHFdVgzb7SjNfGSVxSShi+z5ZG
	 wE0ioDgTKhDv/jrYc1Lf/1ChOPznH3a8Uk9ADRjwVQ1XPcQoG/2AcP/2jI6MqNVeieKD9
	 ClgsJX2HBD4rFFf2VBLODvEkgmbr6UAHPw5a/2DXoNaIpAAaAesV3tiDfL4U3X6HLBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=boTeur3Q;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63840606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63840606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=boTeur3Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=/6eTsVMU7wzPcLEhAlHwWLBgmE+T6X9oA4apa/G9TRs=; b=boTeur
	3Q5iqDTLChekyiT7BT0agHBZDq0QpOtGxIipLkmPU4mrZz6dUuqDjkzuIrNS+t9dlHJhGzvrUmfLi
	/OejK1cN4KfI2EJtmJvuGxSHADPjM6xJSfWytwIeAbU4SSlG7xwQJp5SI1roeA2BM5DdJVVeoDI0V
	Lw5I+tA7KUs0ZQZI2V8bS8x6Ci912oyLCsgM0CMOzRYGFLVoxPxDx/0ML/0Kt+DtS/crhJoCLYFrW
	//jREr9hFdCdG+cns88ue9b4XAYtHQsIo9mJUyPKnVvb/TmvDeBDDswGQ2q1FgLiUFlAkNior4+If
	I/FKopVVks2hROMM+jQwZGSMqs8w==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xOHs6-00000001jyB-362o;
	Tue, 03 Nov 2026 17:00:30 +0000
Message-ID: <4ffa2c82c538c12447d48fee2532f67c35f7eab7.camel@surriel.com>
Subject: Re: [PATCH 1/8] mm/gup: break out gup_fill_pages() helper
From: Rik van Riel <riel@surriel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe
 <jgg@ziepe.ca>,  John Hubbard <jhubbard@nvidia.com>, Peter Xu
 <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>,  Yuan-Hao Hsu
 <aa9736195201@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org
Date: Tue, 03 Nov 2026 12:00:30 -0500
In-Reply-To: <856ed0da-d806-4f2e-95e7-f276f2408e8d@kernel.org>
References: <20261102193026.3860700-1-riel@surriel.com>
	 <20261102193026.3860700-2-riel@surriel.com>
	 <df9c504e-e62a-40c0-a513-e8b8c758dd57@kernel.org>
	 <3a7d12b52a5de61277842f2cca0dd90d42728135.camel@surriel.com>
	 <856ed0da-d806-4f2e-95e7-f276f2408e8d@kernel.org>
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

On Tue, 2026-11-03 at 17:39 +0100, David Hildenbrand (Arm) wrote:
> On 11/3/26 17:29, Rik van Riel wrote:
> > On Tue, 2026-11-03 at 09:43 +0100, David Hildenbrand (Arm) wrote:
> > > On 11/2/26 20:30, Rik van Riel wrote:
> > >=20
> > >=20
> > >=20
> > > > +{
> > > > +	unsigned long i;
> > > > +
> > > > +	if (!pages)
> > > > +		return;
> > >=20
> > > Why is that check needed? Why should someone try filling
> > > something
> > > that doesn't
> > > exist?
> >=20
> > faultin_page_range() and populate_vma_page_range
> > both call the GUP code with a NULL pages pointer.
>=20
> That's not what I meant. I know that we have GUP users without
> pages array.
>=20
> In the code change you are performing the check is not required.
>=20
> That's why there wasn't one in the first place.

It looks like 2 of the 3 callers of gup_fill_pages()
check for pages existing. The other does not.

Should we just have the check in this one place, and
not depend on the caller?

>=20
>=20
> >=20
> > However, now we have a situation where:
> > 1) Only a few oddball callers of GUP need the dcache flush, and
> > 2) Those need to do their OWN flush after a write, and
> > 3) The dcache flush is not needed for most other GUP callers.
> >=20
> > We could do two different things here to solve the
> > asymmetry.
> >=20
> > Either we could add dcache flushing to=C2=A0
> > unpin_user_pages_dirty_lock(), and make sure all
> > the callers that need to call that function, or
> > we could move the cache flushing to the GUP callers.
> >=20
> > Then we have KSM, which uses GUP, and which would like
> > to see the latest page contents...
>=20
> It's all very inconsistent. And undocumented. And error prone.
>=20
> Could we have GUP-fast also flush the dcache for consistency or
> must that only be called with the PT lock held?

I think we could, but it does not look like any of
them need it.

Out of the 83 callers of gup_fast, many DMA into the
page, and the drivers do their own flushing. Also,
flushing before the DMA write doesn't help.

KVM, Infiniband, and others pin the pages, sometimes
for longer periods of time, and either flush around=C2=A0
their reads and writes, or run only on architectures
where we don't need to.

The others access the page through the user's own
virtual address, which again does not require a
dcache flush.

Only a small number of slow GUP callers need dcache
flushes.

It may make more sense to move the cache flushes
all the way out into __get_user_pages() and away
from the follow_page_mask() call chain, so we can
maybe merge more of the helper functions between
slow GUP and fast GUP.

> >=20
> > In Yeoreum Yun's series, the batch filling seems=C2=A0
> > to be done inline in gup_fast_pte_range(), and not
> > in a helper:
> >=20
> > https://lore.kernel.org/all/20261102-refactor_gup_fast-v2-4-bc1ac018c83=
4@arm.com/
> >=20
> > Should both paths be using the same gup_fill_pages()
> > helper?
>=20
> We also have gup_fast_pmd_leaf that fills an array. I think all of
> these should
> just use a helper (instead of manually looping).
>=20
> For now we can distinguish gup vs. gup-fast using the VMA argument.

I think all of those could use the same helper
function I am breaking out here, once the dcache
flushing moves to its own helper.

--=20
All Rights Reversed.

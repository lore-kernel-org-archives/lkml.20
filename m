Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734253;
	b=ligXVHm4q25VNNazg1Kxx0LAYQRX1qR3EFoxnWBgw1tSsSBuShN07T2pYtDW+1ntF/Mt
	 FiobIplZtkNifbXXUTS3zCDY2Hlw1SmkvGRHLZS7yO4OLF0Mp9mG1ri3VD5Vn650VpKmf
	 e5YcznStQdNREnDNOgq9Cxulns1mE8JOYB2530KJ22f7BHUDkgyPRn1A+B765kCekQZVm
	 3zWeEpeJveFWmdszAVyEANoJ7RhDYFukNjuH+IOJsGqyuYtdVTMDx5/gWbeFo+0gnOIgt
	 zW8lW1EKs6wh3N/RDDyntnHw1U65n775RpHq3pc3flqLZ7WohMt5mHaaRPpmBcOlhBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734253;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=wyXJ+ot3RgCPBYYcp9YXY0u+cEVsnjNhxkQirgiAFXM=;
	b=0g5GREoHAgCYwnB2qvzRC7SZ+dCI8j91smgIg/uGc99qswFSMvXWq/4QaJ9SjwXicoIR
	 4dClH4uCzdyMBpQ0bVKhnhqenTEFzSpolEJzVIUJ3AKJQHjNTid2fJ3L5owRlt/1PJ93V
	 /mIyo/T2at+4OPkN1YZwbhTcy9BY0xAbzCjzomHbGkYrEAiSAoi04LxH/G6n6dpoPWn4I
	 3Y3U5HlTmMEhu/6nA5bIUonpq9xtvlMobuQLzARGZC5D0KSY4eNSGiR4x4q4ILXf6B0bF
	 9uBUzcTMpJnXvXj5xrSw5jPPJeHjF9jZa+YEziTJCUJ7QQWh/xVywPKtYj83u8ri8lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=Iyp9rJQm;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7E2606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF7E2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=Iyp9rJQm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=wyXJ+ot3RgCPBYYcp9YXY0u+cEVsnjNhxkQirgiAFXM=; b=Iyp9rJ
	QmSmByoALJbTCWv/MiMkPADDCZxtPIIQOO3MM6uRUworniAKoFAEJWR1bOa+lHP06HK2uOydmb+26
	LozIM9rEB8nlDiqS8RfYcPfGE8jDqPTsyQDgza7QGl5rk1+iocQGLzu02dVR7Wxi9ZIO4cPVGmdiV
	QaZ5fOZe6oNeNqDfHul6BRnRnpg29Udunjyk1Ypfblf18r6skv0DVkqGTnB3uXAqAnMEcvFv6J98c
	HCrQBc603P06OQXEYJjNieeaspn6kdaBRqqgtYORo+GZZtEQpxsNC/gDKOFM+uk8MwvnJUTSqReGb
	5ihE+XZu5VE5OC8R9SZXwAw913pg==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xOKDM-00000001lbb-3hHZ;
	Tue, 03 Nov 2026 19:30:36 +0000
Message-ID: <f11575d4f0fa63fa1afc6ca6060440c9991bc112.camel@surriel.com>
Subject: Re: [PATCH 1/8] mm/gup: break out gup_fill_pages() helper
From: Rik van Riel <riel@surriel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe
 <jgg@ziepe.ca>,  John Hubbard <jhubbard@nvidia.com>, Peter Xu
 <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>,  Yuan-Hao Hsu
 <aa9736195201@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org
Date: Tue, 03 Nov 2026 14:30:35 -0500
In-Reply-To: <e610aa21-4d35-4d9d-8754-bbfdec57a9a5@kernel.org>
References: <20261102193026.3860700-1-riel@surriel.com>
	 <20261102193026.3860700-2-riel@surriel.com>
	 <df9c504e-e62a-40c0-a513-e8b8c758dd57@kernel.org>
	 <3a7d12b52a5de61277842f2cca0dd90d42728135.camel@surriel.com>
	 <856ed0da-d806-4f2e-95e7-f276f2408e8d@kernel.org>
	 <4ffa2c82c538c12447d48fee2532f67c35f7eab7.camel@surriel.com>
	 <e610aa21-4d35-4d9d-8754-bbfdec57a9a5@kernel.org>
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

On Tue, 2026-11-03 at 18:04 +0100, David Hildenbrand (Arm) wrote:
> On 11/3/26 18:00, Rik van Riel wrote:
> > On Tue, 2026-11-03 at 17:39 +0100, David Hildenbrand (Arm) wrote:
> > > On 11/3/26 17:29, Rik van Riel wrote:
> > > >=20
> > > > faultin_page_range() and populate_vma_page_range
> > > > both call the GUP code with a NULL pages pointer.
> > >=20
> > > That's not what I meant. I know that we have GUP users without
> > > pages array.
> > >=20
> > > In the code change you are performing the check is not required.
> > >=20
> > > That's why there wasn't one in the first place.
> >=20
> > It looks like 2 of the 3 callers of gup_fill_pages()
> > check for pages existing. The other does not.
> >=20
> > Should we just have the check in this one place, and
> > not depend on the caller?
> >=20
>=20
> That should be spelled out in the patch description.
>=20
> The change as it stands in this patch looks useless :)

> Although trying to fill something that doesn't exist is a bit weird.
>=20
> But if it makes the calling code nicer, sure.
>=20
I agree this patch by itself isn't super useful.

It's goal is to be able to have this code in one
spot, and not in multiple places in gup.c

I'll split out the array filling from the cache
flushing, so we can move the cache flushing out
from under the lock, and have GUP-fast and regular
GUP share the same helper.

> >=20
> >=20
> > Only a small number of slow GUP callers need dcache
> > flushes.
> >=20
> > It may make more sense to move the cache flushes
> > all the way out into __get_user_pages() and away
> > from the follow_page_mask() call chain, so we can
> > maybe merge more of the helper functions between
> > slow GUP and fast GUP.
>=20
> That's likely more work, can you look into that?
>=20
It really doesn't look too bad. Here are all
the GUP callers that need a cache flush:
- kernel/events/uprobes.c (through get_user_pages_remote)
- /proc/pid/cmdline (through access_remote_vm)
- fs/proc/base.c (through access_remote_vm)
- kernel/trace/trace_events_user.c (pin_user_pages_remote)
- arch/x86/kernel/cpu/sgx/ioctl.c (get_user_pages ... urgh)
- kernel/ptrace.c (access_remote_vm)
- mm/process_vm_access.c (pin_user_pages_remote)
- fs/exec.c (pin_user_pages_remote)
- virt/kvm/async_pf.c (get_user_pages_remote)

In other words, if we change the SGX code to just
call get_user_pages_remote(), and then move the
cache flushing to get_user_pages_remote() and
pin_user_pages_remote() we should be all set.

Want me to fold that into this series, or send
it in as a small, separate prequel series?

As a separate series it would:
1) split out the gup_fill_pages() and gup_flush_pages()
   helpers
2) convert the SGX code to use get_user_pages_remote()
3) move the flush call up the stack into pin_user_pages_remote()
   and get_user_pages_remote()

Just let me know if you prefer that separate, or
folded in.=20

--=20
All Rights Reversed.

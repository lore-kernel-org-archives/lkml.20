Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676249;
	b=2fnCTUzMkLOm18D6Ap2tSlZ+0CeHBAN97xlEUuwRUE+yh5qopGW5gU9dj+ZRW5XdqM4k
	 vvfa4/jM9WfmCbLVFTkVqK8irfKj03tseObnHi1pa4qBzzVO6k4a/eKhLUfUojETNMXCH
	 y6vLaqw+77KkaC8kY7qqJR/kgeQ7wlJ7nUJFS2GHvBWArf9dTjMXzLIwTe2ZfsLTfif0M
	 xQ22G8uAxdZtH1qSnUbZ63gQrSMHNA3aOUQhlX/tOl0IbFySqZnIDjh2TL3w3q+bKj8Mi
	 F9827sLFbIHTVtijRIw4FYtV1tSQL5wzZL3/fQetiAmU4jzQyN2WzvGZrKXO1CoyGzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676249;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type;
	bh=Tk4zyMEQWH6Q2aZ7pIorKlxfeX7K1kl3T6clieYYnG8=;
	b=w4tHKDWxkO8M+1EZqd0Mu8KTgZ9EcHRSn6sVisHX5Xd8sIYqHnzTb1IbmemCE31OmUvT
	 b+N5L9rZZl3ccS6bRDide3JqPHdnAPywAyCFUtneAriFeJ2hhWNjcUXUzCj09+r1yULCU
	 Hxqc1XejqkocUUu5ii5vXOPGExadxBlmF2dAs3OrWwBKd4kmSAIhv3x+doUPkKF71ytMg
	 fpA1ptJlBUOSXvp1IedtWkMT34eiEVIzCHTS4859dmHRgv7cnNyIgYP9hIzayfF7wgtiF
	 EqE8WtA5hTmOKR3uwi7Eod2ASV+RKybTD+H9XK0G0DgE5EBrUJAX0ZFQth3EmlYBksQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PlLgBA7l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PlLgBA7l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81AF1F000C1;
	Thu, 22 Oct 2026 13:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676248;
	bh=Tk4zyMEQWH6Q2aZ7pIorKlxfeX7K1kl3T6clieYYnG8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PlLgBA7lXB8mrN6XbOKjFpmdIH34GPuaWYUUGhZTDKmT/kt7Hvv6Usu4TU3zQZpYV
	 HvW2THzlErvyXbpeDqynWqhZmsCnQrnTkthKFKIscD2nbR2cb3EHtJxrQvsNmNF8BE
	 HwMllQIUPOiNENLS+wlsi9BKEc1y8QckPkxTQFL0/Z2HhlQv8t4+RqbAJ6rYvbHS2G
	 n9KoCGpsZUQkGLxF1yS9sMjy0rFpvR2sT0c/M8WtvifnfbxpNP385qKXeJsAxaufZr
	 AfHpskOEX+XrCkV6qtmh224lz3sc42yOuebtImdF9l7enJPtvh6BpY8qiCuglDGWHy
	 mAMtaSrFfABUQ==
Message-ID: <d5fe8a82-8195-4e18-94e8-2980e8c83674@kernel.org>
Date: Thu, 22 Oct 2026 15:37:19 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] slab updates for 7.4
Content-Language: en-US
To: Harry Yoo <harry@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
 LKML <linux-kernel@vger.kernel.org>, Imre Kaloz <kaloz@kernel.org>,
 Karl Mehltretter <kmehltretter@gmail.com>, Kees Cook <kees@kernel.org>,
 Longlong Xia <xialonglong@kylinos.cn>, Matthew Wilcox <willy@infradead.org>,
 Zi Yan <ziy@nvidia.com>
References: <atoJsKNb5KiE44jl@thinkstation>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <atoJsKNb5KiE44jl@thinkstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0YX70DoARKhiZ4Z2hKZFVJXw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0YX70DoARKhiZ4Z2hKZFVJXw
Content-Type: multipart/mixed; boundary="------------bJb65ceDpZ0FggE6pTGtP9S7";
 protected-headers="v1"; hp="clear"
Message-ID: <d5fe8a82-8195-4e18-94e8-2980e8c83674@kernel.org>
Date: Thu, 22 Oct 2026 15:37:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] slab updates for 7.4
Content-Language: en-US
To: Harry Yoo <harry@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
 LKML <linux-kernel@vger.kernel.org>, Imre Kaloz <kaloz@kernel.org>,
 Karl Mehltretter <kmehltretter@gmail.com>, Kees Cook <kees@kernel.org>,
 Longlong Xia <xialonglong@kylinos.cn>, Matthew Wilcox <willy@infradead.org>,
 Zi Yan <ziy@nvidia.com>
References: <atoJsKNb5KiE44jl@thinkstation>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <atoJsKNb5KiE44jl@thinkstation>

--------------bJb65ceDpZ0FggE6pTGtP9S7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/22/26 15:10, Harry Yoo wrote:
> Hi Linus,
>=20
> please pull the latest slab updates from:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git tags/slab-f=
or-7.4
>=20
> There are no known conflicts with other trees.

Thanks, Harry!

I felt I should endorse this as it's the first time Harry sends the PR as=

the co-maintainer and not myself.
I looked into cross-signing the tag but seems like git doesn't support th=
at.

Vlastimil

> Thanks,
> Harry
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> - Performance improvement of the sheaf prefill API, by allowing the
>   barn to hold a partial sheaf and refilling sheaves from the barn.
>   This improves will-it-scale mmap1 throughput by 24% on the
>   maple_node cache. (Hao Li)
>=20
> - Restore memcg accounting of ipc msg_msg allocations, lost with
>   e.g. CONFIG_SLAB_BUCKETS=3Dn where the allocations fall back to the
>   general kmalloc caches. (Kees Cook)
>=20
> - Fix an old race between kmem_cache_destroy() and slab_late_init(),
>   where a cache destroyed late in the boot process tries to release a
>   kobject that was never initialized. (Imre Kaloz)
>=20
> - Remove slab_folio(), the last use of struct folio in slab code.
>   (Matthew Wilcox)
>=20
> - Reject kmalloc() requests above KMALLOC_MAX_SIZE explicitly with a
>   warning and NULL return instead of relying on the page allocator's
>   order check. (Zi Yan)
>=20
> - Various minor fixes and cleanups. (Hao Li, Karl Mehltretter,
>   Kees Cook, Longlong Xia)
>=20
> ----------------------------------------------------------------
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2=
b935:
>=20
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git tags/slab-f=
or-7.4
>=20
> for you to fetch changes up to d15d7703166daf7bd62c844a3cb1b3a6279adb4c=
:
>=20
>   mm/slub: initialize the free pointer of the bootstrap kmem_cache_node=
 (2026-10-19 11:57:03 +0100)
>=20
> ----------------------------------------------------------------
> slab changes for 7.4
>=20
> ----------------------------------------------------------------
> Hao Li (3):
>       mm/slub: unify slub stat definitions to simplify metric additions=

>       mm/slub: make the case handling in __slab_free() easier to follow=

>       mm/slub: refill prefilled sheaves from the barn
>=20
> Imre Kaloz (1):
>       mm/slab: sample slab_state once in kmem_cache_destroy()
>=20
> Karl Mehltretter (1):
>       mm/slub: initialize the free pointer of the bootstrap kmem_cache_=
node
>=20
> Kees Cook (2):
>       mm/slab: Mark the kmem_buckets_create() context as a Context: sec=
tion
>       ipc, msg: Account msg_msg allocations with GFP_KERNEL_ACCOUNT aga=
in
>=20
> Longlong Xia (1):
>       mm/slab_common: reject zero object_size before calculate_alignmen=
t
>=20
> Matthew Wilcox (Oracle) (1):
>       slab: Remove slab_folio()
>=20
> Zi Yan (1):
>       mm/slab: reject unsupported kmalloc() sizes
>=20
>  ipc/msgutil.c    |   3 +-
>  mm/slab.h        |  28 ++---
>  mm/slab_common.c |  23 ++--
>  mm/slub.c        | 329 ++++++++++++++++++++++++++++++++++-------------=
--------
>  4 files changed, 228 insertions(+), 155 deletions(-)
>=20


--------------bJb65ceDpZ0FggE6pTGtP9S7--

--------------0YX70DoARKhiZ4Z2hKZFVJXw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFPBAEBCAA5FiEEe7vIQRWZI0iWSE3xu+CwddJFiJoFAmraEY8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJELvgsHXSRYiaDDsH/i6U1bY9jE9pHQjiN6dd
8fvSRXFAkDSP8hGJD/04Oyt0faYYACYh78xU0XRSVYSp6+oWLCEv6jpKESGgEbXK
Q9Sp1IQAz3WyEhmbZ/fjaL2Bj+4unwyftAhL8yg3ZR88mhqKvdvSNRP90vGQGzM3
w1oWfEGQf1Ibwn08J/s2n1rOs5TzXDH7Owcjv8zCphfXsLtWToNYO78Rw34ZSEM9
TmNkpO0kxV63HcbBmBBqnlg90EOZ5JkMpVOYRH9k2/v3qlx7hVGUnNjqDbVKcGpy
9qceOorDJe3sROITTlGkamlkplmHOT2IlT1rntRWCCsglIGUhh8v9KAB8T/ib4RE
k3Y=
=ynRm
-----END PGP SIGNATURE-----

--------------0YX70DoARKhiZ4Z2hKZFVJXw--

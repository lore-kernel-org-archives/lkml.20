Received: from mta1.migadu.com (out-147.mta1.migadu.com [95.215.58.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F2340B0E8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184872; cv=none; b=E1ixqunMbVGlqnd4gcOW1kBfHm8tDrR/oJoC4FDc+yBFZCAv3k6iqzCd9H5hZ4YkDEeUjvHxGsxvMqXdEyjQeqPkd771xP/rTkbvpBkyw4+o/7qUZqkVEkm1eyTFIqDJJ9EgMBsJsrgfwgVQB/vFpsmjNhz718/bdmAQ8hBZ2lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184872; c=relaxed/simple;
	bh=EJYd5eCHl5xQ8DHPfFFy7axjDaK7yOO1wMEyNS6gPb8=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=dFzDP+HYu0aCQyY1IwYeNRj3sGvlP+4vNQ04BwPEV3kLN9I/HNUx4CBARPCNvRbqUqa/MOYpEw3sRFJ+EWw2BTa5ODZNW5SCoODu7/4yViIqtNSJ45HM3HMXngAu5whmo0tSKWCuwqD1/QFN4bePxEeR2a+QXDJ7l5DwwVKnAjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cO/AhfdZ; arc=none smtp.client-ip=95.215.58.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cO/AhfdZ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EJYd5eCHl5xQ8DHPfFFy7axjDaK7yOO1wMEyNS6gPb8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790184868; v=1; x=1790789668;
 b=cO/AhfdZAKbPU3IldkEeFiyrjfrV0BJPZs/b3cOgQivxv0RDmJ6kP6VBEyHwDZUbw+qOxvl6
 Z/3Ibxryusx19MJmlJL17PdtVisLAiL/0Ij2seiRPpegXTjkEqQxSZAU4fV0FJATK1Mj9m2IxpO
 WI7ADKYnMObRzC3rf4JhJyKc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f743616c5fc41547;
	Wed, 23 Sep 2026 17:34:27 +0000
X-Mizu-Trace-ID: f743616c5fc41547
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 23 Sep 2026 17:34:27 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Ilya Gladyshev" <ilya.gladyshev@linux.dev>
Message-ID: <56e036665dbeb0a8f51d697220d5ed84f210994c@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v6 3/3] mm: implement page refcount locking via dedicated
 bit
To: "Zi Yan" <ziy@nvidia.com>
Cc: akpm@linux-foundation.org, andrew+netdev@lunn.ch, apopple@nvidia.com,
 artem.kuzin@huawei.com, baolin.wang@linux.alibaba.com, david@kernel.org,
 Liam.Howlett@oracle.com, edumazet@google.com, harry.yoo@oracle.com,
 hramamurthy@google.com, ivgorbunov@me.com, joshwash@google.com,
 kirill@shutemov.name, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, muchun.song@linux.dev,
 pfalcato@suse.de, rppt@kernel.org, surenb@google.com,
 torvalds@linuxfoundation.org, vbabka@suse.cz, willy@infradead.org,
 yuzhao@google.com, ilya.gladyshev@linux.dev
In-Reply-To: <DLFJL5U9DI6F.3QJP9YP0KX636@nvidia.com>
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
 <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>
 <DLFJL5U9DI6F.3QJP9YP0KX636@nvidia.com>

September 15, 2026 at 5:42 AM, "Zi Yan" <ziy@nvidia.com mailto:ziy@nvidia=
.com?to=3D%22Zi%20Yan%22%20%3Cziy%40nvidia.com%3E > wrote:


>=20
>=20On Sat Sep 12, 2026 at 3:50 PM EDT, Ilya Gladyshev wrote:
>=20
>=20>=20
>=20> The current page refcount implementation uses a single counter valu=
e
> >  (zero) as dead. So, to prevent incrementing a dead refcount in
> >  folio_try_get(), it fundamentally requires a CAS loop.
> >=20
>=20>  This CAS loop can act as a serialization point and can become a
> >  significant bottleneck during high-frequency file read operations
> >  [1][2].
> >=20
>=20>  This patch reallocates the refcount value range:
> >=20
>=20>  (1) refcount < 0 means dead refcount (uninit / frozen)
> >  (2) refcount =3D 0 allowed only as a temporary state (see below)
> >  (3) refcount > 0 is a regular reference count
> >=20
>=20>  In other words, refcount is now split into "dead bit" and a 31-bit
> >  counter.
> >=20
>=20>  Refcount decrement now works as follows:
> >  1. Counter decrement
> >  2. If it is now zero, try to put it deep inside the dead zone
> >  (CAS to INT_MIN). Or you can view it as "set up frozen bit and reset
> >  counter".
> >  3. This CAS can fail only if someone grabbed a reference in-between =
--
> >  that's okay, this page is their problem now.
> >=20
>=20I am not sure this works. David raised a concern on V4[1], where if a
> folio lands to page_frag_free()'s free_frozen_pages(), it will not be
> properly handled. "this page is their problem" only works if every
> folio/page free functions call a generic folio/page free function that
> checks the page type and does the proper handling.

>> Refcount decrement now works as follows:
>> 1. Counter decrement
>> 2. If it is now zero, try to put it deep inside the dead zone
>>     (CAS to INT_MIN). Or you can view it as "set up frozen bit and res=
et
>>     counter".
>> 3. This CAS can fail only if someone grabbed a reference in-between --
>>     that's okay, this page is their problem now.
>
> I am not sure this works. David raised a concern on V4[1], where if a
> folio lands to page_frag_free()'s free_frozen_pages(), it will not be
> properly handled. "this page is their problem" only works if every
> folio/page free functions call a generic folio/page free function that
> checks the page type and does the proper handling.

After some thinking, this scenario is indeed possible and problematic. Th=
e
complexity of the required setup give me hope that there are some implici=
t
barriers, however I wasn't able to find them. But I am not an mm guru,
so maybe I missed something :shrug:

-- Below is a minimal buggy scenario --

Thread A: network code that calls page_frag_free()
Thread B: calls folio_try_get(). Maybe it is the DAMON paddr scanner,
          maybe this folio was previously used in page cache
          (however this noticeably complicates the scenario)
Thread C: user of folio's reincarnation. It also requires destruction via
          folio_put() and not via free_frozen_pages() -- for example huge=
tlb
          or memcg charged folio.

Refcount operations as follows (FR =3D FROZEN):

A: DEC 1 -> 0  [ page_ref_dec_and_test() ]
B: INC 0 -> 1  [ folio_try_get() ] =3D> success
B: DEC 1 -> 0  [ page_ref_dec_and_test() ]
B: CAS 0 -> FR [ page_ref_dec_and_test() ]
B: * deallocates via __folio_put() *

C: * re-allocates page *
C: DEC 1 -> 0  [ page_ref_dec_and_test() ]
A: CAS 0 -> FR [ page_ref_dec_and_test() ] =3D> success
A: * deallocates directly via free_frozen_pages() * =3D> BUG

This can be fixed with a `s/page_frag_free/folio_put/`-style patch, howev=
er
it seems unreasonable...


> Before your patches, only a speculative page getter can see any page an=
d
> folio_put() handles the last reference drop. So it is safe today.
>=20
>=20Let me know if I miss anything.
>=20
>=20[1] https://lore.kernel.org/linux-mm/086b119c-b777-46ae-b087-798ca3e4=
4ecd@kernel.org/
>=20
>=20>=20
>=20> The size of the dead zone allows performing an optimistic increment
> >  inside page_ref_add_unless_frozen(), replacing the previous read + C=
AS
> >  loop with a single RMW operation. This reduces cache line bouncing a=
nd
> >  improves scalability, especially in NUMA scenarios.
> >=20
>=20>  [1]: https://lore.kernel.org/all/20251017141536.577466-1-kirill@sh=
utemov.name/
> >  [2]: https://lore.kernel.org/all/CAHk-=3Dwj00-nGmXEkxY=3D-=3DZ_qP6ki=
GUziSFvxHJ9N-cLWry5zpA@mail.gmail.com/
> >=20
>=20>  Reviewed-by: Artem Kuzin <artem.kuzin@huawei.com>
> >  Co-developed-by: Ivan Gorbunov <ivgorbunov@me.com>
> >  Signed-off-by: Ivan Gorbunov <ivgorbunov@me.com>
> >  Signed-off-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
> >  Acked-by: Linus Torvalds <torvalds@linuxfoundation.org>
> >  ---
> >  include/linux/page-flags.h | 13 +++++++++++++
> >  include/linux/page_ref.h | 30 +++++++++++++++++++++++++-----
> >  2 files changed, 38 insertions(+), 5 deletions(-)
> >=20
>=20--=20
>=20Best Regards,
> Yan, Zi
>

---
Ilya Gladyshev // foxido.dev

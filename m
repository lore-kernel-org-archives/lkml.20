Received: from mta1.migadu.com (out-111.mta1.migadu.com [95.215.58.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E393101C8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319801; cv=none; b=FsMjiqOGncw3Lzk8mt+MNu01X0SDYNpfJqp5pCOoCIqwKNVVWy5KVtOHohOnTcyn/Wb5OC3wezNSfDBeIFOzKiG2xr6OgcP9/5XpwcFqrxeAUXO3iudBsr/rdc1czJkw54bFnWaQq9OOB/9bMGvzZ8IWduPLRmlixW5eY+7uKNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319801; c=relaxed/simple;
	bh=kewsY2OluvVAW64X+i+86icUTbgNEdAoaeGfcLyjEu8=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=hsXvEye2+wAr6u45YbUNR2Mu3dVrgm6uYiDScpnjdmKgw8L/8GCKbWwgXanfoXXFUXnTNphuPicE4tL+xrc4rs6jBnybuh+1AP4GuXd0mr1ZdolJOCKJHM31r7d/dPihl8O8oZ6R2Mnk8Mx1SXi/Z2DVSkdn2ErWib3KErecBkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oz7kiieG; arc=none smtp.client-ip=95.215.58.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oz7kiieG"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kewsY2OluvVAW64X+i+86icUTbgNEdAoaeGfcLyjEu8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790319794; v=1; x=1790924594;
 b=oz7kiieGnfL4paSZwrjaMApP4sKPauioqNRtEnoJAwTp1JzL6M3okTaoGOuTMWtEDL1ABPv0
 cimZpzbW+aksPEzg7XkN6aVpN6mrBD11S5a0zNEUCcg1PLTcrNPqWXnzJ1SaR11SW2BiC773A/Z
 T3uF9Y+Ehto9cv+eSO3elGwE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1628244cb04595ea;
	Fri, 25 Sep 2026 07:03:14 +0000
X-Mizu-Trace-ID: 1628244cb04595ea
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 25 Sep 2026 07:03:12 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Ilya Gladyshev" <ilya.gladyshev@linux.dev>
Message-ID: <a1d5881926dbf4b16dc796fb1da939f32dd42f18@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v6 3/3] mm: implement page refcount locking via dedicated
 bit
To: "Zi Yan" <ziy@nvidia.com>, "Linus Torvalds"
 <torvalds@linuxfoundation.org>, "David Hildenbrand  (Arm)"
 <david@kernel.org>
Cc: akpm@linux-foundation.org, andrew+netdev@lunn.ch, apopple@nvidia.com,
 artem.kuzin@huawei.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, edumazet@google.com, harry.yoo@oracle.com,
 hramamurthy@google.com, ivgorbunov@me.com, joshwash@google.com,
 kirill@shutemov.name, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, muchun.song@linux.dev,
 pfalcato@suse.de, rppt@kernel.org, surenb@google.com, vbabka@suse.cz,
 willy@infradead.org, yuzhao@google.com
In-Reply-To: <DLO1WIACYFWF.3N01DXYFJLMD0@nvidia.com>
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
 <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>
 <DLFJL5U9DI6F.3QJP9YP0KX636@nvidia.com>
 <56e036665dbeb0a8f51d697220d5ed84f210994c@linux.dev>
 <570cf649-a8bf-4073-be71-207fbb2bef40@kernel.org>
 <CAHk-=wh3LLDV2AMZn1PZcU1o3Na-BNcQtP=LPXouLKPZWaiRdQ@mail.gmail.com>
 <DLO1WIACYFWF.3N01DXYFJLMD0@nvidia.com>

September 25, 2026 at 5:44 AM, Zi Yan wrote:
>=20
>=20On Thu Sep 24, 2026 at 4:06 PM EDT, Linus Torvalds wrote:
>=20
>=20>=20
>=20> On Thu, 24 Sept 2026 at 11:52, David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
> >=20
>=20> >=20
>=20> > There needs to be a common page freeing function that dipatches s=
tuff.
> > >=20
>=20>  I think this all needs to be entirely generic to all pages. Agreed=
.
> >  Everybody needs to do it right.
> >=20
>=20It assumes all callers of page_ref_dec_and_test() are free page
> functions, but there are two exceptions:
>=20
>=201. compaction_free() uses folio_put_testzero(), which calls
> page_ref_dec_and_test() to put not used migration dst page back to
> isolated freelist instead of freeing them.
>=20
>=202. virtio_mem_fake_offline_going_offline() drops the last reference o=
f
> fake-offline pages, so that they can be offline.
>=20
>=20They will need to be converted to not use page_ref_dec_and_test() in
> addition to a common page freeing function. And any such future use
> needs to be banned.
>=20
>=20>=20
>=20> But I think that in the scenario that Ilya mentioned:
> >=20
>=20>  Refcount operations as follows (FR =3D FROZEN):
> >=20
>=20>  A: DEC 1 -> 0 [ page_ref_dec_and_test() ]
> >  B: INC 0 -> 1 [ folio_try_get() ] =3D> success
> >  B: DEC 1 -> 0 [ page_ref_dec_and_test() ]
> >  B: CAS 0 -> FR [ page_ref_dec_and_test() ]
> >  B: * deallocates via __folio_put() *
> >=20
>=20>  C: * re-allocates page *
> >  C: DEC 1 -> 0 [ page_ref_dec_and_test() ]
> >  A: CAS 0 -> FR [ page_ref_dec_and_test() ] =3D> success
> >  A: * deallocates directly via free_frozen_pages() * =3D> BUG
> >=20
>=20>  the big here is that the de-allocation was done not from the state=
 of
> >  the *page*, but from the state of who finished it off.
> >=20
>=20>  So that
> >=20
>=20>  A: CAS 0 -> FR [ page_ref_dec_and_test() ] =3D> success
> >=20
>=20>  is not a problem per se. It's a fine case of "we had one single un=
ique
> >  final free".
> >=20
>=20>  The failure is that A then goes on to do that
> >=20
>=20>  "deallocates directly via free_frozen_pages"
> >=20
>=20>  because A mis-judged the page as having the old stale state that i=
t
> >  had when *A* was using it.
> >=20
>=20>  IOW, I think the soluition is either:
> >=20
>=20>  (a) every user of put_page_testzero(page) agrees tro do exactly th=
e
> >  same thing and there is no difference between how that final
> >  "0->FROZEN" is dealt with, so it doesn't matter that A is freeing a
> >  page that C allocated for something else
> >=20
>=20>  or
> >=20
>=20>  (b) the CAS 0 -> FR state sequence always looks at the *page* to
> >  decide what to do, never at the caller state (ie A will look at
> >  whatever C wrote when it allocated the page to know how to do that
> >  final free).
> >=20
>=20>  Hmm?
> >=20
>=20Just wonder if we could make 1 -> FROZEN atomic to get rid of the gap=
.

Hmmm, I=E2=80=99m afraid that since you need CAS for a safe 1->FR transit=
ion,
it will result in a CAS loop for the decrement itself (like in
atomic_sub_unless). And this will introduce scalability issues just like
in folio_try_get(), but this time for everyone...

Unless there is a way to change the refcount encoding even further and
fix this gap.

---
Ilya Gladyshev // foxido.dev

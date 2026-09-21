Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EAE397936
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974022; cv=none; b=q6FhEbyx8SlQgVplf2IoAftukn4QKpe1Su7VbJHNv5KGsB1CLoyaYypy8OZ2qQ8UN9nYA0zfW1FUKZspb84T09vERVv1Ity4F2zOYghH0CoNG39GeYQLuBNv00jaSthDoWugyq3GQ/wedLesOjSiEMHmQfY83Dn9qSZ4TeizEfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974022; c=relaxed/simple;
	bh=URRFXhIWeaZjAZP78IbRGyiI9CUhBbapKcmpz0Nauo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ib9Q3LNSuswH5UT8vmHBbDu0xNOjsfg6wLLDZoL9LsJz0Z0p5fX87duFuMGi1C6dhv+ECo/XfQejvAN+FJ6wQCN9Gf229Etp2VYfpT+XeWkNWyaz0YWvvHXDkjPfA8zfey/IgottZ3xZ1d2LP9eD0F8HKzR9AI127HUU7AXT5/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLVW2EBf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLVW2EBf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3561F008A2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789974020;
	bh=gHlvbb647JYtKJVobp9L+WY+i2D3HiyuRdvv6kDImw0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LLVW2EBfsLFXZgiNXk7HC98NkM+VwO00JhtmGfImdK507iki8Y6OysdNppSsmDdnY
	 7sxUkdlR4mrEc0q484yRBO0IttUM6bX6F1qiMgY7iaGfQN0apb4xg1UNLLIt/hFH+9
	 hnKBvFvwoNzq75cKGSWMNY3rTlpyzvduCY8wTr1X/qgwL+i3HD6iwYn+ip+KutTRCC
	 M5E86/zKfV4xim5w6IflhmON1qM9TsaCZbgHcSWuZfPJ9ngR/VYFPzWjbryP9h8N5J
	 Bja5WfzrsgT4c7/RMuEP99MyQKxjBqhM+fOUYWTctURV9bMYwa0z9hM2CI0gtR4h+5
	 bVuMbTohk18Og==
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5c9a1536864so1875289e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:00:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzzwLR9QdTuvV7mHIPHPiCMi4PV6tEyq/4MnsMxTMRJuubOUwdO5ixpNgwJdyA3Cnq87mnBVefrtiv8WvE=@vger.kernel.org
X-Gm-Message-State: AFuF++kfCk9jA6Vk3Pr0oWPEkH0I7uWtzIpmwTEZ9XlCGHs8jalAD05f
	fhaN+nuJjzMoi1aoaINrahbxQfqjD2hg95cJ4lQPvPVIRHdweqDO3Uh6klZD123107AprxXa6et
	xrhH6LYdrLU0cwkbkHXgCvfdgO7GdnFA=
X-Received: by 2002:a05:6122:4896:b0:5c9:a60c:273d with SMTP id
 71dfb90a1353d-5c9b59eaf2bmr4648530e0c.21.1789974019896; Mon, 21 Sep 2026
 00:00:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920132519.3369946-1-ridong.chen@linux.dev>
 <CAGsJ_4zCADpQDqVj=BFipOztctBMBhw9Wcj+FLVcj-d8e=0bow@mail.gmail.com> <2e878fe2-473e-4dc1-a669-7e2e37894d6e@linux.dev>
In-Reply-To: <2e878fe2-473e-4dc1-a669-7e2e37894d6e@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Mon, 21 Sep 2026 15:00:07 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yrR1Wn7NjOFVcWdD+_WEEu7AY6LdsKTZDxx0VR3EzQ+g@mail.gmail.com>
X-Gm-Features: AcwNN1XrdEZ1E-aaP9IeNffRJ6dC3Vjq8bbURZBcSwpV0urbD42mxWoj6_IQ61Y
Message-ID: <CAGsJ_4yrR1Wn7NjOFVcWdD+_WEEu7AY6LdsKTZDxx0VR3EzQ+g@mail.gmail.com>
Subject: Re: [PATCH mm-new v2] mm: vmscan: put rotation-missed folios at the
 LRU tail
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 2:05=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
[...]
> 3. In move_folios_to_lru, we drop the extra reference and move the folio =
back to
> the lruvec.
>
> ```
> ...
>                 if (unlikely(folio_put_testzero(folio))) {
>                         __folio_clear_lru_flags(folio);
> ...
>                 }
>
[...]

> Therefore, I believe it should be 'folio_ref_count(folio) =3D=3D
> folio_expected_ref_count(folio)', not 'folio_ref_count(folio) =3D=3D
> folio_expected_ref_count(folio) + 1'.
>

Yes, you're right. I missed the `folio_put_testzero()` above.
Sorry for the noise.

Best Regards
Barry

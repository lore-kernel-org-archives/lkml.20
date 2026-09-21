Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D083A35F8C5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974073; cv=none; b=CazgSAJTyPZDx2G1W2Ytrlyp4fHrkxH8+FmRJhpmWYoy3vfGIVpPNNbftqOELCE9Q0aURzyYhkBU0wQvQx2poi8cGaFHfHPZhxQLydEALhvIxEXUlhRyNHy4DGDi1M+Th7Ah7wPSxtwta4DZHfFQ05oHEdCg7uOf30LmTTJd+iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974073; c=relaxed/simple;
	bh=gyt1tNGdV4zBKe1tedEocisy0s/GRDp1ZGjdCi7uOGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NxRnB0C0bKGGlPbMZDi22RrDbjlz+JJXUKKNFwfdVOGMCDL5ZYd7XtJHKbgQpWwix0GoX1oh2WC8347cpoQdiQyDX8zFxM1kRQHoo7kkm4fWeGgPhnr93FUvAchPSE73jtA003AWik4rn7zqslgQ3n2wmQ7oO5kRPRJsFTUSbbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgejePT5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgejePT5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB3D1F0089E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789974071;
	bh=RCmQuU6gi9OeTPCWb/X0YUvJ4U4go3COykEH9ftpjhg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jgejePT50hfmk+Ohhiq7ukd0rAyYWB0kk4n9KxexgdjHcYKFm8LRoDism0xMKaH0i
	 gGuIP/HVE3B/WO+DkUQSpYEjtzKXDJ3fyh/6Gj63mYOw8mM4IW88zfQs9+DQ7IqJl8
	 FoT75OdzIO/gENOBT3KUm+hABr/5mZ0h8bgcM+Jcnwogh7Wor5OjoBY+13adH49otr
	 29ZcHFrrPYoU9diw7EXGm8m0qj4s61w2RR23+EH2oupC/S7YYiBY5B9w0jCZ2S5CVu
	 imSKfVb9ZE5ScJtRBza5AjNDV1m7MtpGBYcaBFeHsa9AEt3DcFUYwiv0xzu53V/O+F
	 374LOlpI0KTsw==
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-791a9878aa9so831341137.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:01:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBym62G58FnVnWplUC2d2Jm2N3JjQn8HqWyreUPRdjgKppMvcyR17C7y97x+Iu6VteoRwhpRwL3LwXau5TI=@vger.kernel.org
X-Gm-Message-State: AFuF++kmatMD8E8Yt7ShqD6sk/Zw/koTUOYICpBuKBrNUgt6idJ30gBD
	SvY3rxz7YIoLICdUqM0YzLkEm4Qk9jL75tYGzMxXaO9vR5CwskoSB4KAIkmZS+fZVKdgngR1gGJ
	o+KFsZDPcqV2C9+h04dkjr12ATJ/eEXI=
X-Received: by 2002:a05:6102:4bc9:b0:7a1:f7d2:e830 with SMTP id
 ada2fe7eead31-7a55a92acf9mr3389421137.16.1789974070653; Mon, 21 Sep 2026
 00:01:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920132519.3369946-1-ridong.chen@linux.dev>
In-Reply-To: <20260920132519.3369946-1-ridong.chen@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Mon, 21 Sep 2026 15:00:59 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xVdNE_Afk8m+-_4UkA-K3VxPhdn43afP2RTxn7LgQJPw@mail.gmail.com>
X-Gm-Features: AcwNN1VwBXim9JNG7w99oiVvXThrctieAEVa5E60frR8NLkAFaCEYJHdccx52lA
Message-ID: <CAGsJ_4xVdNE_Afk8m+-_4UkA-K3VxPhdn43afP2RTxn7LgQJPw@mail.gmail.com>
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

On Sun, Sep 20, 2026 at 9:25=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
>
> From: Ridong Chen <chenridong@xiaomi.com>
>
> The page reclaim isolates a batch of folios from the tail of an LRU list
> and works on them one by one.  For a suitable swap-backed folio on an
> async swap device, it queues the folio for writeback and, after finishing
> the batch, puts the folio back to the head of the original LRU list.
>
> Meanwhile the page writeback flushes the queued folios in its own,
> independent batches.  For each folio it writes back it calls
> folio_rotate_reclaimable(), which tries to rotate the folio to the LRU
> tail.  But folio_rotate_reclaimable() only takes effect once the folio ha=
s
> been put back by reclaim.  If the async swap device is fast enough, the
> writeback can complete a folio while reclaim is still working on the rest
> of the batch that contains it.  In that case the folio stays near the hea=
d
> and reclaim will not revisit it before wrapping around, causing a cold/ho=
t
> inversion: a clean, written-back folio that should be a prime reclaim
> candidate is kept ahead of hotter folios.
>
> commit 359a5e1416ca ("mm: multi-gen LRU: retry folios written back while
> isolated") addressed this for MGLRU only.  The traditional active/inactiv=
e
> LRU has the same problem, reported at [1].  A reproducer is available at
> [2].
>
> Rather than re-reclaiming those folios (which would drop the swap cache
> that may still be useful for a future hit [4]), restore the rotation that
> was missed: when move_folios_to_lru() puts a folio back, add it to the LR=
U
> tail if it looks like it missed folio_rotate_reclaimable() (inactive, not
> mapped, not dirty and not under writeback).  A referenced folio is left a=
t
> the head so it still gets a second chance, and a folio with an unexpected
> reference (e.g. a GUP or speculative pin) is left at the head because it
> cannot be reclaimed yet anyway.  A new do_rotate parameter gates this so
> it only applies on the reclaim put-back path (shrink_inactive_list()), no=
t
> on shrink_active_list() where the list order is already deliberate.  This
> approach was suggested by Barry Song [3].
>
> Only the traditional LRU is handled here.  MGLRU already retries such
> folios via its own clean-list retry pass in evict_folios(), so it is left
> unchanged.  The same do_rotate scheme could later replace that retry pass
> to unify both LRUs, which is left for a follow-up.
>
> Test result with [2]:
>
>   Without patch:
>     cat memory.usage_in_bytes
>     1073700864
>     cat memory.memsw.usage_in_bytes
>     1413124096
>
>     free -h
>                   total        used        free
>     Mem:           1.6Gi       1.2Gi       299Mi
>     Swap:          1.0Gi       678Mi       346Mi
>
>   With patch:
>     cat memory.usage_in_bytes
>     1071140864
>     cat memory.memsw.usage_in_bytes
>     1413423104
>
>     free -h
>                   total        used        free
>     Mem:           1.6Gi       1.2Gi       322Mi
>     Swap:          1.0Gi       328Mi       695Mi
>
> After applying the patch, the difference between
> memory.memsw.usage_in_bytes and memory.usage_in_bytes is close to the swa=
p
> "used" value reported by 'free -h'.
>
> [1] https://lore.kernel.org/linux-kernel/20241010081802.290893-1-chenrido=
ng@huaweicloud.com/
> [2] https://lore.kernel.org/lkml/46037a37-4cf6-448e-a94b-30a4d16e8814@lin=
ux.dev/
> [3] https://lore.kernel.org/lkml/CAGsJ_4zwP3_+EYY5Ug9EJ+yD1UdxsBSGr25u8s1=
K3u_i7LH3Zg@mail.gmail.com/
> [4] https://lore.kernel.org/linux-mm/20260911121341.178028-1-alex@ghiti.f=
r/
>
> Suggested-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---

LGTM,

Reviewed-by: Barry Song <baohua@kernel.org>

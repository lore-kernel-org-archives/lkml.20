Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127831;
	b=2tsXig9N7yOopaNFIV+gfkcgrLHa//TsttELBQq4sSvOCOLC3XVy13VhuonofpE9Zss8
	 UnK3KdJLyiIKhYLQIDLOyvPsw/VD8x0vsAyItJhbI5AgWkqotcMLoaZzzp46+9Ln58E4O
	 PiQ2p/lPZrP3fM7DgWsMHGW7VkKv4DoHo8Jhyau+tSMgLK31IiAVj4cHmTJajsKTkj4JG
	 5+8ul7fuV5Az/0SpikRht4Op+dU5H+afeJhP9f0DhLaSNFTDJOCuuGO6xNDZZKxpyjMhU
	 zBygr++mY3V3VqjQ5CYvemoCK94XsVG8kzV1P9R5hHHeBbtdcWvZB02tFFsIgEuNWNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127831;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wsg9qX9Duh1bo4M1Tai5hv+Sz6R+aE86ukM/XtuRQf4=;
	b=sqc5zBqxj340JwZwX/+/Bd0b7oSpc9TanHu62f7D7yyVcpky7+zPu1G0WoTbqLcwO2lv
	 aFhOEV7QiL8tocQqDpSES9gAvD/2fq95zLci7nQ8+NLtGzUlx23/y1rI7KNVSQknHLdDO
	 EE65cCIKOuNmhvglYjQBzZG6kG9ZDgFJ8YIcdxcqNFF0+hMozrKCkDyXTG3YGNzRwJi5a
	 g5YQAuCBYmkGExB1QYmcYSn8jtCfg5aaGCfELA0tCIYClDzBQRKzaosWreZtQn+EKzolt
	 acR2VyGDe+ouW5gIXTZVPwjc+B5NlpH2HQT1i+N1Kv+YgoNCInfBcF/bMZQtILgB+hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=libQm8pj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C97606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=libQm8pj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CC01F008A5
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794127830;
	bh=wsg9qX9Duh1bo4M1Tai5hv+Sz6R+aE86ukM/XtuRQf4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=libQm8pjncVDF9r5oQpLQrQ6mfnG4HOrJBoGbS7Dj8OJp537IN50lfPP4MrtCKvp2
	 ptckO2iqHV7zY4sGWiz05zQ8vnW5pcPDbog4n+/NKNZDred+dHlL1iRBaUXq6w0H7v
	 2825HJaguuesy7OkyxQB/KM4aNReLCt7YTBEpGEeHX+ueHbOUA4+1vDWBeIM7w9Z0b
	 jboCkhI44cAXMQQsVqB04DUf3n8UaHV7QvcQgHIbzAYJTra36sWCkqnQgan/hLXZEM
	 Lebu2j2wRQ0ydjGrUTt3y1Uf6pK3rdUF7UNTaodLupZfB07D+luvMLBJpNBhKzR7HV
	 p48mUAqcaD19A==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f2b8cf037so23660685a.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:50:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErENhxY9dMU6N/6J3LscvD5TLozT5yvVAhpCyTH7QbfVwWc984kH0Lpb5Svn3XfMyv1r9wBVWjx2NkR+7T0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LT+omTu9zH5Zwp8f1rAqm96i/eFUHnPC050qm2Wu8BUKdY8nv
	nbq2ViJzyuT0pe8+uE4N+5KTvLfyQXmkD4/gp2/BQq3Jqgo4ScGP/sW8fZon6kZNLVNR3Qqx4Y7
	y8MU2sgbajA31UW3d70j+NERkglS5Fuo=
X-Received: by 2002:a05:620a:2682:b0:945:b967:475f with SMTP id
 af79cd13be357-947841e9160mr121270285a.16.1794127830086; Sun, 08 Nov 2026
 00:50:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105132220.2233677-1-ridong.chen@linux.dev> <20261105132220.2233677-3-ridong.chen@linux.dev>
In-Reply-To: <20261105132220.2233677-3-ridong.chen@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Sun, 8 Nov 2026 16:50:18 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wQC+d1ruhf+i6cETunK+h94z32-EHB=ghBQJ_rqVLNvg@mail.gmail.com>
X-Gm-Features: AclHuK--owIMPJ3Qjv3IT-ieNsbO9hCgnmZEQdRZt5zyNNTmndKmiQfuNxQFhKo
Message-ID: <CAGsJ_4wQC+d1ruhf+i6cETunK+h94z32-EHB=ghBQJ_rqVLNvg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] mm/mglru: skip the flags cmpxchg when nothing changes
To: Ridong Chen <ridong.chen@linux.dev>
Cc: David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Joanne Koong <joannelkoong@gmail.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 9:23=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev> =
wrote:
>
> From: Ridong Chen <chenridong@xiaomi.com>
>
> folio_update_gen() and folio_set_lru_refs() always end with a
> try_cmpxchg() on folio->flags, even when the new value equals the old
> one. The locked instruction still takes the struct page cacheline in
> exclusive state.
>
> That is common in practice: a folio mapped by many processes is visited
> once per mm during a page table walk, and after the first visit it is
> already in the youngest generation with refs cleared and PG_workingset
> set. isolate_folio() and the eviction paths also call
> folio_set_lru_refs(folio, 0) on folios whose refs are already zero.
>
> Break out of the loop when the flags would not change. The result is
> the same as a successful no-op cmpxchg. The only difference is that the
> full barrier implied by the locked instruction is gone on that path.

Hi Ridong,

I'm not quite sure this is an accurate description. The
atomic operation checks whether folio_flags(folio, 0)
has changed. If it has, we need to recompute new_flags
based on the updated old_flags.

For example:

CPU 0                          CPU 1
-----                          -----
read old_flags =3D A
                               change flags A -> B
new_flags =3D A
new_flags =3D=3D old_flags
break

This is how the CAS loop works. Whether we strictly
need the guarantees provided by CAS is a separate
question :-)

But skipping the CAS logic might slightly underestimate a
folio's hotness if it gets promoted twice? Perhaps the
race window is so small that the reduced CAS overhead
outweighs the impact on hotness tracking.

> No caller relies on it: the eviction and isolation callers run under
> the LRU lock, and the others (page table walks, folio_mark_accessed(),
> lru_gen_clear_refs()) only care about the resulting flags value, which
> is already in place. Note that lru_gen_inc_refs() already returns
> without any atomic when refs is at LRU_REFS_MAX and the folio is in
> the workingset.
>
> Tested on an i7-13700HX with turbo disabled and the performance
> governor. N processes map the same 2GiB tmpfs file (huge=3Dnever) and
> read every page, then one aging pass is triggered on their memcg
> through /sys/kernel/debug/lru_gen ("+ <memcg_id> 0 <max_seq> 200 1").
> Time per aging pass in ms, median of 5 runs of 10 passes each, averaged
> over 2 boots of each kernel:
>
>   processes    base   patched
>           1    32.9      31.7   -3.5%
>           8   195.1     160.2  -17.9%
>          32   755.8     592.2  -21.7%
>          64  1597.2    1260.6  -21.1%

Could we post the microbenchmark code here if it's
short enough?

>
> With one process, every visit changes the generation, so there is
> nothing to skip. Before the patch, perf annotate attributes 53-58% of
> the walk_update_folio() samples to the lock cmpxchg in the inlined
> folio_update_gen() in this test.
>
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
>  include/linux/mm_inline.h | 2 ++
>  mm/vmscan.c               | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index b3d85fe91385..4ba9079f4dc8 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -244,6 +244,8 @@ static inline void folio_set_lru_refs(struct folio *f=
olio, unsigned int refs)
>         do {
>                 new_flags =3D old_flags;
>                 lru_set_refs_flags(&new_flags, refs);
> +               if (new_flags =3D=3D old_flags)
> +                       break;
>         } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flag=
s));
>  }
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 50c352e9ffef..3fa76715382d 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3398,6 +3398,8 @@ static int folio_update_gen(struct folio *folio, in=
t new_gen, int *type,
>                 lru_set_gen_flags(&new_flags, new_gen);
>                 lru_set_refs_flags(&new_flags, 0);
>                 new_flags |=3D BIT(PG_workingset);
> +               if (new_flags =3D=3D old_flags)
> +                       break;
>         } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flag=
s));
>
>         *type =3D folio_flags_is_file_lru(&old_flags);
> --
> 2.34.1
>

Thanks
Barry

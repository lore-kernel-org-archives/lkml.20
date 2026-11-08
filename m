Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794129296;
	b=5nBx5RDBTzflya25AvZb35ePCg3S/Se5ZrATfSegS4OrGX9AC4z5nTpNwgz8bXWGYLQG
	 cDlUlYkwFOENSSPCb8lcVtLupQD/wZtM9BcWnNu/FZCHdBoWVzgKDGt/Vb3gVTIiwHevP
	 aFsfA0H8/TW/MM+xmtLb0GXHC3hu/QZs2A22+Yzjn0BfVpm/O4PlvzO2+RsXpo/lPDYTL
	 GvL9GORi5f1kVBCU9unYoX+54IrsOJ/s0K5KRiAMZyGYjmwKMnq5EOydo5XuaKhi/H7pr
	 BYxClYIxtNLoaqui1PAaux5kl22v2Ol9OLeaExyFgh6tr3WxrC/jYIuqxyBOc9epCFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794129296;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rCD81M4wkhyRvUZmOtk/s217PTiFdBqN/DyRmNpi43c=;
	b=31J+dE2wM3lqikB/tEB9J522wmyBMBmA6LGc5iY6oP4cnNSlTRDLz3TKrVxqrSNW++lZ
	 i0kBc5AZT9IKqDjW/uhs8goVafk9lp7Zz8dWkpraet5ykwKP7h/SyPQVbCF9BR/y33lvp
	 1Bb9U5z9ww2jKEC4AvIBB6PmYkpU0KDyNkPLZmZmBg8j7E21YZGKukMfWvGG0KgFmGiM1
	 OxlFCBRdn2HwlsX2/uuoux/PLN55pYgmQdsACh5C3NaBs7zbnYiTpf+8ByDx05wVLkZHt
	 021F37Uc1P2wyjRaB1tHIhXLu5CBbR0T8eFECHC0jL8u8l12XHIMr1rpgYMowelWkJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GCRNIukj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D37B606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GCRNIukj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC9C1F008A3
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794129295;
	bh=rCD81M4wkhyRvUZmOtk/s217PTiFdBqN/DyRmNpi43c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GCRNIukjmbxRSLroBYrglpNYxblFA6Gm6kPuw6XxKppjCHT6ua56dVtURYxrJ64+Z
	 vNrl1SHly+bjqYw6WBgS5qnvNzvSdgeoWr+I1PUjwO3RNjEUMRiF5I0HU1tlTsgLUG
	 3qRxFC0rcHjMY8+dmomrgwfJKp9GyRkQKlaXXYE9jsWnzjr/dWW3dn+YpDGSmEv1V2
	 RjxyeegG4kIIROaEn71Tk4bMDCBb1oyi6PdbmcZJP8pzv1t9SFTj7QnIUM01nWXOmK
	 YL0AnTq+NTf+22Ph0e6lDi1JWxOjHJzVaE+B2jl1/I8R1nIsqBw2EdbJtn6p0XPh6u
	 DtMCpfAgutmIw==
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f269e335eso38641385a.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:14:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH3Av+nlMHJ6gCK+R54h8v1XTstsvxEhcCqwe3qsPkZwViIQOTej3qk5sS7qCDjR16DA1gi43wZ+KP0B8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t/6rclGU+31dFxEnrY0cOiYx9627x6bRamlhHn0+3qjI0f0yL
	QlA5+mVkePNASN71bdAeuyU0+GCi0yW00yYySv6jxbMsq4qYflLVDTC4AbAHMbYADPa0ph2mni8
	5p3mKgE8mVMr/O2UT8D9WmJ6rPgOpZO8=
X-Received: by 2002:a05:620a:6190:b0:943:f3d6:8e89 with SMTP id
 af79cd13be357-947841f78aamr130349685a.28.1794129295069; Sun, 08 Nov 2026
 01:14:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105132220.2233677-1-ridong.chen@linux.dev> <20261105132220.2233677-4-ridong.chen@linux.dev>
In-Reply-To: <20261105132220.2233677-4-ridong.chen@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Sun, 8 Nov 2026 17:14:43 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zLN1gXtDhhe1cvmerjOS=SAm1v2nnQm8u9ha9JADN+1A@mail.gmail.com>
X-Gm-Features: AclHuK-oMFADk2jaOD6cOrE84kP64sd4nEZWj1lhtonW45d2nczzkSkiLcwy8As
Message-ID: <CAGsJ_4zLN1gXtDhhe1cvmerjOS=SAm1v2nnQm8u9ha9JADN+1A@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] mm/mglru: move lrugen atomic stats off the
 read-mostly lines
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
> lru_gen_eviction() and lru_gen_refault() update lrugen->evicted[] and
> lrugen->refaulted[] locklessly with atomic_long_add(). The arrays sit at
> the tail of struct lru_gen_folio, right before enabled/gen/seg/list:
> with LRU_GEN_STATS=3Dn the file type counters share a cacheline with them=
.

So basically, this is causing false sharing, right?

I'd prefer a text diagram showing how the false sharing
occurs, specifically how freq read and freq write end up
in the same cacheline.

This will help clarify why rearranging the struct is the
right approach and how to rearrange it properly.

>
> Those fields are read far more often than they are written:
> lru_gen_add_folio() reads ->enabled on every LRU add, and shrink_many()
> walks ->list and reads ->gen/->seg under RCU. With frequent file refaults
> from several CPUs, every refault invalidates that line on the CPUs doing
> LRU adds.
>
> Move enabled/gen/seg/list next to max_seq/min_seq/timestamps, which are
> also mostly read, and put evicted[]/refaulted[] in their own cacheline
> group at the end of the struct. This grows struct lru_gen_folio from
> 1360 to 1408 bytes and struct mem_cgroup_per_node from 2176 to 2240

Why is the difference exactly 2240 - 2176 =3D 64 bytes,
which is one cacheline? I was expecting a value smaller
than one cacheline :-)

What I'm not convinced about is that nr_pages should be
updated even more frequently than evicted and refaulted.
Why aren't they causing a false sharing?

long nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];

It would be better to have a text diagram showing the
potential false sharing, so we can consider the issue
more comprehensively.

> bytes on x86_64 (one more cacheline per memcg per node).
>
> Tested on an i7-13700HX (24 threads) with turbo disabled and the
> performance governor. 24 files of 128MiB on ext4 on brd, read with
> fio (psync, randread, bs=3D4k, fadvise_hint=3Drandom, buffered), all jobs
> in one memcg with memory.max=3D1G, so nearly every read refaults.
> IOPS, median of 5 runs:
>
>   jobs      base   patched
>      1    270537    274303   +1.4%  (sd 3.7%)
>      8   1461025   1466293   +0.4%
>     16   2455629   2508001   +2.1%
>     24   2707720   2823776   +4.3%
>
> A custom random pread() test of the same setup, with this patch alone
> against base over two boots of each kernel, shows +2.4% at 16 threads
> and +5.9% at 24 threads, and no change at 8 threads or fewer. With
> anonymous memory on zram, the refaults mostly hit the tier 0 counters
> on a different line, and there is no measurable change.
>
> The gain grows with the number of CPUs refaulting into the same lruvec
> and needs a fast backing store; with real IO it is likely to be lost in
> the noise. The patch is mostly meant to keep the lockless counters away
> from the read-mostly fields regardless of where they end up.
>
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
>  include/linux/mmzone.h | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>

Thanks,
Barry

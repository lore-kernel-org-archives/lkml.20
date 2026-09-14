Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEE146DFEE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402253; cv=pass; b=FDWWQkJfEFe3pB9y9H0e8TOKZbnPrlQx6FRg1OEgNXG4O0CkXCEdH3eYs30TbhHUn2jDcUvQZaJZ9vkGg4oMlUMHTYBTvKr8FfBVb0llXUDaEnoDTuyj+9Nd00oXg93faN0PvpRVf+UbIXwoZ4UyMc+3Bn4F+jbhun3S4AQ/IPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402253; c=relaxed/simple;
	bh=ynN4ATH+92kqx24zHVCCIK4upKdL2BGsB5dzD19o/CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uar6UOq/Mm79PcoHLE2BmGySJ+I8iOE+YsWZeQQl0/Xgeva2OVJoSZp76ukjoaowLs8cH/Lip8oD4ZDQ0w/uM+zjRQ1g3vRkapLnVG2g4M8VldgFjEx2AOp/Vi/574sRYHz74NX4rYhujqpm2ijoMZzmRWf+PcYVoNo+QQ8/k6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOXtvHwv; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOXtvHwv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso17201965e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789402250; cv=none;
        d=google.com; s=arc-20260327;
        b=M1hDhb5GzqdQJZrp3zgfqZa1OAoeJsnDG3BHTmdIUA6c9mrz3B2GQY18YJn8c5a5oi
         4tX4BhL7gjOlQFX5t+WG21i2FgCDm4qToqZFzaZW/mIlbUMOc1fYZ75BtAD6Lh/29Wow
         9tZEzgAVhBfRFUPL/Hud+sSj/LMMwMk8it/nk7ZEEjlsGlCUj9Cv0854IWedBY0WQN9Y
         r1+K+QlLMvMmIfz01tYI8x0wAUOuUVXywNFXUZXFFNuP7vCAqUys/VVBH9jQOIEM/uTC
         5YpM83puVLH6U+dw9BixoH9V+47XZfcSkT/z37SCb9xt2BdYM/pOlcH+al9RHTFWdbJy
         joaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JVDJIFTFgLvCCjRsRRk9CSdls4G/cg4o7is/ZxTdK6I=;
        fh=e4Yf4jirExdwnIsIEwQB3vS/HmiwD4+M0C7J7hWFkAY=;
        b=WWCR3GISa/QWT5TZ+N5oYQQw9wIyJLlq36S47BAPtKN3aeYbyQpLac6yXgDuTTqOEO
         uh4z6BE35ne8zxUTuQCj0LPkk7rK293KLb2SlD+ZbFn7JDo3hnNxv9XWBaRnh5fS9Lxc
         MBx01OIP04yvTjj7PFzK3/tRuCtHshQpCdwa8BEeTWAH50M7cfYBbNUCTL0xlsdMSrU9
         +2Hrftz5E/KvHhrSJmp99ZY1uK5fb+KF0//+2KKoK418f3bUP1OsS4bS9Dox3IhqEQu4
         yDfVLljVkbq097tD3FVq92Nun7p9NHWvNmm1HK1Oh/uVuYF0JOv+5CPB+u2Ye0w2Lo7K
         9BqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789402250; x=1790007050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JVDJIFTFgLvCCjRsRRk9CSdls4G/cg4o7is/ZxTdK6I=;
        b=rOXtvHwv40Jr+RFB237IqvvDrxZHHbFimOteqcQo+b2v89LwUpQvaDnYTFsVrnkLCo
         H/4lXn3jXep5qC1ZrVZH948Gsp7QtJAmlYGD3Wpw0LWZTJtCIdzVBJxcLJeJUH4EYs7i
         CDEb80RK9Gicgk6gfftIY5d8DU4HfUD85MwFbwCgn6dv6PSXScjGF8h1eeaqk5KD5dBK
         ZjTJhYToaTNXfFlA8JYaaT4zJamNwN7eX1v2qkApywwSJ6IWQU3YU3VVj9MlaIuoYur5
         JosWP0GxPxTSq8F1iTRHKGCEv//0Svr1+xYmRxrcxS5eR08gT3l20Rp9IcPASomD97nY
         N0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789402250; x=1790007050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVDJIFTFgLvCCjRsRRk9CSdls4G/cg4o7is/ZxTdK6I=;
        b=ZZQMsNlFxDPEFVcrgeSswmDWFZQBIvK7tEmEz40dwrZzsnKAGQ0nUw3FcZWPjDXn2E
         edl2zAlBeMXC+OmbD8g6HCkhAUaU0+Rt0KwsHhnfeTi8wVXbUyW+yVg8qwvKzKDi33nB
         J+iQVwTXUe+ds1esg5OqGCm8yOOLALffNOHsLTmbfpdgREj1RfM3JO/3XfpAlhurn5XO
         dfoLvcWKut6l3vgt2PGpUMSDujyVx7AfM4v0hIV450QAVqc4IxersBD/oQgpYWtAV3pH
         aNCtgab6yOyN09n7LFMKqN4JKNiSeEyLQx3x8Im3h+ixC1Uuax69SS0CjViYyNuAEy8Z
         3AfA==
X-Forwarded-Encrypted: i=1; AKwUvBzPCeMwoLhqbWOtoRqs1Ye98yU75P2VAzzsxjSwnj+sWqgA5S2HjY+uwbQMcgzO3Eb/uFCtNhekXN0Ooio=@vger.kernel.org
X-Gm-Message-State: AFuF++nlddt0sVWfPGvc/rl8PlNY7hqe+HuX1D4EcgQwKUYN70h9Sr94
	Do9+pirbD9vgafME94IDqnc216iUR2ONk2Y9jKmtvFMaIeCT+XILr1oaHi2OwZ9V2qF/BxLeJZ2
	3S93F8SM3+xWU2q/buUWLOQM7rLiMqEY=
X-Gm-Gg: AYBFou23fNSH+BPd3F9ezMvrfH5ynQPtHSPWIO2A7esBi8uEshIUaEZxzXuoViNtxJh
	Qb+DjqL6dBWW6SVQxqyyk7+qCe4QeDkBDTDpbjBbodF2OVcOHfuel5ju8/7/zzXPhx9XHFnvlF0
	V3+OiAKYqib12FMpaJ0bV4E4rJ+6RKKA7M0OoDOibGJz57iqc9HCN0zTxHQtSu4ciiJgqgUjD0h
	6UaPfrYXCPRwvB8qHckvKQu9yFvXz38Rtmuv2JgPo/E33iMtdmQ7cGclPNURniUYf4s33CNEygL
	aGVx5ctYKP6MZ8tTMk63Mq355EOXSUCgZRa4898Pg887s6sVNq5TkjEc/RW6POLCqr1RWw225fJ
	Ym3qr7f4b+3NUEaT+obwmSA==
X-Received: by 2002:a05:600c:37cd:b0:49c:fa20:cc08 with SMTP id
 5b1f17b1804b1-49e7a67cdcfmr47809235e9.31.1789402250147; Mon, 14 Sep 2026
 09:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
 <aqBT_35E-eSoN_zj@cmpxchg.org> <CAKEwX=N4aaq_oD2agTUNrUNXhaYGeQ9vxu+dywFvEFgWFi4uQg@mail.gmail.com>
 <CAMgjq7AfNBUpMamcv29JFzpX=7ApNYVLtPjWT4Sm8cXjSLYL9g@mail.gmail.com>
In-Reply-To: <CAMgjq7AfNBUpMamcv29JFzpX=7ApNYVLtPjWT4Sm8cXjSLYL9g@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 14 Sep 2026 09:10:38 -0700
X-Gm-Features: AcwNN1UhGBQM2G8axnieeGvN4-f-Y8NhL0mjIZlCfhdtBbLfiYUWAueMcYwHRoQ
Message-ID: <CAKEwX=NZo8DNg70uhhd6CM0BfHH1RAkfuSQwVeTg+77a5-r5DA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Kairui Song <ryncsn@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 2:01=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Thu, Sep 10, 2026 at 12:42=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wr=
ote:
> >
> > On Tue, Sep 8, 2026 at 11:30=E2=80=AFAM Johannes Weiner <hannes@cmpxchg=
.org> wrote:
> > >
> > > On Mon, Sep 07, 2026 at 01:51:31PM +0800, Kairui Song wrote:
> > > > Where I've ended up is that unbounded growth is a real concern. On =
a
> > > > host with no memcg limit (root cgroup, and most desktop and embedde=
d
> > > > setups), an unlimited pool means usage can keep growing, with no
> > > > admin visible ceiling at all. I'm not attached to xswap's percent o=
f RAM
> > > > knob specifically, but I do think some kind of bound makes sense.
> > >
> > > Swap space is just process virtual address space, no?
> > >
> > > Swap entries already have one or more page table entries pointing to
> > > them, which in turn are managed by trees of vm_area_structs. That
> > > means rlimits apply, overcommit protection applies, and OOM killer
> > > attribution works as well (oom_badness()).
> >
> > I tested this theory. I spinned up a process, and let it spam 0-filled
> > memory + swap these pages out continually.
> >
> > As you predicted, oom-killer picked it up eventually. The host was
> > (and is) intact otherwise :)
>
> Good to know the kill path works. But I think the accounting side cuts th=
e
> other way? Won't that conversely underestimate the host's ability to
> handle memory alloc? Not to mention a lot of application are
> swap  space aware, some built in logics like e.g. with vm_enough_memory:
>
> On a 1G machine with vswap enabled:
> [    0.241906] vswap: created virtual swap device (2199023255040 pages)
>
> a 2G sparse anonymous allocation fails:
> [   46.044002] __vm_enough_memory: pid: 1129, comm: search_agent,
> bytes: 2147483648 not enough memory for the allocation.
>
> The default "Heuristic overcommit handling" policy is meant to handle
> seriously wild allocation (as documented, and it's named as
> OVERCOMMIT_GUESS).
> totalram_pages() + total_swap_pages
>
> Is the limit, the heuristic exists only to make "a seriously wild
> allocation fail" (as documented). But on a vswap-only machine,
> reasonable allocations fail. Common swap devices, zram, or xswap don't
> have this problem. One could argue that the size there is just an
> optimistic guess, the compression ratio is not controllable. But that
> heuristic is a guess by design, and a plausible number serves it fine.
> "Unlimited" seems break that.

Oh yeah that needs fixing - thanks for digging that one out!

I'm not sure the answer is keeping "totalram_pages() +
total_swap_pages" though. That makes some amount of sense when the
backend is disk swap - 1 swap slot =3D=3D 1 page in memory, so it
represents a concrete amount. With compression swap backend in the
picture it's very murky.

I think what Johannes proposed makes a lot of sense. Maybe also
keeping physical swap pages in:

pages =3D totalram_pages() + total_swap_pages
if (vswap_is_enabled() && zswap_is_enabled())
   pages +=3D 2 * totalram_pages();

i.e just RAM x 3 + physical swap pages. I think this is a
"good-enough" gate. If users truly believe their memory is more
compressible than that (and for some reason they really need big
allocations like this), yes I think they should with the overcommit
mode :)

I'll include this heuristics in v5.

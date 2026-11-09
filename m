Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794194445;
	b=Zk/vRQF+0vVUtTYinzZLk0bo8Nim+Himce8kEukvktOHa0BweID5HbxtMyVGCxnoYDbm
	 5IgoFYqpWf7PO9K4iN9abNfT+wL9VZaEvZcDioi2sg4MHl6ilj8r17VV9Ybv3HdXQa49X
	 MkOXxKIOBm3cp/QVy2OCaxzgTQJZmCHEsOpJhHOE3EwvI82BipRcNln/IbstQz2Ua9WkP
	 hE7+9StuHjs7ds9ew0D96JkOMw1k2vQP/r7HfJvcjpFm8NOMOhNsXi2wFhE071RDCusB4
	 baoeZZajawnhNlW92W1NhtFcarv+tku3C6efsSjdPcZWFgVPIBOQ6zxHhnJsWJ0gFKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sE/fNcXhZCFYoGckzt8mvo4VUCyVdxTAKOyI+l9fVSA=;
	b=A1v8lPYcJPQYOTG9v9WncgAb11y0LUXuNU/7VHpTSniwE9Lu7/nT7w4B+HSzNDD8DEoQ
	 z3avQd+27GcKBTvYrFUbVyZvJTTONB/wMxHLwsYuTvDKhpng7qMsJG6D0lV2PBH9+oSAN
	 crskV4tD2xiSuiBArGoWO5dEV65+SJ8JtyITQljc/W558NDkg3DBZ5yoloQ/EtMnJkny6
	 m9QoRtH/AT68FQDhwlWW+8HLClfr5IPmAiX//EBxiDTE+E4Z75/yu9bDoHje8u8K/I1GR
	 6riPtjqsvbWX9xjR6N22ctaM5YJIBXA9vTmju/3btCOXfX2jocYuPIXfkzTzYa6S9HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UcxeBNj7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AAA606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24AAA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UcxeBNj7
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso74539966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:20:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794194442; cv=none;
        d=google.com; s=arc-20260327;
        b=LfMR06GBwvUU/pGcMdtmEA7VG/hk1iUDnXlLLxy88VOW8DFjUebL5icPoaVfaGDxXl
         6lbykH+QyF3TKCEy79c8ZDr3wUw+vNAOn0YlQs3qW4HLG84y8ASiXH8HJQ/MHeZ9VVpP
         EZJHzUsLRzuegsFE2GdxXgyhBenCBjOpelSUmdQeNNQz5UV5MMyAjvopfzLdtngz9VA8
         ZWOyf3W626R2ZAsqHbJLSbtgRmKjr30HNDwhjRDhmvkd4kC5QZ3hFthGkJYhr/wvxuu5
         4lnPeHa1Uo2xuYxW5DzaV6S0nkBVWczpjlKun0HmYKE6mtkRRXO2IOMQ5B4vlLTcGkGS
         1Esw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sE/fNcXhZCFYoGckzt8mvo4VUCyVdxTAKOyI+l9fVSA=;
        fh=Y0dHBMEMLP1+aETu5fkpJU6lHm8U80Gkp9Cis9E2BmQ=;
        b=gteRq02gQqLVslP10QylJzzDBgHUJIyc5kpx20+DZ85DXKnIgy6awifQ2kv0vv5iD/
         z5ZbOysfT12mM1zOdwR9iFCWjGRo3iTRrfQcPTXwmxFpo6kNq7GSjUHW5FOiQcu2OrS1
         t99V9XgCnTz/lmLz5yH7EimPa1dV6hs7+WsOaIgjJERlBSPM9Tq4lUhLcphB22hU292E
         6EljLJlEAoyxGn8xnyI11y7NRhrmk556UGOAEL7Una2GdJZQ0ZD9VtiCIuJz3iutJ+kx
         HGLaTrBr4OG7frC7w7h/GS4N4UnIEaM8+aE223sZWPzCpF9BLeKQ21vFLgCi9Rqgq75a
         5wOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794194442; x=1794799242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sE/fNcXhZCFYoGckzt8mvo4VUCyVdxTAKOyI+l9fVSA=;
        b=UcxeBNj7YdyF0xz0sXuviGdjsvtnSxlpUUJWrGSHJtJTOoBy+J0FOj4ll8ZP9bOvxo
         vik1WTHEF1/YoLmDx3GvJVqmffUSEmDeVfGpMCrrLen5tprNc/re4CmgVpbL5zXZDi+s
         JcvCGqKPXWptq7MQZ4t7Ghty4NEbRrShdtDq+R96tSv1NDPWGnPsoJheMo3eykWQ05ll
         LnMBGXMrRl1VAgwh/+Q/i6vWvTiCvsz0ub39e/9oYPWqAV4f3Ihf49jvqNA29pNa0B03
         tGWjj7myt/Ws5vWFct2n+evt96mdg/4I7PgOYXFIMxqmSNlEuj5uMPayKtP2GaNXE7hG
         utyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794194442; x=1794799242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sE/fNcXhZCFYoGckzt8mvo4VUCyVdxTAKOyI+l9fVSA=;
        b=LxYlYyN5uAcmBBMTjsWYhLYAhMRF+ezNxQ0q6BrllS/mGN0QZkzqCl8Ixoz4jnhO14
         vtfmbS3OkNy4gJQcNoLEdmULgHaoTqKKENqyPOPMcHmTqZii5ibEKHYh12U/E9FbTy8Z
         CqxmnQxM68IIbbt06RS2jYVsXrIzcZyoyCrpymnIRwfnBhfNlUBF5jcHcHV49ElAMDRw
         AtaL1toxXKQMSi1PtVXCv73qVUk1/f8xuG5D0+fKPgoIXX2jxhkG4AJfuDlOyiVXTF5T
         LwnNra/jfMHbKrh2xaWf4h3FI22eYUE1hR3J1GKPCu83L7LVlZh7+pGpqQcQFgROWQbo
         aZ4w==
X-Forwarded-Encrypted: i=1; AL+hErG+eay6GS4zUNKnr3fcIJ4rbt806NuwFBUKkaeUzC9ztTA3pkvlDd+6G6aJHlXvH62FA7NU/Ewy/Nt0DFY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TM8SAED335XdyrgyimJMfADjD0WU9CVcl9oWF6DL4VTmKfebV
	MMIc5ckdDE+SkxzvV4Qfe+ZHzjUCdckdMms6aQCMbgYf5GDqB7xQuIjm7tjKRBClzPI7bA2a/gA
	pHDsk78oGH2YA8CmHW8pBFT6sOeg8oSo=
X-Gm-Gg: AYBFou07m2rdWDmjhpTMwVbwieXOBcC0+YoW5Dt5RZyfwiLvwdfcS7FWs7EDVFuG28a
	uiwOj2CJbM+lFyX5cebhqO27cJ7TKDscnAiEUHvO5EroyIQTvHiWUABjbTgqHZlVMMDrtf+OQ1k
	tq6eJbc/EOhQgytlDgXLlBMxMraKMjDlB3j66B+lrfXf5bmnAWHAqybPKd6Id+reCTRQX5SfsMB
	qlG0YYdHV8L4LMcnmDC/MFiynuXmLxLGE3r0S7gogotZrjvxSrUyV32pKdyH0rgImy+CDS/7VxV
	34iLtWbQnk/Ho6lhfu6w9HeZy1BLSblIpR84XfZKj3xcpAF9dy4EiXmB0YmW73up21ZJKEv0DIb
	1hP5qoEt1zSBgkgYHO03gYfvuPHl/sPSfsAXQx52SCeAw64V534U1ZYvSxyusjVzN+zYu
X-Received: by 2002:a17:907:94c9:b0:c26:1cfd:4244 with SMTP id
 a640c23a62f3a-c4d525794f8mr366547266b.11.1794194442101; Sun, 08 Nov 2026
 19:20:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-mglru-fg-v4-0-2106750c0bfa@tencent.com>
 <20261016-mglru-fg-v4-12-2106750c0bfa@tencent.com> <CAGsJ_4y-7R07wFJTY2a8tMQ1xvG2kjuG0Q1rLjx8DOg4u3UwZA@mail.gmail.com>
In-Reply-To: <CAGsJ_4y-7R07wFJTY2a8tMQ1xvG2kjuG0Q1rLjx8DOg4u3UwZA@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 9 Nov 2026 11:20:04 +0800
X-Gm-Features: AclHuK8iUb9Dq3WsbSIlLK65gh2Lc8G5m0UCp-qFnn41-FIR3YsEFvqlSwVsNTk
Message-ID: <CAMgjq7Cj3dvJf8JCkLacGP0=2bPv6WR1sjOD4Ese7XeGP5VhAA@mail.gmail.com>
Subject: Re: [PATCH v4 12/17] mm/huge_memory: mark folio as accessed more
 accurately on split
To: Barry Song <baohua@kernel.org>
Cc: linux-mm@kvack.org, "Liam R. Howlett" <liam@infradead.org>, SJ Park <sj@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 6:15=E2=80=AFAM Barry Song <baohua@kernel.org> wrote=
:
>
> On Fri, Oct 16, 2026 at 2:16=E2=80=AFAM Kairui Song via B4 Relay
> <devnull+kasong.tencent.com@kernel.org> wrote:
> >
> > From: Kairui Song <kasong@tencent.com>
> >
> > The behavior of updating the folio's access info isn't consistent for
> > huge mapping splitting or ordinary unmapping. The page table's young
> > flag has to be translated into folio's access info.
> >
> > Right now it only check and set folio's referenced flag, which isn't
> > enough since folio flags update on access have its rules. Ordinary
> > unmapping (zapping) calls folio_mark_accessed(), and it also checks
> > if the VMA has recency to avoid false updates.
>
> This might be a bit off-topic, but I once proposed
> recency fading for the zapping case in Android workloads:
>
> https://lore.kernel.org/linux-mm/20250514070820.51793-1-21cnbao@gmail.com=
/
>
> folio_mark_accessed() might not be ideal for Android
> apps that are being killed, as we expect them to be
> relaunched only after a long period of time.
>
> But for the splitting case, I guess there is no doubt
> that the accessed state should be set.

Hi Barry,

Thanks for the review.

I agree with these points. BTW that recency fading patch seems
interesting too, but perhaps we need something stronger than
folio_maybe_mapped_shared, maybe folio_maybe_shared, and do that when
"current's cgroup matches the folio's cgroup and have a ref count ~=3D
1"?

> > @@ -3216,8 +3216,8 @@ static void __split_huge_pmd_locked(struct vm_are=
a_struct *vma, pmd_t *pmd,
> >                         folio =3D page_folio(page);
> >                         if (!folio_test_dirty(folio) && pmd_dirty(old_p=
md))
> >                                 folio_mark_dirty(folio);
> > -                       if (!folio_test_referenced(folio) && pmd_young(=
old_pmd))
> > -                               folio_set_referenced(folio);
> > +                       if (pmd_young(old_pmd) && vma_has_recency(vma))
> > +                               folio_mark_accessed(folio);
>
> We now have two inc_refs paths:
>
> - folio_inc_lru_refs_walk() for mapped folios;
> - folio_inc_lru_refs() for syscall accesses, or possibly
>   mapped folios with the appropriate flags such as
>   LRU_REF_MAPPED, LRU_REF_EXEC, LRU_REF_FORCE, etc.
>
> The interface is:
>
> void folio_inc_lru_refs(struct folio *folio, unsigned int flags);
>
> Here we call folio_mark_accessed(folio), which is the
> syscall path with flags =3D 0:
>
> folio_inc_lru_refs(folio, 0);
>
> Are we somehow applying the syscall access policy to
> folios accessed through the page table?

Right at this point I'm just trying to stick with the current upstream
behavior, and not promote these folios aggressively. The results are
looking OK for end to end benchmarks so far, maybe they can be tweaked
further like a LRU_REF_MEAN so it won't promote them, just inc the
ref, I didn't find any oberable differenence at this point as THP
alloc success rate is very low when under pressure so sticking with
the current behavior seems not a bad idea.

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792699080;
	b=qA5aF0SqSrysVRZfxpDZ/3juTJs4DghZyWFu3xnL6Vo4yiI7FvoUBwwAtMPKl/QSY6bq
	 ln8taBevpju3LECOu95+tYCex7H5ISzfOh88VSRiXywaMlFQqWmQ/ROIXsShtavIxKwNV
	 BEw6KPTt9HCHxcN4pndNiDfYKFH+SgnBJ0TkLdg+pNMj2udze9AO46WldkgLkcn+d4j58
	 6UUB0Ov7Z/pJ5z7PcYTITxtMtcAqImjv/rrSsz5Ng9FVEs89MdsvZRkroPz/rIiVFYo0o
	 C/q1mUu4AOdqwEd3Eh0rqVXtDOTMjDc10PBVOm/AqSnJP6SdUT43y8OYHGkX81pXRVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7hscKTf4XlzodRG94Ygsf46yIAyJRuA/Yo9qi+4i8HA=;
	b=PikFSrHbhJot4QP1QIrS4sHsR0kNzJzj3yN6laJdpSyY7hEreVQv0568GdSkbKXaB33O
	 t9SQnzvhX5b58WCVakI0Qnri+/IxrtIApDYLiZ0NXkAsOid+SpaRHWKt0rSxk9fs4DDVo
	 xe8xU+qIgF+pzoN8StE8h9+04cHwvjMf03Is6d2UQ9tYrPGjg8hB2u+aKQLO1+YEXeE34
	 HLRK/WlbOGi7xNMITMfSubS8rIe56dPmN+1Q2IQnasb/00mi0d5ktrAz8Pk01hChRWyq/
	 tX26GeD7klnI1vRTSK8+Ezt/vAEbWu69h65j2qWiAcv71MKy1RVu5sZnX0HDx/pyYFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y7AqsIbm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAB3606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DAB3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y7AqsIbm
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so138789f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792699078; cv=none;
        d=google.com; s=arc-20260327;
        b=PIbJpbGc66hpYHnXZn6H3KVmYPNG8+wlgAhFE8t6349o5dWC3vWuMd1a0rUCrd2Hwr
         wnA/+ok+HNXAas+LVlr60twbVElA4tpVyT7eHXIn+vRduxFCJous9+iHImJS0Gmv3qb6
         3uFlhVj5WwIQAwwzBInLM7DX0SiV1vA2spVBTYJHavKZMjYQm7uxZKhQ5UvrOIpre8E2
         7pfgQYFsGn22Rp0kzfZAuOl5ztYppDUSJN9vA1Ogrs5G6dpfEUi5v3zYLFbFMIC9HhJE
         P5/8IDQAox05Rlgu7R8A7es+J6dAmTY2Tp5EJCs2kiLT77567Pb9QpVQeGsY5eEkbyBD
         Mciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7hscKTf4XlzodRG94Ygsf46yIAyJRuA/Yo9qi+4i8HA=;
        fh=4TaDkirfXjlEkLPED+vDY7rYB6nWRI96aB9tr1vxHbA=;
        b=YicgEYbxXqBI83wCTOGAzT8z63VhkARj2W7f9skZg32TyWpky0y8u0Go++jkf9zbxT
         vXxmqfYUEDPeZz+Y9Vm9SY9hLOTGiIkYaDR+U08hnqaZ9HxefJSMD0tXimb4w3oUFxUr
         mYeYWu85lhAirVtYS7iWLlxim795eqDuV+XdqM6DtxZ7RLtfzdI8hwizjGwQRr5AmcU5
         iaxy98z8e36jgS44dgL78g7Vl9CArf/RAan1Dm3gsNwtDXZ7m1p6eFGetWBWlbmCouls
         3JPo32q31mEIZYw94TZc9VlxjjUtSs8An2Ifc1+Awo1CZe6G2CUxZu3gxoYr3nEWrsEQ
         F9Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792699078; x=1793303878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7hscKTf4XlzodRG94Ygsf46yIAyJRuA/Yo9qi+4i8HA=;
        b=Y7AqsIbmhtEQ4Hs/P1qMLAZQ6fgjc7trwcBsRt6mD+kcM7qO1jXqFV5veArSpiC2g1
         TxCTebIFHry/DdIx/N+J3fPuB8gqnAF1i1TrIiu2NvOzUNhSfqLGAs/DoQ/q84A+mud1
         le1EHm2HtmnNd9+NuTmCmOPwtsW9d1rkbuGyp+5UaIYT8BtxdLeVGk/HXGq8emMDIz95
         9/XlKux53u8Q3EE+9yQjZKv9fCiyoXVsWzQ2YJ3atfcARU8JK4T9PAt+v9oDWRNfGIT0
         5rT3GxV9EEIYloTSpmhx2xhauzH143taTeWT0ZalWqpwvk5SRpls+G4Qj8BUIXMDm71U
         2Szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699078; x=1793303878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hscKTf4XlzodRG94Ygsf46yIAyJRuA/Yo9qi+4i8HA=;
        b=G5lCZffQitj5IfG5Qi0G1u25YbpgVYXQMRwzskYn3BeSvml6cwpVlLBNngAI5u/Rr9
         h7ASPcpGiYwSEWfkXfa5PfSAnb9k8ywebg9MXDH6vOGYd+VWYRsCL4cXSOSTpvu74SJx
         YnspUg7nj3sBSUV80O+tbP836ysMi6wOsFZftV9kbjZXcU60FLUkmg7nfrfd9eFHv2+p
         KZU61QHffZ9CuI9hrvc6s/nkb4jZdYeWg/yn4a1mfDvfQmi7IvzZkpj/TgvlFb36E0Wg
         kg529QMZ2xCv2z77TBfuf2VsewQpy/MC+H7sPB9LZAO5cR6oVjEtK06ZSIEUaLgRNS6A
         ZH6w==
X-Forwarded-Encrypted: i=1; AKwUvBzCsTjBXuqTPuCfJ216fq7HdlWpk3xRzSefeec79GD2tMvl64AKIaYFgwGCQm20OOX5YoOy1blFHcfClg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJV8LaOQtRWH1LUZ1puvRo5DE5DVwCsEmLBHUI/K861Mca3ssLp
	/lC2atAH1FR46BUHh2YCRLQqEHya5w4KVnFk0WOD9LTVxgp7GsMpemXruAVJsDJvAmNRzYEytRL
	8l1StlxJn2AcroiHn20gp14GcKqVQHZ8=
X-Gm-Gg: AYBFou38VlHgDLPzMwV6UKTy8LRjgkuXx8Bsc/Vi5HGWWom8ALgtzO+KsRJueLm9rM/
	JX7b8keQq/NxNDG9kf9uyemxx1kuBzZ+udN3nU/MP1bKBX87kZqh6Y/l04TTjQqdTsn8G5v5965
	+RCJeeiSaJQ2oausXy1B1FhE3aM55048f4+gFU66NewiM+5F4nslMkck15nD4vgLuGgw1mBj9f9
	chNuHPmPMmLJ7L30WkHqD398970x1JvJ8dEmhKC//hmYJ2Ga31CcjjtQttjLK0XS/0TMendvXSl
	+cITEqS0iMiFM9+MiFtzHBxNtzXY1B+nnQBz/nXvVH7LFIrqDa9NzpHrmvScRwCbOEC/ssu0wh0
	jc9Nv+L6k6MT88uQCKw6SgRnFwA92hE/7qFd90I8GzSO6gT2XBVnbxqbz/vBoDRIhaiAOzYwLtT
	j/6h9fkVqI4N4aSc9SWq8jQ/HNINaUTSNcAohIWuIKL5rON8sx8GO8
X-Received: by 2002:a05:6000:22c4:b0:48e:3697:708d with SMTP id
 ffacd0b85a97d-48e369770e0mr1492084f8f.12.1792699078144; Thu, 22 Oct 2026
 12:57:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022145615.2184343-1-alex@ghiti.fr> <CAMgjq7AB4wUzmugV3n4mhWcYqMKmhoZJCDV2uUagFjZXjUUi3A@mail.gmail.com>
In-Reply-To: <CAMgjq7AB4wUzmugV3n4mhWcYqMKmhoZJCDV2uUagFjZXjUUi3A@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 22 Oct 2026 12:57:46 -0700
X-Gm-Features: AclHuK_UzTcMr7msR_WYzh_P63N6RSYUJfSh6wr5YsFhVd3E4AmVHYZmGVyiC2g
Message-ID: <CAKEwX=OgEhyVHdGaRbVADGS2E74nFdpZeT9CLup7kZ2JG-QJtA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] mm/swap: keep reclaim batches contiguous on swap
To: Kairui Song <ryncsn@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, 
	Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 8:27=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Thu, Oct 22, 2026 at 11:00=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> =
wrote:
> >
> > 7.3 regressed swap I/O: for the same swap volume, a workload that
> > rewrites swapped out memory sends many more requests to the device.
> > mysql/sysbench in a 256M memcg swapping to an NVMe partition, 7.3
> > compared to the previous version:
> >
> >   device read requests per transaction        +59%
> >   device write requests per transaction       +27%
> >   throughput, iocost off                      no change
> >   throughput, iocost on                       -19%
> >
> > Two commits interact:
> >
> > - Commit 9a42aed48421 ("mm, swap: prefer nonfull over free clusters"),
> >   in 6.18, makes order-0 allocations fill nonfull clusters before
> >   taking a free one.
> >
> > - Commit 3cedb745d354 ("mm: clarify the folio_free_swap() for
> >   do_swap_page()"), in 7.3, frees the swap slot on an exclusive write
> >   fault. 7.0 to 7.2 kept the slot, but only as a side effect of commit
> >   4b34f1d82c65 ("mm, swap: free the swap cache after folio is
> >   mapped").
> >
> > The freed slots leave holes in full clusters, which then go back on
> > the nonfull list. Reclaim allocates slots one folio at a time and
> > merges the writes afterwards, so a batch of LRU-adjacent folios gets
> > scattered over those holes and is written with many small requests.
> > Readahead later finds those pages scattered as well, and needs more
> > read requests to bring them back.
> >
> > I tried three fixes, which perform similarly:
> >
> > A. Revert 3cedb745d354. This keeps the slot on write fault, but undoes
> >    the intent of that commit and keeps swap space pinned under dirty
> >    pages.
> >
> > B. Below 50% swap usage, make order-0 allocations take a free cluster
> >    before a nonfull one. This is what the allocator already does, at
> >    any usage, on swap devices with discard enabled (swapon
> >    --discard=3Dpages). It is about five lines, but the threshold is
> >    arbitrary, it stops working as swap fills up, and it applies to
> >    every order-0 allocation, using up the free clusters that
> >    nonfull-first keeps for mTHP.
>
> Hi Alexandre,
>
> That's a interesting problem. I think the real problem is with commit
> 9a42aed48421 ("mm, swap: prefer nonfull over free clusters"), right?
>
> It's more like a balance between fragmentation and contiguity of small
> order allocation issue.
>
> Perhaps we should instead always scan the full clusters and revert

You mean scanning the free clusters?

> that one commit? That commit was only following the idea of keeping
> the allocation more compacted for that series, it looked good at that
> time. Since fragmentation issues can be solved in other ways,
> contiguity seems to matter more for large physical swap devices.

Hmm what other way are you thinking of? Physical swap space compaction
requires vswap, which has not landed. And we'd just be kicking the
problem to virtual swap space. Sure, we won't be failing allocation,
but that would still increase the memory overhead, scanning overhead,
etc.

I encountered this myself. Remember when I wrote my own swap allocator
for vswap? In one of the version, I went for free clusters first
instead of partial clusters. It fragmented the swap space, so I had to
copy your homework and went for partially used clusters first...

Anyway, maybe I'm wrong - some numbers would be nice here.

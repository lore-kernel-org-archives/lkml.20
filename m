Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793021938;
	b=QlMyyIjAn8Xk2NllM0zJRM9ZQwOgeQtgr6E8BK76u6bXizTf4ev7cLXMtzMJ6bpFuhLq
	 XKX9pxP9ZRgXHIZDo/yF5txoXoxyDCnOwpGRrU7UOrqMimpN2QnzaGXpN/myakvIulbjH
	 bzPfowBZ8WYqE9nI284Qm+LnM89Hn/EJ6ArdoJHhP3908YI18zHXh3yTWf6JyZqo8d6B9
	 dCDkxeVLkHAF0ZFMGVgrsIrkdQojtN77d1WRQlEQMO6EfCh38Tc/9VqI6UEEl8jumFwYZ
	 8V+8kqPHPRnnQ4J96sP2LvI8eqOXTuZhLe/tsW/J9wXJR4cIxTGvdRlypqGHTAbe/jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ia3WxArLDuCPrww14fZWiIGW/gcvNKfDorKU73bhn0w=;
	b=2dNNPb5ndZz2v0PZWEdjdj8Xxgsx1Z0RJXD3MEmv/mR6fTTNSICkUJ4Wp8i1HBJahy7a
	 J5pQuNn6kyJGvGkzgd+kK01wYvYk/hTHlOoA/NTdQ27lBTXS/PTaWM8C5QTBy3kRTVYVi
	 aoeXvybgxDm5Avj+X2dQZL12oBDcUjJ8p84yTnm2gLD/foKL7BuYL/BOauIel6KS+XYwN
	 ulHUEUVJPpwl9tGu5op31Q2sGlLGr7x/et+WDO1ECgiRLns39d0YCPA7QXbLRlXvySv38
	 WnEUlv3h6TjXyU4rhnkZlAimJR1IFKFAltLiEEoppMs6ABg96ZhEQke/KOKA7lRVtWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hYhRefqU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5719B6072CCE
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5719B6072CCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hYhRefqU
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40f29667e6so480216566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793021937; cv=none;
        d=google.com; s=arc-20260327;
        b=go1JwKJ7n1jw9TUq0uOL17bOuG2or8QYHlVqvkd1Ip3RmEa9qSur3+MKnYwlbvw0yM
         cPPROIoh0ACXrrBEIH3DSMkEoJfMRjCLArGnJj+NHNLKGeEuB26NzcpXYZYbp+jLXt35
         0lsVpXfcdU1r2so3LPD/93vmdE9O0PSUN1eytSEMYxkUzwbYIfRwuzo7RJHEnpoC4KRS
         Gfz6Q3ZVrAbVl6X1Z8PDeo2dN4h2EDXMeAKVf3U6L0Ftn9VB13q8XrEwu7ELy8rNJBAm
         reXj5ugjiBlbtO7aKvgPP0eeJOusEf2Q5zKbkNomIqVsyLFi0IhFwiGHMZplhi6QfXYC
         2RAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ia3WxArLDuCPrww14fZWiIGW/gcvNKfDorKU73bhn0w=;
        fh=x+doBB6+83AqG8rn8LRJjxmMTAmcnl+94zD2E43qxO0=;
        b=JLCZCCovBCFCWLMkZ3WlDOv2vhENXP3H/mppD4GE7lilLWqUoCdyXwzChtivj0yw9U
         o81+p1f7GLR3iChWfGIDKLmYzhT/S3ZnosF1ZCBvUAf1n8QKafPTRSJ0wJcSOsa9N4tj
         NI3XlcHQwEWBE1iTN1oMakDuMAXnBjobqw5B1Q14LxF0ecME6/zQHMjIJxmgdLdnckqx
         p2QiwiwPib9s+dRa8KTGuNQLfFZIq+4n0Uqoh4chX3rwOhtpZeM0teHFw9NN4onbM4pi
         zp/ZTWef+gdc7TxWf39JsIaZGosRe6jhPW4dNclKbEwAgBBVqZX1E6lKAoNTgnJjM9cE
         hHJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793021937; x=1793626737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ia3WxArLDuCPrww14fZWiIGW/gcvNKfDorKU73bhn0w=;
        b=hYhRefqUw7zcvdTQF9mC89+0FHxZJKSarmZf8+8Ph41pSwPYuuDFFcW0d+1I8K+WYd
         hlULpPNHBoOxhBnAM6INrTjWYsFwVBP+eSKSXSzxnO8dbHbZ52MPheMs/uShOm/vJ3tX
         6ViYSpRn6tnSSAeS92lG8vsFBQhU2fdl9U1iX0p1bFEwalD4xlGKMdYYtb8U+YU3m+RD
         p4+8KTNmAElpsZxMsz4CodN89vC1hcJiUTwhhcouEUhFVuztwUfBkAGIIpRVVd3mugd1
         nyZu4KIKqRkqSGbvhKk+e9KezDNZ1bWIa3F8GTiYh8gjdRlrpnSyeXbMKz0u3Smp7yuj
         uGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021937; x=1793626737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ia3WxArLDuCPrww14fZWiIGW/gcvNKfDorKU73bhn0w=;
        b=faWN4dEmjOzwyU4pPRFrcFjuk6AszOAmKZ7fTmm40q1Fjgz8TA1wifY7MJwT3DUf4O
         0sSFY+TP1X2zz/mFq+7JWVnbppVkvcorGquuvUWAGNgu4gvElDgbp/LP4wq2Gd4EZDvO
         1lkWRErTXyO2s7UagWByuMZUaEDGg7HiRfYkxb8eRu4/sPJ/hsVCkMMU4EiT08iB8r/Z
         +lxZ6LMf2XX1z6iTsBt0RiUD7oys7joYuPGnAUbPnE8ZjpLa/hheGc5AvttTAvHQLKQu
         co7Wd15yc5Hq7/aYzNs5Lb0MW/eSouI8cw5h/mxnMNZpXIDgg8hZcQs/Pdu81wv2BZPu
         h1Lg==
X-Forwarded-Encrypted: i=1; AKwUvBy5ycswiBmKF4p4+/avge29riPfbaQhqNPdbT7HYs1rRLN1ppLfhz2unCRf83qY7XxNtg3QnhqzWfXzUtQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt0fsrdvhMY3qQZ5QUk+4mmhHmBzuQfTSD3pa+YrN3Y0UjJwiY
	3Ngj2M/EHlXJWrG06ZtnP19rojxkg6gtW3CXh7F/88wP3sAtzybp86K0C43N20FPwERts3h5Wd7
	VuzATYTA5OFNWsDuSC+s1GDsTypyxVYs=
X-Gm-Gg: AYBFou1aCvAHdPlr+D1tCZIk7A1urqeXBicQ0BKnG4iZLoS55izmLX1W4elLVWY1oGT
	xTqOHIAEoY7j6W+p4DmhpQDAlumq5NsL7n+kq283qjqjD/EqYdJohY4Ba2A8q8c3Lp+x1PRDSDK
	fDNs/XmhQrYMOt5N0h3dU8Bt5oyqVl/BUUq4AqsEJCZ+9/XQfozju+WF5KYT4OMb1n6izvclNvj
	jlqCet+cd48PtAyf5/uhAo20EDPPQMP+Y8YJFFWL4WD9EB1SzBSu51aDiK7nvt+7WT+xNAWD6A/
	klIPfSVlGYrPw7Q13zZ6QTIQk4BBah/LwP4b9AK6jnH0faeQo54nkrL6Z1SpLoJa9I8ZXfE+fxy
	A6BGaRDc+Cwalas/E6UjeTwzSvwN+FOahiGXPDzvxatDWqEsQzD7Jd3dW3MMKi8Vt/EABzQ==
X-Received: by 2002:a17:907:3ea3:b0:c42:4750:8d33 with SMTP id
 a640c23a62f3a-c46bdc5a852mr799429366b.28.1793021936432; Mon, 26 Oct 2026
 06:38:56 -0700 (PDT)
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
 <CAEmasaXz2GGoy4dyhbo9Em95Cnz6QL3u2fcnAa2=8pJOOJyH8g@mail.gmail.com>
In-Reply-To: <CAEmasaXz2GGoy4dyhbo9Em95Cnz6QL3u2fcnAa2=8pJOOJyH8g@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 26 Oct 2026 21:38:18 +0800
X-Gm-Features: AclHuK-mv42vSP0j_QUAw9kHH-YjfqEHToFq35eWyV0ENcI-qXQus23q6x1_16E
Message-ID: <CAMgjq7BjOeboPMP64PfGDoY4yMGq0xR4E4Wa66U0+gsd2tnu+g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] mm/swap: keep reclaim batches contiguous on swap
To: Alexandre Ghiti <alexghiti@meta.com>, Nhat Pham <nphamcs@gmail.com>
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

On Fri, Oct 23, 2026 at 12:17=E2=80=AFAM Alexandre Ghiti <alexghiti@meta.co=
m> wrote:
>
> Hi Kairui,
>
> On Thu, Oct 22, 2026 at 5:27=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > >
> > On Thu, Oct 22, 2026 at 11:00=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr=
> wrote:
> > >
> > > 7.3 regressed swap I/O: for the same swap volume, a workload that
> > > rewrites swapped out memory sends many more requests to the device.
> > > mysql/sysbench in a 256M memcg swapping to an NVMe partition, 7.3
> > > compared to the previous version:
> > >
> > >   device read requests per transaction        +59%
> > >   device write requests per transaction       +27%
> > >   throughput, iocost off                      no change
> > >   throughput, iocost on                       -19%
> > >
> > > Two commits interact:
> > >
> > > - Commit 9a42aed48421 ("mm, swap: prefer nonfull over free clusters")=
,
> > >   in 6.18, makes order-0 allocations fill nonfull clusters before
> > >   taking a free one.
> > >
> > > - Commit 3cedb745d354 ("mm: clarify the folio_free_swap() for
> > >   do_swap_page()"), in 7.3, frees the swap slot on an exclusive write
> > >   fault. 7.0 to 7.2 kept the slot, but only as a side effect of commi=
t
> > >   4b34f1d82c65 ("mm, swap: free the swap cache after folio is
> > >   mapped").
> > >
> > > The freed slots leave holes in full clusters, which then go back on
> > > the nonfull list. Reclaim allocates slots one folio at a time and
> > > merges the writes afterwards, so a batch of LRU-adjacent folios gets
> > > scattered over those holes and is written with many small requests.
> > > Readahead later finds those pages scattered as well, and needs more
> > > read requests to bring them back.
> > >
> > > I tried three fixes, which perform similarly:
> > >
> > > A. Revert 3cedb745d354. This keeps the slot on write fault, but undoe=
s
> > >    the intent of that commit and keeps swap space pinned under dirty
> > >    pages.
> > >
> > > B. Below 50% swap usage, make order-0 allocations take a free cluster
> > >    before a nonfull one. This is what the allocator already does, at
> > >    any usage, on swap devices with discard enabled (swapon
> > >    --discard=3Dpages). It is about five lines, but the threshold is
> > >    arbitrary, it stops working as swap fills up, and it applies to
> > >    every order-0 allocation, using up the free clusters that
> > >    nonfull-first keeps for mTHP.
> >
> > Hi Alexandre,
> >
> > That's a interesting problem. I think the real problem is with commit
> > 9a42aed48421 ("mm, swap: prefer nonfull over free clusters"), right?
> >
> > It's more like a balance between fragmentation and contiguity of small
> > order allocation issue.
> >
> > Perhaps we should instead always scan the full clusters and revert
> > that one commit? That commit was only following the idea of keeping
> > the allocation more compacted for that series, it looked good at that
> > time. Since fragmentation issues can be solved in other ways,
> > contiguity seems to matter more for large physical swap devices.
> >
>

Hi,

> Oh, okay. I thought reverting it wasn't an option given the good
> numbers the patch provides.

That patch is 1/3 of a series, that series yields really nice
results, but that one patch plays only a small part in them. Or
perhaps we can limit that to SYNC devices? I hope there are simpler
ways to avoid the problem you encountered. I think the ~4% reduction
of 64k mTHP failure is kind of trivial compared to the problem you
encountered, and 2M swapout is still not easily doable, as the
main blocker is from the page allocator.

>
> What are the other fragmentation solutions you are referring to?

Right, nothing has landed in upstream for that yet, but with larger
swap space the fragmentation issue will be largely solved. And before
that we might be able to sort the clusters by the continues size of
slots on it instead just blindly move then back to nonfull on any
freeing.

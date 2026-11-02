Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793612526;
	b=Vn2jnebb4atOhh6WpsXo1I6xDk+FCem3GtQH7+ShpuDfL/BVozLSoDtMjjKV4MDRxHRC
	 qTqfJzQgKLp7ukYZe6MLp6pC5oLgiynX0Rrs/DTNYGFSMOA4Hy/pT0lLVJ/uyIZI9jNz7
	 0upugqF+dc2/fUaD/KYhMdzuGaL1FKPBabZvMrLy8/ztxkAdLXMbRw9p+OH2co6WXCORm
	 0Uk8/LeNhRMQh6CsfTHPz2DiTiPXPSC2LTObCek17nDai4YXuw1J4mXu62LaiyA6Zx9wQ
	 LLj0AbxtxWu8IgEpXMIpebr6e4lqCVkuSZPWxrdn9pGklAJwsshKLNAVqXdQsThewYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=/hV4Hnpm2VWLJSnk5OSmTN0Rwaxm8j2FGjnR6RitV28=;
	b=OVLPMSHFEUyA9xq+DPNXFlZ+KW3oc2TMgzzUTl9JC8YLQf5WdcszRPe70dpcLTekw38Q
	 YPXjRjTf8Gr6Kfaht6u1s4XyRZ8Lru8jRf0xjo2wp2w4hDR4UwdY3l/nxFPizSAja+mR3
	 GVTd14+brn/yVFacg6ZTCIdN/MGZaklC6gx0AEVk7O5Wi4s0OaRq66GvvL1gNZlYHgTMe
	 js4QRKCvcRuhHA+FsNZe08xMxTqe4+ZyLxjzyO2ajmzwEG8pb5RFLTJ5zV1xw4zaGOVSP
	 nzz6BNUBg4G+RzWu2k+ic7cemFBj38sJ41+qTOOeqkU8BgVhBdgUhmu/4776VF5kIFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=U0N7v0Sg;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3BA606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE3BA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=U0N7v0Sg
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AaSQ2955840
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 01:42:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=/hV4Hnpm2VWLJSnk5OSmTN0Rwaxm8j2FGjnR6
	RitV28=; b=U0N7v0SgwQxHQ246GVeanalPcEONeLCxzU5siSRRWqCa+hdN/RnFc
	NvFgGyNqzKStZCzCekswqNsvCo7cJ5ZOUpuRtrO+QZAleGd0ddpswuABA4qavR1c
	pczD+Oja7LoBG81u7uSQoTvOqirMp0Jat9ecDP+/4hEK5yWrGIF8g5wNeUY9eXUw
	ze8tL9r0TW9eY5n6Cv7tsksy1Xis4yjUE/C0nHh2TIRsx/mSjNnCCBt1c4LfxZVL
	uZDSkP+DoqjGU34+Dk3oHKiaG2v2eoKi2dncDmURL3LxtQTgMgBaPrN2fESmBt7w
	pWelAoq/Y84/cqIKjSpDw7rlx+tKoMXjw==
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hnde78m1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:42:04 -0800 (PST)
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b4bd886687so3369300a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:42:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793612523; cv=none;
        d=google.com; s=arc-20260327;
        b=JnZ1jqPGG8kyQyq6o+J2CQDen0QgdvnMpL3R3AvYwiU7+jwSMWGKkVDU6kD8ob8rX8
         sXsvQjLYRkICkxmsV2xAcGcmwDVNqEm537kbMoiGaHEfwE5N+t1m0TJKCVMyfBKwt/ht
         nI65qCyAHtUQOv27neHZXlI+Rq4scaD6/M+boRm3VSSWyAzCb79eToYJBHoyCU1ePE4q
         jm+neAYiqJ/1YL5uOqEESJLapLnYWd1KCNC36DHDlyjFdz7Ui145C4LUGWMxXRZe1bym
         3y9agO1cDjqBs5We0n0hkK67yi7QypGmjn43sA5T4JQhR1jBg48rUjO8J209+W3lmZgT
         FZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=lRigYOwxo9HQkB/bmQdmGkVxLN1nL2Qp3TqgTnuUPG0=;
        fh=nRjWg7/HZ2TdR1wBquaPgoyn5Jzox7gd0wLGLHvYU8Y=;
        b=NLogaSrqvbSuRK3XzwuXCNYbm/PzRUdhQRDF0OhhsR3lMHYkK7EVUhM29HMrHGnRzQ
         p0xX93UJjMeLsmWk7JCSZCJ4t9UT5Qi6SdAHFTqDMyi5suPl+Y9f3z9X10E+n91U/lXd
         M7oUfPv+CAWBWBno+4mZPglnHHcKgR+S9QsGrWiB73RU5NvgWQr+oPupIeX840BEQMmb
         qeS9iKgfphnx/PohrhQWZ7CGCjU52cEDQXao8xBAYekirEqDn4HaxBjvR1nDSY4XgvZD
         IL4ggvv9fuBfhO2K3eJ/44sUQr1FHC0p+TeBaFEhBNhxzlE2nKb56B+gncwAVx35EjaH
         TNFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612523; x=1794217323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRigYOwxo9HQkB/bmQdmGkVxLN1nL2Qp3TqgTnuUPG0=;
        b=QnGoupcHDA6EFjAADxZ9mNEigyyaWKUd9H3htjcwJ+YH4AChh8/A0qG4OGkJKj8BAP
         hU+KWrh1RQ+kgxKIMKJsVr+Bo7hEpokfbtpdROrp7MuyxGGmvP+aztNx74C281hsVhhL
         1CpQFYbIM6c/eM8DEyMMeZW5GPEy1dmZ4aDC1Wt4kFAkOGf0GlEZ8ikLSU2HIHtZhHIl
         tfAT2hjEM/egKo+2IxIHgqSIhR90tjmHpfAOqPCSuhYjqHPgC0GGBWHIV+N6zkTMAWT0
         /BtHmC1djf4XpbI28Cpyv38G85BghnWrkNTmLB966vX6RfBlHlyoJbj0X2L1lGUgxhXu
         XdlQ==
X-Forwarded-Encrypted: i=1; AKwUvByIAC4tErIjsOFGQQRtD28DEbQMfa+jf5h9wLoSSzU134WvfF+PXyPg9weebJHjCuN6aIYQ44gH4J7hVlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HCHYuzXbgDUepXmKgkfM9hV3b8EymK25Q1rVoPNpHH8fY2rOk
	yeQ6Le5sw6YE+eCq6sYsboEgQlBNpUotRhvJsXR33FJZHn/IQ1zsvJ2PZvMkgxMnhxkONhBwI9V
	poBRMVnsgm90/TpayyslthvU7SWrF41O0OwfDAep3ESfWF2YumnXk5E3ukmJMqWSnco/A+g4Jfo
	4Qlzy+p/lQjAk8i2dciMNY8HcDUpnE7WR6vyFKWcc=
X-Gm-Gg: AYBFou3FpB0h0jlAOGoXoWCQOl5dswElVFynwHKfNSZJ0U6074+BH3esHRYklSFB2CX
	K2KM3jywDaqUp12ARj6auaw35F/WEwJHmCrTo9kq8syEur/Bc+ZwVlPTjQ9RVB+EBto4m1xfZn9
	rwqPGwqqoAqZh7maQRuFH/1SrLSQD4mDSGPm26E6yNfIr+XAKQKEJNa6V5taEwKpltstH0csigc
	CjXw1nWGze5rB9f+A==
X-Received: by 2002:a05:6402:160a:b0:6b3:d0a0:39c3 with SMTP id 4fb4d7f45d1cf-6b4d487b106mr4570097a12.27.1793612523244;
        Mon, 02 Nov 2026 01:42:03 -0800 (PST)
X-Received: by 2002:a05:6402:160a:b0:6b3:d0a0:39c3 with SMTP id
 4fb4d7f45d1cf-6b4d487b106mr4570081a12.27.1793612522721; Mon, 02 Nov 2026
 01:42:02 -0800 (PST)
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
 <CAEmasaXz2GGoy4dyhbo9Em95Cnz6QL3u2fcnAa2=8pJOOJyH8g@mail.gmail.com> <CAMgjq7BjOeboPMP64PfGDoY4yMGq0xR4E4Wa66U0+gsd2tnu+g@mail.gmail.com>
In-Reply-To: <CAMgjq7BjOeboPMP64PfGDoY4yMGq0xR4E4Wa66U0+gsd2tnu+g@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Mon, 2 Nov 2026 10:41:51 +0100
X-Gm-Features: AclHuK8n9a89pYL_Wa05qubleq6jQ4-R-im7loQEEosJ8TTL3UEl--es88mxuFE
Message-ID: <CAEmasaV0D3ezZyWf0k_84qXOa1c5KyUjvX9Jez+RXMDPM7FdBQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] mm/swap: keep reclaim batches contiguous on swap
To: Kairui Song <ryncsn@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Morton <akpm@linux-foundation.org>,
        Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>,
        Kemeng Shi <shikemeng@huaweicloud.com>,
        Baoquan He <baoquan.he@linux.dev>,
        Youngjun Park <youngjun.park@lge.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
        Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
        Lorenzo Stoakes <ljs@kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Vuo-WwpAhUEWieWlSAJf2H8bSotvVbc0
X-Proofpoint-GUID: Vuo-WwpAhUEWieWlSAJf2H8bSotvVbc0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX3I+aPFYg20u/
 2ligU0okFiCVUQgNIVfJjzU3n3cLniusxyPhFwwIBiPX4gtZ6aIqY/dsaUeERomjDfOCmWi8spr
 fSQz01YgSTfx2J51bM0LWlLDpELku1A=
X-Authority-Analysis: v=2.4 cv=W6+txhWk c=1 sm=1 tr=0 ts=6ae85aec cx=c_pps
 a=CYpx6mtW7qE8U/l5VCnCPQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=03ozwUkBphtHgyqjj1sw:22
 a=pGLkceISAAAA:8 a=VabnemYjAAAA:8 a=GHlurvfvZonIQdaYDxsA:9 a=QEXdDO2ut3YA:10
 a=22KAYETGZJnyhCxlFjxL:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX6kdyfjl7A7Rn
 6Ati/kSoTqVZYX04n/Ahq5b3thoh+QX37MXcwfm6QOEOfyRvNTEOCr0uC8jToV1ihtaaKXLp/3h
 rQ+r1bjfPxjPXnatYcbwwFcMknYNzF7sSTOJ/96nZyp+NrnYI/lLW/RW+6KEnFCZv/5LaMC4N1y
 RCw6tWuj+vl7tfs/dX20kd+oIm+ZfoXhIjqlVOGaZctP63xR6kMmYEOAWncL2njApBxmQ6PyTg4
 34jtNXu4YwQuWN1tE7Na7DdD+T+Zt3G8GXLInSQ1/gnldKNe3To6Md7Wb9euOuVrF7lO/x8dFOB
 rTSoqNMLqWDWFeZBFeoZlgs2+dN6IeNJDBPczFX1nXblvyhrCMChA4iL67iDtj/u+crA+xPf+X9
 SeJm186jD0pWTrIfOM7Dv4PV1MjBun/mU7vxM+gREf/xZGfS9z/HKiJSkruqu0DKf7MCbfKZQyA
 lP0KCbokHW17L6+n9yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01

Hi Kairui,

Back from holidays, sorry for the late answer.

On Mon, Oct 26, 2026 at 2:38=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> >
> On Fri, Oct 23, 2026 at 12:17=E2=80=AFAM Alexandre Ghiti <alexghiti@meta.=
com> wrote:
> >
> > Hi Kairui,
> >
> > On Thu, Oct 22, 2026 at 5:27=E2=80=AFPM Kairui Song <ryncsn@gmail.com> =
wrote:
> > >
> > > >
> > > On Thu, Oct 22, 2026 at 11:00=E2=80=AFPM Alexandre Ghiti <alex@ghiti.=
fr> wrote:
> > > >
> > > > 7.3 regressed swap I/O: for the same swap volume, a workload that
> > > > rewrites swapped out memory sends many more requests to the device.
> > > > mysql/sysbench in a 256M memcg swapping to an NVMe partition, 7.3
> > > > compared to the previous version:
> > > >
> > > >   device read requests per transaction        +59%
> > > >   device write requests per transaction       +27%
> > > >   throughput, iocost off                      no change
> > > >   throughput, iocost on                       -19%
> > > >
> > > > Two commits interact:
> > > >
> > > > - Commit 9a42aed48421 ("mm, swap: prefer nonfull over free clusters=
"),
> > > >   in 6.18, makes order-0 allocations fill nonfull clusters before
> > > >   taking a free one.
> > > >
> > > > - Commit 3cedb745d354 ("mm: clarify the folio_free_swap() for
> > > >   do_swap_page()"), in 7.3, frees the swap slot on an exclusive wri=
te
> > > >   fault. 7.0 to 7.2 kept the slot, but only as a side effect of com=
mit
> > > >   4b34f1d82c65 ("mm, swap: free the swap cache after folio is
> > > >   mapped").
> > > >
> > > > The freed slots leave holes in full clusters, which then go back on
> > > > the nonfull list. Reclaim allocates slots one folio at a time and
> > > > merges the writes afterwards, so a batch of LRU-adjacent folios gets
> > > > scattered over those holes and is written with many small requests.
> > > > Readahead later finds those pages scattered as well, and needs more
> > > > read requests to bring them back.
> > > >
> > > > I tried three fixes, which perform similarly:
> > > >
> > > > A. Revert 3cedb745d354. This keeps the slot on write fault, but und=
oes
> > > >    the intent of that commit and keeps swap space pinned under dirty
> > > >    pages.
> > > >
> > > > B. Below 50% swap usage, make order-0 allocations take a free clust=
er
> > > >    before a nonfull one. This is what the allocator already does, at
> > > >    any usage, on swap devices with discard enabled (swapon
> > > >    --discard=3Dpages). It is about five lines, but the threshold is
> > > >    arbitrary, it stops working as swap fills up, and it applies to
> > > >    every order-0 allocation, using up the free clusters that
> > > >    nonfull-first keeps for mTHP.
> > >
> > > Hi Alexandre,
> > >
> > > That's a interesting problem. I think the real problem is with commit
> > > 9a42aed48421 ("mm, swap: prefer nonfull over free clusters"), right?
> > >
> > > It's more like a balance between fragmentation and contiguity of small
> > > order allocation issue.
> > >
> > > Perhaps we should instead always scan the full clusters and revert
> > > that one commit? That commit was only following the idea of keeping
> > > the allocation more compacted for that series, it looked good at that
> > > time. Since fragmentation issues can be solved in other ways,
> > > contiguity seems to matter more for large physical swap devices.
> > >
> >
>
> Hi,
>
> > Oh, okay. I thought reverting it wasn't an option given the good
> > numbers the patch provides.
>
> That patch is 1/3 of a series, that series yields really nice
> results, but that one patch plays only a small part in them. Or
> perhaps we can limit that to SYNC devices?

I'm a bit scared it would not help zswap with writeback on, unless you
mean actual SWP_SYNCHRONOUS_IO devices?

> I hope there are simpler
> ways to avoid the problem you encountered. I think the ~4% reduction
> of 64k mTHP failure is kind of trivial compared to the problem you
> encountered, and 2M swapout is still not easily doable, as the
> main blocker is from the page allocator.
>
> >
> > What are the other fragmentation solutions you are referring to?
>
> Right, nothing has landed in upstream for that yet, but with larger
> swap space the fragmentation issue will be largely solved. And before
> that we might be able to sort the clusters by the continues size of
> slots on it instead just blindly move then back to nonfull on any
> freeing.

Sorting would only help the current patch since reclaim allocates swap
slots per folio, not per batch.

What do you think the next move should be? Should we implement your
sorting idea on top of this patch or revert the nonfull cluster first
allocation? IMO, trying to fill the holes before allocating a new
cluster is the best solution. Doing that in reclaim, as I do here
avoids distinguishing between sync/async devices, so I'd favor a v2.

Let me know what you think and I'd go with your preferred idea,

Alex

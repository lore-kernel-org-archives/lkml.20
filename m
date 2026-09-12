Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D7E42DA5A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789202920; cv=pass; b=R16+yiTHrhQFRApP3LzS9HBjHrim96BjuE0ot8Nl9mkdhVHvFAJfV5TN9XBlr+Y07n/dVV+31SrpsQdi+r/U0F77DK9C7nBHaXFEdCTpmAr5+uH6FhdmtMuxXlFjYMW9kpFl7WLkDzDFOfS9l5UOgeam6heTo1BUm1+T+Cwg/gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789202920; c=relaxed/simple;
	bh=PEtxQYkjYgQRxaF03D30N0xMCnigd147rHHH7QHltEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8sqNBIE3xs6asudOUdDVYHOEu9Z03XkGPO1G9i4eU+iL27BmzdlpGdxhXvKcM2D6E8VKXP3aA0tIcydJkyGJnUjbHlMhowQEFPsUv71h3ljF2N8bErWCoLjrXze/FluSUgBhRrXnORPHcGBlw/3S5QsaKovncHw7LzjNFxgrcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhX9cfsT; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhX9cfsT"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a9cb66f7b4so664308a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789202916; cv=none;
        d=google.com; s=arc-20260327;
        b=dQZLcaxQR3UdypQoHarZytspkeaJDO/vZo8iY9viFKnnL9izpy0jCJCa9UQuVLhkNd
         SZyraTHLVsBFYHwK2EXqnyIPEX4ubf4ey/+oF2Q9lw5kkTs8HSUx0oB3GBAAr9IoUxPk
         xLjaTkH/+0ZGGfggbC6g2q0ovk1oNQhFpjFC9ExLzcYEEOiTaV1640zYdbINQqsMe8Ov
         9vvJhg0Qmd4F3ntl6/MPMZuy42CpJ8zZBWiLfEg8SqdaObRFjJAQfA+T4DpxeRxYVXGU
         q8Z0zSEIkp0xd4V4MCpLpZCiMmuJSVK+LVPsw3hs1xV1mADgmvDoDLvnfmydhiPccxQ5
         Qr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I4VBvSxEGrUfJJhcCbVvt54AZ/dw8YbEqxSSPOGIQHY=;
        fh=5OJVRA1WLWGaIvDFffjdyPIPQ93zeH375Cy1JCmiDpA=;
        b=OgSF5rroHNMXK4cxEQHMEi9MRWVmiUrMNNGibLGPQhM2BDVepIH+hk+lc9W1qXYxQg
         ACFq5zTo7KyLbJ9R0cWAj6wVMdIlOu/BB+g0WS/3fQn66FIQfdKWUweS1I3thism9Opw
         Fulj8EvjVTvz3bpb9R5Tpd7G0rbDdXd1MMmj06zj4BJVGBhIQRra7/jEGPDD/rI1e3mK
         UATTc1XLDDyyLtodrlbfUOliSZzQTiAj7+0LQUuo59micO7ZeAMlb3/hpJ8cJMZ43cXB
         A8NX5MbUIvrPlDUpLXS+LXPUhHY1kutz+4i9TZ5BTNAZmo82PMwDap0NHapr0VDkGdj9
         fygg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789202916; x=1789807716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I4VBvSxEGrUfJJhcCbVvt54AZ/dw8YbEqxSSPOGIQHY=;
        b=EhX9cfsTA8wuzqlx4v0gI7INYdvOI07HVCKskWVxtYxlHU3ehzVsoxO1P1oohG3jYi
         nhYfe2s/cBhfDjlnSZV2gp56s9x3/hoj3XQ5wY2lk5ixBD8B1YDl0Q9UCRnb3Cw6VLes
         x7lY9ZCYQ/LZ1OHTtHj0WXhsqx+ip4fZRzU68j8MwYJ/R3nxiRx94JN6H0e1HaNpaCMc
         0cAb0UxJRiGOPdvbiUZ3iecH08hEB1wnwjZYuFn7r5uCpHfOkBa8dl/NyUpw8BvCob9+
         GBE95j0TpbLAMoXNeeuZi8bkIL45PNSe66OlTXqDAbwvMMVYzQARcSvHuB4ARFwcVeen
         /YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789202916; x=1789807716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4VBvSxEGrUfJJhcCbVvt54AZ/dw8YbEqxSSPOGIQHY=;
        b=Ip643vtpokXfiBCZi56Ku77lGVlTuAGJRziMkkKeqBBE1tyNIWqhOfMZ/aatOqIrHS
         I57MlUx/m1idT8esNWNNNsL4DvXAndkSzp8q9k/OF04m9N8EvS3pedrup+xRe4GT9YiQ
         ppR9TW+3vr5bmuhGlmwM8e0Slrz0GJkHIaliFobp69OxyI6NFY3hEKgE3UIotOdX4W2+
         ABAm+PgJec461WRb6OikoJHbmSBDjMTw9ofgNyvHY64My80Wpd/3z6VfUEEgJDa0VzWJ
         FEghnbK0hx40z7E5huOcACTEgB8WanfSeFTXA7bkhBMMmI+5gfnEWmHZIhrZYxjQUP1W
         3PDg==
X-Forwarded-Encrypted: i=1; AKwUvBwwCNm9w9bBm6qlTCCYObtpJ6Pqhk32qN/9j4cXHhpfF9UZKZvRcyzF/8Bc1YFnDXUMKK19oZ3kzUN+Bqs=@vger.kernel.org
X-Gm-Message-State: AFuF++mVJvkfbOCMbRRGWHrSZtPej1bjIns6SR8xfMI9sE8I91GKrzUz
	fLSf4p7G/oiBEG4A5F4jJdHHdQ+Lsn2wvfW89zF6QGoOp/mFogb5M1HI/0xXzFHkNM0o5dzDFPk
	3rzHenFcH7jANWp5Fpq3HCtgkb3Nq5qo=
X-Gm-Gg: AYBFou2JHq1Cg17MupuhMEnrFhKB+9OVJPKZj3KFLTsYh5vzbkEcKVUOkcROqACoIL9
	S5AT1uFiab4Bbx9XOeeIv7+TNHeap8rh7Gm5m8P8UT4cyRzcIRw3b/66G+a43iR3ihjcRTrqGhI
	pfkIXJq+YAZrz/mzY9fdqpo+JTN7v37bMZLIqjN2+7KmfUzjFDZMEigNNI958m71YWicdzZQ9MQ
	ha0UXxUHpNPmxqfPweaShjrxkEYxrxYerpuqUdrEIVd4MTyma+FJfOAuyi7PhTY6TgAZmFH4Fzt
	Lo19mzSJyM/ZIIz1MWAEf/R3Jdor3dPtWbUNDo8FWZ3kRkh/GX1icom0/iLR0qOb6S2TxmpX7Rc
	w/3edocjtejebJA==
X-Received: by 2002:a05:6402:354a:b0:6a9:93c0:113e with SMTP id
 4fb4d7f45d1cf-6a9b5603d6cmr3580548a12.9.1789202916079; Sat, 12 Sep 2026
 01:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
 <CAKEwX=O8i+OsP6BJXNZNk07hveN9HDT+PoyMTAU6gOc-xp0Ppg@mail.gmail.com>
 <CAMgjq7BQeQQOZMDPFJ+8LS2N4t3x53r6Nm+9o0_pi92oVUgjgQ@mail.gmail.com>
 <CAKEwX=MS-7C96i4tzBijHN=-xuZgny_wQEa_0YjfHzhoNysdYQ@mail.gmail.com>
 <CAMgjq7B7Mc7vpQN0gBknsSrfZWXdif5L7nU29YskG9mzS-_jsA@mail.gmail.com> <CAKEwX=PxZ68_4240DC8HjcqPRE0bQWGmouoqapqqTQ2b0xqpvg@mail.gmail.com>
In-Reply-To: <CAKEwX=PxZ68_4240DC8HjcqPRE0bQWGmouoqapqqTQ2b0xqpvg@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 12 Sep 2026 16:47:59 +0800
X-Gm-Features: AcwNN1Vvr5dRguutvcgehjz-XZkuALg4SjwQULHioJZ7yEPwdeM7nc8UPMPMn9E
Message-ID: <CAMgjq7D40KGRjwpFMH4x4fhJ18OQyZwPtovhc8Hm3Y7+__d4Lw@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Nhat Pham <nphamcs@gmail.com>
Cc: YoungJun Park <youngjun.park@lge.com>, Chris Li <chrisl@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
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

On Sat, Sep 12, 2026 at 3:04=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Fri, Sep 11, 2026 at 11:14=E2=80=AFAM Kairui Song <ryncsn@gmail.com> w=
rote:
> >
> > > Would something like this fix it for you? ZRAM users will not get
> > > vswap indirection overhead at all, because it would bypass vswap :)
> > > Down the line we can revisit this decision - for e.g, if there is a
> > > use case for vswap-on-top-of-swapfile. There might be other interface
> > > that makes more sense.
> >
> > Hmm, this interface looks confusing though. you mean tangles vswap
> > with zswap through the cgroup's zswap limit? I originally expected
> > this to be a problem solved by tiering, skipping certain tiers seems
> > much more intuitive. Maybe Youngjun have some idea here?
>
> It wouldn't be confusing if this is something users don't have to
> think about at all :) My point is that we don't have a use case where
> we need userspace input on vswap-enablement on a per-cgroup basis yet,

Ha, you really can't assume that for everyone :), we even have
workloads working at different compression levels, and the tiering
series shows different cgroups working on different devices, there has
been pathes enabling per-cgroup swap device a decade ago.

> > > Potentially, but we have many users at Meta. There's a huge diversity
> > > of machine types, workingset size, access patterns (both frequency an=
d
> > > file:anon split), compressibility, etc.
> >
> > You can just set the number as 8PB? :)
>
> Sure, but with the vmalloc-array approach, there is more metadata
> overhead even if we have not allocated the backing page of the
> clusters yet. This will be annoying on the smaller size machines
> (O(dozen of GB)) to also pay the overhead of 8PB-swap space metadata
> reservation.

Not al all? With VM_SPARSE, you literally have zero overhead, unless
you really use these slots.

And even if you really use these slots, the overhead in both CPU and
memory is lower than Xarray, if I did the math right. I just ran a
quick test with Baoquan's Xswap, forcing it to start with 8PB on boot;
it was smooth as batter on a 1GB box and still worked fine after heavy
anon memory pressure.

See below (8PB xswap device with almost no metadata overhead, the only
overhead comes from zswap so I reduced the tree number but that can be
easily merged into clusters as we discussed before):

### Before XSWAP
# free -m
               total        used        free      shared  buff/cache   avai=
lable
Mem:            1464         405         756           1         544       =
 1058
Swap:              0           0           0

### Create a XSWAP device, I hardcoded the max size in code to 8PB,
### and use fewer ZSWAP trees:
# echo 0 > /sys/kernel/mm/xswap/create
[  140.289280] xswap: adding extendable swap type 0 (prio -1, init 733
clusters =3D 375295 pages, max 2199023255552 pages)
# free -m
               total        used        free      shared  buff/cache   avai=
lable
Mem:            1464         407         755           1         545       =
 1057
Swap:           1465           0        1465

### Lift the ceiling to 8PB:
# echo 4294967296 > /sys/kernel/debug/xswap/type0_cluster_limit
# free -m
               total        used        free      shared  buff/cache   avai=
lable
Mem:            1464         403         756           1         547       =
 1060
Swap:     8589934591           0  8589934591

### Run memhog:
# time memhog 12G
...
________________________________________________________
Executed in    4.36 secs    fish           external
   usr time    0.46 secs    0.00 millis    0.46 secs
   sys time    3.77 secs    3.80 millis    3.76 secs

### After memhog:
# free -m
               total        used        free      shared  buff/cache   avai=
lable
Mem:            1464         336        1136           0         222       =
 1127
Swap:     8589934591          31  8589934560

The only different from vswap now is that you just hides everything :)
(writeback is not hard to add)

> https://lore.kernel.org/all/CAKEwX=3DNYoMH8pTKeCvA=3DXHFmmNVMeDz3mxbhp5q6=
-PxSTJ5wOg@mail.gmail.com/

Right I saw that, but 64 bit of private id will make shadows really
awkward, not for SWAP but for file folios and file mappings, swap
table is actully fine since memcg_table is standaone, and we can
workaround the hieratical refault distance issue in other ways (e.g.
record the reclaim level instead of memcgid direct). I think 24 bit is
good for now? As I've never see anyone ran into issues
with even 16 bits in production.

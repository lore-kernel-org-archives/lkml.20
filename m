Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793990155;
	b=mHqQvK54ofTo4GAxtWlxKO/GwxCM2Di08PxLY6a94uiYw3sB88gkfxHB57ceOkkgYM1Q
	 U+TzJ9p8K3jtN5Sw2PbMi8usfeOsUGXDOFAFdmCc7z4OoL/EqMpBq/1i/gj/UlBFKpoSw
	 ZfqndmGJJaBfadJJngYPpaZ9MdN985EFobkfQYkcP+91CuuxQzZ1gyiloB6XYMe0EszXK
	 ZBAEb+knIRgw44cRcfDFRv+xMQMXt4KanSHB4SGQV+57yDv7qj3SxW/OmCsoAOs+8+HMH
	 duvJQcfWEUmP6+IDgDHn/ChcSh9C+Wei/RDOylcPuPGO7eSbaT8UDyNbvT3sagEH03A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ukxaCB5W8lia+D2gnLTRqR2pZy9o2jDKqq7CIfdBjAU=;
	b=1N0kohKvrvl+SlsLp9CLJ1LMiSV/THh9j2j3RJhKwKkFyi7JsM4/DprwqOYlUaP7o9md
	 5SASQiFOzS5plTkubSMsXXtmhaG81/7ksyPxvJBYn55iZWmoFCDtqe9om146XpV4vo0Zg
	 J6+FPOhWchYIUxniqbetB94S6VBHggSJjEkK0RxMUFMAxLVeffIPrxZDx+31gn/+wp4cG
	 axCclfpE+KOwgI1CJnOgd3MpLV0b2rGkyXUgArDvfo3GBG60Ee9k9twXTYP3bHyQmZPGD
	 +I6JBtBTwPaKR+pChhXR8qk7zavgUnXn5bGagAEYURhxm72ozzOi+EHyGfQOzHFa3Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hEYX9jAd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C57606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C57606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hEYX9jAd
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eadf48fb2dso412302e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793990154; cv=none;
        d=google.com; s=arc-20260327;
        b=dOM5GConTD52JQpeXbqrCUNVDVcJG4nx2tZXoN5dUeTIl1lh+PnkG7buCod55wBkE/
         k8Py5mHIovZ+3PlnWfSTWLJYsO6GHh3kR9xUbYr2PUO5fsrhv4gkERPYILTmDg5rjy2G
         AwVCXn2dVi6tKe1027PLu4uOwAfZDO/yV2iNUeu8NrCW0/W60OauUI2HeZ40ypQW8WVf
         qvDagw9xo5JoIR3yA0PLInFSv8W0VlDggdu9tYUcqlV2jigIxq+gWtwMHgRnZUWkbnYB
         F5asffvIQV+YkxEiS5wf7Bq5gyVI2xbX3z9zDoE5JIahlDBRf21K8wPgFDdn0TSNrwXA
         7gSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ukxaCB5W8lia+D2gnLTRqR2pZy9o2jDKqq7CIfdBjAU=;
        fh=NsUjiIbTwdcR3UQQFNAVOX9ZZZoefUz5Oki/rl2au74=;
        b=TqZ6eP+0geWSjuGgi8Is5rfgAlZQLWbgcwEwzByGLxmW03AOGsB7UK8AeBYrrxFaFo
         4nJIKhH+Dbpq8QwyAHj1g7GPzgYYohbejxWJRVf+kJOLjZFKRZiJydc0Sl33T0msOKsb
         MrlQHnlmYTcfj1+qLadQ99V5UDFcg5RBsToTMoC84wLe/3/694f4WzNMjMtT/lTMlN7E
         obgDJyO7N/plNnYzy/pm8M/yLGmw+gLOi/eOBYSluQuuls0Zk5A5QngV4lPUgvNHrGL/
         d2KhxphGJzBsJ9mLjC/RqDTT3UK2VedNml8vz7yTSWIYhd6mLeCAAznfeHyNwgxZcHN9
         TTZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990154; x=1794594954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ukxaCB5W8lia+D2gnLTRqR2pZy9o2jDKqq7CIfdBjAU=;
        b=hEYX9jAd3C8eowawh6gmIKUuAy3w81/1uQPwQAuQYbU4ayCjS4smJuoCCX0IcOgtha
         5TARJbHBiMC7x4l5PqZlTkjCg5DRjGj0HsYgW141UaQJhScS11cSw39qQ4NLpz1dQF0r
         ejeFsRCEajuzHFNDOJ+5pf6R9b2J7K8z1+YOKhBNvW3mNbfKFoZnwgR+UEiYnCEGBCST
         dhy6d4QgpLtZ+32bn4ztwdLik9jxsCjVdpbLTnR6MS1fo6I9peFxJd61K3fyPTArtThQ
         NHzhHGYHQ85+qbgAqAiaZfdsRjAf13Qw6Qul1mVUhTPrgrc+tyVrI+EGH1doru1r9+no
         brtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990154; x=1794594954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukxaCB5W8lia+D2gnLTRqR2pZy9o2jDKqq7CIfdBjAU=;
        b=EItcGPIroeDkcEznpobv97ZVKdzhZ8HtpNY545oQMQsSECW/uoyNL8p9A2CE5R2eMR
         MyHwr2HPyyIw/MP/GKmthYfxXzAqB1+KB1seGHdO55GcSXUMqafNDMCyXDKVA1xUpQYv
         3SZL1WuPiiZ3jVme42BWQG60m637q7LJ8ZdOKbvxBT0gSsF5c5oUgZ14LXGhVm/vazhr
         v5+5mwzL5gyqMs/CKBqZrEwH1Yd1WiXziUsjGGhAvsL7FNx8nztJxCmEdSwNEwrGkohv
         qSAlEeP/pzOwCy1Ylqfd391NBoDNghLuCUnD8OS7NjyMb/yX2kb1mI6aQfYnlrTl1axC
         uTPg==
X-Forwarded-Encrypted: i=1; AKwUvBwGuy49SG5GfLxElbqY8N+3VvSk+AzCzdl98to/oQwChZ2v4D8aXCHR3JSVGFHwIfJiMfr7z7nIVhfpzsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XFa+vpXZNxBWzEYruHh4RB7uzOeXDnT12wOJvLyJ1h+Du7dzg
	lTfDIcqrXsktkt4YXnFEyVz37QpS16+gO98RH8zfu9UpNSJ1ingeDIdHa9KDT0U84KpMz8191Zs
	SMq7CyIoZL3obmCaSl1u/iE9wG/NOjOY=
X-Gm-Gg: AYBFou1tmLfz4oVSjUCPWXOkRVZ4F3gEuSAWtJ7KFbPhg+8+OasTClVEpbeLExhWQbz
	+LMreaG4ni9ygS6palY9fztfPnxeNsgPD7CiDD8bBDegxindVg1fuVQm0tdU1q9LMYOXkCQAl1U
	hjjvJwCOsGHHbu8Pz0vRFvM6+L+hGDHjiOvqJYomdgIqRdeY0YARh2MatdLSzAZR7VXg1rJ/lqN
	E09ixfaLfbQqwMKLM/ekrToq0n5dslOC1Un+uWgpBDGl9D0yyAX9oBb6Ztw82CvXAv/bEdagbfw
	FWO2Fa9lPKNwOtKSt/chJtY7ry/HtrFilSEWVobv2eyUsMvhH2pZrbn6oNQyyEo223msx0kvyex
	kFmDGKGKVYbw+5jyOQDigwCTTMyzZguCdthxSYQD6KMA0b34WhEUMHLUJdRaKR+4AAb6PDJM76k
	Wnm8I75feF
X-Received: by 2002:a05:6122:e246:b0:5e9:6d96:aa38 with SMTP id
 71dfb90a1353d-5ecc43be497mr1583490e0c.9.1793990153741; Fri, 06 Nov 2026
 10:35:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106172620.318113-1-joshua.hahnjy@gmail.com>
 <20261106172620.318113-2-joshua.hahnjy@gmail.com> <au4SKZKfJoE0ZgAw@gremlin>
In-Reply-To: <au4SKZKfJoE0ZgAw@gremlin>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Fri, 6 Nov 2026 13:35:41 -0500
X-Gm-Features: AclHuK-kHtai6vcZgPwo4Pl2jbu5SRtdgIxOG8e-H4KkrJECGF8A65jLRBZWFPg
Message-ID: <CAN+CAwO=RnL2BbLodFZ9cyPH5X0sjmZs_05624vG1Jvr0p9dOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/page_alloc: only skip kswapd nodes below their
 kswapd watermark
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 12:50=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> On Fri, Nov 06, 2026 at 09:26:19AM -0800, Joshua Hahn wrote:
> > Commit 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to
> > NUMA restrictions") makes get_page_from_freelist() skip any node whose
> > kswapd is active to avoid piling on an already-pressured node that is
> > constantly churning to make free space that is immediately consumed.
> >
> > But kswapd can also be woken up for order 9 requests with THP defrag
> > set to defer. This means that a fragmented node with plenty of free
> > memory will have a kswapd thread continuously spinning and preventing
> > order 0 pages from allocating on the node. This causes the opposite
> > problem of piling on pressure on all other nodes.
> >
> > This behavior was observed on some Meta production workloads running on
> > 2-NUMA systems, where processes with a preference for node0 allocations
> > continuously allocated order 0 pages on node1, despite node0 having
> > hundreds of GB of free memory.
> >
> > To prevent piling pressure on any one node, only skip a node during
> > page allocation if the zone also fails the watermark kswapd is
> > reclaiming it up to. This is the high watermark, or the promo watermark
> > if NUMA balancing memory tiering is enabled. Make sure to mask the
> > reserve flags so that __GFP_HIGH / atomic requests in the slowpath
> > do not get a relaxed version of the check.
> >
> > This preserves the existing fix to prevent piling memory on the local
> > node, while also preventing memory pileups on non-local nodes when
> > the local node has memory.
> >
> > On a 2-NUMA VM with a 60G node0 and a 20G node1, with THP enabled=3Dalw=
ays
> > and defrag=3Ddefer, I ran a process that prefers allocating on node0.
> > With a fragmented node0:
> > - Before the patch, 66% of faults were served from node0
> > - After the patch, 100% of faults were served from node0
> >
> > Suggested-by: Daniel Hodges <hodgesd@meta.com>
> > Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> > ---
> >  mm/page_alloc.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index 5423ff4805f84..8e8a2c8d6e6a4 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -3882,14 +3882,18 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned=
 int order, int alloc_flags,
> >               }
> >
> >               /*
> > -              * If kswapd is already active on a node, keep looking
> > -              * for other nodes that might be idle. This can happen
> > -              * if another process has NUMA bindings and is causing
> > -              * kswapd wakeups on only some nodes. Avoid accidental
> > -              * "node_reclaim_mode"-like behavior in this case.
> > +              * If kswapd is already active on a node and the zone is =
below
> > +              * its kswapd watermark for this request, keep looking fo=
r other
> > +              * nodes that might be idle. This can happen if another p=
rocess
> > +              * has NUMA bindings and is causing kswapd wakeups on onl=
y some
> > +              * nodes. Avoid accidental "node_reclaim_mode" behavior.
> >                */
> >               if (skip_kswapd_nodes &&
> > -                 !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
> > +                 !waitqueue_active(&zone->zone_pgdat->kswapd_wait) &&
> > +                 !zone_watermark_fast(zone, order, kswapd_wmark_pages(=
zone),
> > +                                      ac->highest_zoneidx,
> > +                                      alloc_flags & ~ALLOC_RESERVES,
> > +                                      gfp_mask)) {
>
> I know this code is hardly the cleanest, but you're now adding a 3rd cond=
ition
> to a branch that was already complicated enough to have a massive comment=
 and
> duplicating a block of code that already dupliclated twice here.
>
> You're also then going against the convention of
>
>         mark =3D ...
>         if (... !zone_watermark_fast(zone, order, mark,
>                                          ac->highest_zoneidx, alloc_flags=
,
>                                          gfp_mask)) {
>
> (Obviously yours varies on alloc_flags too)
>
> And also inlining the mark value.
>
> Could you clean this up a little given this isn't a fix?

Hi Lorenzo,

Thanks for taking a look at the patches! I think your requests are
valid here, let me fold that whole check into a helper function
including the comment block and hopefully that will make
get_page_from_freelist() a bit easier to read @_@. I also found an
unused gfp argument anyways, so I'll fold in some related cleanups and
send a new series.

I'll wait until tomorrow to send it out to see if other folks have
concerns with this. Thanks again, have a great day!
Joshua

> In general extending functionality should pay down some technical debt if
> possible, it's ok to add a preceding patch in the series to do something =
like
> that.
>
> >                       skipped_kswapd_nodes =3D true;
> >                       continue;
> >               }
> > --
> > 2.53.0-Meta
> >
>
> --
> Cheers, Lorenzo

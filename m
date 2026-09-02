Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8DA330B3F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358261; cv=pass; b=dH8Zg0lY2nQtUmK5IlcuYgZ78U5t8+4XpbSO2ZW06v92+BDymvsIjV9va3ZWbb2Q0NB/NN6++s8KvQt+gCpy/d4/L/3dQIwO3OMunxzCFV0dgNxeOLr3IlOErkjSxay6EYsxwd5icj6kjdduI3/mgruJQtfeRVy3nc2s4gflDsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358261; c=relaxed/simple;
	bh=CKf3sB59VPRjGs9UbjEt9d4InMnag8u+23HLuavWd+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C4WbBmE4S45xRFPYg2cP3mau5CNthS4hAcoOQzPuo79K5VT2vrzUQBC5zO48AVesSm/kvxlBOOUS7zWUuIk7bi5nR8KPAnwTckqpCOxPvZJTemSt9rJZ4HwQFoZXUhynRD7oEgPm0Ds/YFun1ECserQUoZMJjTKb/rv1z9//wPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXbKDqPJ; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXbKDqPJ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba14so1057181f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:10:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788358258; cv=none;
        d=google.com; s=arc-20260327;
        b=U2nTqbWByb3CkUOUbR3MwfJ9B92Neiu/+uzzxLSmwoesPff6wHLj1FymKxwMPns/i+
         oEVR726ISYCrSVUilzWx14zDgEHx2W6oNiBJiho89wtBXOqda0ynBAQZKPOkv+3FacaG
         MPNk2QXGxxP67W7ztESnUwlXj/aRASdXOnnRDXPcd0bJ3I/jxs3vop16xW8FpdiOumS0
         cmdQsRdMFSaopggXv7tbEq6h18lOKR0y0eABdxx19zNhMG4DfgOCnz4JT7oLwE1G6dPc
         7Dhbfw3kbqzXIkExn9IjrdVp4jaMYdD2A8gYo77ZVHfv7wyfRHWwGC9Bshqz4KjP+dKe
         zTDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ebSLBU8UfHrQpTdooqoDv4OrjDjrNDcCYGDv+r9oP8E=;
        fh=QxDFgrcPfyG8sfMEV9/GKU0lgMD6Wb6+R7z0ljNu89M=;
        b=o22JNMgF5AwbhuJjCBIaXRSwGfbrMm9yRg3TOCIankYBswosKsxbRZGnG7eL+BGQwD
         LQkTjmlZvGp+xG9gHWIo0FFWKJvlfNOuApcN+J9QuVC0qPo5f9PQkqosws+ZPz8gESO2
         JzLCM3T354lDhdkb7Scv2vKz50ch+FA1jde4r6vTh3SC0Vei8L9+fXRDKKk15TyAp+43
         proEH9Nx3Kd/a+B6oEczph00kMfo6VWWJVisGn8JJieylEiCIaeyM+BvnikO2RU3QxZu
         TsUuEe17Y5YkZZc0bMMjJocig+BEJfrVSJ1cZehG7WAdp7LfDdKdfn05Z5RZCY67P423
         U5Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788358258; x=1788963058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ebSLBU8UfHrQpTdooqoDv4OrjDjrNDcCYGDv+r9oP8E=;
        b=gXbKDqPJqjl1dZLyYAblmcgV7/94Mj0GaCXPDqt68JnA5R8ElIMsPLT38MnWux8jMz
         JDFUBXHHI0afnYlkbzlTmKvC459+9ROmr/uIvVQq1mUfCFp9ubSaD007bSzsmYXCNXpX
         guZ9i1chzbU1Y6X09IrS0O3mhgR/TDquyXhi7ODV3S4lPeV/i409BwZoBpBzBvrulYKU
         OCFPYsw59jJ7ZEGtZ/lAH7xDPP6idlKhFau+qdp8e0KUk4fOUIUZ2p5IHmxKdVYOIPe4
         sBjA7A7tHlJ+En4eDBEEPxWkzepd96/i/6qLBV4cnDO8E0zlvxS8ICK0z3+PLLLSnid3
         twDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358258; x=1788963058;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebSLBU8UfHrQpTdooqoDv4OrjDjrNDcCYGDv+r9oP8E=;
        b=g3RDAThfT4fxgW8wp0e1sTXqKf1bAN4li1rd58362522j5DoovrGsFShwK6ZdsefxR
         CLUHC/NEp/txkEmwidBMZkXPMYMJRPerLlCLKuxeF2YHoHRdvrBLiqTRVfI7o/bndbWf
         aCxwyxye4Nr1CZfLoVU3122qUwMtUI0R0wqHc1Sm7eVeZ7H3JQScRoZatOg10kkMnbrq
         8ImH8wANJ2879xdt1qkLd5woTZOB7957TI/ZkeAlWPhsTjVKt/ZyJXbi7fgJ/qkWOd+y
         fldydGlNtLAN+DoLukGXy/gPmSe+YTB/UnjhWGssFk22fHagWPqhCJQXPMKiJZGvAi46
         TYDw==
X-Forwarded-Encrypted: i=1; AKwUvBx+MbSN+yVrg4NTui8D3hqPD3Eth4Xato2SfTe/g0f0Ycqu+NIGGHQfQJc7xH8tr5rvhBSEKs8YiGeQ8Hg=@vger.kernel.org
X-Gm-Message-State: AFuF++ntmwSxJ5xXDsOz0Rm3tLk2J1mkVEHkOnRbu7pIJJ6l1+zSf5mM
	JLZjqQH9ez7HFQQTiMIwZmr8WQc2cp5khXxA4ka794JUdiU9zc43bGs7CvJUCzH/8WKiaYE37iM
	lVcP+5u17vsts4sug64KoqMFHJhNXZWI=
X-Gm-Gg: AYBFou10rX0c4BCZdSL7tfxVAt4NAQfthBp5D35EhlMXiYz7AiE/dGF6eHgu4hRKWQZ
	DK9mKnMs3nE/Tf0lxMpN63rcbYIAITGID0LXbQ8F4BHl9IUgskYV5TuFxeH+YS1rNEYv/XpXlL8
	rpt4u9vJoriW8u4gOxwmgnneNpQ4dlEwCtpWvSCqR81pu9h3mFMjg4hlLNr0eDw45iS7tuREGeQ
	YYaSGWOpWiJBO9hV0qQAvF+i6+tVXbRgQYHlOtTeSdUSK5a0bwfLIMLHVmgm3A6UPutmNlFICeR
	C3JHaddTf0vNDj15sBYhfrgfwfhsnfNuuMMvyMddZIMQJYJshP7p93CqnXld6B4DVbUERlUPc1/
	PVPQ=
X-Received: by 2002:a05:6000:18ab:b0:481:512b:f0e7 with SMTP id
 ffacd0b85a97d-48488f1898emr9592102f8f.17.1788358257484; Wed, 02 Sep 2026
 07:10:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
 <apVNB2FRTFMDtvGP@KASONG-MC4> <apaw_XmqnEcY8sv7@MiWiFi-R3L-srv>
In-Reply-To: <apaw_XmqnEcY8sv7@MiWiFi-R3L-srv>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 2 Sep 2026 10:10:45 -0400
X-Gm-Features: AcwNN1WYya8eMurhgXTECj7Nz3qh8FEbpdAoE296wjpQB5CRlBuJqO6z1kGHWtw
Message-ID: <CAKEwX=MU9uXVenEu7he+h-Pq7K3BmCGvvKS-KiPK61Xd0ox_mQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] xswap: extendable swap device backed by zswap
To: Baoquan He <baoquan.he@linux.dev>
Cc: Kairui Song <ryncsn@gmail.com>, Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, 
	baohua@kernel.org, youngjun.park@lge.com, hannes@cmpxchg.org, 
	yosry@kernel.org, shikemeng@huaweicloud.com, chengming.zhou@linux.dev, 
	david@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 7:03=E2=80=AFAM Baoquan He <baoquan.he@linux.dev> wr=
ote:
>
> On 09/01/26 at 01:54am, Kairui Song wrote:
> > On Thu, Aug 27, 2026 at 05:44:50PM +0800, Baoquan He wrote:
> > > xswap is an extendable swap device with no backing storage. Swapped-o=
ut
> > > pages live only in zswap, so the device wastes no disk space and its
> > > size is independent of any physical device.
> > >
> > > xswap decouples PTE swap entries from physical backing storage. The
> > > cluster_info array is backed by a sparse vmalloc (VM_SPARSE) area tha=
t is
> > > grown and shrunk on demand:
> > >
> > > - Grow: when cluster allocation runs out of free clusters and the dev=
ice
> > >   is below its ceiling, more physical pages are mapped into the VM_SP=
ARSE
> > >   area and their clusters are added to the free list.
> > >
> > > - Shrink: when contiguous free clusters accumulate at the tail of the
> > >   mapped range (tracked in O(1) via nr_free_tail), they are unmapped =
and
> > >   the backing pages freed.  Shrink is deferred to a workqueue to avoi=
d
> > >   lock recursion.
> > >
> >
> > Hi Baoquan,
> >
> > I didn't check too many details on how the implementation in previous
> > RFC until now, After looking at it, using VM_SPARSE to setup the cluste=
r
> > info area is a really smart idea, really good job!
> >
> > I think many info are missing in the cover letter though so I wasn't
> > sure how this grow and shrink works from the description, after
> > checking the code, it looks much cleaner to me now, correct me
> > if I'm wrong:
> >
> > Every xswap device will have a huge and fixed "hard limit"
> > (si->max and si->nr_clusters_max), and practically can be considered
> > large enough to hold any workload, and won't change once swapon
> > is done.
> >
> > The actually data (si->cluster_info) of xswap device is completely
> > sparse and dynamic using VM_SPARSE, and so we don't need to change
> > any existing routine. It grow/alloc and shrink/free automatically by
> > the kernel, limited or driven by a "soft limit" (si->nr_clusters
> > and si->pages) which you can modify using the interface below.
>
> Thanks a lot for careful checking, and you are quite right about the
> mechanism and details.
>
> >
> > Once concern is that the "hard limit" is now the total RAM size. Isn't
> > that actually a bit small? Will be better if that one is tunable too?
> > With a parameter, and before swap on, as the hard limit is hard to
> > adjust once swapon is done. Any thing limiting this?
>
> Chris and I talked about this, we both think the total RAM size is a
> good hard limit. Because xswap is similar with zswap/zram in essence by
> compressing memory content to save memory. So the real limit is the
> zswap pool, not the slot count. In fact it's never able to utilize the
> total system RAM, right? Making it larger than system RAM is
> meaningless.

No. This is not quite right. The size of this device is the size of
the "swapped out" data, which is multiple times the post-compression
size (i.e zswap pool size). The multiple here depends on how well the
data is compressed.

This is not to consider the other swap backends:

1. zero-filled swap pages have effectively 0 memory footprint.

2. disk swap pages (I know this is not currently supported yet, but
it's a consideration for the overall design).

>
> Memory hotplug is a case in which system RAM can be enlarged during
> system running, while that can be taken into account later as a enhanced
> feature if it's really wanted.

A lot of these problems are self-inflicted. If we design a fully
dynamic swap device, then it's not in consideration.

>
> >
> > And I think these details better be mentioned bit more too.
>
> Sure, I can put these thoughts into cover letter or patch log for
> reference.
>
> >
> > > A per-device ceiling (nr_clusters) bounds growth and is adjustable at
> > > runtime via debugfs.
> > >
> > > Interface:
> > >
> > >   /sys/kernel/mm/xswap/create           write "<percent> [<prio>]" to
> > >                                         create a device; percent is a
> > >                                         percent of RAM (0 for the def=
ault),
> > >                                         prio is an optional swap prio=
rity
> > >                                         (default DEF_SWAP_PRIO)
> >
> > With what I have read so far, the mandatory percent limit here is kind =
of
> > strange, even with 0 as default. Why not make both args optional and ju=
st
> > let it grow without any limit by default? It looks more "fully dynamic"
> > that way.
>
> I'd like to clarify why we default to a soft limit rather than "no limit"=
.
>
> The soft limit is the administrator's deliberate size choice, similar
> to how zram requires an explicit size. On a multi-TB system the
> cluster_info array is not free, so planning how much of it to allow is a
> real decision. The current behavior is: grow up to the soft limit as usag=
e
> demands, then stay there. We do not shrink on idle, and shrink only happe=
ns
> when the admin lowers the limit. So there is no grow/shrink oscillation i=
n
> normal operation.
>
> A default of "no limit / fully dynamic" will instead let the device grow
> without restriction under memory pressure. While allocating cluster_info
> pages exactly when memory is scarce, relying on shrink to reclaim afterwa=
rds,
> which is the oscillation we want to avoid. So we'll make both create argu=
ments
> optional, but the default will be a sensible ceiling rather than unbounde=
d.
>
> >
> > >   /sys/kernel/mm/xswap/destroy          write a swap type to tear dow=
n
> > >                                         a device
> > >   /sys/kernel/debug/xswap/type<N>_cluster_limit
> > >                                         read/write the per-device
> > >                                         cluster ceiling
> >

What's the point of having multiple xswap devices if it's going to be
dynamic, cluster-based anyway?

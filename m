Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA648E0D3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009486; cv=none; b=myNguJEbMA8ahvRxfhjO6hkzRyOaFc5QqxqDLYSiEqMFfyEmkSB8TcFNFHfzfSbLb9VVCDQ4UUwvmytN64shYAcWNHnHNLn4DPB2mCPv/PXYQTlB1cb0+g32G5Tq0bRZBplXRRriw2+HAnnhXpgfPhappFVX+38tNh6yNhJ+oDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009486; c=relaxed/simple;
	bh=8Y0NdDCiXwsCqs84YEB0iN+ue6zlIreIYv69VZZdj6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j54gV0EHseILtcXc0Rxzy25tp7dNu+qKxrdfQf+JCQDMdPkB2WP0gePJ8Ejkcm0D0pzHPYqEBAOf6nbSPpWdMxf8yNU5r3PcZSQUcU7htVWoewajot4M7VSfr/89eLIqkyX7Fl8zbfDizdIySVGqqHdUzlawXOvpzGmnm6HCv9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=dy5hDiey; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="dy5hDiey"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93ece7a73b9so575831885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1792009483; x=1792614283; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AZpHrF8jH8WXu6WIXCauYQ4g5rjWW4oCNhs7abbw/eA=;
        b=dy5hDiey5/zTUojPi7BecClRfz26cM2FqMI5Bblc/wSv+JRfQVgFcj4bkJwTo4nRru
         jEGGoReOmP6c4GJIc+e3ls4jear0+m5DTxPP2ksf4bmjIoyvbAesiEXL07dut1J4gPvT
         JXCnNoSs0F9ogr4XCXZ0Aif6hc97gU9BCxvTRxU75F6U5w/kLXlSPMZPepCBha/OvlvO
         zjp4+21LAIBRmKv+DYMav9DiOS/o5Cp+yPskrwCSpbPWRqAysFIDTcHFhxeARLpCXaIO
         8FpDrDz9ot4EeBwRyFMh5nfH0oJVozobnDOp0vaVsZixf4T7Kh8pr5sOmRwEkplYFYOg
         HiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792009483; x=1792614283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AZpHrF8jH8WXu6WIXCauYQ4g5rjWW4oCNhs7abbw/eA=;
        b=oZ0k9AEaFpvPzF4hzLqiXpYHp8rIF7r3EXhhJhaB2hbOt7AmFrCEH4VyT7tPWiupNS
         qxsjtaSVzTEXiI4xVGZXJQ6EGJgu2treaoEs0xZKvK1FzbN5zZfLRX3JpTF8aNmJ+x4N
         au+W81jxA/zUpGsX/KvYV3UIpi/QPEZkYo+/Th75QfbT5Ct4o9g/XoNiWju5WrtWky3J
         vMAyPhtol2YrKADAVGPFt8TlcMoGrecOH2w2Bqm+KDKPVSSa6IDs51gUhwevCC3B7f6/
         hAGj86UQvxDyHvgUUpHfEEhdLxSFnYQlvz0XMqnAeE7zHRzPcSyZjs4h1KDksDmH09tl
         p86w==
X-Forwarded-Encrypted: i=1; AKwUvBzIl+67SstIcGVZD0HW4kuhRJjWTYu7Qr7gg8jwasZbeamq34z6yXEYgk/4MYmSxzUuYKEtcOjWUQAxr7U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbjVRAbZj2JcMRZjm5sjmF+ISoD/rteuhVL8enE8S0rHa4Dg/S
	ImlAAV7uN1mbyTCWV9anlzN4yhe0qEpgaac0KeXr2WLedApKaEvD/viw2s84mN9qq4E=
X-Gm-Gg: AYBFou0Wb8LECgbQ4Z2477I1tBH3Ou5Wq6lTIj7RyfwvmIhMRHeVxneicEBQZF0UXct
	5jev6b7X9ZCfRXpc0DAUuHJQD0nt2dVCJPrOSa+4Ez7SYx1MSyfP/caM19DAQLZL5NrHnaT7nnt
	h6i2rh267lXjhMPlZXtVjByka6gTxywfWCt2Yi7yjEp/G+EUqo+2pPZYmdnqy0L9QHJhtfGIZ89
	P2gydePkUAW2p9Lzmdr7QwUAsk/K6LsF9PCRNmmWJI+zlpe6H89+964VSlh/aG7dx4PEpXFnSZh
	OBY2qUnlZrwtZK66iW1hL5wsJAVZxYn96oI8mYdC1zgcM8FvNivT7hXlFpvB7MKwb5DPGaM3K4D
	zabE4oclx9XGDAx+0MjHWQQg93d6G5q5CuuZz0D7E+7zx/YDLcxvqv0197YRarKY5VitGwOjDD7
	GVLbbow5a5dqG1mSHD8umpsdO6+svE2c3u0UkrFBIJOVKP9vGZZr5Jaj/9TqUMWTH12WV8
X-Received: by 2002:a05:620a:a0cd:20b0:93e:c12c:f149 with SMTP id af79cd13be357-93ec12d0893mr1925202885a.83.1792009482638;
        Wed, 14 Oct 2026 13:24:42 -0700 (PDT)
Received: from localhost ([2603:7001:f100:5081:9526:3c0:45cc:5ac6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef4f49861sm582813585a.4.2026.10.14.13.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:24:40 -0700 (PDT)
Date: Wed, 14 Oct 2026 22:24:35 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: Chris Li <chrisl@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Barry Song <baohua@kernel.org>,
	YoungJun Park <youngjun.park@lge.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Rik van Riel <riel@surriel.com>, Gregory Price <gourry@gourry.net>,
	Wenchao Hao <haowenchao22@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Meta kernel team <kernel-team@meta.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-doc@vger.kernel.org,
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <20261014202435.GB371161@cmpxchg.org>
References: <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org>
 <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora>
 <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org>
 <CACePvbVTnCOh51jvEpkDJ32idvCubgN1eHBps6vESjhVC8E_aQ@mail.gmail.com>
 <CAMgjq7D_=_4ZsCWJYywpZhPtg+YeH8o=ymRrV3sQ_58G6rs0sg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMgjq7D_=_4ZsCWJYywpZhPtg+YeH8o=ymRrV3sQ_58G6rs0sg@mail.gmail.com>

Suren, if you've not been following this, there is a question you
might be best equipped to answer below.

On Thu, Oct 15, 2026 at 01:17:21AM +0800, Kairui Song wrote:
> On Tue, Oct 13, 2026 at 1:27 PM Chris Li <chrisl@kernel.org> wrote:
> > I understand that you have some face-to-face discussions at the
> > conference. Do we have a list of what has been aligned and what is
> > pending to discuss? We should have an agenda to avoid repeating
> > already aligned items.
> 
> Right, from my perspective, here are the following key points we can
> discuss further in the incoming meeting (most of them are not fully
> concluded yet):
> 
> 1. A limitation for the logical size: from my side, there are real
> usages for a global non-memcg limitation of the non-physical swap
> space: e.g. thin VMs as containers/pods with no cgroup limitations
> inside but which need in-VM memory compression and a proper limitation
> to avoid thrashing; or low-end devices/desktops that want global
> (root) limitations. And also, Android have a limitation on the ZRAM
> size (well for this one I'm not from Android team though so that's
> just my personal development experience with Android, enlarging the
> ZRAM size on several Phone swill cause serious junky of Apps due to
> over compression).

Android monitors psi to kill on excessive pressure. This should
capture thrashing from over compression.

Suren is CC'd, we should get his opinion.

> Nhat is concerned that exposing the sizing allows users to tune it and
> potentially misconfigure the system. However, I think a user with root
> permission should be fully aware of what they are doing or they can
> easily mess up the system in many ways and swap limitation is a very
> minor concern to me.
> 
> I think the requirement for a logical non-cgroup limitation is strong,
> but the discussion hasn't concluded on the implementation method.
> Perhaps something like a Kconfig combined with an interface or command
> line? More ideas are welcome.

I agree that overcommit control can be useful. But there are setups
that implement pressure-based policies and do utilization monitoring
just fine from userspace; they have no need for logical overcommit
bounds inside the kernel itself. *Defaulting* to a static limit and/or
making a choice mandatory seems like a mistake to me. It would make
more sense to treat this as a related but separate problem.

I'm happy to brainstorm solutions. But we should be open to discussing
this from scratch - userspace monitoring; an extension of
/proc/sys/vm/overcommit_* etc.

> 2. Charging: If you consider memory.swap is physical only then indeed
> we should not charge it, however, user are already doing that for
> years so this is a behavior change and we are also pushing memsw into
> memcgv2 as a interface to limit the logical memory usage of a
> container. So charging of the logical space is useful, how to handle
> that is tricky though.
> 
> From our usage, this should at least not block adding memsw or
> anything similar for memcgv2, even if you want more customized cgroup
> accounting, we need to charge it into some counter (a page counter,
> not just a statistic) in some way.

A path for memsw in cgroup2 is generally unlikely, actually. It was
intentionally split into separate memory and swap counters and not
forward-ported as a combined control.

Like I said, we should discuss overcommit control from scratch as an
orthogonal issue. I'm happy to do this and help find a solution. But I
want to get out of repeating that this is not compatible with cgroup2.

> 3. Swapoff: This was discussed again too, as vswap was trying to
> remove it. I think the concern is mostly about maintenance,
> performance, and practicality. From my perspective it's a critical
> component both for preventing minor or major faults before predictable
> high traffic arrives, or for operations/debugging, and for releasing
> the swap metadata to rule out any potential swap / page fault effect.
> There are concerns about maintenance or suggestions to use MADV, while
> I'll be happy to explore and improve the current in-kernel
> implementation of swapoff later if needed but removing it is a really
> bad idea in my view.

Here too I think we should be open about discussing the problem and
what a solution could look like.

"Swapoff" seems to presume the virtual space in the shape of a
manageable swapfile through standard interfaces.

A separate knob to clear out the vswap space would accomplish the same
functionality without pulling in the entire swapfile interface e.g.

> 4. Writeback: No doubt we all agree that we definitely should have
> writeback support, Nhat's concern is that we should handle the case
> where some cgroup doesn't need zswap/compression and ensure that works
> well.

+1

> 5. Interface: Given the issues above, what should the interface look
> like (swapfile, sysfs, /proc, etc.) and how should multiple
> (non-physical) swapfiles be used? Nothing much is discussed about this
> part though. I've heard users mention the use case of multiple
> compression swap spaces, but I don't have a use case for that myself,
> so I don't have many comments.

+1

It would be good to collect usecases first. Interfaces are forever and
we shouldn't add them on speculation.

> 6. The one part that I think we can and should agree on it shat the
> implement approach: at this point I think VM_SPARSE is the right
> direction, Nhat is concerned about the testing on it, and I think we
> can have more data for that, and collabration is highly encouraged. I
> previously conducted many tests on everything posted from both sides,
> will try to post more on this too.

Here I think we're actually least aligned.

The VM_SPARSE implementation requires a static size, and prior
discussion has made it clear that we actually have no consensus on how
to pick reasonable values - be it in the kernel or in userspace.

The xarray proposal requires none of these choices or interfaces, and
nobody has been able to show that it's actually a performance concern.

Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A521248A8D1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143015; cv=pass; b=TluGfhxEFCF4Jiz8cOgXOHf80b8OHXbEKPCADLPHkhaXevzF8Z24TnKeb8c0I/uEJqe2sw6z497jySRIiwl/T70bBxLJT7xMpICQlb3Ck8SSBGyC4YZ+0aXhnsacKUcmXO6JQDqti4Z3XLyJpAR/kP2mmsjNRdlZVDpo2YHKULI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143015; c=relaxed/simple;
	bh=Ym19uHHgxDAdG2aXOqLzkjcRxM3UZ23dFmBWbPboc/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8kEy/U/z53ZwGfsfWX8U4NB95qYTJjA/t2fp1tYZ2evK3e/orHNqMfojV+kpIO/GG95tiIXATfdeyWOXidXvVFUYzKv8VpwbGsflmWRgE6Y3uzd12WEvDvqskVORxS3bhqKkUbFbOZkvJFV/5tX/GQJWsyHFnAp4JHCKNh0eko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwQx8Jpa; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwQx8Jpa"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2055573c8cso170257266b.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:10:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789143012; cv=none;
        d=google.com; s=arc-20260327;
        b=MQAN2yx+AAD/RCft8DzX8tlTSbs4hy2ctJQ9TX1W4gdhE5g9y7SsOU+nnMgUDG/Fbl
         Od3XRUNwFNlRcxRNieq/5poMi7w4OQzBCHtdPlwUXr2LFkTq8WaMoKp3dEIsQvXSczwA
         ZoqAWG+vBZxllrmEsYitE1Me8Eov48CCL19HGJc0U0Jk6R3z1t1sWL7mdVZ/4rqk+pGg
         VVnf6ywoSlWI8KKsf2fVMhfQmm5nlwkuvHp/D6tDHkTW30UEHeabSBuMKgKfPToTxkQa
         Ti3r82nMLTFsETCadt25juZFjlrfcwjhbWJgdMqhe8diwjqgLW7fu+xtat83/U1WYgZJ
         AzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=chrq6RomQPNyRdzBhcaf19ect6USlxXFD+SAG73uJJw=;
        fh=f1QamCA7q9SHrbTdr3a8R9gGjEMbnBcMGHFeghC4ppc=;
        b=O5GYBtteQVRxQhR7rP+ISnSRaieeq510fwpb9TBgQZTI5ZkGR0Fg0gb9pbO6hk+nSO
         4EjLH4RltRndCUKiN+gchh35awyqBffNG8vEUwQckGOw2bUA+5OTHaGdT43AQuXIZTNu
         /PZ6wcIgrDaA/tJnUlLwqh7Ep/EF/S/XHJGpRq5K9hx1Trrw3K4foeazapbWzXUHPRNH
         /LLe06XKYulLqcUBkM9lttLWHvWByUPELcDjzsrLcYaX8P1ra0cZn3SR3NqVLQMOIkIZ
         zVgQXaFgpABXuZJssDZPrkZF1z5lyrUovwtlxnmAsyL9trKGdoxJapQaIKe3jIRuWDdZ
         97Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789143012; x=1789747812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=chrq6RomQPNyRdzBhcaf19ect6USlxXFD+SAG73uJJw=;
        b=KwQx8JpaCTulaB/ZtonW11JxaTEBY2HdOz8CP/xDWmsHuzgJ9BqdzWwWJMKZqNY7D1
         nvUq5CHHyTdVvt+SKlwNHIlF4GVWB/quK2OdZMSA1yt6zZMWqo0eLAG6pmViiLZAtZlL
         TyJN5lGmnkvdwg6I8OEXNWTdk4Xkm3UDwAg/9/TFbNdXuB2fhhEEy8u/9vGleUFrfRTk
         h471sikR187AVIajF3HHoeNs0y+B2sppCiC7tpP583Q+nAmmC0lLsqTRYKgT5VDrfNqP
         zjMHStHoL5XnN3R37ZvJ/JZfezARO3DYCPwqjKk95wSg71YxpC5Z6db86gK0dx9bugnI
         GyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143012; x=1789747812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=chrq6RomQPNyRdzBhcaf19ect6USlxXFD+SAG73uJJw=;
        b=F0g14OvZCN2sfH5+IcTL+VfOPl4hqEe5jQ5pR7cj/yia3v97bAs0t+60N2MS+zaJpG
         liv08gD51y8ob/W0JeFV4QaxEvIBoeWIU5U9EyT6hgHZg+Mw6+QK0dpmM5P1bI2YxZ4C
         5CwowyzuPyeMhwJiqQ6Kiv9NqGcwr8LAhbllq6otBQVEKTdtU9xt1gOYq9v0HuHvx+am
         FAtcoJ2vyEC4nJKJA3GPth/Ndw2Q9+GqKTjVup3M2uxu8nOEli8fGjeKCfDhQ3tyE7/w
         Cle6Gzpsb73tpBad8vWxUfWP48xzFcZn6vjqtj8VU0w7JzIl8neaJyX3shBqvT0WL5yq
         vayQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3W6ExaMFrYuzcJCmSUL2xCBiuQ6ErW4nnwaa7wTfH0zezE2GchPvdCJUULDTs9dgSOM+jO7Sczh04/zY=@vger.kernel.org
X-Gm-Message-State: AFuF++mknb/w4qqd6yKm6DJlvj7aBf45wJv7RlTjJPad5UDpXWaVhwwo
	Zc+Xa0/Ks0D632MOdDd8bmUJxJPPAuSC32LRNxanNwAlncF1MlESM12yxM2Ul5aozuDHurMPTIX
	5Ay2XWw7GG1xoWayuPdh5C34D5RP8C7o=
X-Gm-Gg: AYBFou0vqs3dd5nOaJdgXyNzoWXCxnYYqPRv6uszeOTGAGraQf8BsLwEJaeCN6OGlnB
	TBnfwdG0iqF537xRxjVOFcU+1JAj9zb43syporqUsCe5Hoka/P+ebnLQLt0CWNIcfaB2wB1NqP/
	vOL9KjXUo28Gt9oVMsksoRUo3Tpef/S/V1veNemPhsderelcaF/1k3bu4Tn0NchLL+UySUJZJnm
	AWBJGuPMYgcQ5Id9gi7qLFXQOOEU/b0V2JyOYBlkQFwlTvBoes7BRvFfUsVfbsPEDyK5qemjfFH
	CL1H3+2NijaHOYmgs6ugfkU13ar6CIQlZt+24rO1QrxqHKPLVZU8OtE0ghGWvNbOeKvdUX30jrX
	jmowEZkhFXApC
X-Received: by 2002:a17:907:c16:b0:c21:601:6501 with SMTP id
 a640c23a62f3a-c29665e89fdmr193638666b.20.1789143011443; Fri, 11 Sep 2026
 09:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com> <CAKEwX=O8i+OsP6BJXNZNk07hveN9HDT+PoyMTAU6gOc-xp0Ppg@mail.gmail.com>
In-Reply-To: <CAKEwX=O8i+OsP6BJXNZNk07hveN9HDT+PoyMTAU6gOc-xp0Ppg@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 12 Sep 2026 00:09:31 +0800
X-Gm-Features: AcwNN1Un2LFNfTd7xdPlYuftb137wVckrxct0RVwonPV9MljgbG46bA08SXCPNY
Message-ID: <CAMgjq7BQeQQOZMDPFJ+8LS2N4t3x53r6Nm+9o0_pi92oVUgjgQ@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Nhat Pham <nphamcs@gmail.com>
Cc: Chris Li <chrisl@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
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

On Wed, Sep 9, 2026 at 12:36=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Sun, Sep 6, 2026 at 10:52=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wr=
ote:
>
> Hi Kairui,
>
> Thank you for the kind words and encouragement :) It means a lot
> coming from you.
>
> My main concern so far has been - it seems like every time I satisfied
> one of your guys' requirements, another pre-requisite is added to the
> list. I mean the performance regression and memory overhead concerns
> make a lot of sense, especially when vswap is non-optional. But now it
> just seems like we're delaying real use case for the fabled perfect
> swap system. It gets very exhausting trying to keep expanding the
> scope of this.

Hi Nhat

I also wish we could do things at a faster pace in upstream :), that's
a challenge for all of us...

> >
> > I asked Baoquan the same thing, see the "Why not make both args
> > optional" part:
> >
> > https://lore.kernel.org/linux-mm/apaw_XmqnEcY8sv7@MiWiFi-R3L-srv/
> >
> > Where I've ended up is that unbounded growth is a real concern. On a
> > host with no memcg limit (root cgroup, and most desktop and embedded
> > setups), an unlimited pool means usage can keep growing, with no
> > admin visible ceiling at all. I'm not attached to xswap's percent of RA=
M
> > knob specifically, but I do think some kind of bound makes sense.
>
> Technically speaking, virtual swap *is* bounded, i.e 8PB (xarray
> induced a limit to the number of clusters it can allocate). But more
> importantly, it's effectively capped by the backend it can take:
> zswap, swap cache, disk swap, etc.

Right... See below.

> > Agreed completely, and I think this one is settled: whatever lands
> > has to support disk writeback in the end. Baoquan mentioned that
> > what he sent is just a foundation though. I know talking is cheap
> > but still, could it be combined with the writeback support from the
> > other side? Or am I missing anything here?
>
> I'm just very nervous about any design that doesn't quite take that
> into account and handwave it away into a follow-up :)

In fact, checking the code, it seems it won't be hard to just glue the
vswap writeback to the xswap design? Maybe that's not the right way,
but I'm just saying it seems it won't be a problem, we need to think
twice about this.

> > > 3. Cgroup charging behavior. vswap/xswap shouldn't be charged against=
 the
> > >    swap usage counter. It's fundamentally a different resource from
> > >    physical swapfile space, and memory.swap.* should read 0 when noth=
ing is
> > >    on disk [18]. I made the longer argument for this in [19].
> >
> > I personally don't have a strong opinion on this. But I think this
> > needs an explicit decision from the group rather than being
> > inherited from whichever series merges first. Skipping the charge
> > when a device has a special flag isn't hard to do if the code
> > abstraction is done well, so this is more of a design decision
> > than a technical problem.
>
> I'm fine with discussing about this. I just want to point out that
> this is not something I snuck in :) This has been the behavior since
> probably the first or second RFC of the first design though, and in
> most of them, it is a front-and-centre patch of its own, not hushed
> away in one big patch. Folks have had 1.5 years to comment on it (and
> still not too late - nothing is merged yet!)
>
> I'd love to hear opinions from other zswap users regarding this :)

Right, I still have no strong opinion on this yet, up to you guys :)

>
> >
> > > 4. Data structure (xarray vs sparse vmalloc array). Even with xarray,=
 vswap
> > >    is already on par with or beating baseline. I like the sparse arra=
y
> > >    idea, but why are we landing an optimization before the feature it=
self,
> > >    without any A/B data showing the difference matters?
> >
> > This is where I'd push back a little. To be clear, my concern isn't the
> > size of the win, it's that VM_SPARSE isn't purely an optimization. It
> > changes the cluster/metadata layout and avoids RCU conventions,
> > could help avoid some future sleep while atomic limitations and
> > it's tangled with the initial size issue too. So bolting it on afterwar=
ds
> > could mean rewriting the parts of vswap that touch it and could be
> > costly some conflict in ideas. That's why I'd rather we agree on
> > it now, not that it has to land first.
>
> I don't think the current code differs significantly from the existing
> model, no?
>
> For the most part, RCU played quite nicely with the current swap code.
> Practically, it's just:
>
> 1. If you have a reference to the swap entry, you can assume entry and
> the cluster owning it is safe.
>
> 2. If you don't, then do not assume it's safe once you exit the rcu
> read section.
>
> What conflicts specifically do you have in mind here :)

Yeah you're right. I'm just a bit worried if that RCU period will be
extended, and it's always better to make the convention as simple as
possible. I'm already trying to get rid of the local lock, in that
swap queue series, that is not so painful and still a bit troublesome
for a few new use cases.

> > Using VM_SPARSE does outsmart my earlier xarray suggestion :) There
> > is an interesting early benchmark from Baoquan, VM_SPARSE wasn't there
> > yet, but with it we can use clusters natively in the same way. It shows
> > about 20% latency cut and 10% throughput gain, which seems a major
> > improvement, and that's serial performance, not even mentioning
> > scalability yet:
> > https://lore.kernel.org/linux-mm/20260707073215.72183-1-baoquan.he@linu=
x.dev/
>
> I think a lot of these wins come from the fact that the zswap's xarray
> specifically is *really* bad in certain paths. For instance, in the
> free path (swap_range_free() -> zswap_invalidate()), there is no
> batching behavior, so we walk the tree from scratch for each entry
> rather than using an xas iterator for the entire batch. That goes away
> in the current vswap model, because the xarray manages cluster rather
> than entries, so you just do one tree walk + one flat array walk.

Right but with vswap replacing zswap, isn't the performance is still
basically unchanged according to your test (or just a little bit
faster)? My test still doesn't show a measurable improvement.

> zswap and swapfile coupled, but only remove the xarray and replace it
> with the flat array in swapfile's cluster struct. I observe the same
> win, basically (especially on the usemem benchmark).

Yeah, merging the zswap xarray into cluster should buy a lot of
performance gain, the only concern is the cluster it self is in a
xarray tree so if your vswap space gets huge, could that somehow
become an issue? Zswap used a split xarray, and swap also used to have
a 64M partition for the swap cache xarray, which is gone after the
swap table.

...

> > We were also discussing the limitation of the global cluster cache in
> > that thread, so I paused my other work for a while and posted the swap
> > queue series first. That one is orthogonal on purpose, and helps both
> > swap tier and vswap, it reduces the overhead enough to cancel out
> > the layering cost due to missing caching for either:
> > https://lore.kernel.org/linux-mm/20260829-swap-pcp-priq-v2-resend-0-68d=
3d925578c@gmail.com/
> > (this is V2, V1 is earlier - thanks to Lian for keeping this going!)
>
> Ah that! I sort of tabled that as a nice-idea-but-still-optimization :P
>
> I'll spend some time thinking about the design and reviewing it. In
> the long run, it will get things more simple, but another thing that
> should not be a blocker, correct?

Right, definitely not a blocker. I think the swap queue could be
merged after tiering and other stuff, as an optimization, just to
demonstrate that we don't need another layer of cache; we can just use
the devices directly without any cache above them. It will also
deprecate plist; with the only plist rotate user is gone, we can get
rid of a large chunk of common plist code.

...

> > The two interfaces aren't equivalent, xswap has its limitations, but a
> > couple of xswap's properties look genuinely better to me. Runtime
> > on/off rather than a boot parameter is better, more flexibility and
>
> I would also like to point out - I *do* have a runtime parameter in an
> older version of vswap (v3). There is also not a lot of engagement
> from folks in that version - no one expressed any interest in that
> runtime knob in particular. Only Johannes made the case that a boot
> parameter is superior, so I switched over. I think his reasoning makes
> sense at the time FWIW, and it also removes the need for CONFIG_VSWAP
> (which in turns remove a bunch of useless stubs - saving 100 LoCs), so
> I figure folks will prefer less code and less userspace decisions :)
>
> v3: https://lore.kernel.org/all/20260806184254.3790858-1-nphamcs@gmail.co=
m/

Ah, thanks for the reminder.

> Regardless - do you have a specific use case in mind where a runtime
> knob would be useful?

A boot time bool will cause real trouble for us, at least. We have
many VMs with fixed boot images and fixed cmdlines. However, the VM
itself is used by different customers, some are ZRAM only users, and
quite a lot don't want any kind of compression (e.g. their data is
dense compression is just waste of CPU) and prefer plain swap. So I do
hope we can have a runtime tunable instead of modifying the cmdline
and rebooting or rebuilding the base image for different cases, and we
have already seen that a runtime toggle isn't hard at all.

> > doesn't conflict with what vswap is trying to do. Some other of these
> > differences involve design decisions rather than just surface knobs,
> > and those are the parts we're stuck with once they ship.
> >
> > So a few current interface difference of vswap and xswap I've noticed a=
re:
> >
> >  - default size: somehow also tangled with VM_SPARSE, which
> > needs an initial virtual value. It's super cheap if not zero cost
> > (the only cost is occupying some vmalloc area, which is fine
> > I guess?). But we still have to pick a number, could be large
> > enough to satisfy everyone?
>
> 8PB? ;)

Right I saw that at V1 :).

I'm not sure if this is the reason that is in conflict with VM_SPARSE
in your mind? Techically, at least for 64 bit, we can just apply the
same limit to VM_SPARSE, for 64 bit machines we have a lot of virtual
space to consume and that should be fine (VM_SPARSE is just the
cluster map, which is much smaller compared to swap space).

And another thing is do we really need that much in any case? Will
things like, e.g. 64 times the physical memory (max pfn) be enough? I
know Baoquan suggest just use the physical memory size. So that could
be tunable, it's really easy to tune, just a number.

For things like an extremely high amount of zero folio swap, I think
remapping the zero folio it self is definately a better idea instead
of wasting a lot of SWAP entries and metadata in the long term

> >  - boot vs runtime toggle: I believe a runtime toggle is better. It
> > can still be tuned on boot via cmdline, but it offers the extra
> > ability to turn it on without modifying a base VM boot image or
> > kernel.
> >  - growth / limits: as talked above.
> >  - charging semantics
> >  - there could be other longterm design decisions on top of these as
> > we talked in above.
> >
> > Once these settle, I think the picture will be clean. Your writeback
> > logic and swap table integration are solid, while Baoquan's VM_SPARSE,
> > previous preparation with swap ops give us a structural foundation. A
> > clean long-term architecture means getting the core structure right,
> > let's try not treating this as a race between series.
>
> I've reached out to Baoquan as well, but I figured there's value in
> both discussions in big and small groups, and especially since there's
> a chance some of us might not be coming to LPC. Let's see what we come
> up with.

I'll be there this year if nothing goes wrong :), I hope we can come
up with something.

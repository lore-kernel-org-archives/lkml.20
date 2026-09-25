Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A593B774D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355303; cv=pass; b=N/5UoI5lmcVTqWB0WrdZPFhutIwgvFAlzPfTfxWrg3ewhwdjW+w+UTkJxooEekAql1WofcFRc0+hmHiKUUfXIx0zzP0tm494TYopnp6nuLddZMBYF8CDE5LNz5bB12NTXjqZq+P21QjpWhVKh7grYbvvfk1roHJi9lM1g0hq6rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355303; c=relaxed/simple;
	bh=Rq8JlmKjQPqCOGt36H4bhTZin8GIP9f142Zycu8n3OI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Chq/DQJBKY22BIxlH2fDfTHAohUNmu5yjlI/UCA+e6H9fZ/ywyWihq1RGlas4NLnKOFQ8rPAZYwQPOD9lB9ohZO9gL2hDxNvx/rBdTa9ckJQN7VELG/tfeMDqzDxC7UkjPbW86uAppX9v2xxIaIk5O5Vk6hJix9Z9k/78+tLfSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTl1cngy; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTl1cngy"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so923408f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790355277; cv=none;
        d=google.com; s=arc-20260327;
        b=YEi5NFPGKKAb2IRCRYmH/GgACAm2fYVIubVjrcY3VtZWyarVfAfoYCDEsG3udKYYu6
         0dv5qy5yQoeLB9etwWnLiSmtd8VrwQ2VJkg37sxu2LiApy56a5wGmkFXQ69AHYZ0BCtO
         4YUXP0SFUH+iTGPBvPSHYAMDto3T3nQp4yStN/H+YShWPkI3QB1KLKkuUM1zwrlHJArO
         +vUN+H9bDDGnSKlMva9Ggy+4eaH4ENYXonVdIvwARvVuuMeQxCN9kleKQ1e91eQz+bQt
         thgvUqyeTveWvQHyxzFNAh7BNIRoYSfN+mGSC0qoE+vGsSBPtYD1ILvPNqK0nPlR97BT
         1bSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zB6y5YhkOLzSNaiUrMoC/Z2pJ3kqHY43Xibqpz7MDRs=;
        fh=pLDpTQ5itpxDCz4ulSHXoHYVG2uc+wFArkPKY+rJouE=;
        b=fvLfDiMoo9ZvO/gl1D1GkJJlITumoY5HmtG2ih5RO54hcBzYmd7l8QoYOOhRyrV9W5
         wQ20WW12NOFxmjWmCcKQjJV9EPrI+w5Q6mqRdb2BvYKnBhcV3vmc60fu/35+nWTyMOc0
         y21fABKLIhHzG9ZVptDSl6XG2SpHng91BgXpuC1rcT0TNtq7ZNm3CWYhP/0IFp/kN2+/
         /WoxZOChmCzDv6zto99+Bcdlp69friE/JqiSjIZEb6jMH2xPBDy3BGZwVFXEjRpLSB15
         oQ/nQMobBma4X9oGG45dYMYRsZUcPSbtMYx3EYtC7XFU0vQlIn/2v8/60XPgWf6MfVEV
         fMQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790355277; x=1790960077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zB6y5YhkOLzSNaiUrMoC/Z2pJ3kqHY43Xibqpz7MDRs=;
        b=YTl1cngyva0z4WhvRtyB2EXtfsgpzF6BRD6CQnHXqoE91l/eC3TCidBhVn69KJ6fxC
         kmq0MBFXBOEGmfl+mu5jMxIfjJmuJShXWKZEyodZxw9p0pTgYRdeveRpnty22LIUd567
         P4zPw0JbSJg6DhkTtqFP52fKy9X69R9WYhI0n+eFsnEX54YvWVkLLIxRTJYvSKbBGRPE
         mqmx6myzJDRz/Bu62ukSWYUH3DfLygiPzecFUoDV/j+eS7wB3BYJCBt3QiJ+Fa0qHWUA
         I1HDPzscBnfcOYZYiwnWjcvxYLKoqK2+h4yGGKkLbb/N62PiEiEmHQT8YXqcfLQD3AUm
         dvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355277; x=1790960077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zB6y5YhkOLzSNaiUrMoC/Z2pJ3kqHY43Xibqpz7MDRs=;
        b=XCzRik5L/TZVH6wKV73DPNNZJYBzRWaRse+jKHNcKCZiw7SpLPanmcKWpl3Mxit4s0
         EvspRWEwWG4LLsyjKntI1wNUIx/xW5MP6N1AVNxOoDVvmpFX+C6guZg7bUCT2rt8rmY5
         RhGENjg6fB0J3txurZPi7WrfRDCEdd4CcRLLh3xX3A2AaMMTelZ+uUuB2jIYXPnImR1n
         Ns9k0wx3tVCRCaI9KVan7xT43Hv+DeFhNC+9px4XNefbisa77OgShmoOD7L5G3ZNzIFU
         ZiMAEzZCTaaRLQ8ofi+RFFJgJRn7RvVtdnhIkHFR7cMwKteAthhlJFlQBwouGMl6ZTx9
         KWnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYWXo8P7n2bIszglWxCz7nciW9IzsyeT11/1J5II51RyaSp/BOmkVAicFflWg4IWdfTcj0DrMoYSGrFbM=@vger.kernel.org
X-Gm-Message-State: AFuF++n63FHRBgYVc64hA162ALGMfTPAjlXiwRqM3SeAslYP3fSoJyGw
	0Iq4xrst8kQLZjZ/9Bd1m5ccox16NE/ctxpgyCTmI+ZNqzj7bWxIsxi6z42bvQwKchLieAN9yE9
	KTK/IHoXqaVZ8aeHGUHlgMLpZ0dFfsVM=
X-Gm-Gg: AYBFou1LLn/J30THxIbrScsABJGsss/iBe3RY7yk83RpWeIPdod7HKggbL2AlR3bvxo
	fzO4fyrRq7cUH7x8q6nrCtHEUnxlx4vClnDntuhMMgluCk2ZsUZkPwtjasxSiBh/acv1YDLvZMM
	xt4BUblpG5KlBgiZ4c/zCfPDbsZlbCtVfuOr6Bq0UXE9VmlLTvnxS5JPAfEmYcOEU9/SkH6HNYk
	Np76Eljn71v4y3Vp/wHKl03y0mmqF/ot1BVh1SxKuqAxXoEy0zfg87BA1lebqeehDttDhMquLHe
	8/DUP6jnr9Lv9pfXqWhIxtlUmJUxRxpMqmkCmzBIPFpEzF4sE+zkusxjfsWfIqaJ5zadC62uth6
	4KkqL4KGvBK0=
X-Received: by 2002:a05:6000:2c0e:b0:488:8546:d0b2 with SMTP id
 ffacd0b85a97d-4888546d0e7mr166478f8f.51.1790355276640; Fri, 25 Sep 2026
 09:54:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aqQrPLPXHXiuKup0@linux.dev> <aqjcFb6MFNiA6n4V@fedora>
 <aqjpYHbZ14A8xRtK@fedora> <CACePvbUwTxcMPVK_1GAz5gPDdh0BV9JZSnKXaUFLqDHBzBmPQg@mail.gmail.com>
 <7ee199ddee81bf8026688def82f78ad9db09be9e.camel@surriel.com>
 <CACePvbVA+DnDJprMx3qOrGb98y1ORQ-LfaENy_Btfx3uW=E4eQ@mail.gmail.com>
 <f3ca71f1c561f28a341de0e5a1b3f24bd4da3201.camel@surriel.com>
 <CACePvbX5Oy98DygLZjC=Z03Lqb0nk50_OEKQCT9svbQOOwwDew@mail.gmail.com>
 <CAKEwX=Mv+tnL8K4rfPuof6mKaLQp=tqR_qjtKrtY0-5L85FLfw@mail.gmail.com>
 <CACePvbUF2QQMh_GiCNQn-RTmZNkkLWkmaHSYzdQwv2fupjNQiw@mail.gmail.com> <arUcil9kxUPiymXI@KASONG-MC4>
In-Reply-To: <arUcil9kxUPiymXI@KASONG-MC4>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 25 Sep 2026 09:54:25 -0700
X-Gm-Features: AclHuK-Pj8MGTN6slhH4ZC6bRNscyhuI_rUSwJmyxZ_HRRIbsrEA4QXnbtSmaac
Message-ID: <CAKEwX=PXRB35bUL1=O4Bgx9A7aD4izZZ3dcEcCuMBBhBrMv7fg@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Kairui Song <ryncsn@gmail.com>
Cc: Chris Li <chrisl@kernel.org>, Rik van Riel <riel@surriel.com>, 
	Baoquan He <baoquan.he@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
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

On Fri, Sep 25, 2026 at 6:15=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Tue, Sep 22, 2026 at 09:44:37PM +0100, Chris Li wrote:
> > It seems you are talking about a different topic: the vswap charging is=
sue.
> > There is a golden rule that we should follow: don't break existing
> > users. At least with the same persistence, this rule should apply
> > universally.
> > In the swap tiers discussion, the UAPI was such a big deal that we
> > couldn't implement new UAPI. On the other hand here we argue for
> > liberally changing user-space visible behavior.
> >
> > BTW, I already shared that changing swap counter charging will break
> > our and others' existing deployments.
>
> Hi all

Hi Kairui,

Thank you for your thoughtful response! Lots of food for thought for me :)


>
> As I read the threads and try to clean up the requirement, just
> realized that I forgot and ignored something previously. I think I can
> share a few things here.
>
> I also see that Rik mentioning that:
>
> > It adds up anonymous, file, accounted slab, and
> > (after compression) zswap memory use for a cgroup,
> > and can be limited with all the usual cgroup
> > limits.
>
> That's very true, and that's also the one reason we can't
> migrate some workload to zswap easily (at least yet) :D
> See below.
>
> The discussion on this can be saw two years before (I know
> things are different for V2, so see below):
> https://lore.kernel.org/linux-mm/CAMgjq7AYA91f4g-bknUZOMg6hApTD-X5LqjcTBN=
2u-Lu8pjs+w@mail.gmail.com/
>
> An minor update for that, memsw in V1 serves pretty well (we also
> modded that part and would try push to upstream if doable), and as
> memsw is missing in V2, we can still workaround that using
> memory.current and memory.swap.current. BUt missing the offloaded
> part in memory.swap seems a problem.
>
> First a little bit off topic, I'll be really happy if we can make
> both compressed memory and swap as separate counters (I even once
> tried to implement a zpool accounting to account compressed memory
> in some unified way, but, well, zpool got killed before I post
> that :P), or at least a way to do that, e.g. something like nokmem.
> Due to our real usage:
>
> With compressed memory staying in a separate counter (which
> we manged to do that with ZRAM) the memory.current + memory.swap
> (or, memsw for cgv1) could be the exactly planned or sold size of a
> container, the scheduler (e.g. from k8s level) is fully aware of
> the packing rate of a host based on this reading. and can make
> scheduling decisions based on that. And can control it by
> adjusting the limit two combined.
>
> But with compression as a fixed part in memory.current, first the
> compression rate is totally uncontrollable, both the user and us
> will be fully *unaware* of how much memory they can *actually* use,
> that makes the planning really awkward. memory.max stops being the
> bound of what we planned or sold, anything compressed lets the raw
> footprint go past it by however much the compression ratio happens
> to give, so what we oversold is bounded by the workload's data and
> not by anything we configure. We can substract the zswap reading
> though with adaption, however it's hard to change the performance,
> OOM behavior or reclaim behavior:
>
> As you may considering compression is trading CPU time with memory,
> then two things here: the user could use more memory than we expected
> by burning the CPU. And, some users has a leaking application, the
> application could goes super slow or experiencing high CPU usage due
> to memory being compressed. They really just want to get OOM killed
> in time when ever the application leaks beyound a threshold (and
> yes that is a real and actually practical model for many applications).
> And, we can't simply disable memory compression for them.
>
> In many cases we just want a best effort compression to make space
> for low priority tasks, and do not want ordinary containers to use
> compression at the cost of lose of performance. While still has
> a fixed limit as usual. So simply disable memory compression is also
> not the plan, we do need compression to make place for other
> applications, we just don't want their real raw usage to exceed
> memory.max, and we can dynamically adjust memory.swap.max to
> control the oversold part, compression or physical.
>
> And this is not about residency, so memory.min/low don't help here:
> it's about overselling, and about not leaving a container thrashing in
> compress/decompress loops instead of being killed.
>
> And if the memory compression is really fully transparent (not
> doable by software), yeah, that's great as there is nothing to do
> with reclaim.  But, for now, we have to go through page fault / folio
> allocation / map it again. So For example, if we already have
> memory.max =3D=3D memory.current or under high pressure, then now
> doing any read from the compressed part would need to some
> require further eviction first to make place for the decompressed
> new data, this is not like any kind of "real" memory, something
> feels not right here.
>
> Another thing is that I think we has been assuming that physical
> swap is slower than compressed memory, which is not always true either.
> They all need to be read through page fault, the page fault could
> be the real blocker here rather than IO or de-compression.
>
> I also want to separate two things that I think got bundled together
> here: not requiring a physical slot behind a compressed entry, and not
> charging the raw size to the swap counter. The first one is great, yeah,
> and it's exactly the part we want, it's what makes compression usable
> without provisioning disk. The second one is a policy change, maybe it's
> not needed for the first stage, charging a cgroup for the
> memories it has offloaded doesn't require any slot to exist behind them.
> If someone wants to run memory compression with no disk at all,
> memory.swap.max defaults to max, so that still works fine, right?
>
> And I'm not saying "keep everything as it is forever": it is that the
> raw offloaded size (the entries, whatever the backing ends up being)
> should stays accounted and enforceable, and that anything which wants
> to describe physical storage gets its own counter.
>
> And I'm not asking the compression layer to have an opinion on how
> much compression or ratio is too much, just think we need a sane limit
> for container schedulers to sets on top of it.
>
> And "it's opt-in so nobody breaks" doesn't really hold for us: we do
> want generic compression solution, that's the whole point, so we would
> be turning the knob on and losing the counter at the same time. If we
> want one generic solution for memory compression, this is not opt-in.
>
> And if we check again, currently, with upstream kernel,
> using ZRAM, we have:
>
> memory.max: control the raw usage of application.
> memory.swap.current/max: controls the offloaded size/limit of a applicati=
on.
> With (memory.max + memory.swap.max) <=3D planned usage (and this is memsw=
).
>
> We can keep the compressed part in memory.current of course, as already
> did in upstream with ZSWAP, and things can be further adapted, we
> still have:
>
> memory.max: control the real usage of application.
> memory.swap.current/max: controls the offloaded size/limit of a applicati=
on.
> With (memory.max - <compress memory> + memory.swap.max) <=3D planned usag=
e.
>
> Things are not too crazy, but if we lose the compressed raw size in
> memory.swap, things seem to be out of control: the raw footprint can go
> past memory.max by whatever the compression ratio happens to give, and
> nothing bounds it in raw terms, memory.zswap.max is in compressed bytes
> and zero-filled entries are not covered by anything. I can't see a very
> clean offloading model for us here.  And we note, use use both kind
> of deployments, pure compression and hybrid writeback.


Thanks for explaining your perspective!

>
> Just for reference. Maybe a seperate counter, tiering, is a better idea
> than changing the swap counter?

I think memory.swap.* is never meant to be used as the "offloaded
footprint". It is incidentally correct, because of architectural
limitations: zswap/swap cache/zero page usage leads to real
consumption of real resources (physical swapfile).

But I understand your concerns regarding the missing observability of
the "logical" footprint (i.e the "offloaded size"), and how that would
hamper legitimate use cases.

How about a vswap counter that tracks the vswap usage? That would
provide the "logical" view. Userspace can then monitor and act based
on it.

I think that should cover both of the situations that you (and
Johannes in [1]) pointed out:

(1): With memory.current and this vswap counter, you can kill any
workloads that violate the level of overcommitting that you set out.

(2): For us, we can use memory.swap.* counter to provide isolation to
the physical swap space, which is a real, static resource that can be
hogged.

There will unfortunately be changes in userspace programs/scripts that
is required. It's unavoidable. We're adding a new behavior. It's the
whole point of this line of work. But I think as long as we provide a)
a way for userspace to index on (the param which tells you if vswap is
enabled or not) and b) enough userspace machinery to achieve most
common use cases, it should be good.

Let me know what you think. I look forward to hearing from you :)

[1]: https://lore.kernel.org/all/araWKyJ5MENBwXCL@cmpxchg.org/

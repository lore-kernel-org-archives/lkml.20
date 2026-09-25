Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90DE3C198A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359485; cv=pass; b=I4w8B+1Z8lqeGI2DqEl6y7dSlSc7pDqU9Trp6OgSXt1JyN3hhOAFFdP4K9XW/3ecVPd1xZ54A/TqbOnEDVfcdZ4yHp8gKLqdYQCXknPK0Z3LTMSBR46QUUjWT//Gvua7Lry7Hoz+Yw3ncV4ZccrtxxdBxeDp9c2ux3YA17qWMJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359485; c=relaxed/simple;
	bh=QEH8L5cDVVxNiTq6xVhREUG3v4qVPQmEXXMWF/9zco8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oulKMhzEFciKeeJtJ+Y63Ztpusas6j9cfj37NNLpMbV9vhouybdz9R7FY+X40f71+WNomJd887Rgsqhyghn/AdearkIh8M5plByUzx6S9dyODmUHBP9Kl+AO7ZVvEuys904BALT+lwFNs71cxvgGfhpryxOrXUtzqH20f80rPDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPkuGcz0; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPkuGcz0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so955284f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790359482; cv=none;
        d=google.com; s=arc-20260327;
        b=E3vRDMbt5oYdLtE2jtZXFeAOESBh8OISA2AP2kdNoa7qW9Xhm/NWFea1/HiQ96VMy9
         ghDeu6JIIWEWNoPrn+02na9tqwBiOL3IKCr6juSWeR+Q61lLMwvQFbGwRbH46qc/+mf0
         H5GVZpt+UM4gjiNwpl6FuL0LCGuPvn7HxEBUyVFlNpl9PgNEsyyFOpexXnUdE1RIj61t
         8XlmeIzfLhLmVpdT0mezXujlzfGE20WMkTgeVa8U4a8bOXSDpKBAtjcACcl36catK3T0
         SyKHQNGCe5sBgimZ1aGzUrxUYM261MfQWsJNU3Qxq031sW9OMMmrJAiOiz0BeVMGu92F
         taPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vBI+n6R1FCbaNpcY2beRWPIJrzbCO758rgC3BSuPO/g=;
        fh=oMXlED/bUmf08PWolAhkF6vikmELtdCleyYT5FnrisQ=;
        b=Yscvho38cpKeaR3pmZoPmb92CIQbxWsxOXYB2tKTgVuuxvIHOYX2tMe0JnqpF4N1oI
         fwVSe0aAovFqVglBSmio3a5S8WaVKAC8yW/toV3+w7bk5isJee/+m8R9ASy7hTrgUVSC
         FmLsUP5263UjnpsMiMEGX9sD5NxCj7iQDsYAON9foLHSV8KctQ2d5PciJRmkI425ohks
         h4ToT9H/zt+nGMq4rzMCLGgWAj6mfvdKh6pQv3Q+AYKkm77UklUbxVoeSP7vsF9CrMLd
         i2y3KAp273us6bZ1eKQ3QF0309GAZP/5unhP47OQVoVaWRGCTkIel8ElVal0B3zp2HcW
         OIRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359482; x=1790964282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vBI+n6R1FCbaNpcY2beRWPIJrzbCO758rgC3BSuPO/g=;
        b=MPkuGcz0vLDQc2fb6kFEdZF9hKQ173BCZpK7mgdUD5eloYUxfn4x3O8v1Xz71sqFy3
         pvulI2vzB57DaN43okv/1HzCeVRC5xq4Jp2Fc6BkqkHKt5dVIyt/8akpDmBDvbwq2K7j
         IOBb3s7aHYI6pWt6Pv4UlwAYgPnmSz7Zm+VXp+BSK9G8aKyL5wnT2KgKbmgsXfKnP402
         koWgmc284r6Vx719JWO+mUkHAIlq/PGdowxYFcDc5PGq6w6WsUmH1HlCIlFn7DS3XnYq
         /uLfJugGMp+1jCMM7/tirzzFmi/Nc3N1A6anuAXXFt9swRUn1pZFHpkMjjAjN6NfkHkg
         96Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359482; x=1790964282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBI+n6R1FCbaNpcY2beRWPIJrzbCO758rgC3BSuPO/g=;
        b=2rPDPIlAVzZ8T6mHiV5SpLG+yN/87jvZslhoa6NUJVs9GfmJ0kzAFyTEU4sfJtcDOQ
         ElVOGVnGMM7l4d/i4BlET3Hk0Q09k2BoWaenocTqvtWMvvWgfL/HV9fLUmG5TOF2gows
         6GwV9C7+JSJxkyxrm824M4kxXENl7uFNo+m0IGhwWey/U+yhEDBN5ZMRGkUUaKEfcx0r
         90YsDn5lGLWJX/NZQAe6ouSTJTH0rXetcoADiWtq5qZXE2VfYf3VifylwVgRLyNuG8GL
         KHH5YzVUABQPPQeHfAQJq6ZCt27MfFOgx29dHbVa8pzjwkcOszocfqls8+Ni3TMs1w7w
         vwcg==
X-Forwarded-Encrypted: i=1; AKwUvBw75waXE0LBcIti4oZg6LSC0x/y7RxVnSsUVWSThufFp2pYYPbBtB5Afh4msfKIVCyCpE6hRp2++Vqj0rM=@vger.kernel.org
X-Gm-Message-State: AFuF++lgzCJHXc4PBFMcEzCGAL8dUQs6rroeANLdAnFUGOINi1pBCckC
	v1yMbnJxsLLQylIvhRaCBJSr4Mj7DnRp5MX6ssKs9NkbEcZ4qxJ1LpyGJvEy984LcAMM1AnOOuF
	ZDq6k419OO5nh3+80YHQkzFRWaK4Nn98=
X-Gm-Gg: AYBFou25rmZfrdzzQy6YRKT9JTbPPDR6WYcMAAlffSXdtL9TUrTmR1ZHPnBHPs1mZx5
	jQKdkjNJMM9Sv5WX9cHOtTzB8HDFcL+eMtYQl2T0igT3aIIVAcPWCbaiJhdUqb9Isea+DmjqdQg
	rcoZ6dU2FyqRz+8Z4DF91BUSb4AUC1TzNo5uSGFHCGppB8FgmoQnBDLGRiIM97WSGQ114AV2Ffx
	pt5sMe4WE0ZuzK3RWWpc2Ft4vnfRxj8ph5Krd5/D9wwX394QxrWGanCyWlXuJyhMjhZciFhl3ja
	g1MBYPe8qx7cfuInibyp6TaNoh51eNIImelboQ4y64dRDgafTPXH/q6B5o9qq9VjYF3IELEwz97
	3gKd+Dh4Gvg==
X-Received: by 2002:adf:e188:0:b0:486:f980:2361 with SMTP id
 ffacd0b85a97d-48872ac750cmr11089879f8f.45.1790359481944; Fri, 25 Sep 2026
 11:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com> <20260918180241.3424851-2-nphamcs@gmail.com>
 <CACePvbVaDNspMDSw_qAcapKAzXj3JGV-KMYmow7aePa0POHpSg@mail.gmail.com>
 <CAKEwX=OP3Gb9sVOvch+p4j7quzgy-rUY=UTZau5ztMj7heJJoA@mail.gmail.com> <CACePvbVQsHXt4=+qfKz-KTar9CG+3OiAfLd1EZgnRE-1gyoKOQ@mail.gmail.com>
In-Reply-To: <CACePvbVQsHXt4=+qfKz-KTar9CG+3OiAfLd1EZgnRE-1gyoKOQ@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 25 Sep 2026 11:04:30 -0700
X-Gm-Features: AclHuK9M6sByraBalcuxusp1b55zwq77trojcuE4-O8KiH1MjzZCIBnwjTVVWQA
Message-ID: <CAKEwX=M8pJUYhmADfvdk+09O53EROyDRC+_b05vtimQE5VN=qQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] mm, swap: add virtual swap device infrastructure
To: Chris Li <chrisl@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	yosry@kernel.org, david@kernel.org, muchun.song@linux.dev, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, chengming.zhou@linux.dev, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, kunwu.chan@linux.dev, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 5:44=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote:
>
> On Thu, Sep 24, 2026 at 6:20=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Wed, Sep 23, 2026 at 2:18=E2=80=AFAM Chris Li <chrisl@kernel.org> wr=
ote:
> > >
> > >
> > > There are too many swap_is_vswap() in this series. It fragments the
> > > code path, making things harder to reason about. Esepcially around
> > > locks. I count 22 in this patch alone.
> > >
> > > I consider this the biggest drawback of this series. This
> > > fragmentation of the code path.
> >
> > This will mirror my response at [1], but I'm responding here for the
> > record and for your convenience.
>
> Thank you. Really appriciate that.
>
> > It is needed because vswap *is* a special device, with its own
> > requirements. If you don't special case-it, you'd get undesirable
> > behaviors.
>
> Ack, that is why I am against making it a special device. That is the
> whole idea behind xswap. It is just normal swap device implemented via
> swap_ops just like ext4 is a file system implemnet on top of VFS.
>
> > Let's take Baoquan's patch series as an example.  It treats the xswap
> > device as just another swap device, without any special consideration
> > for it. Which creates several problem:
>
> That is a careful design choice. Keep in mind that design choice
> usually has pros and cons.
>
> I will follow your feedback here.
>
> > 1. At allocation time, cgroups that disable zswap might get an xswap
> > slot, because you don't do any check that the device you allocating
> > the swap slots for is xswap. At swap_writeout() time, it is *stuck* -
> > we already do the unmapping step, so we cannot reclaim the page.
> >
> > Ironically a physical swapfile backend could have bailed us out here,
> > but it's not in that patch series yet :)
>
> I am not sure I follow. Are you referring to the uncompressible pages
> that xswap would have to reject?
>
> One way to address that is for xswap to just bite the bullet and store
> the uncompressible pages within xswap. That way it will stay out of
> the reclaim LRU. Zswap also stores some uncompressible pages. The last
> time I checked, it was unfortunately not able to serve my case but
> perfect for yours.

Not even that. Say you have two kind of workloads in the same host:
workload enables disk swap but disable zswap (zswap.max =3D 0), and
workload that wants zswap. Let's even ignore writeback for now.

You add 2 "swap devices" to the system: xswap and NVME swapfile.

At swap allocation time, xswap patch series does not check carefully
which swap device is being used, so you might get an xswap slot for
the cgroup that disables zswap. You're stuck at swap_writeout() time.
You can't undo it anymore, and you don't even support the physical
swapfile backend to fallback.


>
> > Vswap both has swapfile backend, AND allows you to bypass it if the
> > cgroup disables zswap. Both involves a bit of swap_is_vswap() check,
> > but I think it's worth it :)
>
> If xswap needs the lower tier it can allocate for one. I don't think
> xswap should need to have swap_is_xswap() there. Also xswap does not
> have all the baggage of zswap.writeback enable interface.

But that's my point. As of now, it does not. Unless you merge the
other RFC series, which brings it to roughly the same size as what I'm
doing here.

>
>
> >
> > 2. Per-CPU allocation caching: since all devices share the same cache,
> > xswap will invalidate the caching of other devices, and vice versa. It
> > would be fine if the these devices are interchangeable, but as noted
> > above, it's not, especially without physical swapfile as the backend
> > option. So you're forced to taken the slow path more often.
>
> This will be addressed by the swap tiers series if it is not delayed.
> This should be addressed in the core swap layer not vswap. Kairui also
> has some ideas to improve that. Yes, it is a problem area, but it is
> not specific to xswap. We are well aware of it and have plans to
> improve it.


Which is 2 massive patch series away. Also, I don't know how close we
are to reaching a consensus on swap.tier. I defer that to memcg
maintainers.

>
> >
> > Vswap gets around this by adding its own per-cpu allocation caching,
> >
> > So by being too lazy and not carefully distinguish the swap devices,
> > not only does xswap not work for the writeback use case, it cannot
> > even work in deployments where some workloads (cgroup) select zswap,
> > whereas others select disk swap. It can only work if you intend to
> > have a single class of device - either virtual/xswap or disk swap -
> > but not both.
>
> Baoquan's writeback series is out. It is by no means perfect. But it
> is much closer to what I have in mind. That is a much better base to
> work on.

It's *literally* the same design as me, from a metadata design. The
only difference is:

1. It moves the metadata from a new dynamic cluster struct and shoves
it into the existing physical struct.

Like, you can check patch 11 of this series. It's practically the same
thing, with the only difference being ou

> >
> > Maybe instead of just grepping for swap_is_vswap() and throw your hand
> > at the complexity, read the code and try to understand why it's
> > necessary first, then propose simplifications if you have good ideas
> > in minds.
>
> Yes, I already read your code I decide that most of the
> swap_is_vswap() should not be needed if taking a proper swap_ops
> approach. I wanted to offer you the chance to work closely with me to
> achieve that, but you did not follow that suggestion.
>
> Quote from my old email:
> https://lore.kernel.org/all/CACePvbX+3tO91BmRwaLqf3Xia32GCemt3W8tayErG81B=
YLgrzA@mail.gmail.com/
>
> "I am happy to spend some time working with you to discuss the generic
> adopted version of vswap, if you are open to it. Or if you don't want
> to waste time on it. I can have someone else or myself come up with
> the generic adopted version of vswap for you to review, which I prefer
> less."
>
> Anyway, Baoquan's xswap writeback patch series is out. I suggest
> following and improving that series instead.
>
> > > This is questionable. A vswap device does not go through swap on.
> > >
> > > This changes the behavior where swap devices always go through swap o=
n/off.
> > >
> > > I wish the swap device went through swap on to be able to start swapp=
ing.
> > >
>
> >
> > What usecase would necessitate the need for swapon/swapoff interface?
> > Other than just trying to shoehorn it to an existing interface?
>
> I like universal interfaces. Your vswap will break the /etc/fstab. The
> current suggestion for xswap using sysfs will break that as well.
> I would like to keep the /etc/fstab interface working, including
> support for UUIDs for swap devices, etc.

"Universal interfaces" is not a use case. None of the thing you list
out here is a use case. It's an interface, but you have not
constructed a single use case to justify all of that.

> I am very concerned that vswap will start kicking in without me
> explicitly enabling it. That changes the previous user-visible
> behavior. It breaks my mental model. Please take this feedback
> seriously.

I mean, there's a knob for it. How can it start kicking in without
your enablement?


>
> > I've expressed why I dislike the interface in [1]. Other than the
> > sizing aspect, which we are already discussing in another thread,
> > priority also makes zero sense. You are literally exposing an
> > interface with only one correct answer - what's the point?
> >
> > Justify your interface choice with real userspace use case, not just by
> > conforming to the status quo.
>
> That is why I feel your patch series are really unclean. I dislike
> special cases, I try to avoid them as much as possible.

Again, your disliking something is not a use case.

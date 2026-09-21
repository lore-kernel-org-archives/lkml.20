Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E93A38F92D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984378; cv=none; b=NrZRfyamK0E580NAJ0mpceGKmmxUbEmGg+QAh9eC8TBVXEw5qHhYPA8C0bBkW8/Y4bNMy0If7wiu06fj4QwszqIJD0QoTrzOAwGHmWOW1lr3IeGpRwE5kFfwZ62Atk1z7dsjxDwtdHlSOXQYHvZefQdc45iJlCrcdC86jWWfU1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984378; c=relaxed/simple;
	bh=xeVycZ/NloqWI5g/+vyApKOf/wSuKUl8DSQL5TNDOX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gL+5ES5E6VF+nykLjwAcDMFMNGH3OzNWzLq6TkYazqsp9Rp7s6D0p9rLwBhitHI3vgZeIcY9d8ebCvV0L0u6QE4jMyAC0gkuSNhlByJ8p8zY0YIDItNR3JDyQRZkRNsPGDssvro5ChvYVaumjhCOPwPAEaUobXBqKB2HaOS2pCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWCaC8Vv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWCaC8Vv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF271F008A3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789984377;
	bh=1ZJAJ5P0mddCIo4D06r2GVTCGyjmla44d8GKfQEXK0M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cWCaC8VvXiRoiSW4+/1cQwZDOfAhynJvLZ0qcWJWJrCyFeCXWWUwJe/SIVoW/9NOu
	 PLJdo5NvmWWpEEEwhK0yDCRV+3AexiClsXjwWwp7LlDThVQu/kFjec6qn3Rs+oGZwc
	 GD8KfOa9fu16MhjNVYmLXsvuHu038fidEJUKY0f0b5f7EwxjBSP3x0pfvVI7BtvmKw
	 in8sYvo62fkbZXkKjcH153ueI9NWwsHXfN0UerKH1fGxG36XuipPRu+3xGhUJrNZDs
	 PWJ/+pk7SINBaKOAYVH738KigxYSIWIqGId/GmdnwYWPNQ35kmdqKCiVZP1eM1NUen
	 5cE6Fer4FrZJA==
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e50968489so2382984d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:52:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxGCECSLvng/crETnmJS9+l/tjATnDMFEih3xU6boBq/itvhtsprqq79z+q7O/iGXTKWkkkLyPtPXFIOjU=@vger.kernel.org
X-Gm-Message-State: AFuF++lE1LnjrP8VdVxYx3GNYJUrEcQdXVOyGtFO/4CBgmSox91RxY49
	2yI+3o2XItbSko5pAgDpeifQGWOzPmzJqd2K31CRsLE+hSiLlUuV+MAUSo0lqTN0DCJU/If4sQs
	0+ApjLOTHu/gspIIDg++B0rTzlacfbnIChfGYj3to+g==
X-Received: by 2002:a05:690e:4891:10b0:66f:8255:9f3d with SMTP id
 956f58d0204a3-6717fc64b35mr2058706d50.7.1789984376426; Mon, 21 Sep 2026
 02:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <aqrHjfHwyEtRIr5S@cmpxchg.org>
 <aquWKJoP5JLP8Ci7@fedora> <20260917131712.GA1344@cmpxchg.org>
In-Reply-To: <20260917131712.GA1344@cmpxchg.org>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 20 Sep 2026 23:52:45 -1000
X-Gmail-Original-Message-ID: <CACePvbXQRBnTAivJp7mh-y3PQjjUeO4KxzV8+nnhC5UzMomT0w@mail.gmail.com>
X-Gm-Features: AcwNN1Ugzg_SiOMhNKJS2VxbB-4KHi8_6oHC3_bGXd1kVTnb30PCv8qTa6VMc_A
Message-ID: <CACePvbXQRBnTAivJp7mh-y3PQjjUeO4KxzV8+nnhC5UzMomT0w@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] mm, swap: extendable swap devices (xswap)
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Baoquan He <baoquan.he@linux.dev>, Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, kasong@tencent.com, nphamcs@gmail.com, 
	baohua@kernel.org, youngjun.park@lge.com, yosry@kernel.org, 
	shikemeng@huaweicloud.com, chengming.zhou@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 3:17=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Thu, Sep 17, 2026 at 03:31:23PM +0800, Baoquan He wrote:
> > On 09/16/26 at 12:45pm, Johannes Weiner wrote:
> > > On Wed, Sep 16, 2026 at 06:19:07PM +0800, Baoquan He wrote:
> > > > xswap is a swap device with no backing storage. Swapped-out pages l=
ive
> > > > in zswap. Its cluster_info[] array lives in a VM_SPARSE vmalloc are=
a,
> > > > and the area is grown and shrunk on demand as swap usage changes.
> > > >
> > > > The problem being solved is the static size of compressed swap. Bot=
h
> > > > zram and zswap need the size fixed in advance, and neither gives me=
mory
> > > > back when the workload shrinks. The solution should be a device who=
se
> > > > size can scale up/down as per usage. xswap does that by mapping the
> > > > metadata lazily instead of reserving it for the whole range.
> > > >
> > > > Design
> > > > ------
> > > > - si->cluster_info[] stays a plain array. Access is still
> > > >   &si->cluster_info[offset / SWAPFILE_CLUSTER]: no per-access branc=
h, no
> > > >   RCU discipline, no tear-down state machine, no NULL return.
> > > > - Only an initial chunk is mapped at creation. The rest of the addr=
ess
> > > >   space is reserved, not allocated, so an idle device costs nothing=
.
> > > > - Growth is driven by allocation. When no free cluster is left and =
the
> > > >   address space has room, the next chunk is mapped and added to the=
 free
> > > >   list. No userspace involvement.
> > > > - Shrink is driven by frees. The free tail is scanned, and whole ch=
unks
> > > >   are unmapped once the mapped range is at most half in use and sev=
eral
> > > >   chunks can go. One chunk is left mapped as slack, so the next
> > > >   allocation does not map it straight back. A ceiling lowered below=
 the
> > > >   mapped range skips the half-in-use rule and is enforced at once.
> > >
> > > If the swap maintainers prefer the VM_SPARSE route, I'm happy to defe=
r
> > > to them on that.
> > >
> > > However, from the cgroup and zswap camp, two stipulations that I
> > > reasoned out in the other thread[1]:
> >
> > >
> > > 1. You must not charge compression space as swap space to the cgroup.
> >

Sorry let me push back on that. That is already existing user-visible
behavior. Changing that will break our deployment using zswap. I don't
think we should change that.

See more in my reply in the other email thread.

https://lore.kernel.org/linux-mm/CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7ce=
rK2uPnK6w@mail.gmail.com/

Chris

> > Hmm, I don't have a stance on this. However, isn't this an issue
> > zswap/zram have been doing? It feels like an independent issue which
> > should be done separately?
>
> If you have 3 containers using compression space, and two of them have
> writeback enabled to a shared swapfile, the memory.swap.* controls
> need to work to manage fair access to that swapfile. They do not work
> if compression space itself is conflated in.
>
> Right now zswap entries actually consume physical swapfile space, even
> before writeback. Charging the space is correct. But the whole point
> is to decouple compression space from physical swap space.
>
> This is not something that can be done later. It would be a dramatic
> user-visible change to how the resource is categorized and managed.
>
> > > 2. You must make the compression space large enough to be outside the
> > >    range where users can hit space limits before hitting memory limit=
s.
> >
> > We may need a way to define 'large enough' at first.
>
> I've tried to lay this out in the other thread, and highlighted the
> usability issues that result from hitting compression space limits
> prematurely. It's kind of your call whether you want to seriously
> engage with this or not.
>
> But ultimately it's your claim that a static size can be made to work,
> so it's on you to make a convincing case.
>
> > >    That also means not allowing setups where this is possible.
> >
> > And the limit is only an optional knob. If the admin does not set it,
> > the device grows to the full address space, so there is no space limit
> > to hit at all. It already behaves the way you want by default. The knob
> > is only for admins who want a ceiling, they can use it or not. I hope
> > this would not be a problem for your use case.
>
> No, I've laid this out already as well.
>
> This isn't about "my" usecase. It's about designing a coherent
> interface that works well with a large number of usecases, and other
> pieces of kernel infrastructure commonly used in conjunction.
>
> The other proposal in the room needs no such interface. The burden of
> proof for adding one is on you.
>
> > > [1] https://lore.kernel.org/linux-mm/aqLi6cIjD2wJwk0B@cmpxchg.org/

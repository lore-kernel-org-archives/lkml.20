Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B8E47CA9D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935780; cv=none; b=tzBMBr/ZoOLfP9olDQpMbrYWILhddab/S2zoLlub/A1yPS0SOb9jAHEf96ro70AzJ/kaxB55jAyKQkyfgUL1wM5mmrAonwBrmJ7t3YA/V/nzy0lamF/QSXp2hsVPXN6MRO542uBRJpD/mlTK4z2c8azZTqU0ATf4r6ZMdYslCaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935780; c=relaxed/simple;
	bh=kTIjevvHnI6tk3I7bdraP1aqxwTnNibc6cViojCA4r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSrxNEAjilywuj1eRK+wBjP5/+kIRBe+ZrZFipz2jr9IopZhJ15qbl+eI3OO54rk1gX+TgMMtgtGtBGlKUyIIhjEe0PB1ZIEhpI5I3tr4NFNNGcQBJSen708NQRWFrN1wRobLegOJ1l2pGrRSZ+7sp5d9uLBWGdfMr/cBIndzU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhVvlZIm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhVvlZIm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85DA1F000FF;
	Fri,  2 Oct 2026 10:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790935778;
	bh=kTIjevvHnI6tk3I7bdraP1aqxwTnNibc6cViojCA4r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YhVvlZImIxqbuB1Yq+sA//Rjnrhz17zbePIJ3Hk12l5kR818rurMHr0iK1fKiEIN4
	 +3SC+5eCeFgnA5mccvC/WsywRCPcTINbKsGABNrWkQmRL5z816D6nk3pVcta6jXMKD
	 kQqL/rJZ1VIVxJl1oLK+V5U4VJOe1Q5W4ZfPCD/ppDm1g3oYiCeomoXB2l7zGoktNW
	 ATyLovjbAJmTGV4MiVzlVezyw/JrrU1QS2iOvBeque3nEnazbzCiiupN2T8NI3D0TY
	 dpvEcpS/8dYMSr00RAL3b3PfrnQu1MrTRMtgUXjUBfXaOvZfMAAHxuY+/VQgpJS6kX
	 NurVf28Zra+Ag==
Date: Fri, 2 Oct 2026 11:09:33 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>, 
	akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, peterx@redhat.com, dave.hansen@linux.intel.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	syzbot+49b1021becba70c1f3f6@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm: don't ioremap COWed anon pages in
 generic_access_phys()
Message-ID: <ar-Cq0YNpQ6_3fDG@gremlin>
References: <699ae98c.050a0220.340abe.0d31.GAE@google.com>
 <20261001152524.171115-1-ngocthang2710.1999@gmail.com>
 <32fe40e2-854a-47ec-9d95-93e23f9a7af4@kernel.org>
 <ar9omYD3HcTDBpGA@gremlin>
 <c6253814-0cf6-48f3-8f81-3285466dca45@kernel.org>
 <9d43234f-93cb-4c86-a2a6-a3cdebf48f3b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d43234f-93cb-4c86-a2a6-a3cdebf48f3b@kernel.org>

On Fri, Oct 02, 2026 at 12:04:27PM +0200, David Hildenbrand (Arm) wrote:
> On 10/2/26 12:02, David Hildenbrand (Arm) wrote:
> > On 10/2/26 10:38, Lorenzo Stoakes (ARM) wrote:
> >> On Thu, Oct 01, 2026 at 10:22:29PM +0200, David Hildenbrand (Arm) wrote:
> >>>
> >>
> >> Sorry to say this looks schlopped.
> >>
> >> This guy has sent 10 series across 6 subsystems over ~21 hrs:
> >>
> >> https://lore.kernel.org/all/?q=f%3Angocthang2710.1999%40gmail.com
> >>
> >> Nguyen - please do not flood the kernel with patches, and please use the
> >> Assisted-by tag for generated content.
> >>
> >> The original code you submitted is really not great even if the issue may
> >> be valid.
> >>
> >> So I'd say somebody from the core team should take over this if we want to
> >> come up with a patch.
> >
> > Yes, I'll take care of it.
> >
> > [...]
> >>>
> >>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> >>
> >> This looks reasonable but I hate that we have 'special' CoW overrides like
> >> this :)
> >
> > After sending this yesterday, I concluded that we can do this cleaner: just have
> >
> > bool normal_page;
> >
> > (naming suggestions?)
> >
> > that express that this is something refcounted with a struct page, like
> > documented for vm_normal_page().
>
> Hmm, have to think about that once more, regarding VM_IO and if there are some
> cases that would actually have to work in generic_access_phys().

Well, my series at least makes it easier to reason about VMA_IO_BIT!

Though not sure if it really touches PFN map cases specifically.

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo

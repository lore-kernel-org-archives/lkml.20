Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E004B36B91A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949817; cv=none; b=CDzRNsJyLD5Ze//6+loDC6PubBdHP4n89nEYuOKdVY+bOKb4+ajd0+bDQs6HBSI2veZ0kZC11eYD8CW/7hDeHdCMlbh86AM3bUd/gffgitEoTT8288YgJaDtMgCdgZx475BCuoN6S4Dr303PHAOqjJxuqGyMfax/ba20jpNbOLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949817; c=relaxed/simple;
	bh=gWwfdqjbo5/JYZBSynfxpMN46VuFVrXGoHfSEvxFFA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtJvYsJ4gZOLFbUBi9Fd9SM2oPHIB3z/QesorrU4wUgUkFPEkbI+ojvg8IqBeyXELSRVghF9n81a9BOGCE0mYwCeU8Ay2Zz4/xWorLqFz8ZJCeIepzTochbABUtl/N9cm68c8sFzz+28QZ6X/rHpbzJL7c6VZrrMbJM0rmUar/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKoc2jCl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKoc2jCl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF3D1F000FF;
	Fri,  2 Oct 2026 14:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790949816;
	bh=gWwfdqjbo5/JYZBSynfxpMN46VuFVrXGoHfSEvxFFA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eKoc2jClDyYguaZFoi6WI+m4U2zVSs0I7XA5Umw1GJSBUKpkJBfkdyaGTEyorjZFX
	 hNhl4DZ+INOhPFnqYhXqh+WoOJoer+Z89yZmf0ZxL7Lg97E9zZT3jm7Kc/CCCst9u4
	 3vdDN37e2fvWz7cRsSuRKAWWE+71BpKefEDwbtH5p8nvU9/7SPLQ5xcdAU1Kq+t38B
	 kYfTCTGnQTdOSuLsVAumxJEPwb0C/nKUOCc2hzySMbKg0cd+tP9TDxAuJe6kjiLtfR
	 SpFVwzdKnr/RO2BpDaAfrCRUhoty+oZseiSp6sKMFtot99Cf3V8HQjj6lSuJRMbEZl
	 zTHIiP77MOXiw==
Date: Fri, 2 Oct 2026 15:03:31 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>, 
	akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, peterx@redhat.com, dave.hansen@linux.intel.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	syzbot+49b1021becba70c1f3f6@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm: don't ioremap COWed anon pages in
 generic_access_phys()
Message-ID: <ar-5iLzr-1LH09pa@gremlin>
References: <699ae98c.050a0220.340abe.0d31.GAE@google.com>
 <20261001152524.171115-1-ngocthang2710.1999@gmail.com>
 <32fe40e2-854a-47ec-9d95-93e23f9a7af4@kernel.org>
 <ar9omYD3HcTDBpGA@gremlin>
 <c6253814-0cf6-48f3-8f81-3285466dca45@kernel.org>
 <9d43234f-93cb-4c86-a2a6-a3cdebf48f3b@kernel.org>
 <ar-Cq0YNpQ6_3fDG@gremlin>
 <494d436c-e3b3-4b65-8a6c-1059d9f468d4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <494d436c-e3b3-4b65-8a6c-1059d9f468d4@kernel.org>

On Fri, Oct 02, 2026 at 02:19:00PM +0200, David Hildenbrand (Arm) wrote:
> On 10/2/26 12:09, Lorenzo Stoakes (ARM) wrote:
> > On Fri, Oct 02, 2026 at 12:04:27PM +0200, David Hildenbrand (Arm) wrote:
> >> On 10/2/26 12:02, David Hildenbrand (Arm) wrote:
> >>>
> >>> Yes, I'll take care of it.
> >>>
> >>> [...]
> >>>
> >>> After sending this yesterday, I concluded that we can do this cleaner: just have
> >>>
> >>> bool normal_page;
> >>>
> >>> (naming suggestions?)
> >>>
> >>> that express that this is something refcounted with a struct page, like
> >>> documented for vm_normal_page().
> >>
> >> Hmm, have to think about that once more, regarding VM_IO and if there are some
> >> cases that would actually have to work in generic_access_phys().
> >
> > Well, my series at least makes it easier to reason about VMA_IO_BIT!
> >
> > Though not sure if it really touches PFN map cases specifically.
>
> I'm more concerned about someone using this function on VM_MIXEDMAP | VM_IO with
> a memory page that has a struct page but is actually not memory. So we could get
> something that vm_normal_page() would flag but generic_access_phys() could
> actually read ... I'll have to explore the generic_access_phys() users once more.

Hmm that could be a problem also for struct page's that are there but you're not
supposed to access for other reasons to as well?

Definitely need to be careful about that.

>
> All way to complicated (and you series improves things).

:) well there's still a lot of complexity in there, one battle at a time...

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo

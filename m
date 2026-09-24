Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB14A4EE4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263771; cv=none; b=gH+yogb1VzcbTx1MyCIPVKJhMkgkXngQcwyJVGEnPQE9tZy9FH7bhbH2lvcg+tQ7KjdQ7Gn4qjDn6sG4YkYqySJfoHgFLEO2bPe2QRLkbSVE3X1a/W/tvI9Vxf2vqxKgzX7aj0mYBGuc+utfKpZytsUGn/G2SGVXudxvy6VRG4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263771; c=relaxed/simple;
	bh=Kfhzpb3IDath8WiZROoZA7Fe4Lrl6ZBBQ5kG/oDRVHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwzUSSw1vk0kyQ0Ol684Kd/HwAqJO7zd21fwD7RVfJcm4ekKbiqulnGHE7kd0hNG9/3y3SMKI+rFsTYiOFn/1UjsmzDX2g5ZoHUPMDKVzOn6Rwh9DJe9VIDiv6tEbdWiJDLUovaEuciBHAnjl0JcV5DaPg75KvOyseJNKGd+1Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsOK/vtj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsOK/vtj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B46B1F000FF;
	Thu, 24 Sep 2026 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263770;
	bh=4CDD8TQ1G8oa01QCVgmfSk+fkIBvjWyhYdUITJIOzi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gsOK/vtjVVEK91BGtbUMNOrj3Bo+ATVmhtSfHb7BmJN9Tc4DzT57CZaDbdG7mUqfm
	 xnM8jAXmsVmO/rcuRvwTKO/TVzMCCyUEYUFsU+Usgwz3IOyfp13fpTaOFXjg9QY7fd
	 FLqqp8Q3/3fms65qsdaX2pqAAuBBOHn3BUnnZhQlJ0QYAIQk6H3D9QeZvSamzpiPYj
	 S7WOOuj3WuBcphT7nN9YALKjaUp8GROewIBaQLfpSxKfMrHzYluhPF73qGgdaZDWUa
	 8Z8K5rwKHAMq3Z7h4qox4wOuuSi4/b9SAi24rXJdlttIxcFHaQwtEYa+TA5xn6D2kn
	 IzcR2ULRKF1Ig==
Date: Thu, 24 Sep 2026 16:29:23 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Lance Yang <lance.yang@linux.dev>, 
	syzbot+c181d3198e98f8aef8b9@syzkaller.appspotmail.com
Subject: Re: [PATCH] drivers/char/mem: mmap readonly MAP_SHARED-/dev/zero
 correctly
Message-ID: <arU9Z-EhEQg76CVz@gremlin>
References: <20260924-fix-dev-zero-readonly-shared-v1-1-153c2111e323@kernel.org>
 <2026092406-irritably-maggot-9512@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026092406-irritably-maggot-9512@gregkh>

On Thu, Sep 24, 2026 at 05:08:49PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Sep 24, 2026 at 03:48:24PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Rather surprisingly, opening /dev/zero read-only then mmap()'ing it
> > MAP_SHARED gets you true anonymous memory (albeit in a VMA with
> > non-NULL vma->vm_file).
> >
> > This is a by-product of MAP_PRIVATE-/dev/zero being how anonymous memory
> > was mapped in Linux's distant past.
> >
> > It happens because mmap_zero_prepare() gates on VMA_SHARED_BIT and when
> > mapping a read-only file MAP_SHARED, do_mmap() clears VMA_SHARED_BIT and
> > VMA_MAYWRITE_BIT.
> >
> > The gating is incorrect - the (poorly named) VMA_MAYSHARE_BIT flag exists
> > explicitly to tell you if something was originally mapped MAP_SHARED.
> >
> > So the fix is simple - gate on this instead.
> >
> > This isn't exactly a common use case, but it's unexpected behaviour which
> > now causes an assert if CONFIG_DEBUG_VM is set.
> >
> > While this bug has existed since the dawn of time for linux (or at least
> > since 2.6.12), it hasn't caused issues in the past, so while it's incorrect
> > behaviour, it doesn't seem necessary to backport that far.
> >
> > The mapping is now accounted at mmap time and can fail with -ENOMEM under
> > strict overcommit, and read faults allocate folios. However this is normal
> > behaviour for a read-only shmem mapping.
> >
> > Commit 93c0c8dc87f6 ("mm/rmap: use anon pgoff to track MAP_PRIVATE
> > file-backed anon folios") is the first patch at which the debug assert
> > fires, so target that instead.
> >
> > Fixes: 93c0c8dc87f6 ("mm/rmap: use anon pgoff to track MAP_PRIVATE file-backed anon folios")
> > Reported-by: syzbot+c181d3198e98f8aef8b9@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/linux-mm/6ab4ae75.80e1c6cc.1e8e5f.000d.GAE@google.com/
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  drivers/char/mem.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/char/mem.c b/drivers/char/mem.c
> > index 63253d1de5d7..5b93c92c2cf1 100644
> > --- a/drivers/char/mem.c
> > +++ b/drivers/char/mem.c
> > @@ -503,7 +503,7 @@ static int mmap_zero_prepare(struct vm_area_desc *desc)
> >  #ifndef CONFIG_MMU
> >  	return -ENOSYS;
> >  #endif
> > -	if (vma_desc_test(desc, VMA_SHARED_BIT))
> > +	if (vma_desc_test(desc, VMA_MAYSHARE_BIT))
> >  		return shmem_zero_setup_desc(desc);
>
> What's the odds that something "big" actually relies on this?

I think it'd be fairly crazy to, unless people really care about read-faulting a
lot of zero pages which they want to somehow not account properly.

Anything's possible but I think on this, right to take a (v. small) risk!

>
> I'm all for the change, but be prepared in about 5 years for people to
> start complaining :)
>
> Want me to take it through my tree?

Sure, thanks, though there will be a conflict against a patch in mm.

Though it's really that the file is moved (to mm/), so actually should be an
easy resolution?

>
> thanks,
>
> greg k-h

--
Cheers, Lorenzo

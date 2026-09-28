Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72504C151A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608114; cv=none; b=gc1XhZLuKkrePKz2srd/Z70BUB6xaoIn8KemvFa136L3eGNqyQC1oktblXWbNyZzTvdr1cEs7tZoUIAlgwwq9e5qhW5LXBnL4qJjosWkI7f4NigqRf+9MbI8nl3rxCz2bWp3HIaYd2dT5U1oHC1sJdayoLpPahd6zqy8XzR7IIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608114; c=relaxed/simple;
	bh=IBFEakO8TjcHPWkmEYBKwTB9UEUvBJCZKWZ4TQ0k0Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/1FCmWF6Z2tLLugcb0QQbcf9HA0Y65myg2FC/e5GjyzUgMjykG03X3fOWpjkYM2WuntUQ2FAB/K/LLH+c3gsHv2clkAC+SjL6g0Y5LLjPoAzX6UAPrzpSalrSAj/ydFeWkRJtYxyzr8aKKPu38AywbtEhQiR2Bd5M1qNXrBBmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKxoin8P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKxoin8P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C0F1F000FF;
	Mon, 28 Sep 2026 15:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790608113;
	bh=e6DwsvvgsaDQmnbhantbUxZ9adg5ZslBN1QuZ3zF8q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EKxoin8PPODyfh/+t1dEKhIOvPYbQUuxM1+0JjWv2KdshkWycY0WkfIGE20B85m+q
	 m/+RCaPAa7v36i3if+Tky1ISXuAlTL0/iDIhY9dTvF5ZhyUBr0AmenYNYv2J5h2BVJ
	 hp7Rz9HSD87ksYOCrN5t0/a2qxOs+d9d1TAPerSzvQpsK4OEO/Qm1HfObwjIeqQVPp
	 JrVeF/gLebjqaRCqLskIyRNBI/nuZx8dECkpWS5Wuq+uSnWxokDaOMOh+m6OyU75tQ
	 SC3ZU3ZYvNfK7nsE0daX1ha4pxP0QUK8ne6ezf3s/2iDVSktSN8G1nFhkxdMYv3Poj
	 heP+1IyR+gWuA==
Date: Mon, 28 Sep 2026 16:08:27 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Lance Yang <lance.yang@linux.dev>, syzbot+c181d3198e98f8aef8b9@syzkaller.appspotmail.com
Subject: Re: [PATCH] drivers/char/mem: mmap readonly MAP_SHARED-/dev/zero
 correctly
Message-ID: <arqC3n_o-Xdu3xYO@gremlin>
References: <20260924-fix-dev-zero-readonly-shared-v1-1-153c2111e323@kernel.org>
 <9efc7bc1-8d9d-49ac-b856-003e81558411@kernel.org>
 <20260924195826.70a87d6fb78d754bc73892cd@linux-foundation.org>
 <95e91b4a-ca16-49a3-9a1a-5b38afa6f08d@kernel.org>
 <arYnXJHW-Rh4eNzt@gremlin>
 <f78d2f52-1135-425c-a3e8-460a6e80e19b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f78d2f52-1135-425c-a3e8-460a6e80e19b@kernel.org>

On Mon, Sep 28, 2026 at 01:59:47PM +0200, David Hildenbrand (Arm) wrote:
>
> >
> > It then becomes a question about how to get readonly memory.
> >
> >>
> >> We can
> >>
> >> a) Disallow allocating an anon_vma and fail gracefully. So only a shared
> >>    zeropage could ever get mapped there. Might break the s390x
> >>    mm_forbids_zeropage(). But given that's only used in hypervisors like QEMU,
> >>    unlikely.
> >
> > Something like:
> >
> > 	/* about to maybe prep anon_vma */
> >
> > 	if (!vma_cow_mapping(vma) && vma_test(vma, VMA_MAYSHARE_BIT)) {
> > 		/* don't prep anon give zero page */
> > 	}
> >
> > ?
>
> Something like that, but really just failing directly from anon-vma preparation
> in a !vma_cow_mapping(vma), maybe using a special error code.
>
> But the less we have to hack around this special case, the better.
>
> >
> > I think though it's surely the only case (I hope!) where you can possibly be
> > both anon (as in missing vm_ops) and !CoW? I hope? :)
> >
> > So it feels better to fix it at the source.
> >
> > OTOH maybe it's worth special-casing so we don't allocate on read.
> >
> > But that brings me to c)...
> >
> >
> >>
> >> b) Do what Lorenzo proposes. This will allocate real memory. Someone decided to
> >>    use MAP_SHARED, for unknown reasons, so I'd assume it's unlikely that
> >>    something breaks, but you have a point.
> >
> > I would say this patch is the right fix for the moment to fix the assert, and we
> > can chase up with other approaches afterwards.
>
> It will get backported, so we better be careful.
>
> IIUC, the real change is only for /dev/zero users that
>
> fd = open("/dev/zero", O_RDONLY);
> mmap(fd, MAP_SHARED, PROT_READ);
>
> Which is rather something odd to do indeed.
>
> Letting AI do some digging ... it says there are not known users (I don't trust
> it, but I suspect at least there are no prominent users, which makes sense ...).
>
>
> Getting shared memory when requesting MAP_SHARED does sound like the right thing
> to do ...
>
> So let's try this:
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks!

Yeah let's revisit this one later more broadly.

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo

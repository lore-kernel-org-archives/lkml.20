Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF123242D4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951280; cv=none; b=Qn6NU5tPI3gNMa7xovVld22x78E4HVxQy2gFA3guCWTWhAeQ1lWfWQvBPNlHzUjWMnCC4Q/hGL0HTrxEdfnC0cWtW01zMMR2Pm4+4KeF8TM3JSTLS9Eba/GZOrllnzJMw79TPfic3r5if4d5JY0xS6DvUxo0Jc7cvSC/mYwxjnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951280; c=relaxed/simple;
	bh=/rAU9ZJvo5gWg5FpkoZJQyBYYUXnDgfwIMLh4ety5vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBBctGur4lBSadlDyu/UhwksmeeLcDhoAbsHx/BBKpCKBadQnq7Vr3Bt90xNPWtaRaMIBzWpbonq42VzTIQSHrbShFQKn3VgbMExMVaZiaINA1LJwgEefBqgjU5niJrNSyNkf90hU/BNtf6XnoNokMqmMWCObKFMcF6BzdvswMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbwQogeX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbwQogeX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7621F00893;
	Fri,  2 Oct 2026 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790951276;
	bh=RhjstUff1FQx1MomJYmzcNhsK5VwvpkAkhhBXa9Kt+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kbwQogeXEUUc1/9rzsqwVfs1mx223su97wLf5TSzPTk6lHeXTtQbspfEYX7Rt61Gx
	 K+yiitI0A2wtwc+anr5mnQHDTEdgLJchTd+s88bKBHdzK7W+nSuGaBHtpNvBWywizc
	 HRGlzhzyDw6W3la4qP++/Fzi5v6iZhgYhkS8bcK3ck60ZFhc8KjZ1E7kfdOQQI8ZyN
	 HFaXcChOZa9aN+OkQH6p1YmdoZq3SnN4Haq4KYAlZAHXkMrFcHe3fECvt/g/aa+nDO
	 p9E3ltguhgJfzdfOTkKWz6D8+uUvqWr+ZHdftrtk/LBV7efbUpW3PFLwuHVozRV3FY
	 w3wjKIV57cfbQ==
Date: Fri, 2 Oct 2026 15:27:50 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Pan Deng <pan.deng@intel.com>
Subject: Re: [PATCH v2] mm/vma: don't remove VMA from rmap if pgoff unchanged
Message-ID: <ar-_D5gGYNKl6VVu@gremlin>
References: <20260930-speed-up-inplace-rmap-v2-1-ac1aa19708aa@kernel.org>
 <ar-9z-Ls26elb5JI@pedro-suse.tail5790ac.ts.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar-9z-Ls26elb5JI@pedro-suse.tail5790ac.ts.net>

On Fri, Oct 02, 2026 at 03:24:07PM +0100, Pedro Falcato wrote:
> On Wed, Sep 30, 2026 at 06:53:36PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Suggested-by: Pan Deng <pan.deng@intel.com>
> > Reviewed-by: Rik van Riel <riel@surriel.com>
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> Looks great, thanks!
>
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>

Thanks!

> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -201,8 +201,15 @@ static void init_multi_vma_prep(struct vma_prepare *vp,
> >  	if (vp->file)
> >  		vp->mapping = vma->vm_file->f_mapping;
> >
> > -	if (vmg && vmg->skip_vma_uprobe)
> > +	if (!vmg)
> > +		return;
> > +
> > +	if (vmg->skip_vma_uprobe)
> >  		vp->skip_vma_uprobe = true;
> > +	if (vma_start_pgoff(vma) == vmg_start_pgoff(vmg))
> > +		vp->file_pgoff_unchanged = true;
> > +	if (vma_start_anon_pgoff(vma) == vmg_start_anon_pgoff(vmg))
> > +		vp->anon_pgoff_unchanged = true;
>
> FWIW I kinda would've liked to abstract this out to rmap code, but a quick look
> shows that it is likely to become a header dependency hell if put in rmap.h. Could
> perhaps have been separated out to a function call.
>
> Anyway, your call :) This version already hides most of the ugly to
> interval tree code.

I'd rather keep it as-is. These case are explicitly setting the state because of
things known at that point, and as you say it's not possible to do it sensibly
due to headers etc.

--
Cheers, Lorenzo

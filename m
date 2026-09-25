Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920D7DF72
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790305108; cv=none; b=WTZPmzAhAmAEmEaKrRKwwzIs6HdC8nAJLlsk71AbFQXchsJhl1mfmCktzVfAw6zHNJ5ez92p9JQUdoh6KqlBWD92TxE8BBvU1ttn5riOafGFBtHJLzixGH30SLO1mzJ4rBxBHJR633XCmx+j0TLD4KWNAeJX/WW1XRjhr30VrM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790305108; c=relaxed/simple;
	bh=JCHVG4W6IcPYNs9zXWrNaH2+Jsm2qPjdslGNCdP73wI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=iuiKJQ5SL/U/OWAfO79l4BRkTxp404gQmjhng2ec2WNVbHPtcmzR+5cvkwd4vN56KnZf5XsDTYrcGKn8KKYuEYkYD0TMHH8AenF4EJ+YlIzIeRv88VPIyzNxqPky+Y2k5C6b7miVUS6uJctsxtxNe8zAGtyegMYZXXGqRIgq6ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=f8ENF5YT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="f8ENF5YT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13001F000FF;
	Fri, 25 Sep 2026 02:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790305107;
	bh=u8Sjam0r3CZIV8ohCOPZ6ijLXYirjUbaTrxgwPo1KBg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=f8ENF5YTgmEl7FFmi6nS9oagjeDtOyokKn9tg+2X5LPvmvlyCXrpxIG80nFA5RkdO
	 oSIIQtK9EyjxAIOtvayKdZMeEpILT/EyGr117J2T+/rtGGk/XKg2sCA5w6PM1zcvGr
	 1ACB4S9Y8ecwk6hLGm+AErEFEl0Fx60up7GZHZGI=
Date: Thu, 24 Sep 2026 19:58:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Lance Yang <lance.yang@linux.dev>,
 syzbot+c181d3198e98f8aef8b9@syzkaller.appspotmail.com
Subject: Re: [PATCH] drivers/char/mem: mmap readonly MAP_SHARED-/dev/zero
 correctly
Message-Id: <20260924195826.70a87d6fb78d754bc73892cd@linux-foundation.org>
In-Reply-To: <9efc7bc1-8d9d-49ac-b856-003e81558411@kernel.org>
References: <20260924-fix-dev-zero-readonly-shared-v1-1-153c2111e323@kernel.org>
	<9efc7bc1-8d9d-49ac-b856-003e81558411@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Sep 2026 17:37:29 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> On 9/24/26 16:48, Lorenzo Stoakes (ARM) wrote:
> > Rather surprisingly, opening /dev/zero read-only then mmap()'ing it
> > MAP_SHARED gets you true anonymous memory (albeit in a VMA with
> > non-NULL vma->vm_file).
> > 
>
> ...
>
> > --- a/drivers/char/mem.c
> > +++ b/drivers/char/mem.c
> > @@ -503,7 +503,7 @@ static int mmap_zero_prepare(struct vm_area_desc *desc)
> >  #ifndef CONFIG_MMU
> >  	return -ENOSYS;
> >  #endif
> > -	if (vma_desc_test(desc, VMA_SHARED_BIT))
> > +	if (vma_desc_test(desc, VMA_MAYSHARE_BIT))
> >  		return shmem_zero_setup_desc(desc);
> >  
> 
> So instead of shared zeropages we'd now get zero-filled shmem pages.

"zeropage".  Singular.  Used to be!

The accounting differences, possible changes in reclaim, memcg
charging, maybe swap behavior.  Switching to a different fault handler.
It's hard to foresee all the effects of this.

> The alternative would be to just convert it to a proper read-only COW mapping in
> mmap code:
> * Not clearing VM_MAYWRITE, but keeping VM_WRITE clear
> * Clearing VMA_SHARED and VMA_MAYSHARE
> 
> Sure, someone could then mprotect(PROT_WRITE that thing) or
> FOLL_FORCE|FOLL_WRITE to get anonymous memory. Just raising that as an alternative.

I dunno, the whole thing feels imprudent.  To alter such longstanding
core(ish) behavior.  And why?  Because a shiny new assertion said "hey,
that isn't quite right".  Wouldn't it be better to squish the warning
somehow and to set about this change in a very careful way?

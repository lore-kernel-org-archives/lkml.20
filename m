Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C591332614
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853031; cv=none; b=HOJZelKbrtAhgK71QTmDJDGHDSQctY2Sc42o6FHaEq+8krxyDPRBmCKZ2ZYle5ZIR3x7qiPDIh325zRG5uFKggJlCR30mOzozolCDFil1s3H/APng4gUikv7tqiWMOG+7Y2GmaHk/faidjB5WXl6WoLdZUS8o7atDxrZSBjrO1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853031; c=relaxed/simple;
	bh=JDSPgox7O4JApWFPJJWB+2XXaeIKA/wudHnaSYzTd5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgTaPNCtpRU0L4NCf4OOTxOR6KXlgmVqnQa6X8w8GkijwwsZkX5EzGAIzHqpSVKbKnqbA89ZrgbIU8OE366/HRqoUPuwsoBZvWMkIE4vUG8heqIG+VS8JviKyT2TbETjeLoph+E0bNE+lWi7gbhScftJKqO2yYGzQHobXpdv+Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWvmVk25; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWvmVk25"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8591F000E9;
	Thu, 27 Aug 2026 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787853030;
	bh=7LyDiwZ/dL1+I6iznOnKyyWmM8BHa0i9q//GZQBdPIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fWvmVk25vsFxN9BucJRSFoWwejL9SqfMeHC8Oec98TjRzyaTrrboulTp18D6s7ycy
	 aC0eGeeU2PLt5/xIixbsS3sD0/c3+Kb+2ZaU2LTISaQI8gAQfSm1MvpboK5rYWfI9H
	 6PSCj4k6dCl5xikrHD4ORtsB6uMnGgDIbFYDVpIVJBaOGwZmlx+FWhAVYug2v70zFk
	 L7Ap9c3ZYUxouOXvnuL+OAiZCpWqQhuzCPvGp3XXVxEVkaZmHorJzn/vH7Gsdax2l0
	 3tFZYqqYtX46EfMPk5MPImz67oTZs3qNqQL3aVsw0h+Jq8G23+9kAttqxGmyuyY/tW
	 7RC39dvm46rWA==
Date: Thu, 27 Aug 2026 18:50:25 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: syzbot <syzbot+5c417b73ac02e0e352c4@syzkaller.appspotmail.com>, 
	jannh@google.com, liam@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, pfalcato@suse.de, syzkaller-bugs@googlegroups.com, 
	vbabka@kernel.org
Subject: Re: [syzbot] [mm?] WARNING in __split_vma
Message-ID: <apB40XmmVSp5pwme@gremlin>
References: <6a8ff666.27659fcc.2ceef7.000f.GAE@google.com>
 <20260827093322.f99541b28aad2a3c069ed155@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827093322.f99541b28aad2a3c069ed155@linux-foundation.org>

On Thu, Aug 27, 2026 at 09:33:22AM -0700, Andrew Morton wrote:
> On Thu, 27 Aug 2026 01:33:42 -0700 syzbot <syzbot+5c417b73ac02e0e352c4@syzkaller.appspotmail.com> wrote:
>
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=1645f979580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
> > dashboard link: https://syzkaller.appspot.com/bug?extid=5c417b73ac02e0e352c4
> > compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=104a0d49580000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f35979580000
> >
> > Downloadable assets:
> > disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-818bebeb.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/6e4100526b12/vmlinux-818bebeb.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/723c4783ee96/bzImage-818bebeb.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+5c417b73ac02e0e352c4@syzkaller.appspotmail.com
>
> Thanks.
>
> Hopefully fixed by the pending "mm/mremap: reset unfaulted VMA page
> offset for MREMAP_DONTUNMAP".
>
> https://lore.kernel.org/20260825-fix-mremap-dontunmap-pgoff-v1-1-39a40b2c98b3@kernel.org

Sorry, yeah, this looks to be the exact same thing, marked as dupe!

--
Cheers, Lorenzo

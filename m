Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EA64A341A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863083; cv=none; b=sgozJZK9Vj5OBqqW+n3uiWrwWUhNgzOFtKYatgMVJfH64TbyevfxCren7dqwZ5MXRCE8kdDt97taFKsrySMrw1vhbkJBSFXhi1miHCIR4QGORpQCNDp7GiEL8f5reFzV5kln7clTAISED3Pds+yhb6oa4x8195hK0RNkeKKFUW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863083; c=relaxed/simple;
	bh=sOdgDm5hYXAMz1Fk0hZ7+eStPTAB4DxUtZSperEet60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grIOoAUUpy1ra57rA+XGk7BrdMyKn9Hr6YkwL3v6KDCqjNuwEuVmtrqaxIvWnrwTqeO34PEgbUoyMPH7zGC+Y+3BHLY1vuTVaS0E0pTz09wpkEidYENb0ertA/pmCejbucxRhWYkYzWfMhMir7KwP2NmJjSXXWhw0Tt/Blggpfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2GZ3Pvd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2GZ3Pvd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2FB1F00A3A;
	Tue,  8 Sep 2026 10:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788863082;
	bh=lIUkCbJ7shfPROFJxtTfla+/4+rlDGuo3hAIW5bFyFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M2GZ3PvdvIIc3QHnujmylrLk0OTC1XZmWij350Oprx7fKaDYxIML4dZLSBUQmGXEi
	 l1zk0PNDiYHX53ePOujhKOKM6ffB8QEQ8grv+Lh5FnKCZDboK8BKZQDmQnFLDQkXeM
	 RVpQXS1AQ+3izISLfVaZ7nhOaJVFlKqSc8qi9D4Z6vfzQdoMUnYLqmrhwQkyRfBUop
	 jxZSASGal/6kgi0HY15mZisXXRp2g6FiruA3KjIOac/TwCF39Bu2BfPiwSA6tkZ9aI
	 SOU9epFApm7zgV/JtqvniUyoRmE0Db2JrBLsjAU518E9R9bZS+LvLrfH47moyQ0vVt
	 RM8fTACARSHkw==
Date: Tue, 8 Sep 2026 11:24:37 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: syzbot <syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com>, 
	akpm@linux-foundation.org, jannh@google.com, liam@infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, pfalcato@suse.de, 
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mm?] WARNING in vma_add_pgoff
Message-ID: <ap_iJsK57kLOY-zb@gremlin>
References: <20260907192517.564ea15aa8c9d47669b3a81f@linux-foundation.org>
 <6a9f8bc6.f614420e.2bf292.0005.GAE@google.com>
 <ap_Uke89Q9LWoaoK@gremlin>
 <90cd8ace-b135-45d6-815b-bf7329cbfa4d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90cd8ace-b135-45d6-815b-bf7329cbfa4d@kernel.org>

On Tue, Sep 08, 2026 at 11:32:18AM +0200, Vlastimil Babka (SUSE) wrote:
> On 9/8/26 11:25, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Sep 07, 2026 at 09:15:02PM -0700, syzbot wrote:
> >> Hello,
> >>
> >> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> >>
> >> Reported-by: syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com
> >> Tested-by: syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com
> >
> > Yup there we are :)
> >
> > Why is this constantly duplicating I wonder...
>
> Going back to the first mail:
>
> syzbot found the following issue on:
>
> HEAD commit:    5445d6419962 arm64: Don't read GMID_EL1 when MTE is disabled
> git tree:
> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
>
> We can see it's based from 7.3-rc1:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-kernelci
>
> And since the problem was introduced there, all kinds of development trees
> for 7.4 (or even pending hotfixes for 7.3) based on 7.3-rc1 will now have it.

Yeah but I marked this #syz dupe? I guess that's cleared maybe for a new job?

>
> I guess syzbot has to learn to recognize it's a known problem and ignore it,
> or have some repo of known important fixes merged after rc1 it applies on
> top of such development trees, as they generaly won't be rebased to later rcs.

Yeah, be nice if 'hey check this upstream commit does it fix it?' *syzbot
confirms yes* could -> mark reports redundant.

But maybe harder to actually do than that?

>
> >
> >>
> >> Tested on:
> >>
> >> commit:         35b0fb39 mm/mremap: reset unfaulted VMA page offset fo..
> >> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >> console output: https://syzkaller.appspot.com/x/log.txt?x=15e13af9580000
> >> kernel config:  https://syzkaller.appspot.com/x/.config?x=56ed23170c168d4c
> >> dashboard link: https://syzkaller.appspot.com/bug?extid=c6879dc677a017f0a21b
> >> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> >> userspace arch: arm64
> >>
> >> Note: no patches were applied.
> >> Note: testing is done by a robot and is best-effort only.
> >
> > --
> > Cheers, Lorenzo
>

--
Cheers, Lorenzo

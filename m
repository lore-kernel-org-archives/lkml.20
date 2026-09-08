Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5044A0910
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859555; cv=none; b=rYKhMfLL+qwdxTiabGYAA8nOgyoWzbLql6HYGiL8PsuP/ka7mKykyjRtbksGzDZ3yJTo+Dr+9PF8KPO5HvaKC1pCIoXjJBf2v/bIylLkyfkWuoe8dFV4kmwzayshj/KCsOd0Mlwq9K7bZv7Xo0e30iosJQKjUI8DD+Jz9CQO41M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859555; c=relaxed/simple;
	bh=k3As73wHNbT59b6kCc/0IegpIzyMcHJMqFAaJru+v9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4FvvnqAQ93S6eLdjx749/tP7WOZ4R7EFdPecZGPDnZifH13XaevRqLKgmn6VgTPnZJ5zSzofyDJc5aaLjWGDWY9SIvPG0QvyVHradp3qyEByY9kyYEMPGH1M8qsLra+zcGM/mD5HB2IEechPEFTh7s9gzsnueFwsdMwKkI+B6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGEIzbQZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGEIzbQZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CB61F00A3A;
	Tue,  8 Sep 2026 09:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788859553;
	bh=EIjb+8qA0AOLbrUigbrFdsr7Bi7xUORUq9H//Gsw4uU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DGEIzbQZ+aPgK3MYWRjjK08/6SvQLu58K4JBVmBFiUqScBXqCi9GHoevigvsyfB4G
	 JfeNxKWVQC74+SAmTkV0A4a30ebmw9xXXEVjlPlrfZtrIaLcaWn1Wnju9BRCzK40Mf
	 fz+JDUGCYWIYbMUrF/UzDzffKEyhJlf88rXs8VrZ5CYwfmvsE0EWh6iAdAxz7ROSlY
	 R8PJMSwbBp2YNMUcfcb0sRazaYGegWmfnscXC87EW8FwSvET56XtCyekmPPjpPsMcX
	 uAPrdHc/BekDrHKWcYJZ4Uuhaaq26PsvcKtsbQ05xlS1L6FEYSWowg2ccuw3C7U1jq
	 2DIWv0rHrjLFw==
Date: Tue, 8 Sep 2026 10:25:49 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: syzbot <syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, jannh@google.com, liam@infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, pfalcato@suse.de, 
	syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Subject: Re: [syzbot] [mm?] WARNING in vma_add_pgoff
Message-ID: <ap_Uke89Q9LWoaoK@gremlin>
References: <20260907192517.564ea15aa8c9d47669b3a81f@linux-foundation.org>
 <6a9f8bc6.f614420e.2bf292.0005.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a9f8bc6.f614420e.2bf292.0005.GAE@google.com>

On Mon, Sep 07, 2026 at 09:15:02PM -0700, syzbot wrote:
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>
> Reported-by: syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com
> Tested-by: syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com

Yup there we are :)

Why is this constantly duplicating I wonder...

>
> Tested on:
>
> commit:         35b0fb39 mm/mremap: reset unfaulted VMA page offset fo..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=15e13af9580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=56ed23170c168d4c
> dashboard link: https://syzkaller.appspot.com/bug?extid=c6879dc677a017f0a21b
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> userspace arch: arm64
>
> Note: no patches were applied.
> Note: testing is done by a robot and is best-effort only.

--
Cheers, Lorenzo

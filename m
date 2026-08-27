Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1C248B38C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848405; cv=none; b=SQLPBkKFVm6oBq2lSMLdQ3fCY34OUfJX3jGiZoOx6xD6axScJ3DnpkiakZ2SjJ73QDBk4FS5i4oSeT9wI5RXlq6IYpl8BL9TT7F+2Eso1ri6pc/5DMI/OUnyW8M3aKbvNDJR9nCFn5FsyQyreF3kmdMrRfKSROBr5DEEpzAXiF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848405; c=relaxed/simple;
	bh=DtAQGCWj4wQPGw/fn4RpnH94zUParCrSELcr5Lxa7Cw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=E7j08QaZrhMimuywnQNE8bp95r2ZCrymulYQdUNTs0huSQ4gBP5G01YWLA1a4pSpDgVL2B4C3fC+qkNhSbShCJ6gT2hPsghNmArvN6IbVbpgWyLDdJv+CGkRm9vWyNujwWSv7tkSEFiyfd4NF+D+X5114KId/ADYjm4Q0p5OhCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=lIAmOY8W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lIAmOY8W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A251F000E9;
	Thu, 27 Aug 2026 16:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787848402;
	bh=vDF430L9eL17qkXvJWF4I/+5SoLvT5ASA6u8T+S5+DM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lIAmOY8W7LKUCKU2gMhg6cObfeD7bpLl8Jz8Ugv3lydn9tmYVzG6k2DPNOtqMwgwV
	 jnlBbEcCQDWiyrLzXBWOanA8LOejEtz+RQyATcoJPA0W1k1DbHppN5Xrl0fV87cWiu
	 8B0cvqZuWNDwdluVLu3TST4jSTNX0UTw+IZQxk2c=
Date: Thu, 27 Aug 2026 09:33:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: syzbot <syzbot+5c417b73ac02e0e352c4@syzkaller.appspotmail.com>
Cc: jannh@google.com, liam@infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, ljs@kernel.org, pfalcato@suse.de,
 syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Subject: Re: [syzbot] [mm?] WARNING in __split_vma
Message-Id: <20260827093322.f99541b28aad2a3c069ed155@linux-foundation.org>
In-Reply-To: <6a8ff666.27659fcc.2ceef7.000f.GAE@google.com>
References: <6a8ff666.27659fcc.2ceef7.000f.GAE@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Aug 2026 01:33:42 -0700 syzbot <syzbot+5c417b73ac02e0e352c4@syzkaller.appspotmail.com> wrote:

> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1645f979580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
> dashboard link: https://syzkaller.appspot.com/bug?extid=5c417b73ac02e0e352c4
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=104a0d49580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f35979580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-818bebeb.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/6e4100526b12/vmlinux-818bebeb.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/723c4783ee96/bzImage-818bebeb.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+5c417b73ac02e0e352c4@syzkaller.appspotmail.com

Thanks.

Hopefully fixed by the pending "mm/mremap: reset unfaulted VMA page
offset for MREMAP_DONTUNMAP".

https://lore.kernel.org/20260825-fix-mremap-dontunmap-pgoff-v1-1-39a40b2c98b3@kernel.org


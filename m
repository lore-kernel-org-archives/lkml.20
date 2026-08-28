Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B403D668F;
	Fri, 28 Aug 2026 06:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899989; cv=none; b=B2pgma21ypMRV0UTtClPRnWod2Y1tANEPixSrGgF5JG9Wvh8C/nI0REUNGnYIzX863Y0iWK9c+Dc0Hao501AuNTSCrKDCiQCLDeP3HN4aUFuIx/svm3bMnBIuHIURUyrjpw//NwEJIZBq7XIPiWkQx5i09Deho71HurTQqmpD4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899989; c=relaxed/simple;
	bh=kW25XSdFnewODwXC6SZ6lwXSctC+dpVAyySaUAfe54I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pF0WIqSdUzouTUwvXbfFmoCVSxSKJnHT0m3xLFqtTdmRYzE14YcG31SSsdgWyEgXS0NgnfbScB11gHkhPbGG+cIuJrqsrztlXUCQR85nbbBZNP0AFdslwEMy4UvwIqA3tVajmSTL4sNuBH/1kfK+mAZDH9Z+tzA5Yi+ETq8nqgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kREv693T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kREv693T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F355D1F00A3A;
	Fri, 28 Aug 2026 06:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787899987;
	bh=7mP+xkU4/uOCJWNiMxPJFjRu3wos9SA/PDX7HNo8BOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kREv693T8P+Fr8UEAIDj+RHRzcv6zvDrPotZjqXh4kv1BEOk8xRCSF7YQQIhYAFEg
	 6Qwb9n/dwdIshxfsRpqg2EcxQzWMw2iunvBHIDG5wcZeLNnf54LcAR3vYnEJ/EeFCK
	 AbxjdFkctlp9mBKObpsMJOs06Yk58LH+q8H+aLBtYaiEVz6Nk+2WHnxEZ8+AT4lRMW
	 RTThRhMAX7Z6fRrg8bgxm7f1bhjrcv1C0BJN9ng2pl8x5wsriFTYk8IhetSHs5Uq38
	 9u42e6k50KkqDlv5pv/stl4q82o1+f+0mb9ObTFXnOV+nsaAwUMKCeyO3MZdBtucNW
	 fivPh3XKPkQig==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wzqSW-000000038xJ-3lLR;
	Fri, 28 Aug 2026 08:53:04 +0200
Date: Fri, 28 Aug 2026 08:53:04 +0200
From: Johan Hovold <johan@kernel.org>
To: syzbot <syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in keyspan_break_ctl
Message-ID: <apEwUJEsdauU9EY6@hovoldconsulting.com>
References: <6a9087a4.4d659fcc.734b4.0013.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a9087a4.4d659fcc.734b4.0013.GAE@google.com>

On Thu, Aug 27, 2026 at 11:53:24AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=16ba2979580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
> dashboard link: https://syzkaller.appspot.com/bug?extid=473d7477c523b41d4046
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=161f499e580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-818bebeb.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/6e4100526b12/vmlinux-818bebeb.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/723c4783ee96/bzImage-818bebeb.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com
> 
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000013: 0000 [#1] SMP KASAN NOPTI
> KASAN: null-ptr-deref in range [0x0000000000000098-0x000000000000009f]
> CPU: 2 UID: 0 PID: 6029 Comm: syz.3.20 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> RIP: 0010:keyspan_break_ctl+0x8e/0xe0 drivers/usb/serial/keyspan.c:608
> Code: ff ff ff e8 54 ca 48 fa 83 fb ff 48 b8 00 00 00 00 00 fc ff df 49 8d bc 24 9c 00 00 00 0f 94 c3 48 89 fa 0f b6 db 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 04 84 d2 75 1d 41
> RSP: 0018:ffffc900035b7cb0 EFLAGS: 00010203
> RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff87c231ec
> RDX: 0000000000000013 RSI: 00000000ffffffff RDI: 000000000000009c
> RBP: ffff88802f436000 R08: 0000000000000005 R09: 00000000ffffffff
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: ffff888034d39020 R14: ffff888034d390c8 R15: 0000000000000000
> FS:  0000555589f16500(0000) GS:ffff8880d5da2000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f5bac070000 CR3: 00000000584fe000 CR4: 0000000000352ef0
> Call Trace:
>  <TASK>
>  serial_break+0xcb/0x160 drivers/usb/serial/usb-serial.c:538
>  send_break drivers/tty/tty_io.c:2458 [inline]
>  send_break+0x2ec/0x370 drivers/tty/tty_io.c:2441
>  tty_ioctl+0xa2c/0x1640 drivers/tty/tty_io.c:2733
>  vfs_ioctl fs/ioctl.c:51 [inline]

And this is most likely the known issue I've promised to produce a patch
for:

	https://lore.kernel.org/all/ZIGejjOfsWkwjB2s@hovoldconsulting.com/

I'll revisit the fix and post it now...

Johan

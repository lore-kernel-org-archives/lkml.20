Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3728D42E8D6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758552; cv=none; b=qiE4ho5NnRbvVeknm6Eimnhv7f57yljcyzBVYCwwsQOGfiqgAYW5Zm0iYac9GViZQEzkdKrD8tXoQtGPhrxBYzf18P0F3huY5lgipM3tDejpRhlxWPD4Z8gnP13oDODtGkenXuVpXqEe/dS9awopvOALIQuHm6R5BQIWJwh1B0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758552; c=relaxed/simple;
	bh=H/gUvYcmo7aF4838k0h3U3mNV3CVnZ7lY3qbUaWgINw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KCFCVscwptF4mYtCnuYXcPl8Wlsa3AZULAX+eye/2ciD5LI2dWh8hS+ZfQFLaJsRQgbpgpKG254kc/3fapLVmp+Xpc2BdaSeeC1B/wsspr5Fn8jOtOfDRzeV8Pdr1xIfLeoV9hLSP5qK2Q8tR6kCosnXhaUM8c/MSaGk/A86dMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NA1dDU3o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NA1dDU3o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B2D1F000FF;
	Wed, 30 Sep 2026 08:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790758551;
	bh=smyXzlvSOyHCIwuaZy+2HZbtsR0hJx/vYNzEkKtyKYw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=NA1dDU3ojJWFJcrRdYxLhF0yLwcL8O/7xCrUVLe1Tm1F/oVkTh7MtuZExpZo8D1NW
	 zy63VZwY1H/PQzqRzPW0iyJj/mbZf/AROFDVYOJ7ZNPrBDrVrFjjfRRZnRovNZDkyn
	 ykjdjTMkotJ/q4NNkoL3E+fSyOJlj1OJjv6AVfminFTB9G6/GBQE8U3Bmo4K1uzmGz
	 X7Kgwv5U6SgnFlngK51oJObFu2ixY+eBOeNq0QlsOZxA/th6JqcRfK6PDtXuHg7IMh
	 ZqEogR0u3VFB/aTLZxjgeCMjFFS1KYjo56bi0rQnQPhvEtFQ4RCqFqbPYzbErLxzMg
	 BRyv69hsMekAQ==
Message-ID: <784ebcc3-2d37-4640-88fa-3385a646c2d5@kernel.org>
Date: Wed, 30 Sep 2026 16:55:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org
Subject: Re: [syzbot] [f2fs?] UBSAN: shift-out-of-bounds in
 __f2fs_commit_super
To: syzbot <syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6ab4ae74.80e1c6cc.1e8e5f.000c.GAE@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <6ab4ae74.80e1c6cc.1e8e5f.000c.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common

On 9/24/26 13:00, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    a8c591ed6b67 Add linux-next specific files for 20260922
> git tree:       linux-next
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=16f98405580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=19be71c9d7429efd
> dashboard link: https://syzkaller.appspot.com/bug?extid=dfcbc1741488709db4b2
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11f98405580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=148ea515580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/08a28cd722c6/disk-a8c591ed.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/e1c983b28f94/vmlinux-a8c591ed.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/ff7b15260591/bzImage-a8c591ed.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/3e937ffb1f11/mount_0.gz
>    fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=16029405580000)
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com
> 
> loop0: detected capacity change from 0 to 40427
> ------------[ cut here ]------------
> UBSAN: shift-out-of-bounds in fs/f2fs/super.c:3950:27
> shift exponent 4294967287 is too large for 64-bit type 'sector_t' (aka 'unsigned long long')
> CPU: 1 UID: 0 PID: 5622 Comm: syz-executor329 Not tainted syzkaller #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>   ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
>   __ubsan_handle_shift_out_of_bounds+0x36d/0x400 lib/ubsan.c:494
>   __f2fs_commit_super+0x43e/0x4d0 fs/f2fs/super.c:3950
>   sanity_check_area_boundary+0x7c5/0xe20 fs/f2fs/super.c:4040
>   sanity_check_raw_super fs/f2fs/super.c:4215 [inline]
>   read_raw_super_block fs/f2fs/super.c:4625 [inline]
>   f2fs_fill_super+0x1920/0x7fa0 fs/f2fs/super.c:5160
>   get_tree_bdev_flags+0x430/0x4f0 fs/super.c:1872
>   vfs_get_tree+0x92/0x2a0 fs/super.c:1932
>   fc_mount fs/namespace.c:1198 [inline]
>   do_new_mount_fc fs/namespace.c:3772 [inline]
>   do_new_mount+0x319/0xdc0 fs/namespace.c:3848
>   do_mount fs/namespace.c:4181 [inline]
>   __do_sys_mount fs/namespace.c:4394 [inline]
>   __se_sys_mount+0x31d/0x420 fs/namespace.c:4371
>   do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>   do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f2eb02deeaa
> Code: 56 53 b8 9d 00 00 00 0f 05 83 f8 ea 75 a2 c7 05 e4 5b 09 00 00 00 00 00 eb 96 e8 51 05 00 00 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffcaf01ba78 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
> RAX: ffffffffffffffda RBX: 00007ffcaf01ba90 RCX: 00007f2eb02deeaa
> RDX: 0000200000000080 RSI: 0000200000000000 RDI: 00007ffcaf01ba90
> RBP: 0000200000000000 R08: 00007ffcaf01bad0 R09: 0000000000000000
> R10: 0000000000200000 R11: 0000000000000286 R12: 0000200000000080
> R13: 00007ffcaf01bad0 R14: 0000000000000003 R15: 0000000000200000
>   </TASK>
> ---[ end trace ]---
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup


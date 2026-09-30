Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C5D51FCCE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790805519; cv=none; b=odYbyrIX1Ly58hp76qqk08T8/AlPwjYv2O44uUxSsyHXNvo9ysF+kHJNN2jrf+7nPstE259Z3ajZR9SLLoFphlnvMgKuaPevetOzUibdGudcTuQ59KQ+GtA9QC7ZupzOUow4f+RRVIuRQvCrfYgIgoE8hprZMW7J6lYE3wiWkmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790805519; c=relaxed/simple;
	bh=zUk+kXfcT81eZAHS44EsoY17GzM/VsmPHONlY579Id4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Ct7HtnSvFYBOvolYXak1ppFUF/n7O5sxcSyPyZBOXM92X2ekiVCKuwHa5vg4DsNZKPLss8aheDfZ89rpqLDvR719cVdUyjZB/d0oNLlm1FuKhuIfU4ugzdADmN2rs3wa8rPahVKmrDze2LXPA1CIOCWMIQpTk1Ia1tnt39J+/A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab260600easo374603b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790805517; x=1791410317;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vc4z7VeRQbe+d36pN2/ovHjhE5bdtXnnqRukeZJMg+0=;
        b=ebzQ+r5P9/IctQI1ATvdQce6HDZsC0uLJW/UZmn0CAIfRnS7FQhQz6a54Jz9TlC7Hq
         Oyqvh6YMM8n1Lg5iZt9z4AS4+Le+9Ww1w6VFtsEBM6dBCETI5Y5hjWDMniqEpzun2bdP
         nbgUmQKqyZ7Y2oBDYgnOihHY6gPjYE9+OpA3DUF8LHBTbNWvayJunF87mxPNBjATM/PS
         PurOqS6WfmFLmPQ71ROx0FwRPzRMOoQM87yzLFSFnKESRC52TZFGs00VvJop3j7e9M/a
         kYWYxXeo0iMe4b0Q7kFOPGnkDdORMZkWeIOfx+3U6JukNHjyCs7nZNw9wySZEPhOd4fe
         N48A==
X-Forwarded-Encrypted: i=1; AKwUvBwCaLCR4uoXjpnFxbc6D26UFXi2Tv1tFEiL1UX9s3O/L27DgF+rPIjIJ1rk2L9REN7KDO99PhH95PZ07cI=@vger.kernel.org
X-Gm-Message-State: AFuF++m1r46Zz717ZW+2SY10rzflPIamx9KH0v3bwVwQ6lAwD5Bup8Qo
	up0GF8GM5MW6vgLCTBC2wT3o+VHwhPCj7e8Z/NYmNMqpQplU1P8C5K0ViPEtEQfIrQTnLN1Yfw+
	xwTRgteqCib9etcls95/C9mh6TVSgfbLkBE7xVB3uXngvE7TgIxIm3rGTd94=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a0f:b0:4f1:5068:b93b with SMTP id
 5614622812f47-4f307f06067mr1244503b6e.14.1790805516878; Wed, 30 Sep 2026
 14:58:36 -0700 (PDT)
Date: Wed, 30 Sep 2026 14:58:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abd860c.9b478af7.e8d7a.0000.GAE@google.com>
Subject: [syzbot] [net?] WARNING in new_slab (3)
From: syzbot <syzbot+f95c2f0a71a98cef50eb@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6f8319e3e9a4 Merge tag 'mm-hotfixes-stable-2026-09-27-19-1..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13af7df5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a820d8842c77560
dashboard link: https://syzkaller.appspot.com/bug?extid=f95c2f0a71a98cef50eb
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-6f8319e3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/91b951779fc3/vmlinux-6f8319e3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/18319ae672c1/bzImage-6f8319e3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f95c2f0a71a98cef50eb@syzkaller.appspotmail.com

------------[ cut here ]------------
current->flags & PF_MEMALLOC
WARNING: mm/page_alloc.c:4816 at __alloc_pages_slowpath mm/page_alloc.c:4816 [inline], CPU#0: cifsd/12032
WARNING: mm/page_alloc.c:4816 at __alloc_frozen_pages_noprof+0x1eac/0x3300 mm/page_alloc.c:5449, CPU#0: cifsd/12032
Modules linked in:
CPU: 0 UID: 0 PID: 12032 Comm: cifsd Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__alloc_pages_slowpath mm/page_alloc.c:4816 [inline]
RIP: 0010:__alloc_frozen_pages_noprof+0x1eac/0x3300 mm/page_alloc.c:5449
Code: 38 d0 7c 08 84 d2 0f 85 de 12 00 00 65 48 8b 05 e2 a7 1c 12 c7 84 24 94 00 00 00 00 80 00 00 f6 40 2d 08 0f 84 ba e7 ff ff 90 <0f> 0b 90 e9 b1 e7 ff ff 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03
RSP: 0000:ffffc90002e172d0 EFLAGS: 00010202
RAX: ffff888029380000 RBX: 0000000000000000 RCX: 1ffff1100fffad29
RDX: 0000000000000000 RSI: 0000000000000002 RDI: ffff88803fffd938
RBP: ffff88802938002c R08: 0000000000008000 R09: 0000000000000001
R10: 0000000000000002 R11: 0000000000000000 R12: 00000000000cac40
R13: ffff88803fffb900 R14: 0000000000000000 R15: 1ffff920005c2e74
FS:  0000000000000000(0000) GS:ffff888096955000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000008000a000 CR3: 00000000403b5000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab mm/slub.c:3470 [inline]
 new_slab+0x1f6/0x6e0 mm/slub.c:3513
 refill_objects+0xe3/0x410 mm/slub.c:7417
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __kmalloc_cache_noprof+0x4f4/0x6d0 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 ref_tracker_alloc+0x190/0x590 lib/ref_tracker.c:270
 __netns_tracker_alloc include/net/net_namespace.h:370 [inline]
 sk_alloc+0xcfc/0xe80 net/core/sock.c:2329
 inet_create net/ipv4/af_inet.c:333 [inline]
 inet_create+0x3a0/0x1060 net/ipv4/af_inet.c:259
 __sock_create+0x339/0x860 net/socket.c:1676
 generic_ip_connect+0x826/0x1810 fs/smb/client/connect.c:3377
 __cifs_reconnect+0x348/0xa80 fs/smb/client/connect.c:420
 _cifs_reconnect fs/smb/client/connect.c:596 [inline]
 cifs_reconnect fs/smb/client/connect.c:610 [inline]
 cifs_readv_from_socket+0x7c1/0xa30 fs/smb/client/connect.c:749
 cifs_read_from_socket+0xb8/0x100 fs/smb/client/connect.c:804
 cifs_demultiplex_thread+0x2db/0x2ea0 fs/smb/client/connect.c:1295
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14387285CB9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789441804; cv=none; b=K42NMx7MVHcFFICWyfeK5pHmE8EGGbxDEyUqKF9cx4GS87nPobkpAsXM4/2aZz1j8O8/TONpGTuBqSi0d2m3a/bt5A8R+3KNIXwREnoT9/jDJzjwBfpFYg7AM6rdkd5RoXMHIKgk+LYbSwn3ywnbHmZbcF87PyPcjo+xxEPY28k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789441804; c=relaxed/simple;
	bh=XGXDHS/8qTY7POdguc23dOxyxJdACUy4xs2gylI3iBE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TW7pZYyQrCQw+RHKCqRhkKFWUI9Kwd2FeHj1G1uRjmYw9keoQ4gKay0rCYBWk7Km7Zlgmbz990KrdlzX9f+OoaY6T3ognfvijJTtY7tJ693VEJA7b24dDFVnFAkKIt3JxiCZCViaEnKFp6ydmEVaCU9jgMkNAK0M6tQWuLYCh5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c2d5235ac3so669621eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789441802; x=1790046602;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vBY6NIdVOOZBN2W6MjW/2GpDpEwGqqnOlZ+t9S+p1CE=;
        b=MSWvDz7X3MWgL5vs9qroz0Q6Tg+cDvCmOFb90j309n5jWRPyY/03XfYZhk22upYfBp
         fXwcQoGYgepqbkt2f22X6fneDfy9m1wIfRsZuv7RrG8PxQ4uwTtY21yKEtOlfYi1423h
         tYfazKhG8zQtbyMekS2mCeTnYfv8uxzmwM5Lw2OmA46XCd71toh5T4W0B+5TXFcwU9MC
         DMEuuo3qh9mJJH80lGTd0EPQ9RRT5XIjMOyjiB79746KyiFB30WnK8YM1KQBaVHQH5Qf
         yuJh5wqePrpup5j16fa1GdveG9cs8Gkud/6ef8E2bNzlVfF/K7hVYmGdiS8vjFiaGsfW
         tOmg==
X-Forwarded-Encrypted: i=1; AKwUvBzIpx0YlkL60lZFKgRc8fAofGovNVgobmbKKl93KX/5j7BmGC6JvE+ay37J1Qli1lY2veKbaZidkpHB+oA=@vger.kernel.org
X-Gm-Message-State: AFuF++n8bdKuJ7CgkSRroioTGb35y/CC5mvNS+7ILMiucL5JLbFu9uQX
	fFGqRltyiyPnlPkAqQs/ZNSgVK4rF3GotAW1kMAOI9hS3AofMNKMYO/7dOOPdfqsQlxyPd8JbhV
	urmYGVNF1WZqHRbHWLHa3v/R3hbk+FYevSZ2Srs78Ih4xJ9MvWxtlvu+b4/o=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e90d:0:b0:6b1:9b72:213c with SMTP id
 006d021491bc7-6c636f2b000mr1082973eaf.3.1789441801898; Mon, 14 Sep 2026
 20:10:01 -0700 (PDT)
Date: Mon, 14 Sep 2026 20:10:01 -0700
In-Reply-To: <6aa8a1b4.5dbb337e.688b9.09f4SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8b709.4c28b7d0.c1bba.002d.GAE@google.com>
Subject: Re: [syzbot] [raid?] UBSAN: array-index-out-of-bounds in super_90_sync
From: syzbot <syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
UBSAN: array-index-out-of-bounds in super_90_sync

loop0: detected capacity change from 0 to 4096
md: async del_gendisk mode will be removed in future, please upgrade to mdadm-4.5+
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in drivers/md/md.c:1702:17
index 124 is out of range for type 'mdp_disk_t [27]'
CPU: 3 UID: 0 PID: 6041 Comm: syz-executor385 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
 __ubsan_handle_out_of_bounds+0xcc/0xf0 lib/ubsan.c:455
 super_90_sync+0x1eed/0x1ff0 drivers/md/md.c:1702
 sync_super drivers/md/md.c:2510 [inline]
 sync_sbs drivers/md/md.c:2752 [inline]
 md_update_sb+0xbba/0x2840 drivers/md/md.c:2928
 state_store+0x31e/0x1340 drivers/md/md.c:3250
 rdev_attr_store+0x1d9/0x560 drivers/md/md.c:3773
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff84eda46f7
Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffd0ac102f0 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00005555643c0400 RCX: 00007ff84eda46f7
RDX: 0000000000000008 RSI: 00007ff84ede0c12 RDI: 0000000000000003
RBP: 00007ff84ede0c12 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffd0ac103c0
R13: 00007ff84ede0b5f R14: 00007ffd0ac104d0 R15: 0000000000000002
 </TASK>
---[ end trace ]---


Tested on:

commit:         58785836 Merge tag 'nfsd-7.3-1' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=151c7df9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=9e3014263a35700ab49b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16c69901580000


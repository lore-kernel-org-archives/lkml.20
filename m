Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792928810;
	b=2/nvt6oaKNYgaWxuU1KsIYc5UBuj1scKRl7YrMgBgKa64RvEqJ4G/AO2jeYwCWLv74nM
	 Cg/c8funFF9x6Ymi/xicOepTLEyTVWN9XZieawMKpuFZ2eij+OuX+RsTDs22jLjVlUlX8
	 lb4FBK64u7cNpg2g0pS4UHvCPUU8Nf64kE1kKInBW4wUhHGP26CVykEzw7X1ShqvJSCIr
	 nBrrPq+PE+JvXgi93jgx0YNdHMmzJh8i2bYjJ23OPqlbAOXTYWmwxTwDQoHBaZi0Pl29A
	 F5QR13JeG2CzPlUsscf9q5abw2IndGFA2fV1T8oA5bNJjLyAUr6BCqaDle+w3Lb2S3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792928810;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=34EPicobVnv5oflPmgJcIKRaZYIcjTZOAEPlpjR6amk=;
	b=nDrqUmDux5AI+FfaKqY4TzxGdQVQcpqS8YGyGvYa6bMkMPO7RXuOCiNYXBZ1ZoE4p1K6
	 YH5huzyUQ8/LmZ7l/VfwfS/7uY2zFhg+9dl8hiDUtp3uW6WJY2LnAxAGY81dAFnv2d69r
	 fxa5Y2NjoSAdCJFbcrq+N2KQM/F/o7XuSt8MF+SlDo2Gef2YTOdjeN9b5iYtWEurPQeZK
	 r7FR/Le4q2yDWj6MnpPjkUcRXBiibA9uz73dw0I3yqcXAbKioM71H5f3qJhszj23AdRQq
	 VDtY4u3Z+0zEKahEfYEAqzGLdjD5SteQcR+SsWivnhcSY2BBlfDQU3SvUWzYpXx4SBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFA8606A320
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDFA8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2d1eb484aso3434676b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792928809; x=1793533609;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=34EPicobVnv5oflPmgJcIKRaZYIcjTZOAEPlpjR6amk=;
        b=APSOALuLBaomMGjC2Tk6udojFEzLVTHZPuqIdaU9K3433jwmsgrnGPTgg6haKLKUJo
         Le7XmBmC1kL//4B+qqJhB6bS/JjH2s1NiHJl+Vk0ZYjcoPNvVVIU06XWY/dA4r0JNKBf
         Usr/YTp6fRw++N11a3i+6P+HP6Ad6fWXmyYA9cHeK97wc6P00sEzULLFJNgC20v72t2L
         Hh+mQZIW97x8tVOx4/9Mzq8nQzWE02y9BDHfZ6VnnBhBe6aTJkYn24N8Pq0gnOCujlX9
         YQ2zFA3MBBg6EclRf58VKnxZdB8QbYCeox2XdV4AoqMtMuQq02UriUg1Nm+jycJx/dSt
         L0kw==
X-Forwarded-Encrypted: i=1; AKwUvBwnISGRK6t2UPKIUTx+Pfqdv6gF8mg1JzFiaYxQuGVhOIBqV81Zj1fEmJZAIEhM1RSUoqEbY1KJI30G3QE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwVTww0hYnFU4FrOaBgXnlSY+kfqaqti6cOA/aAMELnTh76foI
	le/VskGxt965wpXFd9uHkeFs8gs1d56Og+bOkaJfqGbFEhp6/URaeegxIzthBqeuBVHlBMTOZI0
	6EclEWy48SS0MFXmfXCKMSjioZWI94n+ff06YkfvNLEfht/8TiLCoSl3glxc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f46:b0:4fb:a089:bf23 with SMTP id
 5614622812f47-55c0039ebb2mr2411383b6e.49.1792928808935; Sun, 25 Oct 2026
 04:46:48 -0700 (PDT)
Date: Sun, 25 Oct 2026 04:46:48 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6addec28.412b1182.196980.00aa.GAE@google.com>
Subject: [syzbot] [dm?] KASAN: null-ptr-deref Read in dm_kcopyd_client_destroy
From: syzbot <syzbot+a2626a25eb2595e3ec3c@syzkaller.appspotmail.com>
To: agk@redhat.com, bmarzins@redhat.com, dm-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, mpatocka@redhat.com, snitzer@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4169c9c90532 powerpc/irq: Fix build with CONFIG_PROC_FS=n
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=126fa38e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e397d1e24d3cb03
dashboard link: https://syzkaller.appspot.com/bug?extid=a2626a25eb2595e3ec3c
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=166fa38e580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a2626a25eb2595e3ec3c@syzkaller.appspotmail.com

workqueue: Failed to create a rescuer kthread for wq "kcopyd": -EINTR
==================================================================
BUG: KASAN: null-ptr-deref in instrument_atomic_read include/linux/instrumented.h:82 [inline]
BUG: KASAN: null-ptr-deref in atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
BUG: KASAN: null-ptr-deref in dm_kcopyd_client_destroy+0xae/0x480 drivers/md/dm-kcopyd.c:980
Read of size 4 at addr 0000000000000174 by task syz.2.19/6560

CPU: 0 UID: 0 PID: 6560 Comm: syz.2.19 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/15/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 instrument_atomic_read include/linux/instrumented.h:82 [inline]
 atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
 dm_kcopyd_client_destroy+0xae/0x480 drivers/md/dm-kcopyd.c:980
 __destroy+0x172/0x2f0 drivers/md/dm-cache-target.c:1973
 cache_create drivers/md/dm-cache-target.c:2604 [inline]
 cache_ctr+0x1674/0x2bf0 drivers/md/dm-cache-target.c:2649
 dm_table_add_target+0x58d/0xc70 drivers/md/dm-table.c:749
 populate_table drivers/md/dm-ioctl.c:1602 [inline]
 table_load+0x325/0x8a0 drivers/md/dm-ioctl.c:1645
 ctl_ioctl drivers/md/dm-ioctl.c:2221 [inline]
 dm_ctl_ioctl+0x9ec/0xe10 drivers/md/dm-ioctl.c:2243
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb5b039f559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb5b11ce028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fb5b0626180 RCX: 00007fb5b039f559
RDX: 0000200000000280 RSI: 00000000c138fd09 RDI: 0000000000000004
RBP: 00007fb5b0436b20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fb5b0626218 R14: 00007fb5b0626180 R15: 00007fff197480a8
 </TASK>
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

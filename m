Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793774316;
	b=1j0pIo4TIHHklm9Hz39iVslkRdVlrMEXBNiv6IkwRyROLN7i8jXWeiKrq71C82SEthWz
	 G7ktP18nPoz/JMLiQ2zuzq1lutBJVCRpePbgWWWsvybX7MApd1MJgaERlsPQJYnMjbLxc
	 Z+BRsImPlnBs/Bs79j6MpHu+ssBd7Da7hiBO3UmNa0Mz8PY+cN70k2k45E2chlgRUHfvC
	 jk8/0msQCCIKKw4afkB6GKhYCgr+H3vEGOCjv+jccn/qUZwEzt1nLvGOJh4cS0nYI1jNp
	 Rvv4MLhlOrhyhw+NFOcmlHPDxRlcSkbFkFi3t+zP/XWln0UPkflzTq5Q1KyNaUqNl/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793774316;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=BqJvBGEmlOEUiMEuSomhKkkIhAEsRGhylpEaf3nKmLw=;
	b=NEqb7GPNesqRoTr+ypyQv7BGHJq9ToUyz0GjWQZcGTQqP4c0IxIM8TL4Ej7IXss2Ngde
	 cRj8mKSqBlHOJb0aX2A7uH4b/FwY1jUMBf84UJGniFWLB/6fiqo2N7NfOV1ANmJWEyfB/
	 2rT0SYl7TgZDcUPJKbnSSf00hGaW0kgQ5GNpWJBtUFFIJ1pTKrW0KZtcRp5d7WAvBqXRd
	 ea9ZIkjz5RjZ2QjkNG4tt581XlY4luOh0J56M2lOmRPzPLDe5cpQWktEU6EMup38fQkt6
	 Im0uorSLLclhxuc6GldQ9EBYzDWR7u+Vy/hLAlLh1DMcdDXavJ9cizoEFs6C2eZNp1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A22606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05A22606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c467e19391so654101b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:38:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793774315; x=1794379115;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BqJvBGEmlOEUiMEuSomhKkkIhAEsRGhylpEaf3nKmLw=;
        b=OQNdTh2p3r/olDCTgeDeRBikhBPjvsdF82P7zrD8tj4/qSUc/G0DJucQ1sZ77yCDes
         rxS4oeR3GlmrzxJXYGOEe0QAe7zvfnnuhnREXzn2clsfIsaLvWh3NCmnKNXLVkLxXsHZ
         GzrVDhGvbfT2TX0aJgxjA5gSGjiHVs7mIExP6ODbz8OJcoaRQ6rGQx4xrhVFBJLIWZ+2
         UDQit4Xj1tBrMTv3Ot33d/6+OWwhQzzDNslrCshvgR0ks/AWVtY+XvKN3q06Z9gB6Rms
         zBEA+GekgkLV5bvD3tHXXTlmktM4ZZ+cwmLtsglKFF3BrcSIInuTEopiy/QZTHjw9hXD
         CoGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrRl7vE5SnSv96ZTQebltzlnsQjH5UPv3dyEdUKOLfjWKCYXFLeCyiD2LCm++DjLYPPG1stxF5bIIiuH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NBiw40/IaWMVSJE23vt2CLr94WWkf/o+yDS+/IHMDm6ddmWaF
	2ItMqD6h064v4whxBuQkYYWfarU2eV9LBXp/OlWrBY4yzw9Yq8OFXjdwVlwkwe2ufF5VhuDEPWl
	hhrYTsvPACq9LKviDRTjYOYqfQhU2E1XYlMXEJ/5aV6qlD1+fGHwclPIKORs=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14d3:b0:4e6:cc78:edc1 with SMTP id
 5614622812f47-5640dd5fcffmr11061613b6e.42.1793774315044; Tue, 03 Nov 2026
 22:38:35 -0800 (PST)
Date: Tue, 03 Nov 2026 22:38:35 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aead2eb.3c6f2eba.20048d.0000.GAE@google.com>
Subject: [syzbot] [media?] [dri?] kernel BUG in sync_timeline_signal
From: syzbot <syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6628e7d4c6b2 Linux 7.4-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13fa63f1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d2c97eac7d33533
dashboard link: https://syzkaller.appspot.com/bug?extid=cba1a1f459230395a076
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=134d2959580000

AI-generated root cause summary:
In drivers/dma-buf/sw_sync.c, a race condition exists between dma_fence_put()
and sync_timeline_signal(). When the last reference to a sync_pt fence is
dropped, its refcount reaches 0 before dma_fence_release() ->
timeline_fence_release() acquires obj->lock to remove the sync_pt from
obj->pt_list. If sync_timeline_signal() runs concurrently under obj->lock, it
iterates obj->pt_list and calls dma_fence_get() on the fence whose refcount is
already 0, violating refcount invariants and causing a use-after-free / refcount
addition-on-0 kernel crash.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=cba1a1f459230395a076

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com

refcount_t: addition on 0; use-after-free.
------------[ cut here ]------------
kernel BUG at lib/refcount.c:34!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 1 UID: 0 PID: 6018 Comm: syz-executor369 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/15/2026
RIP: 0010:refcount_warn_saturate.cold+0x12/0x14 lib/refcount.c:34
Code: 89 ea be 01 00 00 00 48 c7 c7 40 c1 c3 90 e8 0a 5a 01 00 e9 72 e3 02 04 e8 c0 54 d7 00 48 c7 c7 a0 4a 81 8c e8 04 85 eb ff 90 <0f> 0b e8 ac 54 d7 00 48 c7 c7 40 4b 81 8c e8 f0 84 eb ff 90 0f 0b
RSP: 0018:ffffc90003e57cb8 EFLAGS: 00010086
RAX: 000000000000002a RBX: ffff88802d271570 RCX: 0000000000000000
RDX: 000000000000002a RSI: ffffffff81ebf219 RDI: fffff520007caf88
RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000000
R10: ffffc90003e57a7f R11: 0000000000000001 R12: 0000000000000000
R13: dffffc0000000000 R14: ffff88802d271300 R15: ffffc90003e57d18
FS:  00007f83e74d26c0(0000) GS:ffff88812257d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f83e75a93c8 CR3: 00000000357c8000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __refcount_add include/linux/refcount.h:289 [inline]
 __refcount_inc include/linux/refcount.h:366 [inline]
 refcount_inc include/linux/refcount.h:383 [inline]
 kref_get include/linux/kref.h:45 [inline]
 dma_fence_get include/linux/dma-fence.h:323 [inline]
 sync_timeline_signal+0x6d9/0x8a0 drivers/dma-buf/sw_sync.c:224
 sw_sync_ioctl_inc drivers/dma-buf/sw_sync.c:405 [inline]
 sw_sync_ioctl+0x7b4/0x13f0 drivers/dma-buf/sw_sync.c:470
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f83e7507d5b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007f83e74d2100 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f83e7507d5b
RDX: 00007f83e74d2170 RSI: 0000000040045701 RDI: 0000000000000003
RBP: 00000000000003d0 R08: 0000000000000000 R09: 00007f83e74d26c0
R10: 0000000000000008 R11: 0000000000000246 R12: 00007f83e74d2170
R13: 00000000000000f3 R14: 00007ffcce841440 R15: 00007ffcce841528
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:refcount_warn_saturate.cold+0x12/0x14 lib/refcount.c:34
Code: 89 ea be 01 00 00 00 48 c7 c7 40 c1 c3 90 e8 0a 5a 01 00 e9 72 e3 02 04 e8 c0 54 d7 00 48 c7 c7 a0 4a 81 8c e8 04 85 eb ff 90 <0f> 0b e8 ac 54 d7 00 48 c7 c7 40 4b 81 8c e8 f0 84 eb ff 90 0f 0b
RSP: 0018:ffffc90003e57cb8 EFLAGS: 00010086
RAX: 000000000000002a RBX: ffff88802d271570 RCX: 0000000000000000
RDX: 000000000000002a RSI: ffffffff81ebf219 RDI: fffff520007caf88
RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000000
R10: ffffc90003e57a7f R11: 0000000000000001 R12: 0000000000000000
R13: dffffc0000000000 R14: ffff88802d271300 R15: ffffc90003e57d18
FS:  00007f83e74d26c0(0000) GS:ffff88812257d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f83e75a93c8 CR3: 00000000357c8000 CR4: 00000000003526f0


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

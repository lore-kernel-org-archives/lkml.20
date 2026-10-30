Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793327804;
	b=d3qewpg5QVCgt1IHWgW7H47dQAji0fFV6DI9AvGekpZkUgGIcBkxqDrNSeGTPqt/PWJF
	 +4F1MUq3eljQ25aqk5Akke3HuwpcdQxtpYmC17al5h/rAZlf4lrieHidU8rq5SkYw6bap
	 KNb1//b+R/2c8RqXuX9Y5uYGTyX1++yHhH7zHPQzbi7lY74IngoJrWi0zIYwjAME8dGea
	 1m1avmdriNAEU/Xqh2a+HLs0lo8r0FSspMrn+e/5DX7MTdGETCjTI9/4NdyHjUQT4Tnwr
	 N7mfs8atsmor210nBoczl9o5KZo6Wpo29To1LaHEGBGwKhwthEzm9j2s3rjuyittFBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793327804;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=LZpY3C/W3YVvnLmO3CF3zYjfsRgXkvzAHK5Myqx7bt8=;
	b=1eahlQ3JSCyem5mmfGvb8X4pKNKdWT/O4fQVfQ59J04+KGLGB1M7qPuqRKeYKhOUiBmv
	 OI9VHw+xCCT459flmCDBSC7/QFoOWsgFZ6bWB818GDkspn7jfVO6g/vaMG5aXrkTpT+Np
	 AO2vJHfC5/PLLIE4NaEsPsk3+9w8K3GA4SnB/lrm7TAfqNhk3+uq2g8bADeAc5IxiUOc9
	 7iIShargInU5IS9ID8U/hjS0PLZsFzs5FUy7h24mxTIMiCGnoRt4PsJ5W62QK423oc7qM
	 3JTZJU4g6fMMBXynUYJNlvwVUe5JFckpqWB0P4gI54Frr/7OogBV4oRsqXWu5P0OWLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43422606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43422606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4e778acdbc6so308341b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793327803; x=1793932603;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZpY3C/W3YVvnLmO3CF3zYjfsRgXkvzAHK5Myqx7bt8=;
        b=j45aJGwbLRfW2gecgQD3Mt5UPDPykj//1YjZ4qBCuBHsFOUsGU1/WlRl5h0zGtX3Qf
         FdIHvz7aHIRMDJIIfH4/r1P/iJ1nJgs4RktFR4QgoXRQWsUCPJaBsRO3H0WDeQ3Ls+bG
         N4GBod2dOP20C6r07rMui3pcOSbDMUqqNK/Ucm4BObx+Ls19/iQYgA3s2HmP6rea9eyM
         LiBuaExpZ/Z37yY55Ds+e0WRVJgMBKZt7MKFBgfF0Nv4JdEQI29i6AbPpZO5X2pPehIn
         5ONEAC4hYuufmlgR8qv1gL1R5kwpvO/mv1bz/qv3PFXQNwWv5ZV1ZKRj69ulXJ1qh87+
         uk3g==
X-Forwarded-Encrypted: i=1; AKwUvBwoJeEUc1zLqL7CLF19HJG8jR9RPx8ndXupIpcIbYKOgUhOb5JRyWBsHivcm8d7NXRoSTI14rPU67IRmyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9ZtcD6mXDj+R3UXmUKA87HvgSwbVHkMKSO9F8HpjWR9r6WEf/
	a7pwqtZVtwgKaS3H+hMaLkehsGRmbGfbhMrIxTbUKxBnDVz74vvhkSflRNsdtE+Fs83unXxiNDu
	clWF7MXsmGIUkp/6tFcEWVh2Uf96tSyuG1e4rMcavQwmNHbZwfgV0bQ4exF4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6508:b0:4f5:4780:582 with SMTP id
 5614622812f47-5640dfeff32mr678119b6e.50.1793327803370; Thu, 29 Oct 2026
 19:36:43 -0700 (PDT)
Date: Thu, 29 Oct 2026 19:36:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae402bb.0c1d3ab6.e3d48.006c.GAE@google.com>
Subject: [syzbot] [f2fs?] memory leak in f2fs_apply_options
From: syzbot <syzbot+6c000dea1a93b4f5905c@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c339f4010dea Merge tag 'platform-drivers-x86-v7.4-1' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15fbdd95580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=73ec643490576dec
dashboard link: https://syzkaller.appspot.com/bug?extid=6c000dea1a93b4f5905c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c1448d580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/533212b95d17/disk-c339f401.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5cb62d3629c7/vmlinux-c339f401.xz
kernel image: https://storage.googleapis.com/syzbot-assets/12da5b4ca87c/bzImage-c339f401.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/546324936b23/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=17480929580000)

AI-generated root cause summary:
In F2FS, when remounting a filesystem with an empty journalled quota option
(such as 'usrjquota='), f2fs_apply_quota_options() overwrites
F2FS_OPTION(sbi).s_qf_names[i] with NULL without freeing the previously
allocated quota filename string. While __f2fs_remount() duplicates the existing
quota file names into org_mount_opt via kstrdup() at the start of remount and
frees them upon successful completion, this only frees the temporary backup
copy, leaving the original allocated string orphaned. This results in a kernel
heap memory leak on every remount that clears a journalled quota filename
option.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=6c000dea1a93b4f5905c

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6c000dea1a93b4f5905c@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888128b26a10 (size 8):
  comm "syz.0.17", pid 5977, jiffies 4294944034
  hex dump (first 8 bytes):
    66 32 66 73 00 00 00 00                          f2fs....
  backtrace (crc 49a76b1f):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4733 [inline]
    slab_alloc_node mm/slub.c:5033 [inline]
    __do_kmalloc_node mm/slub.c:5530 [inline]
    __kmalloc_node_track_caller_noprof+0x3e0/0x530 mm/slub.c:5662
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    f2fs_apply_quota_options fs/f2fs/super.c:1661 [inline]
    f2fs_apply_options+0x99c/0xb70 fs/f2fs/super.c:1804
    f2fs_fill_super+0xfc4/0x43f0 fs/f2fs/super.c:5288
    get_tree_bdev_flags+0x1c0/0x290 fs/super.c:1883
    vfs_get_tree+0x30/0x120 fs/super.c:1943
    fc_mount fs/namespace.c:1282 [inline]
    do_new_mount_fc fs/namespace.c:3910 [inline]
    do_new_mount fs/namespace.c:3986 [inline]
    path_mount+0x5a9/0x1580 fs/namespace.c:4337
    do_mount fs/namespace.c:4350 [inline]
    __do_sys_mount fs/namespace.c:4565 [inline]
    __se_sys_mount fs/namespace.c:4542 [inline]
    __x64_sys_mount+0x1a3/0x1e0 fs/namespace.c:4542
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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

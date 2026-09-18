Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094673115BC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789760687; cv=none; b=tRVIvpg2dKu9QqHYwPnAbEtOg4ExXmwZdOr+QZGK5v/BDpJ/fCvKd4kYZsV70aj1oicbIN01f1RTiEEhQrJ41sIVAe9YgvQXsa1GYiiNJjEgmafWY7SnJRhYBgaeiIlI1CJD4HPbCqA7jBCC2HnYw2gvcK+4pdUsfXLBNB9XuE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789760687; c=relaxed/simple;
	bh=8WHA82Upm6WvCV3hKve3Bdxje7rQueBVUD94EtinsA0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lBRWbhrqNnQTS7ogqzL94pMVJBEs8+Ypd7f3tK+ufBES9MIY3U7du7Fh85k9rxNGAyjz8UEk2Wj147Vxq9FkgUcMdCX10YAV1j9cxA3b3/xdJfNU8kr9DCcBeLr37zeX8PzakKy6iflqnWktdS2BooaRhrVqzD61O1N4ftzDQWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f3.google.com with SMTP id 006d021491bc7-6b35c65f4cdso419370eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789760685; x=1790365485;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B58QLtxNJW2TWmNk7rDHcHqu0cb9CsdeNl4cvQJJN+8=;
        b=cDpOcs2zNzeFA/0EOYHEjotwanRCkLkOmh7T7m10N/wmC7rk45K4Oljymr/izuTU7P
         IRdgb5p4J/YtXO6lpsE9M2l0OFsU4mtz29BxQtuwsJhQzZfwqnrijuy2fO8viB+pvYTr
         t2lLlPU6P+G+QA/gzrTcaJTX7KW0tAd3Z2gO/xeeTBESzUvXb449/BxwjZf9mlFz296G
         zCCU6ztfbp2IkvKKSyhUWCtt0MdmJuLGhpgxyx0Y4PoWKbg6CmP4HbmXw4c5lu0vqbE2
         VzOJOBRGW6nkTj6SSgR3eG4foBWGOoZ0oEATnJxgJRe6Nj3xWunCoaouvtujjjLuqovP
         MXYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhIhTFQp2X9rCvC19ZR3RxkztkjTXXS9mZZIWkCdM7gsoZrrDoMdy3/RnIXbU5aCEFLdDCSeFESafS5Ec=@vger.kernel.org
X-Gm-Message-State: AFuF++l2NK9kRXXnknFGAzkKijWbjgwV4bqzD8o7UN4/+hD06GOtoqrQ
	9/8lzNnmR39PjTX2oX38QcMW8KThVXWUC93FxsT61j67XFWPwsZG7xd2qznnLwe5eT4OTOYf5Sg
	gTd2YxkM7AdR0v8Vv9skiNuDWadqRkAykcJScFEYtBg9hYGh+ITFtQkc+Trg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2221:b0:6b3:752a:53c9 with SMTP id
 006d021491bc7-6ca9a63c6ffmr3350107eaf.2.1789760684868; Fri, 18 Sep 2026
 12:44:44 -0700 (PDT)
Date: Fri, 18 Sep 2026 12:44:44 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aad94ac.87c06881.1db2b3.0023.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING in iounmap
From: syzbot <syzbot+ca1ef9e2e234b8d3599b@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, luto@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, syzkaller-bugs@googlegroups.com, tglx@kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    704340f1cd0d Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13727a99580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=ca1ef9e2e234b8d3599b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=110f305e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=118f88c9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-704340f1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e02afc1c5927/vmlinux-704340f1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/09cb4a8b3309/bzImage-704340f1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ca1ef9e2e234b8d3599b@syzkaller.appspotmail.com

e1000 0000:00:01.0 (unnamed net_device) (uninitialized): Unknown MAC Type
------------[ cut here ]------------
!is_ioremap_addr((void __force *)addr)
WARNING: arch/x86/mm/ioremap.c:460 at iounmap+0x64/0x240 arch/x86/mm/ioremap.c:460, CPU#2: syz.0.17/5914
Modules linked in:
CPU: 2 UID: 0 PID: 5914 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:iounmap+0x64/0x240 arch/x86/mm/ioremap.c:460
Code: df 48 89 ee e8 fd 3c 51 00 48 39 eb 72 16 e8 13 43 51 00 eb 28 cc cc cc 49 bc 00 00 00 00 00 00 32 00 eb 23 e8 fd 42 51 00 90 <0f> 0b 90 e8 f4 42 51 00 5b 5d 41 5c 41 5d c3 cc cc cc cc 49 bc 00
RSP: 0018:ffffc90003ebf7d0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff88802403cb00 RSI: ffffffff81bada13 RDI: ffff88802403cb00
RBP: ffffc90000000000 R08: 0000000000000006 R09: 0000000000000000
R10: ffffc90000000000 R11: 0000000000000001 R12: ffff888057315430
R13: ffff88802322a0d0 R14: ffff88802322a03e R15: ffff888057314000
FS:  0000555593d27500(0000) GS:ffff8880d5d59000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000002dbb65fc090 CR3: 0000000036b28000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 e1000_probe+0x1400/0x2cf0 drivers/net/ethernet/intel/e1000/e1000_main.c:1230
 local_pci_probe+0xdd/0x1b0 drivers/pci/pci-driver.c:354
 pci_call_probe+0x176/0x800 drivers/pci/pci-driver.c:416
 __pci_device_probe drivers/pci/pci-driver.c:478 [inline]
 pci_device_probe+0x25b/0x400 drivers/pci/pci-driver.c:512
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 device_driver_attach+0xd1/0x220 drivers/base/dd.c:1203
 bind_store+0xf4/0x190 drivers/base/bus.c:267
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f534839e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc4dfb30e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f5348625fa0 RCX: 00007f534839e159
RDX: 000000000000000d RSI: 0000200000000800 RDI: 0000000000000007
RBP: 00007f534843503b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f5348625fac R14: 00007f5348625fa0 R15: 00007f5348625fa0
 </TASK>


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

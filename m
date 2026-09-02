Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBBD472092
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366813; cv=none; b=pA4TLy8nZ5Bn+Ti4ArrNA04k2LM2ufFO4BQ+OCV1vQOd5FNNm6k2NB/4CfQK611QHPdzU95niIwGjeC0m7r10r+/qDCZd9QIEAsSizsYX1Mfnzfef88Wrv2aa7PydyPpwXgNagoBIk1zu+0+JxAylGZ2yucsOAVHRB92Q7nYTEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366813; c=relaxed/simple;
	bh=MkkTiAfIa+S9u79RbxCV3aOQkSt/YQ+M7pZsqqSd4b4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=q8tkbG9Dm3e8+8h3ag0+g2FywKyUhhtZx201T0ixP1Sbh0NLFG5LMr9AHvMM/qNGGjswL4vwt7y7o69zDrLKBug0qtAoEgc5vPEJNwuUgATPozs+Gnb+YIAXUKIgadZP0PLofKmsiNdUeMC9gOboU5QmmWOBmDKBkELNPat42XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-448a12ddfb4so538182fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366811; x=1788971611;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YUicN5rnINFHNGdnOsZGp7jfpCrpIV80y457DhVxQPM=;
        b=BipRztcksOUC7UiKxz30j2aJSt7AZiOx+Y2CMdrn1Yb9uKZz7qk5DnuOCta/Zc/opA
         tHjZtaGYAxMZGNIz/NzgAqdevf4MUOLzM4uOjALWaZk/pqHxRzedhA4U20dpOh8Yf+Ce
         ho3S/GKkr+cOlaXTAAXV6ltjNPs+cCUaEm6r2e3KNBKbQZ7ek30GRU8NmsrKdEbpW7ti
         4PIJl4DF44AmZieay17EucarJBe9HU2+2HHm0KS44A/X7omPrFIjKS2Ob/GjTVQY0UvQ
         avKE3zMc9XN+zlO2fDVRmytuwjGZaOkMd1bisfcn4BaChLshzsukr+4IR1iGxCzp/OCi
         6e6g==
X-Forwarded-Encrypted: i=1; AHgh+RoR0UIb1Aqb7TEC+fi6XsfTOAG0t1KLgi428nwAs8tXu9wCjti3L4kP3hUt8YHYMwlQbIeN1VlbteRxp/k=@vger.kernel.org
X-Gm-Message-State: AFuF++k27IGMxbrheWxsTYJ96MENrf/O4fatS/cgesSPpcq1xUHxprq8
	Z96pdIT+Q8BM+MpobUOaz7dlwIIQTib5dZpJc/yn5i/+6wGw4sFNJLPyNyWn/2AnmrCd0hcBtWw
	RIvhvGx0a4PzoVYXtJRSU+lMT3l+yTKvOSA1xfbeEpibDUFZA6xF+z+7TyGk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1c9d:b0:6b1:7ee2:da31 with SMTP id
 006d021491bc7-6b47f51cb13mr3937048eaf.11.1788366810974; Wed, 02 Sep 2026
 09:33:30 -0700 (PDT)
Date: Wed, 02 Sep 2026 09:33:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a984fda.27a413cd.1e878c.000a.GAE@google.com>
Subject: [syzbot] [autofs?] memory leak in autofs_new_ino
From: syzbot <syzbot+df1db6e034b3953e19f5@syzkaller.appspotmail.com>
To: autofs@vger.kernel.org, linux-kernel@vger.kernel.org, raven@themaw.net, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8d3ae59288f1 Linux 7.2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1784b6c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=11ad91fcc8fa7933
dashboard link: https://syzkaller.appspot.com/bug?extid=df1db6e034b3953e19f5
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11dc9a25580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1670b949580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/735a458674ac/disk-8d3ae592.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fbf50adb0745/vmlinux-8d3ae592.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6effa5f7f690/bzImage-8d3ae592.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+df1db6e034b3953e19f5@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff8881146ebc00 (size 192):
  comm "syz.0.20", pid 5969, jiffies 4294943196
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 55e8e63e):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    autofs_new_ino+0x24/0x80 fs/autofs/inode.c:16
    autofs_fill_super+0x66/0x1d0 fs/autofs/inode.c:321
    vfs_get_super fs/super.c:1273 [inline]
    get_tree_nodev+0x91/0xf0 fs/super.c:1292
    autofs_get_tree+0xbc/0x120 fs/autofs/inode.c:378
    vfs_get_tree+0x30/0x120 fs/super.c:1700
    vfs_cmd_create+0x7d/0x120 fs/fsopen.c:231
    vfs_fsconfig_locked fs/fsopen.c:295 [inline]
    __do_sys_fsconfig+0x492/0x9e0 fs/fsopen.c:463
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
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

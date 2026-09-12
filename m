Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4279724DCF9
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789223910; cv=none; b=W2t4UMHfr+5KqS1jAtPvg2CR9TR3UIkn7zz/l32ol6gpbl4JQuC882Gj0LFUij0KvJCjwuyH9X8pMRC/ZAGm+cIHRLesnZ4vlevpr2tASMXqC2n2eq+XZR1vbE4kGTQGTqo7kmDBSrsvuDdfBbo+kgeyP/P+6sCg356Uj8hK0Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789223910; c=relaxed/simple;
	bh=VBThyPnoMQdNNS/uNu7l/ly+rs0fUH3fEK4cBJ7vDcA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=o3XSJRmGxNeamX/sdpXtLJS1RpjqS0lkD4TsAvU6HKjjoDQCkqVwoIid1MBwNLYRhRN+L1X3/E5k0ECynqehcYz5haTKSAFedvuGj5AqPrIzH3ZZLCW9fkndaiRjD4Hz6rLNW7eG9K/aWPmXiMo1Lti5nMjiBmQq5SaoQarozAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-8069d92e182so12220a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789223908; x=1789828708;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EQmoDvPX6OnCSV9Mz9rAJccsbd4S0WYqocLFtZY3KQ=;
        b=P4WowPq+hWT/Mu2NHKV0isCzIlA+OYkgTyIS23Y5218MLzQ9YPDwB3aiJM9ayZBiQn
         bMn4KwiGOFIC/Wh2rl9X6tcnO+9csEqziDwaG1lspZ/OofwHbTWS1FAisBkh8lhN+fX5
         rMTdYxqRb7sPp2k34GMqt/Qs44I7ItgUThK2mNM5/Fv5pOxkkmw11falW8WUzTpsWn95
         DkHXqhh6KcX9ccQEBW+5pf6bggnfrfseuWQgvLzkKJxlEomcfWZ28/D5LrNZitmA//HA
         3qHNqWDwYFBcle494wohl20m1ceD5h1k2XwIp8V93CAxjtjyZ58sXwARuO5KQi+p+6wR
         Jqew==
X-Forwarded-Encrypted: i=1; AKwUvBx1bTvs9ImVE/qR2vVICUUrU+EeCtsDA7qm4uOUytfGSQQ1Kw1w0FACKzJSBq0vz5CtGIVmHaswMLNVdE8=@vger.kernel.org
X-Gm-Message-State: AFuF++kStRQMnaB1QLYY9jinmOg062FbDI3VoE8u8hV4eed3LR8cqgCz
	Yiy8YaV9CPgSR/yRCSP0tLP3JPwiGUSUNycr5PNMTRjajXBr2dNjYxOlHhHaD53l63qQmP9cpTY
	EAdnYgZc7oTkAU1loD3jEbWirrtywVQlbo72jHtmp8f5TM4CuSF7QGV281gc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1f06:b0:6b7:46e9:96f4 with SMTP id
 006d021491bc7-6c24e671e92mr1523372eaf.36.1789223908039; Sat, 12 Sep 2026
 07:38:28 -0700 (PDT)
Date: Sat, 12 Sep 2026 07:38:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa563e4.f2639fcc.29487d.0041.GAE@google.com>
Subject: [syzbot] [exfat?] KCSAN: data-race in fat12_ent_put / fat_mirror_bhs (2)
From: syzbot <syzbot+ff8bd63dc02136db5a1a@syzkaller.appspotmail.com>
To: hirofumi@mail.parknet.co.jp, linkinjeon@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sj1557.seo@samsung.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3026c6e4f223 Merge tag 'slab-for-7.3-rc2' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=117769f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e3dbeec937af205c
dashboard link: https://syzkaller.appspot.com/bug?extid=ff8bd63dc02136db5a1a
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/31e48aab7540/disk-3026c6e4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4e31dbebfbd9/vmlinux-3026c6e4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/cf95aa277f9d/bzImage-3026c6e4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ff8bd63dc02136db5a1a@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in fat12_ent_put / fat_mirror_bhs

read-write to 0xffff88810c2e3f2a of 1 bytes by task 8373 on cpu 0:
 fat12_ent_put+0xc4/0x180 fs/fat/fatent.c:165
 fat_ent_write+0x6c/0xe0 fs/fat/fatent.c:422
 fat_chain_add+0x170/0x4c0 fs/fat/misc.c:138
 fat_add_cluster fs/fat/inode.c:113 [inline]
 __fat_get_block fs/fat/inode.c:155 [inline]
 fat_get_block+0x468/0x5e0 fs/fat/inode.c:190
 __block_write_begin_int+0x400/0xf90 fs/buffer.c:2030
 block_write_begin fs/buffer.c:2144 [inline]
 cont_write_begin+0x5bf/0x920 fs/buffer.c:2506
 fat_write_begin+0x52/0xe0 fs/fat/inode.c:230
 generic_perform_write+0x186/0x490 mm/filemap.c:4374
 __generic_file_write_iter+0x9e/0x120 mm/filemap.c:4491
 generic_file_write_iter+0x77/0x1f0 mm/filemap.c:4517
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x57f/0x9a0 fs/read_write.c:687
 ksys_write+0xdc/0x1a0 fs/read_write.c:739
 __do_sys_write fs/read_write.c:750 [inline]
 __se_sys_write fs/read_write.c:747 [inline]
 __x64_sys_write+0x40/0x50 fs/read_write.c:747
 x64_sys_call+0x154e/0x2550 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff88810c2e3e00 of 512 bytes by task 8427 on cpu 1:
 fat_mirror_bhs+0x1df/0x330 fs/fat/fatent.c:399
 fat_ent_write+0xd0/0xe0 fs/fat/fatent.c:428
 fat_chain_add+0x170/0x4c0 fs/fat/misc.c:138
 fat_add_cluster fs/fat/inode.c:113 [inline]
 __fat_get_block fs/fat/inode.c:155 [inline]
 fat_get_block+0x468/0x5e0 fs/fat/inode.c:190
 __block_write_begin_int+0x400/0xf90 fs/buffer.c:2030
 block_write_begin fs/buffer.c:2144 [inline]
 cont_write_begin+0x5bf/0x920 fs/buffer.c:2506
 fat_write_begin+0x52/0xe0 fs/fat/inode.c:230
 generic_perform_write+0x186/0x490 mm/filemap.c:4374
 __generic_file_write_iter+0x9e/0x120 mm/filemap.c:4491
 generic_file_write_iter+0x77/0x1f0 mm/filemap.c:4517
 __kernel_write_iter+0x30f/0x590 fs/read_write.c:621
 dump_emit_page fs/coredump.c:1293 [inline]
 dump_user_range+0xa73/0xd00 fs/coredump.c:1367
 elf_core_dump+0x21c0/0x2340 fs/binfmt_elf.c:2106
 coredump_write+0xafb/0xdd0 fs/coredump.c:1047
 do_coredump fs/coredump.c:1126 [inline]
 vfs_coredump+0x2762/0x3270 fs/coredump.c:1195
 get_signal+0xd33/0xf10 kernel/signal.c:3036
 arch_do_signal_or_restart+0x96/0x480 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:101 [inline]
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 irqentry_exit_to_user_mode_prepare include/linux/irq-entry-common.h:244 [inline]
 irqentry_exit_to_user_mode include/linux/irq-entry-common.h:315 [inline]
 irqentry_exit+0x14d/0x610 kernel/entry/common.c:165
 exc_general_protection+0x155/0x1e0 arch/x86/kernel/traps.c:914
 asm_exc_general_protection+0x26/0x30 arch/x86/include/asm/idtentry.h:589

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 8427 Comm: syz.4.1138 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
==================================================================


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

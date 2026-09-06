Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D3D4457DF
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788696641; cv=none; b=TBRc1RJKa/3/uRZ0Q5rtLy042pXHAyfshKjizr8rMg1R0bUsv1MEdA0LT47SRQQQKtDpB8WpxIJ+mdJIJ4swQyHObo7Y/Ebz0omzUvbl8hzHd6cmr48Loq9PQLQKMzsQUw6+jmYDIKajbMn25AOWK5BVDN1gc2U9HvmGD/wKSH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788696641; c=relaxed/simple;
	bh=WSFuu1wO23mOY7Kd6XQxaMguZSPpHIH3cepiihSt4Kw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=oJk7lkCSjaXRPuhGHpqrnCwl5fGbAdN5gXGh0dclB+XTylO8XjiGgXunPFC+ulSwywc6AWeDYW6Y2WfD4aM6we7ZaV02V5FSpbsWHYJ5Cs6lxXyehCMFx8jwSycO4I6uYyfgWSEqUbuWARqQI8E9TIrhOluzZ8JWrTwIGfQJDFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f7.google.com with SMTP id 006d021491bc7-6b1bebb3ae8so787641eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 05:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788696630; x=1789301430;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uodVNUfbRag88I5mELNLKqMsw2oq6XnMsWbte6N9A3A=;
        b=rMsduruV6avj6eDz4ABSn7RdxUok9MXXD51nFf50SCQOzm2XxCsoUNrjrwsdGQKXYe
         ozR07RHCes3X4ZWBhWz2A9DaC5wYrYq4pGEx0YvOVDGWmo0QxPpmb5yFD/LFan6QlZEx
         KH2/EKhZ460Q5BZxT+L2nGtGz5jLpyZkj6Dn+lbStX9c5qF4Cb2YSA/8XjMHqCvLVKi/
         UQ3S71+XqGgc6oORcrLBhSD/U5H5KMvb9hYoknHUSFKL3d/97dcgzZ5XzXgdmW2rUaww
         jRtypuvHoytyTm3ww6uQkp1y6FGx8/d8TTtwgua/KeDnBKTp/S0nsa2OZLqgDap1emy3
         KJZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXFbiAmFsFo1hylogLhWcWNBstBKbEnHBBK6J3+jH3bMt6X6XpjVs9NSwGq1ba+Q++jdKGRxT0lj28sms=@vger.kernel.org
X-Gm-Message-State: AFuF++m/pRc97I/TCNqMQgL4M6sKAwB0rQVgJ2dDPAxqcDslw6rGkc5Z
	1fvWq9eFQUIfDiNlpBNfp9Fw1252/rVmcw9hgTxkJJ2WI6j7TN2EUFk1TGf097uve7vK9UwGAfq
	Mf9NdCJ07xjm/0DnXo+91g1c0dQabHsjFeSQiy9vmWsUAXHF6VShS5TOjN0A=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:6ae7:b0:6b6:71f7:ecbe with SMTP id
 006d021491bc7-6b6fdfb58dfmr16537320eaf.18.1788696630381; Sun, 06 Sep 2026
 05:10:30 -0700 (PDT)
Date: Sun, 06 Sep 2026 05:10:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9d5836.a5e650b3.26d8a.001a.GAE@google.com>
Subject: [syzbot] [jffs2?] kernel BUG in jffs2_sum_write_sumnode (2)
From: syzbot <syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    89a312991dc6 Merge tag 'cifs-fixes-7.3-rc2' of https://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10266f79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=19560cab9a915237
dashboard link: https://syzkaller.appspot.com/bug?extid=0727f46a0571de01bf93
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8722ccd64272/disk-89a31299.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bb121ca607c4/vmlinux-89a31299.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7e8f64808c5e/bzImage-89a31299.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com

jffs2: warning: (10801) jffs2_sum_write_sumnode: Empty summary info!!!
------------[ cut here ]------------
------------[ cut here ]------------
kernel BUG at fs/jffs2/summary.c:868!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 10801 Comm: syz.9.661 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
RIP: 0010:jffs2_sum_write_sumnode.cold+0x4e/0x174 fs/jffs2/summary.c:868
Code: 0f b6 04 02 84 c0 74 08 3c 03 0f 8e 2c 01 00 00 8b b3 40 06 00 00 48 c7 c2 00 76 33 8c 48 c7 c7 00 72 33 8c e8 cd 73 f8 ff 90 <0f> 0b e8 45 f9 e1 00 65 4c 8b 3d 65 1a 62 13 b8 ff ff 37 00 48 c1
RSP: 0018:ffffc90003a56d90 EFLAGS: 00010282
RAX: 0000000000000046 RBX: ffff8880375f8000 RCX: 0000000000000000
RDX: 0000000000000046 RSI: ffffffff81e9c5d9 RDI: fffff5200074ada3
RBP: ffffc90003a56f10 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000000 R11: 0000000000000001 R12: ffff88807e062a00
R13: 0000000000000000 R14: 0000000000000f40 R15: 0000000000000000
FS:  00007f34bbf8d6c0(0000) GS:ffff888123b61000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000557616249078 CR3: 0000000074bae000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 jffs2_do_reserve_space+0xb94/0xf70 fs/jffs2/nodemgmt.c:392
 jffs2_reserve_space_gc+0x6b/0xf0 fs/jffs2/nodemgmt.c:226
 jffs2_garbage_collect_pristine+0x103/0x870 fs/jffs2/gc.c:613
 jffs2_garbage_collect_live+0x1471/0x36b0 fs/jffs2/gc.c:546
 jffs2_garbage_collect_pass+0xb28/0x1b40 fs/jffs2/gc.c:464
 jffs2_reserve_space+0x489/0xbb0 fs/jffs2/nodemgmt.c:171
 jffs2_write_inode_range+0x275/0xb80 fs/jffs2/write.c:362
 jffs2_write_end+0x72c/0xea0 fs/jffs2/file.c:299
 generic_perform_write+0x513/0xa40 mm/filemap.c:4395
 __generic_file_write_iter+0x1f7/0x240 mm/filemap.c:4491
 generic_file_write_iter+0xe1/0x390 mm/filemap.c:4517
 iter_file_splice_write+0x830/0x10b0 fs/splice.c:736
 do_splice_from fs/splice.c:936 [inline]
 direct_splice_actor+0x192/0x690 fs/splice.c:1159
 splice_direct_to_actor+0x345/0xa30 fs/splice.c:1103
 do_splice_direct_actor fs/splice.c:1202 [inline]
 do_splice_direct+0x174/0x240 fs/splice.c:1228
 do_sendfile+0xadc/0xe20 fs/read_write.c:1371
 __do_sys_sendfile64 fs/read_write.c:1432 [inline]
 __se_sys_sendfile64 fs/read_write.c:1418 [inline]
 __x64_sys_sendfile64+0x1d8/0x220 fs/read_write.c:1418
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f34bb19e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f34bbf8d028 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007f34bb426090 RCX: 00007f34bb19e159
RDX: 0000000000000000 RSI: 0000000000000008 RDI: 0000000000000009
RBP: 00007f34bb235024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000020000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f34bb426128 R14: 00007f34bb426090 R15: 00007ffc4299d258
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:jffs2_sum_write_sumnode.cold+0x4e/0x174 fs/jffs2/summary.c:868
Code: 0f b6 04 02 84 c0 74 08 3c 03 0f 8e 2c 01 00 00 8b b3 40 06 00 00 48 c7 c2 00 76 33 8c 48 c7 c7 00 72 33 8c e8 cd 73 f8 ff 90 <0f> 0b e8 45 f9 e1 00 65 4c 8b 3d 65 1a 62 13 b8 ff ff 37 00 48 c1
RSP: 0018:ffffc90003a56d90 EFLAGS: 00010282
RAX: 0000000000000046 RBX: ffff8880375f8000 RCX: 0000000000000000
RDX: 0000000000000046 RSI: ffffffff81e9c5d9 RDI: fffff5200074ada3
RBP: ffffc90003a56f10 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000000 R11: 0000000000000001 R12: ffff88807e062a00
R13: 0000000000000000 R14: 0000000000000f40 R15: 0000000000000000
FS:  00007f34bbf8d6c0(0000) GS:ffff888123c61000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe398fd0000 CR3: 0000000074bae000 CR4: 0000000000350ef0


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

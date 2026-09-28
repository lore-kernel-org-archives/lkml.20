Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16836497391
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590119; cv=none; b=VkPeZ3lLKHIzJMzBIH54Bi6vamQv9AfYyg2XxHgk1T4Xk5UcW1FYhnQ7fG96c7fhtSAPkhOQ6Td1GiRXWHkNneqiAkcOc1JAaJH/PVzLeyPlFX/F/eAhP/DmdZDmKY/jlaITt7Y7Ia8ntsS+rdO6kGSq+CbMG0UuQVJSPBnKy6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590119; c=relaxed/simple;
	bh=JDki/ynWyR4JJkD6CujtT4H4k22sWsPQ5W9eLuS5fSM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ebIZvNWQXlk7FEuGRaFfUNk+5LmA6LAa5MUy9/Eppix85kZHHm02tPTYiLbdpCh0sVR6S+QHx6fx4UJcUxZsIHau72+KqDc3kdJPAnjjSBR2XJJ0faTsSDnMt6bZhZrDYunwlbed57ANS3Xy6WluBtPYYTIY/oKS/P/bpokhNc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4959c49e054so3058514b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790590117; x=1791194917;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPId6bWi2Ez3+4T15azCBAg0q+TU06lXWj8UJZ9JFa8=;
        b=B3lv3gkLoRqm6UEUrS3VwxGhkOTYnoLJEENmQgelAVcmMkjS56y4iZ/M2z/5deYPql
         snnALZ2mzG1bqH2YftImJNmiFg52clcle90OHISJEIljfRdLUh76WiIjG+TGSl4H+l3s
         ucTyHHz2GH05dMbuZrAw3U/YSOB6fEUSdSoLcEj24AJzZFCI7UDj05qODijR8r9+3RsK
         sRmJkRihR+tpnc86sFe84gQpr0ZMBLFyzuCBe4BgCYrjELC/bl7oXOsERva2ToJ1dKKZ
         nxM+AILaLYTLIoUW0OpcUgUqV5ktBowAJvYzN0O8YWeqAKQ3Cn0SRnxRDwj80kApKR87
         Lc9w==
X-Forwarded-Encrypted: i=1; AKwUvBwi9UEtgL8bcCfXdJ7vsfD1n0ZcXbAsIF8nDbVaHYRNmcnk8Up4bsehslNOsSTsNEaGjR/imZ4crXiadbY=@vger.kernel.org
X-Gm-Message-State: AFuF++lgaxxo8eEkG+dOuhE/UvN5nWdMOzmXpChWWhX1AOE2BtnU2oej
	Vuylds/uqSUxPaLxwSPtj6SfVUETJIUOqB5JwgVHkNoijkvqhMIJ6Qm3IbfOSwdlNE7t2Xy0/jR
	FF9J3XSP0LUcgGgE+Y/EiCZv1hb26pQk7btBnCfB9+J+j+nV8E0FtlMPQY5Q=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:17a1:b0:4e6:76eb:b997 with SMTP id
 5614622812f47-4e676ebbb9amr5945570b6e.62.1790590116910; Mon, 28 Sep 2026
 03:08:36 -0700 (PDT)
Date: Mon, 28 Sep 2026 03:08:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aba3ca4.80e1c6cc.1e8e5f.0070.GAE@google.com>
Subject: [syzbot] [udf?] WARNING in udf_prealloc_blocks (3)
From: syzbot <syzbot+bd60ece8a4d1116e2c04@syzkaller.appspotmail.com>
To: jack@suse.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    62f4c998b297 Merge tag 'parisc-for-7.3-rc5' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13b68205580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2b924f079099ba6e
dashboard link: https://syzkaller.appspot.com/bug?extid=bd60ece8a4d1116e2c04
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-62f4c998.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1f7cc8cb8766/vmlinux-62f4c998.xz
kernel image: https://storage.googleapis.com/syzbot-assets/efe99eedd372/bzImage-62f4c998.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bd60ece8a4d1116e2c04@syzkaller.appspotmail.com

oom_control is deprecated and will be removed. Please report your usecase to linux-mm@kvack.org if you depend on this functionality.
loop0: detected capacity change from 0 to 2048
UDF-fs: INFO Mounting volume 'LinuxUDF', timestamp 2022/11/22 14:59 (1000)
------------[ cut here ]------------
!buffer_uptodate(bh)
WARNING: fs/buffer.c:991 at mark_buffer_dirty+0x299/0x410 fs/buffer.c:991, CPU#0: syz.0.0/5321
Modules linked in:
CPU: 0 UID: 0 PID: 5321 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:mark_buffer_dirty+0x299/0x410 fs/buffer.c:991
Code: 4c 89 f7 e8 29 01 d8 ff 49 8b 3e be 40 00 00 00 5b 41 5c 41 5e 41 5f 5d e9 74 52 fb ff e8 6f 59 66 ff eb 8c e8 68 59 66 ff 90 <0f> 0b 90 e9 a5 fd ff ff e8 5a 59 66 ff 90 0f 0b 90 e9 cf fd ff ff
RSP: 0018:ffffc9000e30f170 EFLAGS: 00010287
RAX: ffffffff826193a8 RBX: ffff888043e0e620 RCX: 0000000000100000
RDX: ffffc9000eb82000 RSI: 000000000003b662 RDI: 000000000003b663
RBP: ffffc9000e30f301 R08: ffff888043e0e627 R09: 1ffff110087c1cc4
R10: dffffc0000000000 R11: ffffed10087c1cc5 R12: 0000000000000008
R13: 000000000000016a R14: 0000000000000000 R15: dffffc0000000000
FS:  00007fde834a96c0(0000) GS:ffff88808c2c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fde83467980 CR3: 0000000012ff6000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 udf_bitmap_prealloc_blocks fs/udf/balloc.c:214 [inline]
 udf_prealloc_blocks+0x575/0x11b0 fs/udf/balloc.c:705
 udf_prealloc_extents fs/udf/inode.c:1064 [inline]
 inode_getblk fs/udf/inode.c:925 [inline]
 udf_map_block+0x1ed6/0x4270 fs/udf/inode.c:392
 __udf_get_block+0x52/0x250 fs/udf/inode.c:476
 __block_write_begin_int+0x6c2/0x1900 fs/buffer.c:2030
 block_write_begin+0x8d/0x120 fs/buffer.c:2144
 udf_write_begin+0x118/0x270 fs/udf/inode.c:259
 generic_perform_write+0x2d5/0x8f0 mm/filemap.c:4374
 udf_file_write_iter+0x2e8/0x6c0 fs/udf/file.c:112
 do_iter_readv_writev+0x612/0x8c0 fs/read_write.c:-1
 vfs_writev+0x343/0x990 fs/read_write.c:1058
 do_pwritev fs/read_write.c:1154 [inline]
 __do_sys_pwritev2 fs/read_write.c:1212 [inline]
 __se_sys_pwritev2+0x177/0x2a0 fs/read_write.c:1203
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fde8259e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fde834a8fe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000148
RAX: ffffffffffffffda RBX: 00007fde82825fa0 RCX: 00007fde8259e159
RDX: 0000000000000001 RSI: 0000200000000100 RDI: 000000000000000d
RBP: 00007fde8263506b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000005412 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fde82826038 R14: 00007fde82825fa0 R15: 00007fff9cce3ed8
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

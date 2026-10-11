Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F198C1F94F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791739960; cv=none; b=X+1KF+jX/fmVYDOBxCKbH+tNBTa8bxGt0XCGInRzcZdQEVvbJNCwbcOxbhpPbIqzIiH5GwK8mT/wj5tbliQDI9GScVl4d9gjPjiY5tGcpySpkQ74sKJee8yvZsU5J57VFw5W83akOTwsy6bPu3THIhtpG971XSmXTPUplsTgos4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791739960; c=relaxed/simple;
	bh=a0Q5gKd45HAxng1wxw0xu146vxANbRajAU1djMDLDhw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=OGrzfLUpbTtLyVm9Pm7ipMmXpk60wMYTULN5qk6viDw20VsAdcq68O1LgT8vXJ2OJh1lhC1i0kgC9fBdq2INJ7xc4uY6kM3UONJUBO6sGC1DyGUzJ2FaF/r1WUGZJ/kMhwhlgbGPT4Tm4BHYP5RqKSe/aHs62TPJU1/9V8dIv+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-816cd7b7838so1947381a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791739958; x=1792344758;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0o4MtJdz+i7038O/zO8/MdLCh4dr9Ow4hnPcKqRLHE=;
        b=RKl1G5LiAY3vDPi+C1VdbEQmStlkd/BBT6rE/BcD4ZHS39zyPuNEPqWePlO3xb+2mt
         CNVFXAhjkZ0JE6kVbhi8rQEb0TDl6SxlPpE5PolScTWB6k99I+7a06OK0kf7XghqPWKI
         5u8Hz2ZJKRfCeaxc+ytbOSskTBIy7ZzOqAYKBEHQlSYhjfzxK9EzV+jEiwj6OgDFkpMx
         hIPM7SXPVKUfXNPaW3eRaeemQbjem5R50tK3GWAb+9kIxtI1BKuekt5QQaKGRR02ZzMa
         yV/eBYvESPlAUleCx26WGj0WMhaIvLkqnTCc9dMCaUvCgSzTXuRAZ5CwdlICp/NRn16Q
         FNnw==
X-Forwarded-Encrypted: i=1; AKwUvByW2cSjWV7CSSh00bVWy6slYizWHgj2e+VT40P0rbDzGV3Lh6PS4IpKkMSbc5B3pHNH2bBLhXbs7SL+ts8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY48m8o7s1gou9Rt0nm3T00gcCVZiY/ECcCoTNp+RkppN6yXKm
	YFv/VTwmqVfttKbHwUUeofvUsfJP+CcCUuB6csJ7Eaf5Tz3iDpfCTfUaltjQyeM/6rVlNBUvPek
	VVaPzI0/10opD+Xi2HqhVYbQLQ2KeaHlDhHNZOgpd9pLj18DhnAaxTrV3UNE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b97:b0:4f3:e98f:fa0b with SMTP id
 5614622812f47-50c556bc9d7mr7201373b6e.5.1791739957943; Sun, 11 Oct 2026
 10:32:37 -0700 (PDT)
Date: Sun, 11 Oct 2026 10:32:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acbc835.a150a118.27e199.003c.GAE@google.com>
Subject: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
From: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
To: hch@lst.de, justin.tee@broadcom.com, kch@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	nareshgottumukkala83@gmail.com, paul.ely@broadcom.com, sagi@grimberg.me, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a5ebb76233b7 Merge tag 'edac_urgent_for_v7.3_rc7' of git:/..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1494923e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df4bbab1c2172b9f
dashboard link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=126a0f15580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=166a0f15580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d24cfbd75fba/disk-a5ebb762.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d0874c703893/vmlinux-a5ebb762.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2a424fa32a7b/bzImage-a5ebb762.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com

nvmet_tcp: enabling port 1 (127.0.0.1:4420)
 non-slab/vmalloc memory
list_del corruption. prev->next should be ffff88802af3b020, but was 0000000000000000. (prev=ffffffff9aecd340)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:64!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 5680 Comm: syz-executor403 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:__list_del_entry_valid_or_report+0x15a/0x190 lib/list_debug.c:62
Code: e8 ab ea 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 6c b1 58 fd 49 8b 17 48 c7 c7 40 71 cc 8b 48 89 de 4c 89 f9 e8 a7 7a 4c fc 90 <0f> 0b 4c 89 f7 e8 7c ea 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 3d
RSP: 0018:ffffc90004cdfc30 EFLAGS: 00010246
RAX: 000000000000006d RBX: ffff88802af3b020 RCX: 7d3c36a647dfae00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000201 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed101708490b R12: 1ffffffff35d9a68
R13: dffffc0000000000 R14: ffffffff85f7f740 R15: ffffffff9aecd340
FS:  0000555594721400(0000) GS:ffff8881249bb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555594721340 CR3: 0000000038dd8000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __list_del_entry_valid include/linux/list.h:140 [inline]
 __list_del_entry include/linux/list.h:261 [inline]
 list_del include/linux/list.h:275 [inline]
 nvmet_fc_portentry_unbind drivers/nvme/target/fc.c:1281 [inline]
 nvmet_fc_remove_port+0x16b/0x320 drivers/nvme/target/fc.c:2927
 nvmet_disable_port+0x13e/0x1f0 drivers/nvme/target/core.c:400
 nvmet_port_subsys_drop_link+0x1e8/0x210 drivers/nvme/target/configfs.c:1123
 configfs_unlink+0x44f/0x6b0 fs/configfs/symlink.c:258
 vfs_unlink+0x27b/0x6e0 fs/namei.c:5678
 filename_unlinkat+0x3d3/0x610 fs/namei.c:5748
 __do_sys_unlinkat fs/namei.c:5777 [inline]
 __se_sys_unlinkat+0x83/0x1a0 fs/namei.c:5769
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0ad400d8b9
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe650d4178 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 0000200000000780 RCX: 00007f0ad400d8b9
RDX: 0000000000000000 RSI: 0000200000000780 RDI: 00000000ffffff9c
RBP: 00000000000f4240 R08: 0000000000000009 R09: 0000000000000009
R10: 0000000000000009 R11: 0000000000000246 R12: 0000000000014e22
R13: 00007ffe650d418c R14: 00007ffe650d41a0 R15: 00007ffe650d4190
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x15a/0x190 lib/list_debug.c:62
Code: e8 ab ea 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 6c b1 58 fd 49 8b 17 48 c7 c7 40 71 cc 8b 48 89 de 4c 89 f9 e8 a7 7a 4c fc 90 <0f> 0b 4c 89 f7 e8 7c ea 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 3d
RSP: 0018:ffffc90004cdfc30 EFLAGS: 00010246
RAX: 000000000000006d RBX: ffff88802af3b020 RCX: 7d3c36a647dfae00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000201 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed101708490b R12: 1ffffffff35d9a68
R13: dffffc0000000000 R14: ffffffff85f7f740 R15: ffffffff9aecd340
FS:  0000555594721400(0000) GS:ffff8881249bb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555594721340 CR3: 0000000038dd8000 CR4: 00000000003526f0


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

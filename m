Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDD02D9ECA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152631; cv=none; b=PlCPteBW1z552GXlcrs1t7S2s6m38liBRDxNiLR11J3z0tXnaDxsMXabHwDgfEwDAmSZkrGrzdq03APLngKT87agCcjSn5BQF0H749nSAioeujryyw4zBPRzISYofj31+d3J5om2QVAYPT7cvhotMQ2p9ZvlOZ7lKTwZmqck6Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152631; c=relaxed/simple;
	bh=ifyuhnVxWjc6HgDBzmahzBMo+pvxhdjnQ+EzmcmAT7c=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BEMkzuBJXBnM0P6GMA952rlqDLhgQElDD2UuYciIe2KqU9M2Z7ke6LywVPOXGn1SbemJfIkKdHmu3XxkHuW7DI1jTDDDyWYCOtP3lHlI5+GaYfhDJwzvFKSqphPOuyjIWyXsqgQ1h9wpbgh8Js51FgTIXbH8vdnqEu9tlaDBiZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-82315dbce25so4504473a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792152629; x=1792757429;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jkkYesDBen/rYXjtPWsjU+QZRef01zmLNH+fPT/sgw=;
        b=Viiw+BHwm4jJRLrSBG5bDo9lXAWrS537eAUKgVmqtCRdWRAFA4oOeP1FEiTA3ZAwlK
         FnDwlKCNGko+Sxg3eN3S2LJ57Z4l9GouwZnWm2ILrq62zB4Id9Et0w8fFzPrcNuJ48n0
         A/TxSdzOTL5Oid2V0f1aYRTlNZbK4zcn41+Uw4PiSA43887wUofybB1ov9JsvkGrRl4n
         fmur62G0Ui6uWsexAVMVeFOZX7DytK5Gppi6UwqQIuQb/Y6kokVV+kOGTcglueFN5mnj
         bD7h3dSXZyAIK3VvgZAt9FNDmhu+MTlKDuY9MIbnpF4I6uNrD6bCE4HyzlSpcNUs2eC7
         P40g==
X-Forwarded-Encrypted: i=1; AKwUvByFh1nMmay3EvSk7Wa2a6JjqHd77SID+Bt3ZYsSO1hs9EqcutQ9cFXD1oMPI3Ic6R5x9DW70TFonVjDbc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKq5XovwEskw8BbbpbFkuLRPvpYzRmZS7ap0qckFx4zbD8HGcrC
	L3MUFL61lq2W0lomHb05g77MhSr0pVI1t01vtK7beUezV+QwMXH8gpQcRfvw//ZQHNB5u7rJVWB
	eF9Fxro+eBCnKa1H1u7VkDc2y9FSSgi44HYjaLW1Ghylr6IXX10gtF4UDQbc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f0a:b0:4f1:6ab6:8fc0 with SMTP id
 5614622812f47-50c4e681490mr26095731b6e.15.1792152629228; Fri, 16 Oct 2026
 05:10:29 -0700 (PDT)
Date: Fri, 16 Oct 2026 05:10:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad21435.7514cce4.1ece07.0150.GAE@google.com>
Subject: [syzbot] [nvme?] WARNING in nvmet_fc_portentry_rebind_tgt
From: syzbot <syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com>
To: hch@lst.de, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	sagi@grimberg.me, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4056b3c9d3c9 Merge tag 'nios2_update_for_v7.4' of git://gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14108235580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=be62d4b375542ecebd17
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16108235580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com

------------[ cut here ]------------
pe->tgtport
WARNING: drivers/nvme/target/fc.c:1327 at nvmet_fc_portentry_rebind_tgt+0x1d7/0x1e0 drivers/nvme/target/fc.c:1327, CPU#1: syz-executor148/5937
Modules linked in:
CPU: 1 UID: 0 PID: 5937 Comm: syz-executor148 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
RIP: 0010:nvmet_fc_portentry_rebind_tgt+0x1d7/0x1e0 drivers/nvme/target/fc.c:1327
Code: 6d 3d fc 48 8b 04 24 49 89 06 48 c7 c7 20 0f c8 8f 48 83 c4 18 5b 41 5c 41 5d 41 5e 41 5f 5d e9 3f ab 66 05 e8 ba a7 d0 fb 90 <0f> 0b 90 eb a6 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc9000155fa78 EFLAGS: 00010293
RAX: ffffffff85f63196 RBX: dffffc0000000000 RCX: ffff888032880000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff520002abf40 R12: 1ffff1100741b8d0
R13: 0000000000000001 R14: ffff88803a0dc680 R15: ffff888012526800
FS:  00007f3c0db506c0(0000) GS:ffff888124abb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3c0db4fff8 CR3: 0000000042756000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 nvmet_fc_register_targetport+0x75a/0x950 drivers/nvme/target/fc.c:1417
 fcloop_create_target_port+0x135/0x4d0 drivers/nvme/target/fcloop.c:1558
 kernfs_fop_write_iter+0x3a5/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3c0e3ae35e
Code: 08 0f 85 f5 e2 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007f3c0db50118 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f3c0db506c0 RCX: 00007f3c0e3ae35e
RDX: 000000000000002f RSI: 00007f3c0e427b40 RDI: 0000000000000004
RBP: 00007f3c0e427b40 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: ffffffffffffffd0
R13: 0000000000000010 R14: 00007ffdb343b7d0 R15: 00007ffdb343b8b8
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

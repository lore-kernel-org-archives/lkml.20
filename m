Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950269;
	b=PqPZmbcd5u+RXibtkUNDkYdNmyd6b+6YwWqDxkvWQ/bwvPciKo4n998PqoL3VZ+efsyD
	 bgC/g+CTk3Cic3Nz9vRv4U1tsKljZ5/CURpKJjM5URL3yD+hJ4ONZa4vh2gIlhlX2IM70
	 TzgZUQFEF/ygvN08w8f49oV1Mz5ptp7ndkmZZG8/XmfYUiQ4FWcb8tBaC7xoQ2t6GcPYu
	 IgZzx+FSIH93X6I8XdHZFjF10L5zf5gWa2nIvC7YR0EMDYoqrVkkhVLFFiNl9E7wPumEB
	 GIiovarQJ2eJKg+SGLT3i5/Hp6B4h4WU+ke4Mvai+SrTUmCyCWk/H0dNF7RRpF9ypTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950269;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=41JTU2iXYY6hErMoiip7e3g8p0cKAJFsLztbsNUkYAM=;
	b=OaUlLs1Iwhryq2VlwfMtgpW3KT3nhY61VzDB7XWFixbqeL3OCcKFRTtRv65OmV9Pl1IE
	 i8V+yrtz7H2KqzgEO0/GCst2y2gPZbRqtp7J4yPwIyKbUNYzj68Y7aO15H5ONn6AEzgw0
	 MDlAd6v/pXxqXcU82mX76kQiHp2f5TZyCW207tEBCk2fFEVJeDzuTvSFzsVtQFgdTROKu
	 dRF9TIK6folqLAyCiwuMHcglct23GRPhm6ZX+tMDuW6CHu5Ws2X+nkFeIZp72WuiJtia6
	 oIn7veNgbiiqAeDW5MG1HwnbfsmYgHqXMB/O/sCwkf4xkVgXcDweWV3qXlLL5B/zF0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFB4606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFFB4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8452af97d8aso3717097a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950268; x=1793555068;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41JTU2iXYY6hErMoiip7e3g8p0cKAJFsLztbsNUkYAM=;
        b=oLo8+w5L5efK4GS3L/l8AquV3a4VhNcDXq0VmU7d8FvpDv73L2zDG+Spk0CnHKHlW2
         4u0BjIjl0Xid6mB8mLsPor0BZP1fhdUVtcsDj92DYZLNQgZwG+wf6kMGW+bb8sohbBki
         tK+EouijRpL4vSXL6k5i/FoDfiz1/GEHWMJBTI9jYZjFA3CnuQmBu1odt9VlnmsjZiAp
         vfPSDLWqyi1P5EbWGkF9jKd4YFyqeAlH3EEcgap1pV6dm6BqSs+K5Zg/zLhXck9MC1o4
         o8ogyhXZ5U/4+or0MTVIs7hZSt+uZ9zEzfIakQenzHzBYQn3MnrK7DpRzyFxyzFkVFoq
         KmLw==
X-Forwarded-Encrypted: i=1; AKwUvBz0S+NZp1AfxJa++DzHnnEzQwgyZ9w39pXLcyveqTpO7am3KwZbVQAnkybcdlb019ZSCdziqv2/AfGX6To=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxMTKJpk9gOJ/qANsTkqydVMVdH973M7I0iWMiYAO+Bm8gIJjq
	SPD6fkOuwevFSKnO/XXoAYplhGZmeBmTN1d4+Rvb7nQSp+afzkw387TJKL2rUpbiAsxq+65l9un
	8E9NZtdfQ6FpOQCJb1+84PIGqmfy8/1FeRD/nmMaAfIniBbxzE2TyEPnSBHc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bc8:b0:4b9:e65b:8c33 with SMTP id
 5614622812f47-55c00301e4dmr3062198b6e.33.1792950267882; Sun, 25 Oct 2026
 10:44:27 -0700 (PDT)
Date: Sun, 25 Oct 2026 10:44:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ade3ffb.8652420f.2f2d6f.0468.GAE@google.com>
Subject: [syzbot] [dm?] INFO: trying to register non-static key in __percpu_counter_sum
From: syzbot <syzbot+4b232570d625662eaab4@syzkaller.appspotmail.com>
To: agk@redhat.com, bmarzins@redhat.com, dm-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, mpatocka@redhat.com, snitzer@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    20a33c6b6cbe Add linux-next specific files for 20261023
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14800131580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b72dfd5e7ab2b781
dashboard link: https://syzkaller.appspot.com/bug?extid=4b232570d625662eaab4
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/cfbd1ccc6546/disk-20a33c6b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c36184d6a775/vmlinux-20a33c6b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/48b7e871397c/bzImage-20a33c6b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4b232570d625662eaab4@syzkaller.appspotmail.com

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 1 UID: 0 PID: 22591 Comm: syz.5.4175 Tainted: G             L     Y syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP, [Y]=FORCED_BIND
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 assign_lock_key+0x133/0x150 kernel/locking/lockdep.c:1028
 register_lock_class+0xcc/0x2e0 kernel/locking/lockdep.c:1343
 __lock_acquire+0x10c/0x2de0 kernel/locking/lockdep.c:5162
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:155 [inline]
 _raw_spin_lock_irqsave+0x40/0x60 kernel/locking/spinlock.c:181
 __percpu_counter_sum+0x2c/0x1f0 lib/percpu_counter.c:177
 percpu_counter_sum include/linux/percpu_counter.h:105 [inline]
 crypt_dtr+0x18c/0x450 drivers/md/dm-crypt.c:2742
 crypt_ctr+0x1720/0x3c20 drivers/md/dm-crypt.c:3438
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
RIP: 0033:0x7f69e6b9f559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f69e79d8028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f69e6e26090 RCX: 00007f69e6b9f559
RDX: 0000200000000840 RSI: 00000000c138fd09 RDI: 0000000000000004
RBP: 00007f69e6c36b20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f69e6e26128 R14: 00007f69e6e26090 R15: 00007ffcfc580c88
 </TASK>
device-mapper: table: 248:13: crypt: Unknown error (-ENOMEM)
device-mapper: ioctl: error adding target to table


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

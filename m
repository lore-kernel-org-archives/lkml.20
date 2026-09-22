Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBDD47ACF7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790054982; cv=none; b=Bx8ZND2BWbRxmWnJdwJxHWYNdcuzbNOHlHXEAfaowhl7Xb9TWpmuUh1GRZpwv+RSjnm86MQeo3WvtTan/UGmeMyWtFYleIwhdMB780eirAtXzY2POdoIZ194b4UDu5Df7i4D/FzJfZOd/pq7DEy3SLmELuLN/fjRgY2tpjzOlVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790054982; c=relaxed/simple;
	bh=7L6N4e57iAs8u8LgWYn6PXcM9/P3MSfihZk8phX3sNY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hKix+ukF2kHToJmyESXrqNLI3tYN9qG999nLNYiKYZ6cQkHTcpGlt2AlNwhI+uGUzo5QLjvKhKZ8muVZmfQsv9rHHWWLfAxcy3j+t0TlINY8u2b7MREStAIAEtM/40ciodFy0pj8peRZSb5zsA6abMghk+yI+qmaUfxYX7JWZM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f7.google.com with SMTP id 006d021491bc7-6c197ff1f3aso1371641eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790054976; x=1790659776;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxDW7iRGQwEDz9FqCLpHq6mi7QSACw3JmBmlyXnKu+Y=;
        b=zPBjZXU9/fmuWpwRUam1qVqThAChQQt2mTVtCVy8jC1DvCvjk2a4JG/EH2Rly01CfS
         pgmaZcLVUPxmHzx12w5B9XYCpXloaXd1oksZs8klFBUG1xCPvHgGPamvzKpqi2TUo9Lx
         EBDvM9kPj2leO3eWV5CF/EEfEHyyqqCHvNNk9RQcjhOYFumvlaCmNKQZKMa1Eli6TALI
         3DQ786cayQ8cdZiWFdAeWq5MAl90ZW3ru9ju9XFw/dUiG31QoiztAnCTWG9NtZpI1oX1
         7m7PX92zFEgDLTe3fwnk8qICRUoRgSi/bb1zOkpUUoE6LvPe751zDGFzNXIkHcJWoynZ
         6FxA==
X-Forwarded-Encrypted: i=1; AKwUvBzWCnjfedU6huSQ8zyaxETzzeEr9pNZXVWM9yyg0+rekfr7PvRslSAc4TmFmVC5mNJcmcfuM8PtERfxLak=@vger.kernel.org
X-Gm-Message-State: AFuF++mUz8kx7wJGMDzlv45fezkOe/LcHsR/XxLu2n7OouBMMh6oJKE6
	xnIR9uatCDw/bvJudCgSqvloEysSTDWP9umH2mibGDSRKFWubpWMiRrOw8nRXlHnfAodLiJyJSB
	cEf2e/Zo8v3xbHj19ls0mzjubcJgM+RB+bxeIslTY3Q+G7qkO0sCqasFwjC4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a0b:b0:6c9:8460:c85d with SMTP id
 006d021491bc7-6ca9d44ebd6mr10566817eaf.69.1790054976499; Mon, 21 Sep 2026
 22:29:36 -0700 (PDT)
Date: Mon, 21 Sep 2026 22:29:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab21240.e548f532.1ca396.0018.GAE@google.com>
Subject: [syzbot] [comedi?] UBSAN: shift-out-of-bounds in dt2811_attach
From: syzbot <syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    93f51579e7df Linux 7.3-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17b45005580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=a4cedab706d0a8a3f988
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=106ff005580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10d054c9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-93f51579.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/00f02ade84ed/vmlinux-93f51579.xz
kernel image: https://storage.googleapis.com/syzbot-assets/93be890b3b79/bzImage-93f51579.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com

------------[ cut here ]------------
UBSAN: shift-out-of-bounds in drivers/comedi/drivers/dt2811.c:570:31
shift exponent -251 is negative
CPU: 0 UID: 0 PID: 5925 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
 __ubsan_handle_shift_out_of_bounds+0x279/0x2a0 lib/ubsan.c:494
 dt2811_attach.cold+0x19/0x1e drivers/comedi/drivers/dt2811.c:570
 comedi_device_attach+0x40e/0x6b0 drivers/comedi/drivers.c:1101
 do_devconfig_ioctl+0x1b3/0x6d0 drivers/comedi/comedi_fops.c:930
 comedi_unlocked_ioctl+0x860/0x3310 drivers/comedi/comedi_fops.c:2302
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe50959e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcc3e899c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fe509825fa0 RCX: 00007fe50959e159
RDX: 0000200000000100 RSI: 0000000040946400 RDI: 0000000000000003
RBP: 00007fe50963506b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fe509825fac R14: 00007fe509825fa0 R15: 00007fe509825fa0
 </TASK>
---[ end trace ]---


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

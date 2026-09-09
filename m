Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C378B34216C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940685; cv=none; b=cFbRg0E1JJg+UztX11BeyYQCXvH8FXTEG1RAf27NPm3Y9nwdI5hEsAvZyyrMcaWwuGX5EBNwFMdT7l4RbtWhs0eoBOQy4cO/sT3zxnOjOoAqMbtf4s3+yoGQOzUpW84GsXsxHbHGo20yCcoWckUB+CvmJbBszNODNr1SOpMG+QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940685; c=relaxed/simple;
	bh=p2kTzOA+YUlJDdy4b0LmMW1RFNwwFMY9nt+xFQqirmM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oQonbIPoBwGjj1UynOUZAJfEsszk34KqciSvy6LdDfpoI/p2PBS7y0C3t+6iPVQHvS4WeIYkAGLXmmiOCwIkVHjRPmmt/FkJtvFL4wy5bklBfFTwb6hRXXC2gXJbkFLo5QHkLJFpjNUlRQkfFb5h6FKb+ZRtTgdWv4I++J3CSrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6bd74449818so1823471eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940682; x=1789545482;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1TGGI3iyNcmVZeg7ekp5Mr1i3BQnZMp1NeCuSr2Hzbc=;
        b=SbQDKbD/WIFSXXv1AaYbH74AJuY4wILYTYg5RwT7dGg4UnxuZEWefElVpZjunUN7IT
         K0vXB/ufH6EjWxUDXcQTtGeI5A5ara21/gMFNK/la/Thmgkz38KYq1ZJRecvVnX+U8yk
         Zo06L2J77I4pVg0ZMpsN1ZZRlR/m9AUHeLuN/NXMkTIh1Yxe5/b936RabPzjdlKSftG5
         ks6e5iwF3VksORIM1B4U/o/s9XicEwEJBJ2v2oZTxwB9BNxql6+N+izFnVfxAO08WoyP
         5qmQHbJzCuPua7xnj/K4ZukR1t5nrZN6X/sGxoJBZ8e8tYWBpNq29iTfGx/wfu8fX9Vn
         54aQ==
X-Gm-Message-State: AFuF++mysCAQZ9/QzGrb0RZRCjf0DEcDSFCsG74OpUCL8jllvddSked5
	yYyh4f3xolGF2TAK3pxdrHR+rLwwblSXv0PAsYyuyxXAk44SvXoCW9qP/8v9Ya/sKa0q77W0hyH
	J3mSVHAEb/pfsOiO2Ixc9tbM1Fw15UURwG46LE4LZBknlG2zfio6jTGITLuA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1508:b0:6b7:83c5:fdf8 with SMTP id
 006d021491bc7-6b783c673f9mr17935697eaf.57.1788940682728; Wed, 09 Sep 2026
 00:58:02 -0700 (PDT)
Date: Wed, 09 Sep 2026 00:58:02 -0700
In-Reply-To: <20260909074349.7542-1-syedtayyabfarooq08@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa1118a.f81106d8.285f0a.000f.GAE@google.com>
Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Write in tty_init_dev
From: syzbot <syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syedtayyabfarooq08@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in gs_close

------------[ cut here ]------------
1
WARNING: drivers/usb/gadget/function/u_serial.c:741 at gs_close+0x128/0xce0 drivers/usb/gadget/function/u_serial.c:741, CPU#0: syz-executor409/6047
Modules linked in:
CPU: 0 UID: 0 PID: 6047 Comm: syz-executor409 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:gs_close+0x128/0xce0 drivers/usb/gadget/function/u_serial.c:741
Code: fe e8 bc 4d 21 fa 41 83 ff 01 74 7c e8 41 53 21 fa 31 ff 44 89 fe e8 a7 4d 21 fa 45 85 ff 0f 85 79 04 00 00 e8 29 53 21 fa 90 <0f> 0b 90 e8 20 53 21 fa 4c 89 ef e8 78 6c e8 03 e8 13 53 21 fa 48
RSP: 0018:ffffc900062ff6f0 EFLAGS: 00010093
RAX: 0000000000000000 RBX: ffff888037c32000 RCX: 0000000000000001
RDX: ffff88803303a580 RSI: ffffffff87eabde7 RDI: ffff88803303a580
RBP: 1ffff92000c5fee8 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff8880359cb000
R13: ffff888037c32388 R14: ffff888037c32184 R15: 0000000000000000
FS:  00007f0d220bf6c0(0000) GS:ffff8880d5b5d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000056076d24c2a0 CR3: 00000000380fc000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 tty_release+0x40e/0x1300 drivers/tty/tty_io.c:1718
 tty_open+0x31d/0xe20 drivers/tty/tty_io.c:2119
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6ab/0x14d0 fs/open.c:996
 vfs_open+0x82/0x3f0 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x19fa/0x2440 fs/namei.c:5000
 do_file_open+0x20e/0x430 fs/namei.c:5029
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0d23917a1e
Code: 08 0f 85 f5 e2 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007f0d220bf158 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f0d220bf6c0 RCX: 00007f0d23917a1e
RDX: 0000000000000002 RSI: 00007f0d23963028 RDI: ffffffffffffff9c
RBP: 0000000000000021 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: ffffffffffffffd0
R13: 0000000000000000 R14: 00007ffd1c446780 R15: 00007ffd1c446868
 </TASK>


Tested on:

commit:         893e1178 Merge tag 'x86_urgent_for_7.3-rc3' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1089f125580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=fe63e4d633540f230624
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=156c2c8e580000


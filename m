Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79943B19B6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801424; cv=none; b=FgRwWrK4SrC8qnjgHGG6GUuie+NTpuPUgemCx01SbyChPfHWo7b82cK53HjQvw07wc9n/P7s1e5QeMTDCMXN1En1GAqFRZBXxcsJ6dL8u21aG27xtGMlHkaoc1RMpoNzWSo8dLmMFtB0f+hwlT5ZaDTSYCvE5dTJ3Jy7fwIeHkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801424; c=relaxed/simple;
	bh=eoQ7gAocgn1Wrglr/qIJ6YpvQu2dihvzQtYjRI1c6os=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JMycKX8Qgo9/hu72FDF52FDmLNBESD1MjMo+LiUaHKtwtmIuepB2hkNHL8sBWSdAdIWlpht/gPd+wtp6ZgU87cgkM0ZpgUcUANYpeYxR2uEW6KV4CD74P6gDGhw8oI7ATzKRe2m4MuraoMU0sTmzDjiN4UdOzzOHmTkn4UfB1io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1478e3546so3111915eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801421; x=1789406221;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3ZzQFpla7Dfr7YMfq09arO8ntWg5vgzbCczjQ4xdnGw=;
        b=sXjefnbZTU8CUUeioldION1WmCX/WO3PTQu79/ZVsZu8p7/yQDERKepDtLOCAinKu0
         1ZyfkQ2beeMfnhjjja1ay8+SxmC1qckOqxwbyBoIShncdWu9uZPvpoQNKISrG/bIE3WD
         +Tit5ZUbM2Pxezg3LCoTEWmzDG0oklWjP3TAZ2S8O+gkYyjbCWKOOX9jhJYPhzUmSTgW
         tiVaouVz+7Vavg6g9hVM2bX7XlFdk1wwSaud/zJOo3lSh+qdrNlnmXPsne3WuLdjJuJT
         LC3/bsfJO00Miaqgsb8cOWr30ePcurTsO8pjfr6PDVZFvDTIh1jk6HU5RdZlPjhBdRAH
         BbIw==
X-Forwarded-Encrypted: i=1; AKwUvBx4w/sV+Mf+AKnsgEuCg7kHm7P+OHPe+Ei9BgxRdAx7Jq/ox6KAr+ETWjf7E3Q6YnLii+RDWfHy5j+3p0o=@vger.kernel.org
X-Gm-Message-State: AFuF++nCBPINguGWWuLM6hz30TJtA8gxL5tFWjpD5iuTs+NNg2MWIAuc
	MUkOPSFOjkbmvfg6qgPjE7OSlby1Msd1hj9h3Zb783GBV7fDnMykxemNtz+Do17LiF/XDT4KfYY
	oSmpXwNnicBpjutb3GXDocNzp2i8pmgPDSuETeOWenoF+3JTaQJjWGNnBxTw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4cc8:b0:6aa:de29:651 with SMTP id
 006d021491bc7-6b6fbcd091cmr14098099eaf.16.1788801421747; Mon, 07 Sep 2026
 10:17:01 -0700 (PDT)
Date: Mon, 07 Sep 2026 10:17:01 -0700
In-Reply-To: <CABm9WX4NcU9Z_k09GcrsghtoBVxO3cQu0GSWfQ2BGedu2MgfCQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ef18d.6e6c5f9e.240462.0007.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in cx231xx_send_vendor_cmd/usb_submit_urb
From: syzbot <syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com>
To: jcperdomo100@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in cx231xx_send_vendor_cmd/usb_submit_urb

------------[ cut here ]------------
usb 3-1: BOGUS control dir, pipe 80000380 doesn't match bRequestType c0
WARNING: drivers/usb/core/urb.c:413 at usb_submit_urb+0x1057/0x18b0 drivers/usb/core/urb.c:411, CPU#1: syz.0.17/6418
Modules linked in:
CPU: 1 UID: 0 PID: 6418 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:usb_submit_urb+0x1100/0x18b0 drivers/usb/core/urb.c:411
Code: b8 00 00 00 00 00 fc ff df 41 0f b6 04 04 84 c0 0f 85 b2 05 00 00 45 0f b6 45 00 48 8b 3c 24 48 8b 74 24 18 4c 89 f2 44 89 f9 <67> 48 0f b9 3a 48 bd 00 00 00 00 00 fc ff df e9 ba f2 ff ff 44 89
RSP: 0018:ffffc9000348f4f8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888034a58000 RCX: 0000000080000380
RDX: ffff88802a48a140 RSI: ffffffff8cc51920 RDI: ffffffff9087d200
RBP: dffffc0000000000 R08: 00000000000000c0 R09: 0000000000000000
R10: ffffc9000348f5e0 R11: fffff52000691ec8 R12: 1ffff1100694aef0
R13: ffff888034a57780 R14: ffff88802a48a140 R15: 0000000080000380
FS:  00007f7564cae6c0(0000) GS:ffff888124dd6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff16569d24 CR3: 0000000072d90000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 usb_start_wait_urb+0x13f/0x5b0 drivers/usb/core/message.c:62
 usb_internal_control_msg drivers/usb/core/message.c:117 [inline]
 usb_control_msg+0x234/0x3e0 drivers/usb/core/message.c:167
 __usb_control_msg+0xf9/0x3f0 drivers/media/usb/cx231xx/cx231xx-core.c:249
 cx231xx_send_vendor_cmd+0x553/0x760 drivers/media/usb/cx231xx/cx231xx-core.c:-1
 cx231xx_send_usb_command+0x2e2/0x500 drivers/media/usb/cx231xx/cx231xx-core.c:205
 cx231xx_i2c_recv_bytes drivers/media/usb/cx231xx/cx231xx-i2c.c:-1 [inline]
 cx231xx_i2c_xfer+0xd60/0x2a90 drivers/media/usb/cx231xx/cx231xx-i2c.c:386
 __i2c_transfer+0x7bf/0x1fe0 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x1cb/0x2d0 drivers/i2c/i2c-core-base.c:2350
 i2c_transfer_buffer_flags+0x10d/0x1a0 drivers/i2c/i2c-core-base.c:2378
 i2c_master_recv include/linux/i2c.h:79 [inline]
 i2cdev_read+0x10d/0x250 drivers/i2c/i2c-dev.c:155
 vfs_read+0x213/0xa80 fs/read_write.c:572
 ksys_read+0x150/0x270 fs/read_write.c:716
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7563d9e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7564cae028 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00007f7564025fa0 RCX: 00007f7563d9e159
RDX: 0000000000000700 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007f7563e35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7564026038 R14: 00007f7564025fa0 R15: 00007ffe7bbdb788
 </TASK>
----------------
Code disassembly (best guess):
   0:	b8 00 00 00 00       	mov    $0x0,%eax
   5:	00 fc                	add    %bh,%ah
   7:	ff                   	lcall  (bad)
   8:	df 41 0f             	filds  0xf(%rcx)
   b:	b6 04                	mov    $0x4,%dh
   d:	04 84                	add    $0x84,%al
   f:	c0 0f 85             	rorb   $0x85,(%rdi)
  12:	b2 05                	mov    $0x5,%dl
  14:	00 00                	add    %al,(%rax)
  16:	45 0f b6 45 00       	movzbl 0x0(%r13),%r8d
  1b:	48 8b 3c 24          	mov    (%rsp),%rdi
  1f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  24:	4c 89 f2             	mov    %r14,%rdx
  27:	44 89 f9             	mov    %r15d,%ecx
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%rbp
  36:	fc ff df
  39:	e9 ba f2 ff ff       	jmp    0xfffff2f8
  3e:	44                   	rex.R
  3f:	89                   	.byte 0x89


Tested on:

commit:         df290809 Linux 7.3-rc2
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1607e749580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=ddccc0c0dbc0a38ffccb
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.

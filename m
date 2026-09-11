Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6E3598BF5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157567; cv=none; b=in3REBQUllEJuU7rAoO5UZOszTtWA7Pzzo25La7Q0S4W6TwZ+3Zd4uRqYPoI8iv4kDmr1PK4y0pg1izwtECdvUNx6KKxR0CHXesKLT7HsSAUeLWIBZvoI0Tv4kkpe67QY6wuhv311n1EgdopEV26uA6rSn7q/98EiCxwZkhSG48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157567; c=relaxed/simple;
	bh=wAvKU8SjsFsHYB2ozXwljdG5NjRIWOViEiptb6tCW1Q=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MVoVTDI3U01em5DUAXlirR5PdfW78J8uLWU0QePQCjne0bfIuLKTM9mmZaWIIn0eeISEY7bTUl0rlmOl8BP33GJUnGsyWtEjmPMeLcbWPOnZqfSBpcJzRfVo5C8M8g/sd1YvNKDp1SaMYk49XrqtmLkcUgUjbxRyUosDMBdnkNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f2.google.com with SMTP id 006d021491bc7-6bd3ee01a0dso512048eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789157554; x=1789762354;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2tA+SngjrmQk+wdihqTLbubXs7aLmdXGgsvtzF18URA=;
        b=MWM1c3jNJBSh7qsOali0EX5yWF1h0oAqBE5tovqxwnVKLQNl6R8ZENiheTi4XZFh+e
         nmSxnm3PumuJMAnRSmp/SoiyrxO+R17x0COWC0pD8W3f02BQT72fFZJf4bH1BBBk4i9v
         rK4/cX3Tf+bcUrSZ7GJYY14YLGmcCHMiHZM3Y0xssGf41apdOVANf5hFNFmMd7pCUrUj
         FJhkZExnB0LP3zQvKvtrJuEf9Xy0wZRaoXzHDV9GF7SgiK364iD103nlnUAsaz50uDbv
         1acvonXh9T7rxIzxWJ9NCQt2ASJgdRLit1vriwNqKXabeTjYz0NUAyzBStWQ4eWr3G7V
         W2mQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/cRyhXU0xjy7MT9BKvV5oK85S5eiA09oEZuoQiU68rUa9xB61NanMutq/qHbojWejPGtBgW/UcshGeL4=@vger.kernel.org
X-Gm-Message-State: AFuF++kIHwgPiai3Wv7a8ReafFQf9WD9l/jdvKwMcN4dgQJsVn4Wsxxp
	AeFlw9f9dSWccI1bE8fpIZSuTAYe9fA8RbTx1ca+O1mf3JsKVWElOYpYt1pmsxZ1ucAA3o8TJDk
	f4nnPPrV75NXpzia0PeLyMwrYRcAwuUoF9fmy7cLYFYraJhJhpm5D5y4jEIQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2083:b0:6ae:5250:dd1c with SMTP id
 006d021491bc7-6c0ba248037mr4778054eaf.29.1789157554406; Fri, 11 Sep 2026
 13:12:34 -0700 (PDT)
Date: Fri, 11 Sep 2026 13:12:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa460b2.6e6c5f9e.28f11f.0049.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in service_outstanding_interrupt/usb_submit_urb
 (2)
From: syzbot <syzbot+eb8f169da355a394fe04@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    34c9c5517033 Merge 7.3-rc2 into usb-next
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=101ceaf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c451f9f64434b622
dashboard link: https://syzkaller.appspot.com/bug?extid=eb8f169da355a394fe04
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8a384e63cde6/disk-34c9c551.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e5a73decdc30/vmlinux-34c9c551.xz
kernel image: https://storage.googleapis.com/syzbot-assets/13abc163bbdc/bzImage-34c9c551.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+eb8f169da355a394fe04@syzkaller.appspotmail.com

------------[ cut here ]------------
URB ffff888112540000 submitted while active
WARNING: drivers/usb/core/urb.c:379 at usb_submit_urb+0x1689/0x19b0 drivers/usb/core/urb.c:379, CPU#0: syz.0.163/5871
Modules linked in:
CPU: 0 UID: 0 PID: 5871 Comm: syz.0.163 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:usb_submit_urb+0x168c/0x19b0 drivers/usb/core/urb.c:379
Code: 00 48 8b 04 24 48 8b 90 b0 00 00 00 e9 70 ff ff ff bb ed ff ff ff e9 ac f1 ff ff e8 be 79 b2 fc 48 8d 3d d7 b6 19 06 48 89 de <67> 48 0f b9 3a bb f0 ff ff ff e9 8e f1 ff ff c7 44 24 30 00 00 00
RSP: 0018:ffffc90013e2fb50 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888112540000 RCX: 0000000000000000
RDX: ffff888112d28000 RSI: ffff888112540000 RDI: ffffffff8b1c35d0
RBP: ffff88810ffb5090 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: ffff88810ffb52b8 R14: ffff88810ffb5050 R15: ffff88810ffb5050
FS:  00007f59984c56c0(0000) GS:ffff8882683e4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c2d13ca CR3: 00000001149e4000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 service_outstanding_interrupt.isra.0+0x166/0x270 drivers/usb/class/cdc-wdm.c:509
 wdm_read+0x8a8/0xaf0 drivers/usb/class/cdc-wdm.c:615
 vfs_read+0x1e4/0xb40 fs/read_write.c:572
 ksys_read+0x12a/0x250 fs/read_write.c:716
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x119/0x710 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5999aae159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f59984c5028 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00007f5999d36180 RCX: 00007f5999aae159
RDX: 00000000000000b3 RSI: 0000200000000340 RDI: 000000000000001e
RBP: 00007f5999b45024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f5999d36218 R14: 00007f5999d36180 R15: 00007ffc3efb3688
 </TASK>
----------------
Code disassembly (best guess):
   0:	00 48 8b             	add    %cl,-0x75(%rax)
   3:	04 24                	add    $0x24,%al
   5:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
   c:	e9 70 ff ff ff       	jmp    0xffffff81
  11:	bb ed ff ff ff       	mov    $0xffffffed,%ebx
  16:	e9 ac f1 ff ff       	jmp    0xfffff1c7
  1b:	e8 be 79 b2 fc       	call   0xfcb279de
  20:	48 8d 3d d7 b6 19 06 	lea    0x619b6d7(%rip),%rdi        # 0x619b6fe
  27:	48 89 de             	mov    %rbx,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	bb f0 ff ff ff       	mov    $0xfffffff0,%ebx
  34:	e9 8e f1 ff ff       	jmp    0xfffff1c7
  39:	c7                   	.byte 0xc7
  3a:	44 24 30             	rex.R and $0x30,%al
  3d:	00 00                	add    %al,(%rax)


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

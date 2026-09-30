Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDF7348C6B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790796206; cv=none; b=FEm4SmA6+6EHIe0kGJCWJ3N9w26JIXGsgDNGEjqusHyfuGc0Us+1B5REuGSixNmxddYvZRVR7q6B2dJKL9sfVq5DVzg8mdz2BmstBJGkNoxrzwIu4lxWhj4Ga2zhsLl26G26nBNR/DDSpU+C6mihHYj3H1KCke3F5Ef+cLtvmbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790796206; c=relaxed/simple;
	bh=uJ8EtuEK905+Gi23qPeV9TGepWx/mAogCtFhhB1gBt4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IRJ7FYiGmkHprB3C4MpYigCUm4jHIFKaRk5RXvUrt1YEAGzoR2rdexl+1lq0nVRWWCD4Q4h2Era03R7RPlMCLO6XKY6hf3k/c5ld5oP+e6rcGwS309/KbQGautBW1CdKnByhsTBvcxs+J/7+ectNWU0MxjVTavJtgnNfCHaO0Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cbf700ddccso5846274b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790796203; x=1791401003;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vu33goty3w6qMJWGH8JjwHxD7w/swbfgGOmcqaO0bYg=;
        b=wCZPgKUGzb+ATi+TwyemvKSZbdKC/xgCUIo97HdRA2ERjWg+bUzMB7rZ09EA6Q+PHw
         ogfCI3grjKt+nLNFhi+eOXDU5OEr3tTpIa3nOHaKpBSnJKbDHTAT8s/Gpk6zO8ABR+/T
         hwiUycUlda43jqyH06JGV0ssTYQkJkeHE/mOBnhzVuMBXsINOctOJ8SYnUcVDtsFzL+r
         T7zfhFwoHTTamVPfr5FHle0pho83AWfImkZwPskwCzv09/XCorciaDoCP9hie6zR1uA/
         fLZKCDaPULF0qaumOQUg2GLlH9BSQHocdbcxG6ZCvZ9ramIvKxnxkndCsSo/jHgLY4+p
         eH6A==
X-Gm-Message-State: AFuF++ks4s9Zb0AqWkxuIrhsOZnVUuMCe77XWmQuWTeATYsUree9pghW
	Ha+ih2rYBrCsNzSTclouuwWbePy69RwWzWODOWoqW6qHyMUjIljllAPVlCGHnh2A+Gj5vV2WiNz
	GK5EgC/BOj5BK4w9rKKtvHFc0mtVABV8pgjUaLYLNrTQ1ibcKGK+zQF66Gt0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f0a:b0:4d6:90f3:74b4 with SMTP id
 5614622812f47-4f1b7dfcb10mr2831827b6e.52.1790796203482; Wed, 30 Sep 2026
 12:23:23 -0700 (PDT)
Date: Wed, 30 Sep 2026 12:23:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abd61ab.9eb00033.20dcce.0004.GAE@google.com>
Subject: [syzbot] [media?] general protection fault in mxl111sf_ep4_streaming_ctrl
From: syzbot <syzbot+3df044e20e6ff1fb3cf5@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    551c722f4080 Merge tag 'rtc-7.3-fixes' of git://git.kernel..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10a37b25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d4242cb1c54cdf7
dashboard link: https://syzkaller.appspot.com/bug?extid=3df044e20e6ff1fb3cf5
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14f983f5580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3df044e20e6ff1fb3cf5@syzkaller.appspotmail.com

usb 3-1: dvb_usb_v2: could not submit urb no. 0 - get them all back
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000061: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000308-0x000000000000030f]
CPU: 1 UID: 0 PID: 5922 Comm: syz-executor559 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
RIP: 0010:mxl111sf_ep4_streaming_ctrl+0x2c/0x1a0 drivers/media/usb/dvb-usb-v2/mxl111sf.c:399
Code: 1e fa 55 41 57 41 56 53 89 f3 49 89 fe 49 bf 00 00 00 00 00 fc ff df e8 02 5e 93 f9 49 81 c6 08 03 00 00 4c 89 f0 48 c1 e8 03 <42> 80 3c 38 00 74 08 4c 89 f7 e8 25 61 03 fa 4d 8b 36 49 83 c6 38
RSP: 0018:ffffc90002fc7b38 EFLAGS: 00010202
RAX: 0000000000000061 RBX: 0000000000000001 RCX: ffff88807ceb8000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc90002fc7c38 R08: ffffc90002fc7647 R09: 1ffff920005f8ec8
R10: dffffc0000000000 R11: ffffffff88348d10 R12: dffffc0000000000
R13: ffff88805a6753b8 R14: 0000000000000308 R15: dffffc0000000000
FS:  00007f91525696c0(0000) GS:ffff888124dc8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f09f0cd1140 CR3: 000000002f2ca000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 dvb_usb_start_feed+0x57a/0xc70 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:308
 dmx_ts_feed_start_filtering+0x129/0x220 drivers/media/dvb-core/dvb_demux.c:747
 dvb_dmxdev_start_feed drivers/media/dvb-core/dmxdev.c:658 [inline]
 dvb_dmxdev_filter_start+0x434/0x10d0 drivers/media/dvb-core/dmxdev.c:769
 dvb_demux_do_ioctl+0x48b/0x540 drivers/media/dvb-core/dmxdev.c:1099
 dvb_usercopy+0x199/0x2e0 drivers/media/dvb-core/dvbdev.c:996
 dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1208
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9153da4a8b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007f9152569060 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f9153da4a8b
RDX: 00007f91525690d0 RSI: 0000000040146f2c RDI: 0000000000000003
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f91525690f0
R13: 00007f9153e11fe6 R14: 0000001400000001 R15: 00007ffdf0c12528
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:mxl111sf_ep4_streaming_ctrl+0x2c/0x1a0 drivers/media/usb/dvb-usb-v2/mxl111sf.c:399
Code: 1e fa 55 41 57 41 56 53 89 f3 49 89 fe 49 bf 00 00 00 00 00 fc ff df e8 02 5e 93 f9 49 81 c6 08 03 00 00 4c 89 f0 48 c1 e8 03 <42> 80 3c 38 00 74 08 4c 89 f7 e8 25 61 03 fa 4d 8b 36 49 83 c6 38
RSP: 0018:ffffc90002fc7b38 EFLAGS: 00010202
RAX: 0000000000000061 RBX: 0000000000000001 RCX: ffff88807ceb8000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc90002fc7c38 R08: ffffc90002fc7647 R09: 1ffff920005f8ec8
R10: dffffc0000000000 R11: ffffffff88348d10 R12: dffffc0000000000
R13: ffff88805a6753b8 R14: 0000000000000308 R15: dffffc0000000000
FS:  00007f91525696c0(0000) GS:ffff888124cc8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000564103601950 CR3: 000000002f2ca000 CR4: 00000000003526f0
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	fa                   	cli
   1:	55                   	push   %rbp
   2:	41 57                	push   %r15
   4:	41 56                	push   %r14
   6:	53                   	push   %rbx
   7:	89 f3                	mov    %esi,%ebx
   9:	49 89 fe             	mov    %rdi,%r14
   c:	49 bf 00 00 00 00 00 	movabs $0xdffffc0000000000,%r15
  13:	fc ff df
  16:	e8 02 5e 93 f9       	call   0xf9935e1d
  1b:	49 81 c6 08 03 00 00 	add    $0x308,%r14
  22:	4c 89 f0             	mov    %r14,%rax
  25:	48 c1 e8 03          	shr    $0x3,%rax
* 29:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1) <-- trapping instruction
  2e:	74 08                	je     0x38
  30:	4c 89 f7             	mov    %r14,%rdi
  33:	e8 25 61 03 fa       	call   0xfa03615d
  38:	4d 8b 36             	mov    (%r14),%r14
  3b:	49 83 c6 38          	add    $0x38,%r14


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

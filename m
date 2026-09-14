Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F2D38734A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789421189; cv=none; b=CcJZhea3lQ/pZdbDVcaIY9vEeWB+aW9z3HgOLcaB1RnlD+vgLWdBrcXQ2GIQLoO9WSXOZXhNYPpsnXXikiRbZRizELYCmWYCEw3ErFloxGmKJcgnx9dJInRdINQs7tNdFY/Dt09XPa64kQLmmizbKg3NC7OgXw1eyDHDRzuFcNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789421189; c=relaxed/simple;
	bh=KvJhzZd6AwkkIU2Es4vbnEfIFXnH+ahy6asB0LKS7NE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=odrpJQwQ3aNYrM8nFI1M+8E7etuNz9bZ3RHMfa7wA3UCCvbwRQ8xcQ085avAX2rhdc0bz7z+hBNvt9Yq8vxIXHbf/MWL7AxnaJ0RN4df0FH+jgG1vWSxgT6vqn03o+MdgJISGnlL2mHaEfnhuq+s5xbeyB6c/cWScA1xUg2OZXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-8069d92e182so942427a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789421186; x=1790025986;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJSsiHzVynrUipB9iDSOlhf+oxil+0VedCJ6OweJF3s=;
        b=UMMk+IS8LtdI/4m3MNDIXG3wHFW9GC08KCWJ8eSMW8pFUEiKnxmbnd78GSG3xJcer3
         g7FjRYsogc/wCgh/8Cl6zhwt1U7OQ3dUmGLyIO0S/NpWKq/0LzmJo3jEaPGyziSftOPQ
         5AmaB1+xlCJ4mFG1zwGn7ElJybJwUQdLNATuRiVE4M0CjDlr5447Vql96zIF2KZqQ45R
         nE6kGvsSt3gb2JlDVS+zN4szF2zjQTJPjpCClsm5LFhXhqccnl8jUWI1CmEFT2zgSXXl
         +76SGrrOej0kVrRH6JARjXbwJFsVS5aZYvt9YBiY22nqu0NBbSAHojYZp8ziLa9qzeYN
         MijA==
X-Forwarded-Encrypted: i=1; AKwUvBzs5BAJnztfNQXTDQzbDS+4Ylz36eqbGifGG6EBDmB+lwAiurOmkBNdg3It8HiwMZHkJ3ln2BFo7Dz1U1A=@vger.kernel.org
X-Gm-Message-State: AFuF++nouMJxsuoAmzaZIaxpYWwymziJXj50SoysHMhffiN9kJtnkW1B
	c2HhPAMRKLL6XyQNFnjIiZZUYHpltPLTHUi3zolRQOrs3Wy2YT44N9Qh8fKj9scUEbBgmw+ctfG
	azY/Wa/h2d/Iz+z+73jNX7oaKflabZN5SI0mWD1tamiSzXVfKyU2dwdA9zmA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1389:b0:6c1:dc9f:ab2e with SMTP id
 006d021491bc7-6c53f446182mr2350443eaf.27.1789421186287; Mon, 14 Sep 2026
 14:26:26 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:26:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa86682.f81106d8.2ab401.0055.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in ucsi_acpi_probe (2)
From: syzbot <syzbot+e7aa19176573a6992617@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    704340f1cd0d Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14358df9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=e7aa19176573a6992617
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10c5bdf9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14c5bdf9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a1f812f889ad/disk-704340f1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8aa4ccae83ac/vmlinux-704340f1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8f86a50bf181/bzImage-704340f1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e7aa19176573a6992617@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc00000000fc: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x00000000000007e0-0x00000000000007e7]
CPU: 0 UID: 0 PID: 5618 Comm: syz-executor238 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/08/2026
RIP: 0010:ucsi_acpi_probe+0x6c/0x4b0 drivers/usb/typec/ucsi/ucsi_acpi.c:199
Code: 89 74 24 08 4c 8b 23 4c 89 e7 e8 bf 7d cd fd 49 83 c4 f0 45 31 f6 84 c0 4d 0f 45 f4 49 81 c6 e4 07 00 00 4c 89 f0 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85 16 04 00 00 41 8b 2e 31 ff 89 ee e8 fb
RSP: 0018:ffffc90004c27ab8 EFLAGS: 00010207
RAX: 00000000000000fc RBX: ffff88801d7ac4e8 RCX: ffff888011e4be80
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffffff8760c1c0 R12: fffffffffffffff0
R13: dffffc0000000000 R14: 00000000000007e4 R15: 1ffff11003af589d
FS:  0000555588eb7400(0000) GS:ffff888125bcb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000000000 CR3: 0000000045e66000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 platform_probe+0xf9/0x190 drivers/base/platform.c:1507
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 device_driver_attach+0xe0/0x1d0 drivers/base/dd.c:1203
 bind_store+0x1d3/0x220 drivers/base/bus.c:267
 kernfs_fop_write_iter+0x3a5/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5d40826649
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd2d524bb8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f5d40826649
RDX: 0000000000000007 RSI: 0000200000000600 RDI: 0000000000000006
RBP: 0000000000000001 R08: 0000000000000006 R09: 0000000000000006
R10: 0000000000000006 R11: 0000000000000246 R12: 00007ffd2d524d28
R13: 431bde82d7b634db R14: 00007f5d408b9c40 R15: 0000000000000002
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:ucsi_acpi_probe+0x6c/0x4b0 drivers/usb/typec/ucsi/ucsi_acpi.c:199
Code: 89 74 24 08 4c 8b 23 4c 89 e7 e8 bf 7d cd fd 49 83 c4 f0 45 31 f6 84 c0 4d 0f 45 f4 49 81 c6 e4 07 00 00 4c 89 f0 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85 16 04 00 00 41 8b 2e 31 ff 89 ee e8 fb
RSP: 0018:ffffc90004c27ab8 EFLAGS: 00010207
RAX: 00000000000000fc RBX: ffff88801d7ac4e8 RCX: ffff888011e4be80
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffffff8760c1c0 R12: fffffffffffffff0
R13: dffffc0000000000 R14: 00000000000007e4 R15: 1ffff11003af589d
FS:  0000555588eb7400(0000) GS:ffff888125ccb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555588eb76d0 CR3: 0000000045e66000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	89 74 24 08          	mov    %esi,0x8(%rsp)
   4:	4c 8b 23             	mov    (%rbx),%r12
   7:	4c 89 e7             	mov    %r12,%rdi
   a:	e8 bf 7d cd fd       	call   0xfdcd7dce
   f:	49 83 c4 f0          	add    $0xfffffffffffffff0,%r12
  13:	45 31 f6             	xor    %r14d,%r14d
  16:	84 c0                	test   %al,%al
  18:	4d 0f 45 f4          	cmovne %r12,%r14
  1c:	49 81 c6 e4 07 00 00 	add    $0x7e4,%r14
  23:	4c 89 f0             	mov    %r14,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	0f 85 16 04 00 00    	jne    0x44d
  37:	41 8b 2e             	mov    (%r14),%ebp
  3a:	31 ff                	xor    %edi,%edi
  3c:	89 ee                	mov    %ebp,%esi
  3e:	e8                   	.byte 0xe8
  3f:	fb                   	sti


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

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794717633;
	b=I8rDCMXn+sd02iz4e+zYs5gTG33wPkPLT07Dj53BtTn0tJIENojE2Ta2QhUB27wwA1aI
	 6/Op5B7GXqfmNLn1/fT2tOdxlaC+q2mrS1yO68pZhbTYWTtg/Pyon9OSjo8JZG0nPYKaF
	 PeziSzXT+hWoo78asrp1IM4MPxGci2rC/Qqw8D16AJ+Cl7iYk3RJFxvYB1H9+JnoJ5Imw
	 ZtLX0jddy07LEQhsTxnMinMTItbscZQ6QdX2VT4ROFHm5Qh/slynRrTVCSiWUwehxn3Cl
	 dI95phWW+0+FJbBTQE7sIm+gNET8NGtF2q8EkIISxsgSCaQJEOiwB4Cw8GvsC3sOqpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794717633;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=+xVaVVikLy+i7lGQcU+vgz316lZEoUcwUpm3JtqBoD8=;
	b=GrEND4o9RlNTR88LJXEek8vf1maEsy3eP1Qt/892S/D/7LyntX3i36M+WfaZKPHzZiym
	 CiFSxuGz+PgQcuNeYGxcLPhXhODLFnG2/ZZM8ii50oiDuIKmT6mn8cEBNLzMpTES3bdKU
	 Ejo87tQcGxBxGusRiD+/c9TKD4JKITrppPoL04S76jp9Ux9n3Mip7pEYqPY2PSdf+KklM
	 P2drbuQpB6mmJpzHIdHmS/buFnF8p/uZDSNx5+YLI5snYRUkEdNJOjMaa4I902jDn8CFk
	 FybzH4Iu+jFKS+bi6biyZw/XTw0QJbPGVTczBhQAiAai4Tqb0/bXBiKNgXryCuScBDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D4A606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17D4A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8626dd59f73so364179a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:40:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794717632; x=1795322432;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xVaVVikLy+i7lGQcU+vgz316lZEoUcwUpm3JtqBoD8=;
        b=hxlBdryaaXOdUQdF4Mp/WY3bvZ1pmf9aHBkqKbJJ9Y5B+y/UfKP3eNi6IRUDozbyPy
         GvF6KghHYDTN8YisPLHVWD8UnMtednhYXcbZNp6RXQJy4wzXs+zQFmvuAgxKYo9kHwOE
         XspY24RS17m9w8vPnB6Y8aV9+ZqnwOvTD5b+KkR+Wrb0Gb3ZV2sumya0DG92DV2Y/SmT
         7XpZCuTaQPVZouYgSwtUpXQ3F+2uLCPOiaiu9D9UtDuETkUaE5i7QxwtFVXUURd51Aql
         Pqv87dZW6CrdBqY+LuXA/ERllx8oHHhnZHU4CRElCcI0pC6lwGO96L3e9SVFMWPAr3J8
         gymQ==
X-Forwarded-Encrypted: i=1; AL+hErHlU3HzzLc5Xx1dQA6gHGtQgqXl3UE/BfVcEavTOQQ3DLHlTFkINsrGQ/RTA9HYaxD/yqaiwHQLTEulY3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qyFZzay4jsTA2xJ1wEzyLh5ywBJrUnXHLfR9NNO9sqlaArzYn
	4w8jrQ3EQ+HeYb39/OddQ77viDkC8f95pc+9oSE2j1JlCSLgIv7JjFjHjc1djxSOhSs9KYv6nQQ
	UKwmiGOh0OpWIiv0cYFa43RiGRSGQofJQjbQWOTwtXtyzi2LBPFlbyEpcUZU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3083:b0:53a:2f73:29ff with SMTP id
 5614622812f47-56e5fd452cemr7012411b6e.6.1794717632125; Sat, 14 Nov 2026
 20:40:32 -0800 (PST)
Date: Sat, 14 Nov 2026 20:40:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af937c0.094600b6.347106.0007.GAE@google.com>
Subject: [syzbot] [squashfs?] general protection fault in lookup_one_qstr_excl
From: syzbot <syzbot+03fdf84c0915fd48f361@syzkaller.appspotmail.com>
To: brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phillip@squashfs.org.uk, 
	squashfs-devel@lists.sourceforge.net, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    84abb955b101 Add linux-next specific files for 20261113
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10a329ad580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d9d5eeb0ba036071
dashboard link: https://syzkaller.appspot.com/bug?extid=03fdf84c0915fd48f361
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12db8d3d580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=140eebfd580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ffae1d4a717e/disk-84abb955.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fd2a35a63abf/vmlinux-84abb955.xz
kernel image: https://storage.googleapis.com/syzbot-assets/039ccf647778/bzImage-84abb955.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/d95c1baa8012/mount_0.gz

AI-generated root cause summary:
In squashfs_lookup() (fs/squashfs/namei.c), squashfs_read_metadata() returns the
positive number of bytes read on success, which is stored in err. When a
subsequent squashfs_dir_space() check fails, execution branches directly to
read_failure without setting err to a negative errno like -EIO, causing
squashfs_lookup() to return ERR_PTR(err) where err is a positive integer (e.g.,
6). The VFS caller lookup_one_qstr_excl() treats this positive pointer as a
valid struct dentry pointer because IS_ERR() evaluates to false, and immediately
dereferences dentry->d_flags (offset 0), causing a near-NULL pointer dereference
crash.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=03fdf84c0915fd48f361

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+03fdf84c0915fd48f361@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 8
SQUASHFS error: Unable to read directory block [0:26]
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 5646 Comm: syz-executor151 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
RIP: 0010:__d_entry_type include/linux/dcache.h:452 [inline]
RIP: 0010:d_is_miss include/linux/dcache.h:457 [inline]
RIP: 0010:d_is_negative include/linux/dcache.h:503 [inline]
RIP: 0010:lookup_one_qstr_excl+0x155/0x360 fs/namei.c:1847
Code: ff d3 48 85 c0 0f 85 8f 01 00 00 e8 a5 a6 66 ff 49 81 fe 01 f0 ff ff 72 0a e8 97 a6 66 ff e9 86 00 00 00 4c 89 f0 48 c1 e8 03 <0f> b6 04 28 84 c0 0f 85 b6 01 00 00 bd 00 00 38 00 41 23 2e 41 89
RSP: 0018:ffffc90003c57cb0 EFLAGS: 00010247
RAX: 0000000000000000 RBX: 0000000000060000 RCX: ffff8880269a1f40
RDX: 0000000000000000 RSI: 0000000000000004 RDI: 00000000ffffffff
RBP: dffffc0000000000 R08: ffff88807705343b R09: 1ffff1100ee0a687
R10: dffffc0000000000 R11: ffffed100ee0a688 R12: ffff888077053380
R13: ffff888079bb7240 R14: 0000000000000006 R15: 0000000000000006
FS:  00005555603cd400(0000) GS:ffff8881233cd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000026d50000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __start_dirop fs/namei.c:2971 [inline]
 start_dirop fs/namei.c:2993 [inline]
 filename_create+0x20e/0x370 fs/namei.c:5214
 filename_symlinkat+0xe8/0x430 fs/namei.c:5913
 __do_sys_symlink fs/namei.c:5946 [inline]
 __se_sys_symlink+0x4d/0x2b0 fs/namei.c:5942
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x00007fe4baeb7c49
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe25a11318 EFLAGS: 00000246 ORIG_RAX: 0000000000000058
RAX: ffffffffffffffda RBX: 00007ffe25a11340 RCX: 00007fe4baeb7c49
RDX: 00007fe4baeb7c49 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 00007fe4baf170b0 R08: 00005555603ce060 R09: 00005555603ce060
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffe25a11340
R13: 0000000000000002 R14: 431bde82d7b634db R15: 00007fe4baf1704b
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__d_entry_type include/linux/dcache.h:452 [inline]
RIP: 0010:d_is_miss include/linux/dcache.h:457 [inline]
RIP: 0010:d_is_negative include/linux/dcache.h:503 [inline]
RIP: 0010:lookup_one_qstr_excl+0x155/0x360 fs/namei.c:1847
Code: ff d3 48 85 c0 0f 85 8f 01 00 00 e8 a5 a6 66 ff 49 81 fe 01 f0 ff ff 72 0a e8 97 a6 66 ff e9 86 00 00 00 4c 89 f0 48 c1 e8 03 <0f> b6 04 28 84 c0 0f 85 b6 01 00 00 bd 00 00 38 00 41 23 2e 41 89
RSP: 0018:ffffc90003c57cb0 EFLAGS: 00010247
RAX: 0000000000000000 RBX: 0000000000060000 RCX: ffff8880269a1f40
RDX: 0000000000000000 RSI: 0000000000000004 RDI: 00000000ffffffff
RBP: dffffc0000000000 R08: ffff88807705343b R09: 1ffff1100ee0a687
R10: dffffc0000000000 R11: ffffed100ee0a688 R12: ffff888077053380
R13: ffff888079bb7240 R14: 0000000000000006 R15: 0000000000000006
FS:  00005555603cd400(0000) GS:ffff8881234cd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffe25a12000 CR3: 0000000026d50000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	ff d3                	call   *%rbx
   2:	48 85 c0             	test   %rax,%rax
   5:	0f 85 8f 01 00 00    	jne    0x19a
   b:	e8 a5 a6 66 ff       	call   0xff66a6b5
  10:	49 81 fe 01 f0 ff ff 	cmp    $0xfffffffffffff001,%r14
  17:	72 0a                	jb     0x23
  19:	e8 97 a6 66 ff       	call   0xff66a6b5
  1e:	e9 86 00 00 00       	jmp    0xa9
  23:	4c 89 f0             	mov    %r14,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	0f 85 b6 01 00 00    	jne    0x1ec
  36:	bd 00 00 38 00       	mov    $0x380000,%ebp
  3b:	41 23 2e             	and    (%r14),%ebp
  3e:	41                   	rex.B
  3f:	89                   	.byte 0x89


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

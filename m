Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779851;
	b=P8JenTaj1QmSVBooJYFj2PmfuSjuo91SA2bz0e2H9nlOmNHjovgvbqPDiX0u5sWMIv7o
	 QAJIdXeqfhQ+yv3RbEKl/YoDQ13LAnvAKqg58cYVrAIAw/XZQV+UC+EnzBCFpLVXSDJRa
	 QWl7huiaobPUFVItbgN6AaW8cH53Le/qWrZkd63DevNFf9apQRyiAooS/0y3h/bexT2b/
	 HGLe+28vtR6e1Eo2xGzDE4WnUQCzMqi5/KX7zbUVTIFhzwtDQWMsp+Eep5SLN8LserSLc
	 qs2rPE7yispwlhXY4/xzEu3DvVlYdsZfvw9AQIuYE6TlgJJ27IqfU/mBMF/bW9PzoNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779851;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=eCxx5RHXq7WPqDK7xKRDc6BR9/+tnHIZsgY3LJnVcoU=;
	b=xq2DjzWkZQkzAu+LA3DRHS3Bkw95ThPb2PN6szK9qjZaC1GWlEsMT7xa636qmJZfyObl
	 zuWr5LZ0hbhFZPjCnA0RcUNbKI0Qc42eRedvqbxXq7L1wFGkKCmoBb8hPfXCvfrhr8Ghv
	 V2CG7GYwDSQhkhaIzFeKcPhzSFxhW9FSATSpmHXiPss70eXMlryjU2nlSxMYP4uHFcYZJ
	 xajbGhNc+BQEHd1v/0bo/j1JajRwU7uwyLv4hNp+SoHiyYmfyLvkHe7BicYc9bNKTYDHN
	 UpuyRo/8lkdqowhBuIrcwzWxBSO1FWKSQyZtUJuj+fC4lApDs6xi375atZhi6x1ym9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED163606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED163606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4fb73e868aaso4119735b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:57:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779850; x=1795384650;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCxx5RHXq7WPqDK7xKRDc6BR9/+tnHIZsgY3LJnVcoU=;
        b=yuyBZ8h93B4/7cHQyI7rZ/bjIzEX6mJYyazxFhSUcpahUASJdKI+pua+8bGW9IYSZT
         s5hTuZUcWoUR0+fpSAsBG9CveKLPbQw3GxC+y5wbE6lczViM3pHArFM3MSJo8fUC3vIv
         8emtzpRF+4p8AQka33lJ8zmn/js+O47z+F5yPyiVk0ahoI29hiz41ByUs2QQ9n2tAD/a
         SX6jOzEq8fMIhEOv7PMiPhCL6J+OciR60NXwogRxOGOjwS5CDFiu7+sdAcCxqpjcfRLk
         RFDrZCv1CGFJEo6Hy6OI2LrRtWJagR2Xm/gm+nG86kR2RbZZLlNgao9ZMa3U8Z2SOBfS
         QADg==
X-Forwarded-Encrypted: i=1; AL+hErEz9lVTSmG3NB39yBavshueBH5hLN5sdsqoZRrXq2VxQsTp1LKJr0VTbd5xO1LT6ddGS8+x2W54Uo1RmRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P7JqG9WcblUkPEnxcbyhA1qoY6ZEBwKPExGyGomL4u43EJWTT
	Z4lDLxw64aVVSYTiMO/4oQYSUCC2+dzWOWuhSCzE0ZGTJ9DkxZ5+H3hxgBVsRa0pDtEn5Wv6jCP
	Vph0DttJGW+lyYAqGZYPs7hWax9WrjjcN96aztdBm67UHdcm62JJzicaNquA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:811b:b0:572:878:fccf with SMTP id
 5614622812f47-5720878fd52mr3149115b6e.59.1794779849999; Sun, 15 Nov 2026
 13:57:29 -0800 (PST)
Date: Sun, 15 Nov 2026 13:57:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afa2ac9.920b2b3a.148c65.003f.GAE@google.com>
Subject: [syzbot] [squashfs?] general protection fault in step_into_slowpath
From: syzbot <syzbot+d393ed2b27449be4992b@syzkaller.appspotmail.com>
To: brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phillip@squashfs.org.uk, 
	squashfs-devel@lists.sourceforge.net, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    84abb955b101 Add linux-next specific files for 20261113
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=16da293d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d9d5eeb0ba036071
dashboard link: https://syzkaller.appspot.com/bug?extid=d393ed2b27449be4992b
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=132b7fa5580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12dfd4d9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ffae1d4a717e/disk-84abb955.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fd2a35a63abf/vmlinux-84abb955.xz
kernel image: https://storage.googleapis.com/syzbot-assets/039ccf647778/bzImage-84abb955.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/39a0c2b38acc/mount_1.gz

AI-generated root cause summary:
In squashfs_lookup() (fs/squashfs/namei.c), the local variable int err is
declared uninitialized and receives a positive return value (number of bytes
read) from preceding successful calls to squashfs_read_metadata(). When
directory boundary checks via squashfs_dir_space() fail, execution jumps
directly to the read_failure label rather than data_error (which sets err =
-EIO). Consequently, squashfs_lookup() returns ERR_PTR(err) holding a small
positive integer (e.g., (struct dentry *)0x6) or uninitialized stack data, which
VFS path resolution treats as a valid dentry pointer and subsequently
dereferences at offset 0 (d_flags) in traverse_mounts(), causing a kernel crash.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=d393ed2b27449be4992b

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d393ed2b27449be4992b@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 8
SQUASHFS error: Unable to read directory block [0:26]
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 5644 Comm: syz-executor134 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
RIP: 0010:traverse_mounts fs/namei.c:1665 [inline]
RIP: 0010:handle_mounts fs/namei.c:1777 [inline]
RIP: 0010:step_into_slowpath+0x112/0x810 fs/namei.c:2146
Code: 24 1f 00 49 bf 00 00 00 00 00 fc ff df 43 0f b6 04 3c 84 c0 0f 85 75 05 00 00 45 8b 75 00 4c 8b 6c 24 48 4c 89 e8 48 c1 e8 03 <42> 0f b6 04 38 84 c0 0f 85 76 05 00 00 45 8b 6d 00 44 89 ee 81 e6
RSP: 0018:ffffc90003ba7a40 EFLAGS: 00010247
RAX: 0000000000000000 RBX: ffffc90003ba7c20 RCX: ffff888037d43e80
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90003ba7af0 R08: ffff888078fd331f R09: 1ffff1100f1fa663
R10: dffffc0000000000 R11: ffffed100f1fa664 R12: 1ffff92000774f8b
R13: 0000000000000006 R14: 0000000000000001 R15: dffffc0000000000
FS:  0000555564c07400(0000) GS:ffff8881234cd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff34166e74 CR3: 000000007b074000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 step_into fs/namei.c:2194 [inline]
 walk_component fs/namei.c:2331 [inline]
 lookup_last fs/namei.c:2839 [inline]
 path_lookupat+0x433/0x8c0 fs/namei.c:2864
 filename_lookup+0x265/0x5d0 fs/namei.c:2893
 user_path_at+0x40/0x160 fs/namei.c:3692
 do_mount fs/namespace.c:4467 [inline]
 __do_sys_mount fs/namespace.c:4683 [inline]
 __se_sys_mount+0x2dc/0x420 fs/namespace.c:4660
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x00007fdbf37e4949
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff0f8baee8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007fdbf37e4949
RDX: 0000000000000000 RSI: 00002000000000c0 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000004000 R11: 0000000000000246 R12: 00007fff0f8baf20
R13: 0000000000000002 R14: 431bde82d7b634db R15: 00007fdbf384404b
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:traverse_mounts fs/namei.c:1665 [inline]
RIP: 0010:handle_mounts fs/namei.c:1777 [inline]
RIP: 0010:step_into_slowpath+0x112/0x810 fs/namei.c:2146
Code: 24 1f 00 49 bf 00 00 00 00 00 fc ff df 43 0f b6 04 3c 84 c0 0f 85 75 05 00 00 45 8b 75 00 4c 8b 6c 24 48 4c 89 e8 48 c1 e8 03 <42> 0f b6 04 38 84 c0 0f 85 76 05 00 00 45 8b 6d 00 44 89 ee 81 e6
RSP: 0018:ffffc90003ba7a40 EFLAGS: 00010247
RAX: 0000000000000000 RBX: ffffc90003ba7c20 RCX: ffff888037d43e80
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90003ba7af0 R08: ffff888078fd331f R09: 1ffff1100f1fa663
R10: dffffc0000000000 R11: ffffed100f1fa664 R12: 1ffff92000774f8b
R13: 0000000000000006 R14: 0000000000000001 R15: dffffc0000000000
FS:  0000555564c07400(0000) GS:ffff8881234cd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff34166e74 CR3: 000000007b074000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	24 1f                	and    $0x1f,%al
   2:	00 49 bf             	add    %cl,-0x41(%rcx)
   5:	00 00                	add    %al,(%rax)
   7:	00 00                	add    %al,(%rax)
   9:	00 fc                	add    %bh,%ah
   b:	ff                   	lcall  (bad)
   c:	df 43 0f             	filds  0xf(%rbx)
   f:	b6 04                	mov    $0x4,%dh
  11:	3c 84                	cmp    $0x84,%al
  13:	c0 0f 85             	rorb   $0x85,(%rdi)
  16:	75 05                	jne    0x1d
  18:	00 00                	add    %al,(%rax)
  1a:	45 8b 75 00          	mov    0x0(%r13),%r14d
  1e:	4c 8b 6c 24 48       	mov    0x48(%rsp),%r13
  23:	4c 89 e8             	mov    %r13,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	0f 85 76 05 00 00    	jne    0x5ad
  37:	45 8b 6d 00          	mov    0x0(%r13),%r13d
  3b:	44 89 ee             	mov    %r13d,%esi
  3e:	81                   	.byte 0x81
  3f:	e6                   	.byte 0xe6


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

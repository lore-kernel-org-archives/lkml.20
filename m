Received: from mail-oi2-f2.google.com (mail-oi2-f2.google.com [74.125.231.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B129C328
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787808745; cv=none; b=Bq46eh5JCyXlvH1fUOaAhKuu10LAmbTSL4uS0t27okU9uSnNxn5DAvbSyf9BAddBBqLquDrYxwV4p66hOT9JTWD5VyaItWWE5nDS+c8hoZAtfe/8YUzJ+r3o9JDcDGsRYsbbN13KEI0iWGJPasbvzmr+EncfulqmfqkzkkEiNG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787808745; c=relaxed/simple;
	bh=F9+kxZcybaa3yktrfGDF5R3au8Wgaoled6O9QUnzRmg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PsAial3geEFMBnHzyz/+ox2lWexY9ZNjj9jQii8vbmmF3qPKnx61/0pQZQ+iKF96wszcvh38bpccSJNMqpVxpXRlnL+VzSYnB+nYkhFbInovEK0zsRr1acVyCilQ8EnEGilSZLYaC08drzNkOLjaikDNuf27dukqLkDp5wTsNsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f2.google.com with SMTP id 5614622812f47-495d5d27acfso696046b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787808742; x=1788413542;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UUwarUZr5iEKBMrbOeqU7GlflMYBi4OZtGxugyDXwnQ=;
        b=ix78DXpGZc3ixCzs7BM3vVC/QUxLwiVBTKoNXdSDDrUIUC8k31EZOiyD5X10EbAU05
         PNsvOJkPICgT6tjlw8X9rYMY59rYDo9QJc7CzQKG+1f2LKKKelVGfJ3UYmSRrP+elf8Y
         L+HAiAcgI2c4JaH0zLxJKVP678gw+lIzP+o2VQogTblTQllGV7q/qXdamREoSZUmfdYz
         HOaiJSM44U8pWtHrkr9V+uX63irfFmoXPockICJI6yRRmdEfEouOuVPa9AAeTU0Dpmg8
         ETPKuz80FemfrsYlPCkDakfpLbkZH59wYJXu0qW0MvgwCc2ioQdJMA4REaNLPVCf4uix
         oYtw==
X-Forwarded-Encrypted: i=1; AHgh+RpKkd9NLoS+C3BoTHwOD+6PvP4GoFW/pPCzvitMim1hOKU50SbjDA+148pBhx2wJvs6ndNbGJP0MRJN4WI=@vger.kernel.org
X-Gm-Message-State: AFuF++kUi2XOAZfZ4CevNVeYGxEuU7RjteMb32/pn6AFMsEL00bDLSDv
	fRv6rVBtBBbCrkJtSWQ8fo8EE0C/+bCNMzmb7LPvnCFw1ED292da7NHcoQCCsWQ87nMLM+DPuiH
	mIMFh5AIpHOVba0eRI7Iy4lvd8539ylXQgjwo/JpNng3UFZmZ4PNCuWB8iPE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5293:b0:492:3ed0:9073 with SMTP id
 5614622812f47-4b36686f368mr15853833b6e.4.1787808742497; Wed, 26 Aug 2026
 22:32:22 -0700 (PDT)
Date: Wed, 26 Aug 2026 22:32:22 -0700
In-Reply-To: <6a778cfb.9c11d2ce.289b96.00b8.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8fcbe6.4d659fcc.734b4.000a.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] general protection fault in al_destroy
From: syzbot <syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    502d45774af0 Merge tag 'clk-for-linus' of git://git.kernel..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=13166d49580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dfd8ec781284be4e
dashboard link: https://syzkaller.appspot.com/bug?extid=04cf7b83f6dd2c3a54c8
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17d04579580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=127e5625580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fb0ebb231418/disk-502d4577.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/82fe4e8c3ba9/vmlinux-502d4577.xz
kernel image: https://storage.googleapis.com/syzbot-assets/40eb9f92a77c/bzImage-502d4577.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/63d316385c91/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com

         option from the mount to silence this warning.
=======================================================
ntfs3(loop0): Different NTFS sector size (1024) and media sector size (512).
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000042: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000210-0x0000000000000217]
CPU: 0 UID: 0 PID: 5627 Comm: syz-executor424 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:run_close fs/ntfs3/ntfs_fs.h:1034 [inline]
RIP: 0010:al_destroy+0x49/0xc0 fs/ntfs3/attrlist.c:33
Code: 02 00 00 48 89 d8 48 c1 e8 03 42 80 3c 38 00 74 08 48 89 df e8 88 e5 06 ff 48 8b 1b 4c 8d b3 10 02 00 00 4c 89 f0 48 c1 e8 03 <42> 80 3c 38 00 74 08 4c 89 f7 e8 68 e5 06 ff 48 8b bb 10 02 00 00
RSP: 0018:ffffc9000387f960 EFLAGS: 00010216
RAX: 0000000000000042 RBX: 0000000000000000 RCX: ffff888075ce5dc0
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff888070090e20
RBP: 0000000000000001 R08: ffffffff907a0d7f R09: 1ffffffff20f41af
R10: dffffc0000000000 R11: fffffbfff20f41b0 R12: ffff888070091070
R13: dffffc0000000000 R14: 0000000000000210 R15: dffffc0000000000
FS:  0000555571c6a400(0000) GS:ffff888124ce3000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f0e9a7a2000 CR3: 00000000217c4000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 ni_clear+0x5d/0x630 fs/ntfs3/frecord.c:110
 evict+0x624/0xb50 fs/inode.c:822
 ntfs_new_inode+0x8c/0x120 fs/ntfs3/fsntfs.c:1719
 ntfs_create_inode+0x6e7/0x3420 fs/ntfs3/inode.c:1520
 ntfs_mkdir+0x37/0x50 fs/ntfs3/namei.c:234
 vfs_mkdir+0x40c/0x620 fs/namei.c:5410
 filename_mkdirat+0x285/0x510 fs/namei.c:5443
 __do_sys_mkdirat fs/namei.c:5464 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5461
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f82637ada69
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcfa0d5d78 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f82637ada69
RDX: 00000000000001ff RSI: 0000200000000040 RDI: 00000000ffffff9c
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000555571c6b570
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffcfa0d5da0
R13: 0000000000000002 R14: 431bde82d7b634db R15: 00007f826380d04b
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:run_close fs/ntfs3/ntfs_fs.h:1034 [inline]
RIP: 0010:al_destroy+0x49/0xc0 fs/ntfs3/attrlist.c:33
Code: 02 00 00 48 89 d8 48 c1 e8 03 42 80 3c 38 00 74 08 48 89 df e8 88 e5 06 ff 48 8b 1b 4c 8d b3 10 02 00 00 4c 89 f0 48 c1 e8 03 <42> 80 3c 38 00 74 08 4c 89 f7 e8 68 e5 06 ff 48 8b bb 10 02 00 00
RSP: 0018:ffffc9000387f960 EFLAGS: 00010216
RAX: 0000000000000042 RBX: 0000000000000000 RCX: ffff888075ce5dc0
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff888070090e20
RBP: 0000000000000001 R08: ffffffff907a0d7f R09: 1ffffffff20f41af
R10: dffffc0000000000 R11: fffffbfff20f41b0 R12: ffff888070091070
R13: dffffc0000000000 R14: 0000000000000210 R15: dffffc0000000000
FS:  0000555571c6a400(0000) GS:ffff888124ce3000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f0e9a7a2000 CR3: 00000000217c4000 CR4: 0000000000350ef0
----------------
Code disassembly (best guess):
   0:	02 00                	add    (%rax),%al
   2:	00 48 89             	add    %cl,-0x77(%rax)
   5:	d8 48 c1             	fmuls  -0x3f(%rax)
   8:	e8 03 42 80 3c       	call   0x3c804210
   d:	38 00                	cmp    %al,(%rax)
   f:	74 08                	je     0x19
  11:	48 89 df             	mov    %rbx,%rdi
  14:	e8 88 e5 06 ff       	call   0xff06e5a1
  19:	48 8b 1b             	mov    (%rbx),%rbx
  1c:	4c 8d b3 10 02 00 00 	lea    0x210(%rbx),%r14
  23:	4c 89 f0             	mov    %r14,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	4c 89 f7             	mov    %r14,%rdi
  34:	e8 68 e5 06 ff       	call   0xff06e5a1
  39:	48 8b bb 10 02 00 00 	mov    0x210(%rbx),%rdi


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

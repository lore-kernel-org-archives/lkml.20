Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9057B433023
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824916; cv=none; b=ujywO+WvV+GhGQEWG9YbHJBSibjsXignJJxhoPtMwM5/5UKyBapmi42yfXpLoxI2idAteOVYRe3Nat8gqflvKfO5Cqez00tUlM882/ljPPbrKlJBhosQoLy2ehFe04eSNDWrNOVRkcOjoZ+hNc+Zmcfkfq1/TcLaMqbQkVhye40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824916; c=relaxed/simple;
	bh=I2UxVqnUMxqBttfwSZuxKb/HfiKzNKwHdIC51fVMcvA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Dqg2u8CS1y4U1ft+WrqAgH1TskZGYD2LJa0ftB2tIfefMWs3rmVSMlvgXk6wjwQbFQAd8Uhgi6i1WcxCdKAwfKU8M4j6WYJrcE7e3Fh3puBTr4CGT57Q5Bgrz4hnZeYBntMHTzanK96w4olqL6OyGNYjQEHKPteCi9tAkdlHZVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b1bd347d5fso729876b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787824897; x=1788429697;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R6UFQvd1bT1vBA63lRimBceODwUNnha0O+AxBrpYclw=;
        b=d5HP+ZLYO39WcScd4RsqmUe5vanKuyGMU3c/W9k8Gdzy6BKsI/c1vkzxL2YmeD2bLi
         fIq0TGveWYMjhYEJiqW53PckFUISyRJuqijMyKvlLdMpJs/KphjbgxNu5ujxH8cBrn7a
         EgpJ/oZoUko3Y1yiUttZ/LmdqWHRcOXxlBiFYgeQyoaPjxLChKUWL4SvNeP1f+ihyqJW
         bzDwL2qESsTeN/UOX7CcgumilRwnIMCytEarwRaYtZ1ZvelqrJ4J9+82BkDEI67c0acW
         3zKwrPaYxCVVZzvbs53vecHqNdOS82kwO9/Ln1ymcDypkntEorZ1StTK9aCK3GUMFvO2
         5aDg==
X-Forwarded-Encrypted: i=1; AHgh+RqBOaxLzyDxU+m6u6M5Vr6qJROM6of/sHP4JtPVRXpGNNIu1Do7HihoAORHgOgn3vy/+MVQudCRpL1J0M4=@vger.kernel.org
X-Gm-Message-State: AFuF++n77ujPHRldMtdvZkPwDe4zxV7fQ4QDjJqzHxnTzmr0msSi7gcf
	G/yclR7oTZJk8ujcFIodQK/EJvIHgNdzzUHbK+dV+kIg/JOAYWNJYF3CTHGm26Cx0eBusJ28K//
	xHBsuUawvD/U1PQ/hKQhGV1wo3M0fvNisE52M6CZ8NZ6ZAwpxabjnAzH6nfw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:17a4:b0:4b2:8dbe:b596 with SMTP id
 5614622812f47-4b3668b9b23mr13234696b6e.2.1787824896768; Thu, 27 Aug 2026
 03:01:36 -0700 (PDT)
Date: Thu, 27 Aug 2026 03:01:36 -0700
In-Reply-To: <6a8faf18.4d659fcc.734b4.0009.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a900b00.1d9ded08.62e62.00cf.GAE@google.com>
Subject: Re: [syzbot] [nvme?] KASAN: slab-use-after-free Read in nvmet_port_subsys_allow_link
From: syzbot <syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com>
To: hch@lst.de, kch@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, sagi@grimberg.me, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1458e579580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=b0996ac2197dd7420c3e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11ab6d49580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000022: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000110-0x0000000000000117]
CPU: 2 UID: 0 PID: 6022 Comm: syz-executor823 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:nvmet_port_subsys_allow_link+0x108/0x390 drivers/nvme/target/configfs.c:1076
Code: 00 00 4d 89 66 10 48 c7 c7 e0 d9 f3 8f 4d 8d af 10 01 00 00 e8 29 aa 1f 05 4c 89 ea 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f 85 f0 01 00 00 49 8b 9f 10 01 00 00 4c 39 eb 0f 84
RSP: 0018:ffffc9000283fc88 EFLAGS: 00010206

RAX: dffffc0000000000 RBX: ffff8880271f8498 RCX: 0000000000000000
RDX: 0000000000000022 RSI: 0000000000000008 RDI: 0000000000000001
RBP: ffffffff8ff44260 R08: 0000000000000001 R09: fffffbfff1fe7b3d
R10: ffffffff8ff3d9ef R11: 0000000000000000 R12: ffff88802c543000
R13: 0000000000000110 R14: ffff88803dc39b80 R15: 0000000000000000
FS:  00007f53b85796c0(0000) GS:ffff8880d5da2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f53b5572ff8 CR3: 0000000055990000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 configfs_symlink+0x540/0x11f0 fs/configfs/symlink.c:196
 vfs_symlink fs/namei.c:5794 [inline]
 vfs_symlink+0x178/0x4d0 fs/namei.c:5773
 filename_symlinkat+0x2a6/0x560 fs/namei.c:5819
 __do_sys_symlinkat fs/namei.c:5839 [inline]
 __se_sys_symlinkat fs/namei.c:5834 [inline]
 __x64_sys_symlinkat+0x9c/0xe0 fs/namei.c:5834
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f53b85ae459
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f53b85791f8 EFLAGS: 00000246
 ORIG_RAX: 000000000000010a
RAX: ffffffffffffffda RBX: 00007f53b861b028 RCX: 00007f53b85ae459
RDX: 00007f53b861b028 RSI: 00000000ffffff9c RDI: 00007f53b861b060
RBP: 00007f53b861b060 R08: 00007f53b85796c0 R09: 00007f53b85796c0
R10: 00007f53b85796c0 R11: 0000000000000246 R12: ffffffffffffffd0
R13: 0000000000000010 R14: 00007ffff5cb1e50 R15: 00007ffff5cb1f38
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:nvmet_port_subsys_allow_link+0x108/0x390 drivers/nvme/target/configfs.c:1076
Code: 00 00 4d 89 66 10 48 c7 c7 e0 d9 f3 8f 4d 8d af 10 01 00 00 e8 29 aa 1f 05 4c 89 ea 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f 85 f0 01 00 00 49 8b 9f 10 01 00 00 4c 39 eb 0f 84
RSP: 0018:ffffc9000283fc88 EFLAGS: 00010206

RAX: dffffc0000000000 RBX: ffff8880271f8498 RCX: 0000000000000000
RDX: 0000000000000022 RSI: 0000000000000008 RDI: 0000000000000001
RBP: ffffffff8ff44260 R08: 0000000000000001 R09: fffffbfff1fe7b3d
R10: ffffffff8ff3d9ef R11: 0000000000000000 R12: ffff88802c543000
R13: 0000000000000110 R14: ffff88803dc39b80 R15: 0000000000000000
FS:  00007f53b85796c0(0000) GS:ffff8880d5da2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f53b5572ff8 CR3: 0000000055990000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	00 00                	add    %al,(%rax)
   2:	4d 89 66 10          	mov    %r12,0x10(%r14)
   6:	48 c7 c7 e0 d9 f3 8f 	mov    $0xffffffff8ff3d9e0,%rdi
   d:	4d 8d af 10 01 00 00 	lea    0x110(%r15),%r13
  14:	e8 29 aa 1f 05       	call   0x51faa42
  19:	4c 89 ea             	mov    %r13,%rdx
  1c:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  23:	fc ff df
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 f0 01 00 00    	jne    0x224
  34:	49 8b 9f 10 01 00 00 	mov    0x110(%r15),%rbx
  3b:	4c 39 eb             	cmp    %r13,%rbx
  3e:	0f                   	.byte 0xf
  3f:	84                   	.byte 0x84


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

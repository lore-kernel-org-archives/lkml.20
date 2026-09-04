Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ACE23BD1B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559355; cv=none; b=oRgVFaiPqQJKuzTkrxCoQNBcrg7NKfyJHGBNCCbLKJtgno6isD+DLTMT9CV0aCB+n1jRqrdbGflUc3lmFHxC0KwPPmHeLGw6EhH0825ASVOaca0YAUtSwp+kT6RyYEgvjpKnK4vYWzCy2PyZVQ+QZj6nYgTUY4i2T7v1FgbH+LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559355; c=relaxed/simple;
	bh=/UB7KxafzSHelLgifdLGMBOQlfEohDcAGVoZa3B1anU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kDyd2eU0dftmN9+6ZqWD+8p2g90PXTItM6t9iP8RYnVc6QhWJ6wgo9ieXYNIyqIS6TtoUoJtm8I21nZGRXkzbLT4W9FhtOxF585QcFSvC9rvsLheBECSaVPujodeH4McUacBMEMm/r0kixOBimvTpfCyKJaHt+baq05S+xDsdr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f7.google.com with SMTP id 006d021491bc7-6b1bebb3ae8so359907eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788559353; x=1789164153;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CU5lSdQw/QhWdx4Ggq/AR0+1tQNp85A0+KZEPTol3KI=;
        b=JvXwHDfIUJRSJRQrd0CtMXlrESCSGA+RAw5Qk+HnJvTXP3W3MLoHVp+CG/sbpNnFVp
         +PeV8nMZY5CTleqjopD5M+rkWlcywyJAQ5qDKUnOrBJMju1LDe7J19503X3OfjP0RjSh
         kSHlK8JiLuYoeBIfAsC20dt7ogrnvce9NPErZXAyJ46d2oGHltkaakCFJ7TRp86965ym
         DmHgBV23QaWnFEV+6bi5JS5wssAKitNvBw+F4oFhemU/oP+yq6bGwixVchUFuDq0DClb
         HkO+vJt7VeLeshBXK1lTKXLSY7ZW8mMLe6aIMv2xxFU41c/lJzc9ceRenaAKCQuYDhgX
         VNGw==
X-Forwarded-Encrypted: i=1; AKwUvByhmjUCNsig88imOYNIbiqtkP8zrLH+RDYGd8JG4/AMpf5/kOApwl+c0kwMhG0pSGr725lmuvVJ3m/M0X4=@vger.kernel.org
X-Gm-Message-State: AFuF++n7xZBhlfhhHfaQo6wqbA1ItgXknBnvE1JCljU1Na5lgmuC9WJT
	8l3Rr+QNOtzve6/nWFt1x6WTO5SD+99ePHhQlEu3eGF/ESEe5ac8Nr+qDm0zn85Gzj7l7x0M3Im
	5z1Ql2pXvN8Dqeee26S4HnKoOiYafDor+W7tJmhUsKlqSg6OyQOpMKxDQuuM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2005:b0:6b6:4f90:a62a with SMTP id
 006d021491bc7-6b6fc7d4063mr9281637eaf.11.1788559352858; Fri, 04 Sep 2026
 15:02:32 -0700 (PDT)
Date: Fri, 04 Sep 2026 15:02:32 -0700
In-Reply-To: <699ae98c.050a0220.340abe.0d31.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9b3ff8.04649fcc.10325f.0005.GAE@google.com>
Subject: Re: [syzbot] [kernel?] WARNING in __ioremap_caller
From: syzbot <syzbot+49b1021becba70c1f3f6@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, luto@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, syzkaller-bugs@googlegroups.com, tglx@kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    bc35965f6940 Merge tag 'mm-hotfixes-stable-2026-09-03-17-4..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=164e88f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=49b1021becba70c1f3f6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16bca8f9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16a09215580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-bc35965f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9eaaad19cc52/vmlinux-bc35965f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b6466cfeb6f0/bzImage-bc35965f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+49b1021becba70c1f3f6@syzkaller.appspotmail.com

------------[ cut here ]------------
ioremap on RAM at 0x000000001bf67000 - 0x000000001bf67fff
WARNING: arch/x86/mm/ioremap.c:216 at __ioremap_caller.isra.0+0x4c2/0x5f0 arch/x86/mm/ioremap.c:216, CPU#2: syz.0.17/5915
Modules linked in:
CPU: 2 UID: 0 PID: 5915 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__ioremap_caller.isra.0+0x4d3/0x5f0 arch/x86/mm/ioremap.c:216
Code: 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc e8 45 cb 50 00 48 8d 3d 2e 85 8d 0f 48 8d 84 24 c0 00 00 00 48 8d 54 24 60 48 8d 70 c0 <67> 48 0f b9 3a eb 89 41 83 ff 04 75 32 e8 1b cb 50 00 bf 04 00 00
RSP: 0018:ffffc900036478a0 EFLAGS: 00010293
RAX: ffffc90003647960 RBX: 1ffff920006c8f18 RCX: 0000000000000000
RDX: ffffc90003647900 RSI: ffffc90003647920 RDI: ffffffff9147f620
RBP: 0000000000001000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000001
R13: 000000001bf67000 R14: 0000000000000002 R15: 000000001bf67000
FS:  0000000000000000(0000) GS:ffff888096b64000(0063) knlGS:0000000056c88480
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 0000000000000018 CR3: 000000005eb62000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 generic_access_phys+0x130/0x4d0 mm/memory.c:7178
 kernfs_vma_access+0x1ce/0x280 fs/kernfs/file.c:437
 __access_remote_vm+0x58f/0x890 mm/memory.c:7256
 mem_rw+0x2a1/0x670 fs/proc/base.c:912
 do_loop_readv_writev fs/read_write.c:848 [inline]
 do_loop_readv_writev fs/read_write.c:836 [inline]
 vfs_readv+0x5d8/0x8d0 fs/read_write.c:1021
 do_readv+0x13e/0x340 fs/read_write.c:1081
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x13a/0x8b0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf7f14fec
Code: Unable to access opcode bytes at 0xf7f14fc2.
RSP: 002b:00000000ffc02c5c EFLAGS: 00000296 ORIG_RAX: 0000000000000091
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000080000100
RDX: 0000000000000002 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
----------------
Code disassembly (best guess):
   0:	41 5c                	pop    %r12
   2:	41 5d                	pop    %r13
   4:	41 5e                	pop    %r14
   6:	41 5f                	pop    %r15
   8:	c3                   	ret
   9:	cc                   	int3
   a:	cc                   	int3
   b:	cc                   	int3
   c:	cc                   	int3
   d:	e8 45 cb 50 00       	call   0x50cb57
  12:	48 8d 3d 2e 85 8d 0f 	lea    0xf8d852e(%rip),%rdi        # 0xf8d8547
  19:	48 8d 84 24 c0 00 00 	lea    0xc0(%rsp),%rax
  20:	00
  21:	48 8d 54 24 60       	lea    0x60(%rsp),%rdx
  26:	48 8d 70 c0          	lea    -0x40(%rax),%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	eb 89                	jmp    0xffffffba
  31:	41 83 ff 04          	cmp    $0x4,%r15d
  35:	75 32                	jne    0x69
  37:	e8 1b cb 50 00       	call   0x50cb57
  3c:	bf                   	.byte 0xbf
  3d:	04 00                	add    $0x0,%al


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

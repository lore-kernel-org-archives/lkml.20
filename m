Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1A73E558F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384945; cv=none; b=hIHbGl7jRV2T///Dj80BbpRvdo5l1n8LEQ2ukhI5/SFBW5m9/V5EtIdOZmj+/bH/f6m/oEHAbHyXDlKJQ1iveK3jPbpfIsT8dKXwrxMSFTMssKz2porpscj8nwsDpoz6kBBIo9myjB/UqW/byh4EH0W5GRt3yl7avHBaha3D0tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384945; c=relaxed/simple;
	bh=EnjATsekwhf3qDkZL0ud7uYf+nkGtIj7ulGZr82BrKE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AM+5roSs/Y/IWtMKBqJbocFzfzsUvzXiTDgWdunHRRCKT65pvbzUQGCfaHux7yjOYQS50hBNoZpn3g1xzwSe0sOUIsYoCLoSMfigd53vW064i1lOR78N/S+9O6wqmBJOQ5HrJolxviWgF9y2IWmvRER3nK857LyR1YBE3+LOiNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-4489b7aa0e7so330878fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788384938; x=1788989738;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z/JGNWxV8bK25k1HiaGt3SwTKzs4RSXT7cEloNky6KY=;
        b=I/O0n9i17N+wITnFNWRhseGa3wKz35EMDzx4Dx1phzhT8P03TyyNJLUe6iV/PXzp+I
         7PTtAUlegHqC99FVcAIBfUHAqKDCFojOImLv8MCTDqeEa4SZu9nJnwLFD0XssasWzyj/
         msp7A1mq/9uJwue7jswbJ8Xzr/y8gyZ51SGtzVb4xVaK9YzQGIerpFYtsnpeguzdW4+S
         dnDE3WMkljOZZmCJWiTeHgKKYRrFUNTIP0eNq/ER9C1Icwp/g4HRfrFKbOp7JqOSbUnq
         n3fBSOfMfBKdov4BBTFDBuFwigQsHJOzE0f2Cz9D2ZfIvdYewPfqWi/Wo7eEGA7pBStS
         ZHlg==
X-Forwarded-Encrypted: i=1; AHgh+Rolr8ees3CG8AzVo72zTxulMvMH+c0yxheScuO7YVPfrbx9xogCePW/YsbHDCcu48cWnmmOnUjaU2c/r/A=@vger.kernel.org
X-Gm-Message-State: AFuF++ni4i/OBsT0K+4KPVfJuqHS+IAeqt6MyuYpd4fdBUZ41jCOR+uk
	qGpEdTshoCoXQ2X7f6GpoohcCDyNltRlvv3Q0ISQj3GShMi+cVzp0+SdCgqfyAJe05glNyYChnB
	Ot5NWgRyc9CAQ6FhLuZ7+ohqqJ9QE0ls5e2UkaEqI11geeI9TFakh5FWRkVU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81ce:b0:6b3:60cc:6add with SMTP id
 006d021491bc7-6b47dabc8f0mr6234814eaf.13.1788384938263; Wed, 02 Sep 2026
 14:35:38 -0700 (PDT)
Date: Wed, 02 Sep 2026 14:35:38 -0700
In-Reply-To: <6a87853b.ae6ddae5.3da009.0023.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9896aa.e163c37b.143a1.000d.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in vma_set_pgoff
From: syzbot <syzbot+f12658786a4153df5113@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, jannh@google.com, kunwu.chan@gmail.com, 
	kunwu.chan@linux.dev, liam@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lixinhai.lxh@gmail.com, ljs@kernel.org, pfalcato@suse.de, 
	stable@vger.kernel.org, syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    89a312991dc6 Merge tag 'cifs-fixes-7.3-rc2' of https://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=101ab0f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=f12658786a4153df5113
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=151ec39e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1761ef79580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9e57f69218a4/disk-89a31299.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c6ae7c71d018/vmlinux-89a31299.xz
kernel image: https://storage.googleapis.com/syzbot-assets/82fb8eee8abf/bzImage-89a31299.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f12658786a4153df5113@syzkaller.appspotmail.com

------------[ cut here ]------------
pgoff != vma->vm_start >> 12
WARNING: mm/vma.h:277 at assert_sane_pgoff mm/vma.h:277 [inline], CPU#1: syz.0.17/5876
WARNING: mm/vma.h:277 at vma_set_pgoff+0x246/0x2d0 mm/vma.h:283, CPU#1: syz.0.17/5876
Modules linked in:
CPU: 1 UID: 0 PID: 5876 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:assert_sane_pgoff mm/vma.h:277 [inline]
RIP: 0010:vma_set_pgoff+0x246/0x2d0 mm/vma.h:283
Code: 0b 90 e9 d5 fe ff ff e8 d8 99 9f ff 4c 89 f7 e8 30 09 00 ff c6 05 5d 78 3b 0e 01 90 0f 0b 90 e9 fe fe ff ff e8 bb 99 9f ff 90 <0f> 0b 90 eb 9d 44 89 f9 80 e1 07 80 c1 03 38 c1 0f 8c eb fd ff ff
RSP: 0018:ffffc900032af448 EFLAGS: 00010293
RAX: ffffffff82282165 RBX: 0000000000080004 RCX: ffff8880124c8000
RDX: 0000000000000000 RSI: 0000000000080ffe RDI: 0000000000080004
RBP: 0000000000000007 R08: ffff8880734021c3 R09: 1ffff1100e680438
R10: dffffc0000000000 R11: ffffed100e680439 R12: 0000000000000001
R13: dffffc0000000000 R14: ffff888073402140 R15: 0000000000080ffe
FS:  0000000000000000(0000) GS:ffff888124dda000(0063) knlGS:00000000576bb480
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00000000f7203200 CR3: 0000000079238000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 vma_add_pgoff+0x1a8/0x570 mm/vma.h:314
 __split_vma+0x89e/0xa60 mm/vma.c:607
 vms_gather_munmap_vmas+0x322/0x1370 mm/vma.c:1507
 do_vmi_align_munmap+0x2b4/0x4b0 mm/vma.c:1675
 do_vmi_munmap+0x252/0x2d0 mm/vma.c:1732
 shrink_vma mm/mremap.c:1421 [inline]
 mremap_at+0x233/0xba0 mm/mremap.c:1652
 do_mremap mm/mremap.c:2008 [inline]
 __do_sys_mremap mm/mremap.c:2064 [inline]
 __se_sys_mremap+0xf9f/0x12d0 mm/mremap.c:2032
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x27a/0x6a0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf7ff70ec
Code: 90 85 d2 74 0a 89 ce 81 e6 ff 0f 00 00 89 32 85 c0 74 05 c1 e9 0c 89 08 31 c0 5e 5d c3 90 0f 1f 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 58 b8
RSP: 002b:00000000ff97fafc EFLAGS: 00000206 ORIG_RAX: 00000000000000a3
RAX: ffffffffffffffda RBX: 0000000080ffd000 RCX: 0000000000002000
RDX: 0000000000001000 RSI: 0000000000000000 RDI: 0000000080ffe000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
----------------
Code disassembly (best guess):
   0:	90                   	nop
   1:	85 d2                	test   %edx,%edx
   3:	74 0a                	je     0xf
   5:	89 ce                	mov    %ecx,%esi
   7:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
   d:	89 32                	mov    %esi,(%rdx)
   f:	85 c0                	test   %eax,%eax
  11:	74 05                	je     0x18
  13:	c1 e9 0c             	shr    $0xc,%ecx
  16:	89 08                	mov    %ecx,(%rax)
  18:	31 c0                	xor    %eax,%eax
  1a:	5e                   	pop    %rsi
  1b:	5d                   	pop    %rbp
  1c:	c3                   	ret
  1d:	90                   	nop
  1e:	0f 1f 00             	nopl   (%rax)
  21:	51                   	push   %rcx
  22:	52                   	push   %rdx
  23:	55                   	push   %rbp
  24:	89 e5                	mov    %esp,%ebp
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
* 2a:	5d                   	pop    %rbp <-- trapping instruction
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	58                   	pop    %rax
  3f:	b8                   	.byte 0xb8


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3242E7165
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789423892; cv=none; b=Wn/1f8P6psXR39kPSxeaJYVdYv1OyuARAMBeaaxlwHwrzDHX0J9lMHCMeW+o+laTkqIg1bXsivkx12lc224qZD2rxq82tF5AC/jgdtY8+4ZgC3C8cTwWmFCpZvzr3QR95NE5EKuWDUImmHmfJB50u0P7Px6WLceY7sOByO+DYK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789423892; c=relaxed/simple;
	bh=e5RAATfyhjESjC/uxgbl7dPgMTC0naA31HH0MiRJh3I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hG81qEicwczBFuT2xS5R8lasH/Jc6yWeg75/QZHcBQ2aCnHKQjiqcWK/q6kkN4pcKXzSLavyUoQRczOQgGO9pniSKaT8h2JtyQ2VqvIkDmHVLvvwxWTU2XhriKnBrlPtYsQ3RY1rHGUkKY7ZQlmx7sAhkQJ/dA3icUa/5y5rH5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-80621978fddso1226386a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789423889; x=1790028689;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1uWe2rwRloVGBrfI0QTE0FaWD1UJMNNw9uIymjm/9Jc=;
        b=vjE61c2/BMaU2tvX5b5cqmZ386fMgHQ1Xmi+hWvJ/Z98rsDJvruPxOvOzE4PGUavVP
         wXsN5Uaneq1cHf0J+3N4pZNJlSMsYYjBtDnc5BYdYl6HoKmTub6olqU1fD4v9Gf6TV+A
         p6hgfEzzyvfRblRR3F9rm0eqg7WJhzlHAfiNJQudep5NypqNSn8waCWdgcYQ497fgufF
         fchlLCE/fRp82NTqDXvZQdVxc6VJGaG8cC8ZHVc8QGvkGfqNJlLfA3qxSAF42pTUhRuc
         WvncgjLSYhQbo6NKLU2ZYsAQgCW2j09xSFd4Be5Qy8wmb1Yu04u9m+0Yq6fuqLt1hlfG
         ruBg==
X-Forwarded-Encrypted: i=1; AKwUvBzVg+TvQQoAovUYv+0smtu+Ck3OnGMip0EWvxrMRe8YGFudN+LM3Hpa4AsKRhhCkvY0Qb6VspLiA+qGHJw=@vger.kernel.org
X-Gm-Message-State: AFuF++ntmrwD58bOxp0YHShxcpjSn6J03mqHgTQnS/+R2OtAZIhhltV0
	tofO5KlCGQ+SkU6NO2wyC3xGGcXp7OMgg1cg2ql3QbWaiP1+XhG9DrWNvTWyy2No3kZo/R9rBU8
	EUNpOWgjU5Qx61Lfla6o/NOfrwYiYuKkF8X2hychAv8l7khlzUKtbRksaWu4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:610:b0:6be:2c0f:e40b with SMTP id
 006d021491bc7-6c53f15bc1fmr2698790eaf.2.1789423889684; Mon, 14 Sep 2026
 15:11:29 -0700 (PDT)
Date: Mon, 14 Sep 2026 15:11:29 -0700
In-Reply-To: <6a6ecd0c.6ce73036.24301b.001c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa87111.f81106d8.2ab401.0057.GAE@google.com>
Subject: Re: [syzbot] [kernel?] BUG: unable to handle kernel paging request in write_comp_data
From: syzbot <syzbot+237f670105a254a230d4@syzkaller.appspotmail.com>
To: boqun@kernel.org, linux-kernel@vger.kernel.org, 
	mathieu.desnoyers@efficios.com, paulmck@kernel.org, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    704340f1cd0d Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13351925580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=237f670105a254a230d4
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11b875f9580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+237f670105a254a230d4@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: ffffc90003792fe8
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 1c000067 P4D 1c000067 PUD 1d695067 PMD 25aa1067 PTE 0
Oops: Oops: 0002 [#1] SMP KASAN NOPTI
CPU: 2 UID: 0 PID: 6034 Comm: syz-executor404 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:write_comp_data+0x7c/0xa0 kernel/kcov.c:263
Code: 00 8b bf 14 17 00 00 48 8b 30 48 c1 e7 03 4c 8d 1c b5 00 00 00 00 4a 8d 14 dd 28 00 00 00 48 39 d7 72 1b 48 83 c6 01 48 89 30 <4c> 89 44 10 e0 4c 89 4c 10 e8 4c 89 54 10 f0 4a 89 4c d8 20 e9 9b
RSP: 0018:ffffc900016cfec0 EFLAGS: 00010257
RAX: ffffc90003793000 RBX: 0000000000000000 RCX: ffffffff824af562
RDX: 0000000000000008 RSI: 0000000000000000 RDI: 0000000000002000
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: fffffffffffffffc R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  000055556039d400(0000) GS:ffff8880d5d59000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc90003792fe8 CR3: 0000000033822000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __do_sys_rseq kernel/rseq.c:549 [inline]
 __se_sys_rseq kernel/rseq.c:547 [inline]
 __x64_sys_rseq+0xc2/0x2e0 kernel/rseq.c:547
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4f6e875649
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffe975f1b8 EFLAGS: 00000246 ORIG_RAX: 000000000000014e
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f4f6e875649
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 00007f4f6e846000 R08: 0000000000000000 R09: 00000000000a8ca8
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fffe975f2e8
R13: 0000000000000002 R14: 00007f4f6e8f8cc0 R15: 0000000000000002
 </TASK>
Modules linked in:
CR2: ffffc90003792fe8
---[ end trace 0000000000000000 ]---
RIP: 0010:write_comp_data+0x7c/0xa0 kernel/kcov.c:263
Code: 00 8b bf 14 17 00 00 48 8b 30 48 c1 e7 03 4c 8d 1c b5 00 00 00 00 4a 8d 14 dd 28 00 00 00 48 39 d7 72 1b 48 83 c6 01 48 89 30 <4c> 89 44 10 e0 4c 89 4c 10 e8 4c 89 54 10 f0 4a 89 4c d8 20 e9 9b
RSP: 0018:ffffc900016cfec0 EFLAGS: 00010257
RAX: ffffc90003793000 RBX: 0000000000000000 RCX: ffffffff824af562
RDX: 0000000000000008 RSI: 0000000000000000 RDI: 0000000000002000
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: fffffffffffffffc R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  000055556039d400(0000) GS:ffff8880d5d59000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc90003792fe8 CR3: 0000000033822000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	00 8b bf 14 17 00    	add    %cl,0x1714bf(%rbx)
   6:	00 48 8b             	add    %cl,-0x75(%rax)
   9:	30 48 c1             	xor    %cl,-0x3f(%rax)
   c:	e7 03                	out    %eax,$0x3
   e:	4c 8d 1c b5 00 00 00 	lea    0x0(,%rsi,4),%r11
  15:	00
  16:	4a 8d 14 dd 28 00 00 	lea    0x28(,%r11,8),%rdx
  1d:	00
  1e:	48 39 d7             	cmp    %rdx,%rdi
  21:	72 1b                	jb     0x3e
  23:	48 83 c6 01          	add    $0x1,%rsi
  27:	48 89 30             	mov    %rsi,(%rax)
* 2a:	4c 89 44 10 e0       	mov    %r8,-0x20(%rax,%rdx,1) <-- trapping instruction
  2f:	4c 89 4c 10 e8       	mov    %r9,-0x18(%rax,%rdx,1)
  34:	4c 89 54 10 f0       	mov    %r10,-0x10(%rax,%rdx,1)
  39:	4a 89 4c d8 20       	mov    %rcx,0x20(%rax,%r11,8)
  3e:	e9                   	.byte 0xe9
  3f:	9b                   	fwait


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

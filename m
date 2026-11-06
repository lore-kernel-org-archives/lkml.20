Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979221;
	b=Ur7qwAgbIpTL6EBXggPy/JU1x3Dj1juPEY26E740Y8yMD/+eAY00WnuqezXEChRVPfLo
	 Ex3L3AUeusYjZRVxqnFx+EC9tekgYtn1iEVaOUFtT0ey8NbAu4yjsCvCJfJcA4kxdFqre
	 5nT9PsBDxytuixSS3MfvCDKKF0pR25uT7wiFb4RB6DGCBw+BCCFHWclFO3Ou3GKeqwItm
	 OYKWC25BOvx5+dG4hbrL8WMR+5XdJ8NYtg59FzxzI3efBWWOB6IpORJmhc4NqS/m5jUpX
	 10cb3Le6LXMhCGmHYzW1yp6/Ium91VJlksqoHrXvlnaDtd0Ykll/ipAvr/zCufmFPag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979221;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=N+c3mCCtwwdJ0beV8V8fiSYaFX8fBr6RjIsQyUPAIZs=;
	b=mW9XqMzMGtWBPBiugalT6LCeXQ4h2qAwKgCGmRakOd3S5ADjgvL5rjy+6NflqlFy+qRK
	 UlS6dsN48pRvR4IIAtgy3v94cLRLsN+x4ViKWbx2JhEVbsynJQBMM7Ani8yHQezpbs8zW
	 XQ2de5kjqpRy08uik23eBaZtYAXac+XO7LU3AtGMSzLGisR6v9JdHR3DDqq/kXhQ0N1TI
	 I0LxUoX8P9sInv6gNfCvOpwOTq074QkuJaK174OyLpCeOujbRdVJ3ZIB/mFt/Av5c3bEp
	 cdCAtKgFFl0CtzElpn1Bdby726RxaqJBvZEsn+8PR6PELGdm0hdN/4YKwSmEQsNuErA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B459606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B459606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5384e381fbbso558062b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979219; x=1794584019;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+c3mCCtwwdJ0beV8V8fiSYaFX8fBr6RjIsQyUPAIZs=;
        b=a2M0jn/sN7JgAGYAGaYw91A33RP0H/BcsgnI56K0GowQd1PofRtM8d6AdJVMzpcxn2
         J65tLVlhMHqlEeRyYRPnHOghY2geLjQ6DEchI6Jw7hz5A1P7D/110LzZJtEgx/DWVGNx
         fcrQjTtCvOEaUSCW03s8UXippF9jRhL6H+RaE2swM0vrAWtwxs28h8ywriJpyNnKuPVR
         2Oe6ybWQWdPDWvGs+f0AND8TpFShimq0apnzUGJjNCxPu5yAhedvzn0CkFYs0Qbyduhq
         5LNqFVT7KM1qslRXX0Vf2igXJPxLqhrrdA1YYcnHhza4PxylMWXVFWHrFmtPxfy04Jmr
         cw/A==
X-Forwarded-Encrypted: i=1; AKwUvBzfQRezlafKPzIrJz9uJ5vLm2AYYdttvLuT4eWZVqQq/FaW4kW9XeT4isk4NgRRoOR6pDdt7iZ1VAxZRqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z90sUTYVfXNtvYRFqCzbK+BaEK93qE7MmhO+xOZ4DLfhvLSSVma
	AI7meorFkn6kzeJXFPp8w2ZJ+qngIQVLst2u1b1bo84D7trb/lIjSAVo7DtOXjtJYeOKFve727Z
	o0tJd3NSJ6TCKfZM6+j1OzqGtBSiKnC24iaXpPK1kvkKUYTmIjBpgK9WQA7Q=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6ec8:b0:4fb:8469:fc4f with SMTP id
 5614622812f47-567e106cf13mr1974564b6e.29.1793979219502; Fri, 06 Nov 2026
 07:33:39 -0800 (PST)
Date: Fri, 06 Nov 2026 07:33:39 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aedf353.8be4ead1.3b45e1.017d.GAE@google.com>
Subject: [syzbot] [dm?] divide error in cache_ctr
From: syzbot <syzbot+3e16980543e238b95bd1@syzkaller.appspotmail.com>
To: agk@redhat.com, bmarzins@redhat.com, dm-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, mpatocka@redhat.com, snitzer@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ddfe51b0a0f5 Add linux-next specific files for 20261105
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=15c38e55580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3dffa811bfeed6b4
dashboard link: https://syzkaller.appspot.com/bug?extid=3e16980543e238b95bd1
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=172a6bdd580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10aa6bdd580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/181043a4bd52/disk-ddfe51b0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a69d8b670c38/vmlinux-ddfe51b0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/906d515c0893/bzImage-ddfe51b0.xz

AI-generated root cause summary:
In drivers/md/dm-cache-target.c, calculate_discard_block_size() repeatedly
doubles discard_block_size in a loop until the origin device has no more than
MAX_DISCARD_BLOCKS (16384) discard blocks. When creating a cache target with a
sufficiently large origin length (ti->len >= 2^45 sectors), discard_block_size
doubles until it reaches 2^32 (1ULL << 32). Because too_many_discard_blocks()
uses sector_div(), which expects a 32-bit divisor (uint32_t), passing 2^32
causes the divisor to truncate to zero. This triggers an unhandled kernel divide
error (#DE), crashing the system with an Oops: divide error.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3e16980543e238b95bd1

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3e16980543e238b95bd1@syzkaller.appspotmail.com

Oops: divide error: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 5654 Comm: syz-executor515 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/15/2026
RIP: 0010:too_many_discard_blocks drivers/md/dm-cache-target.c:2386 [inline]
RIP: 0010:calculate_discard_block_size drivers/md/dm-cache-target.c:2397 [inline]
RIP: 0010:cache_create drivers/md/dm-cache-target.c:2525 [inline]
RIP: 0010:cache_ctr+0x1a86/0x2bf0 drivers/md/dm-cache-target.c:2649
Code: 4c 8b 30 31 ff 4c 89 f6 e8 87 30 f5 f8 4d 85 f6 0f 84 81 00 00 00 4c 89 f3 48 c1 eb 20 45 89 ec 48 85 db 74 0a 4c 89 f0 31 d2 <49> f7 f4 eb 08 44 89 f0 31 d2 41 f7 f4 48 3d 00 40 00 00 76 14 4d
RSP: 0018:ffffc900038bf860 EFLAGS: 00010246
RAX: 003fffffffffffff RBX: 00000000003fffff RCX: ffff88807f1c3e80
RDX: 0000000000000000 RSI: 003fffffffffffff RDI: 0000000000000000
RBP: ffffc900038bfa38 R08: ffffc90000bbe007 R09: 0000000000000000
R10: ffffc90000bbe000 R11: fffff52000177c01 R12: 0000000000000000
R13: 0000000100000000 R14: 003fffffffffffff R15: 1ffff1100fec2462
FS:  000055557cd07400(0000) GS:ffff888123259000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004697f0 CR3: 0000000078996000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 dm_table_add_target+0x58d/0xc70 drivers/md/dm-table.c:749
 populate_table drivers/md/dm-ioctl.c:1602 [inline]
 table_load+0x325/0x8a0 drivers/md/dm-ioctl.c:1645
 ctl_ioctl drivers/md/dm-ioctl.c:2221 [inline]
 dm_ctl_ioctl+0x9ec/0xe10 drivers/md/dm-ioctl.c:2243
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x00007fdd52f9b8c9
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdc56ed528 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 6d61722f7665642f RCX: 00007fdd52f9b8c9
RDX: 0000200000000000 RSI: 00000000c138fd09 RDI: 0000000000000003
RBP: 0000000000000001 R08: 0000000000000013 R09: 0000000000000006
R10: 0000000000000001 R11: 0000000000000246 R12: 00007ffdc56ed698
R13: 431bde82d7b634db R14: 00007fdd5302ec40 R15: 0000000000000002
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:too_many_discard_blocks drivers/md/dm-cache-target.c:2386 [inline]
RIP: 0010:calculate_discard_block_size drivers/md/dm-cache-target.c:2397 [inline]
RIP: 0010:cache_create drivers/md/dm-cache-target.c:2525 [inline]
RIP: 0010:cache_ctr+0x1a86/0x2bf0 drivers/md/dm-cache-target.c:2649
Code: 4c 8b 30 31 ff 4c 89 f6 e8 87 30 f5 f8 4d 85 f6 0f 84 81 00 00 00 4c 89 f3 48 c1 eb 20 45 89 ec 48 85 db 74 0a 4c 89 f0 31 d2 <49> f7 f4 eb 08 44 89 f0 31 d2 41 f7 f4 48 3d 00 40 00 00 76 14 4d
RSP: 0018:ffffc900038bf860 EFLAGS: 00010246
RAX: 003fffffffffffff RBX: 00000000003fffff RCX: ffff88807f1c3e80
RDX: 0000000000000000 RSI: 003fffffffffffff RDI: 0000000000000000
RBP: ffffc900038bfa38 R08: ffffc90000bbe007 R09: 0000000000000000
R10: ffffc90000bbe000 R11: fffff52000177c01 R12: 0000000000000000
R13: 0000000100000000 R14: 003fffffffffffff R15: 1ffff1100fec2462
FS:  000055557cd07400(0000) GS:ffff888123259000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004697f0 CR3: 0000000078996000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	4c 8b 30             	mov    (%rax),%r14
   3:	31 ff                	xor    %edi,%edi
   5:	4c 89 f6             	mov    %r14,%rsi
   8:	e8 87 30 f5 f8       	call   0xf8f53094
   d:	4d 85 f6             	test   %r14,%r14
  10:	0f 84 81 00 00 00    	je     0x97
  16:	4c 89 f3             	mov    %r14,%rbx
  19:	48 c1 eb 20          	shr    $0x20,%rbx
  1d:	45 89 ec             	mov    %r13d,%r12d
  20:	48 85 db             	test   %rbx,%rbx
  23:	74 0a                	je     0x2f
  25:	4c 89 f0             	mov    %r14,%rax
  28:	31 d2                	xor    %edx,%edx
* 2a:	49 f7 f4             	div    %r12 <-- trapping instruction
  2d:	eb 08                	jmp    0x37
  2f:	44 89 f0             	mov    %r14d,%eax
  32:	31 d2                	xor    %edx,%edx
  34:	41 f7 f4             	div    %r12d
  37:	48 3d 00 40 00 00    	cmp    $0x4000,%rax
  3d:	76 14                	jbe    0x53
  3f:	4d                   	rex.WRB


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

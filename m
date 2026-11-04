Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778953;
	b=3se7hneKwzCNxThUDfJXgN/yigAVeIJXBLddaL2U+XIxL4iuJlQ6AT4jiXnkPkwnQogn
	 TMm5NgAGTZ7UaAbVOgcs76Cubbc3n9+JJRWQLEm5T/9RMYPw+oXLs2oQ+/NnEZ0i6Qs2t
	 LG54qNG0gpV29euY9GvMqBlA40bst0O4/cy6ZFXYf7+/R05rLTr6COPhnytRSBg1QFMWR
	 MEFc/RAvUxfQhueGWhLoKrWEWRYp/+DHGQJUMgnS2KTGjeZt29b1XNBf89X2MPyl5MRNE
	 IwzcZMk4UpL3jNmHmslv74ZoLXHjQzECDZEFlNF8XFBa+s55gt6qk5NMfgujA4WO5tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778953;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=jOF9VC+FyuoiOL7uBzh8l/7un8l/rjldOsAOW9RYlzg=;
	b=pjB+KDBL9j28fi1mX3XWc6UxnAjEmATf7dK51phWHMwis6f4GduPDhhlSrZMI3TmFGq6
	 W90NQBvHiO3U9kcICh/XXGQZhzfM/D+Pfa8mErnTvodpVHSo1xpHDEkj7FSAne/OaY4mw
	 nKjhn/2x8wppy1qOK9WwHHd91Xx0zHO5cAgigAbwC3mvZx9aaX6ShNsHH3d0OiGNa3cMo
	 QZbecupo6evXYcQ26AtOiFORqkCKNMm8kgm2jgt1gUDd4RL0d+vfTaMZsR2BuJeeKEsYo
	 K1qGw+97SvDIik04fdauUx7G3dHx/iT7BJ0P+Iv6mDeQ4iPSsELmr6Lyh8QzdH26Pig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B201606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B201606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c55ba309c2so718041b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778952; x=1794383752;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jOF9VC+FyuoiOL7uBzh8l/7un8l/rjldOsAOW9RYlzg=;
        b=VGrtqm+oNp+mKUeFBFrskQpLd0+RWdS7ZcqIgr2fn8Rry1G+mctxrGl4NOvGEUTlqX
         e/QqxuGQI+cKhn9P4K1XOqA/2wgwnTaz/8lw+JpCBrOIX7vELPpMeWIo6ZNbq5fzFmDN
         SGR7H4Z1Jxaahdez9rWobeqkcpUbFAMNfPpyUkCx251FzRSXh6bP0AqYe9qWq9DvK4H/
         aKddo3JtEB+8TvO0r7NStI+oxZq4YSC+Il3tkTL7jUx9uLCqE3A/Ink2N5Vy8gn63Qtn
         osgM0plscvztG3KOPk8r3p2xhv6EWLGM6aZqEsyk5iNumhmljj4hMhGVmp9rrgFjZjwa
         01IA==
X-Forwarded-Encrypted: i=1; AKwUvByGFHHUsyDsIVXQrCFa+ybNme5tylor+BDyXReQy/4Xa6oD/jJEG/kuO/gna0Wsnfd4Kww6+1+CdIm5tfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8esQs1E4IwOxUEjqYxBHwhEFC2iY9Cpt/xqeeWWvI9CNrrRztQ
	RsMSyHf+c+N1VAAhdwmdaJaU9cbltnyyQyuMHRKHtUI7AsaQQxddreU8h14JBgEtukIt7y4f2b6
	ewGrxb91xqxUNnfi7EEqfElMYGP8VUdKMPEO4jQwaT8+j0KYPWximF30XKbE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6410:b0:541:139a:881a with SMTP id
 5614622812f47-5640de70b3dmr10704597b6e.59.1793778952194; Tue, 03 Nov 2026
 23:55:52 -0800 (PST)
Date: Tue, 03 Nov 2026 23:55:52 -0800
In-Reply-To: <6ae807da.c8ffc79a.e3697.002c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeae508.be891901.2a0dec.0004.GAE@google.com>
Subject: Re: [syzbot] [block?] [ext4?] BUG: unable to handle kernel paging
 request in blk_mq_exit_hctx
From: syzbot <syzbot+5307e3bcacec2ce4c2f0@syzkaller.appspotmail.com>
To: axboe@kernel.dk, linux-block@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    6628e7d4c6b2 Linux 7.4-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=148f6add580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
dashboard link: https://syzkaller.appspot.com/bug?extid=5307e3bcacec2ce4c2f0
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1436344e580000

AI-generated root cause summary:
When dm_setup_md_queue() fails after add_disk() (for instance during
bd_link_disk_holder() or dm_sysfs_init()), the error path invokes del_gendisk(),
which calls blk_mq_exit_queue() -> blk_mq_exit_hctx(), freeing each hardware
context flush queue and setting hctx->fq = NULL. However, md->type remains
DM_TYPE_NONE and the mapped device is not torn down. When userspace retries
table_load on the device, dm_setup_md_queue() and dm_mq_init_request_queue() run
again, invoking blk_mq_init_allocated_queue() on the existing queue. During
__blk_mq_realloc_hw_ctxs(), blk_mq_exit_hctx() is called on the existing
hardware contexts, unconditionally dereferencing hctx->fq->flush_rq (offset
0x78) when hctx->fq is NULL, causing a kernel null-pointer dereference crash.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=5307e3bcacec2ce4c2f0

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5307e3bcacec2ce4c2f0@syzkaller.appspotmail.com

kobject: kobject_add_internal failed for dm (error: -12 parent: dm-9)
device-mapper: ioctl: unable to set up device queue for new table.
Unable to handle kernel paging request at virtual address dfff80000000000f
KASAN: null-ptr-deref in range [0x0000000000000078-0x000000000000007f]
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0
[dfff80000000000f] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 2579 Comm: syz.5.600 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/23/2026
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : blk_mq_exit_hctx+0x64/0x498 block/blk-mq.c:3974
lr : blk_mq_exit_hctx+0x40/0x498 block/blk-mq.c:3973
sp : ffff800097b275c0
x29: ffff800097b275d0 x28: 0000000000000000 x27: 1fffe0001ae5652a
x26: dfff800000000000 x25: ffff0000d72b2950 x24: ffff0000e0621480
x23: 0000000000000078 x22: ffff0000d22e9400 x21: 0000000000000001
x20: ffff0000d72b2800 x19: ffff0000ca1f5388 x18: ffff800123625000
x17: ffff0001ace95387 x16: ffff0000d7a11d94 x15: 0000000000000001
x14: 00000000004bc250 x13: 0000000000000001 x12: 0000000000000003
x11: 0000000000000000 x10: ffff0000ca1f53bc x9 : 0000000000000000
x8 : 000000000000000f x7 : ffff800081826454 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : ffff0000d72b2800 x1 : ffff0000d7a11d80 x0 : 0000000000000000
Call trace:
 blk_mq_exit_hctx+0x64/0x498 block/blk-mq.c:3974 (P)
 __blk_mq_realloc_hw_ctxs+0x1f0/0x548 block/blk-mq.c:4612
 blk_mq_realloc_hw_ctxs block/blk-mq.c:4652 [inline]
 blk_mq_init_allocated_queue+0x2dc/0xe9c block/blk-mq.c:4694
 dm_mq_init_request_queue+0x2d8/0x474 drivers/md/dm-rq.c:573
 dm_setup_md_queue+0x134/0x434 drivers/md/dm.c:2611
 table_load+0x3d4/0x764 drivers/md/dm-ioctl.c:1661
 ctl_ioctl drivers/md/dm-ioctl.c:2221 [inline]
 dm_ctl_ioctl+0x884/0xbbc drivers/md/dm-ioctl.c:2243
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __arm64_sys_ioctl+0x154/0x1cc fs/ioctl.c:583
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:796
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:815
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
Code: 97cf39bd f9400328 9101e117 d343fee8 (387a6908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	97cf39bd 	bl	0xffffffffff3ce6f4
   4:	f9400328 	ldr	x8, [x25]
   8:	9101e117 	add	x23, x8, #0x78
   c:	d343fee8 	lsr	x8, x23, #3
* 10:	387a6908 	ldrb	w8, [x8, x26] <-- trapping instruction


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

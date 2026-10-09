Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DC9370D5E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582933; cv=none; b=HYWlQ/9NXZwcdK8PwNCv3wpx5oIZOP3fTV96hfIL7d/UhTyPSDrlGwVnNaPg6Ackg/Zu9UoqFLQ0s7ARhsILNa0+WLzhxmosa3e21txoj/tdW5x72N2ZxmevRZLg+NVNfZF8XtOAJWiCbykqeQBUvCiowxvJIL7cIfMPIaWbHuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582933; c=relaxed/simple;
	bh=VJdPU0ep5JN4HM5tuR7qeQ7pnggt9qcbAeJPRb/RH/U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dqjgBuf0L253GX9F1va4uWBBMnl6yABf31GJicUB+m1EZnC2gM3hTDkGl/hXSLbxJJhT7dUMyxRLyYKXpsm52Si+pOVrQvGlU5xdRz6xSgIifP9LGR5a3UjDGTfpDeudQN161T7RuAvQ9y0qdFli4/Pt7rWxghof9KK2yAl9PTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c7f887ac6bso352568b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582930; x=1792187730;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EJZ9bPUGIIFLQOn9K1GH3elZiy2JfD5gZkP/Geb2G1U=;
        b=LNLKa6eZrmSIYzIWcDY36fOFkJqqpqAq9hfY6h6egEfvk62w8Wd5T0iTEa44zPesKy
         29buVrvIqJ2O802tqLQdTkOG+p+OIcYdqxoVCNPL/PnArtShxsfuipNZYmw+fwpwTdv+
         R3dc2HP1Dge6eFMMgBCEJ2D7kSOpaZVLnH6hMvdee3JQH+b8Be2Ow6vZRUF0YI73L0CF
         Win9aLNs1QNMDP62os7F+jofCwa0y9D6R3uMoIvzRc6xNrjuR6ek0XNzO0YUd2r1vcNp
         qy5zryC6BIJMzvaXRJ/Nl1QdMx/vZfxb96V+JRGeewmC61XPzQ+mheb+tcOGHwwCrz7r
         eGLw==
X-Forwarded-Encrypted: i=1; AKwUvBzfyIf0F6XFZQ2Qi49S8HTqE+kUDFOkk3cKEYyxcM6Px2N9mFRq23yugeGGNVW8bj/b1JVW0ynmJjCsTcw=@vger.kernel.org
X-Gm-Message-State: AFuF++n9StG2pYbQgjwOVnH2KwgJLMd4arIAUsGJk9yjfcMvGGuaJ9gy
	qwNizeXXtdqUUHjN8GqSDHBZxuwu7i267fHtFyoIa9aWR2QsIo1M9p86N+Q0BYBCUJLiH1YfNw9
	nbppojRkSlxFNePwzE7aP4EDunBcrBMIVl6ho9w9VsCG6RdQ0Asg/zgaA+nU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f65:b0:4e5:c2b4:33b0 with SMTP id
 5614622812f47-50c59399b92mr2796870b6e.43.1791582930733; Fri, 09 Oct 2026
 14:55:30 -0700 (PDT)
Date: Fri, 09 Oct 2026 14:55:30 -0700
In-Reply-To: <6a778d6e.9c11d2ce.289b96.00ba.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac962d2.bbc4c7f9.15faa7.003c.GAE@google.com>
Subject: Re: [syzbot] [dri?] WARNING in drm_fbdev_shmem_helper_fb_dirty
From: syzbot <syzbot+369ee6a6e9d0bbf14b37@syzkaller.appspotmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, simona@ffwll.ch, syzkaller-bugs@googlegroups.com, 
	tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    af32da41b032 Merge tag 'net-7.3-rc7' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17b540a5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d1b274ca9837366
dashboard link: https://syzkaller.appspot.com/bug?extid=369ee6a6e9d0bbf14b37
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10c2fa8e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1268e0a5580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-af32da41.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6a43965520a9/vmlinux-af32da41.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c79ed41c72d4/bzImage-af32da41.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+369ee6a6e9d0bbf14b37@syzkaller.appspotmail.com

------------[ cut here ]------------
virtio-pci 0000:00:01.0: [drm] Dirty helper failed: ret=-12
WARNING: drivers/gpu/drm/drm_fbdev_shmem.c:118 at drm_fbdev_shmem_helper_fb_dirty+0x1e1/0x310 drivers/gpu/drm/drm_fbdev_shmem.c:118, CPU#0: kworker/0:0/9
Modules linked in:
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: events drm_fb_helper_damage_work
RIP: 0010:drm_fbdev_shmem_helper_fb_dirty+0x288/0x310 drivers/gpu/drm/drm_fbdev_shmem.c:118
Code: 27 fc 4c 89 f8 48 c1 e8 03 42 80 3c 28 00 74 08 4c 89 ff e8 3a 1a 9a fc 4d 8b 27 48 89 df 4c 89 f6 4c 89 e2 8b 5c 24 04 89 d9 <67> 48 0f b9 3a 89 d8 e9 f7 fe ff ff 89 d9 80 e1 07 fe c1 38 c1 0f
RSP: 0018:ffffc9000022f898 EFLAGS: 00010246
RAX: 1ffff1100004481a RBX: 00000000fffffff4 RCX: 00000000fffffff4
RDX: ffff888000b33d00 RSI: ffffffff8c79f2a0 RDI: ffffffff91867840
RBP: ffff8880322ca008 R08: ffffc9000022f5e7 R09: 1ffff92000045ebc
R10: dffffc0000000000 R11: fffff52000045ebd R12: ffff888000b33d00
R13: dffffc0000000000 R14: ffffffff8c79f2a0 R15: ffff8880002240d0
FS:  0000000000000000(0000) GS:ffff88808b0b4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f76a6223b50 CR3: 0000000038789000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 drm_fb_helper_fb_dirty drivers/gpu/drm/drm_fb_helper.c:339 [inline]
 drm_fb_helper_damage_work+0x84c/0xf20 drivers/gpu/drm/drm_fb_helper.c:365
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	fc                   	cld
   1:	4c 89 f8             	mov    %r15,%rax
   4:	48 c1 e8 03          	shr    $0x3,%rax
   8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
   d:	74 08                	je     0x17
   f:	4c 89 ff             	mov    %r15,%rdi
  12:	e8 3a 1a 9a fc       	call   0xfc9a1a51
  17:	4d 8b 27             	mov    (%r15),%r12
  1a:	48 89 df             	mov    %rbx,%rdi
  1d:	4c 89 f6             	mov    %r14,%rsi
  20:	4c 89 e2             	mov    %r12,%rdx
  23:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
  27:	89 d9                	mov    %ebx,%ecx
* 29:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2e:	89 d8                	mov    %ebx,%eax
  30:	e9 f7 fe ff ff       	jmp    0xffffff2c
  35:	89 d9                	mov    %ebx,%ecx
  37:	80 e1 07             	and    $0x7,%cl
  3a:	fe c1                	inc    %cl
  3c:	38 c1                	cmp    %al,%cl
  3e:	0f                   	.byte 0xf


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

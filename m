Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA1C3D7D8E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818537; cv=none; b=JuJybFlIwe4GWIAxAtcFH9YZcSeOFx8XW09AFh3pkdwC2cEEYAFOkHA6GyDABHYkag0QNdKlX2cMQVywfsobyVcP5COtB5DjUGkSSEtPeqCMlQEyU7pCOR927/QpQEaRQ7VO0rLJudzMETG8FHafqT2UUHrf5pU0xBSTm5X9uq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818537; c=relaxed/simple;
	bh=OuXyJT/6AAnPaKeNWwF5AWE1eYqXOKiTD0cr/c0h5p8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SHelOmpisxgNjs6V2/wCpSPA6p1XsORNjjyIf0lxfFX/AX2bZGX0wCckneDFLUPk5uKgFOfuwSRLRB60ui6nj80P+0XuBS9zTPjgECieTs0IiXtItlurINBe8VuB3FFUBCo0ZfAkke41LCRaNOEXvzhqZFKDqhREyHcgniW8+bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a7de733fa9so3601532b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818535; x=1788423335;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lJ3qk8/61Sl6jI2iMIYu5MoNTkIskaGzAad+uLDuAyY=;
        b=RPzcrsCBiuOUshTqn4Qf3ATjraiBYgigXMttn0bpS+6dtnssV/705tyyaKyViHzeYj
         vXKuDdrT990zselawEDXAbaMpPXkl7yg7VoJNxHFmV+uye02tiMyNckkMPQkacx5JDhm
         CFU90ayrp+JC2CB4sCQduLohp3hS5GtTLgRLPrpxgyW7YarcT0FVAli6N6aKYwslECtK
         uvkcbPyMcdrY1uHEQQpMQrfPh1IR7ffkGdBlBKpra03KnD253foJhre+oeke4hi1WF/I
         guq2IC4A/hK8V9lX3y3aGI1nIBLJ498geNfGh5D6ktUQGi5R/Np0lL30buq/sBjJeCvl
         sw5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp7kgZMi1p0ogdz2ffyRYS0s4LNkTT9JXn/nelfbQn4PqBbF3G5q9KzubwpBAu3cUX/vAeHgExAKgZt65c=@vger.kernel.org
X-Gm-Message-State: AFuF++lKK9+lTsyXNn/9efbCEnb5/h3S5ytgWxgB3DHGdvwvWcB+H7/S
	QriqAdAjcJg7WTa+POqzD/QuszLuNREAPQRIDXioKbUPGjMdq5UkaibaRXAP3x8Yul2FonuTLK4
	7ONVgyafmz7zBlilkCEjnNWcy64bW39CvilrDqVSCKJRZ4NP0eap5Ykwf3Nk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c172:b0:4b2:8e51:aac2 with SMTP id
 5614622812f47-4b366af5606mr15363937b6e.8.1787818534952; Thu, 27 Aug 2026
 01:15:34 -0700 (PDT)
Date: Thu, 27 Aug 2026 01:15:34 -0700
In-Reply-To: <6a86bb5c.4d75e56a.c9a88.0039.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8ff226.1d9ded08.62e62.00c8.GAE@google.com>
Subject: Re: [syzbot] [kernel?] WARNING: refcount bug in bnep_session (2)
From: syzbot <syzbot+98baa83c342e86a836d7@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13956d49580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=98baa83c342e86a836d7
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13435625580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+98baa83c342e86a836d7@syzkaller.appspotmail.com

------------[ cut here ]------------
refcount_t: underflow; use-after-free.
WARNING: lib/refcount.c:28 at refcount_warn_saturate+0xf4/0x130 lib/refcount.c:28, CPU#3: kbnepd bnep0/6057
Modules linked in:
CPU: 3 UID: 0 PID: 6057 Comm: kbnepd bnep0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:refcount_warn_saturate+0xf4/0x130 lib/refcount.c:28
Code: 06 e8 70 ca e6 fc 48 8d 3d c9 dd 29 0c 67 48 0f b9 3a e8 5f ca e6 fc 5b 5d c3 cc cc cc cc e8 53 ca e6 fc 48 8d 3d bc dd 29 0c <67> 48 0f b9 3a e8 42 ca e6 fc 5b 5d e9 4b ee a5 06 e8 36 ca e6 fc
RSP: 0018:ffffc90005c6f958 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff8880507dfc78 RCX: 0000000000000001
RDX: ffff88803142cb00 RSI: ffffffff8524377d RDI: ffffffff914e1540
RBP: 0000000000000003 R08: 0000000000000005 R09: 0000000000000004
R10: 0000000000000003 R11: 0000000000000000 R12: ffff8880134cd400
R13: ffff8880507dfc78 R14: ffffffff8661d790 R15: ffff888035896000
FS:  0000000000000000(0000) GS:ffff8880d5ea2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcfb9c4bd58 CR3: 0000000036184000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __refcount_sub_and_test include/linux/refcount.h:400 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 kref_put include/linux/kref.h:64 [inline]
 klist_dec_and_del lib/klist.c:206 [inline]
 klist_put+0x18a/0x1d0 lib/klist.c:217
 device_del+0x1b8/0x9b0 drivers/base/core.c:3942
 unregister_netdevice_many_notify+0x1503/0x2150 net/core/dev.c:12551
 unregister_netdevice_many net/core/dev.c:12589 [inline]
 unregister_netdevice_queue net/core/dev.c:12390 [inline]
 unregister_netdevice_queue+0x30b/0x3c0 net/core/dev.c:12376
 unregister_netdevice include/linux/netdevice.h:3487 [inline]
 unregister_netdev+0x1f/0x60 net/core/dev.c:12697
 bnep_session+0x22e6/0x2f40 net/bluetooth/bnep/core.c:544
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	e8 70 ca e6 fc       	call   0xfce6ca75
   5:	48 8d 3d c9 dd 29 0c 	lea    0xc29ddc9(%rip),%rdi        # 0xc29ddd5
   c:	67 48 0f b9 3a       	ud1    (%edx),%rdi
  11:	e8 5f ca e6 fc       	call   0xfce6ca75
  16:	5b                   	pop    %rbx
  17:	5d                   	pop    %rbp
  18:	c3                   	ret
  19:	cc                   	int3
  1a:	cc                   	int3
  1b:	cc                   	int3
  1c:	cc                   	int3
  1d:	e8 53 ca e6 fc       	call   0xfce6ca75
  22:	48 8d 3d bc dd 29 0c 	lea    0xc29ddbc(%rip),%rdi        # 0xc29dde5
* 29:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2e:	e8 42 ca e6 fc       	call   0xfce6ca75
  33:	5b                   	pop    %rbx
  34:	5d                   	pop    %rbp
  35:	e9 4b ee a5 06       	jmp    0x6a5ee85
  3a:	e8 36 ca e6 fc       	call   0xfce6ca75


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

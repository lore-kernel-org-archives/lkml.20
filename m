Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEC2471274
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251044; cv=none; b=oyHBCQiGLnYDZ8rKdpn8CTAMrQIVYJgNzzSOGuPxPR2W3X876FtVfB/F6WRvLwU8H5TWQ5IEFTELK+LSn6RpHIMmTXh5zlDQT0tIxkQeSrWBuCcvgyT/ylvNK4KNeCjupL0ukkEAE7sqKixLoDFPvBZChJPOp5VJ1k8YS1AcKjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251044; c=relaxed/simple;
	bh=4RGn8t+LQF6S9PdumJt8G5B5NcSgFn1Q1QrxRKSeZIg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EEg1C71UnRP7qO+j2dCDNFHknMVJjn8r2y+YB3vIghdPNaXYXeCktAiGSd36fRdGTIf5EXTtKjIkop+64nv4saSR30PPnhYrMh28y+N49lmsxL8a0490/8xJR3bZBLME5Eyl+qEnwElTiyG9jIkIggn8XtvOoz++2hz9VwiZrs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b12abf0e49so3289427eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251042; x=1788855842;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ItV3uAhLrA3ZuYJ2NbnirNtxMadrACORmxMqd17GfW8=;
        b=dh+gphiIyshIabfRyOskeikr5r6GTCmQsqcdnGfE/HTzKEYTcz7msgbUvSu3ms0twj
         Yb+E7+m2jf6hpL0fszThN1oTF+q1MqzSgsdWg6z7FeGzPFsy3xmWe0xY3RMNW0fOnn/v
         S6pOc9MbeVwSHZs4Ot2acwHa5U9ZHKzYUIWDjKZsei5mTa3XKLOyp4XNGkWT71A/YOiM
         C2GXsE8p7c83E32Mmc+uxuKzc/Meg0FxWWiMGZ/fbhA+uVPa3+UfMSqQmpXY0vct+Bln
         qyl9P9vf3cfPYTWp1mL1hYbYjZS9dWP/EqxjuwwdsHUtvkDXIK6vN7k+38HrdBejT4Q2
         5Vdw==
X-Gm-Message-State: AFuF++m9bz3toeahcc6UrRwza50sTL7CRxlM87cucTA5uwFwbTSymlsk
	r2zSf6Qiac0jy0JK5+78SLbVYvDP4DlxzRIZdEMRjXLi8HjfPLuM9F6XHFojzWytWkC7S368ovY
	bWd8USoFUB6OpMqQa6WvXvN3Wv+6Mvih0qMl2n5rLS0k3zKJgH1XU1cxtQoQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1996:b0:6b1:7798:a80e with SMTP id
 006d021491bc7-6b372cee666mr5909391eaf.6.1788251042339; Tue, 01 Sep 2026
 01:24:02 -0700 (PDT)
Date: Tue, 01 Sep 2026 01:24:02 -0700
In-Reply-To: <2ae556b1-526f-46a4-a307-25848b0baf8en@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a968ba2.99925153.16bd3d.000a.GAE@google.com>
Subject: Re: [syzbot] [edac?] general protection fault in detach_timer (3)
From: syzbot <syzbot+edc6b57cbed1fb72d0f9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tao1.yu@intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in __set_cpus_allowed_ptr_locked

------------[ cut here ]------------
!pending
WARNING: kernel/sched/core.c:3057 at affine_move_task kernel/sched/core.c:3057 [inline], CPU#0: irq/33-virtio1-/1193
WARNING: kernel/sched/core.c:3057 at __set_cpus_allowed_ptr_locked+0x10ff/0x19c0 kernel/sched/core.c:3190, CPU#0: irq/33-virtio1-/1193
Modules linked in:
CPU: 0 UID: 0 PID: 1193 Comm: irq/33-virtio1- Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:affine_move_task kernel/sched/core.c:3057 [inline]
RIP: 0010:__set_cpus_allowed_ptr_locked+0x10ff/0x19c0 kernel/sched/core.c:3190
Code: cf ff ff 48 8b 5c 24 18 48 8d 7b 08 e8 5a 93 09 00 e9 2e fe ff ff 90 0f 0b 90 e9 74 f3 ff ff e8 57 eb 9d ff e9 dd f8 ff ff 90 <0f> 0b 90 48 8b 3c 24 48 8b 74 24 08 48 8b 54 24 10 e8 2b cf ff ff
RSP: 0018:ffffc9000712f900 EFLAGS: 00010046
RAX: 0000000000000000 RBX: ffff8880268e84b8 RCX: ffffffff81950d8b
RDX: dffffc0000000000 RSI: 0000000000000008 RDI: ffff8880268e84b0
RBP: ffffc9000712fb10 R08: ffff8880268e84b7 R09: 1ffff11004d1d096
R10: dffffc0000000000 R11: ffffed1004d1d097 R12: 1ffff11004d1d097
R13: 1ffff92000e25f28 R14: ffff8880268e84b0 R15: 0000000000000004
FS:  0000000000000000(0000) GS:ffff888125be1000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555568e077b8 CR3: 000000003c6c2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __set_cpus_allowed_ptr kernel/sched/core.c:3222 [inline]
 ___migrate_enable+0x19c/0x1f0 kernel/sched/core.c:2486
 __migrate_enable include/linux/sched.h:2471 [inline]
 migrate_enable include/linux/sched.h:2520 [inline]
 __local_bh_enable+0x21c/0x2f0 kernel/softirq.c:273
 __local_bh_enable_ip+0x19f/0x2b0 kernel/softirq.c:328
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 irq_forced_thread_fn+0xe9/0x120 kernel/irq/manage.c:1169
 irq_thread+0x455/0x690 kernel/irq/manage.c:1272
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         8ff706df x86/mce: Prevent polling timer rearm across t..
git tree:       https://github.com/yutao-intel/linux.git fix-edac-v2
console output: https://syzkaller.appspot.com/x/log.txt?x=12f18779580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e618aabdc2dca7e6
dashboard link: https://syzkaller.appspot.com/bug?extid=edc6b57cbed1fb72d0f9
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.

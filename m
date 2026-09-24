Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2297E4BA1EF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284541; cv=none; b=b971cIH6GrbImXv6Gd4MkJR86B1EGpvnqMgIeupGoutP94OZHq4/IZxi4HY36g2wagOFFPU5RrKY7FC6UkN8GHLz94p1dRON7Q7HjSHPkSdM6DuIx/dufkxtI37bHlkbWUGHxlW33GQbcj022vbSBCwzfjwypQ5sOJlH1FEcBI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284541; c=relaxed/simple;
	bh=qQO8IjNznZO4TVHmChgwEFycresfyuIrZ5PYTPQqzKI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=o2llzxxe8c8H4W3xoabLgfAaCGmdDTSzajHvusn4STTo1UNjOblVLTy9onlAnyRoebWTzZzpVOwA+UlgbRkkViEZ/5DHap+XMA3qLBWV/dG2i7Gz5vxrV91FpP7C0sXlHkQEoCWrOocxa11f/yiUUd781rofVyvIIQYHhRTmfU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c55ba309c2so556999b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284539; x=1790889339;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xSR4lHSmVBbVu0kM0E0aT0ni37Pqd8I1mINiI6DNGRM=;
        b=RVrkbGcZ8CLtsxx/t0rA7h2YBQ4pzPcXBjX8eDRx9jJxsbjE8BkIgtMMMDptx1Qwc+
         48EzoOCcm4r4Nc6JVRm7ZUCeKau05mGxdmfLXGmksD3/r4HIQpvjyaxOWFSnNZC+vyIG
         umaJU6EGzyVLY8jRclYAp1ajto1FKdtiVPZMKSRxZUIQ0t5dhT49y5UTOlT5wKjtFaE4
         e9pl0OTPkwRv/mbjZOIClE4g5mYyBsiKdeEmsmPkd2JhP3uJXXEfykWrdllXlNSo1B2j
         FTIkz9zggfdqiHwPfK2sVasDrQL+LhOO/40S9lUSv/51sVKxXq9dUEx8+/bgLVmzYVdr
         H2yg==
X-Forwarded-Encrypted: i=1; AKwUvBzc5JMVVbnQSy6gzQnXDfs6o9q0QXh7TDNdni0MUUs8BZZMmIYoV8od1xrPeejPuJs3IoeNk9IshHMrpM0=@vger.kernel.org
X-Gm-Message-State: AFuF++kQfttp2sRKDbMr4SHKEIDmpN3Cc8DI2+37wXzJjc7X2xIVPvHc
	uGLt2m4mbXQLmg31HCLQIYzdZxdNudIH/wPLmJS/5+rdeH5vZ4qXBhZIUZfkaZFm5vUk4UreGFw
	fdTX8vmF9QKOoXiIz2bY5zWrDNXmBzqqRTccvYU5eu7cLnmHWzX5pvnC6sH8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:448f:b0:4b9:a8ac:479 with SMTP id
 5614622812f47-4d72c73e50cmr3676645b6e.23.1790284538951; Thu, 24 Sep 2026
 14:15:38 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:15:38 -0700
In-Reply-To: <6a65ac92.70955b6c.323240.002e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab592fa.7428d045.30104c.0009.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KCSAN: data-race in mas_wr_store_entry / mtree_load
From: syzbot <syzbot+caa2ebc5f1f594970675@syzkaller.appspotmail.com>
To: aliceryhl@google.com, andrewjballance@gmail.com, liam@infradead.org, 
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    f49a343b305c Merge tag 'pinctrl-v7.3-2' of git://git.kerne..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=168a9c5e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea1e6d8de13bab08
dashboard link: https://syzkaller.appspot.com/bug?extid=caa2ebc5f1f594970675
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17675c05580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+caa2ebc5f1f594970675@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in mas_wr_store_entry / mtree_load

write to 0xffff88810493bb00 of 8 bytes by task 3643 on cpu 1:
 mte_set_node_dead lib/maple_tree.c:305 [inline]
 mas_put_in_tree lib/maple_tree.c:1652 [inline]
 mas_replace_node lib/maple_tree.c:1667 [inline]
 mas_wr_node_store lib/maple_tree.c:3276 [inline]
 mas_wr_store_entry+0x3c1f/0x5ac0 lib/maple_tree.c:3606
 mas_store_gfp+0x493/0x580 lib/maple_tree.c:4999
 irq_insert_desc kernel/irq/irqdesc.c:195 [inline]
 alloc_descs kernel/irq/irqdesc.c:531 [inline]
 __irq_alloc_descs+0x361/0x4d0 kernel/irq/irqdesc.c:922
 irq_domain_alloc_descs kernel/irq/irqdomain.c:-1 [inline]
 irq_domain_alloc_irqs_locked+0x7f/0x7d0 kernel/irq/irqdomain.c:1639
 __irq_domain_alloc_irqs+0x80/0xd0 kernel/irq/irqdomain.c:1713
 __msi_domain_alloc_irqs+0x435/0xa00 kernel/irq/msi.c:1336
 __msi_domain_alloc_locked kernel/irq/msi.c:1393 [inline]
 msi_domain_alloc_locked+0x357/0x3e0 kernel/irq/msi.c:1398
 msi_domain_alloc_irqs_all_locked+0xd2/0x110 kernel/irq/msi.c:1474
 pci_msi_setup_msi_irqs+0x7a/0x90 drivers/pci/msi/irqdomain.c:17
 __msix_setup_interrupts drivers/pci/msi/msi.c:687 [inline]
 msix_setup_interrupts drivers/pci/msi/msi.c:708 [inline]
 msix_capability_init+0x566/0x960 drivers/pci/msi/msi.c:748
 __pci_enable_msix_range+0x41d/0x4b0 drivers/pci/msi/msi.c:856
 pci_alloc_irq_vectors_affinity+0xac/0x1e0 drivers/pci/msi/api.c:268
 vp_request_msix_vectors drivers/virtio/virtio_pci_common.c:159 [inline]
 vp_find_vqs_msix+0x3f0/0x8b0 drivers/virtio/virtio_pci_common.c:416
 vp_find_vqs+0x4a/0x4a0 drivers/virtio/virtio_pci_common.c:526
 virtio_find_vqs include/linux/virtio_config.h:298 [inline]
 virtio_find_single_vq include/linux/virtio_config.h:309 [inline]
 probe_common+0x1e8/0x3c0 drivers/char/hw_random/virtio-rng.c:177
 virtrng_probe+0x15/0x20 drivers/char/hw_random/virtio-rng.c:215
 virtio_dev_probe+0x5cf/0x780 drivers/virtio/virtio.c:347
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x1ba/0x600 drivers/base/dd.c:706
 __driver_probe_device+0x14f/0x1c0 drivers/base/dd.c:868
 device_driver_attach+0x8d/0x130 drivers/base/dd.c:1203
 bind_store+0x17b/0x1c0 drivers/base/bus.c:267
 drv_attr_store+0x57/0x80 drivers/base/bus.c:125
 sysfs_kf_write+0xfe/0x120 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x1d2/0x2e0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x57f/0x9a0 fs/read_write.c:687
 ksys_write+0xdc/0x1a0 fs/read_write.c:739
 __do_sys_write fs/read_write.c:750 [inline]
 __se_sys_write fs/read_write.c:747 [inline]
 __x64_sys_write+0x40/0x50 fs/read_write.c:747
 x64_sys_call+0x154e/0x2550 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff88810493bb00 of 8 bytes by task 3646 on cpu 0:
 ma_dead_node lib/maple_tree.c:505 [inline]
 mtree_lookup_walk lib/maple_tree.c:3049 [inline]
 mtree_load+0x3fd/0x600 lib/maple_tree.c:5822
 irq_to_desc kernel/irq/irqdesc.c:414 [inline]
 kstat_irqs kernel/irq/irqdesc.c:1027 [inline]
 kstat_irqs_usr+0x28/0x1a0 kernel/irq/irqdesc.c:1071
 show_all_irqs fs/proc/stat.c:41 [inline]
 show_stat+0x96f/0xb90 fs/proc/stat.c:135
 seq_read_iter+0x2d9/0x8f0 fs/seq_file.c:231
 proc_reg_read_iter+0xe6/0x180 fs/proc/inode.c:295
 new_sync_read fs/read_write.c:493 [inline]
 vfs_read+0x699/0x7c0 fs/read_write.c:574
 ksys_read+0xdc/0x1a0 fs/read_write.c:716
 __do_sys_read fs/read_write.c:725 [inline]
 __se_sys_read fs/read_write.c:723 [inline]
 __x64_sys_read+0x40/0x50 fs/read_write.c:723
 x64_sys_call+0x2135/0x2550 arch/x86/include/generated/asm/syscalls_64.h:1
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

value changed: 0xffff888100b7f70e -> 0xffff88810493bb00

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 3646 Comm: syz-executor354 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

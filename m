Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793927553;
	b=wKeYhP1dOJNLrfnGrI6p+hgBktWANMzjy9pkqBAAXKTBX+WWyp7Gmo+PyXAdSf0CPkAy
	 MDfqdDk2Ns6HDMWlPiaFPeIpEF8Le+LxkZ2XIRhCLQyumDkI0aU2OdGg6xIi6eaJz2IgZ
	 Crd8ukqiUEjniI1y8cmBDS7UdyG5c7S7zNAPKnbZYLgD44XUP7NjI98QYWYPmIDOIZE1z
	 sPNQJx8kcsx3xwBfJd9KCtQZO92q2aIFtZ6vN63Hxq5g/u/q+a1DeLKz4MQne03pO6B2M
	 pf0IfekWgC2rLtFGUH/8rRpQjbQ5vYjjmi7uWmRN9FH6pPVTeU/Pi7fSFGI0Gb/zAdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927553;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Slm6nbBflDPANH5zzzL7avwKglsSKEa6D0E9HsITUGo=;
	b=YRBpJgXuFFttluae4q+4B/aqhwXBW2oigSzLNkwWSSCBCCQjgZTfgn0u2Ck858NVW1dj
	 VMDLM0RqYQyQN1f4n+M2P6wHV1jfNLMHYbNShsCKTlra1FG2bv6UURJJO8Csz/J8ENiOC
	 TdDbTrLDTxy2pDZ7or20Ojl2wZTJhwfFtsYkuF/AVXcHARIDumYt0+SXyjDxsb2n5O/r6
	 Op/jhBAT4nHo17/m1IkhPd3bDb6vVEH4omi7CpV0VHMx9Rigp07GybzNWvpJiFIx8u2pv
	 qRgeTXz6SXW3gpqwqus69Uf0V+pBBfxDOWZYWdt7XmJNW5VnPBOh6yCbYFCE/sXV8Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E719606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E719606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e4dso112955b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:12:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927552; x=1794532352;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Slm6nbBflDPANH5zzzL7avwKglsSKEa6D0E9HsITUGo=;
        b=2X28zLS4mDUA637wApCL/Al/7rKs2128YgUCnkbPYrjc7J2AE4NXT5gfowKkYNs+dG
         Z/5hfOd5TLCl7uh6HTi4zlCpWzl/q8kUuakdZFVXrpl67fC/Cks9VYX1rxO5TEjJZOAQ
         7WMLaa4vxdwphkCpEDM+0QDd6luZ2WZCPDIENrY9DSLyPvf0OVRvso4PaYroNVNR80RO
         rSzzfZPql24hl21kjdrTqHHCldaqx5x+uqW8/lcwYAJYG9HcLi8ZXZ/mIEKuRJgcyWG9
         mNYJSeghLZYOSPVXqMOHKe97dYa4rdD8EEXD3nDSKJ5xgHME8mxOoFG0BvlE9H+vA2jv
         nQVg==
X-Forwarded-Encrypted: i=1; AKwUvBwc95GG7L9l6hb+cnnDcu3gXBrl9ZlBoBm+VKHAMW7uCz9Wv2+rYhWg0bc3hZhc9OXjHeIOcOM3QWU60lg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c1NoUascoqXjehUvbNh2kdW+e0VQWHrUoqxSpM5E9LW/sdm3L
	tP1+eUxR7s3xvE2av+JbuSPb9mWCXvvBOdgbiLXQVSdVZSNuhCgv7daP+e9D01fttWyTfE6L3Cy
	S0ZgUDwVZOrrZ2iYFy7lR0dDTmRwtMksDDeckl5jKdjrwX2r/SD3fHmDhcAs=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:309d:b0:564:347c:5aa3 with SMTP id
 5614622812f47-567e0f273c0mr870575b6e.2.1793927552157; Thu, 05 Nov 2026
 17:12:32 -0800 (PST)
Date: Thu, 05 Nov 2026 17:12:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aed2980.53a4481a.2cc859.0009.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Write in dev_config
From: syzbot <syzbot+3a56b27661cb0e004a40@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e11160948333 riscv: vector: Fix output operands in context..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12e4e525580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1c1b9a4a89432905
dashboard link: https://syzkaller.appspot.com/bug?extid=3a56b27661cb0e004a40
compiler:       riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: riscv64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-e1116094.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/69abda6e64cf/vmlinux-e1116094.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2d7716a5dfdb/Image-e1116094.xz

AI-generated root cause summary:
In drivers/usb/gadget/legacy/inode.c, gadgetfs_bind() only acquires a reference
on struct dev_data (calling get_dev(dev)) at the very end of its success path
(line 1709). If an error occurs earlier (such as in usb_ep_alloc_request() or
activate_ep_files()), gadgetfs_bind() jumps to enomem and calls
gadgetfs_unbind(), which unconditionally calls put_dev(dev) to release a
reference that was never acquired. This reference count underflow prematurely
frees struct dev_data via put_dev(). Furthermore, when driver probing fails
during registration, usb_gadget_register_driver() still returns 0 because
match_existing_only is not set on gadgetfs_driver, causing dev_config() to
execute dev->gadget_registered = true on the already freed dev structure,
resulting in a slab use-after-free write.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3a56b27661cb0e004a40

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3a56b27661cb0e004a40@syzkaller.appspotmail.com

gadgetfs gadget.1: probe with driver gadgetfs failed with error -12
UDC core: USB Gadget filesystem: couldn't find an available UDC
==================================================================
BUG: KASAN: slab-use-after-free in dev_config+0x13d6/0x1450 drivers/usb/gadget/legacy/inode.c:1908
Write of size 1 at addr ffffaf801a714099 by task syz.1.5/3856

CPU: 1 UID: 0 PID: 3856 Comm: syz.1.5 Not tainted syzkaller #0 PREEMPT 
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
[<ffffffff8007f408>] dump_backtrace+0x2e/0x3c arch/riscv/kernel/stacktrace.c:149
[<ffffffff80003112>] show_stack+0x30/0x3c arch/riscv/kernel/stacktrace.c:155
[<ffffffff8006394e>] __dump_stack lib/dump_stack.c:94 [inline]
[<ffffffff8006394e>] dump_stack_lvl+0x114/0x1aa lib/dump_stack.c:120
[<ffffffff8000e7ce>] print_address_description mm/kasan/report.c:378 [inline]
[<ffffffff8000e7ce>] print_report+0x27a/0x592 mm/kasan/report.c:482
[<ffffffff80c113e2>] kasan_report+0xf0/0x26c mm/kasan/report.c:595
[<ffffffff80c130cc>] __asan_report_store1_noabort+0x12/0x1a mm/kasan/report_generic.c:383
[<ffffffff840d7154>] dev_config+0x13d6/0x1450 drivers/usb/gadget/legacy/inode.c:1908
[<ffffffff80d28e30>] vfs_write+0x308/0x1020 fs/read_write.c:685
[<ffffffff80d29f52>] ksys_write+0x126/0x244 fs/read_write.c:739
[<ffffffff80d2a0de>] __do_sys_write fs/read_write.c:750 [inline]
[<ffffffff80d2a0de>] __se_sys_write fs/read_write.c:747 [inline]
[<ffffffff80d2a0de>] __riscv_sys_write+0x6e/0xa0 fs/read_write.c:747
[<ffffffff8007bd88>] syscall_handler+0x92/0x114 arch/riscv/include/asm/syscall.h:112
[<ffffffff8660e902>] do_trap_ecall_u+0x4ca/0x658 arch/riscv/kernel/traps.c:341
[<ffffffff8663b218>] handle_exception+0x168/0x174 arch/riscv/kernel/entry.S:237

Allocated by task 3223:
 stack_trace_save+0xa0/0xd2 kernel/stacktrace.c:122
 kasan_save_stack+0x3e/0x66 mm/kasan/common.c:57
 kasan_save_track+0x16/0x28 mm/kasan/common.c:78
 kasan_save_alloc_info+0x30/0x3e mm/kasan/generic.c:570
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xa0/0xa6 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x254/0x6aa mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 dev_new drivers/usb/gadget/legacy/inode.c:176 [inline]
 gadgetfs_fill_super+0x1cc/0x3e6 drivers/usb/gadget/legacy/inode.c:2064
 vfs_get_super fs/super.c:1405 [inline]
 get_tree_single+0xd8/0x17c fs/super.c:1432
 gadgetfs_get_tree+0x26/0x30 drivers/usb/gadget/legacy/inode.c:2095
 vfs_get_tree+0x7e/0x314 fs/super.c:1947
 fc_mount+0x1c/0x1d6 fs/namespace.c:1198
 do_new_mount_fc fs/namespace.c:3772 [inline]
 do_new_mount fs/namespace.c:3848 [inline]
 path_mount+0x6ae/0x1dd0 fs/namespace.c:4168
 do_mount fs/namespace.c:4181 [inline]
 __do_sys_mount fs/namespace.c:4397 [inline]
 __se_sys_mount fs/namespace.c:4374 [inline]
 __riscv_sys_mount+0x5c2/0x778 fs/namespace.c:4374
 syscall_handler+0x92/0x114 arch/riscv/include/asm/syscall.h:112
 do_trap_ecall_u+0x4ca/0x658 arch/riscv/kernel/traps.c:341
 handle_exception+0x168/0x174 arch/riscv/kernel/entry.S:237

Freed by task 3856:
 stack_trace_save+0xa0/0xd2 kernel/stacktrace.c:122
 kasan_save_stack+0x3e/0x66 mm/kasan/common.c:57
 kasan_save_track+0x16/0x28 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x5c mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5e/0x7e mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6508 [inline]
 kfree+0x298/0x774 mm/slub.c:6801
 put_dev+0xc8/0xe0 drivers/usb/gadget/legacy/inode.c:169
 gadgetfs_unbind+0x1a8/0x21a drivers/usb/gadget/legacy/inode.c:1673
 gadgetfs_bind+0x620/0x80e drivers/usb/gadget/legacy/inode.c:1713
 gadget_bind_driver+0x228/0xafa drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x222/0xa8e drivers/base/dd.c:706
 __driver_probe_device+0x1d6/0x46c drivers/base/dd.c:868
 driver_probe_device+0x5e/0x162 drivers/base/dd.c:898
 __driver_attach+0x1fc/0x57e drivers/base/dd.c:1292
 bus_for_each_dev+0x126/0x1bc drivers/base/bus.c:383
 driver_attach+0x3e/0x52 drivers/base/dd.c:1310
 bus_add_driver+0x2c8/0x612 drivers/base/bus.c:763
 driver_register+0x1a4/0x3b4 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0x10c/0x2d2 drivers/usb/gadget/udc/core.c:1752
 dev_config+0x7ea/0x1450 drivers/usb/gadget/legacy/inode.c:1893
 vfs_write+0x308/0x1020 fs/read_write.c:685
 ksys_write+0x126/0x244 fs/read_write.c:739
 __do_sys_write fs/read_write.c:750 [inline]
 __se_sys_write fs/read_write.c:747 [inline]
 __riscv_sys_write+0x6e/0xa0 fs/read_write.c:747
 syscall_handler+0x92/0x114 arch/riscv/include/asm/syscall.h:112
 do_trap_ecall_u+0x4ca/0x658 arch/riscv/kernel/traps.c:341
 handle_exception+0x168/0x174 arch/riscv/kernel/entry.S:237

The buggy address belongs to the object at ffffaf801a714000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 153 bytes inside of
 freed 1024-byte region [ffffaf801a714000, ffffaf801a714400)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffffaf801a712000 pfn:0x9a710
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x240(workingset|head|node=0|zone=0)
page_type: f5(slab)
raw: 0000000000000240 ffffaf8012001dc0 ffff8d8002782610 ffff8d8002686610
raw: ffffaf801a712000 000000000010000f 00000000f5000000 0000000000000000
head: 0000000000000240 ffffaf8012001dc0 ffff8d8002782610 ffff8d8002686610
head: ffffaf801a712000 000000000010000f 00000000f5000000 0000000000000000
head: 0000000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 3068, tgid 3068 (default.script), ts 218016493900
 __set_page_owner+0x92/0x4b0 mm/page_owner.c:359
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xe2/0x19e mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x916/0x3a04 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x274/0x35b2 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab mm/slub.c:3462 [inline]
 new_slab+0x94/0x6ea mm/slub.c:3513
 refill_objects+0x20a/0x3ba mm/slub.c:7417
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x282/0x5fe mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x58e/0x8fc mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 tomoyo_init_log+0x10a6/0x1e76 security/tomoyo/audit.c:273
 tomoyo_supervisor+0x40a/0x1944 security/tomoyo/common.c:2232
 tomoyo_audit_env_log security/tomoyo/environ.c:37 [inline]
 tomoyo_env_perm+0x196/0x1f0 security/tomoyo/environ.c:64
 tomoyo_environ security/tomoyo/domain.c:673 [inline]
 tomoyo_find_next_domain+0x1254/0x1c9c security/tomoyo/domain.c:889
 tomoyo_bprm_check_security security/tomoyo/tomoyo.c:102 [inline]
 tomoyo_bprm_check_security+0x118/0x1a6 security/tomoyo/tomoyo.c:92
 security_bprm_check+0xb4/0x24e security/security.c:820
 search_binary_handler fs/exec.c:1755 [inline]
 exec_binprm fs/exec.c:1797 [inline]
 bprm_execve fs/exec.c:1853 [inline]
 bprm_execve+0x7d6/0x1aac fs/exec.c:1829
 do_execveat_common.isra.0+0x45e/0x560 fs/exec.c:1951
page last free pid 3065 tgid 3065 ts 215013919100 stack trace:
 __reset_page_owner+0x76/0x1bc mm/page_owner.c:338
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x6a8/0x13a2 mm/page_alloc.c:2962
 free_frozen_pages+0xe/0x16 mm/page_alloc.c:2999
 __free_slab+0xda/0x250 mm/slub.c:3528
 free_slab+0x28/0x16c mm/slub.c:3562
 discard_slab mm/slub.c:3568 [inline]
 __slab_free+0x23e/0x2fe mm/slub.c:5823
 ___cache_free+0x94/0xac mm/slub.c:6580
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x64/0x134 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x152/0x1b4 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x5c/0x82 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 kmem_cache_alloc_noprof+0x1f6/0x6a2 mm/slub.c:5010
 mt_alloc_one lib/maple_tree.c:139 [inline]
 mas_alloc_nodes lib/maple_tree.c:1086 [inline]
 mas_preallocate+0xb0e/0xd74 lib/maple_tree.c:5057
 vma_iter_prealloc mm/vma.h:665 [inline]
 commit_merge+0x2ae/0x235e mm/vma.c:834
 vma_expand+0x3c6/0xa86 mm/vma.c:1302
 relocate_vma_down+0x26c/0x458 mm/vma_exec.c:63
 setup_arg_pages+0x6a4/0xd24 fs/exec.c:695

Memory state around the buggy address:
 ffffaf801a713f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffffaf801a714000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffffaf801a714080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffffaf801a714100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffffaf801a714180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

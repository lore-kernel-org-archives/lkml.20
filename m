Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ADC2F7F17
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789247045; cv=none; b=DX83YWo1j/ef46OcSDmCKvZGgClGO/rtg3E6o6io/2yE6wMFHuqFRVH+wouYNya+NOWOLzhNfyBpIOtadFgILQhBg/6v2KqSW91sqADGbpw/IuuSuj2c5LsHvgdO0jxbwH4g1NBhqDynon4jn1trV0viWuC4GAhnm0VhjIslQ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789247045; c=relaxed/simple;
	bh=DpqAtUwFSLg5upmwnXE1eIirrFUGIVMWP9/sUXivh6I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HGUr9u0gD5mu3MKujnjajBnrJWL45ryjIMy+lwEgAhnnmPEs6VEjg53qKVNg9KqJQtRqOlz2X/h8UcRa/vhZVtsh22nhRMuLi8DQR3FxeJmd0V0a7mhBtVit3iCFvVDh0lxglAyO9jNirMvTkEb++Fw8KDnznF+yQynsoxkZdYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a313ec13ceso2898013eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789247042; x=1789851842;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9+rqwHmmVDEHHSOZvwyMPE3jzNeaxb+YWK3bfeJ4EFg=;
        b=rOwY84EaSvfwGS2EXkctY7MLYsMz4KRWpwLNYwqRbOylNm7vBzHbTbOLwMSD4sqOpX
         A7o5ZWFNwQxFaL9spWLcUpo/xigYEnyIrwScxd0afGrrjNknG5u9fx4MyDrFEWRQYxIk
         AM0PethItORvu4oVCEephDSSaP6HT604jYgVpzwhu/+WSwF5BiycnKsqqHTFUSAA8H0b
         7jrZjRQYYBjBnU3ceOAo7LInZ7bB1CirV7fwV1nFaZP2MMMp8/wroS2uVEVdrY74MBHE
         oRChwYUm38/nWk6Eqeq4QUCwg7LJbOYVAWSt2fMptuT/vMhEu+wFbGR4VYdHqbjse5m0
         YRLg==
X-Forwarded-Encrypted: i=1; AKwUvBwR8X0KJjiCvLo/swsfd49FNwR289xxbroA40RVnrvVYw12RLfbiAWkHyOWWgFLl/yCNdifVUC84yUiCCE=@vger.kernel.org
X-Gm-Message-State: AFuF++mYTr528SlsPq9fm60+P+m5JrEMpUmgPUNIvAFMo9aUGlxd3utD
	jAgmpSFEi47cAVgHwUmgP0OTTQCgP8fVV4rq4/SW+3EV4V7wqy2PClHdfdBLSjqivsz1/ZQdCyB
	qJk/dckNyyTcWhyARmIjlcqtZiKsnqi5LcJIfx3QwKaguaXim4X8hj3ne9q0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2213:b0:6c2:5e92:b599 with SMTP id
 006d021491bc7-6c25e92c715mr3987137eaf.4.1789247042665; Sat, 12 Sep 2026
 14:04:02 -0700 (PDT)
Date: Sat, 12 Sep 2026 14:04:02 -0700
In-Reply-To: <20260912204938.30062-1-jcperdomo100@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa5be42.6e6c5f9e.28f11f.0051.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] possible deadlock in rfcomm_dlc_close
From: syzbot <syzbot+0cece8fa7d83523f47a3@syzkaller.appspotmail.com>
To: jcperdomo100@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in bt_accept_unlink

==================================================================
BUG: KASAN: slab-use-after-free in __raw_spin_lock_bh include/linux/spinlock_api_smp.h:182 [inline]
BUG: KASAN: slab-use-after-free in _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:205
Read of size 1 at addr ffff8880553d85a0 by task krfcommd/3367

CPU: 0 UID: 0 PID: 3367 Comm: krfcommd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 __kasan_check_byte+0x36/0x50 mm/kasan/common.c:574
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire kernel/locking/lockdep.c:5916 [inline]
 lock_acquire+0x132/0x380 kernel/locking/lockdep.c:5899
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:182 [inline]
 _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:205
 spin_lock_bh include/linux/spinlock.h:353 [inline]
 bt_accept_unlink+0x64/0x370 net/bluetooth/af_bluetooth.c:263
 rfcomm_sk_state_change+0x319/0x3d0 net/bluetooth/rfcomm/sock.c:83
 __rfcomm_dlc_close.isra.0+0x1e3/0x750 net/bluetooth/rfcomm/core.c:490
 rfcomm_session_close.isra.0+0xd5/0x190 net/bluetooth/rfcomm/core.c:753
 rfcomm_process_rx net/bluetooth/rfcomm/core.c:2029 [inline]
 rfcomm_process_sessions net/bluetooth/rfcomm/core.c:2114 [inline]
 rfcomm_run+0x6dd/0x54c0 net/bluetooth/rfcomm/core.c:2204
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 7393:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kmalloc_noprof+0x32f/0x840 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 sk_prot_alloc+0x10b/0x2a0 net/core/sock.c:2251
 sk_alloc+0x36/0xe80 net/core/sock.c:2307
 bt_sock_alloc+0x3b/0x3c0 net/bluetooth/af_bluetooth.c:148
 rfcomm_sock_alloc.constprop.0+0x51/0x2a0 net/bluetooth/rfcomm/sock.c:290
 rfcomm_sock_create+0xf1/0x180 net/bluetooth/rfcomm/sock.c:328
 bt_sock_create+0x185/0x350 net/bluetooth/af_bluetooth.c:132
 __sock_create+0x339/0x860 net/socket.c:1676
 sock_create net/socket.c:1734 [inline]
 __sys_socket_create net/socket.c:1771 [inline]
 __sys_socket+0x14d/0x260 net/socket.c:1818
 __do_sys_socket net/socket.c:1832 [inline]
 __se_sys_socket net/socket.c:1830 [inline]
 __x64_sys_socket+0x72/0xb0 net/socket.c:1830
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 7392:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6508 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6801
 sk_prot_free net/core/sock.c:2290 [inline]
 __sk_destruct+0x88c/0xab0 net/core/sock.c:2390
 sk_destruct+0xc8/0xf0 net/core/sock.c:2418
 __sk_free+0xf4/0x3e0 net/core/sock.c:2429
 sk_free+0x61/0x90 net/core/sock.c:2440
 sock_put include/net/sock.h:2020 [inline]
 rfcomm_sock_kill net/bluetooth/rfcomm/sock.c:213 [inline]
 rfcomm_sock_kill+0x12b/0x230 net/bluetooth/rfcomm/sock.c:203
 rfcomm_sock_release+0x119/0x1a0 net/bluetooth/rfcomm/sock.c:942
 __sock_release+0xb3/0x260 net/socket.c:735
 sock_close+0x1c/0x30 net/socket.c:1526
 __fput+0x3ff/0xb50 fs/file_table.c:512
 task_work_run+0x150/0x240 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x1d8/0x700 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:336 [inline]
 do_syscall_64+0x661/0x790 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880553d8000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 1440 bytes inside of
 freed 2048-byte region [ffff8880553d8000, ffff8880553d8800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff8880553dd000 pfn:0x553d8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000240 ffff88801c042f00 ffffea0000d5a810 ffffea0000d83610
raw: ffff8880553dd000 0000000000080005 00000000f5000000 0000000000000000
head: 00fff00000000240 ffff88801c042f00 ffffea0000d5a810 ffffea0000d83610
head: ffff8880553dd000 0000000000080005 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 6186, tgid 6186 (syz-executor), ts 85585809850
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35d0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab mm/slub.c:3462 [inline]
 new_slab+0xa9/0x6e0 mm/slub.c:3513
 refill_objects+0xe3/0x410 mm/slub.c:7417
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __kmalloc_cache_noprof+0x4f4/0x6d0 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 rxrpc_alloc_connection+0xa3/0x770 net/rxrpc/conn_object.c:62
 rxrpc_prealloc_service_connection+0x26/0x390 net/rxrpc/conn_service.c:123
 rxrpc_service_prealloc_one+0x2c5/0x1040 net/rxrpc/call_accept.c:86
 rxrpc_kernel_charge_accept+0xdd/0x120 net/rxrpc/call_accept.c:489
 afs_charge_preallocation+0xd8/0x360 fs/afs/rxrpc.c:766
 afs_open_socket+0x31e/0x3f0 fs/afs/rxrpc.c:112
 afs_net_init+0x825/0xb00 fs/afs/main.c:116
 ops_init+0x1e2/0x5f0 net/core/net_namespace.c:137
 setup_net+0x118/0x3a0 net/core/net_namespace.c:443
page last free pid 6013 tgid 6003 ts 80477321559 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x79f/0x10f0 mm/page_alloc.c:2962
 __folio_put+0x3b4/0x5f0 mm/folio.c:105
 folio_put include/linux/mm.h:2160 [inline]
 put_page include/linux/mm.h:2229 [inline]
 put_netmem include/net/netmem.h:394 [inline]
 skb_page_unref include/linux/skbuff_ref.h:43 [inline]
 __skb_frag_unref include/linux/skbuff_ref.h:56 [inline]
 skb_release_data+0x649/0x8e0 net/core/skbuff.c:1116
 skb_release_all net/core/skbuff.c:1197 [inline]
 __napi_kfree_skb net/core/skbuff.c:1494 [inline]
 kfree_skb_napi_cache net/core/skbuff.c:7313 [inline]
 skb_attempt_defer_free+0x2ed/0x830 net/core/skbuff.c:7346
 tcp_eat_recv_skb net/ipv4/tcp.c:1621 [inline]
 tcp_recvmsg_locked+0x11ed/0x2a30 net/ipv4/tcp.c:2899
 tcp_recvmsg+0x141/0x630 net/ipv4/tcp.c:2944
 inet6_recvmsg+0xd5/0x4c0 net/ipv6/af_inet6.c:656
 sock_recvmsg_nosec net/socket.c:1151 [inline]
 sock_recvmsg+0x102/0x220 net/socket.c:1173
 sock_read_iter+0x2b0/0x3a0 net/socket.c:1242
 new_sync_read fs/read_write.c:493 [inline]
 vfs_read+0x960/0xb40 fs/read_write.c:574
 ksys_read+0x1f8/0x250 fs/read_write.c:716
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880553d8480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880553d8500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880553d8580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                               ^
 ffff8880553d8600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880553d8680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         cba2348a Merge tag 'xfs-fixes-7.3-rc3' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16eb2925580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=0cece8fa7d83523f47a3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13371905580000


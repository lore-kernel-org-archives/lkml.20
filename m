Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793116253;
	b=l2sQbHHNq6c98SF0W+ELDbq3wBqB4bzKuRSLxafnp1KSP+oX2rhSZEzSsgA2Ckabn1ga
	 MHlVk7rl74x8cN1/fSJAfyVPyTnp6j1EFwWYisRpDZrty4IJpt1TwIRbAcLNSJnRZtT9P
	 3yqz7llEJcW5CXiyChxCFUngFQSjEJL3bkgSnaGr56hMR/KxO4jgKSmqiFQFrCktyZIJc
	 SYATrPuYwIi5zzKipwtlb6xO6hCJCQsh9o9kEHYBKn60hgDm9musezwie8Kj6twswvAZD
	 MJcXZkNSe8E+xdd3QUfQ9NOBt71uQu55gyHh7N1NLbYfesPafmp/b8VH8gqoHjq6Cug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Mcs8JnL10jM1KxNtIsGEU+k5bUFOThMnLKcaam3QLzY=;
	b=EL4NzIJNDq3E1HSHSPqm9PftwgNKyu8uXLcJVkQrOJLy7cCodgft94wm3UTZ3ZCthYHQ
	 hKKujm3tylVqOt/E9p7O01ZkHQy0F0936pG6U9j35ExDpU3cvU8KXwUPez5tVmNd0QKEQ
	 vkQuhF6CD7reApId+4fynJRVbUvD2eBKeLjaPYUqt8x9nfjyMRJkjviDSlh0s7hRF9tMw
	 QLhCFCj86DZooeWWczR9THyL/vu/86onaMT4YSXMzl1oSLZyU0v701kw5MK2CG/OuAU1W
	 tiRagf0T7Zi4lxKV+nJ1iSTNYGz7912fnSKhHW1tn6TR74KpTaReE/TyKPWHVHjQlTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=K9ItsBD6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6034D606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6034D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=K9ItsBD6
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso28426595e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793116252; cv=none;
        d=google.com; s=arc-20260327;
        b=gGaF0r9RAO8WrmFZNL5w0W30+vxbiMEZjtjJ/gP02O/rzPYU+RXdlFdzyyozad4Zeo
         9VcQRTCeEQ0Mb1Qm3ZNr6YvFO7ILOKa6Qb7GYVtYtcxM48OiRVI5GHySACwVC60Ib7Ly
         OnPSkR6dMlXOVkRv1VgHbteExKYJX4lB1UFuxLNI4DogHqLZ3DjuBET8Nul2JbB0c4eM
         DGA7RDUPUJpKdLFQFiL8dX+z1HtIlHE68R7pvf2qLmuuXsneMsOwEvPJ3rF2rpjbRDkk
         dyYEObWyS4FI57wjPvuiHJIPG5+K1IKNOFeYDij3tgxzZHMgUwr7rekdyOfIy2eEA0fl
         PRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mcs8JnL10jM1KxNtIsGEU+k5bUFOThMnLKcaam3QLzY=;
        fh=O9lwvDwrbj8iml6+ihQTkl6HJG28VXZ19RsBWokcg8U=;
        b=sA6ZBLvBdr12iGiUbGXuIa+57a4eKsd4EAOLSaEkpYsltpA/4Q2LRrGp+de/ttqQ48
         BN4X1EKJZgfrcehdCDGp6GmSET/YEtj+C59yTJNyQqw1gNjBdI9jcTfkvDdQRu+zjkxI
         rNA5M5eAZadM1lQabptbpYNvBler1ClkAGBIulFiDvpSibz0MGcf0hIVFHWAyUKlYzqh
         oNi4mAmvQxISKUkDxo4spnFL4oOnpBafaMP5SI3OumuTGysPfmjMJ/R6mpS1+bS/3MR7
         IusO3E6b9MYGIcg6dvFwth5gO1L8Q3yCURDvdtwSDZoM6be1MduXGw2eKoxKkgsyjdJd
         dzfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793116252; x=1793721052; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mcs8JnL10jM1KxNtIsGEU+k5bUFOThMnLKcaam3QLzY=;
        b=K9ItsBD67RRqrnEFh+zCaHtcW3bD3TS4JwznM/2q2ashS19zlSHQQyu5GjBet9ZHlJ
         s0rgQz83BdLAcNfjH6v4sPBGE+VBRctYKF2oLhKwp5yuXotXI41qtCuOvNlkfX3q8u6Q
         zAaIokQ9LfIZoiy66T5i0pJ5+tmNeyJ6+gTtgRhCwLtf77Pp6n2uMuPq9x2Fif30lh0H
         BB/bWb8s5dbB6xUhWMbw18Gz2f8vIWpr5gu8h4SL+dKHKeBtQjqkbn+xGBEJA3ap3Cv7
         NVqWDQ0KPmDgQRMcnp1onsiqnm1SRgpjf+IYuzn3wHZyvJcGaZmEpWMQdpcKl4hgDs77
         Yc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116252; x=1793721052;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mcs8JnL10jM1KxNtIsGEU+k5bUFOThMnLKcaam3QLzY=;
        b=gCYihaDTAsRS8gPYTJUCJVeu7QB0BJ1XtJM9DOb9oc95mw4CfYAbUarJDp3OaUDhr7
         AXtV0DZ2qLXyb4t2UkUMbKix+YgXC/w/DXHDwhjFiRIjlPtfqh1Ret4zPGLash+OEEtE
         LuHvcGlFdnnV6woMSS/TDDgH2m4PW4RYoEVBzqtjNrmYhu1J6uPB5vta/3vGMnrFAvc0
         ViQyoxzWCbU7moXlDhX016UhzI8gX/T4VeYoJ/bC3QdYTsFM5YaxwPDtAep5azdjarbE
         y6TOrI6KXGCfVacXNCkbJdFJ1S1muWF2oPl6KYHnm4IwBt6P+Lj+FZI+raGm9G2RvWOC
         6uGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNbtDg9fGNO4a0TaZpbVisU8ibpNWVQOTeoudg5K/0CLAfCHeVbJYgCTNjaidtQNThflRO/rUxco039LA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7lcolUrtvjgpXLellnIB75F6BFed7g0baDjquIqAhBHklIFFD
	jATKxrh++IlxWU5k3UCHt/LUTLgAMPVO5opUlM4eT0qivyTAmNVQLy7AKtbSgWlra/Ei0PQCbMP
	ac86TdBJJFF9TVItfhn1mndD8BnmoXGyzTgUbOEejGw==
X-Gm-Gg: AYBFou3xv7ZACzlNUkTZD0kHjrbX8Axbrk4Py1WjXmY+Pokyy4N73GtlIN/FMSLTgdY
	W7+yV34zDYHxqHlR3gPXzqEwV7IxEZJ9GQhu5B2H5LGVKPu+mMdWvJANAgszg7aKUL5lHnnIDqp
	qNgnVHNIVcOQXkj78wBrvNrdXyap9phFfA0NtWM8GMLedvCE93n6+97HwlCB1ix9r0gqtvORQ02
	cJpNM/tp+JZZeA0lcRTuHaAKO8A5RUhAmfL4kAMZXO8GbBGuLXwnE6CXhwhl3Gm/4+XxcU4uwUt
	UZDy/DYWzmgkoVfns+P3REzOaug6TH6mbOpAWaGrnBeWBfaR80z1fOohPnoAwYtD2xTP4BC84r5
	KKx4EOctGHXg8J1SohESOEOp0IFFdAESkSy6jy2iZPmQNef3xHlulrhT5SCvZYZMGJY5F4DTi4X
	zqCcSEgsEuHHbcVExTMUKGTWOSKVVSaeNVLw==
X-Received: by 2002:a05:600d:82c3:b0:4a5:1cf1:b7bd with SMTP id
 5b1f17b1804b1-4a51cf1b880mr182424845e9.16.1793116251642; Tue, 27 Oct 2026
 08:50:51 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6ad8d80e.d1c214cc.659fa.0028.GAE@google.com>
In-Reply-To: <6ad8d80e.d1c214cc.659fa.0028.GAE@google.com>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 27 Oct 2026 16:50:40 +0100
X-Gm-Features: AclHuK95_P7g-eyR-PQyHjKwzWo9AfVPW4hzwamPk4eA0FOPUTWk7TuuODd_Eg8
Message-ID: <CAPjX3Ff7_R7XkiQu+CPr8WSEZtfu6jjpdeSahaSjFTMCKV1Tyg@mail.gmail.com>
Subject: Re: [syzbot] [btrfs?] WARNING in btrfs_put_transaction (6)
To: syzbot <syzbot+08b7cbf4e9ac1f9139bf@syzkaller.appspotmail.com>, 
	WenRuo Qu <wqu@suse.com>, Filipe Manana <fdmanana@suse.com>
Cc: clm@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mason@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 at 17:26, syzbot
<syzbot+08b7cbf4e9ac1f9139bf@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    58161ead29e5 Merge tag 'drm-fixes-2026-10-17' of https://g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=12d89621580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4ccb65e03706547e
> dashboard link: https://syzkaller.appspot.com/bug?extid=08b7cbf4e9ac1f9139bf
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-58161ead.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/b76eb31da21c/vmlinux-58161ead.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/fca526cf319c/bzImage-58161ead.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+08b7cbf4e9ac1f9139bf@syzkaller.appspotmail.com
>
> RAX: ffffffffffffffda RBX: 00007fc8df425fa0 RCX: 00007fc8df19e559
> RDX: 000020000001e740 RSI: 000000008004587d RDI: 0000000000000008
> RBP: 00007fc8df235ab8 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007fc8df426038 R14: 00007fc8df425fa0 R15: 00007ffe864adf08
>  </TASK>
> FAULT_INJECTION: forcing a failure.
> name failslab, interval 1, probability 5, space 0, times 9992
> CPU: 0 UID: 0 PID: 5325 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>  fail_dump lib/fault-inject.c:73 [inline]
>  should_fail_ex+0x410/0x560 lib/fault-inject.c:174
>  should_failslab+0xa8/0x100 mm/failslab.c:46
>  slab_pre_alloc_hook mm/slub.c:4638 [inline]
>  slab_alloc_node mm/slub.c:4974 [inline]
>  kmem_cache_alloc_lru_noprof+0xa7/0x5f0 mm/slub.c:5029
>  __xas_nomem+0x33d/0x420 lib/xarray.c:341
>  __xa_cmpxchg_raw lib/xarray.c:1789 [inline]
>  __xa_cmpxchg+0x138/0x1f0 lib/xarray.c:1769
>  xa_cmpxchg include/linux/xarray.h:699 [inline]
>  xa_reserve include/linux/xarray.h:1088 [inline]
>  add_delayed_ref+0x2ac/0x1ed0 fs/btrfs/delayed-ref.c:1073
>  btrfs_alloc_tree_block+0xce7/0x1160 fs/btrfs/extent-tree.c:5426
>  btrfs_force_cow_block+0x562/0x1bf0 fs/btrfs/ctree.c:501
>  btrfs_cow_block+0x3f1/0xaf0 fs/btrfs/ctree.c:696
>  btrfs_search_slot+0xd70/0x2d20 fs/btrfs/ctree.c:-1
>  btrfs_insert_empty_items+0xa3/0x1a0 fs/btrfs/ctree.c:4310
>  btrfs_insert_delayed_item fs/btrfs/delayed-inode.c:755 [inline]
>  btrfs_insert_delayed_items fs/btrfs/delayed-inode.c:832 [inline]
>  __btrfs_commit_inode_delayed_items+0xb0e/0x1ec0 fs/btrfs/delayed-inode.c:1115
>  __btrfs_run_delayed_items+0x1d0/0x420 fs/btrfs/delayed-inode.c:1158
>  btrfs_commit_transaction+0x844/0x3170 fs/btrfs/transaction.c:2384
>  sync_filesystem+0x1d2/0x240 fs/sync.c:66
>  freeze_super+0x52e/0x11c0 fs/super.c:2300
>  btrfs_ioctl_shutdown+0x146/0x1b0 fs/btrfs/ioctl.c:5183
>  btrfs_ioctl+0xbcd/0xd50 fs/btrfs/ioctl.c:5697
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:597 [inline]
>  __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fc8df19e559
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fc8e012ffe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007fc8df425fa0 RCX: 00007fc8df19e559
> RDX: 000020000001e740 RSI: 000000008004587d RDI: 0000000000000008
> RBP: 00007fc8df235ab8 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007fc8df426038 R14: 00007fc8df425fa0 R15: 00007ffe864adf08
>  </TASK>
> BTRFS error (device loop0 state A): Transaction 9 aborted (-ENOMEM)
> BTRFS: error (device loop0 state A) in __btrfs_run_delayed_items:1161: errno=-12 Out of memory
> BTRFS info (device loop0 state EA): forced readonly
> BTRFS warning (device loop0 state EA): Skipping commit of aborted transaction.
> BTRFS: error (device loop0 state EA) in cleanup_transaction:2074: errno=-12 Out of memory
> ------------[ cut here ]------------
> !xa_empty(&transaction->delayed_refs.head_refs)
> WARNING: fs/btrfs/transaction.c:146 at btrfs_put_transaction+0x537/0x570 fs/btrfs/transaction.c:146, CPU#0: syz.0.0/5325

Maybe something like this (totally untested):

diff --git a/fs/btrfs/delayed-inode.c b/fs/btrfs/delayed-inode.c
index 097fe6ec60ba..cadbb73e40fa 100644
--- a/fs/btrfs/delayed-inode.c
+++ b/fs/btrfs/delayed-inode.c
@@ -1155,11 +1155,11 @@ static int __btrfs_run_delayed_items(struct
btrfs_trans_handle *trans, int nr)

     curr_node = btrfs_first_delayed_node(fs_info, &curr_delayed_node_tracker);
     while (curr_node && (!count || nr--)) {
-        ret = __btrfs_commit_inode_delayed_items(trans, path,
-                             curr_node);
-        if (unlikely(ret)) {
-            btrfs_abort_transaction(trans, ret);
-            break;
+        if (!ret) {
+            ret = __btrfs_commit_inode_delayed_items(trans, path, curr_node);
+
+            if (unlikely(ret))
+                btrfs_abort_transaction(trans, ret);
         }

         prev_node = curr_node;
@@ -1184,8 +1184,6 @@ static int __btrfs_run_delayed_items(struct
btrfs_trans_handle *trans, int nr)
      */
     btrfs_free_path(path);

-    if (curr_node)
-        btrfs_release_delayed_node(curr_node, &curr_delayed_node_tracker);
     trans->block_rsv = block_rsv;

     return ret;

--nX

> Modules linked in:
> CPU: 0 UID: 0 PID: 5325 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> RIP: 0010:btrfs_put_transaction+0x537/0x570 fs/btrfs/transaction.c:146
> Code: fd fb ff ff e8 9a e8 ac fd 4c 89 f7 be 03 00 00 00 48 83 c4 18 5b 41 5c 41 5d 41 5e 41 5f 5d e9 6f 17 c7 00 e8 7a e8 ac fd 90 <0f> 0b 90 e9 65 fb ff ff e8 6c e8 ac fd 90 0f 0b 90 e9 82 fb ff ff
> RSP: 0018:ffffc9000f7978b0 EFLAGS: 00010287
> RAX: ffffffff841b39b6 RBX: ffff888013966000 RCX: 0000000000100000
> RDX: ffffc9000ef1a000 RSI: 000000000002eb87 RDI: 000000000002eb88
> RBP: dffffc0000000000 R08: ffff888013966013 R09: 1ffff1100272cc02
> R10: dffffc0000000000 R11: ffffed100272cc03 R12: ffff888053ca4758
> R13: ffff888054d34d40 R14: ffff888013966350 R15: dffffc0000000000
> FS:  00007fc8e01306c0(0000) GS:ffff88808b0b4000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fc8d3fff000 CR3: 0000000044c6d000 CR4: 0000000000352ef0
> Call Trace:
>  <TASK>
>  cleanup_transaction+0x5c5/0x7c0 fs/btrfs/transaction.c:2122
>  btrfs_commit_transaction+0x2627/0x3170 fs/btrfs/transaction.c:2676
>  sync_filesystem+0x1d2/0x240 fs/sync.c:66
>  freeze_super+0x52e/0x11c0 fs/super.c:2300
>  btrfs_ioctl_shutdown+0x146/0x1b0 fs/btrfs/ioctl.c:5183
>  btrfs_ioctl+0xbcd/0xd50 fs/btrfs/ioctl.c:5697
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:597 [inline]
>  __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fc8df19e559
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fc8e012ffe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007fc8df425fa0 RCX: 00007fc8df19e559
> RDX: 000020000001e740 RSI: 000000008004587d RDI: 0000000000000008
> RBP: 00007fc8df235ab8 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007fc8df426038 R14: 00007fc8df425fa0 R15: 00007ffe864adf08
>  </TASK>
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>

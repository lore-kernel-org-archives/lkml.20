Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023211;
	b=fnS2hrX//C2/C+JqzbvAqTL6YvegoyPgDLvmI27eDn9idvOmkY1PcooVH9cw33kkQG6/
	 QglAnN+gZeOb/zRUwoz45Snsgqqh3b4jUOMluy4TeDjbgQDFhgZCb7NU5CsI0tc+dExqd
	 6iTu3ilxramfHWxNSepe9KIv7kSyEvjJAcXT+0MyLAB+Tdz/JnCSk8btcnQ/OnzB2a9m6
	 mWGuYIunX7CYVeD3gNNmE6BvXZKRhIgsGbwtJNdWg2gfDrwX5CkjbaoDLx7kbbYr5JyDr
	 m0KEGZeYUhDBii6bVtXM2CgJI7SvqrmsMwEhIN0WLsLnPn0X5zCR/QvMDuup+LLpBRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6wr612XWZYRRyV/cIOfnlm2eiTQhWutx6nJp7Q9El0E=;
	b=0v7OqJWtOrnapOt7UylmPpRYWw6cYHmuvAmCmolH7cHZsjAQ4KEO75fNViLmbcRfhU9W
	 +NJ6DdqgMmWrG3W47ZdRrVDq2/ZeZFIdOuRWzsNen7ipW9dfRdcFaQeRwIw802eaPeLt4
	 u4u4Uzbw5/+s4Q5npN/F/9VlWPM6CTsVG2EA8cBKsRy/udUIPZb1P46t6UzZEukYeaSOc
	 Fz9EmVEN48B8UJVt9wkQhvg4wdqb0OUtbaaTfSbu6IsRErK/pq/Pl5OHNZ8iao1RQtUxH
	 z6QRNqPzIj3aCdFUpw98ch0OY5a4NeLFpIQRQdxwpLwOrdTPJmlofHzSy8/19UnN/Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cFC5ECzD;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C79606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C79606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cFC5ECzD
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso1657420a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793023210; x=1793628010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wr612XWZYRRyV/cIOfnlm2eiTQhWutx6nJp7Q9El0E=;
        b=cFC5ECzD+J0Q0ixrzPYI7uJ+zkLfEnE0q3NMuK2S6Jy1Dtr7bMsSm8oeA7MLUGt9hG
         Iv22gag7vTDpAXoxvodqIbnYz1DcNFPPh9zPhKvEI+0YGfFMcKY6DmoHczhgDVEOvSc+
         cdZRi6drG4sG/CN/komhZThZ/+sG59/ZFMcii/0NBcr7GRMBqpvYsARMAkxl0W9f//lS
         TKDRa2R4yqccFd67L2a+4XFEXPkMlmqCFUxW8lTKqa8hMIEFoP+AL4rZDOcX9EwKVxif
         we5VnC7yhJSopigunozf6zE2FlYzqS4LPLtInkttukZm5YAknZ/j/OKdLlK6WoyM6KLO
         VWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023210; x=1793628010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wr612XWZYRRyV/cIOfnlm2eiTQhWutx6nJp7Q9El0E=;
        b=YbpezxzdHCcNrqE7w6IcerUFU6RWFi/vemJJS7+B2alGy9HZc7dQFXW6xOd9bY7+pc
         lOCRQYqHW7dDvIdhwFnoqLlKO7jcqoDlWutJx2qUvpmUXgZFnzYR0sBua76wX8laz38Y
         a9ASqAW7ylZech9ZpKC/8gTzudAPQwqzizIQ1oetxWlVW68nG/FJJgvrt+32x9NYn08C
         cKe8ilhgiHuncqXlIn7WCSpJBsdsa04ylU7aVeHHyd6khTxqXFEBggGPG6bhfVHfXorn
         jg1cmq8eNVmp/npy9Uf5Z8HWfJ7v148DhwG2QB8xnPgVoj54OfMweRrrdWDDc2fuxfvG
         zOAA==
X-Forwarded-Encrypted: i=1; AKwUvBzj4nrU0qRu0Vop81KXQcAvbPzE2PgXAegeYA34Mh/L5PMyhHDJnGM3+vbVL9SfqEh8pgZKEing4b8/q3o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVgF4BGNFhJi7pZl+rB1frHu9dUOWvN4A5ATDgnjJlOV1B4lG4
	NjL3V3t1p+fCdOOfxWPjGdxuzpNUisXMj0L301O+46B2kGuYOdR3C9pK
X-Gm-Gg: AYBFou3jpMqUvJYnahyqEkownVDoSYD9bkSDO+ZMMH0yw7t5lntPhxi7+nY0N16u3tn
	SvIVhZrboLQlsxxVCjqPHIFgQ/bzl/8icmCws7FYAp/iVcw/N8yJ84khuVEM21EF/I0XSls8mDQ
	H6/XBVwSahPibUa05RL3DbfPRqU9cccXX2/uHAtgz9kghMzluBIDNE6aK5MOfxkxNNZw68R3vnd
	wjf+4yF9Np0RGqGldbIlmpxXOepugPHPIjRuQBW7gJMS2qqbss7J6Ja41tOzC3iWxE4wsTuQJ3+
	J3GpoUqGljHFqTVp4mO4DQfqfAoe7vt6QuTosX+x+W/w3jW+Kj88CwEHWUZDRHDxC9YIlYpgUkt
	RVhYaTv9yy7Q3mMvc+ngx84PY3vDqN1G3rxTTH8bItjPIhskc69lH8RP02BrJHIfWKVY9Y81GvY
	MBduSYyyPkO4/qHcM7+rRlC4QMwsHqaNQz9UfkKJW96TDlDpo78r/JbU5HY/Fak3B9HfvDlsOXS
	TxbxOzi0QkgH6734C+uLlGWaYvlV5mf7Cd4OHCh+G3NTg5wR2c=
X-Received: by 2002:a17:90b:5690:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3ade946ccebmr5951400a91.0.1793023208784;
        Mon, 26 Oct 2026 07:00:08 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb27a1bsm8519188a91.15.2026.10.26.07.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:00:08 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ocfs2: advance locking_state through the live cursor
Date: Mon, 26 Oct 2026 22:00:01 +0800
Message-Id: <pm-ocfs2-objects-candidate-0053-v5-76075d5da2df8108f813@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

locking_state copies each lock resource under ocfs2_dlm_tracking_lock
so its containing inode or quota object can be freed during the dump.
The copied l_debug_list pointers do not have that lifetime protection.
Yet ocfs2_dlm_seq_next() follows them to find the next record.

Remounting read-only can free a quota-info object while a debugfs read
is between the snapshot and the next iterator callback:

  locking_state reader                Quota suspension
  --------------------                ----------------
  snapshot current lock resource
    copy l_debug_list.next
                                      remove next resource from live list
                                      free quota-info object
  seq_next(): follow copied link
    read freed lock resource

Advance through the live dummy cursor instead. List removal updates its
links under the tracking lock. Position it after the resource being
copied before releasing the lock, and never walk the snapshot's links.
Rebuild the cursor from the requested position in seq_start() so a
seq_file buffer retry or seek starts at that record again.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in ocfs2_dlm_next_res.isra.0+0x1b1/0x1d0
    Read of size 8 at addr ffff888117ea9838 by task python3/489
    
    CPU: 3 UID: 0 PID: 489 Comm: python3 Not tainted 7.3.0-rc4-next-20260921-pmb-bt-functional-v1+ #1 PREEMPT(lazy) 
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? ocfs2_dlm_next_res.isra.0+0x1b1/0x1d0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20e/0x420
     ? ocfs2_dlm_next_res.isra.0+0x1b1/0x1d0
     kasan_report+0xe0/0x110
     ? ocfs2_dlm_next_res.isra.0+0x1b1/0x1d0
     ocfs2_dlm_next_res.isra.0+0x1b1/0x1d0
     ? __pfx_ocfs2_dlm_next_res.isra.0+0x10/0x10
     ? __pfx_do_raw_spin_lock+0x10/0x10
     ocfs2_dlm_seq_next+0xb8/0x4c0
     ? srso_alias_return_thunk+0x5/0xfbef5
     seq_read_iter+0x92f/0x1110
     ? srso_alias_return_thunk+0x5/0xfbef5
     seq_read+0x362/0x5a0
     ? __pfx_seq_read+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? selinux_file_permission+0x11d/0x540
     full_proxy_read+0x11f/0x180
     ? __pfx_full_proxy_read+0x10/0x10
     vfs_read+0x1a0/0xc20
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? kmem_cache_free+0x242/0x580
     ? __pfx_vfs_read+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? putname+0x93/0xe0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? do_sys_openat2+0x12a/0x1b0
     ? __pfx_do_sys_openat2+0x10/0x10
     ksys_read+0x111/0x200
     ? __pfx_ksys_read+0x10/0x10
     ? irqentry_exit+0xbe/0x820
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? trace_hardirqs_on_prepare+0x11d/0x150
     do_syscall_64+0x114/0x620
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7f0266dbb687
    Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
    RSP: 002b:00007ffccf76fc40 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
    RAX: ffffffffffffffda RBX: 00007f0266d27780 RCX: 00007f0266dbb687
    RDX: 0000000000000001 RSI: 00007f0266a53200 RDI: 0000000000000004
    RBP: 00007f0266d27700 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000001
    R13: 00007f0266a53200 R14: 0000000000000004 R15: 00007f0266b651e0
     </TASK>
    
    Allocated by task 547:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x28d/0x610
     ocfs2_local_read_info+0x181/0x1580
     dquot_load_quota_sb+0x68b/0x1000
     dquot_load_quota_inode+0x227/0x3e0
     ocfs2_enable_quotas+0x27c/0x520
     ocfs2_fill_super+0x21f9/0x38f0
     get_tree_bdev_flags+0x35d/0x5f0
     vfs_get_tree+0x93/0x320
     fc_mount+0x1d/0x200
     path_mount+0x592/0x1e00
     __x64_sys_mount+0x24b/0x2d0
     do_syscall_64+0x114/0x620
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    
    Freed by task 577:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x308/0x580
     ocfs2_local_free_info+0x47b/0x800
     dquot_disable+0x5d9/0x17a0
     ocfs2_susp_quotas.isra.0+0x22c/0x2b0
     ocfs2_reconfigure+0x284/0xd00
     reconfigure_super+0x3ca/0xa70
     path_mount+0x16ae/0x1e00
     __x64_sys_mount+0x24b/0x2d0
     do_syscall_64+0x114/0x620
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    
    The buggy address belongs to the object at ffff888117ea9800
     which belongs to the cache kmalloc-1k of size 1024
    The buggy address is located 56 bytes inside of
     freed 1024-byte region [ffff888117ea9800, ffff888117ea9c00)
    
    The buggy address belongs to the physical page:
    page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x117ea8
    head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
    flags: 0x200000000000040(head|node=0|zone=2)
    page_type: f5(slab)
    raw: 0200000000000040 ffff888100042dc0 dead000000000100 dead000000000122
    raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
    head: 0200000000000040 ffff888100042dc0 dead000000000100 dead000000000122
    head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
    head: 0200000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
    head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
    page dumped because: kasan: bad access detected
    
    Memory state around the buggy address:
     ffff888117ea9700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
     ffff888117ea9780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
    >ffff888117ea9800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                            ^
     ffff888117ea9880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
     ffff888117ea9900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
    ==================================================================

Fixes: ccd979bdbce9 ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

---
 fs/ocfs2/dlmglue.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/ocfs2/dlmglue.c b/fs/ocfs2/dlmglue.c
index 88d946466083..5e05e98fb9cb 100644
--- a/fs/ocfs2/dlmglue.c
+++ b/fs/ocfs2/dlmglue.c
@@ -3101,10 +3101,19 @@ static struct ocfs2_lock_res *ocfs2_dlm_next_res(struct ocfs2_lock_res *start,
 static void *ocfs2_dlm_seq_start(struct seq_file *m, loff_t *pos)
 {
 	struct ocfs2_dlm_seq_priv *priv = m->private;
-	struct ocfs2_lock_res *iter;
+	struct ocfs2_lock_res *iter = NULL;
+	struct ocfs2_lock_res *dummy = &priv->p_iter_res;
+	loff_t n;
 
 	spin_lock(&ocfs2_dlm_tracking_lock);
-	iter = ocfs2_dlm_next_res(&priv->p_iter_res, priv);
+	list_move(&dummy->l_debug_list,
+		  &priv->p_dlm_debug->d_lockres_tracking);
+	for (n = 0; n <= *pos; n++) {
+		iter = ocfs2_dlm_next_res(dummy, priv);
+		if (!iter)
+			break;
+		list_move(&dummy->l_debug_list, &iter->l_debug_list);
+	}
 	if (iter) {
 		/* Since lockres' have the lifetime of their container
 		 * (which can be inodes, ocfs2_supers, etc) we want to
@@ -3128,12 +3137,12 @@ static void ocfs2_dlm_seq_stop(struct seq_file *m, void *v)
 static void *ocfs2_dlm_seq_next(struct seq_file *m, void *v, loff_t *pos)
 {
 	struct ocfs2_dlm_seq_priv *priv = m->private;
-	struct ocfs2_lock_res *iter = v;
+	struct ocfs2_lock_res *iter;
 	struct ocfs2_lock_res *dummy = &priv->p_iter_res;
 
 	(*pos)++;
 	spin_lock(&ocfs2_dlm_tracking_lock);
-	iter = ocfs2_dlm_next_res(iter, priv);
+	iter = ocfs2_dlm_next_res(dummy, priv);
 	list_del_init(&dummy->l_debug_list);
 	if (iter) {
 		list_add(&dummy->l_debug_list, &iter->l_debug_list);
-- 
2.43.0


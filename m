Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2CC1C84A2
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791732916; cv=none; b=lyc84GxMZ8opRB66yGs88I6hPywPSYe8B9PDUfHC5eNiAU7ifF3jSwY4kYXI+1J3lAv4mXUVUQQsHprsdIuMG1aSm7tIfRPcjir1Zjyd7Iox/Y7QwxJ3ICRycwkmrVjZpW3g2gkEN6bcwHhNoYds8StXDqNpGBLpKbFIKFcxNvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791732916; c=relaxed/simple;
	bh=aTHjow+MhX2pUPdBBCb+pN2n/W8ibGPkh5XhBD4c/DA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fjup14SfI9ONuJXlTVfejh7t1UAt0OzzpLQSlW44OVuMZXf4GbMsq1pB1ok7adwpRwyPDG0CLLa2iyXOwY31lpxbN4OyoUQBTY/jY49BiyTSeDiqzYRF5onn7ejBylj2C3Bg1MebZHMEPm74s163NW5idZc9/MB6AzTWkBz81BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEwsTp4U; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEwsTp4U"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab41538192so824909a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791732914; x=1792337714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZDi5NZhxe7aNgs5fvPM2l6LxfLw9cZzq0HmYScNkIJ4=;
        b=lEwsTp4UFS83ARlY5AxJah4Wk4cBcojxX0bhSOmBi8jpB74RHgOMyR2/gLDA7ASgK0
         j7aDUXsdun1q+S7cDTlx47eAq85xQYpfeRaC/f8oWZ3K4OkjfTc1G1LUsqWWc0hE7bsc
         qivxs8SXy/7mtifLqEiP8Ep5Licr+8ZkJFqd5Wqzwfioh6q5W996MMZMsYn1ZzYh1B/7
         rGgonTUbxYo/DD0ctBt0aQnr4lDz8mvo4x8V2sEaiS23biYpNoiuED31A/CaAvcULB6K
         NlwitXDxpxkj+yohAMOQ/5tH7oUCsJljYRIRyVSBmWPorD0M5n3PnMTWywITLZ3N7Pm9
         ZKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791732914; x=1792337714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDi5NZhxe7aNgs5fvPM2l6LxfLw9cZzq0HmYScNkIJ4=;
        b=xRNbGyNNWGFv2FwZjfBvGWP1JzMxhcgbsYasoydt0FbQsy8KFjcxHpJcuWxmLcKRYq
         0zd/RBwhMCUB3Ywm6piZcXFI/8Fbc1NN2GX1H3Ldr+3XnM80F0trUWv9EJPis7SQp4lM
         2YDsJmvmxZ3NK285hyj+9frL473uJRHAtWUQeOQ6PB53qxXCiB2whFgmTK6cjfEYIqwz
         rPxmLWRMaA0vlw7UwtOkU8AYH6BqTPXdWIUzDNUvQe1yVLNNPRfIWkhbgHoaJ0Njhqzz
         Y9ro9DsnkDhBV3eJF7nDDzugKKCdQMxMRTHivOFBaRjSQsKn/XHrCwg13FppYiXUl2n7
         Kaww==
X-Forwarded-Encrypted: i=1; AKwUvBzkjeP+2iJL6IDWMR6wJAs7LU+Ks6R4B7zo7OvLNOUIQI6OtLbDyE7g7vBbwAZyuc37utLm5qLVzA+s4E8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSfySk3Hki9xfaIusYHp8TN9vD1CTWp/r52T/BWwGHUrAtAVw+
	pceyHTmK/SMIMscMgTz0cVl83nLwaxXQCwf5ej89EzZmp4Ada/5/fMx0
X-Gm-Gg: AYBFou3YFn3BqrnKTkzk7sopOmru9pWJxleMhTvcg4N/F5gVc74oF7PkZij6O+VflaT
	EA/cpF/dqD9hLqtYK0/l4Co1fixv15+61YSEOuYdupI4JZ3Rk4fBxwmlO1bNBJLHWSoV0/2WPro
	bZgwOCPkNS932tVH/DuyckdrpjnJQos8Rw9qY2mHLXF7oQg+OJu1WD7KhX7EfMXow1rpKHtkn8l
	PFLt4Snn1sei7UnwomUgRanVENK+zKV77G96v+1ooP7ZCqq4cE4zzqIuQFt6E+zE8JVDb3iaZVL
	25eS37HN4rC0+l3BWeTWcJyBlxcy0x77w3L7JiKwVv6iQEm1jk4ez+5HQ/HwknRnkr94r2PQMCz
	S+0RckdM4Eik5g33GwOOXWNm/71D+fBk7+0vztL8G+hHqGhH79ZpsiMy+Dlo4abgDrY5ulWUlRG
	cF0n2F86uZJTsKu9hXIXAqQUbqaOoCee4aKHPlFL0pG9hz+qBq3eGIJzOJ3ZGzu/j3mw==
X-Received: by 2002:a17:90b:5346:b0:3ab:235b:185b with SMTP id 98e67ed59e1d1-3ab3a77980emr5497145a91.31.1791732913900;
        Sun, 11 Oct 2026 08:35:13 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f8277bsm12398641a91.11.2026.10.11.08.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 08:35:13 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	heming.zhao@suse.com,
	rollkingzzc@gmail.com,
	brauner@kernel.org,
	jack@suse.cz,
	rppt@kernel.org,
	kees@kernel.org,
	akpm@linux-foundation.org,
	hexlabsecurity@proton.me,
	sunil.mushran@oracle.com
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2] ocfs2/dlm: Protect the recovery list during debugfs reads
Date: Sun, 11 Oct 2026 23:35:06 +0800
Message-Id: <pm-ocfs2-objects-candidate-0049-v3-184e46c47f5283f06191@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recovery participant records must remain alive while debug_state_print()
walks reco.node_data and formats their fields. The formatter holds
dlm->spinlock, but the recovery participant list is protected by
dlm_reco_state_lock. In particular, dlm_destroy_recovery_area() detaches
the list under dlm_reco_state_lock and frees the detached records after
releasing it. A concurrent debugfs open can therefore read freed memory.

Protect the participant traversal and field reads in debug_state_print()
with dlm_reco_state_lock, matching the existing list writers. This also
serializes the traversal against list_add_tail() during recovery-area
initialization. Make the existing lock available to the debug code
through dlmcommon.h; the lock remains internal to the OCFS2 DLM module.

Release dlm->spinlock after formatting the other domain state and before
acquiring dlm_reco_state_lock, so the debug reader does not nest the two
locks. Leave recovery list insertion, detachment and freeing unchanged.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in debug_state_open+0x1169/0x12d0
    Read of size 4 at addr ffff88810662ef80 by task dlm-state-stres/896

    CPU: 1 UID: 0 PID: 896 Comm: dlm-state-stres Not tainted 7.3.0-rc4-next-20260921-pmb-ocfs2-functional-v1+ #1 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? debug_state_open+0x1169/0x12d0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20e/0x420
     ? debug_state_open+0x1169/0x12d0
     kasan_report+0xe0/0x110
     ? debug_state_open+0x1169/0x12d0
     debug_state_open+0x1169/0x12d0
     ? __pfx_debug_state_open+0x10/0x10
     full_proxy_open_regular+0x193/0x310
     do_dentry_open+0x595/0x12d0
     ? __pfx_full_proxy_open_regular+0x10/0x10
     vfs_open_consume+0xd1/0x400
     ? srso_alias_return_thunk+0x5/0xfbef5
     path_openat+0x18d0/0x2020
     ? __pfx_path_openat+0x10/0x10
     do_file_open+0x21e/0x470
     ? __pfx_do_file_open+0x10/0x10
     ? _raw_spin_unlock+0x23/0x40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? alloc_fd+0x3a6/0x6b0
     do_sys_openat2+0xf4/0x1b0
     ? __pfx_do_sys_openat2+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __fput+0x5b5/0xa60
     __x64_sys_openat+0x136/0x1e0
     ? __pfx___x64_sys_openat+0x10/0x10
     do_syscall_64+0x114/0x620
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    [Register dump omitted.]
     </TASK>

    Allocated by task 880:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x28d/0x610
     dlm_remaster_locks+0x147/0x1d90
     dlm_do_recovery+0xde1/0x1580
     dlm_recovery_thread+0x109/0x300
     kthread+0x351/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    Freed by task 880:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x308/0x580
     dlm_destroy_recovery_area+0x285/0x460
     dlm_remaster_locks+0x17c4/0x1d90
     dlm_do_recovery+0xde1/0x1580
     dlm_recovery_thread+0x109/0x300
     kthread+0x351/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    The buggy address belongs to the object at ffff88810662ef80
     which belongs to the cache kmalloc-32 of size 32
    The buggy address is located 0 bytes inside of
     freed 32-byte region [ffff88810662ef80, ffff88810662efa0)

    [Page and memory-state dumps omitted.]

Fixes: 007dce53a29c ("ocfs2/dlm: Dump the dlm state in a debugfs file")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v2:
- Use dlm_reco_state_lock in debug_state_print() to protect recovery
  participant traversal and field reads.
- Serialize the read with recovery participant insertion, and leave list
  teardown unchanged.
- Release dlm->spinlock before acquiring the recovery list lock.

Link to v1: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0049-v2-a5d5091b8900dc3f9849@gmail.com

 fs/ocfs2/dlm/dlmcommon.h   | 2 ++
 fs/ocfs2/dlm/dlmdebug.c    | 5 ++++-
 fs/ocfs2/dlm/dlmrecovery.c | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/dlm/dlmcommon.h b/fs/ocfs2/dlm/dlmcommon.h
index 20f790a47484a72cba1cd71b3d505f36c1b2d5a4..58b28dfa8d34ef237df7b1eb789f0b461187174e 100644
--- a/fs/ocfs2/dlm/dlmcommon.h
+++ b/fs/ocfs2/dlm/dlmcommon.h
@@ -435,6 +435,8 @@ enum {
 	DLM_DEREF_LOCKRES_DONE		= 522,
 };
 
+extern spinlock_t dlm_reco_state_lock;
+
 struct dlm_reco_node_data
 {
 	int state;
diff --git a/fs/ocfs2/dlm/dlmdebug.c b/fs/ocfs2/dlm/dlmdebug.c
index ce6d301cb9420385211d20d59637069154a89993..a91f167ed683931da0e44638875b36debe4eb702 100644
--- a/fs/ocfs2/dlm/dlmdebug.c
+++ b/fs/ocfs2/dlm/dlmdebug.c
@@ -736,8 +736,11 @@ static int debug_state_print(struct dlm_ctxt *dlm, char *buf, int len)
 				 buf + out, len - out);
 	out += scnprintf(buf + out, len - out, "\n");
 
+	spin_unlock(&dlm->spinlock);
+
 	/* Recovery Node State: */
 	out += scnprintf(buf + out, len - out, "Recovery Node State:\n");
+	spin_lock(&dlm_reco_state_lock);
 	list_for_each_entry(node, &dlm->reco.node_data, list) {
 		switch (node->state) {
 		case DLM_RECO_NODE_DATA_INIT:
@@ -769,7 +772,7 @@ static int debug_state_print(struct dlm_ctxt *dlm, char *buf, int len)
 				node->node_num, state);
 	}
 
-	spin_unlock(&dlm->spinlock);
+	spin_unlock(&dlm_reco_state_lock);
 
 	return out;
 }
diff --git a/fs/ocfs2/dlm/dlmrecovery.c b/fs/ocfs2/dlm/dlmrecovery.c
index 9d4a2695b9594d1ad8bd60de9cec8ee701355f09..7d519e31fcf17e96116315ac33ab3f5baace354f 100644
--- a/fs/ocfs2/dlm/dlmrecovery.c
+++ b/fs/ocfs2/dlm/dlmrecovery.c
@@ -80,7 +80,7 @@ static int dlm_lockres_master_requery(struct dlm_ctxt *dlm,
 
 static u64 dlm_get_next_mig_cookie(void);
 
-static DEFINE_SPINLOCK(dlm_reco_state_lock);
+DEFINE_SPINLOCK(dlm_reco_state_lock);
 static DEFINE_SPINLOCK(dlm_mig_cookie_lock);
 static u64 dlm_mig_cookie = 1;
 

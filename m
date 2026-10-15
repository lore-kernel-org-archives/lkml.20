Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC594404BC8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085794; cv=none; b=Fuq2PUn6ELvpyP9ev01sgLOpjc1tu11zHjlyBtw4jhSegikkQByA2AX4tvWNeJ/l6VvwQ7A9LX1+hFpt3VypQXbNcuqi+YUZYSI6RJOjLyz+ICfzqJtScD6ZPPiGjcj6n4FUsUgBcsUYgZZ6/RXdB37NZP+EbdYzzM8VFGCEf6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085794; c=relaxed/simple;
	bh=XMZWNSALGx66DAXTjiCW6D0VHKFTsEvlhMkKHIV7N3U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=HxNAbTIdkqz/aK+dpYUTEoZf5oH2wjAnw7xMozWuWC3sLxr9//+P8W1scitJC1ue3L4GmH+AebcL3yW3BmlSd7aqgc5cRftK4Uzii00Mctsh9Aw2a35tvxlcnnGX8tMKa7e6QBuPKOewxL4sUAoV8n6zyXFZxZqyrV0IRlzYqZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6hvOgH4; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6hvOgH4"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-88b7d853b11so1014235b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085783; x=1792690583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2fubKBoLgQUTAWsAbRE7jSlw3VB6SYRsTIq0RJ/P+s=;
        b=O6hvOgH4GGZIHrCjBiKeS7+J1M3QaS6yOILhKkWuGyqGySq3r/lcbhifdpYJvttcBo
         TFSityp4LPDYF6FuclEzniIsZ25OtI/B3O9BWI1HzNyEJggn63TziOQtURSUVnuPCg0/
         VTc7j0Rx+BhPOZIzgdXXJCZ+k0ZzvU178rrvaiTEZLk8vCynvXenmSXcdU2NhVtVcJlE
         2w3+nx5gOmZiMuY9VY6Aq6Xi+wwmMBkyKCbltERWCYj3MraSNvXzZfpsFCNzTKNTOmKV
         nsYp7qn1F38eu/EQOLHOQ87JVuoNj09ahzNUZeL6XpHb8zgrVSIarH04Jt7zn4twF2NQ
         m1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085783; x=1792690583;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d2fubKBoLgQUTAWsAbRE7jSlw3VB6SYRsTIq0RJ/P+s=;
        b=Zbarl0shTYEgaJIztR8mkgHoKarWKdFyOfmSIOkY3X/BlUiJtCba+wDuo/yxGBlGEY
         Sk9xIOr9mg3FEbIpSi8HvDeJoiO+tpxmx03nEXYqPezPWtE8Hfz4YqUgTlIvyGeJYm8W
         itmp4nrpft5Mm7oM6R+D/7V4T9izi2vCGsjW6zYzgGDD58pwszVUkKcrG5CVi0voU+1T
         YP07lwBg7T1ZONghlmcAu+vImolqInwbEtmwh8N8ZABdEuSCaKS4nEDI0tlkt069IVl1
         9r/1ueuD9COqqgjvRZ3DwuiMIWvAoVEs0QtXpKtNUvyZq5LGx4sFtVJxQ6OdcGrEbl7S
         5H9w==
X-Forwarded-Encrypted: i=1; AKwUvBzyevaEgCJVaTPN7iYKBtoB8N+BM9H1MYqPju9Btqu/gKOxeEVCZGR0VNdx1tMTwkXzLaWrdnKxzbF1SVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXe43FjQ6KRwychave7t+OoWjEhOVyXKxZgCYYogaKw21C9OFL
	B4d+F0/xY0M+yIRDM7muRjJcaGyLs2/Z5zkwls/yYiNrHDfEnGjEVTcP
X-Gm-Gg: AYBFou0LaUyWoFBfOdlDJJyZE3csf3SeSjBAQv5Ep8ux74/7+5DlTfqVasIomE0T2f9
	ngN1NP1GEsCfCD9lOGH79KprhVzKXe6BZ+N+Rum7asiDJmvcYJpqJK1XyyGp5eShYNfX2LJbWMx
	RKTpvzTM2BYZWZd5zxdwu56X8jS/6qSyUNwsNv4G0soSMNcc8CewlLpoogBE5RABTaHZ3oXS+TR
	D9prh3xXlGWlVc5uRGWNtnrXWuEeEeNsGqZ2sSrf0ID5RyIs1Sb2CF1e/FFq7QInVvI2mmXq3lB
	7BE676YbFjXhpCiJVToEzn3Wx06O8ImCxrkGHyMCnD7hjg41jVHMmyVG8JEla3N7TkM/k1usNlb
	9OuB8Q3poGVHqz8Iw+nAAmY7Zh/ssac1EnEqfVuH5zCcC5+LTPvGKfiuuMQ4h4UJx3/Ya+O6VMe
	B1+LzWka95Vi28h5Cwx4jimbkHr31bjNvhv7akD1xD7a+Bvb3uRB3twK5pV+WhNiZG+g==
X-Received: by 2002:a05:6a00:4fca:b0:87d:430:1437 with SMTP id d2e1a72fcca58-897c7ec3069mr17209710b3a.38.1792085782783;
        Thu, 15 Oct 2026 10:36:22 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5820b344sm1422b3a.53.2026.10.15.10.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:36:22 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	heming.zhao@suse.com,
	boyu.mt@taobao.com
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2] ocfs2: stabilize the dentry name while tracing reads
Date: Fri, 16 Oct 2026 01:36:16 +0800
Message-Id: <pm-ocfs2-objects-candidate-0088-v4-a9a0df898afb4fc65fa0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An open file pins its dentry, but not the external allocation backing
an individual dentry name. ocfs2_file_read_iter() passes d_name.name to
its trace event without holding d_lock or a name snapshot. The event's
__string field needs those bytes for both strlen() sizing and the
subsequent copy.

With the read event enabled, a read of an open long-named file can be
preempted after evaluating the trace argument. A successful concurrent
long-to-short rename of the same dentry can then reclaim that name,
provided no other name snapshot retains it:

  Reader                              Renamer
  ocfs2_file_read_iter()
    load old d_name.name
    <preempted>
                                      vfs_rename()
                                        take_dentry_name_snapshot()
                                        ocfs2_rename()
                                          ocfs2_dentry_move()
                                            d_move()/copy_name()
                                        release_dentry_name_snapshot()
                                      kfree_rcu() reclamation completes
    trace callback calls strlen()
      through the old name pointer

The pointer load precedes the rename, and sizing follows reclamation,
so strlen() reads freed name storage. The tracepoint's SRCU section
protects its probes, and the event callback disables preemption only
after the caller has loaded the name pointer.

Take a dentry name snapshot before tracing and release it after the
trace call. The snapshot copies inline names and pins external name
storage, keeping both the string and its length stable while the event
sizes and copies the name. This avoids holding d_lock across trace
callbacks. Check whether the event is enabled before taking a snapshot
to avoid adding snapshot work to reads when tracing is disabled.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in strlen+0x85/0xa0
    Read of size 1 at addr ffff88810a5b2b18 by task python3/496

    [CPU and host details omitted.]
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? strlen+0x85/0xa0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20e/0x420
     ? strlen+0x85/0xa0
     kasan_report+0xe0/0x110
     ? strlen+0x85/0xa0
     strlen+0x85/0xa0
     trace_event_raw_event_ocfs2__file_ops+0xf0/0x480
     ? __pfx_trace_event_raw_event_ocfs2__file_ops+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? pmbd_probe_hit_cookie+0xe7/0x1c0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_pmbd_probe_hit_cookie+0x10/0x10
     ocfs2_file_read_iter+0x6cd/0xb30
     ? __pfx_ocfs2_file_read_iter+0x10/0x10
     ? selinux_file_permission+0x11d/0x540
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? security_file_permission+0x26/0x80
     vfs_read+0x7d2/0xc20
     ? __pfx_vfs_read+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_do_sys_openat2+0x10/0x10
     ksys_read+0x111/0x200
     ? __pfx_ksys_read+0x10/0x10
     ? irqentry_exit+0xbe/0x820
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? trace_hardirqs_on_prepare+0x11d/0x150
     ? srso_alias_return_thunk+0x5/0xfbef5
     do_syscall_64+0x114/0x620
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    [User register dump omitted.]
     </TASK>

    Allocated by task 489:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_noprof+0x2de/0x780
     __d_alloc+0x5fc/0x8c0
     d_alloc_parallel+0x106/0x11d0
     lookup_open+0x3ff/0x13e0
     path_openat+0x95e/0x2020
     do_file_open+0x21e/0x470
     do_sys_openat2+0xf4/0x1b0
     __x64_sys_openat+0x136/0x1e0
     do_syscall_64+0x114/0x620
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 0:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     __rcu_free_sheaf_prepare+0x65/0x2a0
     rcu_free_sheaf_nobarn+0x1d/0x50
     rcu_core+0x6be/0x1ed0
     handle_softirqs+0x1fa/0x8d0
     __irq_exit_rcu+0x113/0x1e0
     irq_exit_rcu+0xe/0x20
     sysvec_apic_timer_interrupt+0x6c/0x80
     asm_sysvec_apic_timer_interrupt+0x1a/0x20

    The buggy address belongs to the object at ffff88810a5b2b00
     which belongs to the cache kmalloc-rcl-192 of size 192
    The buggy address is located 24 bytes inside of
     freed 192-byte region [ffff88810a5b2b00, ffff88810a5b2bc0)

    [Page and shadow-memory dumps omitted.]

Fixes: 468eedde23d6 ("ocfs2: Remove mlog(0) from fs/ocfs2/file.c")
Cc: <stable@vger.kernel.org>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---
Changes in v2:
- Replace d_lock around the tracepoint with a dentry name snapshot so trace
  callbacks run without the caller holding the dentry lock.
- Pass both the name and its length from the snapshot; keep the event
  enabled check and release the snapshot after the trace call.

Link to v1: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0088-v3-d628f98bfcb6784a0bfb@gmail.com

diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
index d6e977ba6565..fc357c227ad8 100644
--- a/fs/ocfs2/file.c
+++ b/fs/ocfs2/file.c
@@ -2542,11 +2542,17 @@ static ssize_t ocfs2_file_read_iter(struct kiocb *iocb,
 	int direct_io = iocb->ki_flags & IOCB_DIRECT ? 1 : 0;
 	int nowait = iocb->ki_flags & IOCB_NOWAIT ? 1 : 0;
 
-	trace_ocfs2_file_read_iter(inode, filp, filp->f_path.dentry,
-			(unsigned long long)OCFS2_I(inode)->ip_blkno,
-			filp->f_path.dentry->d_name.len,
-			filp->f_path.dentry->d_name.name,
-			to->nr_segs);	/* GRRRRR */
+	if (trace_ocfs2_file_read_iter_enabled()) {
+		struct dentry *dentry = filp->f_path.dentry;
+		struct name_snapshot name;
+
+		take_dentry_name_snapshot(&name, dentry);
+		trace_ocfs2_file_read_iter(inode, filp, dentry,
+					   OCFS2_I(inode)->ip_blkno,
+					   name.name.len, name.name.name,
+					   to->nr_segs); /* GRRRRR */
+		release_dentry_name_snapshot(&name);
+	}
 
 
 	if (!inode) {

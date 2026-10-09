Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7493203B6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510068; cv=none; b=Mza98Bf8kINAwRxWvJtM3Otb1Pqu9RM45OuBK1E9nQCcSXw70vH9D0406YA0TIqUfgCd92N8YX2BJtXCfUBfZSXJFsepkUB9z/awNKfWQSGqRWIE8Tb2ypqq+LTKiE4+ecSHIZLVvwG5CEvJGp6c3VnPpKlR4Y1gG7xsMG9iCQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510068; c=relaxed/simple;
	bh=5Jv8j7APlwwaU6ZUf8y9K5scT0ha0/L1LucPaGnbmfY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Vq6/sZ8WCupm25kzVEcGKMCCFB3blPwLnh8fJ0OVVhhGCE4hI2XPOa8Fca1NmWcxt/D10qlClY4CS2KYbyAT4Z+MWMmFdb2fKYgJCuMtKmEXMwOJOe3Z9JLz4/SoAQCguQ+gAq3SANgq9wSndQh1HGQ7iY/ahidTuw5qu1prmag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEKv1+nH; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEKv1+nH"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-887beafb714so2045794b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510066; x=1792114866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oc3v/RNKFMSSXOD1ONlfWh+mZ5uFjK1VgKM2BwVJqMA=;
        b=tEKv1+nHqpNa6J5VvFUtMss1YEkJ9fOzr9RAaIBLj0sAVtiPBsD/1c/wF+od1EFme4
         3KzQYYRBxufU1F+CjunmgusnDGSCjChEZrpdluUxDCwwb/7ADCuI1s42ljWET+/SeCn/
         tVGF9Lqopk2dZyMdVIoaThhP0A5MMV4t5oyf79G63tdk666WHMufTYXLaz0OBqIghiKr
         enb0SJHyWhXi+tD8/CzDj7Q1DiGR8Da0VW0MsSugFE//eMNx/5KtkQgvBwvK++xdFyel
         LfCH0ir0IqdxCFN6rHsXP//wpKg6ofuzpDrEbTrBHKwb/NslqAV4Eqj2A1Qdkw8o2/x5
         /FZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510066; x=1792114866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oc3v/RNKFMSSXOD1ONlfWh+mZ5uFjK1VgKM2BwVJqMA=;
        b=P/g6JSW9Ve6u/CVlzkjCrv7f6YZOhpiZppE68JgJOaI7UcNUxtaVDEXKkSe1frpEmG
         /Pt1g+l3GcNsdSPMY+0XPIDsyktBzr9DvPVHBd5UcX/wXtcM1ueJlTd2FVevcpfhM43G
         zj84/5QYjTFxOeZw9A9Z5ohkDkcTiXlGXOSe8XpfTYllVnY79iETf/eTwOy8A4z3UT4y
         +FCVGJt3XKX27jSq4qw3srqhULAng9oV5y6p/j7oAXgpJmaoalJMFAuhBC+MIapBz4ir
         gjPoNfNNZ0EJcP1OyaF0wFySUStpTAFP1MoMyZ7aYgzquq4LfctPMtwjq7awhLaYaFVe
         VVtA==
X-Forwarded-Encrypted: i=1; AKwUvBy41MnQPF34tX6JQSw5rt5L+g1w8soJRzwwz8i4Bhq6fmzQ0Ga7EXJa8sd1UarMFoaU+3wwWhMGNov9wn8=@vger.kernel.org
X-Gm-Message-State: AFuF++nErVLk+2QCdILbTfdGUpvfQGpKdgP+kekN7lIcllGx7BGb7yvR
	jzdhz9QpffsE+Ixp6BsZC3shsDklcNo1U/CAJurNUrCgCJGexP8CwvVq
X-Gm-Gg: AYBFou3e209LaxnhHdTDeNpJk0ty09SFSAM4FOtV71ZEqdL49kL83suOC3pBh476dGJ
	A3R+/LVYJ3Ou5xZKEMjLJVcw1ADX159AWd8qR2AwMOOEOykHJZpCGt2vZBBmLM1y5fXA79zjbrX
	DKiKDysxPaLoX7v39fC224VkZ7KYPaeeFEA3egKMR0J9qYmhUU5UvSTxkUYtshV76Vnxffc15aL
	BQy/x8tRQRvfSFFXhkF0B1d9Ne3mAX2u/AUlT1CS/Ttnp1AamABAgHlBAMv7Ubvs8v45fq4X3v3
	ZSHCx9vy1Z/8iBRTOEYGLAzYAl3n44QAsuSLBw195fQSF0FACwDPQDpq2HeTYcyytfc7aGfHIes
	6Qu6idQUfWvU1mf1oufM9kE8pfROqWaCOHogg3+F/mIKoMTKBdQfT8ia283zsrmXWKv9m8/Zj90
	WwvT3ZKX9Du6JUZ+DX+nTALYTXXW9EiPqwIN/M+z106pVWuxzJyXzmRWOQXT4TdBSQ0g==
X-Received: by 2002:a05:6a00:4f92:b0:881:6fb7:bf14 with SMTP id d2e1a72fcca58-897c75e7fe1mr295921b3a.38.1791510066165;
        Thu, 08 Oct 2026 18:41:06 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c43aab7csm256100b3a.46.2026.10.08.18.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:41:05 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	akpm@linux-foundation.org,
	zzzccc427@gmail.com,
	ericterminal@gmail.com,
	kees@kernel.org,
	kurt.hackel@oracle.com
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: [PATCH] ocfs2/heartbeat: Unlink live slots when their node is missing
Date: Fri,  9 Oct 2026 09:40:59 +0800
Message-Id: <pm-ocfs2-objects-candidate-0058-v1-177573785904d0ea43c7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

o2hb_shutdown_slot() returns immediately when its node is no longer
in the configfs registry. A slot can still be linked in o2hb_live_slots
when that lookup fails. Region teardown or startup-error cleanup then
frees the slot array without removing its embedded list member.

With the same peer live in another region, the next list update can
follow a predecessor into the freed array. Reusing the node number can
also make a later insertion encounter that stale member.

Always remove the slot under o2hb_live_lock, even when node lookup
fails. Preserve aggregate membership accounting and the last-region
DOWN callback: the existing callback interface explicitly permits a
NULL node for DOWN events. Only drop the node reference when lookup
returned one. This closes both normal release and startup-abort paths
without changing the publication or callback locking protocol.

A controlled probe-instrumented test reproduced this while stopping
one of two regions after removing the peer from configfs. Its KASAN
report includes:

  BUG: KASAN: slab-use-after-free in __list_del_entry_valid_or_report+0x1e0/0x210
  Read of size 8 at addr ffff888106a4ac60 by task o2hb-pmbd0058_b/497
  Call Trace:
   <TASK>
   dump_stack_lvl+0x93/0xd0
   print_report+0xce/0x630
   kasan_report+0xe0/0x110
   __list_del_entry_valid_or_report+0x1e0/0x210
   o2hb_do_disk_heartbeat+0x1591/0x2c50
   o2hb_thread+0x1ed/0xe70
   kthread+0x351/0x460
   ret_from_fork+0x659/0x940
   ret_from_fork_asm+0x1a/0x30
   </TASK>
  Allocated by task 491:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   __kasan_kmalloc+0xaa/0xb0
   __kmalloc_noprof+0x2de/0x780
   o2hb_region_dev_store+0x7c2/0x1b60
   configfs_write_iter+0x2f9/0x4f0
   vfs_write+0x639/0x1010
   ksys_write+0x111/0x200
   do_syscall_64+0x114/0x620
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
  Freed by task 491:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   kasan_save_free_info+0x3b/0x60
   __kasan_slab_free+0x5f/0x80
   kfree+0x308/0x580
   o2hb_unmap_slot_data+0x1db/0x330
   o2hb_region_release+0x14b/0x4f0
   config_item_cleanup+0x14b/0x230
   config_item_put+0x79/0x90
   configfs_rmdir+0x58a/0x910
   vfs_rmdir+0x2e8/0x820
   filename_rmdir+0x3b1/0x520
   __x64_sys_rmdir+0x4b/0x70
   do_syscall_64+0x114/0x620
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fixes: a7f6a5fb4bde ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 fs/ocfs2/cluster/heartbeat.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index 1c3def99bb0765deb828ad6415fde31ed9316002..95b9061fce854ac8f32acf3c29f71336fb37a372 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -880,8 +880,11 @@ static void o2hb_shutdown_slot(struct o2hb_disk_slot *slot)
 	int queued = 0;
 
 	node = o2nm_get_node_by_num(slot->ds_node_num);
-	if (!node)
-		return;
+	/*
+	 * The node may have been removed from the node table while this
+	 * region's slot is still linked.  The list member must still be
+	 * removed before the region releases its slot array.
+	 */
 
 	spin_lock(&o2hb_live_lock);
 	if (!list_empty(&slot->ds_live_item)) {
@@ -903,7 +906,8 @@ static void o2hb_shutdown_slot(struct o2hb_disk_slot *slot)
 	if (queued)
 		o2hb_run_event_list(&event);
 
-	o2nm_node_put(node);
+	if (node)
+		o2nm_node_put(node);
 }
 
 static void o2hb_set_quorum_device(struct o2hb_region *reg)

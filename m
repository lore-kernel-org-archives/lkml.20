Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854A2255E43
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768707; cv=none; b=ca3PnSQrpYk7KnqiAbhF2mRZaWIZvSJTzIDKsNPUOQ9ChYRv9X0JFk/VwH5i7G7nGulch+XSdrbhCd2kBpw7g1SPW3bQigOQ2cZTm6R6V46G6bo2RYXEaFGbcYNDkrq/uBV7Ms13YFMSlfJg9yVIKUdR+9vynermjkEYz68ExPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768707; c=relaxed/simple;
	bh=pqCW64MWKKqJ+b5EZyD/nzo8SaOHA3QqAsTpgswNy84=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dmAV2aiAuKQWZleiSEpaJZxu1/12+hKLZXBuQ+fcwi3Zlksl1xRXvFBB8hKkgbQUGsedSk7YVj5/VudV8u/FZXzX21EOHAf6qp/AJZb6wzzm50sa2Yck7niALK/M9vWxP7LanImdAJp+7Dr3X+VF4i4kypYdFr/utcY5FIKlUN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJVKgIJM; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJVKgIJM"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso993327a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768706; x=1792373506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s9fm9fZTpu/z3C1fJkYEh93qh6MI7pDV/XkQ0dbiT30=;
        b=VJVKgIJMHzTJogF23AVRVa3nraTn4+MQktpB+/oCmw2nFkkObWiePaQ41DXvR3SCvr
         bJd5Acja9FpdpvRmCoyrvFCGmprqegXeF+PZ53i30bijpB0UiIdHfjBqJUtX3mYUr9P9
         oEyNmL/vu48298ESeu7tc+RUcOz4bDGfX1ItTlDLqrVgXagScx5vjmTw/l5OfQ4K/uKw
         dJKsXNlPIV12FFVymi5aoeTF7B8cecsh7iJMDWE3IhwHnw258qvvmwIG+j/3sol21XYi
         grBmGzg/kGcCWdDv8E1GXKp9qG8qqD8lmhy6QLKSRU76NHDsT0FoeGy4bI5bQDedSL5w
         FD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768706; x=1792373506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9fm9fZTpu/z3C1fJkYEh93qh6MI7pDV/XkQ0dbiT30=;
        b=Jeqts3go3vfc/WcL7xQ0UvWsG+i0Zc0uEuYgazDVUYXbQQ60r6B2I/UQWalaGf7wxv
         j5NDNWbBOSAcKKOZdpd6gS1ydTb084ahodb5q3BgBdQkQqm/Q4a1C8yx5sYHa0WmhKa4
         GcoD7+G4A2weNJIUIlP7mk2rAPrN0aM9hzaXjWU9nNPL0aOJQezWhTVVhsAxSdzL9yAO
         wc2zhPT6qT9JTk1enx635JOLcFqassr3z13cuVssDpt4iZi8+ucpJx5hZf6qyejDW97z
         bC0NISD/R6fi3ZXMi0yfTI48Lj20TmafxgKByg3g0LRy2lXGSW0spZpcxLAwc+yolztc
         DEoQ==
X-Forwarded-Encrypted: i=1; AKwUvBznedKaOVsbuWd+PeJAuPvop5rcx4lMwAAvC+jPN6eHEtoil/zOT3fcq24hFjzB+maVuhYBuR1mT7NO+xM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZnI4VnK4Lir+T2kb9DKxdy2tXHXWTiUEH9U/tc7IJA0bFdSNb
	p5x0o4LfTD2UpGLEUzeEMIVho0/PZ1QaPu3y0THiAEe0BZHcGWJlug4U
X-Gm-Gg: AYBFou2UVoWhmQiSkKGdIk1v4kTiZTnC7OpgLp/88SHOYz6zPsotaYPU01uDsip920G
	XQoDGru67dFkTRUrRL/+JRsg/7fwUupgnu5InMRZALkF0wRiqTxFaSF9mHvhX6+whTtytiBph+H
	YURSadQjv9eigGoanVGN3N38/7TOMlexKwDdSHPZNecovTYAI249oMGTXOyoRcuXaP+XyYw2Jbf
	JC3KypDUDC4Uh4xm8c0tOhlGqU4RrSDfj1qQdGAFWt7FOtxniQypsiOWpLoyMAyYdTkQGbIjjFP
	LZ18Hg+K715ZrOi/0GAIBX19hxAdhXai1H1qaV30wkuqMSBq7WnhX916JxyNMOnY31JaAJqvi+b
	4375qq53g4bHYwRUu3uEi2eZK0eyW+S+frIN3Qg28C/lG/9kh7H5N4cqbNRA7DQHJccm1fVw4eD
	vfgS7Wwk+HPqW88R3ehD4C/wAvnB83pYh3LDEW4PIquBYtDZlcdLsenIGJQy91fRBjyD2CSVs8r
	v/K
X-Received: by 2002:a17:90b:3d92:b0:3ab:36c4:b50d with SMTP id 98e67ed59e1d1-3ab3a3a0bc0mr7646379a91.9.1791768705777;
        Sun, 11 Oct 2026 18:31:45 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39238608sm14651247a91.17.2026.10.11.18.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 18:31:44 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	heming.zhao@suse.com,
	akpm@linux-foundation.org,
	zzzccc427@gmail.com,
	kmehltretter@gmail.com,
	ericterminal@gmail.com,
	kees@kernel.org,
	sunil.mushran@oracle.com,
	christophe.jaillet@wanadoo.fr
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: [PATCH] ocfs2: Pin the node manager module for open debugfs files
Date: Mon, 12 Oct 2026 09:31:38 +0800
Message-Id: <pm-ocfs2-objects-candidate-0089-v2-4c67f48d4e2d0fc85990@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node manager debugfs file operation tables do not set owner.
The debugfs full proxy obtains real_fops with fops_get() at open and
keeps it until final release. Without an owner, this does not acquire
a module reference. Normal unload can free the ocfs2_nodemanager
module image while an open file still holds its operation table.

Closing connected_nodes then makes full_proxy_release() read
real_fops->release from freed module memory. Removing the debugfs
entries during module exit does not drain retained open files.

Set owner to THIS_MODULE in the o2net and heartbeat debugfs operation
tables. The existing debugfs get/put pair then keeps the module and
its callbacks alive until the last open file is released.

A controlled test used an unloadable OCFS2 module and case-local probe
filters without changing the candidate open, unload or release logic.
Closing a retained connected_nodes file after normal unload produced:

  BUG: unable to handle page fault for address: fffffbfff804cfef
  Oops: Oops: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:full_proxy_release+0xbf/0x190
  Call Trace:
   <TASK>
   __fput+0x39a/0xa60
   fput_close_sync+0xff/0x200
   __x64_sys_close+0x8c/0xf0
   do_syscall_64+0x114/0x620
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   </TASK>
  Modules linked in: [last unloaded: ocfs2_nodemanager]

Fixes: 2309e9e040fe ("ocfs2/net: Add debug interface to o2net")
Fixes: 87d3d3f3931f ("ocfs2/hb: Expose the list of heartbeating nodes via debugfs")
Fixes: 3ba169ccec1c ("ocfs2/cluster: Add new function o2net_fill_node_map()")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index 8e6ead433228..1d4f71190d27 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -1447,6 +1447,7 @@ static ssize_t o2hb_debug_read(struct file *file, char __user *buf,
 #endif  /* CONFIG_DEBUG_FS */
 
 static const struct file_operations o2hb_debug_fops = {
+	.owner = THIS_MODULE,
 	.open =		o2hb_debug_open,
 	.release =	o2hb_debug_release,
 	.read =		o2hb_debug_read,
diff --git a/fs/ocfs2/cluster/netdebug.c b/fs/ocfs2/cluster/netdebug.c
index f7ab66e70799..5d373002297d 100644
--- a/fs/ocfs2/cluster/netdebug.c
+++ b/fs/ocfs2/cluster/netdebug.c
@@ -183,6 +183,7 @@ static int nst_fop_release(struct inode *inode, struct file *file)
 }
 
 static const struct file_operations nst_seq_fops = {
+	.owner = THIS_MODULE,
 	.open = nst_fop_open,
 	.read = seq_read,
 	.llseek = seq_lseek,
@@ -415,6 +416,7 @@ static int stats_fop_open(struct inode *inode, struct file *file)
 }
 
 static const struct file_operations stats_seq_fops = {
+	.owner = THIS_MODULE,
 	.open = stats_fop_open,
 	.read = seq_read,
 	.llseek = seq_lseek,
@@ -427,6 +429,7 @@ static int sc_fop_open(struct inode *inode, struct file *file)
 }
 
 static const struct file_operations sc_seq_fops = {
+	.owner = THIS_MODULE,
 	.open = sc_fop_open,
 	.read = seq_read,
 	.llseek = seq_lseek,
@@ -476,6 +479,7 @@ static ssize_t o2net_debug_read(struct file *file, char __user *buf,
 }
 
 static const struct file_operations nodes_fops = {
+	.owner		= THIS_MODULE,
 	.open		= nodes_fop_open,
 	.release	= o2net_debug_release,
 	.read		= o2net_debug_read,

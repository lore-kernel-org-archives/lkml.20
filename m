Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792468669;
	b=PBd8tqd03uRakYXCVsEvRxI+RKGuf2ixIAifOOEcOVeXu7T01BxN2oyt2ij0IYq7DbTa
	 lhNqm6buzaX6sVA0JwnteW37ctv60eMrTYskT0HWfqw2foGQH0uZQgKw6uH4coepNrUoV
	 atJlPxjaMDcrn/UtM8pEzJYG4OF5d0W+FTOHfZp3tPjxX6J4Ex5CVTs/V0cq6rWzfIl5L
	 /6c9ELZTcDMJtZOJXZOVz/6aXVby2en1cXSGJy4QQUTcHr+5xfxprqdEwiJFTCB8ivcVY
	 DeQSfhUNXjwnIHgLhO6TwYh45U+RDZCaY8mVMyAkzuxfaufWTFrMEtZQRYwfU45DTHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792468669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GjbNloEv1OIvWNQBjBw6yfhNVrFCgRGa2Awkmrsd1dM=;
	b=03PpVXo2PeY3X++en3RT54Vd3sNjHf6stWvoczgeYtKG+Z205fU+YGarnQydew1q4vk5
	 skaSjkaaEy1g6t2IqFszKA/NWAl9zvyn2Tr5tqPnZgmDlwZRQedR68UxkRF5pKmcg8IST
	 kHN/YqgK3scgYxq03+dKg0QDKIkLBCBEvnScIosyuZ4Bhk2DjC/EoBqMvZemk5sHPfv6P
	 2R7w/tgi5BpdJvgY97bemMQ8sHm8n/2FMrAsC2EyEgnXOWN3mCQ/AOxyahrQ344eTwHOU
	 Dm54cnZorKReUzMwxIskAoyNOpEHNlGaIzfU4KEgx85Q3XZP0nkbYaAD/xhY9wfgwqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YQhcM6y9;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F529606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F529606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YQhcM6y9
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9e53d011eso11482605ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792468668; x=1793073468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GjbNloEv1OIvWNQBjBw6yfhNVrFCgRGa2Awkmrsd1dM=;
        b=YQhcM6y9x/IvZMbFiQDLp5dt1FRbZpDdPWZRfHIkWQzyW2Trc3pOybtzPA//aAgG7X
         ltJRsy4YF6p6hoVbQL4XUCbh0GYCA9JXkEubDzYQjVPOdQvcsbay3+5bSY6CUNhqxm+M
         4qbpfDsGVo4Q9wINY4Ba73lQeFe6wlpWI9Pgm7euLnAUrYo+qGc9sXxKrMYneNlcjX7J
         mJOFA/gOO7SQBYPZ6gc+/EUp1mKM4MxQHm4L9yYUjSfdFNuuWsra2dTW0acl+zCTCY+C
         +gs28stEMxtjElNgnZ7aZh0oWXKWJWQhjTms4P6q8+/iiE93IkuMcdPLtWwEbOhcV2vo
         8z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792468668; x=1793073468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjbNloEv1OIvWNQBjBw6yfhNVrFCgRGa2Awkmrsd1dM=;
        b=LlvSKB/JmCv91cDCJmhoZCEL14jxtxMRb+1ZQjwbdQ7J/G6UO4ob+3cJuEQynnnKQk
         Lm8Iadx36feShD3PNk3cuEGYEJZquWmwTfhE3QYw3Ix7UaE5P7SGoN9aPoqZBL13S0k6
         9jH5IYnbB+7bkRezR7nyDahijSRRPo+FbWmasEOkj+sKXxGN/VFHZy/rL7h+k63OT1fP
         N23ToEC/8vTJpmpx4Zabnzi/Xzwt4bnhNBsl1dvIw3VdIurA5wxU/uxsxchE5m/cE4EO
         EYyOSqAMMnz+gr59l/LzLDYaVKsE6DAlA9spDSad02oSuA45i8dobpseSRfs1CLpYNzE
         hYHg==
X-Forwarded-Encrypted: i=1; AKwUvBw16WEy0+/rT0s+9BBxoNXEC+xSCM0hZ/NJEhupvr1fHRuQvbaB7ZWGDD4nuPe3TAFCga1hZvXEJF9KSdM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpbt7H//G+a9cb+fuxAe5u6d8QxFvCka4pcjY8XN5mJXF3UXEi
	2Q+iBep1q+X5i4X+2GECqc0ldyoPf2GyMOCCXdVrL/hzFBAM1MOpOWOZ
X-Gm-Gg: AYBFou2LPKf4r4aVwmT5f95Q0yQuD366/CmRNKNwh/UVOCboDMc5rn1wa70Z0phCSn6
	/kCQORvY73OEb5gyX267HMiAlDPR/j8Py9mQtrGPZz7NuyDOJTmoT1L4x7q5tt5omEmww0duPeC
	vXEewJpLjpZnkP/PyDFC6fJgIYAjVskkvtQNbAW4HU1BYAFKvUVyS4ejKBE7ddv78mWWqDB1/1/
	slQl3WNssD3fBYeb/Pt7aQr/XsSjjbQMKKmq68gwD6/P3KfPtjbOUlyN+ko8DfU9G99zDd+W1OS
	+zTYMYD/MHdIu0FRnoENDheTPXPWnwnhUM6a3IAVEp7eLMr+KjHOSsq711FRFN6zgnAt0y6fGSq
	XkcH65493dtAQAYVe3w60DSvULbbcY5pcnKUhkSZW0AN+yfMwDjMxw2L7Nzr3iPTrNeYyo1kCgE
	JE42TiF/eWgEYqsAwv6uNfxmSvT7z9+i/6DJwIckTREIGb4dOaUs15xHaeMhAm6NaCBw==
X-Received: by 2002:a17:902:e806:b0:2e9:568f:75bc with SMTP id d9443c01a7336-2e9a6c04230mr87982285ad.39.1792468668282;
        Mon, 19 Oct 2026 20:57:48 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea15180273sm7857015ad.60.2026.10.19.20.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 20:57:47 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	kees@kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4] ocfs2: Pin owning modules for open debugfs files
Date: Tue, 20 Oct 2026 11:57:42 +0800
Message-Id: <pm-ocfs2-objects-candidate-0089-v7-33777b9118b01969d965@gmail.com>
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

The OCFS2 debugfs file operation tables do not set owner. The
full debugfs proxy obtains real_fops with fops_get() at open and
keeps it until final release. Without an owner, this does not acquire
a reference to the module containing the table and its callbacks.
Removing the debugfs entries does not drain retained open files.

An open connected_nodes file can therefore outlive ocfs2_nodemanager
and make full_proxy_release() read real_fops->release from freed
module memory. Heming also reproduced the issue with fs_state and
asked for the other OCFS2 debugfs operation tables to be checked.

Set owner to THIS_MODULE in all eleven explicit debugfs operation
tables: five in ocfs2_nodemanager, four in ocfs2_dlm, and two in
ocfs2. The existing debugfs get/put pair then holds the appropriate
module until final release. Leave the open, read and release callbacks
unchanged. The blockcheck table already sets owner through
DEFINE_DEBUGFS_ATTRIBUTE(), so it needs no change.

The original controlled test used an unloadable OCFS2 module and
case-local probe filters without changing the candidate open, unload
or release logic. Closing a retained connected_nodes file after
normal unload produced:

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
Fixes: db02754c8a12 ("ocfs2/cluster: Show o2net timing statistics")
Fixes: 87d3d3f3931f ("ocfs2/hb: Expose the list of heartbeating nodes via debugfs")
Fixes: 3ba169ccec1c ("ocfs2/cluster: Add new function o2net_fill_node_map()")
Fixes: 50397507e856 ("ocfs2: Expose the file system state via debugfs")
Fixes: ccd979bdbce9 ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Fixes: 7209300a9b98 ("ocfs2/dlm: Dumps the purgelist into a debugfs file")
Fixes: d0129aceaecc ("ocfs2/dlm: Dumps the mles into a debugfs file")
Fixes: 4e3d24ed1a12 ("ocfs2/dlm: Dumps the lockres' into a debugfs file")
Fixes: 007dce53a29c ("ocfs2/dlm: Dump the dlm state in a debugfs file")
Assisted-by: LLM
Cc: <stable@vger.kernel.org>
Suggested-by: Heming Zhao <heming.zhao@suse.com>
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

---
Changes in v4:
- Add the missing Fixes tag for stats_seq_fops: db02754c8a12
  ("ocfs2/cluster: Show o2net timing statistics").
- Add Joseph Qi's Reviewed-by; keep the code unchanged.

Changes in v3:
- Match each .owner assignment to the indentation of neighboring members
  throughout, as requested by Kees Cook.

Changes in v2:
- Cover fs_state and locking_state in the OCFS2 filesystem module.
- Cover all four OCFS2 DLM debugfs operation tables.
- Keep the five node manager fixes and the original diagnostic.
- Add explicit module headers and Fixes tags for the added tables.
- Add Cc: stable@vger.kernel.org.

Link to v1: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0089-v2-4c67f48d4e2d0fc85990@gmail.com
Link to v2: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0089-v5-076c780eeaf45afb2a53@gmail.com
Link to v3: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0089-v6-f7fda843f80887488145@gmail.com

 fs/ocfs2/cluster/heartbeat.c | 1 +
 fs/ocfs2/cluster/netdebug.c  | 4 ++++
 fs/ocfs2/dlm/dlmdebug.c      | 5 +++++
 fs/ocfs2/dlmglue.c           | 2 ++
 fs/ocfs2/super.c             | 1 +
 5 files changed, 13 insertions(+)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index 8e6ead433228e7419bfbbe5c7cdde65c654a24f4..1cb516df53f4e1b3b2a292eb2550faa3d16e3fa2 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -1447,6 +1447,7 @@ static ssize_t o2hb_debug_read(struct file *file, char __user *buf,
 #endif  /* CONFIG_DEBUG_FS */
 
 static const struct file_operations o2hb_debug_fops = {
+	.owner =	THIS_MODULE,
 	.open =		o2hb_debug_open,
 	.release =	o2hb_debug_release,
 	.read =		o2hb_debug_read,
diff --git a/fs/ocfs2/cluster/netdebug.c b/fs/ocfs2/cluster/netdebug.c
index f7ab66e70799302f3ed4e70ab6a8fb057dd0bfa9..5d373002297de1fdd9a05e270f7942d8c1ce2dac 100644
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
diff --git a/fs/ocfs2/dlm/dlmdebug.c b/fs/ocfs2/dlm/dlmdebug.c
index ce6d301cb9420385211d20d59637069154a89993..8919eb14df22700b36b1edf985bca15b8f185fd6 100644
--- a/fs/ocfs2/dlm/dlmdebug.c
+++ b/fs/ocfs2/dlm/dlmdebug.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2004, 2008 Oracle.  All rights reserved.
  */
 
+#include <linux/module.h>
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/highmem.h>
@@ -339,6 +340,7 @@ static int debug_purgelist_open(struct inode *inode, struct file *file)
 }
 
 static const struct file_operations debug_purgelist_fops = {
+	.owner =	THIS_MODULE,
 	.open =		debug_purgelist_open,
 	.release =	debug_release,
 	.read =		debug_read,
@@ -394,6 +396,7 @@ static int debug_mle_open(struct inode *inode, struct file *file)
 }
 
 static const struct file_operations debug_mle_fops = {
+	.owner =	THIS_MODULE,
 	.open =		debug_mle_open,
 	.release =	debug_release,
 	.read =		debug_read,
@@ -601,6 +604,7 @@ static int debug_lockres_release(struct inode *inode, struct file *file)
 }
 
 static const struct file_operations debug_lockres_fops = {
+	.owner =	THIS_MODULE,
 	.open =		debug_lockres_open,
 	.release =	debug_lockres_release,
 	.read =		seq_read,
@@ -791,6 +795,7 @@ static int debug_state_open(struct inode *inode, struct file *file)
 }
 
 static const struct file_operations debug_state_fops = {
+	.owner =	THIS_MODULE,
 	.open =		debug_state_open,
 	.release =	debug_release,
 	.read =		debug_read,
diff --git a/fs/ocfs2/dlmglue.c b/fs/ocfs2/dlmglue.c
index 6bc4a21cf5f02f04a6b54100925084aed239ae62..88d9464660833006b7bac25e2c2641dd77874438 100644
--- a/fs/ocfs2/dlmglue.c
+++ b/fs/ocfs2/dlmglue.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2003, 2004 Oracle.  All rights reserved.
  */
 
+#include <linux/module.h>
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/highmem.h>
@@ -3332,6 +3333,7 @@ static int ocfs2_dlm_debug_open(struct inode *inode, struct file *file)
 }
 
 static const struct file_operations ocfs2_dlm_debug_fops = {
+	.owner =	THIS_MODULE,
 	.open =		ocfs2_dlm_debug_open,
 	.release =	ocfs2_dlm_debug_release,
 	.read =		seq_read,
diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
index 1e76b1d9fe0af4b3cf503e91e1dd077762fef88a..0af2245ae30369421e78ecd781b986c481d10f5b 100644
--- a/fs/ocfs2/super.c
+++ b/fs/ocfs2/super.c
@@ -387,6 +387,7 @@ static ssize_t ocfs2_debug_read(struct file *file, char __user *buf,
 #endif	/* CONFIG_DEBUG_FS */
 
 static const struct file_operations ocfs2_osb_debug_fops = {
+	.owner =	THIS_MODULE,
 	.open =		ocfs2_osb_debug_open,
 	.release =	ocfs2_debug_release,
 	.read =		ocfs2_debug_read,

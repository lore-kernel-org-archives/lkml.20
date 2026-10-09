Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7431429D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510231; cv=none; b=LkYaI9Iqy4icIoMQ5TPMt4oEJp4vkvxGIKrNoBowBeTlkQzIgdxI5HAE7230CXbrNYRs00kFDDl8V893Xq6iHE+H4HgdT21cGmAn+wR5Zi+7r1csVOaejdnPKaIPaC7C20kr5VOOQ4wsofHUcCSAaN1rv9V2a21fzJ1IjLr6bmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510231; c=relaxed/simple;
	bh=SYUMbJA3H1wELoN9ZbRQDQAXdKvi6eJiveMWaHIWSBY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HIoxpHbwcHCU2J8RFe3Mt1nz/ovIv0Dw0d9X3uTTxGAPW8yny4ecjSZS1mH+bCtuOxK+25Ni2QYnxbpBWqcq1Ii8oTQSIBj5tkg5PvaaE3c3HaBZJ5PnFXS1qWV1WkEBZD4gb5NOo3IiFAhQYRAKYtdM5hJQI7K4h/xPkzvepdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnJb1iUb; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnJb1iUb"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-86aecf49833so857456b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510230; x=1792115030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZnm1wY9gecrxp3h2osjOoN/UxlPNzvZVG2xZrbNWqA=;
        b=lnJb1iUb9UilHUz90ZKPpG88yNp4YOdRm9FDMJAUyuQtWo6hDZVNvIfFXlhe8b5mVQ
         cN+PoOIGVfbgelHX9RhPRkZtUj49s0lvBhWQQvjTH4qM7d9zrY+hid3oYbziq+4U6W9a
         p2IVRHJcKxOFmlu/g3mhrf9pkyPloCycgJF2uCRdwNW85nbZBxMiV0Cy1Hl2aVbXyLxc
         WC/ZBxM05EVE29oRTGZNIPoPf2TRzBG1ZQEbQ6lvVkk0Dgf91M2iENST3DUB79Xjanw2
         N5K7HrLKVmn6uL43wft+377HfKJFCEXOeMzczmPsnkh04M34+27W295rohNysJRhXFp8
         zpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510230; x=1792115030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZnm1wY9gecrxp3h2osjOoN/UxlPNzvZVG2xZrbNWqA=;
        b=1HsVbBithU7RjTASP2LjGHkVxsc5s1ifimVCY2jwPDdbajI/Ive84y/ksnUp4Uqe+s
         B2O0qKjG+9u1BgCtwRmBCpPazAZLLYbFu4bPYfBPoAritP7z8IYbB9sexBnkXQqDDuW/
         NHlaMj5mLHEeMB9e8CY4UPR1n7p0kuh50Z5YV5b5gU41eiUYSn8bn42DcTLcKD+fmH0M
         hL1hKzqncOecXOVdlI1FiqHipQj6xrinG4ZMiWm4MHg/duw1ceRiZnsw79xdIDHh1h7n
         qSiWu777v9fs2aEqxm9AE+c6cTZ9CKaq3PiAUv0TSiBVk1DGS2Op/gpUym9zzoF33AP+
         zZOA==
X-Forwarded-Encrypted: i=1; AKwUvBy7kTCs8RFUNKr3+AVkkeDI9CXEMSpdi6FS6l5gI8dES/risY4kqQLOPry16N67JjMnq+V8Pz2o6t44K0c=@vger.kernel.org
X-Gm-Message-State: AFuF++n6dilfAvUGNQR6WCHYPS0G5n09CcxRrJEOkZ9dg2GVm1+cWc5w
	FLNRTIUMkfW+d3c+aPfFQFkOQax8RuCP3E84eL6gW+185EIYpDSuLcw7
X-Gm-Gg: AYBFou3s/ifT5j1orweHS+FBWFS1LOw+RSyclOo98ykET8mUDnUxMwTEMFuw2bzu5wL
	1wsplaOyKgcqlpq554SezS5xpWo/9JRiK91qTAQHRUS2o2n/sJ/yDzRIixvDmX+EodawzYVfhm9
	Kfyy9SpL507DRq0BS1tmBa+cS1e6+qAozeygqvIoaO2F3r2pyd7tg5/GHFkapRmF7Mzvgq/a+rT
	8CuDlcwpameCGEp7keiBKD9CjSieyzKBM8SotNXqobcRjox4gm2zj7GfIhNYSSIn+252aE/RKI0
	07lXb3/Jqyg4Bf/WVeDV38/AEInM/thVXQSArNvHRKyZMou/7bPjjYgIQqyuy/isH/y0CLneffV
	istnM2Jr2Gg84qxWGk95XxHKqhhDDU7kNB+3LLi6XI6S8qDsxqWMAXVjrQsi2nmyeQWJcT06cjm
	GicisJzk7bJo7hPKaKK2oZ61CyRysnR01tJtIo1TCY8dLGB576dnjFphXbUYsy+Pgfmg==
X-Received: by 2002:a05:6a00:4008:b0:882:be9:b76c with SMTP id d2e1a72fcca58-896898e8282mr624156b3a.3.1791510229591;
        Thu, 08 Oct 2026 18:43:49 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896b68ef6c6sm285648b3a.4.2026.10.08.18.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:43:49 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	kees@kernel.org,
	zzzccc427@gmail.com,
	kuba@kernel.org,
	akpm@linux-foundation.org,
	kurt.hackel@oracle.com
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: [PATCH] ocfs2: Initialize status waiters before publishing them
Date: Fri,  9 Oct 2026 09:43:43 +0800
Message-Id: <pm-ocfs2-objects-candidate-0066-v1-437a0422801b292a2879@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

o2net_prep_nsw() publishes its stack waiter in nn_status_idr and
nn_status_list under nn_lock, then initializes the wait queue and
completion status after releasing the lock. A concurrent disconnect
can find that waiter through o2net_complete_nodes_nsw() and call
wake_up() before the wait queue has a valid lock and list head. The
sender can also overwrite a completion status with its initial value.

Initialize the wait queue and status before publishing the waiter.
nn_lock then orders publication against completion, and no reader can
observe a partially initialized object. Leave the IDR allocation and
its failure handling unchanged.

A controlled case-modified test kernel used a synthetic connection to
enter the real send path and overlap publication with disconnect. The
candidate completion and wake-up code were unchanged. Its Oops includes:

  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:__wake_up_common+0xa0/0x1f0
  Call Trace:
   <TASK>
   __wake_up+0x36/0x60
   o2net_complete_nsw_locked+0x222/0x370
   o2net_set_nn_state+0x917/0xea0
   o2net_disconnect_node+0xd0/0x190
   o2net_validate_control_write+0x454/0x500
   full_proxy_write+0x11f/0x180
   vfs_write+0x25a/0x1010
   ksys_write+0x111/0x200
   do_syscall_64+0x114/0x620
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   </TASK>
  Modules linked in:

Fixes: 98211489d414 ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 fs/ocfs2/cluster/tcp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/ocfs2/cluster/tcp.c b/fs/ocfs2/cluster/tcp.c
index 474fe1414cee8609d7976b983332c6e120f06fb5..8b3830b601ba6e5fe964bec970581b8e4ddbb5dd 100644
--- a/fs/ocfs2/cluster/tcp.c
+++ b/fs/ocfs2/cluster/tcp.c
@@ -301,6 +301,11 @@ static int o2net_prep_nsw(struct o2net_node *nn, struct o2net_status_wait *nsw)
 {
 	int ret;
 
+	/* Initialize all completion-visible state before publishing the waiter. */
+	init_waitqueue_head(&nsw->ns_wq);
+	nsw->ns_sys_status = O2NET_ERR_NONE;
+	nsw->ns_status = 0;
+
 	spin_lock(&nn->nn_lock);
 	ret = idr_alloc(&nn->nn_status_idr, nsw, 0, 0, GFP_ATOMIC);
 	if (ret >= 0) {
@@ -311,9 +316,6 @@ static int o2net_prep_nsw(struct o2net_node *nn, struct o2net_status_wait *nsw)
 	if (ret < 0)
 		return ret;
 
-	init_waitqueue_head(&nsw->ns_wq);
-	nsw->ns_sys_status = O2NET_ERR_NONE;
-	nsw->ns_status = 0;
 	return 0;
 }
 

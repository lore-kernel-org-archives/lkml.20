Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9329F393DFB
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853822; cv=none; b=s2HfpacGZIqnP/cpSaNY7xaV5vQyZ44WKmRJ8Fw1nUIAFhUf2nRXSJCIJC5svYJNqF28Ym/nn9aTO/+xG85Aix/5w2JwCsYIi6gsU0Z6zWMpf+0NRdcl6TmYEeFNwhXpbSgGzQcvggzet9DkVQ0pBYZMZzm7MZhHB0vr6c0z2bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853822; c=relaxed/simple;
	bh=u7RZsCJzDmRndvdfzCcxvjZWSaqNNq4zQG9yFKnh1qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VluLIcn07rNGw+qisKB3ChQ+MJ03UJDI7C057KsVTSrSHUNorse0cZjVuXrt/IPIU6ZxBhNWaDIoeaN1v611phXA6aPx1XcXg+iPiOf7lM8vO8nA5hxove+USUt7rXDdaYbnGn3MmgsFOeeSiB/REogxqAKoomcnRUOEHAPR4CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqkxkDhx; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqkxkDhx"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eefae4so5457315ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853815; x=1790458615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HeCTH4hMEmt82JlJSplrRcPPcTEJsM71YGXm03ILYnI=;
        b=hqkxkDhxa18NtRQg3Ftt6A/rw+ybZEsoqJ7mbfBd9qyZVdVisq/cqAE2ASZx/JAVbC
         +cgpDpXifB0ADvbBIH9/x6XbXbdmtheKo8zCvlhN0h/QUvXyUIenvOpKxf0CSrQCBWa1
         37fjgXiOItpEDGBkwNpWXtCqWcgWnouyc2h8mrHtfd55rtIhIFuG6nrwQzIsLf5kXm4c
         wAVByB/7LDBl8pfJVnAqU3D9i/lArPmKqZfEf0FuAZmXDYXwzzQOLWFhY487QAhgzpZ6
         SLcGwTG6u4jqWGcdI1FA7SpIcMku4gZIiEP4ewyGKcu079wb/Azu+xn5bHRWUI8lP54/
         D7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853815; x=1790458615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HeCTH4hMEmt82JlJSplrRcPPcTEJsM71YGXm03ILYnI=;
        b=jklux+bEHxSVPb+6BoLJXj73Is5sT7T+ykxi4NXtBgQDlnWHdWQ2dwZHlao6ONRxzr
         htZyMGdgq/sHarkDzLZeRm0ON/Tdb86cyEbDtVbsIJn16I/4xBClVdZE0+siPu2SrjFC
         +ARKSZm+2biiZ9o2obP8xv3Qj/iBrlwd6CKeoEVfkBf1owkJa3u7BPfagZbT7IqOVuEH
         nl0y/hppUfjxu90dzZCd1s0kTwHmejk44dnbNOp4WuMjoB4C7FoqQd5g89BdnGUPnWCo
         xyZkOPGCip/sbejZ22q9J50c123eaFOfgslCM+c8B+r6/2CQAItSCThmAzwPBsG4TAHK
         wKPQ==
X-Gm-Message-State: AFuF++mxBYy6VfXmZ4RQ3TRZZnH3Z9fF8Cb3Mn6wYpQLQ30wzTTAiJqE
	s2mnYF74ubZB9w1ilIVG4JR6cHdM6q0EkViY/ZtTweCl+JriuBi2/3SZ
X-Gm-Gg: AYBFou3ZYbXCAV9YP9v7+2wVisXcBWqrr33IAvc6hiGi/vnr9o5ytGNptSMHvRYBwQ9
	Yghr4BBh/9lma3w241IW61u0/o9/Yj1DvMpCg876bC8JQwaTRZE4SvlH6R2yjGpdQUIWV9BlgGe
	3hSwx1ULZPMMfhB2JBeFOetLYewOfFhw8fPdbrr2MGNAm0Kag/KzOS0r3Jfk7l5N9HZ1evHq5fZ
	661w8QqnP6xv7xcNY7DuOzMBQwM8rKqJN0mHkxvzUVB0siIFgXorV3m24gCkJtXhXbVFtEbxxhK
	xdPp5L+ZyCBGk6oveYI4De9Ae8Sv9qAQArApdv8Fh5ddd0wyZMJ8FSHLPrX9Hl9HxaBz+AROe8k
	kfH3Fgt16vo9mz0TgnUUt1kRwue7buQ4omkEkkAO65laVWQBshQ7P0Dk6BKHNXvEbLDwEoOZeCa
	sQij8VsIuDae3u/pRENJvs5Dm5df9knfV/R8rH/Ry36a2+unqeZGSA9Jcq+mZ90ezqxjNZ4QoU0
	g8CVWPYjq8IR4tRN5GU/wEkoUHD+lHaPyfu3NXUeYvxhWPcbqRTg6mSDtmpd8/fooJm8CNLDEtR
	HSRRTyhh9w==
X-Received: by 2002:a17:903:11c9:b0:2dd:c100:251e with SMTP id d9443c01a7336-2ddc100256bmr33565105ad.39.1789853815555;
        Sat, 19 Sep 2026 14:36:55 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc1803bf6sm12538965ad.75.2026.09.19.14.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:36:55 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	brauner@kernel.org,
	cmllamas@google.com,
	aliceryhl@google.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] binder: restrict BINDER_NLGRP_REPORT to CAP_NET_ADMIN and fix binderfs minor leak
Date: Sat, 19 Sep 2026 21:36:54 +0000
Message-ID: <20260919213654.3317464-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix three security and resource-accounting issues in `binder_netlink.c`
and `binderfs.c`:

1. In `drivers/android/binder_netlink.c`,
   `binder_nl_mcgrps[BINDER_NLGRP_REPORT]` is declared without `.flags =
   GENL_MCAST_CAP_NET_ADMIN`, allowing any unprivileged local user to
   subscribe to the `BINDER_NLGRP_REPORT` Generic Netlink multicast
   group and monitor system-wide binder transaction error reports
   (including sender/target PIDs and transaction metadata).
2. In `drivers/android/binderfs.c`, `binderfs_binder_ctl_create()`
   allocates an IDA minor via `ida_alloc_max(&binderfs_minors, ...)`,
   and if `d_alloc_name(root, "binder-control")` fails, jumps to `out:`
   (which calls `kfree(device)`) without freeing `minor` from
   `binderfs_minors`.
3. When the `binder-control` inode (`device->context.name == NULL`) is
   evicted in `binderfs_evict_inode()`, `--info->device_count` is
   decremented even though `binderfs_binder_ctl_create()` never
   incremented `info->device_count`, underflowing `info->device_count`.
   Only decrement `info->device_count` when `device->context.name` is
   non-NULL.

Fixes: 63740349eba7 ("binder: introduce transaction reports via netlink")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 drivers/android/binder_netlink.c | 2 +-
 drivers/android/binderfs.c       | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder_netlink.c b/drivers/android/binder_netlink.c
index 81e8432b5904..3f1a4210aa52 100644
--- a/drivers/android/binder_netlink.c
+++ b/drivers/android/binder_netlink.c
@@ -16,7 +16,7 @@ static const struct genl_split_ops binder_nl_ops[] = {
 };
 
 static const struct genl_multicast_group binder_nl_mcgrps[] = {
-	[BINDER_NLGRP_REPORT] = { "report", },
+	[BINDER_NLGRP_REPORT] = { "report", .flags = GENL_MCAST_CAP_NET_ADMIN },
 };
 
 struct genl_family binder_nl_family __ro_after_init = {
diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index 361d69f756f5..661fda3ecb59 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -258,7 +258,8 @@ static void binderfs_evict_inode(struct inode *inode)
 		return;
 
 	mutex_lock(&binderfs_minors_mutex);
-	--info->device_count;
+	if (device->context.name)
+		--info->device_count;
 	ida_free(&binderfs_minors, device->miscdev.minor);
 	mutex_unlock(&binderfs_minors_mutex);
 
@@ -430,8 +431,12 @@ static int binderfs_binder_ctl_create(struct super_block *sb)
 	device->miscdev.minor = minor;
 
 	dentry = d_alloc_name(root, "binder-control");
-	if (!dentry)
+	if (!dentry) {
+		mutex_lock(&binderfs_minors_mutex);
+		ida_free(&binderfs_minors, minor);
+		mutex_unlock(&binderfs_minors_mutex);
 		goto out;
+	}
 
 	inode->i_private = device;
 	info->control_dentry = dentry;

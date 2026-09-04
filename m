Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6AD39CD00
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566265; cv=none; b=plryiycYz7mMFydzHjyUjczB2P23Ocda2MiW7BRPZ8Y37KrwtJeDw6QlA3rXqF8kPTTmvMUPC8+EbhoTLWa0CnNgNGhDriDrqOb1KKGOdLG17gcaNYrfiq1ZIEEF5IDzL4MEa4jQUgkkWW+OO+vgvJt9TdHGO50qLgfo+z/ho1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566265; c=relaxed/simple;
	bh=xyuUL9Vw9xbTnoxc8//PAV2BBZSGl1MIqqpiQJbRaag=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nnHFqn302c5+W4a28cDzENnNmoixUUeyenRinCP7uYb6Lh3/4D3cNNP5kcrouoUax7fk3MPFKBm4gDn0Xm26zye9ywhGuJgyauniR4hVuMeUhGeoRuwKKz/XFrGoAPoLczy+ExKwVKb2jvN+GnhcpAEZC++ecj1tDWorlVCe3Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THS4zCGE; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THS4zCGE"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so1126673a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788566263; x=1789171063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jdg1epLFOWbc0vDaaDLE4AWGZkYqi8Y+lj6oxcRbQB8=;
        b=THS4zCGEjq3qUR7vX2OQZClw0KlIKTkJhHeQog+v+RQm50NHD3LMWut5XSKrePUimr
         aFSShK/hZ0AwFjvSJ6YQcTVk55hNeOFky2GBUKmmaO+SAVp0r+7sVDl6Huoj46lpGguu
         t1v5/NS6RdF2G9qZS9uOQI80gbT1UntJq1J8Ta0tThmBch31ZdBdi/RP4xDNC5g1Y8h0
         I6cE3Yt2vwxANHRoI/7TM6zGACmbfPC4tcLN/b2ms/YfGSygf+ruJPg/bjwN6MStjDTA
         pCw/25yeyIqsFMoGSdV9qI8Ozkrqjldi2biBzxZm7O8xRvTZx8Ag2Daei5kZ7X9vSpqZ
         ArpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566263; x=1789171063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jdg1epLFOWbc0vDaaDLE4AWGZkYqi8Y+lj6oxcRbQB8=;
        b=FDL4eYfYRGHAin5fNXqShQu+yVPNciklhCpwdEljE2l8sRTLk/Q6y17Fpa9RkWfNqA
         AvrqT9O0afKOS7KJ02ZHhKk8S7CyXhMhIJvyypoQKYmTdowZdY7m7+Lv33Sb3oyMzzsd
         O7iMCR0mToK+tdJEvs0uJGnELy9P8dbThWQ1Z1p6KYPXv2EI5MrP7apJA7TwQwDkgA7q
         vcn69L5ncWLi5tr/bERqYYq64Doopq9d22+FyYVw+jczPqEPGvdp6opc3QPn0FEjQ8DG
         sRnXlvSnRvdYgpq1eVGeTfDxvopRLeyEoiKwjPxQ41KmpLb5UCINH+1/TldqXT29rPDC
         PrYw==
X-Forwarded-Encrypted: i=1; AKwUvByCkD5BMfFndC+l9Zl5CmjPwew5QTAQ4W7gCwjODvozhnP2+kO4Pq3KT3n8IJ0Tw59E6COwnPN/2lMPrz0=@vger.kernel.org
X-Gm-Message-State: AFuF++mYdSunfSgeNri9wQ5nfwkBrZ8hCLAHhDvlwrGsxxFDpJx92Ntj
	LTKTpuONYhf8LvFcHTrL0e+YyUHQTstRSjnMTNjBuFjodbDg6nz7Vs8E
X-Gm-Gg: AYBFou0jiCU0ANR7DAfeP03L6ilF0MLCyyfU2bpqTkty0U5Uq5f7PapvV3Hpz3+tZC5
	6dhV76pPwotGy6PPmr/z56TLnIj+buLrLKkYfshZe9tSEvlc7IJYhmYfL7ahDdQ94H8dL0eYPvP
	HlZjM3oojCuwgISOmKiX2RKnHrRoG21By6+Caq2vMtwn8m8CgBXV1BACTIvwUeIR3AxsuPEIIi5
	Fe2gYcHijQ4coiHUBuwB1qDnJxPTr3kO/hx1dqNo/iEknEYnQBRN5YMTiRvnCdQUOudNw0sixqB
	/aqTRwynn7vULHjcpT2y0PezkchdEMlOfYZJEBpHA649KYjVOPO8PNsdZA0NQONMMainj40/kiI
	f0FOuYmH/Wk6BqwtfN/GmFBycH7K+HmBNF61cGv5YyDHbIjfvhFCKbMr4u8sYwHKcJIByrF4mjd
	Z35y09Yt13r0+et2WpBLLcaYEHZWjPCIJdpMh9qgfxMXFEiXXmDEKDr3mLJI+E+dG7nb0u937kv
	0e1EttnhAFgA8yJTGseQS0b
X-Received: by 2002:a17:90b:1c0a:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39b2623abfemr13100856a91.21.1788566263169;
        Fri, 04 Sep 2026 16:57:43 -0700 (PDT)
Received: from deepanshu.. ([2405:201:682f:383f:35e0:2c1e:70f6:a9ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm12815116a91.11.2026.09.04.16.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:57:41 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	akpm@linux-foundation.org,
	brauner@kernel.org,
	jack@suse.cz
Cc: zzzccc427@gmail.com,
	ericterminal@gmail.com,
	ocfs2-devel@lists.linux.dev,
	christophe.jaillet@wanadoo.fr,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
Subject: [PATCH] ocfs2: fix use-after-free in o2hb_region_dev_store
Date: Sat,  5 Sep 2026 05:27:10 +0530
Message-Id: <20260904235710.16317-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Concurrent writes to a region's "dev" attribute can race, letting two
tasks both allocate/free reg->hr_slot_data for the same region and
causing a use-after-free. Add a per-region mutex to serialize
o2hb_region_dev_store() against itself and against
o2hb_region_release().

Fixes: 1d3aa0b97c55 ("ocfs2: port block device access to file")
Reported-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3025e3e8fc0b928af8f5
Tested-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 fs/ocfs2/cluster/heartbeat.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index 1c3def99bb07..6f03de1b6d4a 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -273,6 +273,9 @@ struct o2hb_region {
 
 	/* last hb status, 0 for success, other value for error. */
 	int			hr_last_hb_status;
+	/* Serializes dev_store() against itself and region_release() */
+	struct mutex            hr_dev_write_mutex;
+
 };
 
 static inline struct block_device *reg_bdev(struct o2hb_region *reg)
@@ -1616,7 +1619,10 @@ static void o2hb_region_release(struct config_item *item)
 
 	o2hb_quiesce_timeout(reg);
 	o2net_unregister_and_flush_handler_list(&reg->hr_handler_list);
+
+	mutex_lock(&reg->hr_dev_write_mutex);
 	o2hb_unmap_slot_data(reg);
+	mutex_unlock(&reg->hr_dev_write_mutex);
 
 	if (reg->hr_bdev_file)
 		fput(reg->hr_bdev_file);
@@ -1879,9 +1885,6 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 	ssize_t ret = -EINVAL;
 	int live_threshold;
 
-	if (reg->hr_bdev_file)
-		return -EINVAL;
-
 	/* We can't heartbeat without having had our node number
 	 * configured yet. */
 	reg->hr_node_num = o2nm_this_node();
@@ -1906,12 +1909,20 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 	if (!S_ISBLK(fd_file(f)->f_mapping->host->i_mode))
 		return -EINVAL;
 
+	if (mutex_lock_interruptible(&reg->hr_dev_write_mutex))
+		return -ERESTARTSYS;
+
+	if (reg->hr_bdev_file) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
 	reg->hr_bdev_file = bdev_file_open_by_dev(fd_file(f)->f_mapping->host->i_rdev,
 			BLK_OPEN_WRITE | BLK_OPEN_READ, NULL, NULL);
 	if (IS_ERR(reg->hr_bdev_file)) {
 		ret = PTR_ERR(reg->hr_bdev_file);
 		reg->hr_bdev_file = NULL;
-		return ret;
+		goto out_unlock;
 	}
 
 	sectsize = bdev_logical_block_size(reg_bdev(reg));
@@ -2029,6 +2040,8 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 		fput(reg->hr_bdev_file);
 		reg->hr_bdev_file = NULL;
 	}
+out_unlock:
+	mutex_unlock(&reg->hr_dev_write_mutex);
 	return ret;
 }
 
@@ -2149,6 +2162,8 @@ static struct config_item *o2hb_heartbeat_group_make_item(struct config_group *g
 
 	config_item_init_type_name(&reg->hr_item, name, &o2hb_region_type);
 
+	mutex_init(&reg->hr_dev_write_mutex);
+
 	/* this is the same way to generate msg key as dlm, for local heartbeat,
 	 * name is also the same, so make initial crc value different to avoid
 	 * message key conflict.
-- 
2.34.1


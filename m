Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878734;
	b=3ZPgrALe4txnzYduCZAFow11dsuR9T6fMzLCaePI3F1Ve1vl5F6Qzu+oQDF4EkRsmD/X
	 ln8YsAJb8YCqmYDKVV9m/Zj4L/FDXFOiKtdd6bIwjLiBYXOBEspH/6YVtxNEXqOjNg3V3
	 qjm+DpPnYp40N/Ojq/MplUaioznutlyz1lZ25J8TMjyyrJj9c3nL5rg80+jJrvnBw9o+7
	 Km734QNQ6Ez+R/f/pgGfUvnFyH/ZWWo0+4WE4JV7mokrryqSOxjUZoacKvaPJd95sy6WD
	 teOuMUVkTqxvC/XWU1PH+Ycxl6cX4/+CmAOPMGvz4+Zz9nhYvt3gBZXx19v7GfX5Zwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878734;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tY7QWpvVd5l3MqdH8XX93jgpLXZFpNeSnWHI3amMvrQ=;
	b=r1SjLKsBG4U71e+mdX8JlLJtzPf1gHir82femHxz7KgBa301gOXll710nEg2sgcWRnG3
	 IFnF9QM+QP/IHBLR0sqbAEuzVzlRDZ4zDALVONeo/cqzyZGbK8dpeb64C3H3UJo10IqVn
	 fx8qqdSAcNiZ5SiXqW+z88VND3VX8Chnr+wfVx+IUh3kgEtRrGdIpUcUjlIZOXd3c/Cla
	 Z6doffYNgYnZOWlR6JcYahcy9bURL1LYsF+/sbthLJLd+KnHabbQ3j2aerzCV8VwL51dc
	 7xtIIvReO2LQTrnOSMVc5efODbS9cn5yEFnaLMCnf3Vd4tVLKQEozhfKhjsLeuszLDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b="HUG5b2n/";
	arc=none smtp.remote-ip=202.108.3.167
Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn [202.108.3.167])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450C3606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 450C3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=HUG5b2n/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793878731;
	bh=tY7QWpvVd5l3MqdH8XX93jgpLXZFpNeSnWHI3amMvrQ=;
	h=From:Subject:Date:Message-ID;
	b=HUG5b2n/Z0s7M3jAo4MqiLC1zI1JlLE5/uvTfVgRUook1piCEVwD7Oje052iN4mo/
	 ETY3Ueycg4t7/q7jC+9xTt8Lgv6ikU83OZ7H80/O2yHl21/Lt8sR88FWCGwMzPezXo
	 /MG/gqylSwClcq9tLVWLPhdbH9MFtYvQswUkvQd8=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6AEC6ABA00007D81; Thu, 5 Nov 2026 19:38:40 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7591716685168
X-SMAIL-UIID: 1B2DBB9BA20E4DEF95F3F24B859562F6-20261105-193840-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+41e0d7cdfb1ecfc4a007@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [dm?] BUG: unable to handle kernel NULL pointer dereference in dm_bufio_client_create
Date: Thu,  5 Nov 2026 19:38:34 +0800
Message-ID: <20261105113834.63912-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6ae78418.6552420f.2a0efc.005b.GAE@google.com>
References: <6ae78418.6552420f.2a0efc.005b.GAE@google.com>
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

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git abf8c33470f7

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 358ed77ffb2b..f15d5815ffab 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -3292,6 +3292,7 @@ static int pool_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	dm_block_t low_water_blocks;
 	struct dm_dev *metadata_dev;
 	blk_mode_t metadata_mode;
+	struct block_device *md_bdev, *data_bdev;
 
 	/*
 	 * FIXME Remove validation from scope of lock.
@@ -3331,6 +3332,7 @@ static int pool_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		ti->error = "Error opening metadata block device";
 		goto out_unlock;
 	}
+	md_bdev = metadata_dev->bdev;
 	warn_if_metadata_device_too_big(metadata_dev->bdev);
 
 	r = dm_get_device(ti, argv[1], BLK_OPEN_READ | BLK_OPEN_WRITE, &data_dev);
@@ -3338,6 +3340,9 @@ static int pool_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		ti->error = "Error getting data device";
 		goto out_metadata;
 	}
+	data_bdev = data_dev->bdev;
+	if (md_bdev == data_bdev)
+		metadata_dev = data_dev;
 
 	if (kstrtoul(argv[2], 10, &block_size) || !block_size ||
 	    block_size < DATA_DEV_BLOCK_SIZE_MIN_SECTORS ||
@@ -3428,7 +3433,8 @@ static int pool_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 out:
 	dm_put_device(ti, data_dev);
 out_metadata:
-	dm_put_device(ti, metadata_dev);
+	if (md_bdev != data_bdev)
+		dm_put_device(ti, metadata_dev);
 out_unlock:
 	mutex_unlock(&dm_thin_pool_table.mutex);
 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491224;
	b=5ZF7tNUV2CBFLReMcgQbUqjUweOoS6tjTyTyl2EAeRvJO7phaySyC8aSXVymzd1esnF7
	 zq5x7uXfIQAmX4JYULvxxxuwGqoSIvieDz897BHsRIFFe81RX+5ePd8p6DFpr7GH/mrx5
	 aqmN/vMjJkZSHXqvNAxgiXz6vdo/LlNaJGCS0T8c1guuIpwVywpR8d1I9cvBnDyM4idUV
	 t1yCA7EPABZbqBTPectky/z0nCHPpHTwFf2RIw5AgvOrN73LykRSYgc3d+uhxHEPg9dW/
	 3qKzCNQMNkJFR/FZ/dKjnyWtD+GNSUCg1Vic9a7sh+yQYsJ1cINue97nUIfACCm/sUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qNymzDosyssirHh6rkM29aji4YAJzAJONRlEIoQfifg=;
	b=3PIAvVJByHDMIzKup62JwQMLsnCbyyhcmj2l/Y83uIXPZnlg2Xpb0wOCg0ZgJwoD3Ms4
	 req2U2Ln0mdqEkDI8rbUjCRFHKe6WbD81EL4HUhZTOldZ+FH6pCVexQ28OjXefxG3RuHL
	 9WzV3KxkjjPWWLv3qPkz4h4gMDlxr2SiI0v69jM7KyBI0M7DJC12JUwV/CdawOZMOI0Vx
	 lzjT6gVeWNnhMBLbS4bJsGFWQpLTjMY/6n8NilIJsBiNlX1t9N+pZvAlqGlz5EhvPCWbr
	 sYmI61zndZ4gW0TCfd50JEx32hNCwpjjjnvjgjpfjTlIn+dUJnphakBmihV1llO3V0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloud.ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=Uo5f+Wf7;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2D3606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B2D3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=Uo5f+Wf7
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a599e9110eso4789815e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1794491223; x=1795096023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNymzDosyssirHh6rkM29aji4YAJzAJONRlEIoQfifg=;
        b=Uo5f+Wf7L971pTo6WJf8gowdkRSrduI5BUcOkouqqbpdJEqUoUn4+fgqdvTgKBvsB8
         9GyIsoVFnTpPS5vnf3IIMAmAjhr+DvRc6sMYPOUCQR1PYITYHmN8/S8l3C7I1YG7V6gg
         FFxxxSgg0YyCuyN+wDi2uS6OUJzq0R+Pw7ErE/BfygAufUHYMgan+oi39qNkq6pN0mqU
         6Fo5ZZmyiqk5nUlKOMbiI602K2uQ6wDMNjK/mNBkDe641t3V4V6g/+ZVPOUCnjUJqTwn
         u03xX2BkYfEPK5LWBITgIhCMuIXePDDKm5VDfstRSg9TBQUOmD5mG7ZU9UaLexBUiYCX
         f2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491223; x=1795096023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNymzDosyssirHh6rkM29aji4YAJzAJONRlEIoQfifg=;
        b=UZ9DS+fGxBcGq5kBLMc4m7/kZyyJ11Tw5WlezQGDy4dsDgQzZOBEa6Mypmhrxjf4l3
         xRJWuuA/1tyotd0DI7vvvNaIoJFvCBCsQiamWsn82f+qJPgCAcPzoEIsCmczKTiOvPf3
         3LYaxV1IIK10lwljLixHSZa+q/7rW2QLiseNHEkE/W3TWjVB4ZUAKrouSWgsT9M+YUbc
         3FzdvVY87SdusjxdAFPZwuwscbJ56o8GejQNbrCn9WB1xg3t1zRmlwyaDE9eK/Yp0NJm
         xqLVrFiEiITjsxhimUB22bSnK6OPHNEzlAl9b98Nb789nj88m3h9cKRro3+kQuHw/Mlz
         XyHw==
X-Forwarded-Encrypted: i=1; AL+hErEDWYc7RGVImfytRQ6GRpcn/hMOY5+f/eYwgE+tPgfkOVwAJWHDFQLR/sy1Az2TnT/qWd70BF8oVVMDj10=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qF4/j6CS5ufekHYkXI+gxnenlE6BquS33hntQzc7r2w7AfDIB
	SBvgy31jkG3w4IbsGq854lBSpvWfnZuteTLfgaiVee9NDAj+agVLaoLteMIBM6SEPm8M+DXwIwF
	/SdxqJPs=
X-Gm-Gg: AYBFou0tIyL6nWRqBhEaoLhlR6x3zRyTFVeoqeEC7sL6sIptgFp/VI3UjbmveGnIjjU
	C+WC1KW4IBWs+1kaWegVn+Ubn8uBWDVzPXYKiBLlCa9WxXQImndnVAHPOGYdJiLSdRuPtWYpFzA
	CilTLP0RFF8L21EMi/TW34TTeOvz3dhO7z9IYMoWhJrR9bLCp/03FVPxnWkxYxVFmGpI60W35QL
	LJa94R+6EyXcZf0hbm4FjBRFkaTv4rn3RB7spD1B/1yDu/MIaVspkcZzUJvgbhFK03PdUR35gB5
	M451g2J33IUPIwmEcGmtNMFVNuc1dnk6e4Wt5PnQZW99lwzgrjiAYTHVRxnDglrVY4z17qqMaSr
	4HZYZ2pK4VczaP02Ao/7QsV8iFCWTHZGXSLtkSTa7E62svhQ5gXnlTW6tHl30k9uLSNyX/MPPVk
	Dz/jHKVvrGhRrHwcFrmT36Lv0eZho7tyz6sr7cudINf7mzQj4+HMDXd0NaYXYeGg932sYRZ8IZx
	H3eKqmZSpexeXb5Gyuh0g66y2v4uMrhNkdGYZ8XIF4bk03gfF+zJZPxuvY/8vvJR8S6h4gdi6q/
	i2b5Cctgv1m1VWJ/h43TxzqPsZALCbg0hLTnugNvJcJSmrUHRpv5fvQs36BsAHFoJJFvdMjWjZU
	7+N5JYg==
X-Received: by 2002:a05:600d:8448:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4ba091a59aamr83247765e9.0.1794491222602;
        Thu, 12 Nov 2026 05:47:02 -0800 (PST)
Received: from jwang-ThinkPad-T14-Gen-6.fkb.profitbricks.net ([212.227.34.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367b99bcsm17665990f8f.51.2026.11.12.05.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:47:02 -0800 (PST)
From: Jack Wang <jinpu.wang@cloud.ionos.com>
To: Yu Kuai <yukuai@fygo.io>,
	Song Liu <song@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>
Cc: Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	linux-raid@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] block: suspend bio based disks around queue limits updates
Date: Thu, 12 Nov 2026 14:46:59 +0100
Message-ID: <20261112134700.372702-2-jinpu.wang@cloud.ionos.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112134700.372702-1-jinpu.wang@cloud.ionos.com>
References: <20261112134700.372702-1-jinpu.wang@cloud.ionos.com>
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

queue_attr_store() freezes the queue under q->limits_lock. For md this can
deadlock: a bio parked while the array is suspended still holds a
q_usage_counter reference, so the freeze waits for it, while the suspender
waits for reconfig_mutex held by md_start_sync(), which waits for
q->limits_lock.

Add optional ->suspend() and ->resume() block_device_operations. When
present, queue_attr_store() and the integrity flag_store() suspend the disk
before taking q->limits_lock and commit the limits without freezing the
queue. Other disks behave as before.

Fixes: c99f66e4084a ("block: fix queue freeze vs limits lock order in sysfs store methods")
Suggested-by: Yu Kuai <yukuai@fygo.io>
Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>
---
 block/blk-integrity.c  | 10 ++++++++--
 block/blk-sysfs.c      | 19 +++++++++++++------
 block/blk.h            | 20 ++++++++++++++++++++
 include/linux/blkdev.h |  7 +++++++
 4 files changed, 48 insertions(+), 8 deletions(-)

diff --git a/block/blk-integrity.c b/block/blk-integrity.c
index 964eebbee14d..b449e7c04eea 100644
--- a/block/blk-integrity.c
+++ b/block/blk-integrity.c
@@ -226,7 +226,8 @@ EXPORT_SYMBOL_GPL(blk_integrity_profile_name);
 static ssize_t flag_store(struct device *dev, const char *page, size_t count,
 		unsigned char flag)
 {
-	struct request_queue *q = dev_to_disk(dev)->queue;
+	struct gendisk *disk = dev_to_disk(dev);
+	struct request_queue *q = disk->queue;
 	struct queue_limits lim;
 	unsigned long val;
 	int err;
@@ -235,6 +236,10 @@ static ssize_t flag_store(struct device *dev, const char *page, size_t count,
 	if (err)
 		return err;
 
+	err = blk_disk_suspend(disk);
+	if (err)
+		return err;
+
 	/* note that the flags are inverted vs the values in the sysfs files */
 	lim = queue_limits_start_update(q);
 	if (val)
@@ -242,7 +247,8 @@ static ssize_t flag_store(struct device *dev, const char *page, size_t count,
 	else
 		lim.integrity.flags |= flag;
 
-	err = queue_limits_commit_update_frozen(q, &lim);
+	err = blk_disk_commit_limits(disk, &lim);
+	blk_disk_resume(disk);
 	if (err)
 		return err;
 	return count;
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 520972676ab4..3cbe36d04699 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -887,20 +887,27 @@ queue_attr_store(struct kobject *kobj, struct attribute *attr,
 		return -EIO;
 
 	if (entry->store_limit) {
+		struct queue_limits lim;
 		ssize_t res;
 
-		struct queue_limits lim = queue_limits_start_update(q);
+		res = blk_disk_suspend(disk);
+		if (res)
+			return res;
+
+		lim = queue_limits_start_update(q);
 
 		res = entry->store_limit(disk, page, length, &lim);
 		if (res < 0) {
 			queue_limits_cancel_update(q);
-			return res;
+			goto out_resume;
 		}
 
-		res = queue_limits_commit_update_frozen(q, &lim);
-		if (res)
-			return res;
-		return length;
+		res = blk_disk_commit_limits(disk, &lim);
+		if (!res)
+			res = length;
+out_resume:
+		blk_disk_resume(disk);
+		return res;
 	}
 
 	return entry->store(disk, page, length);
diff --git a/block/blk.h b/block/blk.h
index ed2172472622..1c214f0bc178 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -661,6 +661,26 @@ void drop_partition(struct block_device *part);
 
 void bdev_set_nr_sectors(struct block_device *bdev, sector_t sectors);
 
+/* Suspend before queue_limits_start_update(), never under q->limits_lock. */
+static inline int blk_disk_suspend(struct gendisk *disk)
+{
+	return disk->fops->suspend ? disk->fops->suspend(disk) : 0;
+}
+
+static inline void blk_disk_resume(struct gendisk *disk)
+{
+	if (disk->fops->suspend)
+		disk->fops->resume(disk);
+}
+
+static inline int blk_disk_commit_limits(struct gendisk *disk,
+					 struct queue_limits *lim)
+{
+	if (disk->fops->suspend)
+		return queue_limits_commit_update(disk->queue, lim);
+	return queue_limits_commit_update_frozen(disk->queue, lim);
+}
+
 struct gendisk *__alloc_disk_node(struct request_queue *q, int node_id,
 		struct lock_class_key *lkclass);
 struct request_queue *blk_alloc_queue(struct queue_limits *lim, int node_id);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 0c2010230632..0011b7c0740f 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1601,6 +1601,13 @@ struct block_device_operations {
 			enum blk_unique_id id_type);
 	int (*init_dma_buf_io_ctx)(struct block_device *,
 				   struct dma_buf_io_ctx *);
+	/*
+	 * Optional, for bio based drivers that cannot be frozen under
+	 * q->limits_lock: stop I/O around a sysfs limits update.  Called
+	 * before q->limits_lock is taken, with no queue frozen.
+	 */
+	int (*suspend)(struct gendisk *disk);
+	void (*resume)(struct gendisk *disk);
 	struct module *owner;
 	const struct pr_ops *pr_ops;
 
-- 
2.43.0


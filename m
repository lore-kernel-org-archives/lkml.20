Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866228;
	b=kw0MxdJLpPRwTjhAkXYMopXeooDTZn1mEP1vCQq4NIUR8U7Queo1VJni8J2o3G0ggGr8
	 3mwysc5UgJ5H9YmqCGMmakdCASj6eLSEoGU2BVEuYtoYd4QueOa6D/JsSvESkrPcsEYiv
	 AgXA05QYHmcFbczf9C2xpS1knuBbioMMC6OxdcFID3/Mv6cNN/L/5qI8wA2p8D+k4bZjO
	 idTfn/qORE6LyaNxZQDbplsaQgiIgyIsN+KvXUNp0cF/HhL7C0PckyY4yjGnCqG2LqbFV
	 /qjx5K/e3mlt+E5mALynYfpkttWP6Een/lrX6mucG6Qz0G2P1cUID/5CD5LGwSZjRwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uXh0iha/4VP9dzuigCmM9TrRRukz7g4ClrVx0LThZLY=;
	b=FJ4cVKkAzyP991+RdpVCRsDC7UnDN+w6KnlcMcRNzH/3AviyNeHLgxF6wbwJKKbcsdO8
	 fXWdoYiA8hL1XbDk9ykRjNHC6Hx1z5hsusmHBxGDh7ZZvBy//e0l9WQedaua3IgPLfgQ4
	 UosVI+NU7740zCBmUuZ4DKUThI2CXhj+NsQeLJSndT/NuO/BTIhaiyx8neOhtZTPRk0vM
	 aCircObDBUTirgd+f5vrreeBYalh8Jbr+U1kFfhWh0qSzgZ1U3XBoV3H/8X/bUmQhZ6aq
	 ykZ12j3ScSeA7hL7+A586L9SlIcjAEcMm9aBCUBXRsVM1Rtwt9wWeRzSyQrwyeyC2YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="N/Qx1IS5";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D51606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5D51606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N/Qx1IS5
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1260672f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793866226; x=1794471026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXh0iha/4VP9dzuigCmM9TrRRukz7g4ClrVx0LThZLY=;
        b=N/Qx1IS5dy7gvkOcK1TXZaqscveNhbL+KnTmQ99w4X1HCotJLcRwDWMzag0WTqQb0X
         GZKEZattQNx1zbUfXihhqRVerpQrKSNS+ITsYDTA4p7l7kRnzuFeXqMkzCHJ1OXa3Kc0
         eKvTRT79PMQYAr1JM643c8Pfr4z5bjrsM6M2kQdYVE2jUV5trR2EVYG0537Rwa5nKg3n
         9xRP7QBTPvKtNAjucPKwmCnleiCh3lULvU0ncKy0lKmxpjgEvybvxqjRqJCAZXafW4Jx
         oZKtfTyg/fIri8wIZ0CxinlaYybANYnYzm02JfHMaOPM0+yQS1hIEVisEjsyhnlTAPQJ
         r5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866226; x=1794471026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXh0iha/4VP9dzuigCmM9TrRRukz7g4ClrVx0LThZLY=;
        b=yHP5bws43tKG8FmQHtyhIH7q836JhLnK8yehEAINU635mstJg9N/LOAiC+cpPqGXX5
         JWwi8K5yZ2CMdW81UVojs0Q+mHKxEJuVG5p4FWLPOlNhFAYDQ+T9xzIYf+BJl8CNvsh+
         d4jgCiMWA/YhseOvuaAPiM5H3p4IIDno2L4aQDQ42OSKoptFrwoxqLW9Xem4i3h6r4jT
         Wg5TCiQ+5UraEIWvh6LB/wRS1bUsi84C9oRIy9JqYI7c3ANitJVGmPtzOSod7WMbXn4o
         L/whJzVtoPRN4IZwZm2xzOcfVFY0rPmP2lCHeTuIV6amztFtn5OWMbGAKSS+Xjnq96Rs
         F5Rw==
X-Forwarded-Encrypted: i=1; AKwUvBwiuJYKLjLluZohQmQeXfkKjVvqyTkBrqwO4OCcxc5JdMbwoO/kLpibzVZteEDOnyDKmG3kPNln4DDbyx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nQo0NnIXoDwaUJyV9tRgJ+e4BC28aFv3eP4Ov8uqS3pUZfXHa
	watdqQlynjB2hq3MH8ysbFJO1CSwxdx0MbHJ33pjoV/wlBNR+lt9Nt2d
X-Gm-Gg: AYBFou2nCfr6zARs8AJPsfeQIbDzInUAcc3d5p6MDL5aUUQZLOivKKrcv1qmBYl33KM
	83R3EPpIBk+NeUch1IP6zlrXrnyl5PcT/ZevEoOEaHgjI1ush5+z9XIPSUcxG1XoKOiCdhdkJ/e
	J4LIUNEW6uf9xopF0akZ9Bstsbuk1JjeT224GFxtjOJAx7q7F0fbFrHfSBdS+1DCMBLjsfVzSz9
	t53IwlTzXAcKOMy5xz6zpoH1ekZZi3j7JhWc+5AyYHbAfdV2f1MaATX6OPV0x8R56WBRQD69d7c
	Fp2RGh/G4SMZOG6+8wbFBHqh6tnvMUVcmUrvJf8cwKcbqEcE+vn7lr4EwCCK+k8iEmwjE2SGlVI
	TOohpjH3RUozqnL67bAlYF8+sPp8+sLo/enJ93NdxXY6JZNABBCcQTYanF3qhprwLXjILrMF2d0
	ksAiJAJzFnMTAoHoVmjJcOLRVEuzbRdYQn45Aqa+5ToW/V5sUAiN5XbpqlI+sLuLIDfkfIazYsg
	8mI19uL5sUpecphQPADEz59I9ActmLHNBKh6WCQmAWYlfAf7SnRL+f+wV3zh0t5tXTdiORbDScs
	v7dSlR/mfFId5Fd06b/vUtzNAFw+0HNIJqml4WbChkAsiQ==
X-Received: by 2002:a05:6000:2201:b0:48a:f36d:fb57 with SMTP id ffacd0b85a97d-48e6e303ca8mr40111334f8f.18.1793866225864;
        Thu, 05 Nov 2026 00:10:25 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:4763:5b00:bfea:518b:8c4e:2d27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9029351f8f.19.2026.11.05.00.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:10:25 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH v2] block: avoid repeated notifications for dead disks
Date: Thu,  5 Nov 2026 10:10:07 +0200
Message-ID: <20261105081007.816058-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031171325.4073830-2-thnkslprpt@gmail.com>
References: <20261031171325.4073830-2-thnkslprpt@gmail.com>
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

blk_mark_disk_dead() reports disk death even when GD_DEAD is already
set. For example, NVMe reset failure and subsequent namespace removal
can call it twice, repeating holder mark_dead callbacks.

Move the GD_DEAD test-and-set into the callers of
__blk_mark_disk_dead() so blk_mark_disk_dead() reports holder death
only on the first transition. Preserve the helper's queue-drain
return value for __del_gendisk().

Fixes: d8530de5a6e8 ("block: call into the file system for bdev_mark_dead")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
Updated in v2:
- move the atomic GD_DEAD check into both callers, as suggested by
  Christoph Hellwig
- keep the helper signature and queue-drain return semantics unchanged

 block/genhd.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 10ca8b4d6eea..7e4570f9cea7 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -659,12 +659,6 @@ static void blk_report_disk_dead(struct gendisk *disk, bool surprise)
 
 static bool __blk_mark_disk_dead(struct gendisk *disk)
 {
-	/*
-	 * Fail any new I/O.
-	 */
-	if (test_and_set_bit(GD_DEAD, &disk->state))
-		return false;
-
 	if (test_bit(GD_OWNS_QUEUE, &disk->state))
 		blk_queue_flag_set(QUEUE_FLAG_DYING, disk->queue);
 
@@ -689,17 +683,19 @@ static bool __blk_mark_disk_dead(struct gendisk *disk)
 void blk_mark_disk_dead(struct gendisk *disk)
 {
 	blk_queue_flag_set(QUEUE_FLAG_DYING, disk->queue);
-	__blk_mark_disk_dead(disk);
-	blk_report_disk_dead(disk, true);
+	if (!test_and_set_bit(GD_DEAD, &disk->state)) {
+		__blk_mark_disk_dead(disk);
+		blk_report_disk_dead(disk, true);
+	}
 }
 EXPORT_SYMBOL_GPL(blk_mark_disk_dead);
 
 static void __del_gendisk(struct gendisk *disk)
 {
 	struct request_queue *q = disk->queue;
+	bool start_drain = false;
 	struct block_device *part;
 	unsigned long idx;
-	bool start_drain;
 
 	might_sleep();
 
@@ -727,9 +723,11 @@ static void __del_gendisk(struct gendisk *disk)
 	 * Drop all partitions now that the disk is marked dead.
 	 */
 	mutex_lock(&disk->open_mutex);
-	start_drain = __blk_mark_disk_dead(disk);
-	if (start_drain)
-		blk_freeze_acquire_lock(q);
+	if (!test_and_set_bit(GD_DEAD, &disk->state)) {
+		start_drain = __blk_mark_disk_dead(disk);
+		if (start_drain)
+			blk_freeze_acquire_lock(q);
+	}
 	xa_for_each_start(&disk->part_tbl, idx, part, 1)
 		drop_partition(part);
 	mutex_unlock(&disk->open_mutex);

base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.43.0


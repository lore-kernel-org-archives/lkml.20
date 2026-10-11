Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9884922A7F6
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695963; cv=none; b=aTLKkDaREhBAmZxX3nldDH7j8owe/+QxH56MvNC73qBxQAXwRE//IRVj0/X5gWWiP/mBDCZagPJ+i4CyVu6aMCXUFTQxK7bZbh8PwJy161Sc6LrfO/3jlU1Zd9AmkTBa1r4xAxTNHNTKSLnN4dgVVfjBkvZUNCfbYIjSEDAjhHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695963; c=relaxed/simple;
	bh=yQ6gVx+3TRvMg1JXh7l5Z1oTc+eL5ZApypmtUHwCvz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bE8n9ExIVGHlmiJONmYfM9lDTrMp8BkIjV+TVM4rHNgzRTrZw4yOvc27BXh8/tR7DZF6En0KP3lKif8pX9Pm8potkwzA6SOqSTNK77zaPCws7+2I4uEIyu8fk/IfwHA3VFZG2MnFgoHQx+xXhCte7PY+PR1Zkw+83t6C4b9o/cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrA0sXSZ; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrA0sXSZ"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35115b52125so1241187eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791695962; x=1792300762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Z9JHfHb81pE0sUZcdvVbHvhF9QmiecEDL7VzMryt5w=;
        b=MrA0sXSZuyNsSyz0COzhjW6lCTCKEXSepypI4t/4YcW4i/WUYxHSSWreguqHnb07oh
         8lk5NH88quOglVK7tw1jpIPSKuvbHjgf8+heuDr+/wXc3kMQGR+0iniRgWgm/ILPJZgW
         h2iRp1w6tJNz6uO4XoYVRCRidt2X5EN7q8tyerGy+CYZ+w7w6L8cKD3EHIRo7odzWQFm
         +o0LH3xbE/du6WOdPppdq3ZXD1BTTDQelozdvylnm+QlNrXIrNgbRPoGWpfcPXqA0ajj
         uqGIdh2+xGT3CKYdyRhfnwStyVKQ4f5PAqN72gaLT799w1OujE8KdMUhkdUUMD37iRAq
         NSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791695962; x=1792300762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Z9JHfHb81pE0sUZcdvVbHvhF9QmiecEDL7VzMryt5w=;
        b=Apa4Bv7Qkl1H1BqewfN+l/FVowDTt+i0myHyY68mBycGHdWUuaL8PbMeIX4ob7sRg7
         mP0JkVfc0nSNOHRFYmBhM5J4eWeGPwmV5TJw6EDynKP6o8UFBa4ltGh3SAqzeTjAYsOy
         FiKQaxQg6J7Ku5ypI1ALDKupRDN/ZruXrkdBz7Yic7THm4pWw/9eyeSd9ZUcRQbxx2NQ
         hjijbYFgyaVqqAmivMsA8lTkSfDj1jnuJes22T59NTtIeNOg8h71IVT2PFQlBZgrZTnS
         eOjpqeepxOpCzKBlhih93ifBbZoey3gy7kDUpIi91mi75Uks5wbBQxJ577jvSloz6Aps
         hbYw==
X-Forwarded-Encrypted: i=1; AKwUvBy5vQl7f5MjXzM5Y3Gzx2hZ3dS6wAG+lS0oYSmf0tjQXD8NYcfFgXe09qaYftaP3hGvRP15KSvre8Am52o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxEvPjxA146s/oSmq+Vem7BRFGGBVrq1SfG+kv7vrvB5iNrDTI
	eiWjSBvXdOR2nfpge45QR4v2gzaZF2V7aNpQd43llCn54W1qdrzl4VQs
X-Gm-Gg: AYBFou2o8iYfjY8tVJtPOS0oJSJzuhZVGqlhxaIIl0aiBQEgMgKt2kN/usdxfOyGekv
	wvvRKHkJQ54Eo592SFTuyqAreolhHyIGMtvI0h5Me/Ca/cuboJI6XYlfvP4Z9GyX8oBH80cCrlN
	r8103+WmybOpQaVkSGjoQwwENi286nkcjyjD5IdRi0k6yTeTQ8mk1xsDmxd/voFI/c3GiGuQmnv
	3N8l8h2Vu9LXtlD6AEu5OlWjJdm+lr513kXw9MGX1AAx4PyUGy6gy5HMzILCfEU5gIoSk/YQEUQ
	FABqH/3ddlhQclwNqbUnasOSqVYlPRT4WxcPSsGbMRtxpfp5lrhjdYh+rF1TIun+dSvBVtYo+sA
	0t5W9upXXcxxD8jpeJhftSa8iToJOpxCPgJTkdrz0cXvW6RGI/gsPKQ1k2DZU7TbAomlDSf4k+b
	sCW3rbGvKjGbITJh4353+VibOxmGMxZGwojIawH5OEQ3B7l2iCS2/xEg41qm+ZqA/YZ4AzeSwVp
	i3oEEypa4gDFpv4/LbfFBRepCuhZuGeTjZP/QJf6CAIfYosLw1rt1UIO5a6zC8mCQpSsmz6+O9Z
	9r4BZj6qhxX0JxbnsRykYZJ0D2QRubwKmXhb4bkdFHAovvULgn/J5GpCAdF8fp7GN90a74Ueycb
	oXqSb4Qo3kuYnMcGwWMpZNakJSPGqeRe9du45UuFCR0kEc3OkSmyOul3zTc2dvfN57Q==
X-Received: by 2002:a05:693c:6218:b0:350:1d30:6c0f with SMTP id 5a478bee46e88-3537dfc7defmr9387129eec.9.1791695961379;
        Sat, 10 Oct 2026 22:19:21 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35978efac1asm4979129eec.19.2026.10.10.22.19.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 22:19:20 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Hannes Reinecke <hare@suse.de>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] block: fix the length of a smaller last zone in blkdev_get_zone_info()
Date: Sun, 11 Oct 2026 10:49:06 +0530
Message-ID: <20261011051906.60397-3-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261011051906.60397-1-jain.sm@gmail.com>
References: <20261011051906.60397-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

blkdev_get_zone_info() sets the length of every zone to the zone size
of the device. The last zone of a zoned block device may be smaller
than the others: blk_revalidate_zone_cb() accepts that and remembers
the capacity of that zone in disk->last_zone_capacity. For such a zone
the length reported from the cached information is too large, and
start + len is beyond the end of the device. A conventional last zone
is also given the capacity of a full zone.

Example with a zoned null_blk device of 10 MiB (20480 sectors) with
4 MiB zones, last zone:

  BLKREPORTZONE:       start 16384 len 4096 capacity 4096
  BLKREPORTZONEV2 with
  BLK_ZONE_REP_CACHED: start 16384 len 8192 capacity 4096

Limit the length to what is left of the device. disk_zone_is_last()
still recognises the last zone, as start + len is then equal to the
capacity of the device. The capacity of a conventional zone is equal
to its length, which blk_revalidate_conv_zone() checks, so use the
length there.

Tested with zoned null_blk devices in qemu (all zones sequential, and
two conventional zones followed by sequential ones, both with a smaller
last zone): the start, length and capacity of all zones in the cached
report are the same as in the report from the device with this change.
null_blk cannot create a device with a conventional last zone, so that
case is not tested.

Fixes: f2284eec5053 ("block: introduce blkdev_get_zone_info()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

 block/blk-zoned.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 9555eae91a..ca0950be3e 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -971,7 +971,7 @@ int blkdev_get_zone_info(struct block_device *bdev, sector_t sector,
 	rcu_read_unlock();
 
 	zone->start = sector;
-	zone->len = zone_sectors;
+	zone->len = min(zone_sectors, get_capacity(disk) - sector);
 
 	/*
 	 * If this is a conventional zone, we do not have a zone write plug and
@@ -979,7 +979,7 @@ int blkdev_get_zone_info(struct block_device *bdev, sector_t sector,
 	 */
 	if (zone->cond == BLK_ZONE_COND_NOT_WP) {
 		zone->type = BLK_ZONE_TYPE_CONVENTIONAL;
-		zone->capacity = zone_sectors;
+		zone->capacity = zone->len;
 		zone->wp = ULLONG_MAX;
 		return 0;
 	}
-- 
2.43.0


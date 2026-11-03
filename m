Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732364;
	b=owLjvC9O8brvD+CVKy2CgZYaH/9Sg6zlR4W/oq8GxIa7igmWcG8E4GBL5uk3mIazRvH9
	 EbkV/NM3fNsouQe3N2f2DtkTNwj6tPxV7KkCeHYx2laFXiZ6YILtVc1C/XzHN6HE7BHNt
	 XB8nzPSbk8sGVWkz/ADMOTh99eVJt4TniCaBdnvQIZ0486rmTXOVlnYIMSSeFJKRY7Pqp
	 JCGyBwn0hu6+oY8Q+IHniM4pvFwx/55XGQjk894OoO9EAVOZTk61DyE5z7JX83ahxglZ/
	 fU727xLzh8uoOQPu+TlVTASNvvR3VyrCnHNUQz7S0S4bfWVU/W9zPGw3BXH89uj58BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=31+P6AMFeIVlhmQscpLB4qy/vx9LUkvE2yKWF6dd1So=;
	b=Mg211bxUNeqT7+14f4x0BQU7NNUosQPgVelowxxpYj5u+2aQyIv3BOGrXs8CxIbrZCuG
	 sE9OSy5kt2s3HgVaXCowV+nEWYYrUlNz4buZleGSMjRYTTCEOXo+AjwWRp04ewyF0R1mz
	 JELpUW5XsFjTMQfbQs45yAFyaEjkMulSoAKuTAuDZZ21Dq2TROGWlIch5868gTwbQjNK2
	 TuAcLqNWXQeBU2kZ/phemcu1h2wNxgB9BjFnDom3L1dl2/yqetMWzTjsWeyrHi3/CEFlu
	 0U4+Uz7TiSWxo8bKdMtIZ5WmO0rZXc25dJ8h8jXdZph8uDogvTkhMLVFZU+WnvNYTdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQHtwz1p;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B980606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B980606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQHtwz1p
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36c9919c659so419766eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732362; x=1794337162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=31+P6AMFeIVlhmQscpLB4qy/vx9LUkvE2yKWF6dd1So=;
        b=wQHtwz1p7ctJP+IopmWMaKe+YCjn74fJHc4vqJ82D+qPHg2Jle3Vjj2p5l525YJIX8
         XAtHT1MpzXlCaPNmbMF+5hJvrl+edDN7I324Ac8/pIaeetciJ+Gjnl+/pDbMrcV/b30h
         hZClwTnK6HbY7a5DjWg/doIYJdcKHf508roQulOMj+fqNj43d89FeYnybFTZhr5kTkPc
         714Y2QDP/TWGF5gYwtMxcHSDzPb7ZSBsprFACcDEw/Dr1vkHWv6VNcxH5j9BnzkrGX+U
         B2NIlvaxq755/fC0sKk5DLcx1oXFcb8wue46nisaBYaPZcPr5Ic9ZKL7Xj+7DOy1HsOp
         3r5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732362; x=1794337162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31+P6AMFeIVlhmQscpLB4qy/vx9LUkvE2yKWF6dd1So=;
        b=0YJYvBud8Pu992AhyJgjgVzu50GAD64s6AtdsT/lg1RC40cO94gCy5T55Aqx0UO98L
         YYyqy3OBZvQS6UIFiH2xLNP36ldrvu0b/FPERzFE0JyS9bX/YLHIH0S7QNBqplU96Sy+
         xvFMRdmbswDLK1RvG2xtE8QJhVRtXEB8aGCToug72FpzmVlfWajMRASR35Pw9CXSCmGO
         ZeXC3WSvpItMF2oao94nctm8PNnd1qo38LiWSuxHVjP210KCEOdA4UEJyLorRO2U6/5q
         CdWyPkrBRLleWb7jRuEemsNxF29TTPYw6mavvkV92ipJDRGHOAm7tWJFJoWAvxDnyzYA
         L/9A==
X-Forwarded-Encrypted: i=1; AKwUvBz8w1Hny2lS/W5Q0/ljfBkPV+TDLqtX2qhs1PmqE1ydPAPnEEU7+2sXWS4kI6urAYgODVtwnyW+wf46La0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PFaVcOVwTvDfd8JfuXmSc3zaMADDIY6VxwCm7UyiTQhqg9anr
	FX+MTruwuu88HsDNJfDEzPz4qSJ+tLrCAbITCd1ulr3RA+pB3YWdJiUS
X-Gm-Gg: AYBFou0ZokgILAxp9uEICdYgKqFlAR55Tl8uhvpRjPJjUHJAx9JQZHx6D1hlKoAd7yi
	LG1e6dIsTphqVn+XhGqpo0Ag8LGOsZ9ZbzZg1B8RdDyUw6L143u+LihbZRIXuaa6bLfnoHTFEoe
	yy8tYCiwOV5xlg02c3+XeJhoZXgIhvmmHuZxxLLhSRud8KK3wevC4hvEuDsMlOubG0N0JR8bZiK
	mzoMAwtYL3aigpeBEfMlJkFSAxJx1WnW+o/XuUjwHufWuutuFLEqSjl2J8RyoEoELPiCxYMnNfW
	hjgVf1doWYMiLYJbT6mXoHk6BD3pQpK2rH3XqPBIrn4NA5PnN3edWLEcaoiaKfhvxyliqVUT1uD
	PIAU7LT2p5/DUjYvuBxq5xJUK2jOhD5cRJplkGkDDFWU3t7tg0GZiAzoOc/NObQonmLmoMiY7En
	jHBFSD3nvCr1hD0A1JaF0tutNPHqCWF/z2Ps5e9mitS+enE+a/TaApn0Tz1sQwSDJbwqQ5HOCOv
	nIv/3g/8W5UTNMVOEMPTwCv0H26UkPRfnyXPz0kfHWuGmSugG0tr5zmpDcOoC/5GQMlgLA8u04I
	8/m2oLo183ZTgNfvMASfWMx4oZ7P7sOHIoF7G8bWj9boxNtc2CBwSFDE
X-Received: by 2002:a05:7022:f50a:b0:149:50cb:2175 with SMTP id a92af1059eb24-1ac5cb1881bmr18974882c88.33.1793732362218;
        Tue, 03 Nov 2026 10:59:22 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c290sm747339c88.5.2026.11.03.10.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:59:21 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: axboe@kernel.dk
Cc: hch@infradead.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dm-devel@lists.linux.dev,
	mtsai@redhat.com,
	sashiko-bot@kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v3] block: fix discard alignment for non-power-of-two granularities
Date: Tue,  3 Nov 2026 18:59:09 +0000
Message-ID: <20261103185909.71843-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

bio_discard_limit() uses round_up() and round_down(), which require a
power-of-two alignment. However, discard_granularity need not be a power
of two. For example, dm-thin supports data block sizes that are arbitrary
multiples of 64 KiB and advertises the block size as its granularity.

With a 192 KiB granularity, discarding one complete block at offset
384 KiB is split into 128 KiB and 64 KiB bios. Neither covers a complete
thin block, so dm-thin ignores both and the mapping remains allocated.

Use div_u64_rem() to find the starting sector's remainder without
modifying the sector. Round the maximum bio size down with rounddown()
and subtract the remainder so that the next bio starts on a granularity
boundary. This handles non-power-of-two granularities and avoids a small
initial bio when a large discard starts at an unaligned sector.

When discard is unsupported or disabled, discard_granularity can be zero.
Return BIO_MAX_SECTORS in that case so the existing bio submission checks
can handle unsupported discard requests without dividing by zero.

Fixes: 9b15d109a6b2 ("block: improve discard bio alignment in __blkdev_issue_discard()")
Reported-by: Ming-Hung Tsai <mtsai@redhat.com>
Link: https://lore.kernel.org/r/CALjSBEvjbiGDVewuapWKhGDtaxZwcn4=22raUiBEOyj22rY7-g@mail.gmail.com
Suggested-by: Christoph Hellwig <hch@infradead.org>
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v3:
- Use div_u64_rem() instead of sector_div(), as suggested by Christoph
  Hellwig, so the input sector is not modified.
- Subtract the starting-sector remainder from the rounded maximum size
  instead of emitting a short initial bio, following Christoph's proposal.
- Include <linux/math64.h> explicitly and retain v2's zero-granularity guard.

Changes in v2:
- Handle zero discard_granularity before dividing, as pointed out by
  Sashiko. Leave unsupported discard handling to the bio submission path.

v2: https://lore.kernel.org/r/20261026195131.46699-1-dennylin0707@gmail.com

 block/blk-lib.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 688bc67cbf7..e98aa483707 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -3,6 +3,7 @@
  * Functions related to generic helpers functions
  */
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/bio.h>
 #include <linux/blkdev.h>
@@ -13,26 +14,25 @@
 static sector_t bio_discard_limit(struct block_device *bdev, sector_t sector)
 {
 	unsigned int discard_granularity = bdev_discard_granularity(bdev);
-	sector_t granularity_aligned_sector;
+	u32 unaligned_sectors;
+
+	if (!discard_granularity)
+		return BIO_MAX_SECTORS;
 
 	if (bdev_is_partition(bdev))
 		sector += bdev->bd_start_sect;
 
-	granularity_aligned_sector =
-		round_up(sector, discard_granularity >> SECTOR_SHIFT);
-
-	/*
-	 * Make sure subsequent bios start aligned to the discard granularity if
-	 * it needs to be split.
-	 */
-	if (granularity_aligned_sector != sector)
-		return granularity_aligned_sector - sector;
-
 	/*
-	 * Align the bio size to the discard granularity to make splitting the bio
-	 * at discard granularity boundaries easier in the driver if needed.
+	 * Align the bio size to the discard granularity to make splitting the
+	 * bio at discard granularity boundaries easier in the driver if needed.
+	 *
+	 * If the current sector is not aligned, shorten the range so that the
+	 * next one is aligned.
 	 */
-	return round_down(BIO_MAX_SIZE, discard_granularity) >> SECTOR_SHIFT;
+	div_u64_rem(sector, discard_granularity >> SECTOR_SHIFT,
+		    &unaligned_sectors);
+	return (rounddown(BIO_MAX_SIZE, discard_granularity) >> SECTOR_SHIFT) -
+		unaligned_sectors;
 }
 
 struct bio *blk_alloc_discard_bio(struct block_device *bdev,

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.50.1 (Apple Git-155)


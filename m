Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333832;
	b=O+ahIHnhGtXFsRqRVYGeWAQxWNLNaixd/lUdNzrhpYvq+PpkLWiRJ6XgRlaXL6xpDCbR
	 mS3jxB5QRyfByetfKuFXb4+ex4nAFmxifLxwyPmGYPs/ViyAT4qxgQ4HrOq7cYb17d/Ma
	 gzVJgpoBJEf6Ah4PRkl2dDYt3Rr1cwFuBnL96JVTZj4n98L+Ig/jxPkzimuvfxSvV7paM
	 Bd8AiECRDUkFJRpZJZdMhwLiT8VH+Q3er7qFxAdClcuBpc/vtXsYRw8sqQGZH8W+w6vTr
	 fXOLZkJFq1SwpPXAaJPqmom62LEOix/IEUughPiRPAII04OP96Fv/g4y9o3PAxFD6ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ziKDLwdi7Xg2BI9BGIHbHFAW0eYl874oVOo8/AYqvjQ=;
	b=2S2Luqufrl5ZlZY2hN0FHv65r5aKepdmcevWfMWLDS/WpJxpzhW5LW857WgH3+qxreAi
	 GMwJDSyOGtf63iuIsrEpjliefoRcM06N5lBsrFRFGbMf6swT7ZyZPFT6wNdCrqFfILDQj
	 stnTzIxTkHjmU59jqoCpWwnzOEnWmIa1FiLsQ2LMaDP14NM2tSTyY0mNLH11as33ZLoia
	 BLWHlVuBJUt6wMSF1ZTR+K8JYc1mO9A84ChZuINfw7xogj2160dXW65f04oBFypHWtt+v
	 hKo53F5QNk72O88LemCAWzO4Tk7AI+4043AQe/LOZFro6hfNY46EssU0cKjeGpPIy7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kt5NiV1X;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53271606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53271606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kt5NiV1X
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3550c917fd3so483481eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793333831; x=1793938631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ziKDLwdi7Xg2BI9BGIHbHFAW0eYl874oVOo8/AYqvjQ=;
        b=kt5NiV1XzdrUNLqVPkFe6Xv/M6Di0/5+haZkjC0a8jVKqlurAtkpAB8dfgkadzUqnB
         VjvUNTmWC9sRjf55AWwhiCa6eFVkynjF3arODyS2yiAo/pTr1Fw37+RUbc0SZeng0w5H
         7vlXSqbBrIF9P7GE2zjo+/ryFE/NblPI2cbBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333831; x=1793938631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ziKDLwdi7Xg2BI9BGIHbHFAW0eYl874oVOo8/AYqvjQ=;
        b=I7wpVyuaU0SapjSrf+6UpZ7TsHr3pxSG+74zLKaCsFRnh8Jb5zq7YzI1dZkztRgumM
         Mi6n9xGBbt+ffLaP19bJZTvwbBFglFy6kFc9mswTishBm/501BdFz5LoPLK9KhcGYWqB
         OnYeNIXHDFfdxLjtKq79Qzrzjd6LT/tqE7ulVBJWA0jl9dcSPeHZPyfK0qZdp2RklDbP
         F1loPhl/i5mAXMoqIPebiWStKJssseW9bY79DAqsERm1qvKHoxWu5owZmbiQHhkZeC33
         aXFG2DaXeMViLWAccWPCwOGCNM3QFR5OAQ6I9wHNzgmSdTmtmeV+djLxQ7p+U2XZJ5Zj
         nObg==
X-Forwarded-Encrypted: i=1; AKwUvBwjmWdB40FO/1nKxxpnJ4HlHZNmok7Awga4+ytZ1XyYgD5M1frRSunNCuSDnk724oUqTmdOPqqWe4TBeZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4EGVudlOiWQ8MR0omuqh4ZQmCM4lRXTSsqkvN9699eQIFQUdp
	fxcmMQNFq+i2/2V7TLA0JCLy4gKUnwQCpZCAp85NwmD+WJsd4h7z/++mnuLZK8wJLg==
X-Gm-Gg: AYBFou38dBa1OPUWSHvpLrh8+BmB6xKEeMYh3Nyj3LGb0VtrsC82dZCxZe2J+Qvqx5b
	pWI9lYIEZVeDu7o6DxVM0l5maN5F+VG/QSMWnqGJHpOg3g+aG8hQeYxI6weGZvZlWYMHOjbmfzW
	8Bt3GswSuNbNTcpVwdd/bFEObmCF0mwHJhr+uSq6lZyhXT/t3u5j0yp7xJKUFR9jjJPZAR7nBRA
	ct4GkzvDKuKzlaKdcTC4N8MU4TKElI9lriXAgay+SCYDA2oI/4xDQZxXHhoQRIOSVTQNRcSM/4a
	buqXfC1oXPDZlxLlmHVK4VJoFlCezGnv6IZIsfWHuIwWDlCZ6xUJbhwJEv77NJGAdt2RPPzYQvV
	9wsfizVs7LTcp+oa9FeDdRtKUXhSTf1yCJMvFJbYgnQ63WONU2+tUR0R8+zrCz0LIDlUQJrASw0
	ogB4qZYKkCY3ZzIbLy/ljnUv943xtE4wojuSE+VoutJl7Tuef4tu4i3UbU/kupvvYZQ/MiqUuGz
	1Jztm3Z6HNbNCGmVm6lYden6XNry4EccwU5KuXWC343+yjydzWG4Aq8WJm4VBFlTEvfCOZ4/6vc
	AtyynXKxHlW0j8nWPiTnsEs02O6sMbOyWG5Jnq9zOhkP7w4ScmA77QkgeP5lkedkzZ6FemBs1EN
	4Fl4dOIS68wcOMj+/ZQ==
X-Received: by 2002:a05:693c:880e:10b0:369:987f:d15e with SMTP id 5a478bee46e88-36a4221b055mr2051888eec.2.1793333830552;
        Thu, 29 Oct 2026 21:17:10 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:7476:5b7a:d979:2d91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm3329154eec.19.2026.10.29.21.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:17:10 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 1/2] zram: fix quadratic writeback bitmap search
Date: Fri, 30 Oct 2026 13:16:49 +0900
Message-ID: <20da9e9a5ffefd1e6875e311d3740b9f3c1061f3.1793333729.git.senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
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

zram_reserve_bdev_block() always scans writeback's bitmap from
offset 0, which results in quadratic complexity.  Introduce
per-device bitmap cursor member that is set to next to most
recently allocated bit, so next time the bitmap scan starts
from that offset.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 17 ++++++++++++++---
 drivers/block/zram/zram_drv.h |  1 +
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 9593c14a1f81..632045b65bdb 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -694,6 +694,7 @@ static void reset_bdev(struct zram *zram)
 	zram->disk->fops = &zram_devops;
 	kvfree(zram->bitmap);
 	zram->bitmap = NULL;
+	zram->bitmap_cursor = 0;
 	zram->nr_pages = 0;
 }
 
@@ -786,6 +787,7 @@ static ssize_t backing_dev_store(struct device *dev,
 	zram->bdev = I_BDEV(inode);
 	zram->backing_dev = backing_dev;
 	zram->bitmap = bitmap;
+	zram->bitmap_cursor = 0;
 	zram->nr_pages = nr_pages;
 
 	pr_info("setup backing device %s\n", file_name);
@@ -807,10 +809,19 @@ static unsigned long zram_reserve_bdev_block(struct zram *zram)
 {
 	unsigned long blk_idx;
 
-	blk_idx = find_next_zero_bit(zram->bitmap, zram->nr_pages, 0);
-	if (blk_idx == zram->nr_pages)
-		return INVALID_BDEV_BLOCK;
+	/* continue after the last allocated block */
+	blk_idx = find_next_zero_bit(zram->bitmap, zram->nr_pages,
+				     zram->bitmap_cursor);
+	/* wrap */
+	if (blk_idx == zram->nr_pages) {
+		blk_idx = find_next_zero_bit(zram->bitmap, zram->bitmap_cursor,
+					     0);
+		/* bitmap is full */
+		if (blk_idx == zram->bitmap_cursor)
+			return INVALID_BDEV_BLOCK;
+	}
 
+	zram->bitmap_cursor = blk_idx + 1;
 	set_bit(blk_idx, zram->bitmap);
 	atomic64_inc(&zram->stats.bd_count);
 	return blk_idx;
diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
index 7a55d751417e..c563a7c13a49 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -152,6 +152,7 @@ struct zram {
 	u64 bd_wb_limit;
 	struct block_device *bdev;
 	unsigned long *bitmap;
+	unsigned long bitmap_cursor;
 	unsigned long nr_pages;
 #endif
 #ifdef CONFIG_ZRAM_MEMORY_TRACKING
-- 
2.56.0.317.g454f8302e1-goog


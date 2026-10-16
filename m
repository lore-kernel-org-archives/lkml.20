Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5AC3AC0C9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125901; cv=none; b=uGT7lUVaCTgKExams5WBIkWFjHvtD/P/Vx+V2ersY+ZtiuQID+bF4li1XrvB9NUU8UEqM0GipWyxwDsqWWCAwlAvnabb2dYnn310szPLv0wrFFEiTw1wm+533cx/95rN/wrKpRywXBb0Tqr8FUyVhSc8KIuwm1AaAwtvE2bVrsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125901; c=relaxed/simple;
	bh=2L1l2WEmVkTr1X/Pc9b6FfcxdiaY29ag5fDryoDzPpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxKFU+nwHFMHCt0QQfbvzdgSfDf6LHwzqPnCvb4ROhNopmhBO3c5dYWevcUWJwRt29+73ZXafclxb1H3ZYdHmtrlQJv3Uvu8sY5Ht/BnuvKMYmyinVHhti2g+tISpBQ2gviSr5IFbhY8Ueu06KDZkRr6cBe+UleW0tc0RdIirvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BpF32s5g; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BpF32s5g"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e5d0ee1951so38889265ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792125899; x=1792730699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6B418+SzCM2Ac+ZkuhfOdHoqL+9AUQAlnO0fG1JXa14=;
        b=BpF32s5gqbqg/ZPBjsS6Oee6K0bRzfY9b+ZoM78Dhoqb3Zk9YrenVMm8a3DJRJOS4V
         vKRCJpLsiO9E+e5QqjYj8FKvRySedcKUlihMwXiYKe2juXC55m5pjxRdtXn92tT9XfFS
         +TLmTo6R03N/5Cc/lmG7bh1T8pAt1+Y2rocBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125899; x=1792730699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6B418+SzCM2Ac+ZkuhfOdHoqL+9AUQAlnO0fG1JXa14=;
        b=pX7tcJB5gQFF6OoMNLzoU5/yvqSlXUd/JioSmGw937GQR1O6Y3QKnjjRCoQznFnHcg
         Xanh5X+NYUAnt+TsgjT1cV6qJb2WXou5rNAZVwj4Xocj08ES6bu2S0gexM1KMPgOIBzg
         aCvrealKiwHqKkXXTVyS4W8kISPp8UueoPM7Tcd03iYDGHqBMJ292m4YR9uYlCiOe5d8
         8Hnv6f8KgLayCxL0e919z+pRzJ9V8zTH3mFpHUJJOQ0oT6eU79ayFJUkPagm3CD6pnrr
         kV4D8YYLihbwbOHS8dfrDlNJY5jovqhPGnvxXpqE2TRbgDSR4HFqCzTT5wJbviSH+oPS
         UY/w==
X-Forwarded-Encrypted: i=1; AKwUvBwyD/cMKJNdnDuBdAyUUS/I47TJkPgVpvHlOGZlhyg02q9WSU7KzDrIefDMXrA/KI2PfJUFw3ATRe49CWs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNvJRtKeZmeVlXrOUTHGI0wpdcI5vCbkPocJ0/ANbnIl+scFoB
	mY5HBHjOlb24G4tSC7sGw01yd/1Oi+zNQGP9JQoOipAz6AYbswbTEB+jGryv2Q4lGg==
X-Gm-Gg: AYBFou1EWjF+1NaHPRuiyIwwnbSx7L5QLhxu5wAZ94cXRxZGL+gyB6gom0QIqsSHbFn
	B5NyEaamOgsGbjLsT+Hbhr55HBxzaGziMSWsQ3qL9rVBFB1qawTHR0PBaNmT3tbOy7SRUu1BkYS
	wpHXNcYDdPlmVfW6Vlsk73NX039KicCGmcZsq1sL+fwT23Muhvcu+6uU7LZOfxe4AfJj1anb2or
	wXI9OS3eP15KOwbTbgiRBSTB5mIa4ju251ma6rPFAGMcy1mL9leddszW7epor8ArzZ7iAlGhyyA
	sjkj1kYYr63Uw9/K8gK003LaDAkl3kZgGjc+zGpGkYEiUN0SklRhp7eNYYd3fdClSFSotrRnBi7
	MjB5Niz9RIatM4ScufO8KSK58wGLaaXPsjqSWisYtaXnDoLs8YM/+yM5P2PeUCyoG4okJUndThA
	+jxr+vg3tmkLBrtuQKx2EYtXzsWnFdcjX3VM8ySMKHJDDYtR69CLfBwSc5HA3V6nnkNkQSw5WzQ
	COc8Ny3KxJG6Ye77PR8A0d9B/9b8jwTqmXf+rsDDwXy4cCU4l9pNZMktdBcms2wf7eFIGfkTw==
X-Received: by 2002:a17:903:2a8b:b0:2e9:4f7b:affd with SMTP id d9443c01a7336-2e94f7bb5bdmr57755475ad.6.1792125898232;
        Thu, 15 Oct 2026 21:44:58 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:a579:8b87:8304:7ac2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b1b5esm4137235ad.67.2026.10.15.21.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:44:57 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v4 08/12] zram: reset writeback state in zram_reset_device()
Date: Fri, 16 Oct 2026 13:44:13 +0900
Message-ID: <20261016044429.1304561-9-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261016044429.1304561-1-senozhatsky@chromium.org>
References: <20261016044429.1304561-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reset all writeback state to its initial defaults on device reset.
We used to keep writeback related data in zram->stats, which
zram_reset_device() clears, but commit 1d69a3f8ae77 ("zram: idle
writeback fixes and cleanup") moved it (along with the newly added
wb_limit_enable) to struct zram, after which neither of them was
reset anymore.  wb_batch_size and compressed_wb, which were added
later, are not reset either.

Acked-by: Brian Geffon <bgeffon@google.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 593fa4ae47c4..0e1aa0da11aa 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -694,6 +694,7 @@ static void reset_bdev(struct zram *zram)
 	zram->disk->fops = &zram_devops;
 	kvfree(zram->bitmap);
 	zram->bitmap = NULL;
+	zram->nr_pages = 0;
 }
 
 static ssize_t backing_dev_show(struct device *dev,
@@ -2881,6 +2882,12 @@ static void zram_reset_device(struct zram *zram)
 	zram_destroy_comps(zram);
 	memset(&zram->stats, 0, sizeof(zram->stats));
 	reset_bdev(zram);
+#ifdef CONFIG_ZRAM_WRITEBACK
+	zram->wb_limit_enable = false;
+	zram->bd_wb_limit = 0;
+	zram->wb_batch_size = 32;
+	zram->compressed_wb = false;
+#endif
 }
 
 static ssize_t disksize_store(struct device *dev, struct device_attribute *attr,
-- 
2.56.0.176.g3575e65682-goog


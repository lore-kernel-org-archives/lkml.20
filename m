Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E71480976
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791863552; cv=none; b=Ay6Drcpcp5PoM3huW3j1biiHpthmaGhMiC4OB8iTqa0W8CFik2eHTABerbRB7MFKnnUl0jbCSUxAuwJf2XmROvCZ9nS2+s9DtbPIYFj90Xw2ycnE01d/AYn3tk/8Tn0O3O2dKcxOvZtvapVGAFtiljEX0IQEN6ACaoZxJHTbkRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791863552; c=relaxed/simple;
	bh=p9QuUmpHexkf1l0MhRpHw9/HXrmj0+xvXegnqoruuWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIbmL4oveuAsPRDz3YZqvNcuwYXOSQ5hFlJAE5o3jNAiq5h563snsuHU04tb8htzfMxYdrGVqyTMjjkfFFc7hwkGHjXKvtDT3G/jQtOf/+UdynR8tYvSm9JuzTe5VciMVeVJVzlxRhbxTJa9JROLzRXIwt94p3f4+ds42P+ROp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W3BjvIk4; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W3BjvIk4"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-88bf90b7f07so675395b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791863550; x=1792468350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xtPVlUiId2ccKpm7W1Fnn6SIyzFCa51LSmz5bGyULA=;
        b=W3BjvIk4nB+s4LU+0lb25hpBdXb8oZP7NDTkcs3xyS1hFy33hnolvzYBSCPATkmtjI
         F/eaAz68PR31cmS6fhx8jE76RHsLexQQCDRM36oVf5AbuggjyCZXNmna+GdksqEvSOLO
         lv8bAZmR2TNVj2ETL2lYPhQMI/oBGNjTgmVDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791863550; x=1792468350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xtPVlUiId2ccKpm7W1Fnn6SIyzFCa51LSmz5bGyULA=;
        b=DdLii3Avd12xw6nuI/gk9B25+/c0PrHn3BqjrjUaOzfbnSb2HCBFrVVd1uomjYZmiR
         xe6/GeLXvMDmbLufb/nOArFwrTuVELT3DF8xE+NF2j33XLsWzFc3ArI4P9is6bHkch93
         rIKavnlWCbvi/2aPqr8AdeBZS9If9+aLuPDmq70uTHBdZr/EAwn/5GR/BEKnRbqDUMJO
         CMnzb8FsgjCwOR/fOJ9J5KAYItzVknmKkVj3T0KOICtiT5aI8Vx+cLkLDwDajpF6Gty3
         IoFNyBVL3wyj4u58hvxZFnT/5UvX2OkszugvJ5TMdpw+oBzjaSmSGuxS3S+Nqu83ltvN
         Estg==
X-Forwarded-Encrypted: i=1; AKwUvBxgptA0OpId10oXI/lMJfMYspSqsJxlf/d8nv8Pp9t8veJcMqAB+pt5Naqab5VhkTSdqSkF5UpJafYGOcc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaC+iPrVb66cWfLKK1sbAm7niDn0iQReGgdyN7VpAtfqUqiLjg
	x2AHUxXFzdqO48DEPjahN/aV6DcQ15Jkz8ORJ21MAij1JoKc7/MCJfvfSnrY/a1Bpg==
X-Gm-Gg: AYBFou3C5r8xGMlr/w/ETPm/IZvE9IlkBP1GFGFM+LcWx0A7Bj1aL0KcFmMzdtqQfCH
	K5GCwncwM0i9pQyFSu7LmLxes1Lz4LAVGrc0JwU9h5SVSOLnPyLfxSNzKGpUGsEIWK2KeWOzmqB
	OLJbxpMHNzTNa3ikmB6EjxXvqipUXPUqgzQ9sV47qYopsPGEC8N7n8K22QCkqU1Xo9ftyn3yjzV
	2QthPPD2pv4x5g+9/8dRGjtrpe7PSnMNtSli3B4lsxIYGhgr3K8BCIXqiYZoHoLtFvNdhNwXHBN
	HcgEFXA5BHjE+Z52hTzkKe0pcRbdnysmIxdOqQL5It9MoyT9aHpdsLd2N6LaEXFoDizJ1lYV/YB
	jskcp08aXh96xDb6JGoe5rsPOrCju3mpK+s5+jyRPEveu8xIjrBP0TBRYA36Z7rDK5/8YqcQ+c2
	f0EVfXAxF1k6n4s3UzdAXh3ZqGi3jWOHL1RoBGPGTsLAmiE0SBwwkPnl9mxaQb3LyAfyJGeyxku
	KWzko0LB2PP2ZioYtf+rHhWfoK1UAxCUXG6NCiPAaHags+3s6ybb28vRESMdQ==
X-Received: by 2002:a05:6a00:3d11:b0:88f:9fd9:3779 with SMTP id d2e1a72fcca58-897c65410bemr9764142b3a.19.1791863549938;
        Mon, 12 Oct 2026 20:52:29 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:476:d384:7c2e:1579])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c41bbb27sm4326818b3a.40.2026.10.12.20.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:52:29 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 08/11] zram: reset writeback state in zram_reset_device()
Date: Tue, 13 Oct 2026 12:50:55 +0900
Message-ID: <20261013035201.2809924-9-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261013035201.2809924-1-senozhatsky@chromium.org>
References: <20261013035201.2809924-1-senozhatsky@chromium.org>
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
2.56.0.385.gd3acb90ef8-goog


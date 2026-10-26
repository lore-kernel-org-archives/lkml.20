Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010466;
	b=RkYlrN0ukfX63T0vAV+Z26NNcmtO5/1wCHkmUVTbrEHQEGmjBiG7zDOQJIaVK82RtDiN
	 nNaCqD/M2namnAgUx1Zfi6B7mpn1/Ok5AVHCs/lnZyUl21DOuNcRD+gA3XUvdi00JqsjN
	 I3ObSoYZZECCbhGHCFnY6oBy7v9nl3Oa/nm/PLnGtNdtSztumFDbbHT2lAiMbDpEzRQ3P
	 ZKhwRdJK9RqTMj/toQ49vJXGmQ2x5lDY+4OWFDjVHBZBLn1ktkJASEstC40RGuIL8xruH
	 7PfodkSaPIBQhVcYa7ajUq/gYVOgvfiDcrIbcuxZuHY1XAifLlKz9Rhho4FMpe/l+kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OHmmP4G3FNF0AZ9sxLL3Yqo6u3L/FIebdoKe+DJDIgk=;
	b=KND0cg2l+mGAERLM+bGFMsBGA2xak54pubdHBaEMdhpMUUFfuQjCe6cxYAx/rBXFWLBJ
	 Nd5IZTmVdnwvlK1YSaLy5q/Hrc81mRrDp+d/pNPFSOUuJsBE3vIZyTxO+c0loCWfTc9Jg
	 302wh0UVBe8WoCpA+nqFUm/rcaFYVKFKXYiuNAmdUotrO5lnHTTf+QK5I0q1Q57wnXR6i
	 bu30miTOoK4INjr57QFeKu7RX2p3a6FHzb9O4bmFoyUfC2g3xWuVUrfRTaeQ0tJa5Hhxi
	 +BSB/F7VdEwsAjeJpIzWrGl5mfARAqfM83D5w9xJ7edC8hoF9h1hEs1J8wKTjRodrYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CPoaZiKY;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB4B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB4B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CPoaZiKY
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so7650115e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010464; x=1793615264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OHmmP4G3FNF0AZ9sxLL3Yqo6u3L/FIebdoKe+DJDIgk=;
        b=CPoaZiKYn3bHvecAj/oJPD1i26XEBskdDBmwl+RXqDEehAc5Oh67DTg+NO6Dh2YAem
         TcgKKuJ8nDaGXi/WBjRqU5VtDkzTSt/H5Li5kP7xQwLerG2drqXZAk7qNxMslb8UY/Wz
         CCNTyGPadQ5iY65TwEI18D2qnerMC3Z9Dywvit+AJKkD+VN1/JqZpZbAi1WfIiikcFbF
         23h0KupYtDDNjFjh+jusssNkOpc7eZzFUg01mdtQXdEhGxjVqAZ8LQzH05hX7R7Xsa1e
         ngjri4EsLpUflgpdSmA7P7IzBqA/xlLPvWz99mJjdLd89bgv+UYNSxUowMf+/jgfifXl
         4KmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010464; x=1793615264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHmmP4G3FNF0AZ9sxLL3Yqo6u3L/FIebdoKe+DJDIgk=;
        b=KSQkEb+9nB1IZndmp7ZJoqJKl3gz05MYoTPWY5DAnvSg5mwJlkgw+sHvcw4E6GaPAi
         gaU8uI9U17f99aRKEaAAzkaTvq//hYy0u3YyWfuV7LSLhCUglsedBNTCsje5h1w1DAh0
         6pBdQ1zG7NxtoR1QQxVhWEWiBoBu3mIj7DgzARYQcIElu+95Z0V27kFacTej6eSxC8FI
         sAdJZFNK2TVDM8IsyQ+h5EZB4SONtNiBkST48dwmq3iNTLZcueMIfYEIang8tikRPpt8
         2HGz3E1xkpVYJo5IMcs+W9mrDEYu8Gk4+FJOK1yWEaiSADP8FSH2o64Fgv0RY27/em02
         sa2w==
X-Forwarded-Encrypted: i=1; AKwUvBzzhIi6eJHIh7uBkpWhCXdtImNercgKGdITv7eEDEMZuz7K/wPnnakrHcETohVBV8CM8HwLZjJX06CBv6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0APgUyNkTdbrcyjZQFJcPKTH5STJ9+nW721sBFyUpwKwSn7CP
	/iYAwEOZx8PsbtiJ3V8jTeUL0H5bWpCYXn4UtTDcFYr3q2F9yANjbcal
X-Gm-Gg: AYBFou1ziUxIr2OvzVIidY+ZNYrrKE2eF5cugv+/2HY4OX3YGB1WZWAn5+Dff7FdA+b
	d1S8yplZ3sle4Gx+UJ7qaCSHVcnxumtJ2zDnQq+lxj/D88zTOdI9BavrgglDiAJuHx7XTYxfO1e
	PXT6AlM00K2lKl6KR/YM2eMF+pzhazaQvZX/hfLYu1+FG7K5RrE3Xbzc/RihDOQlSaTeXZPWhVz
	R28zx/46W2k3P3BQJxlNJHsq176stC78e8mCRY6dJAV0TJRWZiKQJaiYAdh/hq2XXjSXcJBblr6
	Wz5uH1VIRF4grrltFEJ1KT2CJQGqW5gEe/0gEGbr6LGwgonUq3iTVAaWwZrqV9K6NQEk3TMhX/U
	XbmSFsgwCgaJ56Ol1emiGFT00mSEZkaRS8TDCbLgx/WuDzk6o+onORfo0XEvdbLDFL5PUvQcqVr
	U6oQ0hYiFJ2gQz61252v8v1Or1NncSO210U1qXILyGFBY9csmbG7wlUrVwZFlvk+JsoxPAdCkhV
	lqvS1GvIsjfhpJh+f2XofNaJ57a2P0ON/6mV+KTgZLojXjN/jwjeV/KuGpjipkkyBuUEK+Ie1kY
	8NhYEoph6GX2+bW7rk5YldlC4gkkGSNtlhqGwQ==
X-Received: by 2002:a05:600c:1992:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4a35acaaac3mr125431505e9.27.1793010463866;
        Mon, 26 Oct 2026 03:27:43 -0700 (PDT)
Received: from localhost ([217.150.74.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm493684375e9.1.2026.10.26.03.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:27:43 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: dm-devel@lists.linux.dev
Cc: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	linux-kernel@vger.kernel.org,
	syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com
Subject: [PATCH] dm thin: reject metadata and data device aliases
Date: Mon, 26 Oct 2026 20:27:40 +1000
Message-ID: <20261026102740.241243-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: angel <angel@localhost.localdomain>

The thin-pool target rejects identical argument strings, but two names for
the same block device bypass the check. In read-only metadata mode, opening
metadata first and data with write mode invokes dm_get_device()
upgrade_mode().
That swaps and frees the old dm_dev while pool_ctr retains metadata_dev,
causing a slab-use-after-free when __pool_find() reads metadata_dev->bdev.

Open the data device before metadata so an alias cannot trigger a mode
upgrade between the two references. Compare the opened block devices
and reject aliases before using either device. Adjust the error paths to
release the devices in the matching order.

Reported-by: syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=83827f9a59abe148bff4
Fixes: 70de2cbda8a5 ("dm thin: add sanity checks to thin-pool and external snapshot creation")
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/md/dm-thin.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 358ed77ff..0899cbaf9 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -3326,17 +3326,24 @@ static int pool_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 
 	metadata_mode = BLK_OPEN_READ |
 		((pf.mode == PM_READ_ONLY) ? 0 : BLK_OPEN_WRITE);
+	r = dm_get_device(ti, argv[1], BLK_OPEN_READ | BLK_OPEN_WRITE, &data_dev);
+	if (r) {
+		ti->error = "Error getting data device";
+		goto out_unlock;
+	}
+
 	r = dm_get_device(ti, argv[0], metadata_mode, &metadata_dev);
 	if (r) {
 		ti->error = "Error opening metadata block device";
-		goto out_unlock;
+		goto out_data;
 	}
 	warn_if_metadata_device_too_big(metadata_dev->bdev);
 
-	r = dm_get_device(ti, argv[1], BLK_OPEN_READ | BLK_OPEN_WRITE, &data_dev);
-	if (r) {
-		ti->error = "Error getting data device";
-		goto out_metadata;
+	/* make sure metadata and data are different devices */
+	if (metadata_dev->bdev == data_dev->bdev) {
+		ti->error = "Error setting metadata or data device";
+		r = -EINVAL;
+		goto out;
 	}
 
 	if (kstrtoul(argv[2], 10, &block_size) || !block_size ||
@@ -3426,9 +3433,9 @@ static int pool_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 out_free_pt:
 	kfree(pt);
 out:
-	dm_put_device(ti, data_dev);
-out_metadata:
 	dm_put_device(ti, metadata_dev);
+out_data:
+	dm_put_device(ti, data_dev);
 out_unlock:
 	mutex_unlock(&dm_thin_pool_table.mutex);
 

base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
-- 
2.56.0


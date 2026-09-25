Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7856249B1EF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340495; cv=none; b=gzPWtpxjL3whAtJR06+SidDqwYqxHbr0TTV5UTDpGkDgxH3BF7qYGmLI8NyPHizWyhfbRRElXmX0U/HJYYh8NdYLn2ymQVawE8PRAyKnMzzCeeJtwqV60R2BF+QhjfUDGje1WYSm+oGQJiURUXeNWBFqPEYWzUsZwe5mzKiW3Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340495; c=relaxed/simple;
	bh=EHvUe6CnljgOCpzgBYnkxYPPOhmmBYggD9B7nFNv0Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ranFU/KwBoenxkGmQQ8wuek8JJ/mAJmRt5WSjgHi6H/+xTPQnOvHwHHVRQiwkryy1MBCDKBlcKCxgalwRcyUkApo2q5KHuHG8OxciIU6WUgIorHEhVQWazczF94XZfTvfuL7WDILvcAVygAsjd6U8OT1vvolx9vwE35TrV2ldyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhaSwgf9; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhaSwgf9"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so5166145e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790340492; x=1790945292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffo4dEA6Q9fxFokWBQKy0RohhC70c67r7S94vQ6TDSE=;
        b=WhaSwgf9jtjcC0xAgQrFXno0YumQ71mUxkZqkiqqhG5aJ85d3Ppp5KE9Gr3CZrdZa0
         /9UVh5T3ujh7EqAozNl1yfZQUEuFB6Zc0aUC1Iwo9kqaonw0m4IdOOjRW4TtfgX4dR3o
         B0ceb+GbqBDIvW09aBEy8tv/PeH7QJnB8SR6P9eOd+JPCkX+cHAWtnyFoIeV1hnIovlo
         EpAooRsg+vrhs2lPckjInmmKvgz2ghNG9npXg37abfK2WWp0QKpUykTEaE/xBC59NtxI
         KfGUaB2brtr/oC/rZsMDX0F788EPlzNUkNQ+bUyTZIIwcl94gD4+qOoPB7NB9vKedVwm
         q9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340492; x=1790945292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ffo4dEA6Q9fxFokWBQKy0RohhC70c67r7S94vQ6TDSE=;
        b=PqJjOiQVdfsV9XY7JV8uZZFt3qt5YBhG5w8lJEypZqHuX4x5+IY/phpCQyI7dGrm/+
         pYR+pCfFf2y/GA3PNnvzUDZTqlCqaSdreZ45Qze5+YLQFGA4XAbn7Z6zmQjcgNo1QYnu
         nUz5SSvC7PJyi8yobtFOph1UP+fAya+Gx/w8b/TlLKlhwW92R9IPKCyqnnEsZTOE0dMo
         m/+bjY6HFcOjJgipL16QHz3WGHUr6zeFb1voGaOrw/7fLeCAv59YPQGmDYHYDooyW0Ff
         tjOGUqcfYgWXdz926UeGBUpx9TiNd4g4TtotQdTnJUzuCPC7+4j93DWGtzYKNqhq5nAM
         QdYg==
X-Forwarded-Encrypted: i=1; AKwUvBxJ0G3qGj3gMooQiueAsqyLvYnQPY1MEafxuZb257iCWsGfdzThcn8CMCKYrGoznOsYoH6OzYDnMaZryto=@vger.kernel.org
X-Gm-Message-State: AFuF++ldtwWMrBYMWjxCahyGzi0oMKgX0P9zbvg+eprM3BmSWTH+VMRH
	ethxXCVXn6xD9qugEnqaqw6VYzfmNjJt4QSzV8VwmcEXJAqZnjD+e0ya
X-Gm-Gg: AYBFou2IunRAV1aVLXLAv4/KfILRxWZf8pko3f0Ap1TXoAFV8KzgtHlOarbGn1G560/
	i3eQMgxRbnx/sOCOJtOv1+6d+K3/GA6NYdmuTovablgCbIPwIXS/jhdxLFJ4wcqoXhKj4W1uC+2
	kGK012tN/zoUAO68VeK9npbsvbvlkZx4zsjKA7rRB5mLDH2aO2KFVdfGczTwUNeUAfoe3aTOkpP
	dn4JKvbTQwqI3KrQ+q0GDBDMX6kwzDKKpV0lXGd4KQhm/n2KE9v/1nP0ipWJ6VkRMetcipJSq68
	LuVC9q+rC3Eyl3kEz7+XdTYYIqIVb0Or2x4qzg/HmmP5GlKC24N7nZU+Y//vnA2wHapfZwjraDL
	qQrzMmk71xtowguhouY7UM6UYnynmvbMR34Utq5BVPQGgR1TWko0p3dY8yzyuT6YHgcMq+Pd6Ol
	JvsLAR1MwBubijg62qR07rn16v4EkxblSICdKTaizDHgb+mywJpmgTgBCWA0uRSF79J1Sedg==
X-Received: by 2002:a05:600c:3b96:b0:49f:ce78:3569 with SMTP id 5b1f17b1804b1-49fe66fa7f5mr115684375e9.26.1790340491574;
        Fri, 25 Sep 2026 05:48:11 -0700 (PDT)
Received: from fedora ([2a02:587:200f:d100:bf67:f785:caad:e278])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a36189bsm6670499f8f.21.2026.09.25.05.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:48:11 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Koby Elbaz <koby.elbaz@intel.com>,
	Konstantin Sinyuk <konstantin.sinyuk@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH 2/2] accel/habanalabs: Replace create_singlethread_workqueue with alloc_ordered_workqueue
Date: Fri, 25 Sep 2026 15:48:04 +0300
Message-ID: <20260925124804.58808-3-mail@taterr.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925124804.58808-1-mail@taterr.org>
References: <20260925124804.58808-1-mail@taterr.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

create_singlethread_workqueue() is deprecated. Replace it with

alloc_ordered_workqueue() for the command, event, and reset

workqueues.

Use the %s format string specifier to satisfy the API

requirements for variable workqueue names. WQ_MEM_RECLAIM is

added to ensure hardware events are processed under memory

pressure.

Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/accel/habanalabs/common/device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 09b27bac3a31..cfccaf7a584f 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -902,7 +902,7 @@ static int device_early_init(struct hl_device *hdev)
 
 	for (i = 0 ; i < hdev->asic_prop.completion_queues_count ; i++) {
 		snprintf(workq_name, 32, "hl%u-free-jobs-%u", hdev->cdev_idx, (u32) i);
-		hdev->cq_wq[i] = create_singlethread_workqueue(workq_name);
+		hdev->cq_wq[i] = alloc_ordered_workqueue("%s", WQ_MEM_RECLAIM, workq_name);
 		if (hdev->cq_wq[i] == NULL) {
 			dev_err(hdev->dev, "Failed to allocate CQ workqueue\n");
 			rc = -ENOMEM;
@@ -911,7 +911,7 @@ static int device_early_init(struct hl_device *hdev)
 	}
 
 	snprintf(workq_name, 32, "hl%u-events", hdev->cdev_idx);
-	hdev->eq_wq = create_singlethread_workqueue(workq_name);
+	hdev->eq_wq = alloc_ordered_workqueue("%s", WQ_MEM_RECLAIM, workq_name);
 	if (hdev->eq_wq == NULL) {
 		dev_err(hdev->dev, "Failed to allocate EQ workqueue\n");
 		rc = -ENOMEM;
@@ -957,7 +957,7 @@ static int device_early_init(struct hl_device *hdev)
 	hl_mem_mgr_init(hdev->dev, &hdev->kernel_mem_mgr);
 
 	snprintf(workq_name, 32, "hl%u_device_reset", hdev->cdev_idx);
-	hdev->reset_wq = create_singlethread_workqueue(workq_name);
+	hdev->reset_wq = alloc_ordered_workqueue("%s", WQ_MEM_RECLAIM, workq_name);
 	if (!hdev->reset_wq) {
 		rc = -ENOMEM;
 		dev_err(hdev->dev, "Failed to create device reset WQ\n");
-- 
2.55.0


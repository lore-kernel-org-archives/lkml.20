Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484223;
	b=qWJPlv+7khNhBatcHt8i9UcdUGpKeue3qm5Sd2ykT9L0IQAn+7uZG2MfrclhD4mJ+0WS
	 L4IZXna4SDz6JFOootows9GqD9j+TOnugG4PuQRMOQOfQPJorRr2ft740zg4jQjLDseMv
	 0WaUlnBcy4chnZUD0KpZZQu33NSyRSpbhVDkqJVUByZG3lSK55x76or139KhUcsimUdDf
	 +BQ6FS9UIQ44VPy4zTTk2J/eg+u/mrAHoSNSmLdj6CR0XWlewihYWU+LE8nA/hbgSfwjE
	 vvht+UpGy5s+wCgPhuQozIIuSJITilo3ttvdtf2G2NO9Rl3IiiIP19zFryFli50kuyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RLp801KKfsVZdQYaLNag2TdSqnCBgSM2Gu0Olt6/xr4=;
	b=0pdsmhYptZhueQDFKkL4SeHZeyQAS1o3jzL0js450qaE0TCV1ODCZt5cHKkYjFFrqiR4
	 LkSXJ9bS3RPFaZ9aEV9AuDBLCDe8JpG/RegV9M++43ICfwxtNgZH8wAkw3h1JDGFsOg79
	 67IPL66AM6MQmfy4mXVR/dST0N1Xk25bQ/N/ERPP69DcZHFwvILq9HfGONfrM/fG4WKcu
	 eO+F/Fp7bRU+YP5wN3tCg0/eZT/QwIMEsFFyLSS4lxgJ1bz3yU+SQonktPIfSJ6IGul6n
	 0zOGKnpNBBZDKwPo81E6+vlTqXjUFh8/wcvtiUz2nuwy8QYKH5aeJRMjQOdW1TFPWYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NQdHOowS;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACA4606A883
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BACA4606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NQdHOowS
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so4835815e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794484221; x=1795089021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RLp801KKfsVZdQYaLNag2TdSqnCBgSM2Gu0Olt6/xr4=;
        b=NQdHOowSUtwMiLAq1OZHrxWGu8Gk2SiZZWfidzx0/bi1IORyg8THEANFrlUktiIT7+
         SXGi42w44hN4Rq1U0JfxnMvVX/nhS9YjUmFAsAP4cI9AEn5yjlesmvYLWHPm357I72BO
         hlrEDw6/LOOkC6x0pqWQyeuBI5uC03T1SYkIu54p5xZADvxIZJ8zw3CuH65u5EEEm2dz
         0obWumfn9xsErrswweH7qAxz2dvpDMP3ZoGTHAtXVR+csoOt+3sj7Ke2eQpBPYu7oEy2
         9sB6QYT+Vnw9lkwAGHW2+Bnxbk0i0KzP2G+LoYGo00/UDpDzoWuqZU77Jyx5SlPMWH1f
         Erow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484221; x=1795089021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLp801KKfsVZdQYaLNag2TdSqnCBgSM2Gu0Olt6/xr4=;
        b=Fn6x4qurJN2z3JDhGYk0F7g8IVeh+twCVc7qGssMDiJgQDU/P8ABQ0hqMbGSInsSkd
         HFrG3U0q3juEMvBgF+EOCk4WuS/h16pY876nDoPuZIiI92k5vcbaZ5zjjIpfhtFqfVFs
         TKX+3HTKvR98Q+Vy3MXKwiya6Y9YD98UfPN0JebJxHwdM246usGGgMOmrp3on2puGCmv
         nzhud/YC+/B7RsZ9woKVHHw0RfwDY7zpgD4ETgY/nVeptDTbFJzKRy65SNjuw2Q1OhBu
         2o3aQU/Yuurn/H30k2aXWDAZHBu6C764I0tirYVo0AQzZpjSbUqlSZWURZKjN486HNjo
         xLFg==
X-Forwarded-Encrypted: i=1; AL+hErHQUsxMV9KJwcwcYZ6kZjglFaN68r5zrLLD0CUSaPNcsQo6ZbDchGIBdMayU4uvPIleoFavLanI7vHCgQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wufJ0LUm9cKdGhi/D3YQL+tki+2AHALrAWVWGtkVIwVl7zy9s
	npiXa/8RO5XO5qhCRHSd/qg3zbFudo8n5TXGvmV19fzNr1ZJqBbrGUTQ
X-Gm-Gg: AYBFou22y6e51c5ERNbh+zi5QxqijiVDcNGSucynG5hCZxslomsKDFBcHf1KNe6Qcco
	bHrSCtHn6/5JeGNYa5HO7zVtI4UUhOCVsIj9lKFY/gBQ8/w7FgUVw7x0/nw26sQ9QZ1qfV0Zq0i
	YSerYGPYovtqp1W5aoELcSNB1no4HvEDwQwfspHpOzHf5CDVCHt3zSV23b8NsMA050w5hjXfvOm
	oFrq0cC0XGYCcKrMSsgjEo2GamcdcQ48GKcL1nPg07PTbQr6GPHx31p7wMqNOOMh13B4JHMF/yO
	gPds84PH9C4f5fvxLfDY48HnoSdqEu8N+J7cjrHP9WoiDTRKSIq+MgQqmoijOPYvwbnSEDop7Ip
	GCl5/OftYW5vAh9WHTjoszaNYGCfe3ZUrDOfC8+RJOXMP76+n2GT45gRe/p09RhuPEC+KMm5EFM
	cZHRKZ2HTmr1OvD1IXLBdK1WAe0odC8TpPE/qb4pndwLe8TYaDdK9PdfRZG9T3ckq7tEsoZZT+R
	Utcjcx32jsnjjeKE1pVb8JKRDleZkQuxpTvbbBVUr3e7gtXUpninJBXVpH8AAIgGOBRrHQiaPoA
	l8PPGf9xAKg+162q77/YXd+1
X-Received: by 2002:a05:600c:63c1:b0:4ba:1fd:cd84 with SMTP id 5b1f17b1804b1-4bb4e2e9c30mr37576545e9.12.1794484221022;
        Thu, 12 Nov 2026 03:50:21 -0800 (PST)
Received: from env.. ([195.72.110.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4989a2a505asm14476287f8f.13.2026.11.12.03.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:50:20 -0800 (PST)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io,
	magiclinan@didiglobal.com,
	xiao@kernel.org
Cc: linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH] md: make mddev_get() fail until md_alloc() has finished
Date: Thu, 12 Nov 2026 11:49:58 +0000
Message-ID: <20261112114958.2244-1-abd.masalkhi@gmail.com>
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

md_alloc() makes the disk visible with add_disk() before it adds
mddev->kobj. In between, md_open() can take a reference with
mddev_get() and send ioctls to an mddev whose kobject is not set up
yet, for example ADD_NEW_DISK, which adds the rdev kobject under
mddev->kobj.

If kobject_add() then fails, md_alloc() drops its own reference and
expects mddev_put() to delete the mddev. A reference taken in the
window keeps it alive instead, and if a command such as SET_ARRAY_INFO
sets ->ctime, the final __mddev_put() keeps the mddev for good.

Add mddev->sysfs_live, set under all_mddevs_lock after kobject_add()
succeeds and the sysfs handles are cached. Make mddev_get() fail
while it is not set. mddev_get() already runs under all_mddevs_lock,
so whoever gets a reference sees a fully set up mddev.

Also, send the KOBJ_ADD uevent only after mddev->sysfs_live is set,
so that user space reacting to it finds a usable mddev.

An open that races with md_alloc() now fails with -ENODEV, and a
sysfs read in md/ before the flag is set fails with -EBUSY.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20261029202209.1422567-1-abd.masalkhi@gmail.com?part=4
Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
 drivers/md/md.c | 10 ++++++++--
 drivers/md/md.h |  4 ++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 154ee5a65cb7..20acd1e25e9e 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -627,7 +627,7 @@ static inline struct mddev *mddev_get(struct mddev *mddev)
 {
 	lockdep_assert_held(&all_mddevs_lock);
 
-	if (test_bit(MD_DELETED, &mddev->flags))
+	if (test_bit(MD_DELETED, &mddev->flags) || !mddev->sysfs_live)
 		return NULL;
 	atomic_inc(&mddev->active);
 	return mddev;
@@ -6403,10 +6403,16 @@ struct mddev *md_alloc(dev_t dev, char *name)
 		return ERR_PTR(error);
 	}
 
-	kobject_uevent(&mddev->kobj, KOBJ_ADD);
 	mddev->sysfs_state = sysfs_get_dirent_safe(mddev->kobj.sd, "array_state");
 	mddev->sysfs_level = sysfs_get_dirent_safe(mddev->kobj.sd, "level");
+
+	spin_lock(&all_mddevs_lock);
+	mddev->sysfs_live = true;
+	spin_unlock(&all_mddevs_lock);
+
+	kobject_uevent(&mddev->kobj, KOBJ_ADD);
 	mutex_unlock(&disks_mutex);
+
 	return mddev;
 
 out_put_disk:
diff --git a/drivers/md/md.h b/drivers/md/md.h
index 6440da292105..5e026307ca64 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -417,6 +417,10 @@ struct mddev {
 	struct mutex			suspend_mutex;
 	struct percpu_ref		active_io;
 	int				ro;
+	bool				sysfs_live; /* set under all_mddevs_lock
+						     * after kobject_add()
+						     * succeeds, never cleared
+						     */
 	int				sysfs_active; /* set when sysfs deletes
 						       * are happening, so run/
 						       * takeover/stop are not safe
-- 
2.43.0


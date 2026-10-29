Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305349;
	b=iIOff8Hf5KPwlHCIS+7WiQrEmrni8wlIjYeKi0lXFgxrE9aY66JrYBsemr/bqy/znRIl
	 p9upm4nBMTm7DOjY5fS+gQ8fArNP0Vav3BGMfEREOEcgZBKh8WtHVX6lXzOFSXCXHdXqr
	 yNVZ0zLIas/vtJZ7ySBPSOImIKzuZWh5IgeYnrVObPknh4fHRaKFMWim6EbNgBG+ctHvB
	 md5UkhdFgYnxoDtK2ygzdUa83zVsuKBDBIc+XfYJMAcHJAJYWNB46+xUbw7IqGIuEp9JV
	 wMMJpXV63P60myn1JJOrmSZ2CMKukFxA9B+aFqEQvOW7ChfTjFB+CNq9SLIkqWnDEOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1VIlXvJnDq3cC8Ujwt2OtIlcPxyApHxjHQ4NkJe9UNE=;
	b=GXIYPVDirLFjmyPNLJWmT4AEVzComcmwW+EhRe1JKvWG34ZAEWKNgfjEFnkumpQCHHQ4
	 5hdJuOmhSCi7BerOVn+X+iRrV1OfKlN4hizOMZ/7bhXJJ+LMFQhiJPnsuF8LBsEiNn/v6
	 Lz2wQKks/kUhpsLqmbXVc3+FgGwAMAUXazLMp99YGP9vJQT/W4KQSSXbC+OMCCT5w5k0M
	 vafw36VhYOB1ARs0ZK83GW5N5mGPFc2Ju5WnL7QEDBvOk7FwvujZgs7vT9pjbj6LL4ue8
	 6ObHDzB7Tnt7kh82ZS300qzKZZChl10aPNL8SsDYaR7dOSeHHZaGmz7sbxUOggWagJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcjJNViC;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CA3606A325
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0CA3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcjJNViC
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so25844315e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793305347; x=1793910147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VIlXvJnDq3cC8Ujwt2OtIlcPxyApHxjHQ4NkJe9UNE=;
        b=PcjJNViCcl9XZIu1vVCKUOSntPYWz6Ik0rtLxUQyihu+OR4bcD/rOQACt2yc63HHCN
         jEAg1iESRGro8sCFGmBI58F0m1zNdUS2fY/MIgdK9vaF/qjSM/ojRLqA6CF4In0n0mXw
         cMM0JSoHXSdxzAAXaC2PaWFU97+tT5+ihGl3K5RAQcVrDzdu0Z4E8ylOhulyHBq7Ulg8
         RDidof5xXmUyguU0C8WtQ1WUY5Bd9qRAd59fgE7HB+S9MyQoTsfKpHR/Iorrax8a+LBv
         PPlWZZQLecEjWztqnA6Nnzrc0dwsfHl2fFXHQmFI4QRTkyZz7w1J1QetExwZUOn4ZLNQ
         BN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305347; x=1793910147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VIlXvJnDq3cC8Ujwt2OtIlcPxyApHxjHQ4NkJe9UNE=;
        b=YICdwsZoKYYL8wuv98miXXDI3uQLNQgTZyqlFyrO9FzInwuc5kx09nmVpzjhtDtwFt
         aDtTeK6Z0o1l5b2kLj8VIK2pnbs0pk2OVqeS8idwt223s57/4GSbEaROuJbz17NBO2AZ
         DNphvfraXPHpXmLZ7orAC0kBZAWhV9d9Bqy/CUCpqJWQOrA/JGdkHwDJ1eMyU+Luns+p
         bZHhExdoVq4U0oNdCTRtkW2hKpagfLnnaebRlopD8akPHtzbNQMYQGWxfvGkgydrpO2T
         zNrZPk2Wksm/94U0jZu5Mm2OOXOf4rmM3f+IIr2/7b+fLLZHlBn7EgtrRUjd9E4YPs3W
         jppQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXlPpBLsXDcoR3PHRSjnc6faqVfEEl49jdXeW/0vW0mJAZLOkMFaJocuhWaLPFrGrcVnCwb4oHjm1AF8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt/KVn/K1Jdj/o8rSv/joj1fLWT6X/13128IwKGJ13FD+f4LcE
	xTloxayEuT9j3FktcALTCe8zCkyE8HVGt9oF0lQa1cE6qVrHdR8yWUIY
X-Gm-Gg: AYBFou0xGMxhp+pu5QUmJ/PdFU6zC0sHNpM/oYEhanNxJRB2uyabCSOENmCobzVdgNV
	wdUNi/ENeQl291xgHelzoh4GvutE1YJxB4kesdFEcTxHOsmwcohlp7aG2sa9W2S7TxZXnwQPoYI
	IlGzlAUKgTLxgGgy4Hx92VPg/5mthpSydg+n3Z0KRi7CyJt7vLMUFdgdUtPRd2Ez/1rVPlY97+I
	TNYSyOcKDz3v0SJt77juNmaCMgqN1NWAWrA/oUNUh9mBTK26XTi8/YoQTmDn/r2nrFyoTtOdyea
	iyfXVubAKIc5nv1HfTRvUXLvvaczavpC5LpI+kj6BoRVNQPUfMpLY9nZtZOWIGseLYs4uQbYZ5E
	UWLnBQB9lebM9ZwcYaPZByAT7tk0AscLTY5vRr0CtYkAUfaXu8/CKww5GjsEoNawQ9w+zWx/QaJ
	6UzRrmXxxYXT7b89+ln0AKVv2n7lXJ42ogn2Y0yGmU4G1ghwpclc7EdtRlmUkoizwg0fQ7a/gmY
	CYILzhTjIPciHAEMOSbz3kl5oXuhkcb2/dVAjM2KSUwS7t4ODES8wxQ9zkLTyFivxEU0xIHmPBd
	6Mcgh8FrngCY4NRynBjinkZeL+J3WVtDx7w/K+Yev3YPSbIGL4Rj1uqws3CatCOtY0ZSVSAGERd
	60bDtoTq6CWYkZyaNjPkJp7E=
X-Received: by 2002:a05:600c:8b55:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4ac17ffb30fmr1981195e9.5.1793305347156;
        Thu, 29 Oct 2026 13:22:27 -0700 (PDT)
Received: from env.. (dynamic-176-003-098-140.176.3.pool.telefonica.de. [176.3.98.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf7146621sm9424335e9.13.2026.10.29.13.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:22:26 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io,
	mtkaczyk@kernel.org,
	magiclinan@didiglobal.com,
	xiao@kernel.org
Cc: linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Subject: [RFC PATCH v5 3/4] md: use struct mdu_array_info64 for SET_ARRAY_INFO
Date: Thu, 29 Oct 2026 20:22:07 +0000
Message-ID: <20261029202209.1422567-4-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029202209.1422567-1-abd.masalkhi@gmail.com>
References: <20261029202209.1422567-1-abd.masalkhi@gmail.com>
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

The md control device passes array information as struct
mdu_array_info64. Make md_set_array_info() and update_array_info()
take the new struct mdu_array_info64, so that the md control device
and the old SET_ARRAY_INFO ioctl can share them.

md_set_array_info() no longer checks for a negative major_version:
the field is unsigned now, and the existing check against the size
of super_types still rejects such values.

md_setup_drive() uses a struct mdu_array_info64 directly.

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
 drivers/md/md-autodetect.c |  2 +-
 drivers/md/md.c            | 37 +++++++++++++++++++++++++++++++------
 drivers/md/md.h            |  4 ++--
 3 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/md/md-autodetect.c b/drivers/md/md-autodetect.c
index 9ba061f1a628..227cd4a688a5 100644
--- a/drivers/md/md-autodetect.c
+++ b/drivers/md/md-autodetect.c
@@ -124,7 +124,7 @@ static void __init md_setup_drive(struct md_setup_args *args)
 {
 	char *devname = args->device_names;
 	dev_t devices[MD_SB_DISKS + 1], mdev;
-	struct mdu_array_info_s ainfo = { };
+	struct mdu_array_info64 ainfo = { };
 	struct mddev *mddev;
 	int err = 0, i;
 	char name[16];
diff --git a/drivers/md/md.c b/drivers/md/md.c
index ae893c6296ba..3b4497b615cf 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -7904,12 +7904,11 @@ static int set_bitmap_file(struct mddev *mddev, int fd)
  *  The minor and patch _version numbers are also kept incase the
  *  super_block handler wishes to interpret them.
  */
-int md_set_array_info(struct mddev *mddev, struct mdu_array_info_s *info)
+int md_set_array_info(struct mddev *mddev, struct mdu_array_info64 *info)
 {
 	if (info->raid_disks == 0) {
 		/* just setting version number for superblock loading */
-		if (info->major_version < 0 ||
-		    info->major_version >= ARRAY_SIZE(super_types) ||
+		if (info->major_version >= ARRAY_SIZE(super_types) ||
 		    super_types[info->major_version].name == NULL) {
 			/* maybe try to auto-load a module? */
 			pr_warn("md: superblock version %d not known\n",
@@ -8101,7 +8100,7 @@ static void put_cluster_ops(struct mddev *mddev)
  * Any differences that cannot be handled will cause an error.
  * Normally, only one change can be managed at a time.
  */
-static int update_array_info(struct mddev *mddev, mdu_array_info_t *info)
+static int update_array_info(struct mddev *mddev, struct mdu_array_info64 *info)
 {
 	int rv = 0;
 	int cnt = 0;
@@ -8314,9 +8313,33 @@ static void disk_info_to64(struct mdu_disk_info64 *info64, mdu_disk_info_t *info
 	info64->state = info->state;
 }
 
+static void array_info_to64(struct mdu_array_info64 *info64,
+			    mdu_array_info_t *info)
+{
+	info64->major_version = info->major_version;
+	info64->minor_version = info->minor_version;
+	info64->patch_version = info->patch_version;
+	info64->level = info->level;
+	info64->ctime = info->ctime;
+	info64->size = info->size;
+	info64->nr_disks = info->nr_disks;
+	info64->raid_disks = info->raid_disks;
+	info64->md_minor = info->md_minor;
+	info64->not_persistent = info->not_persistent;
+	info64->utime = info->utime;
+	info64->state = info->state;
+	info64->active_disks = info->active_disks;
+	info64->working_disks = info->working_disks;
+	info64->failed_disks = info->failed_disks;
+	info64->spare_disks = info->spare_disks;
+	info64->layout = info->layout;
+	info64->chunk_size = info->chunk_size;
+}
+
 static int __md_set_array_info(struct mddev *mddev, void __user *argp)
 {
 	mdu_array_info_t info;
+	struct mdu_array_info64 info64 = {0};
 	int err;
 
 	if (!argp)
@@ -8324,8 +8347,10 @@ static int __md_set_array_info(struct mddev *mddev, void __user *argp)
 	else if (copy_from_user(&info, argp, sizeof(info)))
 		return -EFAULT;
 
+	array_info_to64(&info64, &info);
+
 	if (mddev->pers) {
-		err = update_array_info(mddev, &info);
+		err = update_array_info(mddev, &info64);
 		if (err)
 			pr_warn("md: couldn't update array info. %d\n", err);
 		return err;
@@ -8341,7 +8366,7 @@ static int __md_set_array_info(struct mddev *mddev, void __user *argp)
 		return -EBUSY;
 	}
 
-	err = md_set_array_info(mddev, &info);
+	err = md_set_array_info(mddev, &info64);
 	if (err)
 		pr_warn("md: couldn't set array info. %d\n", err);
 
diff --git a/drivers/md/md.h b/drivers/md/md.h
index a84c8b97fa2c..27de34a8bdf9 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -1042,12 +1042,12 @@ static inline void mddev_unlock_and_resume(struct mddev *mddev)
 	mddev_resume(mddev);
 }
 
-struct mdu_array_info_s;
+struct mdu_array_info64;
 struct mdu_disk_info64;
 
 extern int mdp_major;
 void md_autostart_arrays(int part);
-int md_set_array_info(struct mddev *mddev, struct mdu_array_info_s *info);
+int md_set_array_info(struct mddev *mddev, struct mdu_array_info64 *info);
 int md_add_new_disk(struct mddev *mddev, struct mdu_disk_info64 *info);
 int do_md_run(struct mddev *mddev);
 #define MDDEV_STACK_INTEGRITY	(1u << 0)
-- 
2.43.0


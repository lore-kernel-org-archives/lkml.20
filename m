Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDD73148BF
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895745; cv=none; b=Cn8+C/zWxlZCVSoeNs35gU1eh0ivln5n6DBGpz764DckVGUn9p+zJzCNgYSID2ovdFWSA7Pwr1zQVYfZa7BhkrvcU19GpeewgCoOy6OGlMA7Lv74MiiTF/GYe8jZ6gAMt8htFBYiguS0FVA/x5Lqjpx9gbPZJXaF1YYuNkweM2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895745; c=relaxed/simple;
	bh=o5ynmhsA1DQCi4+waIOfUB5VhWs7SgaifEiUhVbaOAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RX73U8f5kj0ix7wHLXWIU0dqxlNk0/RtbRegUqs92yiVH/4kDTp6MUS5S4DgYphts1V2fuf9I7lAbFJEuEnRn5Rjq9vGUSK0P8RFWmFI09pTv1Fxj4ZBARhlF5/PQorWtuTYPJOQRKRepNLEORBGK5t2GUHAxGmzbAg1Q24Ei6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nef5+YVu; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nef5+YVu"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398c066106cso1632621a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789895744; x=1790500544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MDlX42BAsKVk7nwm/KS5svsEQJzQqta4toefAuww8A=;
        b=nef5+YVumb+UVxblk6PLlskZFHMRvFl1e9Uktu8h4AEw0waJvqie5qCjwDrA0HPqJZ
         o97n/1/Tt+9g2OVeTYahMy6K6MyQmwPAVGEHKO3akRlpmhwP9hHwyjyaCJPOTkBqazK+
         h0HNoflTybdrwv4WqrnWVm0fD41uHMmQgK6NoBb+VfNlJusyPyy6M6I0tI+t27QVEdI1
         LN7azJ4IhIO+5QWZ5/MFLWwjw85v/a3nJ6hdVm6jSeFpXW1o6GHDSyq9kzxQnympcutJ
         E0AdYRQcUC43iG2/yG36ehQ9zHV0L7oxDWfYdwyWtOrEhX3Hp+0eC+fEeuhBMT2750DD
         4iYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895744; x=1790500544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MDlX42BAsKVk7nwm/KS5svsEQJzQqta4toefAuww8A=;
        b=SnxjRm5xSIV4mki/eX0CDd9Jau/j8B4xvhx+gRIGQIIilImoEGIsyplGyoMT7mi2cI
         9UDpKrm3Qqiaf8SDy08ofL1t3ciJodsKbyHlRMSwuki1J0joBbPmnQSsEp8n15eUISbD
         qt88wBmMKYvF1tOaLC/aKT2KChPvolP5IyH8S6hA6CilB7F/u8ufix2YkZ2mrZvTLHeg
         8BC78GjPmcze3RtfXAjNUtDVw0S3A9iFz4kpbUi4fmevjbQyK5J2TnvwMbnPZYEyEhdu
         x8S8HOZd8hwrDx9V7zAd1EH0/eZWbds1mmNFyL8htVzB+/es63ZuEPf3rAiAmX6H22P5
         R/Ww==
X-Forwarded-Encrypted: i=1; AKwUvBya5njwiYZUFXSU5xr6dfFCL23hAaHKiEwLskKEwcyG+gdFMH5jiNb6diI4Xp/n2PqO54SnzfTKdb1UUuA=@vger.kernel.org
X-Gm-Message-State: AFuF++kdqaH/4kS0ERWxFKp7upT+T3F/ex/aIut2yVhjZnGYTxZ4TVz7
	2NY/3AV+ewKh7qS6f77LZKci5ed3JQZ2NPI3HfmX5yeDyN4G4cS3IZYs
X-Gm-Gg: AYBFou1VRVTTgoSRMn+rYEv/LBT0PfA977tKuHa3HGYj5EC8mn9XLhJc/KZyJ9gbqVc
	c7jXhyscInlcJtEa/WkfBwhwamrCjJm2IpVoNC4tadEE2yXLAlrl35m2kTGNqOVfy/nHmIfl7LU
	+w9AN1U9mejJMhlIl+ncffbDKrMJMfTWLJixwIQ8EN/4Du0MdTwxTuJzOku2FHiF3il1PtKR6Ez
	hTgj3kWDFW4cAqZwXd4G9UE39Y1I9QftOZHAa8+JLsB+CiBPls5Ah31fRVsZz30aqCOq93gnwxe
	CYxgj64N4bL6vLnoNznQm27WGb8JHeEoqE5dKNiLBtnUxD02iWB2YhBeGzYfX0x//bRgUjnRYkI
	5HyDd7JB2BtCRgDkrk+Jk1QrmB6znLUBcRxVFuzn+638EhGpTnCshnGw1fGzBL0Vvgs3F7ZhO3M
	cQNCxGqYVPrJ4+vho5/InImcdFvmAGOr2d+dxCvzII+Na8KiyNaM4bFKsJCJxLIuenp+Frta1pn
	2zzBMVHoBbq4rMWxOTykkA=
X-Received: by 2002:a17:90b:1dc7:b0:39e:6c68:1553 with SMTP id 98e67ed59e1d1-39e6c68331amr7957189a91.27.1789895743725;
        Sun, 20 Sep 2026 02:15:43 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.130.136])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c379c4bsm8740003a91.7.2026.09.20.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:15:43 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	Artur Paszkiewicz <artur.paszkiewicz@intel.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+2ef75c54d0b2ac5d00ba@syzkaller.appspotmail.com
Subject: [PATCH] md/raid5: give the io_unit slab caches per-array names
Date: Sun, 20 Sep 2026 14:45:33 +0530
Message-ID: <20260920091533.413-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both raid5 log backends create their io_unit slab cache per array but
name it after the struct:

	ppl_conf->io_kc = KMEM_CACHE(ppl_io_unit, 0);
	log->io_kc      = KMEM_CACHE(r5l_io_unit, 0);

KMEM_CACHE() passes the stringified type as the cache name, so every
array that enables PPL or attaches a journal asks for a cache called
"ppl_io_unit" or "r5l_io_unit".  With two such arrays live at the same
time the second one trips kmem_cache_sanity_check():

  kmem_cache of name 'ppl_io_unit' already exists
  WARNING: mm/slab_common.c:112 at __kmem_cache_create_args+0xae/0x460
   ppl_init_log+0x285/0x1310 drivers/md/raid5-ppl.c:1363
   log_init drivers/md/raid5-log.h:138 [inline]
   raid5_change_consistency_policy+0x255/0x740 drivers/md/raid5.c:9141
   consistency_policy_store+0x7f/0x230 drivers/md/md.c:5883
   md_attr_store+0x3b7/0x640 drivers/md/md.c:6158

which is reachable by any user that can write "ppl" to
md/consistency_policy on two arrays, and equally by assembling two
journalled arrays.  The cache is created and destroyed correctly on
every path, so this is a name collision only - duplicate names confuse
slabtop and /proc/slabinfo, which is what the check is there to catch.

Build the name from the array instead, the way grow_stripes() already
does for the stripe_head cache in this driver, and fall back to the
mddev pointer for dm-raid where mdname() is the constant "mdX".  The
buffer is sized like conf->cache_name[] because mdname() can return up
to DISK_NAME_LEN bytes.

The explicit size/align arguments keep what KMEM_CACHE() expanded to,
so object layout does not change.

Fixes: 3418d036c81d ("raid5-ppl: Partial Parity Log write logging implementation")
Fixes: f6bed0ef0a80 ("raid5: add basic stripe log")
Reported-by: syzbot+2ef75c54d0b2ac5d00ba@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2ef75c54d0b2ac5d00ba
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 drivers/md/raid5-cache.c | 12 +++++++++++-
 drivers/md/raid5-ppl.c   | 12 +++++++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/md/raid5-cache.c b/drivers/md/raid5-cache.c
index 7b7546bfa21f..47458a474adf 100644
--- a/drivers/md/raid5-cache.c
+++ b/drivers/md/raid5-cache.c
@@ -3066,6 +3066,7 @@ int r5l_init_log(struct r5conf *conf, struct md_rdev *rdev)
 {
 	struct r5l_log *log;
 	struct md_thread *thread;
+	char cache_name[48];
 	int ret;
 
 	pr_debug("md/raid:%s: using device %pg as journal\n",
@@ -3105,7 +3106,16 @@ int r5l_init_log(struct r5conf *conf, struct md_rdev *rdev)
 	INIT_LIST_HEAD(&log->flushing_ios);
 	INIT_LIST_HEAD(&log->finished_ios);
 
-	log->io_kc = KMEM_CACHE(r5l_io_unit, 0);
+	if (mddev_is_dm(conf->mddev))
+		snprintf(cache_name, sizeof(cache_name), "r5l_io_unit-%p",
+			 conf->mddev);
+	else
+		snprintf(cache_name, sizeof(cache_name), "r5l_io_unit-%s",
+			 mdname(conf->mddev));
+
+	log->io_kc = kmem_cache_create(cache_name, sizeof(struct r5l_io_unit),
+				       __alignof__(struct r5l_io_unit),
+				       0, NULL);
 	if (!log->io_kc)
 		goto io_kc;
 
diff --git a/drivers/md/raid5-ppl.c b/drivers/md/raid5-ppl.c
index 7f8a9d3fd578..0530632f9d2a 100644
--- a/drivers/md/raid5-ppl.c
+++ b/drivers/md/raid5-ppl.c
@@ -1318,6 +1318,7 @@ int ppl_init_log(struct r5conf *conf)
 {
 	struct ppl_conf *ppl_conf;
 	struct mddev *mddev = conf->mddev;
+	char cache_name[48];
 	int ret = 0;
 	int max_disks;
 	int i;
@@ -1360,7 +1361,16 @@ int ppl_init_log(struct r5conf *conf)
 
 	ppl_conf->mddev = mddev;
 
-	ppl_conf->io_kc = KMEM_CACHE(ppl_io_unit, 0);
+	if (mddev_is_dm(mddev))
+		snprintf(cache_name, sizeof(cache_name), "ppl_io_unit-%p", mddev);
+	else
+		snprintf(cache_name, sizeof(cache_name), "ppl_io_unit-%s",
+			 mdname(mddev));
+
+	ppl_conf->io_kc = kmem_cache_create(cache_name,
+					    sizeof(struct ppl_io_unit),
+					    __alignof__(struct ppl_io_unit),
+					    0, NULL);
 	if (!ppl_conf->io_kc) {
 		ret = -ENOMEM;
 		goto err;
-- 
2.55.0.windows.5


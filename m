Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BE13655CD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859388; cv=none; b=bbCWgGv42o9rY3dGspaa5IXn09Iq7vV/L/Jrtoe5zOCYxPDK9RFUBTWvN5aWp1/RgyFUr9YegcWouQ0j/VL7OjaYmGjsUn5oOlmaUYFO630smqh5OZ03ZpqPR8qfjAAc482w9zmjcIjD22Z9oYgP8cKUSkeAJjOvAKLVW9dW/9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859388; c=relaxed/simple;
	bh=WykIBLd1uoDcKaOVAWtucoJFSXLYzoF6IaQWYpcp7DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AK+JJuGiYkRNjbWruT2Nqs0fzV6Y4JaskfFPnr2M4pwHtiqj6U1NJmiWAp3xXud+8rxmnqnwRlAHD7SHd086JQmhiapSKp+hdhv2VVjYO69hvPPQgy8q13GvqOqOWqtJgQq6fip3WQvv+s7kgt4B9YzvIMVW+EsfB1NheWKnBAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlzInQ8O; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlzInQ8O"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so3867492f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790859384; x=1791464184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5pmn5Sgmp7NX1gR5GLCnP5AX0iw6ctA6iDoCPY0hq8=;
        b=DlzInQ8Oquip2rJ+pCfxZyWYaj13vIj1uwd/ibAuueAJUu2EMGxjMW6NiUjVyohadC
         b5a/tevJmhxDtbUUhOMEWeDKzq1l9qnf/VnBKkyCUdbl0wjBPL0lb5jEeV6ruLTcwxfy
         5PSx3MNnghk3myrF2Ns7Tn3eSwAkHLGlLlizQfl/MLajqypTnHSTBMO8MFYlry3Q1p7z
         ptqpnyxUFo/njqy2qxayBOpdeKtFuWYcZ67EkEP/IgaqZbot2xdLKjyyMs5aqgTvKJI/
         iN5bBO/rhHHAh/hmBDu2lx+v5ysg3U9++8phHqflKpbAQMDu2QGWDMbrcTWRZmagBbtB
         msjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859384; x=1791464184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5pmn5Sgmp7NX1gR5GLCnP5AX0iw6ctA6iDoCPY0hq8=;
        b=RevMrRMoPaCrCh2XWRPCKw/XMkHla5kQk6k6IrdMT0IPS3yGaXMud7hjldPLfRu/Og
         hvGL+mIlQrUOdtl5+krN/88+mp2WIta8vQrUJW3lYJUgVVFPigRaqIc2rfzK5vVsjX5G
         LaHv0ftCM6O95ahJuEN0h1qvyrelI2W5auDI/+Uee8VSkx2xegBTBiKCoJijgrnicJPO
         P7l8KhZwwCG9BamHdgyD06gUYOERWxR9vBh6/GaWZRfYv87JsiFIfVG9Uu8IC6utnfDT
         kOfeNRs+jQD4MrYehS9C8bKp/JwAh08AotLqvxiqW0nuV5LQ9BL+/g09ZJv66nkyZ4V5
         ps5A==
X-Forwarded-Encrypted: i=1; AKwUvBzO7Zt/c2zz25/D5SwdWkgFo5sTDbs/6RXJ6Xl9eAJCHKw+jJsmvwk4YVHlbX4HTtqs6BE0u9o8VgTw5LY=@vger.kernel.org
X-Gm-Message-State: AFuF++n/Dm0V97tI4qCe6F13S/rK8/SuKYKFj/2ViIbiakkmNHPvROl8
	TzzQa7PA3so2URjve31YcRCU54k1twNNjoHmMGOc95hG0rR65ZSvhMG2
X-Gm-Gg: AYBFou3huuM6Wv0Y0mnaZcvT5Bko2/oWrfrt2Xdx51cwj91rDGgjtFvZW9ZIsBwBnDS
	h4M4VAE/08YvkVmJgHG/pEnGNm2i7lhBgx3/fsq2tdWX4DtBY21LnAiqYxnOp+NsEYC3xgQprPR
	B384JHkob1fvRq0q89N3Qxk/FbEel98Y2uL2IPkXQE/1re2PdpFfFXPi5TlHHYse1zMp7S7Jk5Z
	d9zuzBQqAevhXpp/u8fo6vRQ0hJhDUBIV1g2fFJP/p/hpJiphbK8iKPm+SJQJoHH+HNGJcYrNpj
	BQd0u0kICGMQWJBiRZkF+mdwOHQYwbk5IJ4qIJ3SNm+yPMNg3xHnfYNDLsk+T50WpDmYtT9RcVR
	dW7z2H+fe8gMT4NhvtxpCneVLl6VFfJRv7h9EL3D+9pEeG5e2YmmoikL7VL5YP3OaWMcm+6+pjn
	wXZ4pPkKxB3nMseaeqeL8TwRcSr4f9b7n67/637vFiHImE70oz1WuB/NQX6QI/OagxOHNfD4LJd
	Sgmyp+g7N5eGOHAlzb6aWFjgDz+M7bhKmbfF6nXeCHY8bk=
X-Received: by 2002:a05:600c:3145:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-4a01b0072cfmr77011125e9.34.1790859383454;
        Thu, 01 Oct 2026 05:56:23 -0700 (PDT)
Received: from env.. (dynamic-176-003-078-112.176.3.pool.telefonica.de. [176.3.78.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9a7650sm68298735e9.15.2026.10.01.05.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:56:22 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io,
	chengzhihao1@huawei.com,
	magiclinan@didiglobal.com,
	xiao@kernel.org
Cc: linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Subject: [RFC PATCH v2 2/4] md: pass struct mdu_disk_info64 to md_add_new_disk()
Date: Thu,  1 Oct 2026 12:56:09 +0000
Message-ID: <20261001125611.943731-3-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001125611.943731-1-abd.masalkhi@gmail.com>
References: <20261001125611.943731-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The md control device passes disk information as struct mdu_disk_info64.
Make md_add_new_disk() take this structure, so that the control device
and the old ADD_NEW_DISK ioctl can share it.

The ADD_NEW_DISK ioctl converts its mdu_disk_info_t with the new helper
convert_to_disk_info64(), and md_setup_drive() uses a struct
mdu_disk_info64 directly.

No functional change.

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
 drivers/md/md-autodetect.c |  2 +-
 drivers/md/md.c            | 26 +++++++++++++++++++++-----
 drivers/md/md.h            |  4 ++--
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/md/md-autodetect.c b/drivers/md/md-autodetect.c
index 4b80165afd23..9ba061f1a628 100644
--- a/drivers/md/md-autodetect.c
+++ b/drivers/md/md-autodetect.c
@@ -201,7 +201,7 @@ static void __init md_setup_drive(struct md_setup_args *args)
 	err = md_set_array_info(mddev, &ainfo);
 
 	for (i = 0; i <= MD_SB_DISKS && devices[i]; i++) {
-		struct mdu_disk_info_s dinfo = {
+		struct mdu_disk_info64 dinfo = {
 			.major	= MAJOR(devices[i]),
 			.minor	= MINOR(devices[i]),
 		};
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 154ee5a65cb7..be1634ae1d09 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -7486,7 +7486,7 @@ static int get_disk_info(struct mddev *mddev, void __user * arg)
 	return 0;
 }
 
-int md_add_new_disk(struct mddev *mddev, struct mdu_disk_info_s *info)
+int md_add_new_disk(struct mddev *mddev, struct mdu_disk_info64 *info)
 {
 	struct md_rdev *rdev;
 	dev_t dev = MKDEV(info->major,info->minor);
@@ -8305,6 +8305,16 @@ static bool md_ioctl_need_suspend(unsigned int cmd)
 	}
 }
 
+static void convert_to_disk_info64(struct mdu_disk_info64 *info64,
+				   mdu_disk_info_t *info)
+{
+	info64->number = info->number;
+	info64->major = info->major;
+	info64->minor = info->minor;
+	info64->raid_disk = info->raid_disk;
+	info64->state = info->state;
+}
+
 static int __md_set_array_info(struct mddev *mddev, void __user *argp)
 {
 	mdu_array_info_t info;
@@ -8452,13 +8462,16 @@ static int md_ioctl(struct block_device *bdev, blk_mode_t mode,
 		 */
 		if (mddev->pers) {
 			mdu_disk_info_t info;
+			struct mdu_disk_info64 info64 = {0};
 			if (copy_from_user(&info, argp, sizeof(info)))
 				err = -EFAULT;
 			else if (!(info.state & (1<<MD_DISK_SYNC)))
 				/* Need to clear read-only for this */
 				break;
-			else
-				err = md_add_new_disk(mddev, &info);
+			else {
+				convert_to_disk_info64(&info64, &info);
+				err = md_add_new_disk(mddev, &info64);
+			}
 			goto unlock;
 		}
 		break;
@@ -8493,10 +8506,13 @@ static int md_ioctl(struct block_device *bdev, blk_mode_t mode,
 	case ADD_NEW_DISK:
 	{
 		mdu_disk_info_t info;
+		struct mdu_disk_info64 info64 = {0};
 		if (copy_from_user(&info, argp, sizeof(info)))
 			err = -EFAULT;
-		else
-			err = md_add_new_disk(mddev, &info);
+		else {
+			convert_to_disk_info64(&info64, &info);
+			err = md_add_new_disk(mddev, &info64);
+		}
 		goto unlock;
 	}
 
diff --git a/drivers/md/md.h b/drivers/md/md.h
index 6440da292105..a84c8b97fa2c 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -1043,12 +1043,12 @@ static inline void mddev_unlock_and_resume(struct mddev *mddev)
 }
 
 struct mdu_array_info_s;
-struct mdu_disk_info_s;
+struct mdu_disk_info64;
 
 extern int mdp_major;
 void md_autostart_arrays(int part);
 int md_set_array_info(struct mddev *mddev, struct mdu_array_info_s *info);
-int md_add_new_disk(struct mddev *mddev, struct mdu_disk_info_s *info);
+int md_add_new_disk(struct mddev *mddev, struct mdu_disk_info64 *info);
 int do_md_run(struct mddev *mddev);
 #define MDDEV_STACK_INTEGRITY	(1u << 0)
 int mddev_stack_rdev_limits(struct mddev *mddev, struct queue_limits *lim,
-- 
2.43.0


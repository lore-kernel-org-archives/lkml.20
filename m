Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305346;
	b=w5rdcZ42NtZpQ7I4Wt6F2foMkxY6eCVd1LIf5n47J0bzuNufeqq6IALB4Z9oBZlQwVnj
	 nFK1NlYKgm8F8jx1qSOsxgdGwvH6CvKFDWnHgk8ovwKOaAx/oR9270HsLVxaZFhJttM0g
	 HdyrAASBmEGlGWW3UNqedLfgawmS1Xz/1FMJn8gotSK5TwOXJViKDiSVbnBQdkEGDXans
	 ZiPuWvGPuKJtANRdz//DX9OD7zodj5buLuNdgZ1QlMhyDdewJp6Bgyhbhzo5g4a0xaW10
	 PBoxWyD9Ni/cC0Qh9pFBADQdsrQLS7POLTtY5NbtqPQhMwQBAba9S7bsvIQcrajSprg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d5xdLg9rAjWYh0/cl+k2oxrUt58t/79pNohrY47ReRQ=;
	b=sWnJtCsGBUMnPEIWUfZq1PRt9v6pgEVmeG86dGyfdZ91l7xpMGz/mf/82VexR9hBwbTE
	 xsbxC0/r0rFDapzJIDWkRTkXydz2vD8GMlALSaanhjSMRVc5Iv/mu5Hne6mGdZie/9JlJ
	 XWG/gDwYc80FQJ6dr+CQsECLXW7Y+Vpd/yk+7EGz1NiPIveT+8V0VBbA35iHR3tsuFf3O
	 iAVnXgRvK9Qd7L4Tkg04LFyF6YXJOxxAB5uJ3IyNrNrVp1L6TnjoeAPhtNc5XKPqFcNyN
	 WqHpXiiH0aOid6zM0Wy11M9yM8LyDcN/A+M4X1G/PG5Zta04uB+AclC/9WViQl1QnIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HEonZHni;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43F9606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E43F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HEonZHni
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afbd2c386so10791f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793305344; x=1793910144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d5xdLg9rAjWYh0/cl+k2oxrUt58t/79pNohrY47ReRQ=;
        b=HEonZHniVL1vHgK6XVvwEa0vy47NPTvTBWzdrkMvmDrh3PrF7h5dZg6qak8DwRk3ni
         KGLZC/SDzhkEbbF9E5cpkEfoTKwSdH5nKUpz8ly/mcP4a80k8lxNgg0D8jeTs1j0ACv6
         2NNV1gqzG0JpmGZZUAb5YlqbEQVyzRdaE2r1HoLiLe+Vaes+C0Q0NCYKDL5IO9+diqkR
         PPd8YE9DAY/nkDJ882kx+KWbrgQnjyy+OWfN5p+N+yhxDyEciPd+pGIVwdKsQs2D80wo
         OA1aZnOCzF2mxeBEGSVW0Mj7E4tS9UeUIzMQNlkK7hFbPfRNKnf3GCRbdgynvWZ+PBkk
         4DXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305344; x=1793910144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5xdLg9rAjWYh0/cl+k2oxrUt58t/79pNohrY47ReRQ=;
        b=S8x6VkxabRlTnes2/rgjPCbSRKVjI1YhroJ5yic304oIyTdqKQAq7mm07CLaQ1JfDj
         UUWFgEkUxdsj15FudMJUKbuhMvdWiBaRZ7Uct/4m98F+mBwkQJ8ro1ODuFzWdhuM7UWz
         VmX1T037T1epThbNNga2orEZirMpJuavwJ67v3X/MQH9rN7pIpGI2+EWpjE3B5zKWQTP
         B9o19BFfh1zVq/cxs+QM/fOznXZZ7WtUTsvY10v1hNUzEA4UzdyyIaqUJG1mIRREMkq7
         Q6ufzGUNt6ogW5DiI0ZR9+Hi5Nw+xnFiKT4j5/s3/Bvs6GgNlV8VdyMH0PDaWKPdUxfE
         JWYQ==
X-Forwarded-Encrypted: i=1; AKwUvByNvtl+L4KrX1z7GGMbbBrzMMvgZz+UiSzIW9I50U8JLjg9Q7hLoztZwKJKs3+JB0uYy78oyUqs5RofWC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw3M0YQhszOTVePAnWsrTtnzfN6dTGIIE2l3xy2uhSDl8KtWi7
	RKM963L48DA65j3FPFXV3VZZxFxKkTQyzU6IACn7t+TzQcYFtoMM5RBE
X-Gm-Gg: AYBFou3cg0xZWy/9bmrK/jfAkLlGfCRcphLUbQvF3M432tc8q6bLA7WlOYSGCRAsnbR
	YIpbrGFD8BO1a5bSjZCus34JJTA5CrRTTKjmhzuQYTNf2BLwTiOSDYZIHKyglZ/Lbp8QDdpe6JU
	CO3nVueB4G7UoofK6r9UMoiP1L7mE0cbQ9+cEly1kUCHAHzBW1LIUc1ixsY0Hc2mxmmwWHMdJtG
	INp/ow0mGx6xXKtLC3NQm/w54pcmajoxswP6BHuQ2/jFmOnt/8yJ5aG0orXtx57uCrG3bsP0Vdg
	hbbPBXyUiwkrJfvWRmjcHJiuTupKWlvuqYvHRhAHwLOOhNaCb/TBS+7DtcMakggmDIjbbHHxJDJ
	3j8CwwE1BMC2i4a2rKEXG41qbF1MNJ5XDeBL31vDigiyByzRoCA12sfwrNxUGVFU+ApfpJ086nP
	67F253oYG1jAiuCBmBdPHk+yB7XchlbOMih2EanCcJLBLIH5zfG2XN+CFHX/IFfAh2EXjGjonUd
	EFY9Vnjz6n5zhzw4qy+pfxHXCIw/7QJfKqBoR38P3m65Jb7vJg7ZxhUznp92lMVZACfqOTerI6T
	Lngev2qFf5vsUi68GJksdsMMzhT2iS/ZvWiHXr30uBbV+vbKolOhJvh0rOpP+7buFfu/BZbb1Eo
	V55U=
X-Received: by 2002:a05:600c:4ece:b0:4a2:40:8d2c with SMTP id 5b1f17b1804b1-4ac17b2c396mr1900095e9.26.1793305344259;
        Thu, 29 Oct 2026 13:22:24 -0700 (PDT)
Received: from env.. (dynamic-176-003-098-140.176.3.pool.telefonica.de. [176.3.98.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf7146621sm9424335e9.13.2026.10.29.13.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:22:23 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io,
	mtkaczyk@kernel.org,
	magiclinan@didiglobal.com,
	xiao@kernel.org
Cc: linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Subject: [RFC PATCH v5 2/4] md: pass struct mdu_disk_info64 to md_add_new_disk()
Date: Thu, 29 Oct 2026 20:22:06 +0000
Message-ID: <20261029202209.1422567-3-abd.masalkhi@gmail.com>
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

The md control device passes disk information as struct mdu_disk_info64.
Make md_add_new_disk() take this structure, so that the control device
and the old ADD_NEW_DISK ioctl can share it.

The ADD_NEW_DISK ioctl converts its mdu_disk_info_t with the new helper
disk_info_to64(), and md_setup_drive() uses a struct mdu_disk_info64
directly.

No functional change.

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
 drivers/md/md-autodetect.c |  2 +-
 drivers/md/md.c            | 25 ++++++++++++++++++++-----
 drivers/md/md.h            |  4 ++--
 3 files changed, 23 insertions(+), 8 deletions(-)

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
index 154ee5a65cb7..ae893c6296ba 100644
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
@@ -8305,6 +8305,15 @@ static bool md_ioctl_need_suspend(unsigned int cmd)
 	}
 }
 
+static void disk_info_to64(struct mdu_disk_info64 *info64, mdu_disk_info_t *info)
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
@@ -8452,13 +8461,16 @@ static int md_ioctl(struct block_device *bdev, blk_mode_t mode,
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
+				disk_info_to64(&info64, &info);
+				err = md_add_new_disk(mddev, &info64);
+			}
 			goto unlock;
 		}
 		break;
@@ -8493,10 +8505,13 @@ static int md_ioctl(struct block_device *bdev, blk_mode_t mode,
 	case ADD_NEW_DISK:
 	{
 		mdu_disk_info_t info;
+		struct mdu_disk_info64 info64 = {0};
 		if (copy_from_user(&info, argp, sizeof(info)))
 			err = -EFAULT;
-		else
-			err = md_add_new_disk(mddev, &info);
+		else {
+			disk_info_to64(&info64, &info);
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


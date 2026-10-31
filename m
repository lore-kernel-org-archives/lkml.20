Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417557;
	b=psW6r2bVihdrB97RPuljxVn6jcwxIy0qebavdhLzZiYLBSH5ODiC/qP7H9E1NYHQyzd9
	 K1QhnaMr3pGX0SZ772hmaYL5OWdQNXovfi2DeuMf6FbyGc1OlMfrk1n9mjBVD/iXwG2TN
	 ZbQ7GS63c80ypIlCN0wdV5ej1g8bU5HyA1U9vBjT8Btn9DiDZdk4QSbkcwAnGmv92Ip+Z
	 bUEfT7c0SxcBuu/5nm+O2dLn7QchyXIXXWf2tl+c63r1+6K3EgVu9S/IfyMgNWffPrVmm
	 K/J296rD/nanM21C+chJjPXsgNeLgIa3G2v8kWynCFDhNepLWKtypgek2cELxecoDnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4fXd3OVpeQoyQ8hIa4Xx7yJQ7IJPHwsIvV3MeBn9kAw=;
	b=lsg0aq5iNpVRkemcQXD9ODWBMrGxuoeE8k+Y5Y2uZyLKnP4A/5irHbGS3mXGSIFUPlo+
	 I7v+tqkTg00njVk0HXANobm/7TJCAAOM9vvrJW8VeiupX1ZxtORvr0pSJ2MeKU8Jnmj7e
	 fmBhW9Es/xnvtaYwvkfPV20X3+Sol9rn5IdZ1ldu96Y2XxUmP7tzaJ6raX8ahq8MbvBuq
	 Y6RCq8Hdtb/qBA0KoiphJdAkz+gHkFZuelVJFV9YHbsUSncdCAo8OZW1PLY3a4KjHcAa6
	 6ScHgjw8yHy7uDU9yEWswi2O0A/zIg8nzM43uOTsmWGoZr9ugbdVNPilrOUOVltXuLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nS6IQeFC;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2A3606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F2A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nS6IQeFC
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so1776583c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793417556; x=1794022356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fXd3OVpeQoyQ8hIa4Xx7yJQ7IJPHwsIvV3MeBn9kAw=;
        b=nS6IQeFCKbgWBRchktEDfmI3CXDlAcuVCZiZksvXQZhejZgij/acEbCmQhO5oEsila
         ERMrZc6qEVjXdhWfAGEweoSak1j9U4PpCMQ4P9yIL/oZlsIBTZrNiFlODhjPPkORZmqF
         r4FAmOZ4MqCca8hzza5H2cHEZugi237yd/I/gpxTSjUv4Ovi18ILdjUQ0aRPlSDgLemF
         S74+iu/1rdI7Bf0Ge1vxqKPGTqW8fk95GPAOTTd9Veg+4Vt7p4rpZoPTRBbSoBjm4edh
         rI5lV3nCfr5bz2MC+6eEMv4iWP7ZPNwUTHaMLiI602T8xxmxBETDX3pfCDUjwENsNCFX
         nrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417556; x=1794022356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fXd3OVpeQoyQ8hIa4Xx7yJQ7IJPHwsIvV3MeBn9kAw=;
        b=OZ+e3TPNpAnc3Fft8pwA+2YNtP0WHIy2X4mIisZ6kNDw1GAlvcKO9rtLVkIWUHK5tf
         hawJGHfRmMFzslOV4clG6CzSxrfIr5Hiqu9TtYxJpf9qAxmXSJL25PVH8/6a2AQ5l/Em
         UjoqMrN3Nh00UaDYpa734YsikYi1Q7Ixl8JrWg1Gy07yZBZH2C5rtbr7cLFHcMYyp/HW
         /0kngGHU6vTuV/FtO6XSQ+/DvOr0BYIbmgWNyUpfj2vZDfmHo4XA5u7ir0FhP2rWdH74
         MEvvy2ydzqljrRONjLKlhWGEkCwk+zoNp8kgjn9LTSaRCYMMUmjfiJoyDAV1Ty5TWMOn
         zrkw==
X-Gm-Message-State: AFq9FYKk7Oic4InWd2Pe8pvgzYt0ukySuJHUtCrQSah30hAHY/KUmxQa
	Sc5mm65cm+fs6Fs2L5DY4C//ybKRFRTdtd4e2xm93pImFl1npOdDblFS95/c6r0RINw=
X-Gm-Gg: AYBFou2O4sAReuTc0MuyNmjQsFmjhGf9HZ1olbWrWV5vKjg8N+1TmWqBlifsK3Co7w7
	p6WRHCbGqZskX4GLrN2hVC0qtHhnz1DjJSp/FNMLPIctZ6hXyGzuOX1UsAJ3B1geZOHqre8XZ7c
	jJzD7icpeypiKI89dKEsXLJN6gX6wfraM2F89yrFxgG2g+ljwze9HunjijhmMlZsrRQp/S1AL3k
	HIr8ykvv2g1BTjl8bGGfUL62M6efoWN66A9+ZWD9YmOP1nGpqBwQI9H+0q0cBcPE6Saz+0XnQAA
	2KS0G/zpVHuw6Qgw9bEzgzSfzcWNA/jZ4Zrw3ZqXAj914I7kZ62o/vlzGJ/+D6+30k65SJMcvGE
	yRp9C40KJ7xaqrbzBfEfCAHKVl99CsnD9hf1UEQLqTiG6OUtPinbux591j8cJGJ0rWfb6JPzVX6
	9Ets1g2BqWlO3pkwh1PeFKhT6lsBZoau1MRb7+WHauvSasOMHrokfyUOHOQs9FsmVXPvMNEQ/9x
	3LPtG29QZbVscIKFP2n2jTceMfekFdNJDlkIQE6ONx8bD0E5JNjUxT4JkKA/VK5UW/XPx1pH0mh
	1Eo2w3ggEcMe4G8e2yv/wua/DsyMu9fdZTZJSqPHaWHCFS1uuqVMoo20/Byr+VOq10Gkax0wT/T
	Nt8gYVJlmLZUIRHu44/lL1bIFJlFwxQZ4tWRvAZrK8KBkZ/roiof4BAmqM3LAWeLtN5jHHk1epb
	I1L2uzxP7tHWfPYw==
X-Received: by 2002:a05:7022:3a03:b0:155:7721:3a4c with SMTP id a92af1059eb24-1ac5f18175fmr6434971c88.35.1793417556372;
        Fri, 30 Oct 2026 20:32:36 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm12873443eec.3.2026.10.30.20.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:32:35 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: linux-kernel@vger.kernel.org,
	syzbot+018e6f695ad9bccb182a@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] fat: serialize primary and mirror updates
Date: Sat, 31 Oct 2026 11:32:32 +0800
Message-ID: <20261031033232.2490931-1-matthias.goergens@gmail.com>
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

__fat_alloc_clusters() drops fat_lock before syncing and mirroring
modified buffer heads. Another allocation can change the primary FAT
while an earlier allocation is copying it to the mirror.

fat_ent_write() also updates and mirrors without fat_lock. Take the lock
in both paths, preserving the existing post-unlock error cleanup.

The test detector reproduced a primary-FAT write during a mirror copy.
Three exact-current trials completed with no FAT conflicts and matching
mirrors.

Link: https://syzkaller.appspot.com/bug?extid=018e6f695ad9bccb182a
---
 fs/fat/fatent.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/fat/fatent.c b/fs/fat/fatent.c
index 2d10a815a579..5f2779c7f947 100644
--- a/fs/fat/fatent.c
+++ b/fs/fat/fatent.c
@@ -419,6 +419,7 @@ int fat_ent_write(struct inode *inode, struct fat_entry *fatent,
 	const struct fatent_operations *ops = MSDOS_SB(sb)->fatent_ops;
 	int err;
 
+	lock_fat(MSDOS_SB(sb));
 	ops->ent_put(fatent, new);
 	if (wait) {
 		err = fat_sync_bhs(fatent->bhs, fatent->nr_bhs);
@@ -429,7 +430,7 @@ int fat_ent_write(struct inode *inode, struct fat_entry *fatent,
 			 * would not have value to write again on I/O
 			 * error.
 			 */
-			return err;
+			goto out_unlock;
 		}
 	}
 
@@ -440,6 +441,8 @@ int fat_ent_write(struct inode *inode, struct fat_entry *fatent,
 		if (wait)
 			fat_sync_bhs(fatent->bhs, fatent->nr_bhs);
 	}
+out_unlock:
+	unlock_fat(MSDOS_SB(sb));
 	return err;
 }
 
@@ -582,7 +585,6 @@ static int __fat_alloc_clusters(struct inode *inode, int *cluster, int nr_cluste
 	err = -ENOSPC;
 
 out:
-	unlock_fat(sbi);
 	mark_fsinfo_dirty(sb);
 	fatent_brelse(&fatent);
 	if (!err) {
@@ -591,6 +593,7 @@ static int __fat_alloc_clusters(struct inode *inode, int *cluster, int nr_cluste
 		if (!err)
 			err = fat_mirror_bhs(sb, bhs, nr_bhs);
 	}
+	unlock_fat(sbi);
 	for (i = 0; i < nr_bhs; i++)
 		brelse(bhs[i]);
 

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0


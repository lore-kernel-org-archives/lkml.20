Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1F64C651E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978521; cv=none; b=hSggl6EpKpzOlW1JXW915lKgyRxznCX/VyjYYKZ61/QcV3pQlIj3zQk9GGlnK4tjIoWdHrtbh0TcS1Izd/pm9oe9YCVTT0y9TonvR+lqtr5pMTcDbBB8vrlwE75ux+NU9rV+4UZgtC3bNFRX1YbCG7LvvOzDgxLt/iIhm4N3vOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978521; c=relaxed/simple;
	bh=O3hUQ9wkN3PDzZXypiNJPFT+hkyn8LRRyRlW5Amtr+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sitEEoGa1f/Moh1id20lf/AvhXalIJSSfY263Fl7cBduaENo/1nLkLFTdk7GVZgUYnUBXytKFHmxZXZSaPhVUit/s17aMEBl4L/IkTy4NMbtN903+Xd+wYjL+MmcLRP2L0J25Xc55KTRlGSjVgFEFXGwnsIEffInR3ZWRsB+9m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=SR1k0paz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="SR1k0paz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499dd4900dfso4444255e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1791978511; x=1792583311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pf/TLCcQJhqlTchdZFX67WuchZUIfnvCuciK1Vq26k=;
        b=SR1k0pazlYMIbazA+YFZl8tHimlXCZpCNoQLdV8wwo14nT5QOF9gDKN7pwZ93jp6sO
         4sR+a6AYX96Mjz/OQecUAcSzYGLoGIjyzegmST/DuEH3csq61NMAuQfl4yf0NNF9uGRs
         mHbHj1kPuW5jBFYbfBhA77/i+M/XheBDNmxRrskGSCvuKsOoWUugUn1OU2czOox9u5A9
         qudCINxrqQNj5aLMAwDFfBvPOU3SSuHozjPFbjegL3MSq4e2raStVs95jwAC87zCoQJI
         zniyYDpgkiHgh78ea2R3nxKtaHYHL7ar/dc65PUpEQYIYQSxV1PxfI0H5xtO8PzntiI6
         ooYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978511; x=1792583311;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2pf/TLCcQJhqlTchdZFX67WuchZUIfnvCuciK1Vq26k=;
        b=Ojn5pZirZuyHU/rjCbWbv6FTJ7BhqCuoKKcNsp8o+QL4Nzq0XRPLOLWbvl7nhKKyC1
         f0vFDNWHEltZFpbhajqVOExZbCKiyCIpOQhFy4BV4INKwAHFGLedzDKoyhasfVQ4fZlQ
         M7T4HJ6gz1ZBWLeozEUAc7ummG3C2GPBjrsjKljxg2nyAQ+hYiWoaDH2DknOzb1fHUVS
         bvK+tA/gngP3o3J+URS1FxDv3NxYy9y574NXBXL+xwOj2HkIxeKBdi9SpEnaC7A0+R6q
         0b/x6i0UrnuXtXIbq0AfWa58eCeM797yUvOgA0DfdmT6hmshvFwYWg5POSC54Ay5kefV
         6OdQ==
X-Forwarded-Encrypted: i=1; AKwUvByMTFvV4QIEvf83ajVHs8ahicEuJHvocBwUCLYGcD/mEagrEh7mUyEzZrouK53qUTeOLf49haVgGasM8p4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKItTxRbfjZA97JruJN9hF3OYvhlszEi5AOOuMBdkUbhM+plwhO
	SAkUmlYLF9Yyl8SgRpSZZVaHO4d5nX8QFgKG243FFuvl7JVLRm0PJlMfH2Z5cqd2iT0=
X-Gm-Gg: AYBFou0DtsTWtpct4gXJ69cxs53hYLn1IAV1jYnWrYTY+qh+gSJ9gTB3qkZ6FxLRU7F
	K2vwk083gUKQpPnI0935cyno3D7c70FK8dLQfCkWj/lBvb3Qe8l0iuoXAgtZdz6+ocNn4nRgZSO
	qsN61o5MvwL4NnhLfngRUyOPAKxAl34apqIls19PoMzqYtK4YIMJlu0Q6+Kz7uUqcS8pAIgnuxI
	n1JtlBlBKlbSBfoL88UckUMx1y3V7dC4nxQRIp7GJVJEAoK4iI4Nme4j9Bmx9gnUXUAyHNx2as5
	dHZjdqcXyNXsRAjUtlAT/5/VnjYTpmIxOYQZ6+3oBZrupBmR1KcivyiQtrkRtlc7edZtn6lcwDj
	NJCmkRgvkm000yYQSZrxQU6AusVSxXvJ/uTz1FlteXyI7GbrKBb5xhOOmQe0to8IXfo4vnBMHy0
	HmHLsL4KGYMCeYfmn7GMkLljxyi5XtrnRrB50r33iPCiWnX+yPJTZEauzTmxvotYfU11GEUXq+Z
	3hO/6KBt6T20fDWa7pTVnAEaCMPm7LHrPPeVwxrTJE=
X-Received: by 2002:a05:600c:a48d:b0:4a1:9a97:c67 with SMTP id 5b1f17b1804b1-4a19a971230mr156001285e9.1.1791978511353;
        Wed, 14 Oct 2026 04:48:31 -0700 (PDT)
Received: from jwang-ThinkPad-T14-Gen-6.fkb.profitbricks.net ([212.227.34.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b4836858sm42925635e9.5.2026.10.14.04.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:48:31 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Florian-Ewald Mueller <florian-ewald.mueller@ionos.com>
Subject: [PATCH] md: allow growing logical_block_size on a running array
Date: Wed, 14 Oct 2026 13:48:23 +0200
Message-ID: <20261014114830.615589-1-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jack Wang <jinpu.wang@cloud.ionos.com>

Growing logical_block_size on a running array required stopping it
first. Handle it directly in lbs_store(), similar to
mddev_set_closing_and_sync_blockdev(): under open_mutex, refuse with
-EBUSY if the array is closing or has openers, otherwise apply the
bigger LBS.

mddev_lock() is not taken on this path, to avoid holding reconfig_mutex
while blocking on the queue limits lock.

md_release() drops openers without open_mutex, so a bio of a just-closed
opener may not yet be accounted in active_io. Commit the limits with
queue_limits_commit_update_frozen() to drain it. Also take open_mutex
around the existing "enable LBS" branch so it cannot race with the grow
path on mddev->logical_block_size.

Suggested-by: Florian-Ewald Mueller <florian-ewald.mueller@ionos.com>
Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>
---
 drivers/md/md.c | 40 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 03e35386a802..cd9c73f46786 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -6013,12 +6013,12 @@ static int mddev_set_logical_block_size(struct mddev *mddev,
 	lim.logical_block_size = lbs;
 	pr_info("%s: logical_block_size is changed, data may be lost\n",
 		mdname(mddev));
-	err = queue_limits_commit_update(mddev->gendisk->queue, &lim);
+	err = queue_limits_commit_update_frozen(mddev->gendisk->queue, &lim);
 	if (err)
 		return err;
 
 	mddev->logical_block_size = lbs;
-	/* New lbs will be written to superblock after array is running */
+	/* New lbs will be written to superblock on the next update */
 	set_bit(MD_SB_CHANGE_DEVS, &mddev->sb_flags);
 	return 0;
 }
@@ -6046,8 +6046,36 @@ lbs_store(struct mddev *mddev, const char *buf, size_t len)
 	if (mddev->pers) {
 		unsigned int curr_lbs;
 
-		if (mddev->logical_block_size)
+		/*
+		 * open_mutex serialises both paths below on
+		 * mddev->logical_block_size and keeps new openers out.
+		 * MD_CLOSING means a stop is under way. mddev_lock() is not
+		 * taken, to avoid holding reconfig_mutex while blocking on
+		 * the queue limits lock.
+		 */
+		mutex_lock(&mddev->open_mutex);
+		curr_lbs = queue_logical_block_size(mddev->gendisk->queue);
+		if (lbs > curr_lbs) {
+			/*
+			 * A bigger LBS can be applied to a running array if
+			 * nobody has it open, as there is no I/O through the
+			 * MD gendisk queue without openers. The queue is
+			 * still frozen for the limits update to drain a bio
+			 * of an opener that has just closed.
+			 */
+			if (test_bit(MD_CLOSING, &mddev->flags) ||
+			    atomic_read(&mddev->openers) > 0)
+				err = -EBUSY;
+			else
+				err = mddev_set_logical_block_size(mddev, lbs);
+			mutex_unlock(&mddev->open_mutex);
+			return err ?: len;
+		}
+
+		if (mddev->logical_block_size) {
+			mutex_unlock(&mddev->open_mutex);
 			return -EBUSY;
+		}
 		/*
 		 * To fix forward compatibility issues, LBS is not
 		 * configured for arrays from old kernels (<=6.18) by default.
@@ -6055,12 +6083,14 @@ lbs_store(struct mddev *mddev, const char *buf, size_t len)
 		 * enable LBS by writing current LBS — to prevent data
 		 * loss from LBS changes.
 		 */
-		curr_lbs = queue_logical_block_size(mddev->gendisk->queue);
-		if (lbs != curr_lbs)
+		if (lbs != curr_lbs) {
+			mutex_unlock(&mddev->open_mutex);
 			return -EINVAL;
+		}
 
 		mddev->logical_block_size = curr_lbs;
 		set_bit(MD_SB_CHANGE_DEVS, &mddev->sb_flags);
+		mutex_unlock(&mddev->open_mutex);
 		pr_info("%s: logical block size configured successfully, array will not be assembled in old kernels (<= 6.18)\n",
 			mdname(mddev));
 		return len;
-- 
2.43.0


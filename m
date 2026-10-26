Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012671;
	b=FTRhd5BaBcv30mV+iRMG76/ewe2rBzMaAqM76l54pjpdCAMZLZCNNK26Mv4HrcWch+1k
	 VfK5epS+VcgQq8MRm5ecr6JaurDoJ4TCoqbzoMjcAcLOGZpuoZfGwKrr1s9Na0EKueYIC
	 +CTpBoTDd4uGnze3utLlrd4HG6Z1812jAfLEn0cumD8qoHBBuFi8WOl5p+6IuMeLMyHcV
	 N8XHGPckNkcb2egrapWSkJna6nTPfUGdHCGf/t1UlPBQ+VThFqfOhzuFJ0Nzoo7YlySMY
	 74FnulNC9XUG3vPNxDMVDY6EmzL65AkpAX/Nhll83I30jOnLAVbD3tYP/57PLRDt65A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eQulDPAhSJ3VfZ/4ogb1s3vm11tJrOqeW6KyN89YN3g=;
	b=AefVYUj0VyH6jFGUb3jkrpTs4GxB1Q3AeqAr3zyNXSZnpsVtzGd/7H2QxRcxyDcOzA9V
	 Rxb1130eU/SdKXiJkYRSMUiMz3hhBKQxHN/Yyj6wlPKUNr4T/sNPF29x8hW4IRD3aUYsP
	 eSIXlp7LlUxEiol+PxIE7nbb58OxcjhRodX342Eqih+g2YenCWD1yH66VrZZAdbJIASwQ
	 hMFXCw7e+W63G3o0MGRA/cuKW8yvZZWP8nOjHHTa1yl8kDIylCPltvjTubj8JgWRBVrKY
	 WSGfXJNC8aaSt11R+BhHZrNJVvNKseoy9AIDWD3do27TSNQO5D5Ld9kf1v0UZnxshtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="JM/S9Bt4";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E64C606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E64C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JM/S9Bt4
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso5271821eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012671; x=1793617471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eQulDPAhSJ3VfZ/4ogb1s3vm11tJrOqeW6KyN89YN3g=;
        b=JM/S9Bt4a9R3TNL+TCkPQhq+KJbHd3iPuq8zU2cF5ZvY4wVYELmaRo6Szo3aSdXFPO
         /X5FKEtq8ot1dKlgCjK/HVGpL128Lz0f1PJpMdfvRJb6sQRWNmGQXZ2Kcwne2WEIq1oI
         KwRWjUtN6hhiG609IqelTfjl+GaE7ZqYOrsbyn/d+EbKW7CO+omFUTHeSHE5DZMX1gXN
         7JYfJjJ2obuh9em6lw1E74gmS5HsUzQxdjrVUSXltW47/pavP/O+8Yf5JY2Cb86SXPuv
         w19qNos6YeriyGUNoB7xuN9gxsC8qMj+1DS9FUqPZpaA4dHTK+HngU+IX5mjbJNGrKeO
         YBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012671; x=1793617471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQulDPAhSJ3VfZ/4ogb1s3vm11tJrOqeW6KyN89YN3g=;
        b=TmYV6hWxklhHk0xeIqLS7DFPBGIVEI8DKMJ6P/fxYJqv5nxo+HFE5MwfnSwHbm6jO4
         xVpUlieY6mnrr6VVwR8HQTMF50NoIFWvSqQIk5odu89fHxQuGnp0/Xw+EWmi2hUMpmWj
         A0v8kfXzzZvkXmTK0fdJ8O6ie0IcKXGH/Cr5NfeZ/RqarkuMQkKIwRS/b0uIKw35xbbW
         t4hpC3QswdOZJfZLgcp0aBkFiqStArbuN8MhWS+ctjijmuqabQ2HH94oWSD+UBnn84Bl
         x7WstEaRjafeXnNFFhEBnWViSAJIbT5FJrXwA5S7NRJsFqXGtCQod9i0l5YZLF1Dw5Rm
         DKug==
X-Forwarded-Encrypted: i=1; AKwUvBz4c9zjCKPxsT5ZtILadh7QRvsMgxCXHTd/AHAqXPXEGl58geywasvx4v4xZOHKYNOiVGUsoYyoK47vCkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0+xj4KQw0IMbvFLTrC/rOm6XcZrDowBTCai4uPJSr7e3u/Prp
	ENNf11TZz6yB0j7VdUd3b3JUkpoqEpwmmGDqAMeay+YYrOLwOH5yNcT9zL5+s3Df
X-Gm-Gg: AYBFou0fRi4E608KKB/ZaGohRAdh99GWPFdF7jyV5LRDKSIDNR/rTHwa7raHS8rRhZT
	ptyW4rXr1E9O3wuHXvnSWfx5Z5BaCRtKhIzgYD/kJsfQuOZfH1cF4rGkJ4Gqfw9WK2UO8GeiakK
	+TfbVLwiCprdShhRe+Nku7T/pTefZ85cSC1zseiKZ8Chug5LSm+gfXzJmhenG5bSqVl5ZQQ3RNw
	/5dSVz5A9jiONKc8t8IF/7S2/v6XLJ2LyNI0wKVFX+/vNLZaucPLuto2SrqpwzIeBQN8QfgTH1i
	0qhupWPo2Y/902kS1APl84qeoTLbEAU0+Kvc+0F2TW8NO5lD4c4uvgQ+qvUbWGKi53mSsgbMdU+
	v9PzVkp7IlXmC5bPXncZ0lDmnKy0s9HXsQfWpWl74HCWraILFTPFqk4ONigz8dBRFOtf1SShH8P
	7n0yDyhxOpEqFDPI2frZ0FZ0EpK2Mg9DFmRLbFxgJU1DzseYrSXWHLUpkaEt/9Qji4Yg6+D2PNL
	w6NFixLEXxzGWsrqqQaLd1CiGK+ezDJeUbNwD6pmPS4hUttCHTGXBeqV8pPMgafXiMstk92bsSR
	KxvKr+SrqIcH
X-Received: by 2002:a05:7300:ec0a:b0:35f:8c5d:5927 with SMTP id 5a478bee46e88-369e849d9e3mr12626709eec.14.1793012670428;
        Mon, 26 Oct 2026 04:04:30 -0700 (PDT)
Received: from Hruday.lan ([2409:4091:903b:c404:624b:425f:9d48:c5a8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ef6a71easm22985134eec.5.2026.10.26.04.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:04:30 -0700 (PDT)
From: Rahul Rao <shreeramrahul94@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: Joe Thornber <thornber@redhat.com>,
	dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com,
	Rahul Rao <shreeramrahul94@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dm thin: prevent use-after-free when metadata and data devices alias
Date: Mon, 26 Oct 2026 16:34:02 +0530
Message-ID: <20261026110402.103622-1-shreeramrahul94@gmail.com>
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

pool_ctr() takes separate specification strings for the metadata and data
devices. However, different strings (or format representations such as
/dev/ram0 and 1:0) can resolve to the same underlying block device.

When the read_only feature is requested, the metadata device is opened
read-only before the data device is opened read-write. If the devices
alias, the second dm_get_device() call upgrades the existing device's
mode. upgrade_mode() replaces the dm_dev and drops the old table device,
leaving pool_ctr() with a stale metadata_dev pointer. The subsequent
metadata_dev->bdev access triggers a KASAN use-after-free report.

Acquire the read-write data device first so that acquiring the metadata
device cannot trigger this mode upgrade. Then reject matching block
devices, including those specified through different names, and release
the devices in reverse acquisition order on error.

Reported-by: syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=83827f9a59abe148bff4
Fixes: 991d9fa02da0 ("dm: add thin provisioning target")
Cc: stable@vger.kernel.org
Signed-off-by: Rahul Rao <shreeramrahul94@gmail.com>
---
 drivers/md/dm-thin.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 59392de7a477..52e47874048d 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -3326,18 +3326,24 @@ static int pool_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 
 	metadata_mode = BLK_OPEN_READ |
 		((pf.mode == PM_READ_ONLY) ? 0 : BLK_OPEN_WRITE);
-	r = dm_get_device(ti, argv[0], metadata_mode, &metadata_dev);
+	r = dm_get_device(ti, argv[1], BLK_OPEN_READ | BLK_OPEN_WRITE, &data_dev);
 	if (r) {
-		ti->error = "Error opening metadata block device";
+		ti->error = "Error getting data device";
 		goto out_unlock;
 	}
-	warn_if_metadata_device_too_big(metadata_dev->bdev);
 
-	r = dm_get_device(ti, argv[1], BLK_OPEN_READ | BLK_OPEN_WRITE, &data_dev);
+	r = dm_get_device(ti, argv[0], metadata_mode, &metadata_dev);
 	if (r) {
-		ti->error = "Error getting data device";
-		goto out_metadata;
+		ti->error = "Error opening metadata block device";
+		goto out_data;
+	}
+
+	if (metadata_dev->bdev == data_dev->bdev) {
+		ti->error = "Metadata and data devices must be different";
+		r = -EINVAL;
+		goto out;
 	}
+	warn_if_metadata_device_too_big(metadata_dev->bdev);
 
 	if (kstrtoul(argv[2], 10, &block_size) || !block_size ||
 	    block_size < DATA_DEV_BLOCK_SIZE_MIN_SECTORS ||
@@ -3426,9 +3432,9 @@ static int pool_ctr(struct dm_target *ti, unsigned int argc, char **argv)
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
 
-- 
2.43.0


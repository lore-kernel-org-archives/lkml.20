Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4627C492183
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537194; cv=none; b=MlrGgLf1peyhw95ucu4oekkKEk21MaNwwSPJNbkVnDUfQ8aHmbaJJHCpH4tm5357rBAtw18uyhR7EAVyVhXhfmj241HLX9nyGQc62oRQtsEeeDzk8Mw9W/ukPPRKnPvGP0NpDs2fujijzuIdb2gr5N0mEqYzB5EC89RMTn/nzPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537194; c=relaxed/simple;
	bh=5KUfU2UUZ3fPmA3o93xPIyFBexPShXAE5Elg3/MLXI0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ICrSIi9tGvvOc1YHtFyQ7W9fpcZNhRVFDCFuRH1HTtWurSdAByQb9oNAC1Ayxmxe3vKg7TvpDdgq6+ZgRxGD03W38UyUTPjJMPh2zy+QYUDwjcfMl5EjUZEWN+3DUlb8Uf2FedpZd/TX/BZ32ZQMEqEooeISoY1d1BEwh8Zxf88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sYtt3Jjq; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sYtt3Jjq"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so1752434a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788537191; x=1789141991; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pt0L+O53/xVVWaghU8W5mtgRgEzuJWx3ygItaBNaDoI=;
        b=sYtt3JjqgqrxjTUwTKQ48SeOu1rBtDHyIAbMrvXveHPkKuNpA3//lElGk+n0WPdbmN
         Ct5/HJvfeVut+QoL0/DczRMkTfS5Ib9+z9MV92pvLoPn0bWk/nBuUnobPzaaiM6CMhKN
         +uWnkGJ7jilK4cQFHTfeWj4pD+sXHNCLYHAyh/DqeeHy9GaKU5xcKR3rmwytb98GK6DH
         o+0aUaIinDWCoFnuQs9lOguBa2FyH8jKvRwGTDvckFMBMVEQqoNYM3sfOlAxuXmtkfmb
         Jdg+ln/ecJ8bfQo4KA7dpy+F3Q0yJEPDkVOcVG14CmffzH92lLvVgQx+CFc2FhjlD32d
         wMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537191; x=1789141991;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt0L+O53/xVVWaghU8W5mtgRgEzuJWx3ygItaBNaDoI=;
        b=SZqjf2c1tro3LflKY14HSflSad5fkbbi3/HlIIvx0H4B4TsOZMOwBycp30GAPxajYq
         InHf0TFH1tHwwZ+3REolzju1Mj/5oXbE1QnSpsBSUF6cEOOEEhoifmsoA04vpaYg6J3T
         9tXdEtxgS9xS0hSOz4/J2xv+0TNiq/ehG3VyZSGo+VHqUZx84DlKqXu8JCmXF1nrqcPk
         uspuy1UQm4Jt33031+074tCatL4zoc6yQ3s0gW3oXwGYnxfg6vE4nSedrIdZQBYnJP3l
         eN5zRvrJ2861eBxqXLGwTChUVyH2u/GHtJ8H6Khtn/RewCgbrhcReRHdu9FfKSsLH7dQ
         VRSw==
X-Forwarded-Encrypted: i=1; AKwUvBwZYBDCdCDuAFs0XBD1lH0kyrjn1YgWpSl0CAfPQhpPzxO/KpIFVhQczW9WLiFgLo1JKdBmwQKEgA6t7Ck=@vger.kernel.org
X-Gm-Message-State: AFuF++lcVRnUl3CaK43JVxzPs+1x67SPohniiZiZR9cRK9mPx5VDitwA
	eCi4PxvKSnX2+Rl7XxvCbZQB0//1xkQY40OpqhzUlrWEJ8vD1CWXpREy51QzE+mU38jbgGSW/0E
	o/+ucow6fiXLSdcvvu1JCNA==
X-Received: from pjyp14.prod.google.com ([2002:a17:90a:e70e:b0:395:1a86:4fe8])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:e7ce:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39b2624a1bbmr9099604a91.19.1788537191083;
 Fri, 04 Sep 2026 08:53:11 -0700 (PDT)
Date: Fri,  4 Sep 2026 23:53:05 +0800
In-Reply-To: <20260904155307.150443-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904155307.150443-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904155307.150443-2-stanleyjhu@google.com>
Subject: [PATCH v2 1/3] rpmb: core: Pin parent device and guard requests with rwsem
From: Stanley Jhu <stanleyjhu@google.com>
To: Jens Wiklander <jens.wiklander@linaro.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>, Brian Kao <brian.kao@mediatek.com>, 
	Brian Kao <powenkao@google.com>, Avri Altman <avri.altman@wdc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Stanley Jhu <stanleyjhu@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When an RPMB device is unregistered, device_del(&rdev->dev) drops the
driver core's reference to the parent device. If external callers still
hold references to rdev, rdev outlives the parent provider (e.g. UFS
host). Once the parent is freed, subsequent access to rdev->dev.parent
causes a Use-After-Free (UAF).

Additionally, lockless access in rpmb_route_frames() races with parent
teardown, risking frame dispatch against an unpowered or torn-down host.

Fix these issues by explicitly pinning the parent device for the
lifetime of the RPMB device, and guarding in-flight requests against
device unregistration with an rw_semaphore teardown barrier.

Fixes: 1e9046e3a154 ("rpmb: add Replay Protected Memory Block (RPMB) subsystem")
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
Cc: stable@vger.kernel.org
---
Changes in v2:
- New patch in v2 addressing cross-subsystem UAF and TOCTOU races (sashiko-bot).
- Pin parent device with get_device() in register and put_device() in release.
- Introduce rw_semaphore and dead flag to serialize in-flight requests.
 drivers/misc/rpmb-core.c | 24 +++++++++++++++++-------
 include/linux/rpmb.h     |  5 +++++
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/rpmb-core.c b/drivers/misc/rpmb-core.c
index ecf14acf230a..c0e19cfe3faa 100644
--- a/drivers/misc/rpmb-core.c
+++ b/drivers/misc/rpmb-core.c
@@ -50,11 +50,21 @@ EXPORT_SYMBOL_GPL(rpmb_dev_put);
 int rpmb_route_frames(struct rpmb_dev *rdev, u8 *req,
 		      unsigned int req_len, u8 *rsp, unsigned int rsp_len)
 {
-	if (!req || !req_len || !rsp || !rsp_len)
+	int ret;
+
+	if (!rdev || !req || !req_len || !rsp || !rsp_len)
 		return -EINVAL;
 
-	return rdev->descr.route_frames(rdev->dev.parent, req, req_len,
-					rsp, rsp_len);
+	down_read(&rdev->lock);
+	if (rdev->dead || !device_is_registered(&rdev->dev)) {
+		up_read(&rdev->lock);
+		return -ENODEV;
+	}
+
+	ret = rdev->descr.route_frames(rdev->dev.parent, req, req_len,
+				       rsp, rsp_len);
+	up_read(&rdev->lock);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(rpmb_route_frames);
 
@@ -62,6 +72,7 @@ static void rpmb_dev_release(struct device *dev)
 {
 	struct rpmb_dev *rdev = to_rpmb_dev(dev);
 
+	put_device(rdev->dev.parent);
 	ida_free(&rpmb_ida, rdev->id);
 	kfree(rdev->descr.dev_id);
 	kfree(rdev);
@@ -133,6 +144,10 @@ int rpmb_dev_unregister(struct rpmb_dev *rdev)
 	if (!rdev)
 		return -EINVAL;
 
+	down_write(&rdev->lock);
+	rdev->dead = true;
+	up_write(&rdev->lock);
+
 	device_del(&rdev->dev);
 
 	rpmb_dev_put(rdev);
@@ -164,6 +179,7 @@ struct rpmb_dev *rpmb_dev_register(struct device *dev,
 	rdev = kzalloc_obj(*rdev);
 	if (!rdev)
 		return ERR_PTR(-ENOMEM);
+	init_rwsem(&rdev->lock);
 	rdev->descr = *descr;
 	rdev->descr.dev_id = kmemdup(descr->dev_id, descr->dev_id_len,
 				     GFP_KERNEL);
@@ -179,7 +195,7 @@ struct rpmb_dev *rpmb_dev_register(struct device *dev,
 
 	dev_set_name(&rdev->dev, "rpmb%d", rdev->id);
 	rdev->dev.class = &rpmb_class;
-	rdev->dev.parent = dev;
+	rdev->dev.parent = get_device(dev);
 
 	ret = device_register(&rdev->dev);
 	if (ret) {
diff --git a/include/linux/rpmb.h b/include/linux/rpmb.h
index ed3f8e431eff..2d8a41716883 100644
--- a/include/linux/rpmb.h
+++ b/include/linux/rpmb.h
@@ -7,6 +7,7 @@
 #define __RPMB_H__
 
 #include <linux/device.h>
+#include <linux/rwsem.h>
 #include <linux/types.h>
 
 /**
@@ -48,15 +49,19 @@ struct rpmb_descr {
  * struct rpmb_dev - device which can support RPMB partition
  *
  * @dev              : device
+ * @lock             : protects in-flight operations against teardown
  * @id               : device_id
  * @list_node        : linked list node
  * @descr            : RPMB description
+ * @dead             : set to true when device is unregistered
  */
 struct rpmb_dev {
 	struct device dev;
+	struct rw_semaphore lock;
 	int id;
 	struct list_head list_node;
 	struct rpmb_descr descr;
+	bool dead;
 };
 
 #define to_rpmb_dev(x)		container_of((x), struct rpmb_dev, dev)
-- 
2.55.0.979.g7e5102b832-goog


Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38223750CB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147619; cv=none; b=VdTy52vLBvyi/BuFczjq+QuLVuVxK7mLwXhApSNSxTMHaHiKN8GnmhZMvJh4xZVM9mGuVcnfnG3EC5PVKgPkmbGQmcoDvrUIUW3t7sCXIdC0Dmd8BHOT7xl9zLKaAEunH9TfHRsvQOmAsfQwYcDmrG0xK/2mNnl2uFZeCUE1BmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147619; c=relaxed/simple;
	bh=dVZsyPAkZmqWomLXTmvvZewZitnfBuLAs1Mrn1qnZtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLVT1cfEWBWBXj8ebuF2iuClcZQ5hBmLSLo2/UNJ8sQYI547QaUySa3KtrqCEKNQCFjeqzTN3k76/mJbKR+8hmKpl34bVB0g/nqerbIbm6yYpvnfGe9vmJae46uGvix9qfavDEtYtdkC9S7iChv5LF5e9bDvkJqqB3AxTEVWusk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S+x0v7kx; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S+x0v7kx"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso3538688f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147615; x=1792752415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3o+D2T9+mE2UaEqtdIwi+Nu/PVJ5FMXv6s2fBXuxgw=;
        b=S+x0v7kxUZabffX1uxGeoFgYzUr3j+cA/HJsXNBLZA9kjt0jEstVaB79uL5z39jkIc
         6xFvF06aqbh1VXP5yYeI6kWfnHIbwZvrwU0gI3XJvFwfJqS0yUDbSU70IlvLpuADjWZE
         Hcnqqz5GlKmJzrmDwPQaSXi+DoS4U51kQ8zW5d6K2OsZMFGD6opTGeagUP8AZ/y2QWS9
         tLD6EpXkJDohVi45CTJlwvnGd+OBqY+CHx8Rp0AHNfbaWHPdADUUSAd2cqpVfdWILPKR
         /XZDcFICgVCo0dDBTfxC90KmDBlwh8eDnNyn8dgiBf5RQq3oaLpBIFLZOujyyXkGxZ6j
         k05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147615; x=1792752415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3o+D2T9+mE2UaEqtdIwi+Nu/PVJ5FMXv6s2fBXuxgw=;
        b=idhpFx2uNPa8RSleShX1t/Rw201xHTiKddeSD6ibpNNJLMIyoPPfoZw9zWZR5N44TX
         WtQimX/QkpD3UZ5hTBwuibfkgYShuNnay6COgD4FaOeTYB+k19VIoQk/MIqigomezOt4
         D2f8yzrITa9/AzojCYAYxRosd6oPI+kSQrcOSiNZNXBKrOJ/47qz2njsO9LlMLfL8Mtm
         pSd9+Tk/grodMV1UMh1C3FGBjZhsiK4fHs7atl+ttTFdDI5FegUa3K3YSPgaTiINHJ72
         cMz3SKhUOKIVkiHf4G80JAk1jygNe14wJMK3TtB/+Kz+UqR/Zk0NrTKg9zcLayRF9w++
         am8w==
X-Forwarded-Encrypted: i=1; AKwUvBw4I6QPe3bA9EiZEWjBA2t8DYUdQgbjr/WtuVmvfmvq4uZ8HrATSJ9eyr9g5NWyxP1EyOfXgFsnI0uznrs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGF+3pmnA9z3TXCz5xnBUzfVB9c8HHs4bGvvgN/FG6mY8Srf7o
	PJ8tzqQXcfSxI18FEaNd7bZBsTTNNRIE3I0L0gUJJl8qGlpyPSb1jm0LcScgdErh1gk=
X-Gm-Gg: AYBFou1OBMBXgC3676HA9ZDqcJU8rkveEmT/3ZKRf4sS1I6bp0NqWvsA02MAfaJwh1T
	kATJzuQewlttr4IG0OW6jkR9PuJeRoHF7kYvSPkyLUL60a3EgXYiyBL2He3aOKnA9O5Bfq6dQma
	C1/Q63VLfevyMu92+lDu0YYPvK6jeactUDYGzgk4qF4N4H0WdGunVM3W9wi+qDd6p0S0XUCUqS7
	ZbhwTVE+yriR8i7937OX1LFyx6+IIwMSq5j4yq/cTC9URM0Awupw41mWghmXW73Rrz7CzDTMiE7
	ib9Nszq/9OxvlmqfuRB9P6Nsu9cOJMOSLtbkIkJ0yx2NlwEKZHOdsx1N9X4f+31xCU+GFOyuhBd
	C10SvNNjNIEqkoI1KuJeFQJdmPQUOXkT+C/qqSnCMNuEgTR3e8U70jf/6LRz8eUJKEB3S9P1W4l
	v4lQW7cyIyuipi4ra8bPPnR+MtGOdpO3KG/ey8i/yKWGyfvoCcpnGZy0CCYdUyIIknwk80pp8+Q
	rj4FXFk+mTL
X-Received: by 2002:a05:6000:1ac5:b0:487:91e:d8ed with SMTP id ffacd0b85a97d-48dba784ca9mr43925807f8f.2.1792147614732;
        Fri, 16 Oct 2026 03:46:54 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:54 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:20 +0100
Subject: [PATCH v4 10/10] coresight: ultrasoc-smb: Remove sharing guards
 from SMB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-10-dedf961aca0e@linaro.org>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2

Potential sink sharing is now identified during AUX setup. Trust the
core sharing rules when enabling an event and use the sink reference
count to avoid reconfiguring hardware that is already active.

Remove the redundant PID tracking from SMB and the now-unused PID
field from the common cs_buffers structure.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-priv.h |  2 --
 drivers/hwtracing/coresight/ultrasoc-smb.c   | 20 +-------------------
 drivers/hwtracing/coresight/ultrasoc-smb.h   |  3 ---
 3 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 51313fe2cd0e..9eabfdfa32e1 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -95,7 +95,6 @@ enum etm_addr_type {
  * struct cs_buffer - keep track of a recording session' specifics
  * @cur:	index of the current buffer
  * @nr_pages:	max number of pages granted to us
- * @pid:	PID this cs_buffer belongs to
  * @offset:	offset within the current buffer
  * @data_size:	how much we collected in this run
  * @snapshot:	is this run in snapshot mode
@@ -104,7 +103,6 @@ enum etm_addr_type {
 struct cs_buffers {
 	unsigned int		cur;
 	unsigned int		nr_pages;
-	pid_t			pid;
 	unsigned long		offset;
 	local_t			data_size;
 	bool			snapshot;
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index b107d4606fcd..f2efbb615cda 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -214,23 +214,9 @@ static int smb_enable_perf(struct coresight_device *csdev,
 			   struct coresight_path *path)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = path->handle;
-	struct cs_buffers *buf = etm_perf_sink_config(handle);
-	pid_t pid;
 
-	if (!buf)
-		return -EINVAL;
-
-	/* Get a handle on the pid of the target process */
-	pid = buf->pid;
-
-	/* Device is already in used by other session */
-	if (drvdata->pid != -1 && drvdata->pid != pid)
-		return -EBUSY;
-
-	if (drvdata->pid == -1) {
+	if (!csdev->refcnt) {
 		smb_enable_hw(drvdata);
-		drvdata->pid = pid;
 		coresight_set_mode(csdev, CS_MODE_PERF);
 	}
 
@@ -292,8 +278,6 @@ static int smb_disable(struct coresight_device *csdev)
 
 	smb_disable_hw(drvdata);
 
-	/* Dissociate from the target process. */
-	drvdata->pid = -1;
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	dev_dbg(&csdev->dev, "Ultrasoc SMB disabled\n");
 
@@ -315,7 +299,6 @@ static void *smb_alloc_buffer(struct coresight_device *csdev,
 	buf->snapshot = overwrite;
 	buf->nr_pages = nr_pages;
 	buf->data_pages = pages;
-	buf->pid = task_pid_nr(event->owner);
 
 	return buf;
 }
@@ -563,7 +546,6 @@ static int smb_probe(struct platform_device *pdev)
 	smb_reset_buffer(drvdata);
 	platform_set_drvdata(pdev, drvdata);
 	raw_spin_lock_init(&drvdata->spinlock);
-	drvdata->pid = -1;
 
 	ret = smb_register_sink(pdev, drvdata);
 	if (ret) {
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.h b/drivers/hwtracing/coresight/ultrasoc-smb.h
index 323f0ccb6878..561e42dc0870 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.h
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.h
@@ -108,8 +108,6 @@ struct smb_data_buffer {
  * @miscdev:	Specifics to handle "/dev/xyz.smb" entry.
  * @spinlock:	Control data access to one at a time.
  * @reading:	Synchronise user space access to SMB buffer.
- * @pid:	Process ID of the process being monitored by the
- *		session that is using this component.
  */
 struct smb_drv_data {
 	void __iomem *base;
@@ -118,7 +116,6 @@ struct smb_drv_data {
 	struct miscdevice miscdev;
 	raw_spinlock_t spinlock;
 	bool reading;
-	pid_t pid;
 };
 
 #endif

-- 
2.43.0


Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C8F46C856
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147619; cv=none; b=RkFfuivpGWrEAQPic8MhkXT5D87L7f5ovDqveu0IC/+OzxuRVEWqO6f2/U8czXGRveKkCSrNF3+dxSJPXb3YYh9oYyzmuQCdoM0dBxXysWv8TPybAdBRh9TGXQamW8FlLKGxgUV5v7cSdlYkgSoGd3AHB8JLWrrPq1+xUtk1aAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147619; c=relaxed/simple;
	bh=bthbYh5tPUkpyCS1/xS8NV82EmoHoGqUtllJ+Wx0MjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ng9lxTdNkxteZkEpQdcfOcWmktVze9j5yJ7VSgM/tfWm2b6K0bh6yg+fE6eKLErGzUz6IJiSlfYRm/09SdOLBxr9Aqh+jUHhCDhVjGf6NIE33QL9mC9VXH2k+Ii9QkymOGQDp2oGYcdmer/8KKOZpIarjKr4NEUBK1yR8DajYTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JDZRKvXj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JDZRKvXj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d05d51553so20521525e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147611; x=1792752411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O0OY13du8CSykj1rk4KeOXIR2Ct1uKCdfrHBYl2Ej1o=;
        b=JDZRKvXjtTwI3u8vxv3lrKJ2X/JjUV7LYqF8CzuHXTR2zIVNu6JLMYh2Tk6B+ZS7qD
         nb+Gq2iTwLkE03YSEj86Zk/SZsZrAvhj2gr/I85sgiShat0PkjuSJBfIXQ+hyopQVdtJ
         AdgtIensU2Skeij3R74FJsEYAKvgzqReKyKg3J1AzoaWljrnrHFYSBeHcbz5lkk3vBbq
         pbI+qaZO5JhBMTUpblv44MiJVJx1+MP6BAlEX9+YjF8+dyJ0ortttaIUmucaU+cKKYbi
         QEWFSHDolTqu6W3rDaNr6affP84PEWVhN07CW82mtD9nXVjrGAE/kfwYJvr9FZ8Gm7gQ
         Ehow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147611; x=1792752411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O0OY13du8CSykj1rk4KeOXIR2Ct1uKCdfrHBYl2Ej1o=;
        b=ghfskSO9QXq1+CbGMWIG5uh4fNMiDDeGol8ngbrSAWgpVdtIbXIuWOQBAedeqNBQg9
         LOMC+B1C3CxZEpeiQsXuCDvlcCwkYJF2++2jUFfWv6VGGy994vjOL/enUOgJV3z44zAi
         qdP1hUYTYJKy2mFE/UydzjJ6+s0hVkleZEw3s0HJJqgtM50iNG3rS3C2AkFVYxlDnYA2
         Y6uUVISpXGJ7Ek6gz2k/DLL2ovqbGysKZ2+R4XWYYBK5UsFCNdU9TdrVcG5c/elC19LU
         4wbH443iz5o13mqnZry50SXdMaGzIa/65MHSlYlE1zUWwfeoHdSGM0pXkn2OtXgdXk6s
         4ebQ==
X-Forwarded-Encrypted: i=1; AKwUvByp1w/PhO/Pis3rKAkACnXJTDIofse11sR/6szzLhl534PrGaXm4CX/uI/acP2fHHVhP8sebsW8e9flUGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTKzld8H+Y9oR+a7ZtA0XgVUyRhBDrX3VsqoUsNWWDKv/9Q1S4
	IQ0y85lKUNksK7Boz/1A0jV475yzQT4RLnp2SCaPMTN2baBsMWY+tzCTclTYJvD7yH0=
X-Gm-Gg: AYBFou14lSCKID3ClFkeld3p3GEixCWSGoV+EcVteZbb/bVibOZKdE5E+X5Ns0jAXD4
	RQiUnL65F6RyVqdZjVqy8mZI4sq4lQPYQS8DUU30gEaMrMAozEydNNTGrllwEMQgChnjbxxXnWH
	7intqkCsUutLbwxxQyvMsObwfHkn1hTNRGUMP+frK7/dP8h878XQqkUCfIBHt12JpWoGWgiq+pX
	/G1Q4TfGt3EkivDWCZOYjwaFTrtl+nY1zHz0PKDmt6KYazghjFM5FrSX5g2s+hLZEH6nqMxftn0
	uL9CQs3CnTNhKLv2MIlJ+Xt5GUlz6kzCSGN/sD78y248dk9VaYSbmFqOFdCG3P4hD+65iIFIiu2
	gGrrCMrQnRvclrDz64lNBxZO4dQeOY7hQps1Nb20aAe+BuQYroQA/0WAoaE/4kHzijVxyMAe0ky
	O+QOXlK28JZnVASVaK+8agEKoYtxkgkicsz9sKwNFiAYcoNw4TWy11jaMztfqnT/F3jMmE37aKx
	g==
X-Received: by 2002:a05:600c:1389:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1d307b5d9mr8341635e9.0.1792147610795;
        Fri, 16 Oct 2026 03:46:50 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:50 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:17 +0100
Subject: [PATCH v4 07/10] coresight: tmc-etr: Remove sharing guards from
 ETR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-7-dedf961aca0e@linaro.org>
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

Potential sink sharing is now identified during AUX setup. Now sinks only
need to refcount and use the buffer provided by the event, which is
guaranteed to be valid and shareable.

Mismatched buffers seem very unlikely now, so remove the WARN_ON() to
reduce how much state is stored in the sink.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 39 ++-----------------------
 drivers/hwtracing/coresight/coresight-tmc.h     |  2 --
 2 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b4b186c605c6..a2768f5bbfbc 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -36,8 +36,6 @@ struct etr_buf_hw {
  * etr_perf_buffer - Perf buffer used for ETR
  * @drvdata		- The ETR drvdaga this buffer has been allocated for.
  * @etr_buf		- Actual buffer used by the ETR
- * @pid			- The PID of the session owner that etr_perf_buffer
- *			  belongs to.
  * @snaphost		- Perf session mode
  * @nr_pages		- Number of pages in the ring buffer.
  * @pages		- Array of Pages in the ring buffer.
@@ -45,7 +43,6 @@ struct etr_buf_hw {
 struct etr_perf_buffer {
 	struct tmc_drvdata	*drvdata;
 	struct etr_buf		*etr_buf;
-	pid_t			pid;
 	bool			snapshot;
 	int			nr_pages;
 	void			**pages;
@@ -1508,7 +1505,6 @@ static void *tmc_alloc_etr_buffer(struct coresight_device *csdev,
 		return NULL;
 	}
 
-	etr_perf->pid = task_pid_nr(event->owner);
 	etr_perf->snapshot = snapshot;
 	etr_perf->nr_pages = nr_pages;
 	etr_perf->pages = pages;
@@ -1622,12 +1618,6 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 		goto out;
 	}
 
-	if (WARN_ON(drvdata->perf_buf != etr_buf)) {
-		lost = true;
-		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
-		goto out;
-	}
-
 	CS_UNLOCK(drvdata->base);
 
 	tmc_flush_and_stop(drvdata);
@@ -1707,7 +1697,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
 				    struct coresight_path *path)
 {
 	int rc = 0;
-	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = path->handle;
@@ -1720,35 +1709,15 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
 		goto unlock_out;
 	}
 
-	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
-		rc = -EINVAL;
-		goto unlock_out;
-	}
-
-	/* Get a handle on the pid of the session owner */
-	pid = etr_perf->pid;
-
-	/* Do not proceed if this device is associated with another session */
-	if (drvdata->pid != -1 && drvdata->pid != pid) {
-		rc = -EBUSY;
-		goto unlock_out;
-	}
-
-	/*
-	 * No HW configuration is needed if the sink is already in
-	 * use for this session.
-	 */
-	if (drvdata->pid == pid) {
+	/*  No HW configuration is needed if the sink is already in use. */
+	if (csdev->refcnt) {
 		csdev->refcnt++;
 		goto unlock_out;
 	}
 
 	rc = tmc_etr_enable_hw(drvdata, etr_perf->etr_buf);
 	if (!rc) {
-		/* Associate with monitored process. */
-		drvdata->pid = pid;
 		coresight_set_mode(csdev, CS_MODE_PERF);
-		drvdata->perf_buf = etr_perf->etr_buf;
 		csdev->refcnt++;
 	}
 
@@ -1792,11 +1761,7 @@ static int tmc_disable_etr_sink(struct coresight_device *csdev)
 	/* Complain if we (somehow) got out of sync */
 	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
 	tmc_etr_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
-	/* Reset perf specific data */
-	drvdata->perf_buf = NULL;
 
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 95e5623ea881..d63fa60ecce8 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -237,7 +237,6 @@ struct tmc_resrv_buf {
  * @shared_perf_buf: CPU-wide perf buffer shared by this ETR's owner.
  * @perf_buf_mutex: Protects shared_perf_buf and its reference count.
  * @sysfs_buf:	SYSFS buffer for ETR.
- * @perf_buf:	PERF buffer for ETR.
  * @resrv_buf:  Used by ETR as hardware trace buffer and for trace data
  *		retention (after crash) only when ETR_MODE_RESRV buffer
  *		mode is enabled. Used by ETF for trace data retention
@@ -272,7 +271,6 @@ struct tmc_drvdata {
 	/* Protects shared_perf_buf and its reference count. */
 	struct mutex		perf_buf_mutex;
 	struct etr_buf		*sysfs_buf;
-	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 };

-- 
2.43.0


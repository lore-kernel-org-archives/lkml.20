Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155E24756D8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147616; cv=none; b=UL1ExG94Bap739SNqj+AorF297HDOqz5irGNcyq8g6HN7HsgLQ+3cR94orwxfMIu2KGdYLr4OD2i/b8pYB7SXtWc4cQpcBnale+CzLttynjy72iAZx8zogAHkMuV09WMvJO1XU7TIoQe4uzeeSR15nTRcHVD3Vz1xmlGgXqN/d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147616; c=relaxed/simple;
	bh=zeJeL5XDwFKnxaDtN3xepC0DLuh0/U4ur1krG6QGZt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BcQ/DyhAKfk7VEGv86WleM7tVS5O7FMmD59E2sLjE//3pzJM3rnaNAK9sQqzGTDvZCC0hYBAqqqOx0Py7gDwm4HVvKlP1GJ8Ku19gS0WSaaPV6UvzjCpvp2B+POQZpkJH6SqVjPT0T1CKZ8GTe7vDeDut519v9pc7yhzenWiisA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tBhD7TkR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tBhD7TkR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so56970025e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147612; x=1792752412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbXD4ITQsH/XxraaXqLBFVLwXTKmDzFktFWBm9+M5nM=;
        b=tBhD7TkROPE5Xo/xP7n25LBlm6xiqGTTuxBjzZ15UfEEkkzwETLiSNxmaxX+Q8PR42
         SipNF4iTCCpfVRIKTS6YWhxllyfrr2K+R6kkI+slugH4Y62HrX0iCnPmn3PP+mw4glwI
         CBvzCSnAPcbKKyyV3ujgsTImcGjiiZrM93vDgZo9m/Yjo32BoOy8drNFuVXoUjbnUenr
         OA6O1cAw0hTjAWeTZHaAwHw6db66TVHKhKfVAAj9tSvclDYpIhKh2cOl+gmV6LHR5GG/
         Cm5ci+L3ULBcScDbsu9Yq0WLHV7MEiGOhs8oyrREYIV17BNvs/BUg5POC0HY9UyvRCSC
         3pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147612; x=1792752412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbXD4ITQsH/XxraaXqLBFVLwXTKmDzFktFWBm9+M5nM=;
        b=LUpzYj0LgD2nM7S65Wa6fOezNN1p+4M4P5enY/e6XLkV3eIxb3hJWO5i5T98+nuFUg
         UZUQtvHut6hvjtDHozuCO+enwp+9mCXIifSL92o81iDdNzjPOfZHuulbt1aNuNf0c36F
         iWlm/KNTiW/qlSHSsbXBXncLlUPKkvtaOlHuOI8ITI6G5Zr/27mhIuRdcbZoHf9rZX71
         WvvriCPGHePqoF0GunHlxLP7v24u8i4Op9v8vJ0DU5PcNjYeI27FjYg1GSRvnI8fYrZr
         hEmJ9iNxnhfNY4HnYbcRVx1vgn56dMBMKspCLaTPIoAWcDOcLkVJUUuk+rF8qYHl3v5g
         M7/A==
X-Forwarded-Encrypted: i=1; AKwUvBwSluhpxapqbZo5g++jIhl/nttyeEtlayo/3BD4EwxiegjTa3JNGkHsefSZUFjQtOCh/cXbqbY1Lh5mkNo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoh6pXmZcOPuvaGI40t22CpHYH2cfj1sXIjqc/9m+8wwMzbgD/
	fRtpAASmiYE9A1S/8WUYsToYf3XjA97nZ4nAs+ItNByXJxmE6dOGUeHfIxd3d9hwHhk=
X-Gm-Gg: AYBFou2dhqSFKm/lb1rzAFfX+h1JGSNgyXiVzd7NqIMgwXOCK3wI01qeI+cV/6+3R2B
	pkA6QKsWkxd0xr+2ZANeJK2dCAE8X7Nd5Bikr2SZmqmfrJm3NLrQB2+EwKdYH+4cRNTJ39S1iHy
	Ec4hPshIDz79vW89cYpR78eBuHoydB50WlDkQblrwUcDXhdWjiAcLWFLsXMRwZCVzzHaZ8VfkH/
	aI0OgxBINmfdPSLFOqippEqELVyzVvKujIfZ1R9J+1jfbcWPeHXX6dEgMpzwdFLeK5pmosOtGT9
	gbOEb1iMpxIPX2tZLXYEzClORkdAxtLYhNbfEIYieKrb+PR+tZSCL8tg4Z1C0h4orRpD2BS4Iwo
	WLmi8LdZdEqdyoNU46ReqsU7q+Y2WLr65ZWYYOHYr/JvnSM8A9NLRHqn1Y/qQGPrKS7MdhqC3jT
	ztAlniOstUpJjGJ+yOOgTG0vYD/c6UTGRkIhNlV82BHB+8j/lE+D4xSOtENDM5ijhle/gDX4s3o
	w==
X-Received: by 2002:a05:600c:8105:b0:4a1:775b:5eb2 with SMTP id 5b1f17b1804b1-4a18e48362emr469338195e9.13.1792147612021;
        Fri, 16 Oct 2026 03:46:52 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:51 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:18 +0100
Subject: [PATCH v4 08/10] coresight: tmc-etf: Remove sharing guards from
 ETF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-8-dedf961aca0e@linaro.org>
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

Remove the redundant PID tracking from ETF and the TMC driver state.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |  2 --
 drivers/hwtracing/coresight/coresight-tmc-etf.c  | 22 ++--------------------
 drivers/hwtracing/coresight/coresight-tmc.h      |  4 ----
 3 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 864da1eea52c..e3c94dca1152 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -800,8 +800,6 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
 	drvdata->config_type = BMVAL(devid, 6, 7);
 	drvdata->memwidth = tmc_get_memwidth(devid);
-	/* This device is not associated with a session */
-	drvdata->pid = -1;
 	drvdata->etr_mode = ETR_MODE_AUTO;
 
 	if (drvdata->config_type == TMC_CONFIG_TYPE_ETR) {
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 8882b1c4cdc0..e2204a47c1f6 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -250,11 +250,9 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
 				    struct coresight_path *path)
 {
 	int ret = 0;
-	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = path->handle;
-	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	do {
@@ -270,31 +268,18 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
 			break;
 		}
 
-		/* Get a handle on the pid of the process to monitor */
-		pid = buf->pid;
-
-		if (drvdata->pid != -1 && drvdata->pid != pid) {
-			ret = -EBUSY;
-			break;
-		}
-
 		ret = tmc_set_etf_buffer(csdev, handle);
 		if (ret)
 			break;
 
-		/*
-		 * No HW configuration is needed if the sink is already in
-		 * use for this session.
-		 */
-		if (drvdata->pid == pid) {
+		/*  No HW configuration is needed if the sink is already in use. */
+		if (csdev->refcnt) {
 			csdev->refcnt++;
 			break;
 		}
 
 		ret  = tmc_etb_enable_hw(drvdata);
 		if (!ret) {
-			/* Associate with monitored process. */
-			drvdata->pid = pid;
 			coresight_set_mode(csdev, CS_MODE_PERF);
 			csdev->refcnt++;
 		}
@@ -351,8 +336,6 @@ static int tmc_disable_etf_sink(struct coresight_device *csdev)
 	/* Complain if we (somehow) got out of sync */
 	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
 	tmc_etb_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
 
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
@@ -432,7 +415,6 @@ static void *tmc_alloc_etf_buffer(struct coresight_device *csdev,
 	if (!buf)
 		return NULL;
 
-	buf->pid = task_pid_nr(event->owner);
 	buf->snapshot = overwrite;
 	buf->nr_pages = nr_pages;
 	buf->data_pages = pages;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index d63fa60ecce8..36b54ebf30ba 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -217,9 +217,6 @@ struct tmc_resrv_buf {
  * @crashdev:	specifics to handle "/dev/crash_tmc_xyz" entry for reading
  *		crash tracedata.
  * @spinlock:	only one at a time pls.
- * @pid:	Process ID of the process that owns the session that is using
- *		this component. For example this would be the pid of the Perf
- *		process.
  * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry
  * @stop_on_flush: Stop on flush trigger user configuration.
  * @buf:	Snapshot of the trace data for ETF/ETB.
@@ -252,7 +249,6 @@ struct tmc_drvdata {
 	struct miscdevice	miscdev;
 	struct miscdevice	crashdev;
 	raw_spinlock_t		spinlock;
-	pid_t			pid;
 	bool			reading;
 	bool			stop_on_flush;
 	union {

-- 
2.43.0


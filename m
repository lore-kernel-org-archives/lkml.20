Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D8647CA98
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147619; cv=none; b=HKDqFy/3gGy2j+FlWlnd+4ANtbFTHgOINiQgsYP67qMkEoc1qA7GXzQ6U0mqH3Gf1eNB+Wy90s3a0iJ4MDsa0TYV3yH2cwbchsX0LG3TMqJlfLqZGWz6p001HLuWPo+sTBh8xJzCBrDCxyO0CiZK4AzOZ6fWOOm5XXzQQO1LzFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147619; c=relaxed/simple;
	bh=UqJLByqPdHZf2e+d+ov7J4pq5DgrJ4jNyFIUD/SbJWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mdF/KdpLD338Yx+WYAfdy/vritk2ol9eyuL8kas1UUIeI8nkGlbsWbywRwzHhh0nvi3R1Kic7PAnwPZTPOUMQo9ENnlOOc0z3TXhvEGlbDutboS68D5GNvVd5Yl/XeBODEZCChbjSXKWiqv3iHik2/l+069FkDUSLDjzOM8Ggus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aX9xFkpK; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aX9xFkpK"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1321855f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147613; x=1792752413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGm4SLdWsex3TDK4XDh52mYFdu6ojIEx0Vd3ILXjiGU=;
        b=aX9xFkpKJgC5fWEFi57GAvvRFe9yo1ZF8INJF5Af1dm83BClN/nXeR5ZKDQIwA5tc2
         Y127/IjzrNLmz0M9d7+UZbkYiBHrmun1U1id6GqbTph9EtEdM9fPeKDTAn4sO/s8fTag
         kp54CJG9o/4xXcxLJTUQZMFTM2eVDjxYvXQqFmqc4OudK0UqOLfw7TLVVn9pzUOLXXNj
         wz+DbyTo9VbpHzH/ztmJFwzgFeIYHvoSYSv2Y2suWS7T46GVw/3NR5XxqlbZRuS27+Er
         0CcnjjWct7rJJHEFpz9qSwIwvaVbzRDUx1sAeLzxNOKKBIXPfLTz3ZceyIajaFIFnJni
         S5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147613; x=1792752413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGm4SLdWsex3TDK4XDh52mYFdu6ojIEx0Vd3ILXjiGU=;
        b=sFhWuPx1PWmJiry/oBSk+tjLaja5dPSe3iDyS0F0NdEvsfvVOS7Z1GqbBgT+bfggsg
         4YDYaYZ0JpHrhiCDWdGl7mvdGqAmDjWiBahtYS8K063/YCLmC1tkfcKrWHuM6B75hwvI
         r/qLMS6+PfD1h60kk/qH1/G2nd6tMnr5ogKBWollbIC3nWwkHsBHwjpaDl8M+hIEpWRe
         9GoleReMdUGyJWE2LO8UaacmVKW3HBt6KBodEavwcw6RGeFLc7oUjV62Sf8k7I0yWZ+0
         TnNHPJQtb7NMi4+wtEgHc6vaH3mjzhDlMh9v4eOSWGAcrCPzCLVf0Ttu0rJDP/Dr8BWJ
         zlYA==
X-Forwarded-Encrypted: i=1; AKwUvBzBd47Crbll8w+q1sWhces8ld6T1O8JWf0wpf2hL8s+Wm2dojq82li5QBoT95V+IjCi3RuvmYeuaBMVD44=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ14fdRYAPALcVleV1/RcYBeskNNt0U9vt82o7BvyoJo5vY+GBM
	casOnzBFd2Lq3wHfo8pdAzkN5Kt4JLgwz5SToqpNhmOyTWaFnmDl13eZ8Be+OnTzjKY=
X-Gm-Gg: AYBFou02kpiub3C5u7Ynqox7f+KAPWIuur2dRxbaHiE1K0HM/o8pipZ7dyJr16yafSx
	MthLO+5hL5FPRNzH9d+R6d9pL8iVnR5wlcHf52LWXMqXBCCmtddYRUKWHhjM7Kt6THhAXi7460D
	GUHA4Sv6wnZ40bFnJ1n9Pw1kOTLQUr1ZysIDeNQ3dvQ6+T3KUBExY1TbuCoTTIFmzGg8aCbFrQL
	GTPgFcBGDQieADk/BIcDiLyWmTx/53D+v4A3xT2N77+XrFyjq553zRAGzzjO8sBVd6Nn1P27S5s
	RN5J45P3WzDpKCNe5zZkAwQdp0ZmwmfxQ3bY7tuaOUYcdTVl2t1Q3wfYhxdSAUW7EQ5K/vGBXOp
	hXFYKb2G92YNwmx1G1VxLIL1k/I686A176qsIthst/CmQYEYtZa1GYgPmIde2/TCZnRHw55b9zX
	7kHwZ3GY2F86ZCVYoBUDty9rHa6W403+yQ1mWm4Y2R2L7x/6mdNQVCSoFisL+3kygs3bgsC3J3M
	w==
X-Received: by 2002:a5d:64cc:0:b0:48d:f7ef:cd1d with SMTP id ffacd0b85a97d-48df959a7a5mr7175683f8f.9.1792147613239;
        Fri, 16 Oct 2026 03:46:53 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:52 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:19 +0100
Subject: [PATCH v4 09/10] coresight: etb10: Remove sharing guards from
 ETB10
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-9-dedf961aca0e@linaro.org>
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

Remove the redundant PID tracking from ETB10 and its buffer allocation.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etb10.c | 28 ++-------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index a827f76b8144..75c5a71d8d68 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -71,8 +71,6 @@
  * @miscdev:	specifics to handle "/dev/xyz.etb" entry.
  * @spinlock:	only one at a time pls.
  * @reading:	synchronise user space access to etb buffer.
- * @pid:	Process ID of the process being monitored by the session
- *		that is using this component.
  * @buf:	area of memory where ETB buffer content gets sent.
  * @buffer_depth: size of @buf.
  * @trigger_cntr: amount of words to store after a trigger.
@@ -84,7 +82,6 @@ struct etb_drvdata {
 	struct miscdevice	miscdev;
 	raw_spinlock_t		spinlock;
 	atomic_t		reading;
-	pid_t			pid;
 	u8			*buf;
 	u32			buffer_depth;
 	u32			trigger_cntr;
@@ -168,11 +165,9 @@ static int etb_enable_sysfs(struct coresight_device *csdev)
 static int etb_enable_perf(struct coresight_device *csdev, struct coresight_path *path)
 {
 	int ret = 0;
-	pid_t pid;
 	unsigned long flags;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = path->handle;
-	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
@@ -182,19 +177,8 @@ static int etb_enable_perf(struct coresight_device *csdev, struct coresight_path
 		goto out;
 	}
 
-	/* Get a handle on the pid of the process to monitor */
-	pid = buf->pid;
-
-	if (drvdata->pid != -1 && drvdata->pid != pid) {
-		ret = -EBUSY;
-		goto out;
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
 		goto out;
 	}
@@ -210,8 +194,6 @@ static int etb_enable_perf(struct coresight_device *csdev, struct coresight_path
 
 	ret = etb_enable_hw(drvdata);
 	if (!ret) {
-		/* Associate with monitored process. */
-		drvdata->pid = pid;
 		coresight_set_mode(drvdata->csdev, CS_MODE_PERF);
 		csdev->refcnt++;
 	}
@@ -361,8 +343,6 @@ static int etb_disable(struct coresight_device *csdev)
 	/* Complain if we (somehow) got out of sync */
 	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
 	etb_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
@@ -383,7 +363,6 @@ static void *etb_alloc_buffer(struct coresight_device *csdev,
 	if (!buf)
 		return NULL;
 
-	buf->pid = task_pid_nr(event->owner);
 	buf->snapshot = overwrite;
 	buf->nr_pages = nr_pages;
 	buf->data_pages = pages;
@@ -754,9 +733,6 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!drvdata->buf)
 		return -ENOMEM;
 
-	/* This device is not associated with a session */
-	drvdata->pid = -1;
-
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata))
 		return PTR_ERR(pdata);

-- 
2.43.0


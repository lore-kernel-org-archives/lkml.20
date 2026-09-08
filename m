Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13CD35C680
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884179; cv=none; b=dVM1xzKWN03GpPWew/fKVo26N27A8vW4hS95HxeSGrRt9u9k7jN9XH+2U8QXW1btG6hq2De0nj5mXxNrvpSAyq3fOm/ZPk/S3R2McasRLlRvA9fRXXst3lI//MPOd9NK7TWzjNuez8IeruT5mZ29UAJlxZNvyHL2Nx6K/TE6OIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884179; c=relaxed/simple;
	bh=W86j1xmuLlz2bk41yXWceX/GDhYI2NYm1k/krLylX4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PG3vkahnlpvGMtqA8ZAA4EhZ6BbFwU8qr/tfXoTy8+KtJqgHCPu/5VbX349bGBqD8ID+f9oP9+Sz7H/l/SSQYdbH5vC742KHkSAX+ypFZKPpEEcPJ0MBSArfTWhc2fDZgR6YrI+4qgr7C3eOQEyiU2/C+hLYm73mg+1pglGMHO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Qh8sgSR2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Qh8sgSR2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 355081476;
	Tue,  8 Sep 2026 09:16:13 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76E233F7B4;
	Tue,  8 Sep 2026 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788884176; bh=W86j1xmuLlz2bk41yXWceX/GDhYI2NYm1k/krLylX4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qh8sgSR2twbUctxTPL7/+iYnMnoN4URVKwArsPBGM/VyK9vQf92Fce8nkCqEgTUB/
	 G9DhPh4RC259GqtINnAUa3906GZ7KK1Y2aAXUMv6Cxzua6FF23/iK06U2Rkz8n560k
	 B/CHzhK2DuOl73avp3FjFYsFMewTAP/L28DTPpJo=
Date: Tue, 8 Sep 2026 17:16:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: yingchao <dengyingchao@kylinsec.com.cn>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Miaoqian Lin <linmq006@gmail.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	qinyungao@kylinsec.com.cn
Subject: Re: [PATCH] coresight: syscfg: fix deadlock on device registration
 failure
Message-ID: <20260908161614.GA200420@e132581.arm.com>
References: <604ED754D4669F40+20260825014717.2346-1-dengyingchao@kylinsec.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <604ED754D4669F40+20260825014717.2346-1-dengyingchao@kylinsec.com.cn>

On Tue, Aug 25, 2026 at 09:47:17AM +0800, yingchao wrote:

> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 2bfdd7b45e49..d0e7e4720e46 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -1210,8 +1210,14 @@ static int cscfg_create_device(void)
>  	dev->init_name = "cs_system_cfg";
>  
>  	err = device_register(dev);
> -	if (err)
> +	if (err) {
> +		/* put_device() triggers cscfg_dev_release() which takes
> +		 * cscfg_mutex, so drop the lock first to avoid deadlocking.
> +		 */
> +		mutex_unlock(&cscfg_mutex);
>  		put_device(dev);
> +		return err;
> +	}

As module init and exit are serialized by the kernel, I don't think we
need the mutex to protect the allocation and freeing of cscfg_mgr.

The mutex should only be used for exclusively access cscfg_mgr.
So how about the change below?

---8<---

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49..2dd0b29f44e4 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -1173,27 +1173,21 @@ struct device *cscfg_device(void)
 /* Must have a release function or the kernel will complain on module unload */
 static void cscfg_dev_release(struct device *dev)
 {
-	mutex_lock(&cscfg_mutex);
 	kfree(cscfg_mgr);
 	cscfg_mgr = NULL;
-	mutex_unlock(&cscfg_mutex);
 }
 
 /* a device is needed to "own" some kernel elements such as sysfs entries.  */
 static int cscfg_create_device(void)
 {
 	struct device *dev;
-	int err = -ENOMEM;
-
-	mutex_lock(&cscfg_mutex);
-	if (cscfg_mgr) {
-		err = -EINVAL;
-		goto create_dev_exit_unlock;
-	}
+	int err;
 
 	cscfg_mgr = kzalloc_obj(struct cscfg_manager);
 	if (!cscfg_mgr)
-		goto create_dev_exit_unlock;
+		return -ENOMEM;
+
+	mutex_lock(&cscfg_mutex);
 
 	/* initialise the cscfg_mgr structure */
 	INIT_LIST_HEAD(&cscfg_mgr->csdev_desc_list);
@@ -1204,6 +1198,8 @@ static int cscfg_create_device(void)
 	cscfg_mgr->load_state = CSCFG_NONE;
 	raw_spin_lock_init(&cscfg_mgr->sysfs_store_lock);
 
+	mutex_unlock(&cscfg_mutex);
+
 	/* setup the device */
 	dev = cscfg_device();
 	dev->release = cscfg_dev_release;
@@ -1213,8 +1209,6 @@ static int cscfg_create_device(void)
 	if (err)
 		put_device(dev);
 
-create_dev_exit_unlock:
-	mutex_unlock(&cscfg_mutex);
 	return err;
 }

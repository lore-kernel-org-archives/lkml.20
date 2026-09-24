Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1E73EEAF8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267049; cv=none; b=Y0tGdX5gEh5wl5YlUR8C0bLMe5Az136piMNrakoeKJM4AygwaENP60RBFCowmIHDoSkfXZltaEIRFHiEfzBurT8aYcrcRXzGTTPP6xN+EdtTGmyS0wJ9Ho91IGfJFBp4zD+mPiMB2kDHvsgQih+LFkTI/7lIiUEH7gsJm3TicZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267049; c=relaxed/simple;
	bh=nYWPMepafEr1szvqd75pqzJehqgl5uIJn0bLATvvyi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUzp0NzO+7yotLoCWy12vxnMhv6diaFZFFF5q6gf34QTX+9PxR9pbMSHvS+wUGiH/NWd5xb0zTUWVpWylC3oHcRfBbIT2dpurSp0pq5qEP6pene3d4pIvmI0y4cNmCxV4S4SB9TJ0VZBQdnukk2Cnu5WE7HcIKNA+ypVjyOfgWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MGnDWvms; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MGnDWvms"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A827152B;
	Thu, 24 Sep 2026 09:24:03 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52F123F86C;
	Thu, 24 Sep 2026 09:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790267046; bh=nYWPMepafEr1szvqd75pqzJehqgl5uIJn0bLATvvyi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MGnDWvmsse7Nfi8NDxS5JR16IrOZXu8WDUyKnyIAqx6L3CmRlXs5W5MmZFu76yY6z
	 xYR/DpErVu/QRHrUWKH+fBPvVR9MCmvadRojn/hyvPl+WD0TJh4eE4IP2EYEzLlVU7
	 FN8dPHXd1ekC9DrpKWjF6XvlxzfEWz1KVM4gid7c=
Date: Thu, 24 Sep 2026 17:24:04 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <dengyingchao@kylinsec.com.cn>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	qinyungao@kylinsec.com.cn
Subject: Re: [PATCH v2 1/1] coresight: syscfg: fix deadlock on device
 registration failure
Message-ID: <20260924162404.GN200420@e132581.arm.com>
References: <B16F90D29FAA2B3E+20260914074524.1694-1-dengyingchao@kylinsec.com.cn>
 <6CC680FFAC60931F+20260914074900.1711-1-dengyingchao@kylinsec.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6CC680FFAC60931F+20260914074900.1711-1-dengyingchao@kylinsec.com.cn>

On Mon, Sep 14, 2026 at 03:49:00PM +0800, Yingchao Deng wrote:
> cscfg_create_device() calls put_device() on the error path while holding
> cscfg_mutex.  If device_register() fails, put_device() drops the last
> reference and invokes cscfg_dev_release(), which takes cscfg_mutex again,
> deadlocking.
> 
> Module init and exit are serialized by the kernel, so cscfg_mutex is not
> needed to protect the allocation and freeing of cscfg_mgr.  Remove the
> mutex from cscfg_dev_release() and take it only while cscfg_mgr fields
> are being accessed.
> 
> Fixes: 199380decc5f ("coresight: configfs: Fix unload of configurations on module exit")
> Suggested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>

For this patch:

Reviewed-by: Leo Yan <leo.yan@arm.com>

Sashiko reported an issue for null pointer dereference if configfs
init fails fails [1]. It is good to fix it using a separate patch:

@@ -1299,8 +1299,10 @@ int __init cscfg_init(void)

        /* initialise configfs subsystem */
        err = cscfg_configfs_init(cscfg_mgr);
-       if (err)
-               goto exit_err;
+       if (err) {
+               device_unregister(cscfg_device());
+               return err;
+       }

        /* preload built-in configurations */
        err = cscfg_preload(THIS_MODULE);

@Yingchao, do you mind to work out a formal patch for this?

Thanks,
Leo

[1] https://sashiko.dev/#/patchset/6CC680FFAC60931F%2B20260914074900.1711-1-dengyingchao%40kylinsec.com.cn

Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783EC4E323C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961776; cv=none; b=XVGYdq4ZOBUEEeTmHBAokVPiRCSip4J5O2wPNCv8Zf6n5uTyIP1dHN6EZzKb0MeYhjnCb7aDV/1QvsbrCXS7Qezgcsmtwv+bWwby5tyC1QXIbv5aqWcN7jZZLEel7lhey2JmxTIupNdnQwXVamJKSgX4l71YcehtANl5N2sUBLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961776; c=relaxed/simple;
	bh=YV1fKXXlbrVEfg5rJqDQn8ml/2AWIsJ5rBnjXuO+yQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=so/VwXC7l4Z0lXo6iwHORv/WrLg3PRDLvLsj3STnAALHkgv/N7/8f5z/W9ORcGbaGPYygEPCrkN3cZDEby+Y7k/SzDrJmIBD0i/efClNFNbOYYnfivupiw0u0o1KsoroBe0pyJuf4uUtzee/MObP2NrpzHhPl08GZROgKFirx+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=anuOlyj4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="anuOlyj4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F8E11476;
	Fri,  2 Oct 2026 10:22:47 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 412C43F85F;
	Fri,  2 Oct 2026 10:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790961771; bh=YV1fKXXlbrVEfg5rJqDQn8ml/2AWIsJ5rBnjXuO+yQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=anuOlyj4w7vvlNbQeAHudLgHTr+uuwN88+w9QXN87X6poDNv5/zb8dnNKju7JT/pc
	 hVr/b6srJCTTiRfidK+3uz/EOFXIdmGWMc7TWAYaBr1/+HHxJZrg+AAOGz8X80Yo9+
	 wh3gT7I54GCLgYcoAA1H0gBVoZu65kPZh+h+JOCk=
Date: Fri, 2 Oct 2026 18:22:48 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v12 03/14] coresight: etm3x: prohibit modifying cntr_val
 and reset while session is enabled
Message-ID: <ar_oaMevzmxSxNwN@e129823.arm.com>
References: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
 <20260924-separate_etm_cfg_v2-v12-3-a2b41d2f7c2b@arm.com>
 <20260924175814.9AFC01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924175814.9AFC01F000FF@smtp.kernel.org>

On Thu, Sep 24, 2026 at 05:58:14PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] coresight: TOCTOU race bypasses session-enabled check in sysfs stores
> --
> 
> commit 0c7e96565d9330c7133fb31d646be9050f666c48
> Author: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> coresight: etm3x: prohibit modifying cntr_val and reset while session is enabled
> 
> This commit prevents cntr_val and reset from being modified while a
> Coresight ETM session is enabled. Changes to cntr_val would be lost when
> the session is disabled, and reset should not be invoked during an active
> session.
> 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > index b3c67e96a82a4..cdb70a4382eb8 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > @@ -75,6 +75,10 @@ static ssize_t reset_store(struct device *dev,
> >  	if (ret)
> >  		return ret;
> >  
> > +	if (IS_ERR_OR_NULL(drvdata->csdev) ||
> > +	    coresight_get_mode(drvdata->csdev))
> > +		return -EBUSY;
> > +
> 
> [Severity: Medium]
> Is there a race condition here since the mode check happens outside the
> spinlock?
> 
> If thread A executes this check and sees the mode is disabled, thread B
> could then enable tracing (acquiring drvdata->spinlock, applying config to
> hardware, and updating the mode). 
> 
> When thread A proceeds, it will acquire the spinlock and zero the
> configuration while the hardware is actively using it. When thread B later
> disables tracing, it would partially overwrite the zeroed configuration with
> hardware register values.
> 
> Should the coresight_get_mode() check be moved inside the spinlock to
> prevent this time-of-check to time-of-use race?

TBH, reset interface seems awful and the same problem already pre-exists.
But this kinda was relief we don't think user wouldn't try to enable
before finishing the reset and return its result.

So this is ignorable.

> 
> >  	if (val) {
> >  		spin_lock(&drvdata->spinlock);
> >  		memset(config, 0, sizeof(struct etm_config));
> 
> [ ... ]
> 
> > @@ -744,6 +748,9 @@ static ssize_t cntr_val_store(struct device *dev,
> >  	ret = kstrtoul(buf, 16, &val);
> >  	if (ret)
> >  		return ret;
> > +	if (IS_ERR_OR_NULL(drvdata->csdev) ||
> > +	    coresight_get_mode(drvdata->csdev))
> > +		return -EBUSY;
> 
> [Severity: Medium]
> Does this have the same vulnerability as reset_store()?
> 
> The configuration could be corrupted if tracing is enabled by another thread
> immediately after coresight_get_mode() returns but before the spinlock is
> acquired.
> 
> >  
> >  	spin_lock(&drvdata->spinlock);
> >  	config->cntr_val[config->cntr_idx] = val;

Same above and others

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com?part=3

-- 
Sincerely,
Yeoreum Yun

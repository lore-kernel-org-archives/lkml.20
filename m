Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B23503BD3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961400; cv=none; b=tIzpcEvUaeoRWIoJD2tbcJUm7ZCaPeTzuRUGGMoXLBy20H6fF4XDOi6xwImFJzT4Jo36hs884RPlmIQ7Ws0Urs/uiDl3aLW64ji0Uc7HgSyKp7HGlZ/keZD7/n56fi6sLcXDrevQCUH7de+Z+i4s9BBeriMsh0p+aUTLYXp8dbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961400; c=relaxed/simple;
	bh=T6CKeBBx8flQuU3XrGqXV2odifqAKl02Qr6/RssD/Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vvr+ENsI3T410yOeOwnGbj0tOZ6CETrYfD36ohqGMaDXocuoNIYqdlEBw/F0maOqVGpx1SiPYGIqfV21+riH8ZxxJ2xYESKZ3H1yGCU4l7hM/Wf1Y/Fzb57MeVePuseVIfiAfKcZ9ULxR522Q35MZ87IwvOpZubbG0mDpSQT4yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=knkqwtDu; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="knkqwtDu"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B0F12F;
	Fri,  2 Oct 2026 10:16:25 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AF7A3F85F;
	Fri,  2 Oct 2026 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790961389; bh=T6CKeBBx8flQuU3XrGqXV2odifqAKl02Qr6/RssD/Kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knkqwtDua4ThvZg4PyoQ8qxOjncOgL6mm+568cnhz2SBBSjvKxOH7KgRna+bi1A2a
	 0/JrbzAH3GNumZVl6gE6KJhdGb3ycUMSSOzuzMHSF2/9gOc1A1Cvnu6uDf2QRgZOyr
	 BxrsoX/GNokA8rYU3peTRCmItbF4H+d1oD448Qp0=
Date: Fri, 2 Oct 2026 18:16:26 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v12 14/14] coresight: etm3x: rename drvdata->config to
 sysfs_config
Message-ID: <ar_m6u-csqW58mSc@e129823.arm.com>
References: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
 <20260924-separate_etm_cfg_v2-v12-14-a2b41d2f7c2b@arm.com>
 <20260924183606.D62FA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924183606.D62FA1F000FF@smtp.kernel.org>

On Thu, Sep 24, 2026 at 06:36:06PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] coresight: missed variable rename in etm_disable_sysfs()
> --
> 
> commit 675c6e2b645cb58619c01f29029e27576619cf41
> Author: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> coresight: etm3x: rename drvdata->config to sysfs_config
> 
> This commit renames the drvdata->config variable to sysfs_config to clarify
> its purpose. It also intends to rename local variables referring to this
> configuration for better readability.
> 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> > index 0cad9ecb49b61..67f1b71de8811 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> [ ... ]
> > @@ -627,7 +627,7 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
> >  {
> >  	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> >  	const struct etm_caps *caps = &drvdata->caps;
> > -	struct etm_config *config = &drvdata->config;
> > +	struct etm_config *config = &drvdata->sysfs_config;
> 
> [Severity: Low]
> This isn't a bug, but should this local variable also be renamed to
> sysfs_config?
> 
> The commit message mentions "also rename local config variables to
> sysfs_config where they refer to drvdata->sysfs_config", but it appears
> this instance in etm_disable_sysfs() was missed and remains named config.

That's one thing i missed. I'll post in next version.

-- 
Sincerely,
Yeoreum Yun

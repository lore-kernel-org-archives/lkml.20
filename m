Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D6A469823
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126135; cv=none; b=Z5CI43c5BxIf9a+dP9eWAYEj+/7/FMLebjLbQ4x33qPFNo4Fs5bHRrAfVMJsg2adeVNHl6QHXsPyq52Hz7+OSBK8PTYRtQ8y1p3PAT/O2F0lGOrm0HPWsKePTKgwMCQGyX8u7PuXaGOgNv4ZxzolnKvrOunhqAdyuWnDasKBW0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126135; c=relaxed/simple;
	bh=Rwn2F3+2n6p6ln3MMbialu17uc2W2Q7eFYsx0lbrY58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7umHzI57Z/dTkAHuhJVHxm4OAC5e149wkZs/f9bX+gCcEiE24Ywtgx0l8Rngph6OQIciK/y2SZ9IKVdsOVLN01jH+S3dR+LdtX5bTSn2Wd10LtNNebBTxgoT9tX1kraSSm423tFiV7RArwUQlNPQBLIqMjWQVYQAILzpybw81I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=g029RRFJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="g029RRFJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7F72143D;
	Fri, 11 Sep 2026 04:28:35 -0700 (PDT)
Received: from e129823.arm.com (unknown [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F1B63F86C;
	Fri, 11 Sep 2026 04:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789126119; bh=Rwn2F3+2n6p6ln3MMbialu17uc2W2Q7eFYsx0lbrY58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g029RRFJBw0PXPlQjUVNaZ6Pi/G/HChtZR8JLI24Aat1as11wyw1BrAh36AYo7sN1
	 7K8wD1gCvAq0sO6rsoexYnqtPhTOrNxjb5E8n0DSIK9MLL+X8DbhXd4pThMZSLlnVk
	 YVnnCzW+6EHCiFt3MYjmKBYUKJ2VqfkqFHtobj48=
Date: Fri, 11 Sep 2026 12:28:35 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/8] coresight: etm3x: fix inconsistencies with sysfs
 configuration
Message-ID: <aqPl47W4bk4lsXMw@e129823.arm.com>
References: <20260911-separate_etm_cfg_v2-v10-0-1b715d95927a@arm.com>
 <20260911-separate_etm_cfg_v2-v10-2-1b715d95927a@arm.com>
 <20260911110729.EBCCD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911110729.EBCCD1F000FF@smtp.kernel.org>

On Fri, Sep 11, 2026 at 11:07:29AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Sysfs interface for post-trace hardware state returns stale data due to active_config separation (ABI Breakage).
> --
> 
> commit 729c4f4f776d1cbadf2571ee6a6363ece19f7a91
> Author: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> coresight: etm3x: fix inconsistencies with sysfs configuration
> 
> This commit resolves sysfs configuration inconsistencies by separating the
> configuration state into an active_config (for the current session) and config
> (the configuration set via sysfs).
> 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> > --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> 
> [ ... ]
> 
> > @@ -565,7 +569,7 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
> >  static void etm_disable_hw(struct etm_drvdata *drvdata)
> >  {
> >  	int i;
> > -	struct etm_config *config = &drvdata->config;
> > +	struct etm_config *config = &drvdata->active_config;
> >  	struct coresight_device *csdev = drvdata->csdev;
> >  
> >  	CS_UNLOCK(drvdata->csa.base);
> 
> [Severity: High]
> Does this introduce a regression in the sysfs interface for post-trace
> hardware state analysis?
> 
> By switching to active_config here, the post-trace sequencer and counter
> states are saved into drvdata->active_config during etm_disable_hw():
> 
> drivers/hwtracing/coresight/coresight-etm3x-core.c:etm_disable_hw() {
> 	...
> 	/* Read back sequencer and counters for post trace analysis */
> 	config->seq_curr_state = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
> 
> 	for (i = 0; i < caps->nr_cntr; i++)
> 		config->cntr_val[i] = etm_readl(drvdata, ETMCNTVRn(i));
> 	...
> }
> 
> However, when tracing is disabled, userspace reads from the sysfs interface
> which still returns data from the stale drvdata->config:
> 
> drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:seq_curr_state_show() {
> 	...
> 	val = config->seq_curr_state;
> 	...
> }
> 
> Will this cause sysfs reads for seq_curr_state and cntr_val to return
> stale or zeroed data instead of the actual hardware state?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260911-separate_etm_cfg_v2-v10-0-1b715d95927a@arm.com?part=2

This seems valid review and I think the cntr_val and seq_current_state
shouldn't be modified via sysfs while the mode is taken by sysfs.

I'll fix this in later version for etm4 and etm3.

-- 
Sincerely,
Yeoreum Yun

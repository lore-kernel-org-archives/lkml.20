Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261043E49C3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946109; cv=none; b=KQL5aI1DyuaBXkqddswLICqWrJ2IQj1PWcS2UvC8LkRzBQxn73pWYAO4+yazAKKDHrwTa9/is4fHtGObrfaLRk+Cuq1XYtMlE9ddbyITVf6dmLFXn/SodjYiAvvajZeEJFYQgtdYbMF/B4ooXO5hfdREKLQcvq3ehBEzN56hE5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946109; c=relaxed/simple;
	bh=prBHfafX4xJGVIFwqDLDyAlGiDruB1/Xr0x5BUzkQg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnIg+3kie38NXzLi28XrHkjCj584bjwclEX1ba0mNJFcKS1BzJE6WlnTC5vqP/b7wOhERNgMvOllxJUggeZSKftkzatZzBB8g4Sx5boBHV2NWmwbRa2szxCaGgucE9NPl8/Jy/0jWrsRvZ5DrPViBiRN3vyzOjA+AfhL8Y9XG5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BbUNzyz2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BbUNzyz2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDA9B1576;
	Wed,  9 Sep 2026 02:28:15 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18A063F528;
	Wed,  9 Sep 2026 02:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788946099; bh=prBHfafX4xJGVIFwqDLDyAlGiDruB1/Xr0x5BUzkQg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BbUNzyz2Ny1yvMPXzKTpg43CCE/Pk8wT85L8tLMbT7JYrVy/3nRWdGl/qVVMPR7+G
	 P6DLLN1GlWSkGHyWBoXkfOgrP7nMDLqw/I9IcxjRRbPkNMc4ogxQT/myyFBE3meNJb
	 Joz6hHTPn4tiS2Gf/Fj48Be5n3p3Knee9CqvwY9g=
Date: Wed, 9 Sep 2026 10:28:17 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] coresight: Fix clock refcount imbalance on platform
 probe failure
Message-ID: <20260909092817.GC200420@e132581.arm.com>
References: <20260907-fix-clk-issue-v1-1-efe81fa2b697@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-fix-clk-issue-v1-1-efe81fa2b697@oss.qualcomm.com>

Hi Jie,

Thanks for fixing! It is shame that my single patch caused issues both
in driver's probe and remove - I have to admit that I don't understand
runtime PM's state machine.

TBC, this patch only fixes probe. The driver's remove is fixed in:
https://lore.kernel.org/linux-arm-kernel/20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com/

The series above and this patch should be picked up together so can
have complete fix.

> The probe wrapper then unconditionally calls pm_runtime_put()
> regardless of whether the inner probe succeeded, so on failure this
> also fires runtime_suspend() and disables the same clocks a first
> time.

pm_runtime_put() can be used for success case, but for the failure
case, we should disable the runtime PM but not release reference:
https://docs.kernel.org/power/runtime_pm.html#runtime-pm-initialization-device-probing-and-removal

> @@ -632,11 +632,14 @@ static int catu_platform_probe(struct platform_device *pdev)
>  	pm_runtime_enable(&pdev->dev);
>  
>  	ret = __catu_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_put_noidle(&pdev->dev);
>  		pm_runtime_disable(&pdev->dev);

Nitpick: please reverse the sequence between pm_runtime_put_noidle()
and pm_runtime_disable(). As we need to first disable runtime PM for
the device, then release usage reference.

Since the driver core will reset device's active state, AI told me that
calling pm_runtime_set_suspended() is redundant. It is still good to
explicitly call it for bookkeeping. This can be aligned with the change
in driver remove.

Thus, please update the flow:

        pm_runtime_disable(&pdev->dev);
        pm_runtime_set_suspended(dev);
        pm_runtime_put_noidle(&pdev->dev);

With the update:

Reviewed-by: Leo Yan <leo.yan@arm.com>

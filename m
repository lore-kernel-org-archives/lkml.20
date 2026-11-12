Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503630;
	b=wBmYlJcfD4MYV6iB08r+9IF9prRC5DxvlIwKbd7jhVWeJIyIiS/kM+90MJ0u3iPPtBjb
	 OnypoCo+4PUfUCQnrpX7xdllg3sqQl4C+fXA7P46bi1QydSlfqGMZiEikbCBkXcJq+DN3
	 71b7WcyHipBK15GIzvTXaamL/eTvfjV0BGdCSF6Q2lm6sWHG3RGeJvaSYmbfODtmxv/mH
	 abbzvHewPKbMC5tsrYhGlNMcFrD2w05bLDkte97uB2kERG+e8q9iC6BNWsr2o1UlqVsdt
	 aP0LOT3Dwu5AhATkVDRLmVe2ojmMNSue8dDleYG7eToGEiyZd4+d82a1o/Sr0QGfvMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503630;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lNd975OAog8I2j1v0LJVXqM6wE50rydPow/biRsPkN8=;
	b=fMB505FbUxTTuI+37tS8q4aZTBsdspDrE1B3/3lDeEX5lgIyaYbMQGFhKwOMoRC6ZYgU
	 GoV3iiEFrXVVoLi2c6Vp/NTq9LiE+u0CYsVkU/n+l3ixcUGiLoa3neK/NutnZtE8+h1sd
	 eOw2k5ZLc1cTzssZQ5WmDVpcKZJR6erdRmNE13qlcv9GJ/RWMFXUEPrWgiTaB+5PCa3dl
	 0fQ/L+CMVdpytxY7xCzcNI8pgub9gw3Y610zOmHNfL55BDGeTacO1j2oJ0c1jnq1oUY13
	 KjIjeAw00D+I+sxSv4HmWr1eusQgGC3gkwxKQp48rtYBJTIxkWoly2Z5d5YkniUGFUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oYYD8G7d;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E21E606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E21E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oYYD8G7d
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1CFC1516;
	Thu, 12 Nov 2026 09:13:45 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A93A3F632;
	Thu, 12 Nov 2026 09:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794503628; bh=rxrmCbZesyDZnjdX+PR1bLWDoY8nXPM2YzvhyRmcc2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYYD8G7d8eEOCS8yge37KP2L8iXFTmLr4JZN7JW2wFN8x9tL6pnuSrSIiAiFjL6Wl
	 vB4Q7z0uZB7FobGRNYH5vRk8vKKE2eozKCiHerNgIQlLdL6DLUOtoO07quMk7j/yUO
	 zuQI8EhxySQpOF1eoVvJ9+vYO9uHqS0sSNIEO99I=
Date: Thu, 12 Nov 2026 17:13:46 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 02/10] coresight: etm-perf: Remove workqueue for
 freeing AUX data
Message-ID: <20261112171346.GL9176@e132581.arm.com>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
 <20261016-james-cs-multiple-per-threads-v4-2-dedf961aca0e@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-2-dedf961aca0e@linaro.org>

On Fri, Oct 16, 2026 at 11:46:12AM +0100, James Clark wrote:
> AUX cleanup is deferred to a workqueue which is never flushed on module
> unload. Pending work items can therefore run after coresight-config is
> cleaned up or the module text is unloaded.
> 
> Since commit 95ff4ca26c49 ("perf/core: Free AUX pages in unmap path"), Perf
> core stops AUX transactions and frees the PMU AUX data from the unmap
> path in non-atomic context. Release the resources directly from the
> free_aux() callback and remove the workqueue.
> 
> Fixes: 0bcbf2e30ff2 ("coresight: etm-perf: new PMU driver for ETM tracers")
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

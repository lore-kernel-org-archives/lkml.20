Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506963;
	b=d9wi37E6lzCRK9qV1rGC9nHt8/I8miPZGPPR203emBlIppTf6xX9gA4PwCwHGS+EV4ER
	 Ug9UvU9o4fNiqmfjgdNWdInK2jGIa0+ecBzBRPE2Mdm64nGiHW37HfTll1c9AdaaFDtnM
	 0+y4J7x6rx/PYEVnz4jPTuoQSdALVwH5a8MEdeBvg7Q0dUSmyb2iSvEVP8015eJujqf6Y
	 bBfe3CQoSL1sLq3O2VwncVFElNlv5BcJ9mBG8E0ewQAntSrIm+woJzuoJmbANcDS7sFYB
	 bNoXJmZXdBFXcVG9yhxpvYpCuom/+d0V5nX4R4Ha+wQOBdmTWwdJXh7I26i4mySrEPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506963;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=sAIJKsddtsG4PZLTb3AFGJ2ogaGi60GX16MSJGzvEmk=;
	b=hi6hN3GfXP7W81BnABXEjP7OxNTn57hNLYfInubHOlHcylS/MN/U3yLwbVD8XIOs576U
	 K4O+ya8bDN60YxyiImnEqW5sjR/0sLEw33JKmGe2f/5vPL60GmjgS8s91ERoBwAN2aIGn
	 oL9yCmAYDxXUiOte0lEnY6z7rZnU47VfzY6hGzZ0PadykSmINLmTacNYbUEk8lybo261+
	 fDLiX3kwsyMu5BGukiyjji5v5GAx/dmIxzv+yKtdI1a5GPKeAqjG54t2kAjsv5zdCQl+j
	 wmIWXbLKc2TsTy8rYL9KU07AKWy+tW94N7mOEVOuzd0VkThqK6vMUHRsJyRN7+KnhgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kIgW7C7W;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084D7606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kIgW7C7W
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50BC51516;
	Thu, 12 Nov 2026 10:09:19 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF4593F673;
	Thu, 12 Nov 2026 10:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794506962; bh=sAIJKsddtsG4PZLTb3AFGJ2ogaGi60GX16MSJGzvEmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIgW7C7WqLM8XV7zDA8TE14RvzYRHPZw6v+7dkHVt5NZC6TLa/mSCzX7qh/kBk2k1
	 3bf5QgekVvGaXdymPQyVSfnfDPWZNSy1cN/xUFiAOZL/Uo7AjnNJ3gP3m0k1d9mpvL
	 wqBdLmpUnYcnR8X6rtmVP/onxfLdqpmGEz4xN6iQ=
Date: Thu, 12 Nov 2026 18:09:20 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 03/10] coresight: etm-perf: Serialize AUX topology
 access
Message-ID: <20261112180920.GM9176@e132581.arm.com>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
 <20261016-james-cs-multiple-per-threads-v4-3-dedf961aca0e@linaro.org>
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
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-3-dedf961aca0e@linaro.org>

On Fri, Oct 16, 2026 at 11:46:13AM +0100, James Clark wrote:
> Perf AUX setup walks the CoreSight connections to select a sink, build
> paths and acquire references to the devices and their helpers. Unlike
> sysfs tracing, it does not hold coresight_mutex. Driver registration and
> removal can therefore change or free connections while setup walks them.
> Adding a CTI helper can also reallocate an existing device's output
> connection array even when the device is already referenced by a path.

I agree that bus traversal and devices acquisition need protection.

> Hold coresight_mutex from sink selection through buffer allocation.
> The allocation must also be protected because ETR buffers can look up a
> connected CATU. Release the mutex before calling etm_free_aux() on error.

However, my concern is about the locking semantics. We should clearly
identify the races that coresight_mutex is intended to protect and
limit its usage accordingly. My understanding is that coresight_mutex
primarily protects CoreSight bus operations.

Holding it across the entire perf AUX setup might silence AI review
warnings, but it may abuse the lock and hide synchronization issues in
the CoreSight core APIs. OTOH, I'd say SysFS mode should not acquire
such a big lock as well.

BTW, I think this change is a distraction from the per-thread fixes.
My understanding is that this series aims to fix multithreading with
a shared sink, so we can address device lifetime issues separately.

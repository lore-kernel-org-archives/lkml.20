Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89B15013B7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567878; cv=none; b=I2/7x2qJXM1W4J5JfuwA1qqwcrulHWqSXdhRiNKM4I46LX7oIPFWaAeSFt06N7NAcUB0sGQuCY0LD9wKc2/LpVNIo9r0klKch+N9lLJ0ozHiWwTle1Uk5r0vfmZqp+xmFN489X2I7smQ0qxuaG375LvinEgnlcvs/M/owDWx68E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567878; c=relaxed/simple;
	bh=rOa03SY4j4JIWvwmr/q0JqYln1LWacblLJDVI8/iMoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOwI7bm8RfmPZLYDe2jK8lIOjXtuKgVft+y7Sq7uhOY/iw4ebui3xG0aweoBpU9R+B9f6qO9q5QIn+opjQmYmufbzKTcY9PNY+Ddbj3aUwQCYldRlZHgVYf/5voB+rgIIT+vLRFgqhVkwfnY25LSZt3sqN289oY/YuKrlS/3OGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=C825ldyo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="C825ldyo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CA55152B;
	Wed, 16 Sep 2026 07:11:12 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A822C3F7B4;
	Wed, 16 Sep 2026 07:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789567876; bh=rOa03SY4j4JIWvwmr/q0JqYln1LWacblLJDVI8/iMoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C825ldyoMd5ehAjteADceZMDfD9FBr9cC5efR2nMf9zLkWdgbKPQkBUnnGOwtPMRJ
	 Jbgluge032MtFb/nyCjqy6oZ98X3jyv4Hdbs/QYxujOstbrI/14KwKzgXN+q0ob5OJ
	 ZBcWbpauChw+zIJemq4UuCCc0GFKDZ5NsmiDQOgo=
Date: Wed, 16 Sep 2026 15:11:13 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: NoNine <chenmin83@gmail.com>, suzuki.poulose@arm.com,
	mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Min Chen <min.chen@siengine.com>
Subject: Re: [PATCH 1/1] coresight: tmc-etr: Sync the trace buffer for the
 device
Message-ID: <20260916141113.GI200420@e132581.arm.com>
References: <20260915130503.645953-1-min.chen@siengine.com>
 <20260915130503.645953-2-min.chen@siengine.com>
 <b803b63c-8278-4159-9305-f71ed001bdc7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b803b63c-8278-4159-9305-f71ed001bdc7@oss.qualcomm.com>

On Wed, Sep 16, 2026 at 11:04:20AM +0800, Jie Gan wrote:

[...]

> > From: Min Chen <min.chen@siengine.com>
> > 
> > The flat ETR buffer comes from dma_alloc_noncoherent(), which zeroes it
> > with CPU stores.  The DMA API requires the caller to sync the buffer for
> > the device before the device writes into it, but the TMC driver only
> > ever syncs for the CPU afterwards.  On a non-coherent sink the zero fill
> > is therefore still dirty in cache when the ETR starts writing, and its
> > write-back lands on top of the trace data.

Good catch! I'm curious how you observed the dirty cache lines
overwriting trace data in DDR and causing corruption.

> Agree, without the sync, the dirty data may overwrites the trace data.

> > Add a sync_for_device() buffer operation and call it from
> > __tmc_etr_enable_hw() just before the TMC is enabled.

I don't think __tmc_etr_enable_hw() is the best place for the sync, as
it can be called frequently when an event is enabled, e.g. when a task
is scheduled in or migrated between CPUs. We should be able to sync
once after dma_alloc_noncoherent() instead.

The issue is not limited to buffer init. The driver also injects barrier
packets into the bounce buffer, which can race with the sink. Even
worse, the barrier packet write may collide with trace data when they
share a cache line.

I think we should consider writing barrier packets directly into the
AUX buffer. This would avoid stale cache data from barrier packet writes
and simplify the flow without additional sync operations.

Would you mind if I pick up this patch (keeping you as the author) and
add a second patch to address the barrier packet issue? That part may
need some several rounds refactoring so can have better shape, I think
it would be easier to consolidate the fixes on my side.

Thanks,
Leo

P.s. Please CC me on future CoreSight patches. If you're using the
mainline ./scripts/get_maintainer.pl, it should add me automatically.
I didn't receive this patch directly, which is why I'm replying to
Jie's email (also thanks Jie's review).

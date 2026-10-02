Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5694BD0FD;
	Fri,  2 Oct 2026 15:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955212; cv=none; b=oavurrdmFBT2EjXapxuzIGycUSNklo5hJzgzrU+bSR9bpBd3eiIU4PKo/F/v+U9RienDcgFVdMI8EkCf2qZAqTe1p7+P42MqGmpGo4YK/4lsBFnrXgzSbH3A6MMQQSJknThIfL5Xz8l5H5Vd6H9pcfuz5OaveKzCGzFGgmrUp4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955212; c=relaxed/simple;
	bh=Of1LVdGYAcnWOg5CtjpXKTVkgH1AL/P/GtNpU5IDVu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q47oA3ZLxIsAqE9Fdx51ZL7naWcKPoCcCh+3ySHYsQmi1FbFIpbz/hHyXx4N7zT6+ljhty4ZGx52c9s8XftE6xxmHbdSRhcSfhGYGcYLJ6xf0oE7r1MmVtcsfqYVoAbu6Ghwh8xES01dZamlVEcjjiRBCR644F5hO4t6J6X8ID4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IofnOcwQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IofnOcwQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F3B0143D;
	Fri,  2 Oct 2026 08:33:27 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFA0D3F85F;
	Fri,  2 Oct 2026 08:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790955211; bh=Of1LVdGYAcnWOg5CtjpXKTVkgH1AL/P/GtNpU5IDVu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IofnOcwQDxU0Xd8A77BfWJmyj84GyW8z1sL/apmxHWDvrMzCv1SgRomFH6VU0JzGd
	 XR3EYkaI2c2n1e69pwrr7gT4MTyO7NSl2u8Wzg5wi7StDh4T8Hn3Ms2AqdCIv7vV+C
	 5p4TYWJCuvX4KQ/LLI7AMfi1I5au65Pja5pdupVY=
Date: Fri, 2 Oct 2026 16:33:28 +0100
From: Leo Yan <leo.yan@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>, Michal Simek <michal.simek@amd.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] ARM: dts: qcom: apq8064: Drop PCLK from static
 replicator
Message-ID: <20261002153328.GE1208404@e132581.arm.com>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-5-c3edca1c480b@arm.com>
 <z2bu73w3xcl4ofbp4td3rj7wazzoth5gq35obiqkrfhhfxufcq@hrfvij5jnb55>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z2bu73w3xcl4ofbp4td3rj7wazzoth5gq35obiqkrfhhfxufcq@hrfvij5jnb55>

On Fri, Oct 02, 2026 at 06:21:36PM +0300, Dmitry Baryshkov wrote:
> On Fri, Oct 02, 2026 at 04:07:24PM +0100, Leo Yan wrote:
> > The APQ8064 static replicator has no registers to program, so it
> > does not need an APB clock. Remove its RPM_QDSS_CLK reference.
> > Other programmable CoreSight devices keep their clock references.
> 
> QDSS clock is not actually the APB one, it's required for the coresight
> (or to access some of the regs) if I remember correctly.

If so, it might be atclk for clocking the module rather than the
register interface. Could you confirm this?

The replicator is just a middle component on the data path. I read
that it shares the same clock with other CoreSight components, so it
should still be safe to remove the clock from the replicator node,
as other components on the path will ensure that the clock is enabled.

Thanks,
Leo

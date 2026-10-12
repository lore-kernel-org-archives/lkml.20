Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F814AAC63;
	Mon, 12 Oct 2026 16:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822539; cv=none; b=B425hippaBsu1dQUcbS80pLacvnWWq4Zobo+c+ujhDFSuIiJARUwipr6D5/9vxD+Cq3jslgMKK4aOUjZCiygDf7FvuIrZX76lClJVacnAIapU/dOYz7IdTbNwzenGEuaxykL+u0FtWoPDlJ1cELvF0MHDxuLQTTgdj/5Ou3Do8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822539; c=relaxed/simple;
	bh=gIJwf2heM9XCD/JqzbYgIt2MgD8ykDZ06NKl6r3wTEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKoT5/l15C2+4OEZhM5dECg8IENVBIk/iajH1p1ftcyt88bCvWHZbv3nSpQKK5b6D0cTz+srfw+lTE75kuaYUzaEBpnDzu43dW68MhN0CYf4rIV9OR2wjCA/OQOykuaDD2wa0a+lqHe7M6KPRvyQM00V2wRGW+yyfJwGOyMOQps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=V7LPfNA7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="V7LPfNA7"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4466D169E;
	Mon, 12 Oct 2026 09:28:51 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 274433F673;
	Mon, 12 Oct 2026 09:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791822534; bh=gIJwf2heM9XCD/JqzbYgIt2MgD8ykDZ06NKl6r3wTEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7LPfNA7s8RoIZ3hI5+HCdI5KNciqvmLoKZPd7Smr9cADlUE6FWh94GlhN94SM8zE
	 08ufpKcftvWxkinUalIyA9KPb7gnmBMsNjtfJOoExmY0eaETYrlmN8ZnXoANAeztqa
	 nm3rC2OtKj+jd5UH4FWdu5latuwMyZHbrtyo5qAw=
Date: Mon, 12 Oct 2026 17:28:51 +0100
From: Leo Yan <leo.yan@arm.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: coresight: Limit static replicator
 to atclk
Message-ID: <20261012162851.GB26205@e132581.arm.com>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-1-c3edca1c480b@arm.com>
 <1128f456-ed6e-47ee-8dda-157af99cc404@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1128f456-ed6e-47ee-8dda-157af99cc404@amd.com>

On Mon, Oct 12, 2026 at 02:35:37PM +0200, Michal Simek wrote:
> 
> 
> On 10/2/26 17:07, Leo Yan wrote:
> > Static replicators have no programmable registers and need no APB
> > programming clock.
> > 
> > The Zynq clock controller registers dbg_trc and dbg_apb and calls
> > clk_prepare_enable() for each gate the bootloader left on.
> 
> That's one bootloader behavior. If there is another bootloader that clocks
> can be simply disabled. I don't think there is any reason to depends on
> bootloader behavior. If there are clocks which has to be ON I can't see any
> reason not to drive them.

My reference to zynq_clk_setup() was to explain that this patch leaves
the existing management of dbg_trc and dbg_apb unchanged.

The CoreSight drivers do not request clocks named "dbg_trc" or "dbg_apb".
And removing those unused clock properties introduces no additional
dependence on the bootloader. Could you clarify how retaining these
entries addresses the bootloader concern?

> TRM page 741
> 
> Trace Port Clock The trace port clock is used to clock the TPIU and trace
> buffer when the MIO interface is chosen and must be twice the frequency of
> the desired TPIU clock. The TPIU clock frequency must be chosen to be fast
> enough to allow the trace port to keep up with the amount of data being
> traced, but slow enough to meet the dynamic characteristics of the data
> output buffers of the TPIU.

The quoted paragraph establishes a trace-clock requirement for the TPIU
and trace buffer, how does it identify the clock inputs of the funnel
and replicator?

Thanks,
Leo

Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE4237646C;
	Thu,  1 Oct 2026 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862075; cv=none; b=IRedCjzZ6UYbCzjK8En3sxNQNYdo3VkR9Cf+Vz65C03SglWbEP4ew68qUOqatfO9wgOlQDfgAt2MZje2vT5FjMcGF40EebqpBPhLVxn+AHhqSopKhiJU7oXmRFKEJVye6U/UT8vByEkGQuTQT6zmYsXsoRzTHJZ5TdoF01kRUnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862075; c=relaxed/simple;
	bh=d7AaXtrsxUp4jy1qMsWbSpDXTjmvvtJXht/l2mnYE44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTg0WWi9p9kURMf+B2CrGG/iM0oQuGNE00qRypPj3ywmXJ/A3x1z5nKOiiHpLN2+QyXycvu9IcLqhzn6O9wJGL3PWnAeZC7jTzSgVNV0+PNEJy0Shw8QlAfIK2U7IrnO7y8CsP9uF18iu97l+XHj5MagB0JpG1g+MpLu+oSg7b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nGYfB0WA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nGYfB0WA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED0A0497;
	Thu,  1 Oct 2026 06:41:09 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBA2F3F86F;
	Thu,  1 Oct 2026 06:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790862073; bh=d7AaXtrsxUp4jy1qMsWbSpDXTjmvvtJXht/l2mnYE44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nGYfB0WAVtfZWvTeCQBWksyS91YtQ74lEIFWQ8sNun2ofaLMUMp8hQ9WNyqVP4h5k
	 s81P3n4nALu5TwlI41Qnyk0ALTMXhfUoIiJy8VP1f9jQ8FM51EyeDcjXarn7ilnFmj
	 tkI5lITjC1x2l5boC/2HxI4CGJI/iLTwjpCWAAMA=
Date: Thu, 1 Oct 2026 14:41:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: coresight: Allow funnel clocks
Message-ID: <20261001134110.GM14479@e132581.arm.com>
References: <20260921232834.3138571-1-robh@kernel.org>
 <20261001100455.GL14479@e132581.arm.com>
 <20261001120444.GA1048975-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001120444.GA1048975-robh@kernel.org>

On Thu, Oct 01, 2026 at 07:04:44AM -0500, Rob Herring wrote:

[...]

> > The question is that a static funnel does not need to program any
> > registers, so in theory it should only need atclk as the module's core
> > clock, but not the APB programming clock (apb_pclk).
> >
> > Maybe I did not get this right when I initially enabled the static
> > funnel in hi3660-coresight.dtsi. We should probably remove pclk from the
> > static funnel node.
> 
> Yes. I suppose in theory it has some clock, but if pclk needed to be 
> enabled, it is shared with all the other coresight components and 
> enabled anyways. And there's no atclk defined, so 'clocks' can just 
> be removed. Can you send a patch to do that, and I'll drop this one.

Sure, I will prepare a patch for hi3660-coresight.dtsi.

> zynq7000 is even more of a mess I just noticed...

Agreed. It should bind to "arm,coresight-dynamic-funnel" instead.

However, I'm afraid the "dbg_trc" and "dbg_apb" clocks are never touched
by either the CoreSight driver or the AMBA driver after switching to the
dynamic funnel.  These clocks should therefore be removed from all
CoreSight nodes.

Thanks,
Leo

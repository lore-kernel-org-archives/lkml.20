Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352BE511E80;
	Wed, 30 Sep 2026 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800866; cv=none; b=NJ5HQmyLBcjyhixjlU00t4qiCTCB3nfr+ZHCLzNwCfS2Y/64QFX4kqqEk21CyA/FuCWKqHQIvcGzgkBN+iD66Qjelxz4JlMPQt44wO1je2U9k6uSKLLHrKRMVAYxucr0zWbeWhar//OM7N9VJdW2ozZ6PSpinejiEKsoYYvbEvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800866; c=relaxed/simple;
	bh=lyx5mCiXsjeDy+f8mtY5XFPpn5N11E9cCVkEM6XRmWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gigvzRDoB9iGaGCWkq04DSvLKKUgmYWRVooslY1UJAiJusqaVCybJRtlq1mPuInIBS5b+JSLM3EU3olvblLcyApIv8KGUfoU4hrIuLw8rPUk5sqoWN+N/ipYGcW6Fjx/wMEHETUhodXeHJe7JvFUh+7paTDUYRsCRlW8a7CfMgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahlsScF1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahlsScF1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB891F000FF;
	Wed, 30 Sep 2026 20:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790800864;
	bh=jSLvVPaQ0rlIcm6Z9XUeylLuoGuT2lgeopOGTbrCFC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ahlsScF1V1nutlzVUBh2PZwWPERWmEX+e/yOQXe+DUHRby9U6ZOD8CPiHbOU2bN1M
	 UTVsvVbiMqCdchWt1rjXT1Di8ELPm1PQgZPFinzUoLJtOp9L+fHxTLi0ukzdbgjNZc
	 KhoyiOEXy+MpVf2dbjIcX7Na+ACI/Sh6JuCALmDFJV4V7b50VXWxXCmY7bKuXhPy5H
	 pIOQ2km/teot8yk40JClWI51EMX0ndW7wYhP9K7O8oB3bl//ItQcvT6T5wA2yygdeh
	 JK6MKpBzPShY4a3Rx8es8hpcMeOmOcYqI5L69Mm0/HJcz3hWj+EPPmnrOq7wLiUsFE
	 YPf0bQSK4npIg==
Date: Wed, 30 Sep 2026 15:41:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, coresight@lists.linaro.org,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Leo Yan <leo.yan@arm.com>,
	Mike Leach <mike.leach@arm.com>, Conor Dooley <conor+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH] dt-bindings: arm: coresight: Allow funnel clocks
Message-ID: <179080086261.186348.9807658580842807205.robh@kernel.org>
References: <20260921232834.3138571-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232834.3138571-1-robh@kernel.org>


On Mon, 21 Sep 2026 18:28:33 -0500, Rob Herring (Arm) wrote:
> Some static funnel nodes have APB and AT clocks. Allow one or two
> clocks and the apb_pclk and atclk clock-names entries.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/arm/arm,coresight-static-funnel.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Applied, thanks!


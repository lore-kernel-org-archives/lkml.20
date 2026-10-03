Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2516E1E8826;
	Sat,  3 Oct 2026 07:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791013287; cv=none; b=Ueo6mccl+ksd2y7pnN9opU9t92A1ciSnv8jMQKb8aUsIUnjoZuTDZ6rjqioZiFwGd5ox8tl8RjG2FAcgUMNSv1X20U2ppPDhY9zB6SFzIoY+bY9sZzfEPPjHdr0Vxa7sZ3GWPnS1ohVASpGCD+wX1kbVDGPGNk0R/7nTqyDOc1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791013287; c=relaxed/simple;
	bh=r6gxLeWnq/J1Isax9qv6UAFtpr2Wk73y3KuTJXA9umI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqJje/pm8HliVap/8yrmSGwkaKyyIeOrsoLeem+RKi3ouXdhMcAR35DwA2/SQCHilJOFQpGXkd33fEvxTTn/dZ2o59u9loZMXTRPi8GYsQnyyuHv5JEbV06hMy1ezpY8vGuBFpSSZH90syW6fyqOTF2Q9Z53nTV2nCi7bY2wmvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G61T9tvg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G61T9tvg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75841F0089B;
	Sat,  3 Oct 2026 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791013285;
	bh=9bCKHbiVXllMPKt+oTVJ2iKD2nFCzwNeIZOHpdGsxu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G61T9tvgbkdaFLG/FWAQtNLnocL0UlVS2TqokT3spijDWrOUM7jp0B3ShiIVDbu0m
	 Iu5fhaGKVRxz5AF6+sD68ATNHhAdoL62AdMcoAuxcQiFzItDAbUza49kOgjWv2LRoI
	 EO5fMa7YqlJMHAQYyRSNwdjtEZQucZmI0svhhnZjY5K8n2D/I5RplMUZXmi/xDQeeY
	 0bahMHt6UVqhl9PMfaSpOutwUkJMOFzXcatZi+nC7L5UJETfCfV8usMZNV55+OxUqP
	 8S2SjFNCmJI2t5Pkf7i8Wz3tS8oagC0hSFL9VQlON+24LZ3Tl7QIjF8t15m0DjyPWH
	 Kf6OCcaHOejuA==
Date: Sat, 3 Oct 2026 09:41:20 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
	yung-chuan.liao@linux.intel.com, prasad.kumpatla@oss.qualcomm.com,
	jingyi.wang@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
	quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/3] soundwire: qcom: add multi-master support
Message-ID: <asCxoMbtsSfVcX_9@parshuram>
References: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261001093806.634862-3-srinivas.kandagatla@oss.qualcomm.com>
 <0ca6ee6a-020a-4705-8323-d524a813d3b5@linux.dev>
 <586046f1-8439-4353-b60d-dab6356de3ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <586046f1-8439-4353-b60d-dab6356de3ba@oss.qualcomm.com>

On 01-10-26, 12:06, Srinivas Kandagatla wrote:
> 
> 
> On 10/1/26 11:53 AM, Pierre-Louis Bossart wrote:
> > 
> >> @@ -192,6 +194,13 @@ struct qcom_swrm_ctrl {
> >>  	const unsigned int *reg_layout;
> >>  	void __iomem *mmio;
> >>  	struct reset_control *audio_cgcr;
> >> +	u8 num_lanes;
> >> +	bool is_dependent;
> >> +	struct qcom_swrm_ctrl *peer_ctrl;
> >> +	u8 peer_first_lane;
> >> +	u8 num_peer_lanes;
> >> +	bool is_primary;
> >> +	u32 peer_dpn_offset;
> > 
> > nit-pick: do you need both is_dependent and is_primary? One would think
> > that a single variable would be enough, no?
> I did try to do that which made the code bit confusing to read.

I am viewing it that both should be set always for this mode. Do you
have a case where it wont be the case..?

> > also without context it's hard to understand if lanes are independent in
> > terms of transport or not, not sure what 'peer' means in a multi-master
> > setup with a primary controller and N dependent ones? Code like this
> For now its one, but Yes, technically we could have more dependent ones,
> I wanted to keep the patchset simple and right now the only have one
> peer and i dont know if we have other setups with more dependent
> controrllers.

Lets add the logic when we have such scenarios and keep now for one peer.
Does Qualcomm roadmap envision more controllers?

-- 
~Vinod

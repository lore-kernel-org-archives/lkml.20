Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFCB1F5821;
	Mon,  5 Oct 2026 17:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222089; cv=none; b=pbV2iWPEAD8Tmbbu67SFwD3AJTPlXQfoMRLblSmaccoZ9p60dGNeSFteQHqxV7DG18NBhVlE7wzJrVwnIfpO2fEGKau1DNfS8nGA51MLTNEuU+T4qmArcZ0VjD1h0/MKiDZ62AjYsgCbDBu6BG2fxXtAnEQrh68+ic7ZgJ2P2Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222089; c=relaxed/simple;
	bh=6fjUnncZ5VWnQZqBjDbywbxulu1spYXBUoMJwBLtYLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBSfTaZxNAWdL2tjQcHOFridRi9ojAZocLEMmP+5NDo5xMubIqMUv2UKM4ByyztNqGfOgVx0ngcbw9VPDfR4vDP0z4uqmB6SzKDydD36m6LlWtg2Mw5Ht0SOT20+HfgEXuPAOecwgd8BXAK4+22WFj5kRwKmffgDjZVOyNye7nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kbu43U6K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kbu43U6K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661851F000FF;
	Mon,  5 Oct 2026 17:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791222087;
	bh=TfQFJEJ+w1g7xKma/fMjUoqeslFwGZujvMBK23yADlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kbu43U6KALvdki19VBECdVrFjdx2vCfWAUlM5ZiG6sdWY+l+sRNVInM90HdfWmQhk
	 qrdnFtGIeEIYut4cBOTEZCmMI60UvgtDYRNmJnL2mVsFff8nrql+eZevCS8e5fZzPo
	 GTNZRfK+mS8fc3BgDA2fDeJ+WgnxzRDIbLEb2RfgQhj5Djv1Ruwu+Te3aWVL49xJlm
	 P+YpnNOnFxtoUyed8o+fMnr/oZP183GwI5Ostz7BJdQa8QNWhin1b9CliMm7zTGFC8
	 PKoo4Te9jzuNsw5WQRKUaRElHTgHoSAFqSX+sOxn1JqabRf+Rc6sNgpaqpa5ikn5jE
	 zuNdoz/cGo2Bg==
Date: Mon, 5 Oct 2026 12:41:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	Mike Leach <mike.leach@arm.com>, Wei Xu <xuwei5@hisilicon.com>,
	James Clark <james.clark@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: arm: coresight: Allow atclk for static
 funnel
Message-ID: <179122208597.1280954.9033989224338091582.robh@kernel.org>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-2-c3edca1c480b@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-2-c3edca1c480b@arm.com>


On Fri, 02 Oct 2026 16:07:21 +0100, Leo Yan wrote:
> Static funnels have no programmable registers and need no APB
> programming clock. They can still require a trace clock for the ATB
> datapath.
> 
> Document an optional atclk input. The CoreSight funnel driver already
> enables it when present.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  .../devicetree/bindings/arm/arm,coresight-static-funnel.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


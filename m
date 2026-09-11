Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F88730568B;
	Fri, 11 Sep 2026 05:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105044; cv=none; b=muLTMCUDWKiTbzGk8IZ1FAl+xIzZKnYOZrLyHXYfSYpBevQHU5oGZQ9k7ELgel5tjnJvyUxL8hBMW24K5yRoEa18v389qWa10UkZLJsSsxNOcXZnjkOpu4gHIVsQjpOvKzwdS7YBfbj3POSiH7o0OaO8uOD9fhUwWEVmrpkGOw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105044; c=relaxed/simple;
	bh=VKe8ph9r2QreQaOChKT8GakmIXr1iLGX7UdMZi8oMD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieKJ3mD6MnrI/fOJ22Boejjh4qIcS/j46lR8jcgxr31NQQS9eWfoyTICMpR6VFG4Rrnh1o8i4ORVSu+XMSTGApJd6G8JVNChwF9oPS4R16y5h5plkkjKttDyyPkg/lCiGPZj6lWpg748niWrFAtidObZo+1Vp9Ou5o0Yorn+f9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDjw7525; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDjw7525"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFC11F000FF;
	Fri, 11 Sep 2026 05:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789105043;
	bh=36/1Qi0b8ZLYrU3z3rga2ArYzSjEeaQQnA6fSUVCN/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dDjw75250u5P/qmInFGdJIZ9jnHGOAd7W7MTcSsn5oIAqFgA+OIc52qMQW18CxnIY
	 Qxds1lDHzzS6HllVC7AuJtE5vkXdLezYO5gUP/J/aXZLZaNbEAVCQoVhH2oPSMGDuX
	 E5T+uXhhSA6GRW6X8Mr//QqW9w0cxBSnOBqXTYDBII9bKKLFkmglWaMZXUsxlK1cK2
	 ZMYN3hucwpBAibZ6i6yJxSnNw5WFV1s56yNBjchgJn98erkjILoIg+u/SW6V9x8gyD
	 uNB/HPOKd2eUCgZWydHOgqKyrQlyW5qPrSQY9X50aXFgF77FCnQwHPvnxxQ5FkiooY
	 O0H3Dtjw8Gjiw==
Date: Fri, 11 Sep 2026 07:37:16 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v4 7/9] phy: qualcomm: qmp-combo: Update
 qmp_v8_configure_dp_clocks() for Glymur
Message-ID: <fma47n5b2vyh6iyzalruiv3ea6gglvgyubuzdeckspruf4lgl6@foqf27yzys67>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
 <20260908-glymur-phy-v3-v4-7-ff22e5150538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-glymur-phy-v3-v4-7-ff22e5150538@oss.qualcomm.com>

On Tue, Sep 08, 2026 at 07:31:00PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Remove VCO_DIV programming from qmp_v8_configure_dp_clocks() as it is
> not required for the v8 PHY.
> 
> Add per-link-rate auxless setup/silence cycle and LFPS period values
> instead of using fixed constants:
>   RBR (1.62 Gbps): setup=0x03, silence=0x06, lfps_period=0x00
>   HBR (2.70 Gbps): setup=0x04, silence=0x08, lfps_period=0x11
>   HBR2 (5.40 Gbps): setup=0x09, silence=0x11, lfps_period=0x33
>   HBR3 (8.10 Gbps): setup=0x0f, silence=0x1a, lfps_period=0x55
> 

Why is this change needed?

> Add per-lane drive level lookup from the ln_drv_lvl tables based on
> the maximum voltage swing and pre-emphasis levels across all active
> lanes, replacing the hardcoded 0x1f value.
> 

Same here.

> Remove the duplicate LFPS_PERIOD write that was present after the
> AUXLESS_CFG1 programming.
> 

Again, you've clubbed multiple changes in a single patch :/

> Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")

What is the issue the patch is fixing?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

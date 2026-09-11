Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20B13B2AA;
	Fri, 11 Sep 2026 05:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789104452; cv=none; b=um2GN/fePADUo1u8qar6bKNeWKUEReAcAoibG+2mqeyTQCdXNCx1baN/F9iUI6zhB0uhhoU2BHZ5MiNU5nVp1OLK9ZjKqUOxtXsVTT5eqIlXRIWfERcOhmDHvwcE6zaChw2kovoUryzP/uUW8XtsOtyn5OlFF/g7vqBFYMPdRPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789104452; c=relaxed/simple;
	bh=7QbuVRzJv+Z/K2I23E+8rurmdkKk6w/Pjx3yst1YxM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuAuQg0OFhYEGinUJjOw8sB/hM/R09JONFaVTDn+2nKzpuBS1q2mkGFOR/XBOFPsCdXXtm6wj8MvN2UgsapKYmEc+Zf9xmnK/6Ca7VHw6yewDjQq9eq5ONYBxst+2+E72FCS/y8hdyfauIG+UhX/kXBWebelKysfVqDnNSKP5/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtoDR1n9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtoDR1n9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AE81F000FF;
	Fri, 11 Sep 2026 05:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789104450;
	bh=RCKkOAoiWDDQl0cPV0565ONJCphPQ0/irxotZB4/flI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GtoDR1n9wRq/zokwNVcO/UZkXFDEQh0TharHM2CxAuKbUYcGF70esFvcVpayckE46
	 qriAmNTdkwnxmbpFTzM8ol79iadbfJlI3pJqUSsj5JnOw6xExRoosG7dqBLKdKDQ2r
	 UqXpm2CXeqxIVwg5f2k0opdYbsSDLK3TYUh4psAYjx1EJbQYn0j/Kdmd1Eg/Z1R18O
	 xSP1M183aRLfveMghutabeFwcam3jLYrizuKL0MBLr0prZwmieJ3Qs+SymVx0OeIp/
	 iNkTSOdR4NvAB7jVfBCeSEt5kDY/MQS36k3nRJKKahzuNp9szlCY8tTxafEhtzO5iP
	 EJbFz0CMmlP3w==
Date: Fri, 11 Sep 2026 07:27:24 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/9] phy: qualcomm: qmp-combo: Add v8 PCS-level drive
 level tables for Glymur
Message-ID: <yc6fcxdbhsanbh3bi3e2wkqm5wtewg65wjca7mol4s7iszgblc@sj6ql4s5y3yc>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
 <20260908-glymur-phy-v3-v4-5-ff22e5150538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-glymur-phy-v3-v4-5-ff22e5150538@oss.qualcomm.com>

On Tue, Sep 08, 2026 at 07:30:58PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add PCS-level drive level tables for the Glymur (V8) DP PHY:
> - qmp_dp_v8_ln_drv_lvl_hbr3_hbr2: LN0/LN1_DRV_LVL settings for HBR3/HBR2
> - qmp_dp_v8_ln_drv_lvl_hbr_rbr: LN0/LN1_DRV_LVL settings for HBR/RBR
> - qmp_dp_v8_pre_emphasis_hbr_rbr: updated TX_EMP_POST1_LVL values for
>  HBR/RBR
> 
> Add ln_drv_lvl_hbr_rbr and ln_drv_lvl_hbr3_hbr2 pointer fields to
> qmp_phy_cfg to allow per-platform PCS drive level table selection.
> 
> Wire the new tables into glymur_usb3dpphy_cfg, replacing the previously
> used qmp_dp_v6_pre_emphasis_hbr_rbr with the corrected v8 table.
> 

Patch description doesn't explain why this change is needed, but just describes
the change. Is it fixing an issue? If so, there should be a relevant fixes tag.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

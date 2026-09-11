Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB8A30568B;
	Fri, 11 Sep 2026 05:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105113; cv=none; b=JBoo1wBT1Cy1ZRrYXDxxBTN+6pYZBxsNgHBPHJMFx0Bp3EhcdlEy0yqaSb88DNDMaE7mBbvITgHFfo2eevVtGyI01NlIWTtR+1wHK/MSDf/fJ1CeBzFxIn4Aepa/Viro9PtLye3K3tyavUqXl+1iZ7pLOXCHxdmoadV4JteKHSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105113; c=relaxed/simple;
	bh=IEs+rpwobwtcxO60zbMsuUVV9vxXzvUlCMmCfcDMa00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CF28muOj3yxbP3bP/1TJM0W/7LHvSBvIz3ARZTWiFGrXRpS3fCYlf8XwBJ5URCDF67vW0Z88LSyKLGIZrb9UQDE79ipgMdEBESw8CKLcasocoGpyY97ixJsY+3cN1vZ26+T3g5aZsHr7myvvZFXNd+vbMrM1v0OhMAqzNbms7rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGgiNDCr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGgiNDCr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43EE1F000FF;
	Fri, 11 Sep 2026 05:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789105112;
	bh=hi/sAfcZebnb6L2iDczSy+R8ulaoBQH7kOjtfHM4/pA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AGgiNDCraZXyIAz8C/b/bklo9OffRBsyFB1OuLCpdtQ3nLuDPxvHEIVeaZNQmb5F2
	 qyaFh1SxR9kv8fiyFdEWL+GnEvHSlEZPvqTrcqRFBPpLRvYC9CCcNnW1L6ye/2QD9w
	 lqZCZ86XSsmUNWzcNi3hbavISVU2taS6lEln5oRNMgREf5rHzW6zxi7WsaLC8sAX9+
	 4XGpLb8JfeZoVLWIYQq3UVFOHiO5nq51+gD1gOiC6YmMbXq1ZQPVN4xE6HLI/jRm0V
	 HJgz1B7yroHlT1DrS20LnD9lF8BneT6h4JkSVOyBs1wWeSBYrXtLKIg8sPcAKe7lPl
	 Bn2/ImwIgyPIg==
Date: Fri, 11 Sep 2026 07:38:25 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v4 8/9] phy: qualcomm: qmp-combo: Fix Glymur v8 DP PHY
 init and configure sequences
Message-ID: <4pqee6uuymjb5ek65a4uhtfgr2dm3jpwv5j6gj4s44qokjx2r5@kqlbwljmahw6>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
 <20260908-glymur-phy-v3-v4-8-ff22e5150538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-glymur-phy-v3-v4-8-ff22e5150538@oss.qualcomm.com>

On Tue, Sep 08, 2026 at 07:31:01PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Update qmp_v8_dp_aux_init():
> - Add CLK_FWD_CONFIG_1 initialization (0x3f) before power-down control
> - Replace PSR_PWRDN with LANE_0_1_PWRDN and LANE_2_3_PWRDN in PD_CTL
>   to correctly power down the data lanes
> - Correct BIAS_EN_CLKBUFLR_EN value from 0x1c to 0x17
> 
> Update qmp_v4_configure_dp_tx():
> - Correct default TX_EMP_POST1_LVL value from 0x20 to 0x2b
> 
> Update qmp_v8_configure_dp_phy():
> - Correct 2-lane and 4-lane driver enable values to 0x30 (was 0x10/0x34)
> - Add CLKBUF_ENABLE (0x87) programming for both TX lanes before driver
>   enable writes
> - Add TSYNC_OVRD sequence (0x03 -> 0x23 -> 0x22 -> 0x3e) and
>   LALB_RESET_TSYNC_EN_CTRL (0x0a) programming for proper TSYNC handling
> - Fix QPHY_DP_PHY_STATUS poll to check BIT(0) instead of BIT(1)
> - Replace post-lock TX_DRV_LVL/TX_EMP writes with two COM_CMN_STATUS
>   polls (BIT(0) and BIT(1)) to properly verify PLL lock completion
> 

Same comment as other patches. What issue does this patch fix? Any error log?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

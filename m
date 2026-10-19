Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0C74D597F;
	Mon, 19 Oct 2026 10:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404072; cv=none; b=pGxXWbsko+zsxeQchpF9ZFjs4xL5SrgA1SAYOTTKZto3UneistRGA1qZeghoZYjAu8dGf6tErwpVzUzVH+JZyF3JxOsHJzPnexiTNAGwha4L2Wt3j8Wd2EQL+4ica0CvVGT2E9FXZwhcljAq2g/nERMr2AlfGSTVET+2bRoX4eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404072; c=relaxed/simple;
	bh=EKWfrIRBQN/A0hWazzILMvN+1tgZIZ4mudS5/pWSEPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQhSbxhuXi2Am7BovJpxoj1i0jMh7SfmXY/orXYaKpt2e2ZuEQwRbTf7t6wAsi/OrgdDfLVoHARkLxGlnhEaWdFKyH+ICzMwtwfFBt/4QXzBKCj7gNDZygIsVJCcsZOtQ9THDO/0gEAAmSEAT7nQwdY3MADXffdofR7sUpdEQoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOOlmR99; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOOlmR99"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A1C1F000C4;
	Mon, 19 Oct 2026 10:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792404070;
	bh=6HDV2HcLkfwQjSgKzpnVgoK+4ivvoEHdz75ohcQoHhk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YOOlmR992iCkxzo8lLqrfm6QBsTap8iuF1rxQ7iZ7zCq94SxSviXJ4s0jj5xMgN1y
	 u3ecZrigLfaBBcyhIz5vjV60zaZ8SofK/7xpiH/LxFUDiFMl70Z6IAyeGo93P8Mj57
	 VtUvig875jusO7GHu1mfiqf/vuzWfdqtG9MKdA9KZGR3YNJ7/8mmKDF8NzsV0/VSvl
	 XZFWML62NHsQJGTCNgmCw50qX7m6CKAfRJm7AibA0nhiEyYGiANTE6Uj0/HYm0EMrs
	 ZhQkKsBMkT1XLi6zAjSXSrNOJv2P2x5IYi0De3vs4hhiZcW+YxkElKcvRSg4jkTtOw
	 E6yHw9RxSV/Rw==
Message-ID: <392642ad-3bac-48bc-9199-8c3923c588c2@kernel.org>
Date: Mon, 19 Oct 2026 11:01:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] phy: qcom-mipi-csi2: Add sa8775p D-PHY support
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
 hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
 jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
 vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <EKfYfLCfqnEg_PLe_TsBkAGryJgP_tA140u-0ZYSL9q5kInrAtoRCiugYV3C2PDDvYjxaeejuYK3gqzAT4FMXQ==@protonmail.internalid>
 <20261016235502.2274268-5-anusha.nandi@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261016235502.2274268-5-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2026 00:54, Anusha Arun Nandi wrote:
> The timer-clock lookup in phy_qcom_mipi_csi2_probe() and the OPP
> clkname passed to devm_pm_opp_set_clkname() were both hardcoded
> string literals sized to x1e80100 ("timer"/"core"). Add
> timer_clk_name/opp_clk_name to struct mipi_csi2phy_soc_cfg so each
> SoC can declare its own clock-name strings; x1e80100's soc_cfg now
> declares "timer"/"core" explicitly, with no behaviour change.
> SA8775P reuses the same "timer"/"core" names as x1e80100 for this
> pair of clocks.

LoL I had that in the last design and review said "hard code it" happy 
to agree with myself in the past, however this change should be 
standalone and precede the Lemans work.

> SA8775P's CSIPHY has a single power-domain, the Titan Top GDSC,
> matching the legacy in-tree CAMSS driver's sa8775p_resources.pd_name
> = "top" and the existing lemans.dtsi camss node. Like x1e80100's own
> "top" domain, it is not OPP-scaled, only kept enabled.
> 
> Signed-off-by: Anusha Arun Nandi<anusha.nandi@oss.qualcomm.com>
> ---
>   .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 112 ++++++++++++++++++
>   .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |   5 +-
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   4 +
>   3 files changed, 119 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 966d79c98f9b..85e89235f7c9 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -380,6 +380,118 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>   	.num_supplies = ARRAY_SIZE(x1e_supplies),
>   	.clk_names = (const char **)x1e_clks,
>   	.num_clk = ARRAY_SIZE(x1e_clks),
> +	.timer_clk_name = "timer",
> +	.opp_clk_name = "core",
>   	.genpds = x1e_genpds,
>   	.num_genpds = ARRAY_SIZE(x1e_genpds),
>   };

Yes but split it up - "remove hard coded timer and opp names" - actually 
you want to make the OPP optional no ? In which case you'd expect to see 
a patch to make OPPs optional - instead of folding that into a 
functionality drop.

Because say we want to revert or re-order the addition of Lemans in the 
git log - we then have the problem of mixed functionality.

Or say I want to cherry-pick a backport - I don't necessarily want to 
include lots of SoC specific stuff that doesn't affect my part.

=> More granular patches.

---
bod

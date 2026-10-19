Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B1B4A3F26;
	Mon, 19 Oct 2026 09:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403723; cv=none; b=Cez3Qe5vs336HTYJloPadXpebqhZAGpYjrSX/trVQaLoKOqw/ft/wNV6vG5ovpcZQ5wCeyUrIGpWrEgrBOivlJcg/rbUlwMI3tsK4RXrkQDD+DbLLQ6XOhc38hnuh7RRZPPCPhelG2qkk+Bnk/rg9za5kFYVnCeg02eHB3WTPBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403723; c=relaxed/simple;
	bh=ZAzYRrnVrp7LVtZMtaXO3WoR0zPjaRNfxBzvxbNHw4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2Nnh1KeobkdYif+yuq9BwL5wGgl/bDuGxUJzpWwTGFEKuYMJDv3/tX3iaNFijts5b4h84bmfr8E3shLhDsFOGf/zj47tbvG/YAVCm6ciscI4GgNJsQ03HdcauHVrkN4jKM8+wDvvX1izbVr6eD1Up4G6Mti2CKu+sCCzp+61WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEdFOg+t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEdFOg+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0418F1F000C4;
	Mon, 19 Oct 2026 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792403721;
	bh=cEDEdBQSjfHF2sgr1B0e6z58gBo2WM/Q9xw4l5QiHv0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FEdFOg+t9QR8ckTMiMXLv+8cjdPdG44hFp6TDdPICFAKaNE+1CCBlpobOSfnRgchx
	 TX2Q7I5rkdJuVEHA0BfQA+YPXMc5hep5s5Pw4hitbC7PQpZfUVKkHaNkauiW4uWx6j
	 YB0i2FWG5i/CDU1WV7/bqFEdrH0WULhGg+c8QREU43urszcsKlaVlHluDrorEHffA4
	 twn4XgnbKQUYZrAbYmNfmrFKb2ucNza8qiFpq00Byu47vMQee6kTiqOZ0lwYzV/Iss
	 S1+jQdVvF4C2OrvzSU7kBz9NYN0zTJ8WZ/HCdaxWnVLMmdrZI0t9IAm1YhTeK6oG+A
	 gP6L1rllajBtw==
Message-ID: <fc2c2f40-8a55-442a-9b0a-d73f040af60d@kernel.org>
Date: Mon, 19 Oct 2026 10:55:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] phy: qcom-mipi-csi2: fix -EEXIST probe failure on
 single power-domain SoCs
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
 <0L6D4EGEbw9SabH4L1sIcfqiZK6SmLBEjQEK5ljwkWxWQyXebQ9BNv71oBQmg61s3p8ja2Se4FlB5VtG5EdMXQ==@protonmail.internalid>
 <20261016235502.2274268-2-anusha.nandi@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261016235502.2274268-2-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2026 00:54, Anusha Arun Nandi wrote:
> sa8775p, qcs8300 and sc7280 each list exactly one power-domain ("top")
> on the CSI2 PHY node. For a device with a single power-domain phandle,
> the generic platform-bus code (platform_probe() ->
> dev_pm_domain_attach()) auto-attaches it via genpd_dev_pm_attach()
> before the driver's own probe() runs. phy_qcom_mipi_csi2_probe() then
> unconditionally calls devm_pm_domain_attach_list(), which fails with
> -EEXIST because dev->pm_domain is already set, and the driver treats
> that as fatal:
> 
>    qcom-mipi-csi2-phy ace6000.phy: error -EEXIST: Failed to attach
>    power-domain list
>    qcom-mipi-csi2-phy ace6000.phy: probe with driver qcom-mipi-csi2-phy
>    failed with error -17
> 
> x1e80100 is unaffected: it lists three power-domains, so the generic
> code does not auto-attach any of them (auto-attach only applies to
> single-power-domain devices); the driver's explicit attach is the
> only one that runs.
> 
> For the single power-domain case, call dev_pm_domain_attach() instead
> of devm_pm_domain_attach_list(): it returns early when dev->pm_domain
> is already set, so csi2phy->pd_list is left NULL rather than built up
> by hand. The three call sites that walk pd_list for genpd
> performance-state scaling now guard against a NULL pd_list, which is
> harmless since scaling is unused (scaled = false) on every SoC that has
> a single "top" domain.

Fix implies bug but, this patch really adds support for one power-domain 
cases.

I think the patch title should be something like "Add support for single 
power-domain case"

or if you believe it is a bugfix level change add

Fixes:
Cc: stable@vger.kernel.org

My own preference is "Add support" since the driver hasn't been designed 
to support single PD cases thus far but, OTOH you could make an argument 
that that is in fact a design bug.

> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> ---
>   .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 24 +++++++++++++------
>   1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> index c0a4fa20eaf0..00285be9dd64 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -43,7 +43,7 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
>   	}
> 
>   	pstate = 0;
> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>   		unsigned int perf;
> 
>   		if (!csi2phy->soc_cfg->genpds[i].scaled)
> @@ -174,7 +174,7 @@ static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
>   unset_rate:
>   	dev_pm_opp_set_rate(csi2phy->dev, 0);
> 
> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>   		if (!csi2phy->soc_cfg->genpds[i].scaled)
>   			continue;
> 
> @@ -204,7 +204,7 @@ static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
> 
>   	dev_pm_opp_set_rate(csi2phy->dev, 0);
> 
> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>   		if (!csi2phy->soc_cfg->genpds[i].scaled)
>   			continue;
> 
> @@ -233,6 +233,19 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
>   	const char **pd_names;
>   	int i;
> 
> +	/*
> +	 * A device with a single power-domain entry in the devicetree is
> +	 * already attached by the generic platform-bus code before probe()
> +	 * runs (genpd_dev_pm_attach()), so calling devm_pm_domain_attach_list()
> +	 * here would fail with -EEXIST. dev_pm_domain_attach() returns early
> +	 * in that case (dev->pm_domain already set) instead of leaving
> +	 * csi2phy->pd_list unset; this is fine since pd_list is only used for
> +	 * performance-state scaling, which is unused ("scaled = false") on
> +	 * every SoC that has a single "top" power-domain.
> +	 */

This is alot of comment - looks like LLM babble to me. I think it can be 
dropped the code is pretty obvious, if num_genpds == 1 do this other 
thing here.

> +	if (csi2phy->soc_cfg->num_genpds == 1)
> +		return dev_pm_domain_attach(csi2phy->dev, 0);
> +
>   	pd_names = devm_kzalloc(csi2phy->dev,
>   				sizeof(char *) * csi2phy->soc_cfg->num_genpds,
>   				GFP_KERNEL);
> @@ -369,11 +382,8 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>   		return ret;
> 
>   	ret = phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
> -	if (ret < 0 || csi2phy->pd_list == NULL) {
> -		if (ret == 0)
> -			ret = -ENODEV;
> +	if (ret < 0)
>   		return dev_err_probe(dev, ret, "Failed to attach power-domain list\n");
> -	}
> 
>   	ret = devm_pm_runtime_enable(dev);
>   	if (ret < 0)
> --
> 2.34.1


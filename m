Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060093;
	b=Nc3pxvtbNdheru1Dsk+zKgOH16ttUnpkWZbZUjooJtt8O8OAW9Bu5XLV7LvGOQYmNn9T
	 0TFcWTXDGBl29p0TcomChaZaZjSzRIhsVgr5V8oGddNc3i4/+ofo1LWATuM1dZYkCyFyZ
	 0v585yzouSp3jgPeu0oon4t0LTJyR/AQcLUz3sjz75C7VDHw/iFpYp06/JWTKv82jJbZ+
	 SbO/74EfwgrbKINQz4yDzcppvLpCfr3dcUItR04KBBaqGLrAmSzRwsdlu12A0aeJdHxJb
	 Se5zNlBV+VYozFteyzLp2s6jmcCPDpMzgT9zoBagihnbSoxE7gKkRaT5iV/Fe6CwnwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060093;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Tjy5R3kSXgm6HnNAptypQU+3DBcvi4rbrJtEK8ytvbE=;
	b=fd/1SLZ3RpLuuQgj+9FVJGOyo+ciLKnF/nBcWUU8iVLbJBS4dYFRh/sF3d3uH5aCun/L
	 83DX3ExrrMxoNSSgCKNR6wVZLfzaSaT00xk6wtYHJi+UMbrq0GHbMF1ha7sMEyvAvPWZi
	 b+ZnBQL06UlfdcTvyeDkN16Hp91B/LC4ZsgJ3Gwy2uP/tR0wLZF/eMr+wS2npu00Qq1Ze
	 rYC0PrTnEt397ZoBtLAURegDJ7xlbgMn0Kpu6jH187p9BXezWfogeArYUatT7n5k7DA39
	 M5Lw0wPw8McwC4Xc3rbW11ErrcaX2EC+G+8qb288dHZKR8RUu1xhOB3xU72Kz6TBXog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Rhj+/pfK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57431606A326;
	Sat,  7 Nov 2026 14:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rhj+/pfK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2431F0089F;
	Sat,  7 Nov 2026 14:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060092;
	bh=Tjy5R3kSXgm6HnNAptypQU+3DBcvi4rbrJtEK8ytvbE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Rhj+/pfKh3TrFdYQTCB5rpTV4ItTz0OAfcEOwQ7weHKoG75w4QAxuaERMgxIj9A56
	 h5dUPYrAbYReQVUljm+x+pw/GAzBMwjQew87axKjP6Z4ZkgfkZDIKHvbawKuFjQWqH
	 HjcEtWZUVs47P4j/qLFif+Xd/SQlP8ay//4m+9NKr5KGFgG+coRic0rJISYfCXMIMD
	 rGF+P/O9heEvRxnThSCjG6C9+dkJOxao7mNNdk/2PV+G3LdRfmeVOCM8FFZ6zFJmuh
	 ZqVu6uuWQ17SxbelTIWXx5kifwdgFTG02swQjAlnyqwwltqrYCCFE6nufdjjQKb1Ry
	 ZHh5ym+mVbvYw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] phy: qcom-mipi-csi2: Add support for single
 power-domain SoCs
From: bod@kernel.org
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 gjorgji.rosikopulos@oss.qualcomm.com, 
 hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com, 
 jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com>
References: <20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 14:01:26 +0000
Message-Id: <179406008633.650304.8875272498498712274.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4863; i=bod@kernel.org;
 h=from:subject:message-id; bh=j2oZfaTQTF1f+5fNUFF8F0vY/y/dM4CiJV9kbMyThm4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7y84INY4wTlo8D5pcMhdxku5/5vJDAeUbGGQr
 ARIcjjH7AeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau8vOAAKCRAicTuzoY3I
 Ot7VD/9Uk+dq3VDSVufm77poglKmBXaU8BJl+HKSICEulqWPBV+DkkTZKA92cWzqNPjvgRHDY5e
 o8iLhTMs3kovqD3A5IrbhqfHw+YNWe7gBgOTv6ZowRl8hPshfZNymO/25lrVCCeO9jCUFE5uQUs
 Q0e1hq8UAqsx+FgetsvV3L7MPGFW6/h1NT0mzp+LYRal/1Arkq8+MNsLu1I1mEbiF0Y5qlVzETW
 7tFc1/Vk8MRv4kOtgaewRD3u6jcR2pYjQm/VOyenTvvABvQGiWova5eYvM0GAyW57t5lzUw0BgV
 g4Uv+Kvx0J3QQiDaXsRruRoE5lLNE3BbUMKWa+EaprL6NtVXJsrP55VhIKilprqu9zBqtT7qVR2
 4+iLbWWL95SX6A+DnKHdfoVHGMwRLONbA+QEo/bEZXAyri5PhVYR6dSLPpkkRMtKNc8KepnNxZM
 7K4wDhYE9f6HcqcuAoNQMK2rXqadLB7T5WVH3Q4pPR49iIWo1Do5KebmKOqHayV9HhYHk7OFxKX
 k4194dyC34k9u7+/G8M4ya/SXVMRTEtXCx6yO9oAInvlMGBixEFMerXFFXOfGmCu98C1or+1/2R
 IOWzdOxoLcK2NRNNWHuwuyRH525+eLNDDK5tlkJtsr+zKxN208bSNom1GClTHsi42vmUpZ4wGTp
 aydpZjFh07X5Bhg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-11-02 13:39 -0800, Anusha Arun Nandi wrote:
> sa8775p, qcs8300 and sc7280 each list exactly one power-domain ("top")
> on the CSI2 PHY node. For a device with a single power-domain phandle,
> the generic platform-bus code (platform_probe() ->
> dev_pm_domain_attach()) auto-attaches it via genpd_dev_pm_attach()
> before the driver's own probe() runs. phy_qcom_mipi_csi2_probe() then
> unconditionally calls devm_pm_domain_attach_list(), which fails with
> -EEXIST because dev->pm_domain is already set, and the driver treats
> that as fatal:
> 
>   1. qcom-mipi-csi2-phy ace6000.phy: error -EEXIST: Failed to attach
>   power-domain list
>   2. qcom-mipi-csi2-phy ace6000.phy: probe with driver qcom-mipi-csi2-phy
>   failed with error -17
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
> 
> devm_pm_domain_attach_list() returns the number of attached
> power-domains on success, so a bare "ret < 0" check in probe() is not
> enough to catch the case where it succeeds without actually attaching
> any domains. phy_qcom_mipi_csi2_attach_pm_domains() now also checks for
> that case directly and reports -ENODEV, keeping probe()'s own check
> unchanged.
> 
> Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> ---
>  .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 25 +++++++++++--------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> index c0a4fa20eaf0..269232499fca 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -43,7 +43,7 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
>  	}
>  
>  	pstate = 0;
> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>  		unsigned int perf;
>  
>  		if (!csi2phy->soc_cfg->genpds[i].scaled)
> @@ -174,7 +174,7 @@ static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
>  unset_rate:
>  	dev_pm_opp_set_rate(csi2phy->dev, 0);
>  
> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>  		if (!csi2phy->soc_cfg->genpds[i].scaled)
>  			continue;
>  
> @@ -204,7 +204,7 @@ static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
>  
>  	dev_pm_opp_set_rate(csi2phy->dev, 0);
>  
> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>  		if (!csi2phy->soc_cfg->genpds[i].scaled)
>  			continue;
>  
> @@ -231,7 +231,11 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
>  {
>  	struct dev_pm_domain_attach_data pd_data = { 0 };
>  	const char **pd_names;
> -	int i;
> +	int i, ret;
> +
> +	/* Single power-domain devices are already attached by the bus core. */
> +	if (csi2phy->soc_cfg->num_genpds == 1)
> +		return dev_pm_domain_attach(csi2phy->dev, 0);
>  
>  	pd_names = devm_kzalloc(csi2phy->dev,
>  				sizeof(char *) * csi2phy->soc_cfg->num_genpds,
> @@ -245,8 +249,12 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
>  	pd_data.pd_names = pd_names;
>  	pd_data.num_pd_names = csi2phy->soc_cfg->num_genpds;
>  
> -	return devm_pm_domain_attach_list(csi2phy->dev, &pd_data,
> -					  &csi2phy->pd_list);
> +	ret = devm_pm_domain_attach_list(csi2phy->dev, &pd_data,
> +					 &csi2phy->pd_list);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
>  }
>  
>  static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
> @@ -369,11 +377,8 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	ret = phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
> -	if (ret < 0 || csi2phy->pd_list == NULL) {
> -		if (ret == 0)
> -			ret = -ENODEV;
> +	if (ret < 0)

I thought you said you were going to fix this ?

Once done you may add


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

But not until ;)


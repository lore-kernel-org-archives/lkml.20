Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A302989B5;
	Thu,  1 Oct 2026 02:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790823531; cv=none; b=IIBhOyvRnpWbWSfDBt4wLNCqHNl0V7UYfHAESlwrGGDNXh5e9ZqoPtEOClUSbxUTtlUB14FqrIFrk5YQj6N/gFTX8IsyFABsHsHPmrq1M/E38zosHaUS1NBlHYxKTg2FrtdvzXkc8hoFiu0zbftujtWCY8P9Z/nLMEW+ZkbHpdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790823531; c=relaxed/simple;
	bh=8VJl6qp99SPWcn2lEl1wUkfkAQq05P0nSX76HwSh7n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLPSVbst291jD9UQG7adhu3y+lETaZOIuRmhpK7EFpdPyEPGXp8zlKYSCG02FiEQF2u56mqFFPM/VnIWPUhzWgntuzbcOgru7n9wWvNdJW2d2qT05kIG4PvmMpsX5FAV+7/bP9bV6V0IrwbrOJPJ5VnBD1xhGcmXHs+WY8Lpkmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxzCWzO3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxzCWzO3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6F11F000FF;
	Thu,  1 Oct 2026 02:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790823529;
	bh=JOZOTJwCpuTZmXU9tMGDfhtlt1sHtnbf80BD/cb3634=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gxzCWzO3csO5VOmk9PNIPb4uHgtaZ3VYO4Q6PWrzzE/ebXawSAM6kFnEhFK+74+mX
	 OB20QPpUwHM2SfIFhoTbNZ2Kw+D9Y3YY1JFLV0bakivcra6CMx844hAVissgjwweU8
	 RFzXxB1FNig7IIaaPJsrR8R5tA2LO+XfEp6iQTBoNycCpX0thxLU7c6kM+wFq5wF4x
	 GWJqpsXLUpBH/loAvCNEahL2dlZd3X95X+JWoOCJZNlaNrsQlp6GKsfA5QWeFi/tb5
	 2GeHA4PDnaLmGLkrQlMGrGei099/zXDmx+jEXS/ar+4r9Rlw12usbLxZ+f1haJ7adP
	 HxAjmRKQepxIQ==
Date: Wed, 30 Sep 2026 21:58:45 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Add WCN clock to
 wcn3988-pmu node
Message-ID: <ar3LTBFtF_qqw7U2@zenbook>
References: <20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com>

On Tue, Sep 29, 2026 at 03:31:29PM +0530, Yepuri Siddu wrote:
> With RPMCC proxy vote removal, the WCN clock must be explicitly declared
> so the wcn3988-pmu driver can vote for it during WCN power on/off.
> 
> Place the clock in the wcn3988-pmu node since the PMU driver owns the
> WCN power sequencing. CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses
> RPM_SMD_RF_CLK1, reflecting the WCN clock assignments on each board
> variant.
> 
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> ---

Why do you have one problem description above and a different one below?

The information after "---" is not merged so the git history only
contains the one above - and there's some interesting details in the
description below. Perhaps this is the b4 "cover letter"?

Please revise the commit message above with some of these technical
details.

Thanks,
Bjorn

> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
> every clock, keeping them non-zero until a consumer takes over. On Shikra,
> the BT WCN clock was surviving on these proxy votes. With proxy vote
> removal on QCM2290 [1], the sleep vote is no longer held, which means the
> WCN clock must be explicitly declared in DTS so the wcn3988-pmu driver
> can manage it during power sequencing.
> 
> The clock is added to the wcn3988-pmu node in Shikra DTS. CQM SOM uses
> RPM_SMD_RF_CLK2 while IQS SOM uses RPM_SMD_RF_CLK1, reflecting the WCN
> clock assignments on each board variant.
> 
> Validations:
> - BT enable/disable verified on Shikra CQM, CQS and IQS EVK boards.
> - Confirmed WCN clock voted on BT enable and released on BT disable.
> 
> [1] https://lore.kernel.org/all/20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com/
> ---
> Changes in v2:
> - Move clock property to wcn3988-pmu node instead of bluetooth node.
> - Drop hci_qca driver changes; clock is managed by the PMU driver.
> - Link to v1: https://patch.msgid.link/20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> index 8ac42ff625a0..48af2bb87cf3 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> @@ -45,6 +45,8 @@ wcn3988-pmu {
>  		vddrf-supply = <&pm4125_l10>;
>  		vddch0-supply = <&pm4125_l22>;
>  
> +		clocks = <&rpmcc RPM_SMD_RF_CLK2>;
> +
>  		regulators {
>  			vreg_pmu_io: ldo0 {
>  				regulator-name = "vreg_pmu_io";
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> index 4ff97945274d..90aceaa6e1e3 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> @@ -52,6 +52,8 @@ wcn3988-pmu {
>  		vddrf-supply = <&pm8150_l8>;
>  		vddch0-supply = <&vreg_wcn_3p3>;
>  
> +		clocks = <&rpmcc RPM_SMD_RF_CLK1>;
> +
>  		regulators {
>  			vreg_pmu_io: ldo0 {
>  				regulator-name = "vreg_pmu_io";
> 
> ---
> base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
> change-id: 20260925-bt-wcn-clk-enable-9de068334aa1
> 
> Best regards,
> --  
> Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> 

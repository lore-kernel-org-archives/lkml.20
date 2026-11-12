Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474479;
	b=xtsrElM3BCyodFgncKUl+qMwWJ5CHpyEsHVtbYh+rT+tVrBkf00x6K9KM9R+dkga+RFO
	 Tg7zlT7dbgqAvEJxii5MmzxQKIkashgZT64no+SLyDCeqJH1ZBr0E+a3XIdjPRGeGlFlt
	 yFNhVj+k6Li4Fxj8UCOa38hLrO89CncQwR+nzElf5WMXgIlSQgRyYpW88s4/AiPwaoWzE
	 oxULIKl/gEWY3RwDh8OPyhYbRX+W6XtswofjjF4xzLSCGE5IP5AH+kTMilsCsth10KLcN
	 v6lIalN4IP5j9SM6TY1PcdUj5j98P7al69P83hRT3TUBQuMpHSZPMEMj1seKmyryYvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474479;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=OF0u0KtMNSYjf4aGiBx32yBnOG/70jjYboMrsuqMBIo=;
	b=x1+0L6lNdOszu8sJU53O/0VXN7kW/ND6R/+yo5paAXV6q7R97ZFlDjvdkHFJzki8dvtZ
	 aiwE99LHKtlsp6XuBHxI2KFSqqhcu7+WDw4D+QUe3DsabqpZY2oRxchRtJo+R6nO1Ko1a
	 jUcjxLUEthEMh8mRW2hhmalSrCB9a8m5hd+uTExo803h5WFMe39I8pOThqkNDukqS5hLU
	 gzRgzC2b5mwjEpOrnEQkrv7AChNavUfo0cEDPrY6GJ/UtqhJNy20wSGthKodsSU11YIkH
	 qbnBIq+UtOW1CM0jqOnbfqJQIE45lsyEHeq27io4ToeFLlxqFXi5SRueZnJ9luWIxeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IaZUX26L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25CD606A321;
	Thu, 12 Nov 2026 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IaZUX26L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878F91F00A05;
	Thu, 12 Nov 2026 09:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474479;
	bh=OF0u0KtMNSYjf4aGiBx32yBnOG/70jjYboMrsuqMBIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IaZUX26LDTHdKSsVMwo3x64phL8c9/CKYh6y1bb+uONWOzbuKkuvmdglPAg85EwoO
	 MQ/l7jbGRTgmhuREBLiAh1ItzF9G8Pd238XrHRr4zv6aLsSCrD/4ZQqBaSCuNnYykH
	 lJecAqh4qKL//jfMHiToZurFbXmpkCeorS0NLCEkfSjprcK4kbw7O7FoLj+/pU47yu
	 VLDMj+QiEAHnuvgV1Dydh9PbaW6KKatPv0eEEtVdPb6pFh3S14qfPq2ta5gGr2FnOk
	 qTfXOCviyPdDROCF1P27q4W7yySYwODFwIqpWQGvNbg+YZ/u6geMHCe1S1iMY4eKUB
	 gjRvxiWN/gcoA==
Date: Thu, 12 Nov 2026 14:37:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power
 leakage issue
Message-ID: <avWB6_hSarfdJV5-@parshuram>
References: <20261112-smb-repeater-power-leakage-v2-1-0f8ee55c4962@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261112-smb-repeater-power-leakage-v2-1-0f8ee55c4962@oss.qualcomm.com>

On 12-11-26, 14:07, Krishna Kurapati wrote:
> On Glymur, it is observed that although the exit call is done, there is a
> power leakage seen on SMB2370 charger (which embeds the eUSB2 module as
> well). As per recommendation of HW team, disable the repeater during the
> exit call to prevent this power leakage.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased on top of phy-next since [1] removes the base variable in rptr struct 
> - Kept the RB Tags intact since its a rebase
> 
> Link to v1:
> https://lore.kernel.org/all/20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com/
> 
> Compile tested v2.
> 
> [1]: https://lore.kernel.org/all/20260721093626.96264-10-angelogioacchino.delregno@collabora.com/
> ---
>  drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> index 89bc1c89fc85..607b5a5a1713 100644
> --- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> +++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> @@ -227,7 +227,9 @@ static int eusb2_repeater_set_mode(struct phy *phy,
>  static int eusb2_repeater_exit(struct phy *phy)
>  {
>  	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
> +	struct regmap *regmap = rptr->regmap;
>  
> +	regmap_write(regmap, EUSB2_EN_CTL1, 0);
>  	return regulator_bulk_disable(rptr->cfg->num_vregs, rptr->vregs);

This fails to build:

drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c: In function ‘eusb2_repeater_exit’:
drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c:231:24: error: ‘struct eusb2_repeater’ has no member named ‘base’

-- 
~Vinod

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497B72F531B;
	Mon, 12 Oct 2026 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810620; cv=none; b=QGrYKtcECOwgWIBXvLOT0QzrXErZNvd6n1IkBBba4rfY57SCn4C6kwL85N2i2iYazSB7J52KoLGRNb14/WYT/9LTbh/nYtYnLUz2rRVqzTuS+s+wWVpQUXsIfa+pO6KjsaFhmeVEtQYPfmBJVEy98xriOGR8LXNS2D4s3OoGNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810620; c=relaxed/simple;
	bh=JGM5+5NIxFH0UxhJrNGlH3U+v0q++ETfbaP2tmO6v14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlBr/6NfvaeAppxpFAyiPNJ0Z0N9Zy6CsET3rIgkMb/rJdVsHfQG+Scj9R2MrSupweJJdZiNEBto1daYsLTVgm3iIenwudN0Ymqea4b4yFpVRZNN+ImoO+XQVzVpkQYkEOHiDmAaaXYPPNr98eHUmTDDoUlVmE6XR02EPHTcyPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TiGEoKXO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TiGEoKXO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3311F0089B;
	Mon, 12 Oct 2026 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791810619;
	bh=Hm8t+0jcsmAbnmkcfRmrxZO51C4KAD9iDIQ7CryQtLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TiGEoKXOvF5k/tIjKBdt5IEBQIreojNnhKNoj1TLKyczalBvlH8Gt5AtjOpJ8pXHI
	 DRVM4cCIfeT8QncL5+byaN4wJrKWRdkWOiZcytlxxWr4xRALLGwYM2PX0Zr/YTctkr
	 hE/elyu8PZ7CK2vCFfKtPbBL2te7+8hkFMcEqV8cGB0CRb/ObKG6S3tCni2gMwoWuS
	 COXupSlXhYWJEr9mpLX3Y53bIqOE6at1T+IVbX7VMYwzRpbQIuFzdWkw/2NNS8BUs8
	 LlvloKTuS1pvBEzHCE9mg41/fgz4f2xLr41r+83Ok92GkVhu60mrc9yOJIca7BnZIi
	 L6i7CZqKq0HBg==
Date: Mon, 12 Oct 2026 18:40:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Oleg Keri <okerixx@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Michael Scott <mike.scott@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] phy: qcom: qmp-combo: check qmp_combo_com_init() in
 the typec callbacks
Message-ID: <aszb9Idx6UDHzyv6@debian>
References: <20260909151443.10276-1-okerixx@gmail.com>
 <20260909151443.10276-3-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909151443.10276-3-okerixx@gmail.com>

On Wed, Sep 09, 2026 at 05:14:43PM +0200, Oleg Keri wrote:
> qmp_combo_typec_switch_set() and qmp_combo_typec_mux_set() tear the common
> block down and bring it straight back up on an orientation or altmode
> change, but they discard the result of the bringup:
> 
> 	qmp_combo_com_exit(qmp, true);
> 
> 	qmp_combo_com_init(qmp, true);
> 	if (qmp->usb_init_count)
> 		qmp_combo_usb_power_on(qmp->usb_phy);
> 
> If qmp_combo_com_init() fails - a regulator, a reset or
> clk_bulk_prepare_enable() - it unwinds what it had brought up and returns
> an error, leaving the clocks disabled.  Both callbacks then carry on and
> qmp_combo_usb_power_on(), and dp_aux_init() after it, write PHY registers
> with no clock running.
> 
> Propagate the failure instead.
> 
> Fixes: 2851117f8f42 ("phy: qcom-qmp-combo: Introduce orientation switching")
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 7d740ed0ce16..44b6f29926dc 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -4924,6 +4924,7 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
>  {
>  	struct qmp_combo *qmp = typec_switch_get_drvdata(sw);
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	int ret = 0;
>  
>  	if (orientation == qmp->orientation || orientation == TYPEC_ORIENTATION_NONE)
>  		return 0;
> @@ -4938,15 +4939,19 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
>  			qmp_combo_usb_power_off(qmp->usb_phy);
>  		qmp_combo_com_exit(qmp, true);
>  
> -		qmp_combo_com_init(qmp, true);
> +		ret = qmp_combo_com_init(qmp, true);
> +		if (ret)
> +			goto out;
> +
>  		if (qmp->usb_init_count)
>  			qmp_combo_usb_power_on(qmp->usb_phy);
>  		if (qmp->dp_init_count)
>  			cfg->dp_aux_init(qmp);
>  	}
> +out:
>  	mutex_unlock(&qmp->phy_mutex);
>  
> -	return 0;
> +	return ret;

Please don't use this pattern. Success should always do 'return 0' directly. Do
'return ret' only in the error path.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

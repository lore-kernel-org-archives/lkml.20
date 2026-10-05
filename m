Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF13C3806AD;
	Mon,  5 Oct 2026 08:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791189904; cv=none; b=NzaC2bKiQZK47vKM6h+PUrpDZ2wsd+Zci/LxqSTxmDerJz5SED1ZCZ/3yI8a04fPrTUpE6Xr16eaH3iO8sR7pVMOCE2Ez8IeNUlyojZXfzoHK8Yui4inPUDx2IXkm8UELpyxhud/ditHpiy/yLtMihD/MEjteqGt9Mo9XzNOxRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791189904; c=relaxed/simple;
	bh=v7fBogfEa4SyyyvCAt2cXY9omS2YlKzUV5YfX5OoCdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6fWI9mfpDxAWoq50M3cawHhNrYqb3+JXz9SCzlHZLUP4Ikun+aodClidtEreScN28KFlJSzmLIM2BhuxNicEOuiNUoe8lp02IpgpkvI7ik7z9bYQhBJ5brGkiApe7rsDmZEPRITs5MkcnrLW1UmGbSSwRZjRx7F+ArnttAE0dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATksT9qc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATksT9qc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75C71F000FF;
	Mon,  5 Oct 2026 08:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791189902;
	bh=yu0jeX6WAJv4JtgUQ7WdlwZ7yT+kLcw/DK3wWTM8lF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ATksT9qcj606k9JWregl4eW5+phJ39KeCgq22MOa38VA5rhOTUdfYGpS/NXMkVrr1
	 NbwsUxVMQSQ1Yl1F2UkTYY1r+io9jqfAHQw6uQjuVrUSCS13AQsjp7VsRfENZaQEb1
	 XjNaieHCRvp5OQwuHxuUdowfrsO3MotjvwBmVk22w9zWwsVOwmIurTFdteBjZCR3K3
	 6i8bCwta0V5GhFYRHVWxljx1H1SzNvv41FCEklW1JaaZjC3YjZp2VhJhiWTQ68J4d9
	 4hUL0Ng/BVdUarII1B9Qms10p2M9CnmmHwqsYwTXJMhyHsRTRY/6lb6bDWKSuEUA90
	 9Ny2sKzI5vzVA==
Date: Mon, 5 Oct 2026 10:44:59 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Message-ID: <asNji2_GUda8x245@parshuram>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
 <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>

On 13-09-26, 20:10, Krishna Kurapati wrote:
> In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
> required to know the type of phy (rather than the operating mode) because
> DP and DM interrupt lines need to be configured differently for each of
> them.

Does the controller care? In preceding patch you defined the EUSB2 in dt
type, so this describes the hardware. So phy knows it is usb or eusb...
> 
> Add support to cache the PHY_TYPE and add the following helpers:
> 
> - phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
> declare what type of PHY they are (in this case PHY_TYPE_EUSB2).
> 
> - phy_get_type() for the consumers (like USB controllers) to query the
> type of phy connected to them.

I am not convinced that this is the way to go... Driver already knows
the type and should use it...
we alreayd have mode, i am inclined to not say yes to adding type here

> 
> Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index ea47975e288a..038c2b58bbe1 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -21,6 +21,8 @@
>  #include <linux/phy/phy-lvds.h>
>  #include <linux/phy/phy-mipi-dphy.h>
>  
> +#include <dt-bindings/phy/phy.h>
> +
>  struct phy;
>  
>  enum phy_mode {
> @@ -152,11 +154,13 @@ struct phy_ops {
>   * @bus_width: Data path width implemented by PHY
>   * @max_link_rate: Maximum link rate supported by PHY (units to be decided by producer and consumer)
>   * @mode: PHY mode
> + * @type: PHY type
>   */
>  struct phy_attrs {
>  	u32			bus_width;
>  	u32			max_link_rate;
>  	enum phy_mode		mode;
> +	int			type;
>  };
>  
>  /**
> @@ -262,6 +266,20 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
>  {
>  	return phy->attrs.mode;
>  }
> +
> +static inline int phy_get_type(struct phy *phy)
> +{
> +	if (phy)
> +		return phy->attrs.type;
> +
> +	return PHY_NONE;
> +}
> +
> +static inline void phy_set_type(struct phy *phy, int type)
> +{
> +	phy->attrs.type = type;
> +}
> +
>  int phy_reset(struct phy *phy);
>  int phy_calibrate(struct phy *phy);
>  int phy_notify_connect(struct phy *phy, int port);
> @@ -393,6 +411,15 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
>  	return PHY_MODE_INVALID;
>  }
>  
> +static inline int phy_get_type(struct phy *phy)
> +{
> +	return PHY_NONE;
> +}
> +
> +static inline void phy_set_type(struct phy *phy, int type)
> +{
> +}
> +
>  static inline int phy_reset(struct phy *phy)
>  {
>  	if (!phy)
> 
> -- 
> 2.34.1

-- 
~Vinod

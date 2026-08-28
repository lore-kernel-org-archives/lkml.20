Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1904824E4C6;
	Fri, 28 Aug 2026 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908542; cv=none; b=uM4hPp685kdJ5jdI4YlXf7WSz0W2v/pUWfYjs3net2f31141+Rm7O2U788o6uD0XpHQrpdT5munC4m79kZFRLHm7e2WdegzJiYfM5RUaGKoG6KbizCqYp587Jo8vfkN07XetUHuv3cTdqC9rn6lNd+jUF3dzZEt0JluW8gznATU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908542; c=relaxed/simple;
	bh=joTa+aA87n5FHwG5f29JGzpn0F/DcR2PpkEJKKsA/XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXFF0YOLrFZUZREW+sYo8AGajY0M1n4YPJDG3pxBkh4df3ePk7g6t+5szmEvX1l9n9e2KVaOTo2p7MdUTy71eBP7k9H4PR5CcfMOrCSPjNJ1xwL9I9F1ELCriHQfd4xDJg4Zm9mM9q9tfgBbHdNJabU9tzlSN8ov2OVka2ODp8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwBtwHrp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwBtwHrp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D801F000E9;
	Fri, 28 Aug 2026 09:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787908537;
	bh=WJNyvam/TtvWT9CJFPp25i1xg+QAJMyXxSbtCFngQEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bwBtwHrplo0MqMZ/i1Jl3lgV8BAaxpSqNtPGwa9HxzmGCvoEvNCJDYv9/MwkNTZk3
	 um08+x2LtBx1MrjuXZE5MwNOe3hxYv1ZvqjIVxX+Iejb6uoRbIGVy4NasZ+QUjx8Vp
	 bK7jC8KjGPn/RmAe0eEdaELgOwyyZsn5qxuJTS0ixU/u/ltD+HKNWBFetDxoWVwm/K
	 67Udx9oJ9MGQRyJ6UT3BMBIRa/b46qFGhgB+ctJLSn/RUJUvYk457JvLNqHNihD+Ln
	 vKWplwD72TgaCNTijybmAyONWP0dQm63z5gxMU2nV//Xv3ENIE40bxMqRzcq2B0GuB
	 fU/t8e/XAQmNg==
Date: Fri, 28 Aug 2026 11:15:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Pankaj Dev <pankaj.dev@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 9/9] arm64: dts: st: Add USB nodes on stm32mp251
Message-ID: <20260828-blue-caterpillar-from-shambhala-5c5dbb@quoll>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-10-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822074816.548662-10-marex@nabladev.com>

On Sat, Aug 22, 2026 at 09:46:42AM +0200, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
> 
> Add USB controller and PHY nodes to stm32mp251 DT.
> This includes two USB 2.0 FEMTO PHYs, USB 2.0 host
> controller and DWC3 DRD controller nodes.

This looks early unwrapped.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Co-developed-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
> V2: - Fix up Sob/Cdb lines
>     - Move PHY into syscfg subnode
>     - Turn st,stm32mp25-syscfg into simple-mfd
>     - Use clock-cells = <1> to discern OSC and future PLL clock from the PHY
> V3: - Describe OHCI clock as the CMN clock
>     - Fix up Sob/Cdb lines further
> ---
>  arch/arm64/boot/dts/st/stm32mp251.dtsi | 65 +++++++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 6e985f115b195..dd2f7ddd9b634 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -1746,6 +1746,47 @@ stmmac_axi_config_1: stmmac-axi-config {
>  				};
>  			};
>  
> +			usbh_ohci: usb@482e0000 {
> +				compatible = "generic-ohci";

So probably this answers my previous email about USB binding - you
really should have a specific front compatible. That specific compatible
also would narrow flexible properties, like clocks and reg.

Best regards,
Krzysztof


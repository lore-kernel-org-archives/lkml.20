Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF57C2F9DA1;
	Sat, 26 Sep 2026 04:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395231; cv=none; b=KlJAb/EB+ZGjn9eStNdfeh82fLO2m/HP4RE9RV+6V/SoEggfPy/IyHmnVRXq6VWCmpiezaZikrJgQ+JFX7GjgXcJivZIpNL3p3nQTykkoyOvgzB5DiEhTGj6nyHioE9OzRjBMAm2B9AXri0/OthetU1fWT9xuO/ES0tjMjgQYcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395231; c=relaxed/simple;
	bh=rewsdjk+AJOh6hEmpuCCysWe3pkyLS290V6vWlnD7gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMweKOxI+Yuq6B0sS81vg9Qw4Ge68DXq9W+vNR5IjpaeZODw3P5zwgMiTFvAIJXAsyi8ttebGGUQx3fmJYAXViQEyIwABXHELzPbYku+wmXEK9YOn9nJ2CbM70oqTRe1rDIKuDkadzEspaJoq+HtfP/XpiawjlRm1DGdfNrm2NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHyOVuAi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHyOVuAi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E2D1F000FF;
	Sat, 26 Sep 2026 04:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790395230;
	bh=F4UBu+84T6JxlOLmyooaE0xl3mvL4E80lscJeguyt6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bHyOVuAicfEfvrD5EUPlf+cLfE0R3n65imqvZRIrKibD9xfPaWgQKyDPj8o9ohuMQ
	 24JOK8xUwECa7WcNSUGcwSvEKFGDiOKLurxtI7OdzW4J2wsJ47QOFm7vK4MYOvIfsj
	 Lu8En2Q7VGyNOEj15L3JAlPTlYVBWbDoapq1Unl939ES4M+mzsnwn4wF7LqO6Wn4gC
	 p9zbwFfMf7DYDysh6WwF+fAz6CHIRvdswaTZZL09aYXnEES10FucKNhz/azJQ2O590
	 A7qtBRWZQQDXTdvvKZd6Xml4UfxhC074q4UGR0MHetrgzGJlGI1XPj2j9300UinqZN
	 sXibrWe5Gxs6w==
Date: Sat, 26 Sep 2026 06:00:08 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org, William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v15 09/16] phy: rockchip: usbdp: Fix LFPS detect
 threshold control
Message-ID: <wnpn67manvymzrkqcnfvemhu32ifycldjgb4gvx2fvpfvayayv@zdeb2caeykxj>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-9-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-9-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:49:56PM +0200, Sebastian Reichel wrote:
> From: William Wu <william.wu@rock-chips.com>
> 
> According to the LFPS Tx Low Power/LFPS Rx Detect Threshold [1],
> the device under test(DUT) must not respond if LFPS below the
> minimum LFPS Rx Detect Threshold 100mV. Test fail on Rockchip
> platforms, because the default LFPS detect threshold is set to
> 65mV.
> 
> The USBDP PHY LFPS detect threshold voltage could be set to
> 30mV ~ 140mV, and since there could be 10-20% PVT variation,
> we set LFPS detect threshold voltage to 110mV.
> 
> [1] https://compliance.usb.org/resources/LFPS_Rx_Tx_Low_Power_Compliance_Update_Rev5.pdf
> 
> Signed-off-by: William Wu <william.wu@rock-chips.com>
> [Taken over from rockchip's kernel tree; the registers are not described
> in the TRM]
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

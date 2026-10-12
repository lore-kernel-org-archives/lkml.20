Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D1A4734FA;
	Mon, 12 Oct 2026 12:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809294; cv=none; b=dIvw+mXrfGv8D8GbJ5HtyvVauczxW7IXEWC6cu0S1Vwzg4Cr/hcEPrlf4C1lAVrFUb5sDTruaWwkHp/PTRRcZ9w4xTMoDkzpZiJfnZV9TjuF5hOUNDer2B+hifFmM4iu1uxKMteF+o4Ij11NtU4jhcTjnnmOHsMTyXbk9IeFFFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809294; c=relaxed/simple;
	bh=VYTTUHSrCPwHTtNF8z4kqeX3YgU9zzF/qavLyFzhOAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gz2rQ4e0peyRxLbWvXYQu01L2i/ChyXiSAHmqbKJa9JZ9J3rOoEUW0OzgpyfSmpzOwDvdfQeb8lh6HhrL70kkU2izf9P/uoWHzk2D4tjGaMBMKxKn5t+jHJftscKiNjlW6EcTgKipEYusaTBqmeEppV+s2C1K+WoKx4zq1ndyRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhtpWfCa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhtpWfCa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF8E1F0089B;
	Mon, 12 Oct 2026 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791809293;
	bh=vTV/O8cQCIdqTWk1rejODfRz9VObDHG+pxwgvTRExLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IhtpWfCaNrwNreL5w8MpcWCPQgGQmZVP2UGp3dAalVRV7iQfLqI2vsMjlxu0LRiyT
	 M7WWZTh/5cpmUnIJhnH6Ztx8xsdHys7Y7InwmAErIkdNuuT4ePBqReBY8bMgu9k1LM
	 BUJ6aR8CgvHbHOpV4wGso08iNvx/JLUoqkpWEiBoTKqx6VlYcW5+0FISd1zArRYp6q
	 nf52Lvgj8Xxsc43nL7Pt2CmOTL59i0CIj6MLA1jrn/v1UDaE3HT4la7pG+vhv65+Wq
	 hLkrLVOUuSftrtju38PX2+CMQ+/rLHrdnm7N90vUPJbCMgyx2PmPW47qqawMVKvRf+
	 9B0v70z6DjWWQ==
Date: Mon, 12 Oct 2026 18:18:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Varadarajan Narayanan <quic_varada@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Stanislaw Pal <kuncy7@gmail.com>
Subject: Re: [PATCH v4 08/13] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Add
 support for USB3 PHY on IPQ5018
Message-ID: <aszVkqtadyCIjU_7@debian>
References: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
 <20260908-ipq5018-usb3-v4-8-b789702f0695@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-ipq5018-usb3-v4-8-b789702f0695@outlook.com>

On Tue, Sep 08, 2026 at 01:41:01PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add support for the USB3 PHY on IPQ5018 chipsets.
> 
> The PHY outputs a 250MHz PIPE clock routed to and gated by the GCC, so
> register a fixed rate clock. In addition, add the register/value pairs
> for the PHY initialization sequence.
> 
> The code to acquire clocks and resets is the same as for PCIe so no
> changes are needed. Add a USB3-specific helper function to acquire the
> required regulator and TCSR syscon for USB mux selection. The PCIe and
> USB3 pads are muxed so select USB3 mode in TCSR which needs to occur
> before the DWC3 USB3 controller resets. Otherwise, the SS link doesn't
> train and remains stuck in RX.Detect.
> 
> Add PHY ops for USB3 power on/off sequences to account for USB3-specific
> delay timings and enabling/disabling the PHY supply.
> 
> Rename the existing reset delay timings to describe they are for PCIe.
> Lastly, add the USB3 PHY type to the UNIPHY PHY type enum and remove the
> GEN2 and GEN3 PCIe types as the driver makes no distinction between the
> two which also makes it easier to distinguish between the PCIe and USB3
> PHYs.
> 
> Tested-by: Stanislaw Pal <kuncy7@gmail.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

LGTM! Just one minor nit below. With that fixed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

> ---
>  .../phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c  | 178 ++++++++++++++++++---
>  1 file changed, 159 insertions(+), 19 deletions(-)
> 

[...]

> +static inline int qcom_uniphy_usb3_get_resources(struct platform_device *pdev,
> +						 struct qcom_uniphy *phy)

Drop the 'inline' keyword please. Modern compilers will inline functions on
their own irrespective of this keyword.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

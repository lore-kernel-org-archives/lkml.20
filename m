Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA26D4189C2;
	Mon, 12 Oct 2026 12:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808664; cv=none; b=DauBmGjntyKM/gN2BDeK1aHkNqyyyUKyw9Yu3RgJSSyTdfkLH1UiaF602COTXp6h0kyeHRBBD6OkRHslGPJCegcMzfUW3b+8rB665kELjxaOiVYoDhDVPKlo97kdR+AHWgKN0Fsq6mvRUuCnR1ZbBDvlVgq46wui7E9qv+1+JBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808664; c=relaxed/simple;
	bh=9AWYYSDa6SCm+/g6z4QXgjnuexBF14nbrZE0n6ErnDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gw8+hjvztjvg9+Y/KJm87iRxL7UanwXbE/SKWliUxYVoQqriDNZ3I2DtEg6j/pRIfq8Airfe+v+QR3nhcUfLWqtpfsdo934ip8nqyL/n89z8kevwpg/Exbru1ExLhsxBK++NKRv5u9T3VX8X4BbgIWBwJPogebo/Mw+Ngc97b1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKNTjxZM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKNTjxZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0591F0089B;
	Mon, 12 Oct 2026 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791808663;
	bh=p66xA6HMJ+HyXp1W0C0rgTV6OarYb4WpLpc6MP7K344=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AKNTjxZM/O3cmclTrGJQXraZpzoaHpSr9sNvM7l4WOJBNbIh8CoPUkP1EMwJ5von7
	 bfeCq7WgGGrD7VxtkZG/Y6DNtgtWCjxwDMG2r3trWZaYPfhUTeZKScVe0y4NxUW1L8
	 S9fZ1BDLlTdienpPXmtvkevEb/ReBw5jqqS5kC2u6ROjlmGhloKw4Mgaaf266PzOVz
	 7B4sZerAplWUSeuxutGAdvgKH1qJgUcd2lU8wincY5Dq8FzTCh32gCEPisTbf8YQ5J
	 ZDXJQc1/p0mr4IZPdYQnJN3QqWYCi+dobg0UDYPkCp58zWMgTqo68KWWooePwGa9fR
	 Hjb6LF5HOH/pQ==
Date: Mon, 12 Oct 2026 18:07:31 +0530
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Stanislaw Pal <kuncy7@gmail.com>
Subject: Re: [PATCH v4 02/13] phy: qualcomm: qcom-uniphy-pcie-28lp: Convert
 to PCIe/USB3 combo PHY driver
Message-ID: <aszUGe85aahu0vW9@debian>
References: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
 <20260908-ipq5018-usb3-v4-2-b789702f0695@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-ipq5018-usb3-v4-2-b789702f0695@outlook.com>

On Tue, Sep 08, 2026 at 01:40:55PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> This PHY found in IPQ5332 and IPQ5018 SoCs is actually a multi-purpose
> PCIe/USB3 combo PHY. The driver was initially created for PCIe PHY
> support only. As such, rename the driver and generalize function and
> struct names to reflect that it is a PCIe and USB3 combo PHY driver so
> that USB3 support can be added in subsequent patches.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Stanislaw Pal <kuncy7@gmail.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

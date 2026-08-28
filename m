Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904743B05BB;
	Fri, 28 Aug 2026 10:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911751; cv=none; b=IeyWjoP+B9b3SymPTbE/VzPnlDd9+hSAo2zqAv1Yt3q1ZBX013ltRJ52ln6RUBydmvoXBlHQaAZgTF9ddNC8c2AsymV++wv3AKYPugXD6OW9040/BuKS/II4t22z6rummICUtbbhkU6Tf/0hXuTPoh6eYLYRUn6pYGkBxASKXAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911751; c=relaxed/simple;
	bh=2NuZ6+7bqA+Y3sg8dS89qcBPRCCWdREa1gM+3vhCIQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIBsM2uUK1b4aRuDuMP/viObOwgmI6gmtIBKvmKmDkrBCnNyJaoVlZd8bHBF1Co19y4ADZ1DXZS5qJcC8t6Y+VV6lRB8WlsVlBB1qwxIM08Msj5Ha6Io2nCH4yPbewt686p93YbrnvQGhjY3YDJwNjN/094d9BUnHxKTi0kawTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LY3nabWw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LY3nabWw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BD41F000E9;
	Fri, 28 Aug 2026 10:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787911750;
	bh=y+wirH+XRJLmQuXzFec1vwsdVhSbWNoZgC5yT7+QDH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LY3nabWwaHHnAtNbqAQaLgLhKaZlmQs3rBv2v6i7BCKi5DwMCHe7qgax+32qVIf8S
	 x/3hnlidcexJPihSCpiEsZLj02Xuo374D10Bm5PiJa2/i/gEChbAcEwK2+Q/S38weW
	 63Mq+Tkyc7sl4F9zjNTjwn3v/XvVCrjYCEtOxw3V0T4oNdv/DcZUPubWxj5Zxquds9
	 0gFyN8ztDmHsqFdN7DihCkpwZmSTBVzM9+qdcfTDiE8y9uPEkF+04dds6nzDQ9+EBM
	 IEPPAmBJD4evBNyZ/g2Lki02w71l6zsN4av3HgsalWhaNefr8eyP+cF8E+43oVwgDV
	 l7c0uh3ZDpHEQ==
Date: Fri, 28 Aug 2026 12:09:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: phy: qcom,ipq5332-uniphy-pcie:
 Change to PCIe/USB3 combo PHY
Message-ID: <20260828-wisteria-fennec-from-arcadia-a44ebe@quoll>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-1-39be0955a6aa@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260825-ipq5018-usb3-v3-1-39be0955a6aa@outlook.com>

On Tue, Aug 25, 2026 at 04:37:18PM +0400, George Moussalem wrote:
> This PHY is a PCIE/USB3 multi-purpose PHY. Initial support was added for
> PCIe only, so rename the binding and add support for USB3 PHY mode.
> 
> The PCIe and USB physical pads are muxed and selection is done via a
> control register in TCSR. Add a new property to the binding to enable
> switching the default PCIe mux selection to USB3 mode.
> 
> In addition, USB3 mode requires a 5V supply, so add a vdd-supply
> property for it.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  .../bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml | 109 ----------------
>  .../phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml     | 141 +++++++++++++++++++++
>  include/dt-bindings/phy/phy-qcom-qmp.h             |   4 +
>  3 files changed, 145 insertions(+), 109 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml
> deleted file mode 100644
> index 6e9df81441e9..000000000000

Please do not rename the binding. Old name was correct. New one is not,
otherwise please point me to the compatible like that.

Best regards,
Krzysztof


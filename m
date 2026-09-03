Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACEA3EC812;
	Thu,  3 Sep 2026 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430913; cv=none; b=rqwawlNrrJAcrixcteUHOzaF3n0lu6vEFHVKIDli+yw/nM0iZdA8vQONBLpVWwCp7xgUjscdTeaaYYwZInwmM6CBuIjtpfBCfMSTaaP2CyjscsV8qzb+sYG2CwGoy8ckuVEm2lKDw3fXUAqLTV1Dde/vHO4aKDSguuv93WWNoFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430913; c=relaxed/simple;
	bh=pwkg7MkO4mAYBjnhsU+bpr1yhpghea0p/7vc51j650s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvMCKcxO0XBCD+Se0J7FFM1n9+sbeq/1z3mnfjBuRc2gypK+btLPUDlSZFSDcnhnlqVVoGQ0BBgoy+J8wyhTtBMtr0tS+flI3d6A2gjAQyM+eUkmUkZ3xO6s4bZoIrsHSgylsy/2yqzUAkedCRlp5bDrs7C6vardf4Ic+7NcC1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UdJCgRYi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdJCgRYi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2778A1F000E9;
	Thu,  3 Sep 2026 10:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788430911;
	bh=DG3ETLwpvZWp9G6uVKYwVMayCE+2qGPVkiCIO+D2qoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UdJCgRYiGxgxofgPmmnRe3ybxL610Eti6L6W4wjMq4wMiRZ4cwcdpjXLelFl85FOd
	 MEyThvM30/9u/aMPjxvqTRcu6YS12Jfrrjq47M3XHYaGV4//oys9PrZoFXZn98lbnH
	 LOXrfYOWRbIkur0g9wLKmHv2270Hgn4NKDxFP1j4RDkb/abnjmNvewofs6ZNM6BbBZ
	 GbOF8BGf5teK8QXRqWWZyqtWDEJ1Kop4ufYCiFy+91G4/RvTk5DSFBQfGXANZUYlbO
	 TpFveq00szdIViG9NZnkiOK/ALct2t0DVDp4D+OGfWX26JE3vx250NUup/ijCcC/Yx
	 ZzOLWB+ZY7pTQ==
Date: Thu, 3 Sep 2026 12:21:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 IPQ9650 compatible
Message-ID: <20260903-legendary-gay-cockatrice-8bb8ab@quoll>
References: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
 <20260901-phy-v2-2-cc93d2f3b1bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901-phy-v2-2-cc93d2f3b1bf@oss.qualcomm.com>

On Tue, Sep 01, 2026 at 11:34:20AM +0530, Varadarajan Narayanan wrote:
> Add qcom,ipq9650-usb-hs-phy to the list of supported compatibles.
> Unlike the existing SoCs, IPQ9650 does not share a generic
> "qcom,usb-snps-hs-*nm-phy" fallback, since it requires its own
> tuning/override sequence, so list it as a standalone entry.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C8749EC60;
	Fri, 25 Sep 2026 13:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342651; cv=none; b=iU7LdwBw+XfTGqZDcgrnJ8tRpksIR1NjPP7AMyNuKHoRUvpoIyPwJYrHPMcUzKhvlW3yCJyE4fyfNOWTXIGP3tvzaD+rqiKMVcTHS4+o453Kk55dnb4xRioyGHrkferP09g9y9YeEXt3aBcBHmkXEPbI5Icim73UAcFqBPyih3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342651; c=relaxed/simple;
	bh=uC8fKrIhCmbNbEzaDUBbN4p5b665dWbZFdcS+9oJJWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ta21s/JvdXIZM/cd77gb73Hv9YWBaBsmcEnZc066S3umOdTdv7eR94ekGc1lV44lWroxwJuDQrVJmBiI6IqLEmfnwJ3A8kWDKSqcjyf4jawq/I0wEaiZ+bqN3NldgdjJofJAEGVxAjPcP+Swb15MpAsgBrSCWBKHKZJNYme3474=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTUJmLDO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTUJmLDO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D9B1F000FF;
	Fri, 25 Sep 2026 13:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790342639;
	bh=hnUwwzO7qnFfNSXY8cyb1aERC7lGblNCcSED6xHDc9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XTUJmLDOKSESVa+JwP2UyQiCrUdQrX8NfnNxYm+U0FjCsAsPokG4juAJtO2wKKlpp
	 C3nQKMMv4eBRd3Lz7yRIzDVoZlKsSMcmSanU9qK/Ux7KtmwZFddArYI0yY4Wmbstdt
	 q6VYW4wAU3weis5IYSBTuNNwINLFgX9pCTffnAS3XLa0XSP6lUSOpz1anv1kmJGuE3
	 5n7iSjupD5pvXyMexXqAFP58dLSJAqxAaZa2K1Q9tmfK4QXQ7KkcpostM8Y2I+3hkH
	 XN8ygxX65CSKThTiP80UdPsePx5OTgYtX8NMSKKesdHigPfexGTNSHDIEH8EY/Yb2U
	 ZScCovWb53TKw==
Date: Fri, 25 Sep 2026 15:23:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,snps-eusb2-phy: Document
 the Nord eUSB2 PHY
Message-ID: <20260925-fantastic-icy-hornet-bddae7@quoll>
References: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>
 <20260921-nord-usb-phy-v3-1-68aa02b12b96@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-nord-usb-phy-v3-1-68aa02b12b96@oss.qualcomm.com>

On Mon, Sep 21, 2026 at 01:47:05PM +0200, Bartosz Golaszewski wrote:
> Add a compatible for the eUSB2 PHY found on the Qualcomm Nord SoC.
> It is compatible with the sm8550 eUSB2 PHY.
> 
> While at it: On Nord SoC there are three eUSB2 PHYs but only two QUSB2PHY
> block resets: the HS-only USB20 tile has no dedicated PHY reset and is
> instead reset as a whole through the controller's own USB20_PRIM_BCR.
> 
> Make the 'resets' property optional for qcom,nord-snps-eusb2-phy only,
> keeping it required for all the other compatibles.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


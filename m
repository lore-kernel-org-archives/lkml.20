Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD5C40242D;
	Mon,  7 Sep 2026 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783541; cv=none; b=qoOGLCD8rNIls9HWdmR+6t5Fa1gODQAnI2yi0wOthVh2+7UFU5qpJFhOW4+ZlOyFC1jaNxAyIB8Oic+SPPqVwsQKf8aNI/E9+4Kygm7QTixP+mgC1gBvg9IQbJeVKrXnNftJLvY1y7V23X00da/ukDKeVK1a+sr/j2boJisDn80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783541; c=relaxed/simple;
	bh=oibY5o1RtjGr966rYj6Ppax7FoXRumoq2PDPZujw7no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETLIfgiB8X1CH3p0CWVoEbWYlJ/P6tvrqbZ5KJteuIl8SibNpGZWVyDBiD7nXm8CWBTtWbcc6RVbx6Fxq6s+/eniAULP/wXPQ5iPKfruvVa6hoBv0X2PdNovr9Gz7OyGq1oo32/bkcCkMbVr0Pf6pEsWUoauRUNpz396RZflDxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNUNtgk4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNUNtgk4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C981F00A3A;
	Mon,  7 Sep 2026 12:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788783539;
	bh=UPCT7NivEF5dXHHkmiPyCbpMfbh32hjOvzeAZcafMWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BNUNtgk4QxbeBFAG7QguySvmoJVsPNkHrSIZJcjlT/BS3BRLjI1Uhort/hQ/+sJNg
	 UCLpv8dsqaW1uLOsbw5R/OER5ioCF8iZVkAXSHPqUxnkcHIuj7X/YlvpCtVQn1Bz5y
	 rPsnVfTvWwOOjaaW0rhX8I2XQTGhDMsbQQFOPWMHV+mUk1On5A66AewkhL+a63cF0V
	 EPO3Kk/W57XwmpE+KuysgTUEupcOJBHnJKbp6VcNzz3wiX3q9VpvIp4+cMqlmGypwO
	 M7yr10Tp2GK7q2rl0McATXrWEFIN2ZtJyPaeS+DPPGQzW400mOb26cEFey2E/T125h
	 sDBa30uWEK2UQ==
Date: Mon, 7 Sep 2026 14:18:49 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 05/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Use
 bulk reset_control API
Message-ID: <wsejx7luoa3llvso6h3q36ewp2xnikcjhqxjnwfj24dtzgvffz@dt7kloucr7ro>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-5-39be0955a6aa@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825-ipq5018-usb3-v3-5-39be0955a6aa@outlook.com>

On Tue, Aug 25, 2026 at 04:37:22PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Switch to using bulk reset_control functions to prepare the driver for
> managing multiple resets, acquiring reset controls by name, and
> uniformly storing resets in the private data structure to enable support
> for future combo PHY functionality requiring multiple resets.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

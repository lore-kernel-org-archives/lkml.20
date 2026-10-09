Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1BA3469E7;
	Fri,  9 Oct 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542006; cv=none; b=nEvyAAd6Z8/F88EGzyX7d5QtJZ6ghrHGDJgasR8xR6n5wfaaWfOjmCK+7vnI3e8BjQ0lHh1ktwGL66F+BTP/05YmoXiaOlQS64gl2t7X5qJ4dMP4tmMk6LIwbN7FP/w2+vL++ixu/nLXpCIp/HDKA71dGvIcIRwYwvZ/cfXF5Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542006; c=relaxed/simple;
	bh=DGSUNEGmfFdGiK4WxFGLNpa+sGyQ4BMNRg8dgg4jnLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYLbK6upLqyMc/tyvMMtBAPGz+GhTH0CQmrrmbU+6XYaCJta2cFUDAZZCkC2vtpN8eE9nQpn/ppSE2AkGWVks3st+E1hUild0c8joK5nekRDFtrJlrfJtclnU+TXzDolsnfVkue7deM8QcCgQ8p9C6H4PPdx2lUtcOEmtyXDoyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaUM1kYa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaUM1kYa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683DE1F000FF;
	Fri,  9 Oct 2026 10:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791542005;
	bh=HtCYHP8bkaekZ1veqlqX8aXKZ4Lf0sSj0bK6Dp/TMpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WaUM1kYadguyw8AItenfIPKE+2el6/RQ4bJ8E+TYjvKl4Il9CdtIZWShD9/VD3/it
	 9aq9OUbP4tKmDKhdenx9cC6kzeXTgCt9UYIAHBj6J6Ti39TqubXCUVZr4QEx1jpy+H
	 zToPjLf2lBqGro4dxedF+SQG8Eku5lZRo4Fcgf1MCRcIdQAarEQ7GqlR9AwcVqs9I9
	 FawLC9aanhudklh9wqqfnJwTw2Nf81SrEjiD69L+UXoRlcEQmaDJb0DqeTU2M+0RhU
	 uy+RjX84pLmZm7sNntHuNsG6Zd/Z+Id6/WbBTF4sngHLNcVLuMHgaUytAjHDb5l2bO
	 IFvu16Cb/XBpg==
Date: Fri, 9 Oct 2026 12:33:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] phy: aspeed: Add ASPEED PCIe PHY driver
Message-ID: <20261009-cherry-caribou-of-glamour-adaba4@quoll>
References: <20261008-aspeed_pcie_phy-v1-0-96764937aef0@aspeedtech.com>
 <20261008-aspeed_pcie_phy-v1-2-96764937aef0@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008-aspeed_pcie_phy-v1-2-96764937aef0@aspeedtech.com>

On Thu, Oct 08, 2026 at 07:28:20PM +0800, Jacky Chou wrote:
> Introduce support for Aspeed PCIe PHY controller available in
> AST2600/2700.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  drivers/phy/aspeed/Kconfig           |  12 +-
>  drivers/phy/aspeed/Makefile          |   1 +
>  drivers/phy/aspeed/phy-aspeed-pcie.c | 237 +++++++++++++++++++++++++++++++++++

And unlike 10 previous versions, this wasn't even built!

Best regards,
Krzysztof


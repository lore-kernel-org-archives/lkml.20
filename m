Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229861;
	b=hvgd2zz+nA5XOYTYclY6P2LXkML3Dc9K6/hN2v5HRFFUueqVWTgMyR7kmHrrHUuNHSsH
	 jsjCC5qbCSaoAnwa2AZPFfIyX8u9I2VfUF2TvL7cvTciJJVMkVX12WYywH0/bsrgHlDKZ
	 wKPCS3TCFJ0M9N614w5bhCbhY1a6RUR0FMKglGdybS1Z3LlBc98N+/3/bl0OgC5Virbse
	 o2X1oun2GIJDNeZAgmbD8QZSLvYj1PbbnYR5WgeQQtOkQy45TbWhRM6ZH4UoYoYNbnicy
	 ClMLxRjBsbB7mWKSGO55NhmIP3A/yaCcXLiIybb3Raz+Iajco5XGzVj70++RjOJpOcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229861;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gNfZR1tD/4uQN4tqp8U8BRhf/3RUz4loH+G8h6ncrFI=;
	b=U15Ah8Tl04ZgOwYRvIGd45URGAMHpxSEfazBZ9B/8I6IbyGyRlHl1zkAwPSJNxko/ice
	 moUJmQesW6PRhi8Mt6piEtBR9SAjMby7cBQk5u+y6hTe8mCx7RhvWiqmVm3OFzv5s1PaN
	 aLRPLzWnJtdBnHlCyHLtglsBkRK6IEV1dYI9O57GCSw+aXmsUnhS1aYs3VAAy6933Jlf5
	 c8QyxunUge96wbiNF8fvbRhp2GMBVTLrVmdWZ+8Mkf2l2CHrVB/LSQJiUqjQPU3Ft5XSr
	 56IX5HDh09VwVrPkWbF13p2b1hCgOrsP1qpADY1Ct8qBRYrPbjvqWRHEg5mI+Nu6mJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S1UKdJpW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44C0606D82D;
	Mon,  9 Nov 2026 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S1UKdJpW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C1F1F008A1;
	Mon,  9 Nov 2026 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794229861;
	bh=gNfZR1tD/4uQN4tqp8U8BRhf/3RUz4loH+G8h6ncrFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S1UKdJpWyqYgkqJU08KtgulF65HWrq2E/AFfyEEOaihWAVjP5+DPfXePkZjq/bmvW
	 oir5yfcteX98GaXH6Bc9av2SIQ8SVuiaTEI2io7v4MWbsuiTiicvJ/rmKaeYzHo+NG
	 LSR1kYa6GJ5eV0U6tzdntULAR52nlx4I950oZO5ZN1SmwONGLR0XECOlMpVqaqM+Fk
	 0WnvBwb9ZYUDNqPkfo6ABbUcJ+Iyct6lDUA31Qm+AvODDiNvCQ/EeW9OLZumba28ZO
	 9UElmcQ6orUKgJSKuv713MKJeafnnbdCZAuNYj6Y+nmCK50MIlNx1PoMCdtWZBX8VB
	 H1nWHcJNriJSA==
Date: Mon, 9 Nov 2026 14:10:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Alban Bedel <albeu@free.fr>, Vinod Koul <vkoul@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qca,ar7100-usb-phy: add AR9340,
 QCA9550 and the analog reset
Message-ID: <20261109-lively-marten-of-upgrade-11637e@quoll>
References: <20261109040451.114135-1-rosenp@gmail.com>
 <20261109040451.114135-2-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109040451.114135-2-rosenp@gmail.com>

On Sun, Nov 08, 2026 at 08:04:50PM -0800, Rosen Penev wrote:
> >From AR934x on, the analog part of the USB PHY has its own reset,
> which has to be released along with the PHY one. Add it as a third,
> optional reset, and add compatibles for AR934x and QCA955x, which need
> it.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../bindings/phy/qca,ar7100-usb-phy.yaml      | 38 ++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


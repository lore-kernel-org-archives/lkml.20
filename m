Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA433C988E;
	Mon, 31 Aug 2026 08:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166049; cv=none; b=ZuV0LV9oKIFhfxQVopoCxdalwhkRGZviBfi4OdGzfRjSnVWKDdHp1QVARKKqqtKKS6iGj9u1kW9B4YBlhrAucQJ8Cj0Ud3wUdg1RiLpe5Aj2qyLptQg7WV9WA0J60x4V6D6s7nGPXINPMPoxf/I47BH/dej1osSJbqaJqTfB13g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166049; c=relaxed/simple;
	bh=Pk4ErvGmQrZOLIOGBljUuFGpUWFpUDhlnCt2Mj3RrMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a15WNFgR6DGzdngGYEkRs27lJmIy8rwRXGP3g8wcG0Zc3KFM/e6Uf9S3YBpcl1nt6esM16yLDP2ps0i7o44DLpwiEV53RAb8IVzvigQ7d7e56dWzY2+YPSNDAO2UFISYkVAhF9O2ZB4Pu88jrASZ/hYC6J2xFqGG+sw307v56uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIEFSvuz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIEFSvuz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CBC1F000E9;
	Mon, 31 Aug 2026 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166047;
	bh=Pk4ErvGmQrZOLIOGBljUuFGpUWFpUDhlnCt2Mj3RrMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BIEFSvuzZBvTfLfVp+Vn+FHw9YzHUiaLSCr0qYW0HW0RTzuDXNHNewgiSgSY7+N86
	 TeSAUngT5um33hCuSvsZHzP6ZjGg7sbw3J4bkoujboHQlFlDtt3vWo51Q1q99T4YUG
	 i6GNrZIsHJ8EeUqkz0SbLR0sSlKdCMpuiq9J/+EiZZ//Vhjkq2ZRlMKVz20ehkWlmt
	 HeT7Pf0bHeWrVCvee6UdZ6JXq9RlDMTeG9bcQODpwq7yxHLrTG3VDNpZnqVOWP55XK
	 RGiy3YiNC2aTplQaKe3BiCpC+SH3W+yF8YzOXWKYS2/s1AdikKtyTU843iIZKLZ6VW
	 cl394f5bEgf7g==
Date: Mon, 31 Aug 2026 10:47:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-phy@lists.infradead.org, Pankaj Dev <pankaj.dev@st.com>, 
	Rahul Kumar <rahul.kumar05@st.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, kernel@dh-electronics.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Document ST STM32MP25
 USB2-FEMTO PHY
Message-ID: <20260831-festive-gerbil-of-prestige-2fbeeb@quoll>
References: <20260828150739.174460-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260828150739.174460-1-marex@nabladev.com>

On Fri, Aug 28, 2026 at 05:06:56PM +0200, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
>=20
> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
> Two such PHYs in total are present in STM32MP25 SoC, they both are
> slightly different, therefore they use different compatible string
> to discern them.
>=20
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Co-developed-by: Rahul Kumar <rahul.kumar05@st.com>
> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
> Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Co-developed-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> Co-developed-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


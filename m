Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832538;
	b=O5ZNYTTxJheWrfcFWcJYHzJsM00Lh86iL/I71TXX2Z44RMJHiR4FN5wq/JtqTSrYgKWa
	 EzXM3Un2u9vrH8/w+EVfrFr5he/lBt2xVl97+TpRXq4sC5g8N6opSW+goUnD3vnenhMG4
	 Rwg+AT5C6z6yQ2H7g6RGvbQMJHOG3KZkym3Ufd8xrdb0SNfRJebvlGUiqQLtZQRPFWwDa
	 ROwp+sBVfcJoDObFfY39rJJf61t4QV8tFXVNAOvrC0J7Ov8dHBr0VSPqR5mJNygv3rsnU
	 x3hnVo3+yESgHhYHTCU1q0r4klpsDEL5+rEsly0hOYsgJ5mDXbKvMVZWulmmGW4WGpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832538;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PAmxK55nV/QL+FKDcHCHX22w2WLTULcavrMAwSZf6kE=;
	b=hjjhGee2AhhjoviIHcRlTgEVNuRI5V6PBWvVGRh5ZqU3l72rLW8jY3VyIYrz85mYX3mp
	 7zf/8KNDXc/VhlcR70GrTJ65/a1faCTc9yw0PynpCSxl3mJteTxfVnp+PDrawG7VkeNvZ
	 PO2Orx20dotNxz1NhizBhFHnFyTsYtK1ivJtY13ndwudhVuaZq75gUzadsUSX0FGRV0aq
	 XFeusckjIZUuOpThGTICDq7dKfNuz+ghtgDxfQgsTS9nB3tghD3bW0Ho0z1ah4mkCecAl
	 UOD6T9dJ9PZMPsezvWg0oJ8QAvNGnda3+m10To7mDHhw34HFHHkYUbjQ+yvyoJM6Zxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aif0HiR8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AFF606A31C;
	Mon, 16 Nov 2026 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aif0HiR8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7316E1F000C4;
	Mon, 16 Nov 2026 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794832537;
	bh=PAmxK55nV/QL+FKDcHCHX22w2WLTULcavrMAwSZf6kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aif0HiR8+u/Jqq69F213yU66p0fFhvPNVJ2ZryYbKD7PAEV1DY50f9ewSRPV+eYiA
	 83MpfLb/kf6FemdTNtF15Kh6p9Uve/91zn7FdniYd5K7oZvfXD9hObyelYqqNEmkBF
	 zPeaOfGL1QA6JMZ6mC4C3rCI/YVa+TuJiHAs92PjJ2W3tbbanCQDRWYgEnR2kXm4sB
	 yGOVTofWCkla4lsbNzdR4uwbiYRqyPP1kQ14hWV577a5ofhtyOpxERuod4LHKn3DgQ
	 8umOTHyiCu2nYo5T7+FYYzhrYdkBzlY9oNtL6V6cOWV9Zes3XFJDfTCSLNuMPgSq4q
	 THAhT2ccMreIw==
Date: Mon, 16 Nov 2026 13:35:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add IEP2 deinterlacer to
 RK3588
Message-ID: <20261116-luminous-heavenly-guan-b20f2e@quoll>
References: <20261115-iep2-v2-0-3d8798cd9a55@gmail.com>
 <20261115-iep2-v2-3-3d8798cd9a55@gmail.com>
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
In-Reply-To: <20261115-iep2-v2-3-3d8798cd9a55@gmail.com>

On Sun, Nov 15, 2026 at 08:47:44AM +0000, Arun Iyengar wrote:
> Add the IEP2 deinterlacer and its IOMMU to the RK3588 base dtsi. Both
> share GIC SPI 117 and sit in the VDPU power domain.
> 
> Addresses, clocks, resets and the interrupt are taken from the Rockchip
> BSP rk3588s.dtsi (develop-6.1).
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index aa69fd3793fd..5297519bd251 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -1397,6 +1397,28 @@ vepu121_3_mmu: iommu@fdbac800 {
>  		#iommu-cells = <0>;
>  	};
>  
> +	iep: deinterlace@fdbb0000 {

Why all these are outside soc node? That's more of a question to
existing code...


Best regards,
Krzysztof


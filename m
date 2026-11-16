Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831081;
	b=w41ZfURgfR9JgeMYWPvyWYynzxDU26iIs1py3Qzb1sdqPlmdLrRpbPwWyq0nRsTMEBBk
	 x3wJ4BAUwow5WzKolkSSMyCk7Idp/A6Hgu3F4N19MC6CJ8tNNT/0LNaxHKXXGIDM1gcOJ
	 39EakWjn7lSVlmErTCyHgoBoRyyUfNcVHY1trZLsHmnVt228mG5k+IUr8ieHOtsx1fBih
	 feqb8FY1s4jYTiVuBm466gZnK7eJXqG6mt2Yg7EgwkjLTg00W6+8GmhPlJkHe4YeVkZmP
	 QYy6uUpFa2FIeVwl03/jP+XNZYsN+Keh9ToI6CLpzBu0bwlpRFDNPXtIMs62SJD0pOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831081;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MCrIfPa5jM55YGKgTWMhmNBiGurKE2IC0Lgd6Ge7QLE=;
	b=f1BwxGBaBfn4Sc8HUdUz+uuhwjmfTRfkHQI8mvWtpRIV9pt3lCl266npYbrjhNyZj26c
	 blQWTzYWb5ovDRP6GWxQOBuePuPqD4wEPcK4SYLq+brRr0ns0RVmKuNePhjfVzd/Hlql6
	 G2JbgSfbk6nV6E3SG8ifgQp/3EWj+UIyw6GHup6BTGIzJ/xPb41tasIEbEE8hlCPiLS8o
	 VTLS/Uk/4KMPDc178pFk8LB1tuqnWYmGx98BzGMYTvcCBHGyGFPBaNNmVc72Y5sToKJ1x
	 210IDa8jAHq7wPDX/NJFlw4GyPNYzZHLTdxZZ34wdsUVJGjhlL2FVtCdtnfHZBrsm+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kf0ZpNba;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A881606A323;
	Mon, 16 Nov 2026 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kf0ZpNba
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86ADE1F000C9;
	Mon, 16 Nov 2026 12:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831080;
	bh=MCrIfPa5jM55YGKgTWMhmNBiGurKE2IC0Lgd6Ge7QLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kf0ZpNbay3/botVgk4uLQ6lKN1Dp/8U4U1a6BPgJEQ/jmkeMAZbVWA5Vx8J7OvYAa
	 Xx5YPpICA9XnQj1ry5M/iOi+KIfi9KXZoyXKVQFVEVxhxK+lj7kk8SbbZ3WL3C/ZZz
	 MFQSeMyiRtDb0+SjvTTRTCZ34BLbJJ+kvZybx6NmeN4dihm06im1nh7lgxjG57iKwX
	 87jwP61h6nYg/jwz0RPzOecRR3TPF3/vD+gFmTVK3encLn5J/mOno0FiPh0NFjP86K
	 yWN5joya90STmAJqt9QUvReUNO4HPra5yhh1k2UMZMQKxVzfq7VSa3zF1yArbgl9vC
	 91rNvWminUUyw==
Date: Mon, 16 Nov 2026 13:11:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
Message-ID: <20261116-colorful-cormorant-of-snow-cde6a0@quoll>
References: <20261113-lemans-draco-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com>
 <20261113-lemans-draco-final-changes-bringup-v2-1-3ae8cd1c9932@oss.qualcomm.com>
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
In-Reply-To: <20261113-lemans-draco-final-changes-bringup-v2-1-3ae8cd1c9932@oss.qualcomm.com>

On Fri, Nov 13, 2026 at 04:58:57PM +0530, Gopikishan Thawre wrote:
> Add compatible strings for the LeMans Draco EVK, an evaluation board
> based on the SA8775P/QCS9100 SoC family.
> 
> The platform uses a two-board design: the LeMans Draco SoM carrying
> the SA8775P/QCS9100 SoC and core connectivity, paired with the Draco
> carrier board providing application-specific peripherals.
> 
> Add two compatibles to model this hierarchy:
>   - qcom,lemans-draco-som: identifies the SoM layer, allowing the
>     SoM device tree to be shared with a common carrier board.
>   - qcom,lemans-draco-evk: identifies the complete board (SoM + Draco
>     carrier), used in the board DTS.

Drop entire parapgraph. I asked to explain oddities, not standard and
expected way how System on Modules are used.

There is no point to explain the obvious.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683196;
	b=NtI2UtELHNIf2LLkbnFtPnJg/G0C3czbqFV1CRdppDgK03zDz6ZDqHCA0rLV9TE0AsEX
	 ps2vjmE1wWfQy65PKf0eFm7atmiTzNXmZb4MbE8LmlQ0j+UHAMr+IQMPUlXTP/QZal6df
	 OEsvBXI7xv8Y19Ag93msdBnUp/hcaChe8dBu4b8f6meNedu+k/R8gPkPWaLYtiTCo2d+t
	 7ozfBFp6AkqEMR5aYVABOVh6reuRErCbYR+KYG9XKKVF/+7C9qQYYSgfWiLkBz3wr4RSe
	 dNmmKzIuANxAFeUxEWUp3Xqs3iIAAjnjr+1Z4QAqfZRrKW+hYPEiC4gmmNw3Gpxdv7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683196;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Gc+IjFQcnS+s4HIxO9xoT4fegh9TCzxXPTUBc1qQMEU=;
	b=Jw0DzYjtREikpzQ6BQiNrn5A+RPDn/hh4x/6c8V8WWGcHBXWvtXXoyu40gwlx1WB72X/
	 4Qj2FTI/GIJzp5cIwmmj2OgHdKxAXcBTuFgBtv3XVfWSnA2I38Cg/DfaBKISjn6+u+Ihs
	 I6sWiE0GbH99ZiDyqxP1K9PRgjjgBA0leaXtkz/msGMHaIwepqnkWNgH5FPlq0cjfn1Vr
	 WBf9Pu3m7bAkGecPolTUUGgQbXOYd5gpS3ZCIg2YPjHZIaJxAeVdZQmdTHQL7HrdydltO
	 E/iE7Mh2SdjAKwjkf+besrvh0aNz/YaqxiGntWQeMaTVVTiEIj/9AKR45hYMkgihttQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zc4MTZ5j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B709606A31B;
	Thu, 22 Oct 2026 15:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zc4MTZ5j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EEB21F01825;
	Thu, 22 Oct 2026 15:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792683196;
	bh=Gc+IjFQcnS+s4HIxO9xoT4fegh9TCzxXPTUBc1qQMEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zc4MTZ5jz6ee2wZBakJ8LG15CL5NCYwgpwQsFXOoH/nB4Ya4BM/FSiJXQjVhBlRTZ
	 67bb84G3Edy1SFZ5OGGrFw0utKFAjqUUcr3PA08gFm7f0J0RJdFM8qoEe+Q62lyTar
	 MNjqKv62xMi0GGYG4jvMl3ICTd3NM+1NctZpqYFnt9jaBSO8Ynh2m/AU1zx2DDJgX4
	 /LE1FH2dU73YbSuhEJ4NixH7dFouRZs1r3HDrgJAuAJGJvRGO8M16jSCVwoMNC6C8c
	 8hGRkLaH5EeOM96Dvo6vaVAA96BY97kyx7V8oiGONnXo7nqxEKhMUVgUVYeKjVpVwa
	 YUVbOgVV+tb8g==
Date: Thu, 22 Oct 2026 10:33:15 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org, kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3
 xHCI USB controller
Message-ID: <20261022153315.GA1697264-robh@kernel.org>
References: <20260910052340.246717-1-marex@nabladev.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910052340.246717-1-marex@nabladev.com>

On Thu, Sep 10, 2026 at 07:22:40AM +0200, Marek Vasut wrote:
> The ST STM32MP2 SoC contains single instance of DWC3 USB controller with
> glue logic wrapper around it controlled by syscon. Document the glue
> logic and DWC3 controller.
> 
> Co-developed-by: Pankaj Dev <pankaj.dev@st.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Co-developed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Co-developed-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marek Vasut <marex@nabladev.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
> V2: Fix up Sob/Cdb lines
> V3: - Document maximum-speed
>     - Switch resets to maxItems: 1
>     - Drop label from example
>     - Use generic over-current-active-low
>     - Use ref: snps,dwc3-common.yaml and drop generic dr_mode/maximum-speed/phys/phy-names
> V4: - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
>       https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
> V5: No change
> ---
>  .../bindings/usb/st,stm32mp25-dwc3.yaml       | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml

I'm picking this up as there's already a .dts user pending for 7.4 and 
it didn't get picked up in the USB PR.

Rob

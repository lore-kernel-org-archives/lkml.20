Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FB33E5EE7;
	Tue,  6 Oct 2026 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283533; cv=none; b=rnIjJvL4EcJfL1/RrJUY1T2w4Q2L9/XuDtoVc/5g2yvcYIhvNyolXBrBMAc/drun6cUX5NXSk/N4tUxYBvEzSLnrVptgfx/WK0gcE66McNkRTF60gBc3fz5tzsSXwVB1A4vMWdFXIQTYLOw6p0Y0FOyScmQ1Qnzc3U8JVWvxpF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283533; c=relaxed/simple;
	bh=PGjzqI0v/k1dYsFtcJTJuqEx/toVJ0pA3br7QeBaGBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7W+W3EbkynH9V4+4igBpdPgxXh1xhCek3z2pod00wTgs6k9RDD3vnLxF+Vn+HOUdebkRwGiKuUvbSCDbZb9U7eiWRRDMMZTOcc5A3wlRxWg6jSlYfbc5Yb15T0b3veZgza2LxiUGgbdl+5KLeJHP45PDb1HbGtLTMKn41GS7HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxmidqvO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxmidqvO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F14F1F00893;
	Tue,  6 Oct 2026 10:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791283526;
	bh=Vrr4TtvTm45QhAZs/pX2p9EkuSowiD60ZtjjCIEyHeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RxmidqvOXuGhxQqZoLaT+3hOKc39WsehbJ0w23JYgVXuG3Zzimg8TTMqrY6IdWg6d
	 LRphb0e0n5Y/NlyFAvP97TlDNVM9zVFXU+jQXmEaprvR2i2Fxsh/MxTg9tyoWaT5bk
	 h/mGfoUeV4WlwN2TFFA2+9Vi3VMHEOt1ppN6X5QS3jlljr1Ld/GM38O3sLwCmLwAAU
	 8sVcS0MF67HeAKgvXZUcsEbd0Nuf7Fzsev6zSeRNWb2HEGnfBxIfXomrk/aVLUoShv
	 FIdB+OeayJpj2RVdBeF1Y+hdvmVeL0KHpXOWK8PY93YqMOI1uo0mruHlJGpw38IBvX
	 L6JQJX9h1lqgA==
Date: Tue, 6 Oct 2026 12:45:23 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
Message-ID: <asTRQ6d0-NYOeHqX@parshuram>
References: <20261006102937.10972-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006102937.10972-1-ansuelsmth@gmail.com>

On 06-10-26, 12:29, Christian Marangi wrote:
> This is a major rework of the old v2 series.
> 
> The SoC always support USB 2.0 but for USB 3.0 it needs additional
> configuration for the Serdes port. Such port can be either configured
> for USB usage or for PCIe lines or HSGMII and these are configured
> in the SCU space.
> 
> The previous implementation of a dedicated SSR driver was too
> complex and fragile for the simple task of configuring a register
> hence it was dropped and the handling is entirely in the PHY driver.
> 
> Everything was reducted to the dt-bindings to describe the Serdes line.
> 
> Also the property for the PHY are renamed to a more suitable name and
> everything is now mandatory to simplify the implementation.
> (the PHY are always present and active on the SoC)

I get build failure:

drivers/phy/airoha/phy-an7581-usb.c:7:10: fatal error: dt-bindings/soc/airoha,scu-ssr.h: No such file or directory
    7 | #include <dt-bindings/soc/airoha,scu-ssr.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
~Vinod

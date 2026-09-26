Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A7E2765ED
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432125; cv=none; b=AnUS+irvpBUdfXktCsiNFtNkamKsEucxu6Hx7oSYNLUJWfPrLcoXB6/4612ZSnq7YR56sWCtidl1hVoPH2F0Jq98vZQ34sDfhfkR9SU0X4Y7jCPGDV3qhF5FGEV95fdLs20CAVPfrqIDFBJXeFcBdwiEXHEQRxongGkxDDptcEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432125; c=relaxed/simple;
	bh=FqX+lPPaURtjqM2vlnkqeJj7s993vUZLRYdhXMjUiJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQ02Rbtr0X2WaUIxypi5RCK7qTkOg+1a/WZ5xyYZNLnAm9cmIEWAnh7/9t6GmvwpSBRVNjlAadJ19reI4+SttFfOpWM+t2xom172mXi8QG8ditjIaFXXuoz7FWyR5yM9yiH0aCXAxpf5yglYNEkALUeuVkIXXZtuHsYxcM7ljxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R22D8Euk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R22D8Euk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38361F000FF;
	Sat, 26 Sep 2026 14:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790432123;
	bh=Gr/iacFCwh+sjRpNoj5szNI+DOV5L3jvvj4xWWMPkj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R22D8EukaVpS7Cx1OTfzPl+uOuOpFbHV/kp4FDLM3USJ/7Epd2SgFAFFgH5tFoQT0
	 8bse+IHrRvIkJVR2AZp1OtJohR8JP5V1llvYwytQTcFre2hPhYHm1+QewJ+hK0lPsN
	 WB2qBTzZiCeVSl5hvCUx+hF9Io/0bq+eh2BQO/ZD1un3kXirVrXUYThpQyfiF5K4pl
	 vFNabkTiLrJy+BgXDtciEAlcQxThfXq6WZ8GfpVYoUMZJd92+cAvJnIY857251B7kM
	 tscuP2/tD8sEwI94x/3+yHSgnU3hzH+vVwWfNjNA9CrlUFq+oFRxdQ2UTjrTAX75gM
	 QoDN27gvZKC3A==
Date: Sat, 26 Sep 2026 16:15:11 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: ti: omap-usb2: fix OF node leak at probe
Message-ID: <3ehunghv42o7kbfb3t6vb6gzoxm4wvmb3i4cyvldxis3xaifwx@aj5dtsuyxpyr>
References: <20260708081254.734892-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708081254.734892-1-lgs201920130244@gmail.com>

On Wed, Jul 08, 2026 at 04:12:54PM +0800, Guangshuo Li wrote:
> omap_usb2_probe() parses the ctrl-module phandle and then looks up the
> corresponding platform device.
> 
> of_parse_phandle() returns a device node with a reference that must be
> dropped by the caller. The driver currently keeps the device reference
> taken by of_find_device_by_node() until unbind, but never drops the
> temporary OF node reference taken by of_parse_phandle().
> 
> Drop the OF node reference after of_find_device_by_node() has consumed
> the node. This covers both the successful lookup path and the

This sentence is abrubtly cut-off.

> 
> Fixes: 9955a7835bf3 ("phy: omap-usb2: use *syscon* framework API to power on/off the PHY")

This fixes tag looks wrong. It just uses the syscon API but the leak predates
that commit.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

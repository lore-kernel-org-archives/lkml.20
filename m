Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186001C84D7;
	Thu, 24 Sep 2026 00:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790211282; cv=none; b=jT61aRWPfV1oCEV1+rlUzo2AK7GAOqKdref3yvGUqJ+LpqESjfNLXZZReuLPkaOa37VUBiqUXEat07SY6fxSVBd0GrnJDnQaI4r+BnH91n7kxhdTFsjerwaD6v7hBME2o3984XHSHO1HUhrQNa05rT5bLukiKIaNayRZZy6CO9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790211282; c=relaxed/simple;
	bh=TKbV2YIsNSc9iwsBoTwJ3ldYJiEHQarMU2Ztugg+ELg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7mgG5ce+LSH6w3g2A6d500xatpEYW2V/jQ1LoPeG4k4BNG4As+pSyQoNIkRbr8y84PxV0iN1Zq+STqaSEcB2Tt5C1Bxjg31iQI24PaNTGnIZQn2KN88p+J0HWKjnSvtmZQWA2iJu4kuvs3vKCOXnOSETWbDsnUCDnqX45CMuRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwsokGza; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwsokGza"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43E21F000FF;
	Thu, 24 Sep 2026 00:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790211280;
	bh=JG/dQUoHZvNPjuzT2aknhD7GBua9EthZihMp0PZ3Kfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DwsokGzaUOCo7l7Vit8j1Q/7xVnmrcm7JwppmeLky5NS75hGp0kEIVdZu53dE1k9N
	 V5OsSXL8FcHh3TgRbtjA8q1Q5yFs7icvGhxdJOLJEsC08LDoFIDCwj5oX0C9DZoD1j
	 1lZlS+BNQhXufAT/SZYiieg99DK4u+/IyrlxuvaIqTvQjLjF1scZE/1x3J69qPPdD6
	 UVGXSPXcGM2/fEoFUSDT0m5MxQUQE6NkhsmOyK09pukypQmhUeVzhP4MsQ/c8WU2tb
	 T8cpKXL9pSCsXTq/HJeAH+BBE8IFR9nkShk+nvYkNtUtukTocVn2F5Bsq4Sx1Zsefu
	 7Oo1bq71LC3/w==
Date: Wed, 23 Sep 2026 19:54:37 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Charlie Garner <charlie@akao.au>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Val Packett <val@packett.cool>, Laurentiu Tudor <laurentiu.tudor1@dell.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Dell Inspiron 14 Plus 7441
 backlight and touchscreen fixes
Message-ID: <arR0w0aBkGa0W7_a@baldur>
References: <20260923152506.44989-1-charlie@akao.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923152506.44989-1-charlie@akao.au>

On Thu, Sep 24, 2026 at 12:55:04AM +0930, Charlie Garner wrote:
> Two fixes for the Dell Inspiron 14 Plus 7441.
> 
> Patch 1 gives the eDP panel a PWM backlight. The AUO B140QAX01.H panel
> only supports PWM-pin brightness, so the DP AUX fallback registers a
> backlight with max_brightness 0 and brightness cannot be changed. The PWM
> wiring (PMK8550 gpio5 func3, pmk8550_pwm) matches the HP OmniBook X14.
> It goes in the Inspiron DT rather than x1-dell-thena.dtsi, because the
> Latitude 7455 was submitted with a different panel and a working
> backlight, and only the Inspiron has been tested. The dtsi only gains a
> panel label, which leaves the Latitude DTB functionally unchanged. If a
> Latitude 7455 owner can confirm the same PWM wiring, this can move to the
> dtsi.
> 
> Patch 2 moves the touchscreen from 0x10, where nothing responds, to 0x09.
> That is where the HID-over-I2C device answers, where the firmware's DSDT
> places it on this machine, and where the Latitude 7455 DT already has the
> same part.
> 
> As far as I know, no Inspiron 14 Plus 7441 has its touchscreen at 0x10.
> The original node matches the CRD, XPS 13 9345 and T14s nodes the DT was
> based on.
> 
> Charlie Garner (2):
>   arm64: dts: qcom: x1e80100-dell-inspiron-14-plus-7441: add PWM
>     backlight
>   arm64: dts: qcom: x1e80100-dell-inspiron-14-plus-7441: fix touchscreen
>     i2c address
> 

Applied

Thank you,
Bjorn

>  arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   |  2 +-
>  .../x1e80100-dell-inspiron-14-plus-7441.dts   | 31 +++++++++++++++++--
>  2 files changed, 30 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 32afff1e816e10185bb571aa9d89dc2eb061d548
> -- 
> 2.55.0
> 

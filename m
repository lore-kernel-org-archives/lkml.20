Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD76472095;
	Tue,  1 Sep 2026 10:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257505; cv=none; b=jNt1V82f2frbLQ5PcQiKHlg1gUeCUlL0G1Jk6QZ0mf+sh1jcejI9yTAf+lS+m8Gb9SpiWpNQCDjj3tNhpnB0SBfmv7LNaztPIqTZ8uawwyU9+mq6D0az8Mn06waI6DWHxm9MDZCI4ARgdQAMfABjkXLqA7K+caJZtuMfPA5c+II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257505; c=relaxed/simple;
	bh=ar7Em8QD4+N3Dl1tvW/S1kWXXaU6f9cqWYsUkAKCsKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYwCC0qXK0lMW268+JRE4Rhvgmgbif78tx2woYLTzdqhWQNnmIg9eRjRNZ4DGJkrsJVBdaoOZBWFWPwEgdOOi4WHrfXTVAIjtbCYrk7m/nOVfbOLZBxor8ISQmmnf0bUrx5CA4Wii8OoK2LpvPvzREofjseZCLFMa+qQ/j1ye94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZ7DKvas; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZ7DKvas"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61B31F000E9;
	Tue,  1 Sep 2026 10:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788257503;
	bh=8QYc+icIXC6DdJXTuoudaNeNquIBqTBmXXDcrMcfjKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FZ7DKvasLbUvU1k9TAMmcwPqoOjlZ8mzOtdBhQhFzCSgdsZ62kEXd3kCqL4mR1itQ
	 cvahE14ttlv5z/E5LpOyoiXS/U1An3wqM8pyfjUEUnmH+fj3Vh0qYaUxEgus4uftsG
	 xqJDee+SScVBmYNvuBTb/2sb5Ds2vuBAyoZ6Q7KZGQ6UGlYK+CZ12Uf2hqf2X2f9Q7
	 T4TgUnAF4yzOS7leg/eDl5qkMX0sEbISCwhTOORTVm4PUUTSoPyM/vJXMyWbdvbPTT
	 Z6bT7Encsr948r7HNFYb6kxzr6P476RGKmTTFFmbQy87ZvHSmj8e4J1Dst+bwRq43j
	 ka5QyJKmCiwyA==
Date: Tue, 1 Sep 2026 12:11:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 1/4] dt-bindings: usb: generic-ohci: Document ST
 STM32MP2 SoC compatibles
Message-ID: <20260901-robust-dove-of-enthusiasm-8c3268@quoll>
References: <20260831231814.137120-1-marex@nabladev.com>
 <20260831231814.137120-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831231814.137120-2-marex@nabladev.com>

On Tue, Sep 01, 2026 at 01:17:32AM +0200, Marek Vasut wrote:
> Document SoC compatibles for ST STM32MP23xx and STM32MP25xx series of
> SoC, so they can be used as more accurate compatible in SoC DTSI. The
> SoC uses access controllers, therefore document access-controllers DT
> property. For details, see access-controllers/access-controllers.yaml.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
> V4: New patch
> V5: - Fix typo, clocs -> clocks
>     - List clocks entries as list of description:
> ---
>  .../devicetree/bindings/usb/generic-ohci.yaml | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


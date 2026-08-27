Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0592222D9;
	Thu, 27 Aug 2026 12:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835046; cv=none; b=dnX4wGoDm7b/eRgwkWQYMiPSVYdIa/7mMenJt+/kD+m88VE49g7ZnKFeNxOJIiJNQQVFeX7L2vOOJLqzC/7ddu9+n+p0BIzsqOeypS24HSQjeCPH2L3hT0NpcHQMcULMIWDKK3f50shlRx0SNjeTXcr3yuthJ5tMrJ8yLqCfl34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835046; c=relaxed/simple;
	bh=pIB3W+m87tpQMK5+7acR9i0kj8Zkt42U18eqwtF1vp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P62BEqetFwjGWbdN+gxIxth9nx+ItKGeiXKyN+asU/mhqHNgnh2cuAFmup1th2Q9J9PyyPDcPYghYcWsEscL+f/kVFAhYLrwQaYOkdWEgW3BR8JUB5+qc4KYyBe/6l+NmYeplfNJRoa+5+yN1TAmk2wmQ1O6KSto3cer/4ow35s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZS7YSSTK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZS7YSSTK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCAD1F00A3A;
	Thu, 27 Aug 2026 12:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835025;
	bh=4GtGc5XU481HY1RkNJwA+hKA7bsxUsuivKCYU3DiUQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZS7YSSTKr7N6ZZMqitF1pSbEXNHoZw2WXHKNPPrEJCKJ5mCC9Jqm3zbwCKoWQtFg+
	 nuUx/Hfn6rxAiGnRCw0f+H+jAVKd2ZiGZWUEuVOD98kTCKRYiNbowevZ6QTZb7xEpZ
	 Y3L/oman752U9vUR4N4BKjeTaoCWDUMh10lps9TPF6AVZe+73SVtUDF4/hhaFHgO4W
	 BM43qX+1RkMCblITdfljC3mj0e/xLtBfoVajYqbhD96br+oW9fJQzuDu2vx0MMITLW
	 nkpYabqS7iSLLgK65P4UOIJ1LSShwiS1ickF2fLCEDCelyqyQ72P2rfppKDRKysG3c
	 eroF9gSosb4aQ==
Date: Thu, 27 Aug 2026 14:50:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Marek Vasut <marex@nabladev.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 13/16] dt-bindings: arm: stm32mp2: allow child nodes
 since simple-mfd transition
Message-ID: <20260827-micro-junglefowl-of-contentment-8b0c6f@quoll>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-13-c5e27cbc0795@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-13-c5e27cbc0795@foss.st.com>

On Fri, Aug 21, 2026 at 06:23:24PM +0200, Fabrice Gasnier wrote:
> Adapt stm32-syscon on stm32mp2, since transition to simple-mfd, to support
> usb2phy child nodes, that has a unit address.
> This is a temporary update, as it depends on Marek's series [1]. This
> should be dropped in later series revision.
> It's a precursor to validate further DT addition on USB and Type-C.
> 
> [1] https://lore.kernel.org/linux-phy/20260816213849.1044073-8-marex@nabladev.com/

NAK

So you allow buggy code to get in just to send a followup immediately,
insteas of just commenting there.

ST MUST start reviewing other ST-related patches or ST contributions
should be ignored.

Best regards,
Krzysztof


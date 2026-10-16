Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AC54CF474;
	Fri, 16 Oct 2026 19:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792178830; cv=none; b=n+T+wzs3FD7uBcE7tOtejfcGnhZE9pOM51Sy1OmjF/QhrV9WPvKdGuNeHQV0SpU1ydCr2b9nTNajo6BN52kqZfuI4/YninptpISd7KQ3N6/ahs/OUD/K1Ji75nEnMLnbQotMoMI7vmgHM04kxH1kMH/mZZd63etixAVNRufRYl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792178830; c=relaxed/simple;
	bh=pQ2KlFLAqS8GA73BM5u7PDPk/2wMh7phIbaGdBXCYhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cozwv7hBni7/ov+NRkTRcQ1+6lTpi8X5tsvIntKwohoj+PQ1GX2mX2LFkT6q4ClAcps41BhPFajUP1hcTZ8Jbz0Q8KR09lCLEL3WzqL1w9sEaPaUri5PPkB9U9LdfWSSzaLMRQnMtMkZoQOnmsJuN9OagIgyBlpRKioiL4ax5eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eavl7/um; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eavl7/um"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7761F000C4;
	Fri, 16 Oct 2026 19:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792178829;
	bh=u9zVdZ+60UPJ7jM3vWMuHHt67z2QYJr3Ac8P9XHs1+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Eavl7/umDyhp+rfXD0qTHvLLemfRf4zYdG6nBp6UbrEXrxDNAOpfUBtzXyfCAmadw
	 4g/FLa2uilQMhD2/P46Fj3ZHyIxQBaMmPj+/4qjtaCRNSlVSFjOH6t1QpKNwWPkMBc
	 t3uAdqfvw7q9apekFqD+85XuV5fSMDyA7YhGprwTA/zmNiiBiegVzJZwon+UEdXyj8
	 HULUQLlrxS/RTNJazNZBPelCvOr/bReNbpgUieRbnNHAvQvw9fzP+MHILK3TVJBwB+
	 TC+5K1yjTpIn31Ohgmrjrp/Q8uKmvN+d5gpCIYadVyVgeTcILVyZdNzj+QvGfzJ+Ub
	 IwJDBGWIp5aDw==
Date: Fri, 16 Oct 2026 14:27:08 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-phy@lists.infradead.org, Pankaj Dev <pankaj.dev@st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Rosen Penev <rosenp@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org, kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: Document ST STM32MP25
 USB2-FEMTO PHY
Message-ID: <20261016192708.GA138068-robh@kernel.org>
References: <20260902141312.649406-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902141312.649406-1-marex@nabladev.com>

On Wed, Sep 02, 2026 at 04:13:02PM +0200, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
> 
> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
> Two such PHYs in total are present in STM32MP25 SoC, they both are
> slightly different, therefore they use different compatible string
> to discern them.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Co-developed-by: Rahul Kumar <rahul.kumar05@st.com>
> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
> Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Co-developed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Co-developed-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V2: - Fix up Sob/Cdb lines
>     - Fix up compatible string in example
>     - Use additionalProperties: false
>     - Expand description:
>     - Use clock-cells = <1> to discern OSC and future PLL clock from the PHY
> V3: - Move clock-cells next to PHY cells
>     - Fix the bindings
>     - Fix up Sob/Cdb lines further
> V4: - Reorder the properties: list, put #...cells at the end, reg after compatible
>     - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
>       https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
> V5: Add RB from Krzysztof
> ---
>  .../bindings/phy/st,stm32-usb2phy.yaml        | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml

Applied because the schema depending on this one is already applied.

Rob

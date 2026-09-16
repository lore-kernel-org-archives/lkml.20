Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF434E4319;
	Wed, 16 Sep 2026 20:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592099; cv=none; b=iwxQ9dVK94wpFWvPB4P70qa5C75Zca611WAVN0+2gwdpgSTXiLuYlVHArU54wzjj44FUC4/pJDQmK39UoNhT/+rgDUFbZri3xY+r3BRSkfZhaI1fG5W+JxTaVNZ9GZN63UaSccaVR7U3SB4uh+jRX48JzOYoZ/38QVAn63Ft7pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592099; c=relaxed/simple;
	bh=fYq/WSFRgFG1cKONVWLRd/evLZei+qjsQ47WLgzwPT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSE49UFXPrEWwys3MYuvsfV2Z/x0oGCiJJL3xtxYs6oiX9GzlpNVIsdumfdCzpVOU8YROvWbRcGLHpJ2a2Zn/XH4D0t4N0fufPgzL4jPlDbRIb7NpkOOeizdFpzHGUIUw3ZTPXSA/1jUvp7FItJQ91bRt9A1PoL82GAzjtDYlgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqzNQuNH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqzNQuNH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D150E1F000FF;
	Wed, 16 Sep 2026 20:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789592081;
	bh=/fVE64cE7nvsH7ihx3e+rLce2cTxLT+GQAuLtBPtVOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YqzNQuNHzicnEdYcGx0aVXvhGNL53/WrgzEFgnaoS1UZ33GF1eJet/B7CNNaTL/hb
	 qtl3c9jlXv4u7Qu7VXdPezNsoE6ai+6DkGlLQPIQz9kJ9WdYwMzIVZ8wTDG1/vJnnL
	 FE4KLGGIrM50o5GTuq7dZi2upc5wQGYVhsfIle/7wgUcmUyVgULDl86Se3WBB22qUe
	 D1WQ/or3LQwLcYrdJ02aYCcjycPFG1XYNwK5VmGshDaon/jsyZjSwG5jKmrBO975t5
	 xphPdWwDuiWW/kVuJf/n/vC10A/+fnBvf6hd755WVnufAayH9W1MjZJ+tUMC2zTC/w
	 LlFgfXzW2Cgew==
Date: Wed, 16 Sep 2026 15:54:39 -0500
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
Message-ID: <20260916205439.GA1548838-robh@kernel.org>
References: <20260910052340.246717-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

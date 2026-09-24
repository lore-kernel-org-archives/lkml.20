Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BD930C168;
	Thu, 24 Sep 2026 00:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790211240; cv=none; b=ZQt1ryinwCkP+/WnvGrRDMMVig9uNkn7W98hnqvPgi6Ej1vbo1eHDCadV5mXDKOWTG9HtnV22Cb5vYf/eiX8ggPyqs2G3T9RDZKwEieFebzZGIAqV/Ksl2pFvcObzY20hEo6dZGXpyACCHYfT4v1Ybiu4eRm8DTLJKwv7EkZKow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790211240; c=relaxed/simple;
	bh=+WmaszR9xPpKYlRnwXGqjdqOTs+TYxyqc0eNQ6VSOH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFBs/On9/3ZajWDjJGU7GWHFwrL/pc724PpdNAxgrHBuV8d6TgE7OBvdhRJTQqKA4AgKA2snk73RoulIfUd96ITX3IFbzA2XsrrQ8vTTC8VqCIkU12XD9Smsta674GV4/6o07puiuWZEbdP60MhVYvNs/AdOpiq/x8CMqd9Ujmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqyKNAmW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqyKNAmW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98EF71F000FF;
	Thu, 24 Sep 2026 00:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790211237;
	bh=+an7fff6Cw/44jZtuWrt5x/TcCGkMfP7lhIWOprcggg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WqyKNAmWFGSnKJ3ycqqpWH1kja9RLZ37sszjXI5sslxLY305DS8K/gGJyJuS0A6AC
	 0Sf8AE4mraDWxxE7gGOBi7mLPZENzDa0vA4aKodZYMNovYpxMNe5FWTgcPtuE0V58N
	 mzLWi0KTZLRQQwxRDerVyUiHVIL+Ce5D+y1p9wSsqTJgJPC/oNV1WpB0ZoSvrmqA4M
	 nG+Qc8UK/e8JghqT2NTFqzAjK9SAEhZU64cETirM1XbW3T4fVSo0ejyc1iNcPO356c
	 6IHvGxOOHBB1XrEle3MiNTtqrXj36peMqA1bypZ2Qn+u0xxVgDN7/CIfumP/ljGptY
	 YWNPcWcDJWwXQ==
Date: Wed, 23 Sep 2026 19:53:53 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: sm8650: add support from Valve
 Deckard headset
Message-ID: <arR0ekQw5O_E_OSs@baldur>
References: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>

On Wed, Sep 23, 2026 at 02:16:31PM +0200, Neil Armstrong wrote:
> Document and add initial DeviceTree for the Valve "Steam Frame"
> codename Deckard. The Steam Frame is a virtual reality headset
> based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).
> 
> Product Website: [1]
> 
> Dependencies: None
> 
> [1] https://store.steampowered.com/hardware/steamframe
> 

Applied as is, please follow up with chassis-type addition later.

Regards,
Bjorn

> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Added labels to smp2p to make removal of the nodes cleaner
> - Reorganized properties (ranges after #*-cells, <prop>-names after <prop>)
> - Use "0" instead of "0x0" in the reserved memory reg properties
> - Use proper supply properties for vcnl4040
> - Link to v1: https://patch.msgid.link/20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org
> 
> ---
> Neil Armstrong (2):
>       dt-bindings: arm: qcom: document the Valve Deckard headset
>       arm64: dts: qcom: sm8650: Add initial Valve Deckard devicetree
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml   |    1 +
>  arch/arm64/boot/dts/qcom/Makefile                 |    1 +
>  arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 1288 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650.dtsi              |    6 +-
>  4 files changed, 1293 insertions(+), 3 deletions(-)
> ---
> base-commit: 506632261e6aeb1aa05c3ebe4da0a9439153d746
> change-id: 20260921-topic-sm8650-deckard-initial-dt-19a5616b109a
> 
> Best regards,
> --  
> Neil Armstrong <neil.armstrong@linaro.org>
> 

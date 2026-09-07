Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A982638E8C3;
	Mon,  7 Sep 2026 06:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761621; cv=none; b=Jr7caRFKLZDCJR+PkmpSLbaE3nn5jYa1dy9osebrn6hsebcfe0piab1wdG/kO9zuxw8LKxzxw4QpWNxiYV86YU5sxazmO2JV156fFA3fZDTo5QFLGaTPp6fEzkgTDQ5fypRMMXs2b7bfhxwzGtaKSi+Yy8fmSGpKoCg5JmECmOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761621; c=relaxed/simple;
	bh=M6tZVzbr73tnc96k/RyVG+eR6ANWw4X6SBxtOYjHWlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MM2DdabpaT7+y6VfSO2LDI44p0B50a+QbcA506xfm2y18s/nekQjqsrV1paRsqd30mljWI7VJVYGJwotaXoboPaeb6iciu1IAGTD1BsAcv3JWukiAX4FgAKAxgL8EeYVin7gs2p6Oh+gF5TEfX6aAjNJm1DsDtdnMN7/N4WVmpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AU5w+1EY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AU5w+1EY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A9F1F00A3A;
	Mon,  7 Sep 2026 06:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788761620;
	bh=p860+R59BgbsF6ZYtaavYGSgMdtWpfF69XsEzjQj9i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AU5w+1EYyG5IDuelpoxJYfjR7pzJp/lWj4UsW5uBdD0duXgiI1TThNmnLFBkVV/ly
	 9o/wzTrbyF+xq/NHuTnDVRctbFOF5h9yGysu4KUpRfZVMAumhMq53DeV5xtdPYyxt2
	 58yU7XSLA3YdI4bahum3IV85LOVHP8Y3rFXoJf+MwsmXUBJuZj13tMKKItRMSRNVq9
	 Pu0cni279u+Gtlgvq2SxwpqER2zdqbM4gIRKXtsXNsyr71rljtw/I093p1evOOV1Yc
	 ekfcehc4VvETrktj7QP3mdlBJq8H+Q6IjZe22iHNAkmJu0oT89suy1TYyviCDNwzKR
	 5sVC9bGYO7bVA==
Date: Mon, 7 Sep 2026 08:13:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document the Nord QMP PHY
Message-ID: <20260907-exotic-quokka-of-chemistry-83ac2f@quoll>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
 <20260901095055.42229-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901095055.42229-4-shengchao.guo@oss.qualcomm.com>

On Tue, Sep 01, 2026 at 05:50:54PM +0800, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add a compatible for the USB3+DP combo QMP PHY found on the Qualcomm Nord
> SoC. The PHY sits behind a GDSC, so also allow (and require) power-domains
> for it.
> 
> The block gets a standalone compatible rather than a fallback to an
> existing one, because it is not register-compatible with any PHY already
> described here. Its USB3 and DP initialisation sequences do match sm8550,
> but Nord places the sub-blocks at different offsets within the PHY: it
> exposes a dedicated USB3_PCS_AON region at 0x1e00, which sm8550 does not
> have at all. Falling back to sm8550 - or to any other entry - would make
> the driver program the wrong addresses.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


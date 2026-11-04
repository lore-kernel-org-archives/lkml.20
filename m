Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810125;
	b=ds5CyaUwTlamqRu2uREVlc3BM52Il58RxjTgINAyNuid3IAb6DPWlxilE3H4kGVcLdNM
	 RF5pzc++FnT9nozEoEVeP9kdZxsNA6RUGonuLxhGicjFwig5sJAGoO05Z7hfBFc80VROJ
	 ApIyBgOhXhHiOVVtTPLCJpOOGyrVfglL0f5FKykoEiLDpePPSRVAxeabvHE/JgPMeyrdr
	 y68tzXXmeuTiLMOApef/93ig01tpBm2godnbqww/xz3tnUCnSmTeOaJFtjwm1HsBEl3ed
	 rr5Ul8TYXFHOxj6VQ/0Q0yfECOFTx9/3T/LHo+v4uFYwFEQg+1a/xsoWnIQ8ltCSj0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810125;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SbfzzROp8o1VQd8NPKRivV3cyRBL/18CLJBEtzHhX6E=;
	b=5FVQdil5vN8NQztgoU2dQ40BfaK2ZLiOBCUcNv8ZLssvsCxw3Kdv1N2XsZkeU95NeaRs
	 1ljfvAheTAHOiSPUblXvanDrJ556zbTKQGOO0yHLRTvVN21TSeYTarXKhB0cV36OIeJMa
	 +G0L5SsZdt5b4Sn30Eln86O1EWVyt8UFVmfS/48cLxRbxNzI8c32yL/bp2KQV99WyTkIi
	 6AU9A9QveoGEZ1W9FkRFei0C2Cbh/77HXT8NbBAefHLdjPQYf6HDwArVGbRYOHD0ogp1v
	 FqembwbKAGHSKV+XDDOy+qXoDG7Udfi7+pqB0nqEhH6USlCqbtcketR+JklKzRblbMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b0VM/7bw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A69606A31B;
	Wed,  4 Nov 2026 16:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b0VM/7bw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658F31F00A02;
	Wed,  4 Nov 2026 16:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810124;
	bh=SbfzzROp8o1VQd8NPKRivV3cyRBL/18CLJBEtzHhX6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b0VM/7bwi9w7myAwUB/DAoWpEWAE1VI1YPwOtYC2nt7NkXe+D2PLSiNgZpkcy7Tyx
	 YkfJCRRSynjPkpUZyrO/YvIcHa1wAzUdY0Q9VTyzwLGZbyGffr+riBR8DeEAonU7cf
	 giiQf9UYosjzx9JYNGJcgUyuxTJ7cjkY/oJXu+I5FVtvrkuPPHUCSwEtjs4e4OauPO
	 bIV8CKchpprr8cZ5zcMfNLti15ISNryEsdCpekYNUP855Dgnc15Wnx39c3LkQvZB2A
	 hLwPbSysbg1Hfr8lOdlE6LhLnRPEybSQ63xWYaBHFYWRHQlTyPjD1Pla8kAT6Ck2Ft
	 Yaee+ybNSdm+A==
Date: Wed, 4 Nov 2026 10:35:22 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: airoha: Document support for
 AN7583 Gen3 PCIe PHY
Message-ID: <179381008124.1965616.15041265527185423969.robh@kernel.org>
References: <20261103195007.9721-1-ansuelsmth@gmail.com>
 <20261103195007.9721-2-ansuelsmth@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103195007.9721-2-ansuelsmth@gmail.com>


On Tue, 03 Nov 2026 20:49:59 +0100, Christian Marangi wrote:
> Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
> work. Add the required register to configure the PCIe PHY and provide an
> example for it.
> 
> The PHY link to another PHY (the QPHY as described in the YAML) to
> correctly handle Gen2 speed and mode. It's mandatory to have this PHY
> configured for correct functionality of PCIe. The QPHY is a unified PHY
> that both handle USB and PCIe PHY.
> 
> It's also mondatory that the QPHY setup is done in the PCIe PHY setup and
> calibration phase or calibration might fail.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../phy/airoha,an7583-pcie-gen3-phy.yaml      | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
> 

You forgot my tag...

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


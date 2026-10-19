Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422392;
	b=vFvsWl5UT2xpvdK64R/Yfh96N4KJNESEqnT1LG+FggTj7baCvPTy2wbLO2JzUeOFdjo2
	 uQPOyRDYt9GGk6e/55/PxM6whAFjQaojXkzOmT2gz23jX6zbWL1HgKoTm6rkZCUpAKwKO
	 kJAePLoiDXcEx7pK1LlphCO2HGsn70qjcJYg/+IsHwPnF6PuCytFeoovMCmi9LH+RNmFB
	 9/d4T1LOOoDjEQMVJ3z+jAw1ae3/5agR2Hx/Z8uWME1gqXfFNuIa1W736VhwDwLfL362S
	 FekGPX1jAHLSICPk8R3yo+N/J7cjeXUMJ0EKwR8OlUfauwRzenx1LEvHWumGP/nuKww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422392;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Cr4YwwSLfkiUol1Qs2oQGw7Kr0kUMHG32ZziBkuSaP4=;
	b=nz3CillJuDWU652/ugtyIhe7boKF5/VG1gyr/WURxj04UPks/cH7UDFoLgPRybKnowCj
	 v1EwtXyFA9koQVxH5hs1Q/jpPAd5g9catU1ZMTUXiUXsrdXe+EBzEngBfIk2X64INkT/P
	 bzgMBDZ2D4lp7s8TEULdw3KZrvugu2rFc1hUwOIesednFhzZrSOG82sPwkH1IYeBr7NHp
	 m/U6NLgiQoNNhEeSNjQ7m4JGu8utGVndK6Hjd5ZQVPonVeSi+0iU1PJzMnyd+4h+7ODt/
	 eAimJ7QjwX6IAaOdUbUd2vRJxX4foS7WI+5ZC7I3aSWErE1uP7j46QCS/qnA/p5+6yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eMAcO0/8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DCB60820E8;
	Mon, 19 Oct 2026 15:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eMAcO0/8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E47B1F000C4;
	Mon, 19 Oct 2026 15:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792422392;
	bh=Cr4YwwSLfkiUol1Qs2oQGw7Kr0kUMHG32ZziBkuSaP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eMAcO0/8yUllBiV1FwYry+ie9hG4Dd1vc+Lu1I4Tw6w33WQrgBEspZw4t4uvXPmEs
	 hL0L7gs0tWZWecc4cbCRMKOfqE2bvTL6PVKkzwVi0cLxd7oel/sNEd4grJ3BuyN2ik
	 bpHKUSTlsFuWeJO4L5Ai5V4ZU1hbN7FdYoP60UaY0vf/Dk1PxwCXyCINaHlmwjfW5h
	 iTafIxUPLvCaXeQfwcE8anw2fDK2zvackbEKSaJFP0Pkz2NhDZjxM8HqESdL1xPIJw
	 krncqv99/JN6676OYGThHfR+CtpScn0UP/Ltnh0V2OdnUx/L171lKDEFOw0F/bSW7h
	 kv14+0p4tthnA==
Date: Mon, 19 Oct 2026 10:06:31 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Guochun Huang <hero.huang@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Riesch <michael.riesch@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
Message-ID: <20261019150631.GA265407-robh@kernel.org>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
 <20261016140115.GA1798470-robh@kernel.org>
 <20261017-gainful-goldfish-of-climate-bef863@quoll>
 <CAPwA33+bR1BF9KeA9my07Yz7gXW7TXq8EPhwQ4GvHMSFDk+uWw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPwA33+bR1BF9KeA9my07Yz7gXW7TXq8EPhwQ4GvHMSFDk+uWw@mail.gmail.com>

On Mon, Oct 19, 2026 at 04:15:03PM +0800, 楊智成 wrote:
> Hi Krzysztof, Rob,
> 
> > Existing OS should ignore surplus cell if the driver is coded properly.
> > Same as adding new properties or new front-compatible.  The question is
> > how the existing driver behaves?
> 
> As you pointed out on 5/8, the xlate checks args_count != 1. The DC-PHY
> driver was merged in v6.15, so every kernel since 6.15 fails on a second cell.
> 
> 1. Keep the second cell. Add the patch as follows:
> 
> - if (args->args_count != 1) {
> + if (args->args_count < 1) {
>     dev_err(dev, "invalid number of arguments\n");
>     return ERR_PTR(-EINVAL);
>   }
> 
> + if (args->args_count > 1 && args->args[1]) {
> +   dev_err(dev, "only the transmitter is supported\n");
> +   return ERR_PTR(-EINVAL);
> + }
> 
>   With Fixes: and Cc: stable, the stable kernels maintained at that
>   time (currently 6.18.y and 7.2.y) keep DSI working with the new
>   dts, and the receiver fails cleanly instead of getting the transmitter.
>   But EOL kernels (6.15, 6.16, 6.17, 6.19, 7.0, 7.1) stay affected.
>   It goes in with the series, since two-cell dts only exist after it.
> 
> 2. Use a flag in the upper bits of the existing cell, as Rob
>     suggested. Existing kernels are not affected, unless a board enables
>     the DC-PHY CSI-2 receiver on 7.0 or later without this series.
> 
> I will write the impact clearly whichever  approach is selected in
> the related commit messages and the cover letter.
> 
> I think the cell approach is easier to read and more symmetric in the
> long term,
> but it breaks more. Which one do you think is better? Thanks.

I'm not a user of this platform, so I don't care. Up to the platform 
maintainers to decide if breakage is acceptible. You just need to 
document the issue in the commit message.

Rob

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412227;
	b=IO52y98QsF6W+xgGTZgjvWhk5KGyZpW8Djp8DNwjH8F+Ph3CIfQlm9u/j/jceAl/nWFn
	 os0N0+vg6cEd0YEHlYI4tLfAmMgKFUiwmgBB6psyztrnpTOXtzoVverTYvuHmgm4tadCV
	 tZUqjO1zOj4HTFhQIDX536/BnS4lNqnuPg6rCWJPu1PDCyzx2IQfB4y7lotZROwRLGtoU
	 Wzisz+J+PIzjIYbnqpepWyIQjIqu8UMC5F2e4ITX+wctS4kY7/+ErfhAuVlwpq+4rvIMs
	 5MTyZ+3A+4Fl/o7JLMWVpfnFhwMHUksn4zX93wZpd5oRKBooeACPWEQET6llb7QrGxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412227;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NYcAa2a2+ibnf1/Oun/2V68PPhIG7kMsSrFFMPbFRUU=;
	b=EXzvqaRhceBJniNSdvu1d5nGsVpPfTDtirKCpWZUwVwSOV4V/iaE89uWLn+/McoxPI7J
	 dH+5jLVCv56Kj+xh4afetYAtEb/n7xaVs4x5wuJtVeKIUatAuFUXZvPoOV+VklbaOZO3d
	 KfRBB2UKu12jZROFnqZcmX/Gg5S8XdAz3fiS9QaQyhOanBpxTYTgDhWX8dCTgDRNvnXkF
	 7vZBaiaBt5ahLnp0oplNDu15AjTunVFSD5VjkNUNv6KcU5FhezkNnUQqp2lKuXqi5RBSY
	 5w+5gTsh9rNBnO8vtsuBewJvC8aSCl2RVGA5PAOIoY+90/jd4Elk741IGFNPRlhdxFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWnRNCy5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BEF606A880;
	Wed, 11 Nov 2026 15:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWnRNCy5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C312A1F00A05;
	Wed, 11 Nov 2026 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794412227;
	bh=NYcAa2a2+ibnf1/Oun/2V68PPhIG7kMsSrFFMPbFRUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eWnRNCy5PPWNEPde0PkRo184RI2u3JFZ5gxP9fspwrY3SRoG6Xsc3c6BA3RlrLckm
	 dQOHvbiKHFkXIlozw6OVBrl5EcN4fGsU/YTct2z5R2xWFJlRFRq8Fzcy4wg8Xp8wXS
	 Rbk9xzHPd3+Ly55e9udvO3H3zSvMzKaUejWP7DqYM5ZUd+xVGFfCFBlTm3Nv+kCfX4
	 JxuOUDAoA30ArDDAs8lPVOZbbr1lk4tJRSKoeIXBwicYAhlXPnNP84ssAmd7NV+GGz
	 GhULh4F3YwwQVf7a6ybuTEGykt6Od6Vw6dKX5P1a9p6gvTbLriB8EnbP51cpQZUvlm
	 huq7dWVRujXoQ==
Date: Wed, 11 Nov 2026 09:50:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v10 1/2] regulator: dt-bindings: willsemi,wl2868c: add
 the WL2868C camera PMIC
Message-ID: <179441222370.2975760.8038836403367934702.robh@kernel.org>
References: <20261111111132.1296892-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261111111132.1296892-2-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261111111132.1296892-2-xiaqinghuan@mail.ustc.edu.cn>


On Wed, 11 Nov 2026 19:11:31 +0800, Qianhui Xu wrote:
> The WL2868C is an I2C-controlled camera power management IC from Will
> Semiconductor. It provides seven programmable LDOs: LDO1 and LDO2 are fed
> from a shared VIN12 input and cover 0.496 V to 1.512 V, LDO3 and LDO4 share
> VIN34, and LDO5 to LDO7 each have their own input, covering 1.504 V to
> 3.544 V. All outputs are programmable in 8 mV steps and are gated by
> per-output enable bits with a chip-wide SYS_EN master. The chip also
> exposes an optional active-low RST_N input.
> 
> VIN7 and VSYS are both inputs of the internal control logic, which is
> powered from the higher of the two voltages, so a device tree has to
> describe at least one of them. The remaining inputs only feed LDOs, so
> they stay optional: an input can be left unconnected when the outputs it
> feeds are unused on a given board.
> 
> The example enables ldo1, which is fed from VIN12, so it also describes
> vin12-supply; the binding says an input may only be left out when the
> outputs it feeds are unused on a given board.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../bindings/regulator/willsemi,wl2868c.yaml  | 99 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


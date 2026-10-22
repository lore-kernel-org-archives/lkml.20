Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664234;
	b=FMk37QlNJWPsLdSV4tCoLiT0Ae5irIxRFeYvH1+vCN/YI88TER7BxyUevE6jxYGOKfyy
	 N9nzZ961CjaiOVLMz/byqk46rZDTVBdvXX8RFzAvaGZVNXt0TXW4xzHfe5GRLL/ste5AQ
	 pq6V/RSAqL3vQDaVGyrlIiGxVPFm//Z3duQiCBCY/iVhte9lglUOvi+9i73R63zbzdZkZ
	 3pm30ETC0rehanKGoH7+PlkOg0oYGecBB/Uf9MbYeYTewuNGb0m+6MAi0fgTBzSw8gbae
	 upHYpA1ivoo6x9Ii+VteDTG+tk86/3per/x0aXr+S+6QJDBFzpdcl/YPIISxGgtOxAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664234;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ou2d6JrHWje3qmQuucjDNW9hnVMBNvCFOnYdEcVU8uM=;
	b=aM+4t1e2suwoyHb6y3eUNzNfs+fvcF/RXDF9PuHKJ6y7QUsaUAnMmZ4csAr8a/hm0Vbe
	 N0SiIWQRvFZdXU6q/TXhqd+Df//u0WrqY0eoarMq5j7tIDXUblrcUrPHuAVrUV6VsyVgV
	 AG9tQCfQP3ASoeTrimRVgvHHuSXtq8gVpKsDTLd9RVNzBZ1rcB1UPWU0rNBpff9xHnwGz
	 I4MH5V7FFPt4A0W/cpJVFmtD9fj1uUAdz2mcEzqt1kV9YeMjhW8TVlfp8iBiNQoAXFYC9
	 QXyJd+WwQmvNi05wYPoNixCVsm9kVC0lFSIpQKW0LwOpxNhNF8wlB6gQ3qWfwfjT7vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HZ7O7g+x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473D1606A31F;
	Thu, 22 Oct 2026 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HZ7O7g+x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F48E1F000C2;
	Thu, 22 Oct 2026 10:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792664234;
	bh=Ou2d6JrHWje3qmQuucjDNW9hnVMBNvCFOnYdEcVU8uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HZ7O7g+x9EgxZqnoP86fD5Zqurnf0JaLvWRZVC8gWcpiJMGhiLbCSpgicwvKDwxax
	 Rm1pORO1egBQHZio7fTZWOwbCKcxwiSAxL6GrXawDqV/MXwgT2eYtsNat6HmnL5S5X
	 IZzuuy+AIio/veF6G1fKQEfuaVGRRr27VT746zfvfSyDYvzKtV5C2xvBix/VDEOB5e
	 aRwXvsGgU3DwSw6TRPxBkF5zGwxjDVmulaQicjoABG4sY/Vsv5Os3FJirw1lc3WOJL
	 a69PJCVY0uzyHldj063o8WUxjFLQNURzjrc66BDY2Nst67U+2dEFrQrXsKVdqzL94L
	 Lt7dUD+vkH9LQ==
Date: Thu, 22 Oct 2026 12:17:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-amarula@amarulasolutions.com, michael@amarulasolutions.com, 
	dario.binacchi@amarulasolutions.com
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add Axelera Embedded
 111c
Message-ID: <20261022-accurate-beige-spaniel-c9b461@quoll>
References: <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
 <20261020113717.189082-3-patrick.barsanti@amarulasolutions.com>
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
In-Reply-To: <20261020113717.189082-3-patrick.barsanti@amarulasolutions.com>

On Tue, Oct 20, 2026 at 01:37:16PM +0200, Patrick Barsanti wrote:
> The Axelera Embedded 111c is an SBC based on the Rockchip RK3588
> SoC.
> 
> Specification:
> - Rockchip RK3588
> - 16GB LPDDR4
> - Axelera AI Metis AIPU, 4GB/16GB LPDDR4X
> - 64GB eMMC
> - uSD slot
> - 2x SATA ports
> - 2x Gigabit LAN
> - 1x M.2 E key
> - 1x M.2 B key
> - 1x HDMI2.0
> - 1x USB-C with DP
> - 4x USB3.1
> 
> Link: https://axelera.ai/axelera-products/embedded/111c
> Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


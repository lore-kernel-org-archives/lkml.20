Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846650;
	b=s7+/Dy1kaOrw7E6CazfqzVAtPgWV7Lr/SGJbKLIfmhRrSXNmpChMmDUVa9jtBuEWY9XE
	 2wHT4ReOeNlwxSO6Ab/Legz52FIMhY16FhQD+N51TRxvQLzoocQ9AbYKqfgYbCL4fmBJG
	 XIWaBNwxT05e1IDsk7o84zj5j2XVhZZOItgxJVd9z+HqCXLlrDWlsGaHo/zg4a7Je2zdz
	 DomSy1pXUut636lpBU0eqnFhdz+IxLidEyrqvueQujUyqgkR+jk1/HpedV4GScjbAAjyK
	 EoUo/M35md8ytDzGanIBsPPEdqg6g4CuX/83tytb/vscG0AgdiEifuGbA6ONgvlw16w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846650;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=/JOhbAozvllkjpm0FYBXew7/avwMplBesdQ3ypNOrUI=;
	b=jplvHXhxTu0EOUiWdJevp25ld7vB7ygwDkb2C/u1pFl4tUtOR0bypEgFFa65u8rWAyQP
	 KHPR0GXr5ZGS2c3Q8RsGFgZM0bf+igvUILMORsOaam7CH82oEX7UNTlsZGdYPr9WFxVXs
	 ncmzUQqSDFCmuB6qjnYyaC6qnQ1btQPTKW7vGoxWgdzjUHgFfLITHVCPJcLTh5iSg3vzI
	 frUhf9Ei+uf51uh9YhdLFLUXbNZj+9Q/Yo3m0y5EepGioDnK66laVBW20LjoTw6Cmc918
	 klkUEm/54ZysIpUzROQLbpS2HsDem/PXpljLZv6uUCxdW+rZeyRZQymv+W7eYgnS8/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NcroMnaA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED66F606A31C;
	Mon, 16 Nov 2026 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NcroMnaA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A651F000D0;
	Mon, 16 Nov 2026 16:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794846649;
	bh=/JOhbAozvllkjpm0FYBXew7/avwMplBesdQ3ypNOrUI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NcroMnaAEo2YPK1YnyQQixVQx3SPHW3JilNQOL8Y8NbXEjtgO2kGjHVOFGXLWWdNb
	 PbOw3o3fqFnhVm/LRbpxsiY1n/YoPkf/DIja1dXUkavc3lZ0TX82TMOK5ZZueCgSiv
	 plyud2oiGXGWXSk1CRJXKnEHa/HeagLDEmfXA7h0qgIrlbgp0IoJLS9I+V7BQnT3gE
	 MITtAt4If+7rSWbw5vU4y87fXSa9GFfpAMD3N2yhu1VO1pv8MzEl/ASiKBAEIv4UiH
	 tEoOtp6bXC4UTGeme6n60ok7Xty5ePUyP4lOxlIg3klxJyGMZARaN7mT0+esLfDCUN
	 FLM6xhW3WaQcA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261115171148.37784-1-jernej.skrabec@gmail.com>
References: <20261115171148.37784-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: allwinner: h6: Enable Ethernet on
 Tanix TX6
Message-Id: <179484664773.3654899.16017246005378220795.b4-ty@kernel.org>
Date: Tue, 17 Nov 2026 00:30:47 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 15 Nov 2026 18:11:46 +0100, Jernej Skrabec wrote:
> The AC200 MFD and Ethernet PHY drivers and their bindings were merged
> in v7.4-rc1. This series adds the device tree parts needed to use them
> on H6, starting with the Tanix TX6 and TX6 mini TV boxes, whose only
> Ethernet port goes through the PHY in the AC200 co-packaged with the
> H6.
> 
> Patch 1 describes the AC200 in the H6 dtsi: the I2C3 controller with
> the AC200 on it, a pwm-clock that provides its 24 MHz reference clock
> from PWM1, the RMII pins and the EPHY calibration value in the SID.
> Everything stays disabled.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/2] arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
      https://git.kernel.org/sunxi/linux/c/16272a829005
[2/2] arm64: dts: allwinner: tanix: Enable Ethernet
      https://git.kernel.org/sunxi/linux/c/836398c4e1f2

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794742518;
	b=GBU0n0kZZwaeyr9RI33YqmoRhVUP9dsY62h5RzJ8IfKdTtEgTkf+V3y5ZDYpX++RNmnb
	 GEm8h3l8pmqc5ByLQzJTOOKLw4BtFJKsHtLDydtNvixEt6rKPXeRO5YQigg6YVBb8r3M0
	 eqptb6++E15iTTnNVa05qdRkItuqH30vgKYVnRqKyo5RG1eLuvW1H3rtFedp+ipuJgA4R
	 wFM/QYTX29P0DAGYUwUsNw/qNehOQp7ilQRz46GWeVKaV/6sDiQJRlXdeXIBV9W1tVqCP
	 QcvxPTw1rpP1cNXWqb1nQ6lqjPhXfCKGQkDHHoXxs01MCLG4s1vx099hwhdmQUALg+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794742518;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=UkLWAV1hSmkKAmuwwqothfPZt11tAhXLerlu5PLiFXI=;
	b=ZsQOtnkZ9dOzh0qp0eFFV3NXnO4PQEn/7/eSZoqV2WtTkN2on+islYAl5iezSl+KN9kF
	 hTUiWIUwKd7378j2UUZRxEJa6MbwZLZZ7AscrutfZYbjD08aUdJsp3CjPrVFTfAyUJkEE
	 TVrWuVIBYU5A4JgAtpKGzIF/Eb31ytDbPpOMsMW7IVvJd/nvS//fXmfazZIpf/r0Ors0p
	 97XQTKg/oGbhXdTxIzAAgXQ5FUZ9yDBx7sU3gxhFuOTojbuItdHp0h/ZbPJxShiPAjUWY
	 DvA+fCu6D9IfuU5fCoxzGrLB1M5sp2lcmvcmlCqYfLwp2s7JIZYo+P2KV2sA4JLDq2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7WEGIfH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D12606A337;
	Sun, 15 Nov 2026 11:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7WEGIfH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89651F000C5;
	Sun, 15 Nov 2026 11:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794742518;
	bh=UkLWAV1hSmkKAmuwwqothfPZt11tAhXLerlu5PLiFXI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h7WEGIfH8FvaqWXLN0d7OMtr/gQbGsGk9acfLe13ANtU20xLLJK1gxR+UiCXMsdyr
	 ErPTlvjSFCTKpyfVT5Fp+afuCFOMJQzhED8RQQf6V/HOlcTDpihhz03CZYc4n8zLL+
	 7i4UyA7jqiDtbVybiKkXjgdWsUmfM0w/fPFRzxCAJpCgEHB4NBjLOFaH+FoClGyoK6
	 x87ZvIsEd1c7LQCraA1DFLAV/OWgIZhfMcVM6/7O2F2mFKfhTFYKYXAJHfrTFISUAW
	 ku9q4aIK2ufEJr3zJGj5kS4rIpYA4LCAgYc3vajsCWUX300tkx5Nw+tgdy0D9hT+4/
	 qRUTvOGSO8IgQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261104185148.883318-1-jernej.skrabec@gmail.com>
References: <20261104185148.883318-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] ARM: dts: sun8i: r40: bananapi-m2-ultra: Limit eMMC
 clock to 37.5 MHz
Message-Id: <179474251652.3095306.12076464290738502589.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 19:35:16 +0800
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

On Wed, 04 Nov 2026 19:51:48 +0100, Jernej Skrabec wrote:
> The Samsung eMMC on Banana Pi M2 Ultra fails with "data error, sending
> stop command" within a second of sustained reads in DDR52 mode at
> 50 MHz. At 37.5 MHz the same board survives a long read/write soak.
> 
> Limit the eMMC clock to 37.5 MHz. Also enable the hardware reset line,
> which is routed to the controller (PC24), so the card can be recovered
> after such errors.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] ARM: dts: sun8i: r40: bananapi-m2-ultra: Limit eMMC clock to 37.5 MHz
      https://git.kernel.org/sunxi/linux/c/160738a3721c

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


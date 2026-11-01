Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571379;
	b=Hmugc6sfBAeev6U/zp6ztg5EZeb1w3OLWl2CzBE3eBu6EF5ZovvsuKql0+KfcJWkjjGa
	 u1QsB3i5zxDMhA8wCJv7yTupqHnDfPAGK0/8/IItx0umyJNWdPCakVVe8fWtN1APio88Q
	 wMh1YNo8rtZytHL+goKk8L9e93QLcO2/a6/uOlxh63glx14BzEFX81xJbhAXOXgkMi8Zj
	 731/J2vzGeqmS6Skdta1SKjrijM9rzcFkwyXG3gu/YZN3kzJ4iCVKP4V31dP2KmqfAYXc
	 Z2GntEbowxdPfiX/CKcUAPXtnJ/+zUCMNkuc8PsugK6oGsop5JTwXj6BG1hF4xVAJcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571379;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/5lqkhXjPOMaaYwItfh5U9VLYOPhSKVw3/zHayeWQek=;
	b=YR/J5jxY6x8hWyXQSAMydszHX76bnlGO3kCq+Un+hQ/xr5grWuFe3FDAhwMOkpNopfBI
	 pl1Nv5HHXVuDhzYBzbhf9Uf3NrS4ddlaSXUImQtBJpuSsGmbHCxzmogyYcoEsoVxJ6EaL
	 GA5siLCFllx/bQAFQYN/z4zQNnvBA1KtGV6WIjp9D3Oec+SPXGhrp1hD0aQsO+C/pW9lL
	 9vChwwVs39oFdr1bWNFJronjHTtAcze+77rBBt2hJtI/7MW9m7u/djQcSXIVAYMY7xXyQ
	 sUETSisskQBLn0RDaL8grURFRX8am1rBJ3ogd4kLha9wJjP3BEjaE9YjpAtxdf+GZkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=DFmTlMB+;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222D9606A6ED;
	Sun,  1 Nov 2026 22:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 222D9606A6ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=DFmTlMB+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/5lqkhXjPOMaaYwItfh5U9VLYOPhSKVw3/zHayeWQek=; b=DFmTlMB+u5KACGAPOZfSN+xwXk
	gvM5TbEwpGVgGhejDSm2o4DjxMmcMHL9x5/ou8jWCSCj8HqvUlIetE2ZaUlCjANI27A2MGi+OiqzN
	VTX9gfXQtXBJZSCCqCS+snckWHSFt8YE+4k1oeQ6KaMOyNRzfVTIAIg3YOLQz1Xkxs+gBRj+3DIxF
	FDeXoTMbqAxhksIaxc1A8kY13ZWwxNC3NGXgz8+nKAJbmyrkLUo28czjRzceeuFVNsuMuVeneEEp9
	pxe5ZpMygdN0kQiB1eBSDGWJqPLoBt0gUhpxmOntg/24ATVD7OpcJ3q//EUWSrlZoBgF9ccN/6m3e
	vp4/czgA==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix adc-keys wiring for Orange Pi 5 family
Date: Sun,  1 Nov 2026 23:16:04 +0100
Message-ID: <179357136490.4108155.2920979357901660151.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012033929.2317231-1-dennis@ausil.us>
References: <20261012033929.2317231-1-dennis@ausil.us>
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
Content-Transfer-Encoding: 8bit


On Sun, 11 Oct 2026 22:39:29 -0500, Dennis Gilmore wrote:
> When working on u-boot for the Orange Pi 5 Pro it was called out that
> the Pro does not have a recovery button and was missing the definition
> for the maskrom button.
> 
> The shared rk3588s-orangepi-5.dtsi describes a "Recovery" adc-keys
> button on SARADC channel 1. This is correct for the Orange Pi 5 and
> 5B, but the Orange Pi 5 Pro schematic shows channel 1 is pulled up
> with no button ever wired to it, so the key can never be pressed.
> Each board's schematic also shows SARADC channel 0 is connected to
> a real, populated Maskrom button, but no board described it.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix adc-keys wiring for Orange Pi 5 family
      commit: 591ff7dda0603cf21cfe3bfd7d9b1d10be8154c1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571357;
	b=BrW06YxLgk8A8TCR2GASQt+vnQZ08KSCBHZrzfMK2Vmpp/BKoZAH7DlqweAzuJzHMv+x
	 WvCoPT4DNCi2cCsbijN8PkrONf01c6Ef/vK0DvNIrUgn3MsuiV18RQLeAfXMEIxoX9crQ
	 mN9tahn0JL7PPfw34sNBOIzarSaH/45YKJrfvBwBD+bnZXcc7J60Dzc8MmmpGTHymrk2f
	 9r2KaDvNt+fQsAa6zHUyYurrQLJLdK1L7ApE/XgItW0ctuCtVwh5zuWsNzzPTP8gdHH6f
	 z/gdy13cTNtgvhQT/WIC1iZMQeqzzphIhvJ7NhcSJiazrvzMxA8uDbHL6c/uo0DrS4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571357;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3Kd169eysaQu7RCb4n9yzxMgogeBCixS4WYZtP9OonQ=;
	b=hULFQ2V0T5BH9X0VavLILTzX3bDfG086EAT/jClXxtzC685+5bwKmgBku+yn6N/AQ2CT
	 1GHYVJbA5crivOcxsJOmaL4NXkRWkehH0m6HpwtfprhWYBo0BPJRdExmJAkfN/+VyY9wL
	 Bz9JHueGwJKZeNQ75AKbB19J2x1RFNV6bDdWzFv0EBVftN/hGFhLeh7HjNPXftBImjFVD
	 Q6H6QzDyqZKmv3uL3Y5SbajAeX2UehiGmPIaz72LwixM5uj1wyarik8cseStIHFnZCCy2
	 rrgIbBwO2yYbYU0cRFgTKj8Ff6J9f638INu+FOSK/xx/RkVllOc7m+34lPJ+qzoe9iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=UoD8PMbq;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A2960A2604;
	Sun,  1 Nov 2026 22:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42A2960A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=UoD8PMbq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=3Kd169eysaQu7RCb4n9yzxMgogeBCixS4WYZtP9OonQ=; b=UoD8PMbqgQD4c34zCJSg0GJaet
	sBJfOa1YATL6vN9ZpXCsr93MAYgEA/9x6i0ePk4fu4h0qWMVRyMlCJ69Z6ZW4whSSCGGAUz1wy6/b
	krAaVXWmaj5kofRsvfjuUQnyVB58wSmTFsfHtq7mHtjckC7cNye2QLCeeHiG0cQDvxwQrKrF0/Bx8
	EdkEs5azs5pRwirYVOeTd+J6FleptIYySNG5GksLjSGWv4y1Hm4YUD+oh2IaIyH7+KFg1JTza3/wP
	XYS29q7CKPrWrrsjb8XtSMNl0gbbQNSVo7mv/4+XHtLkIjeEgoDhXy+eP/O5RTwPc150j7Q718Buc
	1hIOykDA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Richard DeFrese <richard.defrese@proton.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: route ES8388 MCLK to the IO pin on Orange Pi 5/5B
Date: Sun,  1 Nov 2026 23:15:28 +0100
Message-ID: <179357131391.4107717.16406250143729815997.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260822194730.526392-1-richard.defrese@proton.me>
References: <20260822194730.526392-1-richard.defrese@proton.me>
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


On Sat, 22 Aug 2026 19:47:58 +0000, Richard DeFrese wrote:
> The on-board ES8388 codec on the Orange Pi 5 and 5B has no analog output:
> the codec's master clock (MCLK) never reaches its pin.
> 
> RK3588 gates the I2S MCLK-to-IO routing in SYS_GRF SOC_CON6 (bit 1 for
> I2S1), exposed as I2S1_8CH_MCLKOUT_TO_IO. The codec references the internal
> mux (I2S1_8CH_MCLKOUT) instead, so nothing enables the IO gate: the
> 12.288 MHz MCLK is generated inside the SoC but never driven out to the
> codec. With the ES8388 as I2S bit/frame master, the SoC I2S controller then
> never receives a valid clock and aborts:
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: route ES8388 MCLK to the IO pin on Orange Pi 5/5B
      commit: 27bb79d40d4890814cacde534e9b3d9cd8ad7435

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

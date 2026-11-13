Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568568;
	b=AbcAwhGfqRPRfRQ0W6H3qJXXcD5/Yyn4NzaJn3evSL2TFHIJEe8DO9JXUxTQnFVpPpKv
	 Z5DCmaLAeN00KhcQcNmUPyFT5Rha4nAXKPTVYqEnVcdx4yDPjy8me0v47szE77Nho93bO
	 lBVWvxckS2+GCyRKAjQmpeN3ukIxCSe5s64wmThkB3WPVml//pFXuTN78lTJXBPhEOEkC
	 AhK1eyG45AFyBja+P5i+vh5P8LctU2A0gSGVcED877EQV72fSGR1caCWml1L3OKyMq2WD
	 HZbw0XvI0lLSw6Oi4ofDcgnJrV1w+itWt02CEjlJZ6g6hobwLF36yWDafyU/fGdljMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568568;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cjsu9/5ej+ntzXZUPugJjG27uarENToyBzhqO2/xyvE=;
	b=pzio+UM0AssTxktsGVNrg3fKMtjpJ0d1/fhvh3dn/w3Yq7s8/mYH0zDz1ODXSGfrmE4w
	 weDsaJlIbC1vGl8DZP/IJRYXSZRurn17XJYT4JTYcSfJDU8VT6lkbzftCeGTauZduHZ7d
	 WOAq6Lcd2N5d+F43frbc9bNmpYkIauJY9kMJmKOCLGw+MkZR4t5M5JstevOulfM5v8nND
	 +FedXOWmoSfpvwYaeM1MNXDkAQGd5cUSYhFjvDi6j/OOhDEcuD9jkBL3p/AXq9FYzMEDe
	 E9z8Gpm2WJWDVGQsZJ1z3j0Wp4W4PxotE9RCWZnSNALXHTT7xTraN030koH4sULD4lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ja0Jjemo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33112606A31C;
	Fri, 13 Nov 2026 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ja0Jjemo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174671F000C4;
	Fri, 13 Nov 2026 11:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568567;
	bh=cjsu9/5ej+ntzXZUPugJjG27uarENToyBzhqO2/xyvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ja0Jjemo9Q0Vgk2M06FtvFDkVqdzKX1IodhRlb5oUbvAsgneHGm6FPlLMxSmlKzIU
	 xWkrFmbaV8Hrr56eiM5I2puOGg3cnYelhn5U+vJTDC7AUmEj7MnpJlnI/ti9bB0gMd
	 CpbuFE5JLBSmQhQeYOIxuB0h0Ba/IZ1/zlBIV9CQLmXkzxi9qhmoFxbAn1GpmdtcF5
	 SLG6hiyumKtG55PRJkcju2Bem9//c2vFAL0k/pwguiuqgdkjvkaK3LvTi/Azdy5a0V
	 V7UXMeRzWLyOtHJCWdaX/2kEDKv+nXgzirmHMI5/TJZvld1v5mIz0J/WPqpEasnnO+
	 duGo3LPnpxIxQ==
Date: Fri, 13 Nov 2026 12:16:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: mt8173-amazon-suez: Add the
 PMIC AUXADC
Message-ID: <20261113-hypersonic-inventive-kittiwake-956033@quoll>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
 <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-5-77b47cdea702@gmail.com>
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
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-5-77b47cdea702@gmail.com>

On Wed, Nov 11, 2026 at 12:19:54PM -0600, Ryan Brue wrote:
> Describe the MT6397's AUXADC and the battery pack's thermistor on it.
> The SoC's AUXADC only has the board thermistors, and the charger has no
> ADC, so this is the only way to measure the battery.
> 
> The thermistor is a 47 kOhm NTC behind a 24 kOhm pull-up to 1.2 V.
> 
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
> The thermistor numbers were referenced from the vendor kernel.
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Adding new board is one commit.

Best regards,
Krzysztof


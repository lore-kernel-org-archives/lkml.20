Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912980;
	b=b9XDYQ6zortb9K24/pnXt2XP1O8MJvLPnfCtrVNtjv8gZEhQocarq9KDKQrAPClHfKL8
	 NlW62ClO4P8b4lOFJgQuQPwWE3GKXXpktcbdFIqFy1wn6pqCg1ptTANvDyxGsDASvhvxE
	 I0hkrooQgcLP07WQAGn8Qb8gEBqH8OW4NfYIbkHg4nyhHY6NQLI6bG5K/G3CN4nhb/4Rq
	 ldaIqMQvTXFnYVZAzjyP939rTNbXau2/FKnSY4SM0SXV4U29GbW55OBoJGeS2j5wZ9Rs7
	 cDmq61skYG3D/Srtkp5+9jgWoS0rMV4MlpYY4/pzIFOw0UDLmMxim9nW86s1jceh8Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912980;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=iU2cW2IePpuS+D0FuL9ISarYXE3VkyR/PI0yo1keQto=;
	b=jdFL1YseX0YKEU9v+XaRLxcENjgHB9DUSY2vE6NxKNh+u3/5zw8ordDq9Y67CP2kuTj6
	 UXR/m9HSLMiJf0rS5CBwCK+Z/BGSD1+goXFxKTwJ1QWW7xH0ytdi5tR7GeKnnHh5AJOJO
	 DiwJXWnsgasmL8IJ/DrkJvU6QaixGDA5eKmx9liOcE8K6xa/2WPv6bSj0Ct9XmVNRmz0+
	 bzKbsByoAzomU3R/1LljLZI0AVosEInClaQ8OQgd8qaDcbbuiYvQR/ZwF4Y88SPxE8lhg
	 2sPkKfJ5vdx6xSSIWUt0DE2xIAhiobHvgIaX6cXAehmyEMvOaFMDTZ9Ncv0+j33d13w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=EqHGWBNu;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356E2606A323;
	Tue, 17 Nov 2026 10:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 356E2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=EqHGWBNu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794912978;
	bh=jGf66sH2K3XDwW9pv5TB6TILgUjOFvJHw8j34MMykL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EqHGWBNuokUEOWYu0ZNDuzuegP+0HeZ4GihiuMEdGu6x72WSK5BTeDoK8xbr/8OQj
	 X8X17Ll2r+jt8vsQgbFekOZm1te9g+89jGiYq3NyB+Cd3Rr4OV8f21v2yBngTORn2K
	 C0RnK/F1sIm4TmzEsSG3vyrUvKsn6UzeBsPQWWcYOq6Un9naNpouJpaA9qVPOn2Bb3
	 e510m0aqQNZaZLstJkDTRy/OWptpD3TfenceB1b5fkJXYdF486iZwkBcCEjN96v/Ed
	 fKlD97Uq+63tveUNO536CWEud1xUBFGoOH09T9jIK+lh0Ev06IjieU29njTNO+gNRN
	 0jbHEsaAkd2rQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E66ED17E05D6;
	Tue, 17 Nov 2026 11:56:17 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
References: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] arm64: dts: mediatek: Add the Amazon
 Fire HD 10 (2017)
Message-Id: <179491297788.155632.16976214618689978473.b4-ty@b4>
Date: Tue, 17 Nov 2026 11:56:17 +0100
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
X-Mailer: b4 0.16.0

On Fri, 13 Nov 2026 10:42:43 -0600, Ryan Brue wrote:
> This adds the Amazon Fire HD 10 (2017), codename suez, an MT8173 tablet
> with an MT6397 PMIC.
> 
> Patch 1 adds the board's compatible, patch 2 the SoC's keypad controller
> to mt8173.dtsi, and patch 3 the board, with:
> 
> - The eMMC and microSD slot
> - The micro-B port as a USB peripheral
> - The panel, the backlight, and the touchscreen
> - The accelerometer
> - The light sensor
> - The charger
> - The lid switch
> - The power and volume keys
> - CPU frequency scaling and the skin thermistors
> - The battery thermistor, on the PMIC AUXADC
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[1/3] dt-bindings: arm: mediatek: Add MT8173 Amazon suez
      commit: 321069a4642ff220f73556aa541d9537211e1c9c
[2/3] arm64: dts: mediatek: mt8173: Add the keypad controller
      commit: a09ffcb4fd6b0a417f36e1b819b329a0b489f7ce
[3/3] arm64: dts: mediatek: Add MT8173 Amazon suez
      commit: d43a2180abce1831b048cdaf36ab5dc0ff5e341e

Cheers,
Angelo



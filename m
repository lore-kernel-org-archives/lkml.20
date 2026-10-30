Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381975;
	b=fU6HyheFNv9fcF/rDnya+OGmquHRa7HkYh6CkmSjbD7IfTcQLQ1bFMQ5rlSHtYVO6Usk
	 Qi0ro/ghaVByNaSrpXdYD+TLFCNUuf/dffm05PEw8O1JmA7kyXeCKQrG2zMcc0VfGAFbv
	 B2csB5mm3WFoBQjLh73BpAZ8zBDBnkMmGOWA3iTfGhobFOGRkW6RW4CiMm9894RQOy5JH
	 2tQYdw2lfzxPnQACMKLF/rTW/9TjFy9wo4WbTr0iRlPbUUoyhOAjWQi485AsezCxxRqrQ
	 O6HEbVrLF1fx6DAh64mfe809H5rOGUDUICMfjRFM5aV3S3ltjUsCiIURbNn60Li6GiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381975;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=rZQBVRZiCks/K/9Y1345LKLpm7rARRb46p5oLx1DJf0=;
	b=1iUR3e3Q3G7IGqGvu45PIPcznzPMHquhJSP0FaUTwPbCAoNg9+Y9ohG9A5FNoUVdQ58n
	 jz+H/woplRrsnxpUWRbtu4LQorITNRqFm0voIIfFL9ab+rbfq7Ms3jcdV3SctJW+IPZLq
	 M6L+XnGJq8O6yp70CD5pHneJgk5plpphY5GwMGkuLaGFQMyST2PCEpyNWiWBRIyGR+YL9
	 fXgyKYqSJoeDecpXEEOeeSwe0fhNstI7qmwjggIl1p5HoyPu43tuQ2C+EBbK7uFfS25Jm
	 fm0JZULbg4VRO5zdEeP96f0I+62WSHseJhWwZtDYVL+kHsKfAyVJVj8NvRrCJlZ/17Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=NfR7dokS;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C07606A31A;
	Fri, 30 Oct 2026 17:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C07606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=NfR7dokS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=rZQBVRZiCks/K/9Y1345LKLpm7rARRb46p5oLx1DJf0=; b=NfR7dokScM74IPFgp+YCYVEkyH
	E17lWekv02wo93KiwQhxCLpnf3qg8nW5Zzm0O/mjE84ldTbqIpKSc/FzPcx9JMHJ4gOTLPNSpC1UJ
	nYinkqL4eROOqDYCMpqKlm+Hrcxmfp3r6iJMajWmPfOChJsDQ+OongNNwE5U+ewunv8xwTVqHy+rC
	iMHufZEkUf+CjkHd4Xz1aUPPII+HfxGfiGIs1Es7cge6Uy3+BIgL9C2NbqefLnrPQvgeLVMP+Ll0T
	rcAtYyxJ1i1PH5LcdBa+OCShdGwv9kPMP4GpzpV/WwRXkPpkvEV9luefrRzpDTteyFG4Em1QkLXwT
	6M7z9YHg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dominique Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Yakir Yang <kuankuan.y@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Conor Dooley <conor@kernel.org>, William Qiu <william.qiu@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Sandy Huang <hjc@rock-chips.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maud Spierings <maud_spierings@murena.io>,
 Graham Markall <hello@big-grey.co.uk>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Joshua Peisach <jpeisach@ubuntu.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Byron Stanoszek <gandalf@winds.org>, OOHehir <oo.hehir@gmail.com>
Subject:
 Re: [PATCH v6 01/18] drm/bridge: inno-hdmi: fix swapped HSYNC and VSYNC
 polarity
Date: Fri, 30 Oct 2026 18:38:51 +0100
Message-ID: <3007313.yaVYbkx8dN@phil>
In-Reply-To: <20261029-jh7110-clean-send-v6-1-759594e43acf@samsung.com>
References:
 <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
 <CGME20261029075353eucas1p2e700f30e833a17c676488f1427d3e565@eucas1p2.samsung.com>
 <20261029-jh7110-clean-send-v6-1-759594e43acf@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 29. Oktober 2026, 08:53:35 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Michal Wilczynski:
> v_HSYNC_POLARITY() and v_VSYNC_POLARITY() write the wrong bits: the
> hardware puts HSYNC in bit 2 and VSYNC in bit 3, the macros do the
> opposite. Most CEA modes drive both syncs with the same polarity so it
> goes unnoticed; it only shows up on modes where the two differ.
>=20
> Fixes: 412d4ae6b7a5 ("drm/rockchip: hdmi: add Innosilicon HDMI support")
> Reported-by: Maud Spierings <maud_spierings@murena.io>
> Closes: https://lore.kernel.org/all/e780ecb8-918f-4816-99c8-b69b10b25a18@=
murena.io/
> Reported-by: Byron Stanoszek <gandalf@winds.org>
> Closes: https://lore.kernel.org/all/b8b046ee-c574-3e16-6079-2fc415633dae@=
winds.org/
> Suggested-by: Dominique Belhachemi <db@domibel.de>
> Tested-by: Maud Spierings <maud_spierings@murena.io>
> Tested-by: Byron Stanoszek <gandalf@winds.org>
> Tested-by: OOHehir <oo.hehir@gmail.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>


RK3036 TRM agrees with this assesment :-)

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883402;
	b=d5Z4Fhkl2CYEp2HX7ipCP4Wrtvh/kTwzbCJItlvvfKjCT2N1Mcxq3yQ6f+yo66lMGknJ
	 YF/Bj5bIPSu4Alz+5uXOuEQnhoX70ex0q40FuORNq/PeLHbXlnPmaK/YG+1eAT7x937gC
	 hKyTDNCBoc7cKg+qOpJm3nOuPzAdaYHF56O1C8LyXXoOji+myI0jx76o8GuMP+n+tKfuM
	 FAlI80Kttdrqw+La/+RO0RBgqhZg4VDtpRKm+1ldPv3ytcRAbHoZgrPiBwPpirSCmVmle
	 LXRpQilqcA5lrqsER/3OVG+AuDL5TUUj1gREGmAPsIg1jGIP8bvotzG4eV2Qwbq+gwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883402;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=SK6M1yEyoNJDKCmPDiRQL//tqqiAKTuPZku2JKGAd/0=;
	b=vPxF70NVUs0b/tzidnv8THoG6Yb1aOd/h1637gjUokbOEQ9TeC66cUtvm4XZw/uRMX2x
	 9c5MvNqRgILNhg4YHrsVJ6R7FdU7RDR9DY5UaodrlGJun1Ds4UVRfKhA5Lvk53tKnVLex
	 MFJDXn1lcbuBk83czortOBF+G7IzyZ7DWWAd+Bv7qrjZCaTpi9TXaxAwzBkHDiixelnU+
	 5eduehEfpcCwseHhhCSLlFSxLJs6CSJI7XaSEpCNjJEg8WP7IEvqxt3Bg21xjxhjajvG9
	 cye/HNB+QOdJiJm7hQYzNKMkJvXDJ+ABMuoexxc36KtImpNuWvBPBMemsDXcFvAoZWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YcWNzHpg;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896AA606A31B;
	Thu,  5 Nov 2026 12:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 896AA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YcWNzHpg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793883399;
	bh=GPs+492SkQ6n56PuURgzlUN2tW15KC8nazsGp2krMJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YcWNzHpgN6DIBbNmSNj0a3hHz4OrUISwJrYlnEz8rYdlVTCTV30Tx8vUV3194HRc0
	 Q/CBab+ZR1vajKuDfnE/Fcs+YeeSJgRFYsPwa52diEKlvNZq0b4n8zD0WMUX/RYQxT
	 d51CUaeq33D9+6aE6SR3N/tlooeeBsvHO6ES3dCaqUJ1Keu7h3Ofx9D6KQWZdSzNq/
	 G6DqlwF7wHZ/SOBak9xlD1HVCOYQP6Wa0yJcdLJ1+7QWYyYub9RC9EcdVeRzRwQZUM
	 9SsW5J7JZ+kg/x1doCi9gtPhHlVzaOqgYswlHkixoppBiSPQ2o8ZBezIpd8dWnS9NZ
	 d2udkK0xjhS5Q==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89F0117E07F6;
	Thu, 05 Nov 2026 13:56:38 +0100 (CET)
Message-ID: <7b86ca7f-fe7f-492a-bf88-0ac7afee3963@collabora.com>
Date: Thu, 5 Nov 2026 14:56:37 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/15] drm/rockchip: vop2: Consolidate HDMI PHY PLL
 clock parent switch
To: Daniel Stone <daniel@fooishbar.org>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Daniel Stone <daniels@collabora.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <20261105-dw-hdmi-qp-yuv-v6-8-1bb63ef5766e@collabora.com>
 <CAPj87rPk=girxTziKY5ROV3ZYqGhKRz471BLWpkCjtvNNseuog@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAPj87rPk=girxTziKY5ROV3ZYqGhKRz471BLWpkCjtvNNseuog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/5/26 2:18 PM, Daniel Stone wrote:
> Hi,
> 
> On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>> +               if (pll_hdmiphy) {
>> +                       ret = clk_set_parent(vp->dclk, pll_hdmiphy);
>> +                       if (ret < 0)
>> +                               drm_warn(vop2->drm,
>> +                                        "Failed to switch DCLK to HDMI PHY PLL: %d\n",
>> +                                        ret);
>> +               }
> 
> I'm confused ... if we have switched to the PHY for dclk, then a mode
> switch wants us to come back to the CRU source, don't we need to
> reparent to dclk_src?

This is actually done in vop2_crtc_atomic_disable():

    if (vp->dclk_src)
        clk_set_parent(vp->dclk, vp->dclk_src);

Mostly to ensure the PHY related resources are released when not in use, e.g.
after unplugging the display.

Thanks,
Cristian

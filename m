Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793824693;
	b=hPEnz6BNiBKiZFLjRNKe442BxgseWFn4BT48dEVYhRTI21RXdJ7Nn1IEHOhTSrV4V6L4
	 2m0dQYR4mk8PK2lWBC+6llNyU8p+fb9DtUHhhAH/8/5gqhuMprqCQDaEvLIHHDwuum++U
	 DDu0saODfkrb8wsgZbo8/3QI7Uxi7Xsv4A0ocK34M6ZvoBZZk8V+/mYyZ+efTIEfReU1P
	 q+aO4WlFfSj34UEYmigl2/GSjl3NMJYKQtUHR8piGmlC/zX4uMXb0m2dvlh5TmeaYr7+8
	 Ks1GyxdDdJ13uqAZOd0obDF09xTmUUzbgxwEGxnzfuVYhr6PS2NQgRbn2BoKSXBFRhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793824693;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=KZ3i2ZCoB8qigK/rXEJ3PPRenrHzQG6J30zdGcU7gKs=;
	b=BtCT0D1ii/eTG2gYYAfNPHpnMfWiwm39+NFvieluCL0Nq1w/SLWRTCm/wBQtHQQTgc94
	 2fsxhEEhWTvlnBeJqOr9WKjgZTJokDXNNdoSTmTElm4LSyrgda6Wv8riBCzr3+yrbLno1
	 86U4ou4JU95lBWV89v0Fhxzgvru6gapaq7gou675L0ekeVs8303SFLXXD+TC7P4iGwKyy
	 6VfZlIgQdwuKcYqtbceUiiGKLwiG0tTsllGj3rjggeCdaa/c0mIOoj5ShyXKtzxg33tqp
	 c8ZyaOmfgkpnu2gQhUoTcNbIaa/xwEJ5Woms2Qg8E9V+0ioloshOLftXiuh4p/CYUfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Bg9GoV+Z;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C11E606B2C6;
	Wed,  4 Nov 2026 20:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C11E606B2C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Bg9GoV+Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793824691;
	bh=ZyQWW1wCUyxgX5lh8xj5l7gQjS6rGe83Ig2v6D8kRco=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bg9GoV+ZPTgROm1ZJusnJY1kYsZvbhM+sKMBFfy3xgpe4rP+DGeHre8m1lwwQAC0i
	 WWnjnjILknGW5VX4vv8B4DXAeG5DsbqPgHWBYEz9p0ffJmThorskM1KObk16V8z16t
	 utNEtiEzwKBu6NgCPhWN+5NQbbRk8cVQ0bjYK1WmQAC3GyNmbx+Lum+WEXBJl2tXNN
	 WOYjWTpf827xMUS8KxuHHsvVNJ9WWtK13OTWw1Ajg5KkbGa6c2G+vkpt64h0/rJ/Vy
	 PwrMheYZy2Jhat0yZQYrpwQcjfO6dtf0+U6sCMGE00RuMIU46p3hVaPZ5I+nVbrp1X
	 ccio0OVYj/FjA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0687B17E066C;
	Wed, 04 Nov 2026 21:38:09 +0100 (CET)
Message-ID: <c823ced3-693a-4620-8a88-81cca7062c01@collabora.com>
Date: Wed, 4 Nov 2026 22:38:09 +0200
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
Subject: Re: [PATCH v5 08/15] drm/rockchip: vop2: Avoid DCLK source switch for
 10-bit YUV422 output
To: Daniel Stone <daniel@fooishbar.org>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
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
 Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Igor Paunovic <royalnet026@gmail.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
 <20261014-dw-hdmi-qp-yuv-v5-8-6fab0fe43a9b@collabora.com>
 <CAPj87rPsh_cVQWtGEisDrXWiT+Zj6D6n5wXpmbuoFvMKtOi7TA@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAPj87rPsh_cVQWtGEisDrXWiT+Zj6D6n5wXpmbuoFvMKtOi7TA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 10/30/26 1:42 PM, Daniel Stone wrote:
> Hi,
> 
> On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>>         if (vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) {
>> -               unsigned int bpc = vcstate->output_bpc ?: 8;
>> +               /*
>> +                * YUV422 always transmits two 12-bit components per clock
>> +                * cycle, regardless of the color depth, which from a rate
>> +                * perspective is equivalent to three 8-bit RGB components.
>> +                * Force 8 bpc here so the bandwidth check reflects the actual
>> +                * TMDS rate and avoids an unnecessary DCLK source switch.
>> +                */
>> +               unsigned int bpc = vcstate->output_mode == ROCKCHIP_OUT_MODE_YUV422 ?
>> +                                       8 : (vcstate->output_bpc ?: 8);
> 
> The nested ternary is pretty violent; please write it out explicitly.
> Either way, the equivalent clock adjustment for YUV420 is handled in
> the setup_intf_mux() handler, so would it be better for YUV422 to also
> live there, rather than mashed in with bpc here?

Moving YUV422 into setup_intf_mux() wouldn't work, because that function returns
the real DCLK rate.  The YUV420 halving there is justified, but for YUV422 the
DCLK simply equals the pixel clock.

What's actually not great here is the bandwidth check, as it tries to rebuild
the TMDS rate from DCLK.

Apart from the YUV422 special handling, there's another complication: when vop2
processes multiple pixels per clock cycle, DCLK is only a fraction of the pixel
clock, e.g. RK3576 halves it for pixel clocks above 600 MHz.  This will
interfere with upcoming HDMI 2.1 support - e.g. FRL mode such as 4K@120Hz 8-bit
RGB, with a pixel clock of 1188 MHz, ends up with a 594 MHz DCLK, which slips
under the limit and wrongly selects the HDMI PHY PLL as DCLK source.

I've reworked the source switch logic to rely on the actual TMDS character rate
computed by the HDMI connector state helpers, which already accounts for the
output color format and depth.  It gives the same result as today for RGB and
YUV420, corrects the behaviour for YUV422 and upcoming FRL, and removes the bpc
handling entirely.

Thanks,
Cristian

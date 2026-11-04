Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793824896;
	b=Abkh+NaqNS0jrWlB5U93BKxoh9NvHK9en1/xZysyrsjNX6tCOGGRe7YDzTTTfu1vfVQl
	 o/JiaNKzCAX8VJhPVSlt4MLxidReyYlK8qDbhXSSkvkRSjpSLuWQn59lTbsjOLCCFtxx/
	 4l/gEx+ZIrlc1CksAA2kYx6QdRTsqzxpazW0/i9i3ZQmg1tvkCPxDV2oXJU3njfAYLH/i
	 +KyxQVnNsMB7Oj3zu/25xmBPszbBhZmGmei15sXf+wwLLoZjSgB0J2c0rqO6k+JPTYE6P
	 p2NF90o9MvHG2pIyQig/j3STAu4vrpfnnF+6X42CmA15L3bv3makwbvUYY5AlDTn+rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793824896;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=laTt9f2kh1KxkIIaLJpGIucT8RynHKwMeYwSgdrJ1mg=;
	b=Eek7RDmrUXVsQlHDANR9N8LGQk/E16Cy4/ZZ/rkf65RJ32Cl3eYB0uHTWDIl04ts+j9m
	 L6VExumCZKdo/aqwOjgFFbXiOZaIAd6k5UAHHobSEMVmOMcg6dH3lJUoBOPMTD8xUbVER
	 +AWFHQ+4fS7Vok9bYEOuTl5uJUFsicqpoFCstVupMuoNcTnkIowa5ewVV/wTmQi5ysTGl
	 JEGyNp9ftbp20+a1Ffbs3FdxWNoocqWFuKUoo2CTBVU3guQ7e8FD+M8zbsWt5AUxULemQ
	 VzJSBEXDP91qaDi0Q+fzSq4dmHDH/2qJVxczKEuuRP95D302dcyg1PNAE3N/1yNgYUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SceBkl2q;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADD06076367;
	Wed,  4 Nov 2026 20:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ADD06076367
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SceBkl2q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793824894;
	bh=PpUF5FeUDFxgLSUk2eaNhcEnE1VL1oGMMqbduOOt5aQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SceBkl2qXpx4gWkii9Brb6gEEq2A9y0Rv6SkPOO8FalvkdaMMRdHL/o7PN1FUBf7n
	 qF76GpHaaSOjf7ytYmafBWZvJPz2A7n2SNxCF90I+XoYHSbX5sbN0eOo1Mh0BQ+QVL
	 IpUrXGK2bQ+BFWA38RW7iDMyctxPsYYmIoBcjmnizuOmJcW030BlarDZOt2mi8fyh/
	 /fGDquWqBN7WaTxV6WxC3ZKS1byvVg0wsKOQk/L5U4bh25PyrO0OwJ4AJWZASwM4Oe
	 EY4KEndAT7a53bOXbpxajaQ1eevqot8zW9dCICn67QbsIb6MTADiXcrbd4lSoKyFVd
	 DI0qR1DjCIhAw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62A3117E0564;
	Wed, 04 Nov 2026 21:41:33 +0100 (CET)
Message-ID: <fdbcdbbf-08a2-4788-bb96-a911cf8c3534@collabora.com>
Date: Wed, 4 Nov 2026 22:41:33 +0200
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
Subject: Re: [PATCH v5 09/15] drm/rockchip: vop2: Consolidate HDMI PHY PLL
 clock parent switch
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
 <20261014-dw-hdmi-qp-yuv-v5-9-6fab0fe43a9b@collabora.com>
 <CAPj87rPEz=Y+dZayouddZRn2ZHSVNk9BAjBqz34PJyjDRba5=Q@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAPj87rPEz=Y+dZayouddZRn2ZHSVNk9BAjBqz34PJyjDRba5=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 1:44 PM, Daniel Stone wrote:
> Hi,
> 
> On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>> +                       if (!vp->dclk_src)
>> +                               vp->dclk_src = clk_get_parent(vp->dclk);
> 
> Why not do this at init, where we setup the rest of our clock tree?

Ack. I don't recall the reasoning for not doing this in the first place.

> The rest is:
> Reviewed-by: Daniel Stone <daniels@collabora.com>

Thanks,
Cristian

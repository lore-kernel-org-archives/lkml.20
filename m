Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541655;
	b=kU19ko26jaDEV7N2LJq8dSaI3olXMyCuY6JDZKRNiDd9Y3kZI491JxGwn5kIhelZqhBV
	 HKyBWhwcZjtIaEu64qwgwowMWfoADwGWBUJq9FIX3Hk6Y99uN1J0mWncUN6tpoiJSum3e
	 kdWvUL9WfLWKw0NsXfWYjz7nqLyX0wV7ZrVSRbc4m+gc+gMqmFjulTv3n1PFWlEmkMz8o
	 BWRUzUgVwZBhLHrwYqpVUyYRYUUVJVmxPYijsU1tFMWYB1VzIfDJ88asLWi7xFk3kV9yZ
	 +oTZq+Uj/7VYaiHLLWn0arPGXrFxIDVT8nDLfo3fOqhsVEzf0feMIfTSSy24ZDy3obQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541655;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=m3fmYBaNLptWcqbvTdAs8gd+S3McHL6fxfP2xtMRAWE=;
	b=iPKq7bm01yJMejoYNpMvBbYCzukpzKLj2WdrfsMwzUPccUP9svvUdrJghFWbRHRW/VJ0
	 C+ZjBFsF7Z2m8CuSP2UhB33zwQyggE5VJrjI7J+EK1E/6cXoCljpURh5DjAINtFe+IwMk
	 eF7OuFzWL5a8Xaj5d5MFa7X7ufz8ShHqiY/m94xSL/Oxej9d6Edpc9vG19UOUKfB0V9Wk
	 FwlBQNWvrphTIcHPCE79v+rI1Oi7rptsezWMGJoE8yoS5kS+wBZIWXCSBo8haQoTOZ0e4
	 FeCWgLIY7utNeiU5VqSmF8XbIuU83+3TLVdjlqac7rVqr+EyhJN4ecJRxP856EO+x1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=UOeTeFTk;
	arc=none smtp.remote-ip=103.209.128.119
Received: from mail-m128119.netease.com (mail-m128119.netease.com [103.209.128.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCBC606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BCBC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=UOeTeFTk
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5488ddde6;
	Fri, 13 Nov 2026 11:47:22 +0800 (GMT+08:00)
Message-ID: <d8c4201a-7fa5-4831-b2a0-7e603e443567@rock-chips.com>
Date: Fri, 13 Nov 2026 11:47:21 +0800
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
Subject: Re: [PATCH v2 6/9] drm/rockchip: vop2: Report POST_BUF_EMPTY at most
 once per frame
To: aiyengar1990@gmail.com, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Andy Yan
 <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Piotr Zalewski <pZ010001011111@proton.me>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-6-8218c1cf8ac8@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261112-vop2-fixes-v2-6-8218c1cf8ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1d30462b203a8kunm6288f08e5bde9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGBkaVhlOS0IeThgaSh8ZGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=UOeTeFTknFLncW5GEyIIqqIAPAhoP8j7fodDwPUCsy9ptksY/V+zcWtpn4NERrJDm0gn/gfDgrY41ayvsT1WRO0R0/a01ZXggzWwaDtU58ia3adLvT/HqImPAgfGtvR4S3+NAC8HvHZhqZpWt3atIytZl3XG24J1toe9Yl7aGwY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=m3fmYBaNLptWcqbvTdAs8gd+S3McHL6fxfP2xtMRAWE=;
	h=date:mime-version:subject:message-id:from;

Hi Arun,

On 11/12/2026 4:33 PM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> POST_BUF_EMPTY is raised for every line on which the post processing
> stage of a video port finds no data. The interrupt handler only
> rate-limits the error message and leaves the interrupt enabled, so an
> underflowing video port keeps the CPU in the interrupt handler 50000 to
> 300000 times per second, for as long as the configuration that causes
> the underflow stays in place (e.g. 120000 interrupts per second for
> 3840x2160@120 with two full screen layers on one AXI port).
> 
> Mask POST_BUF_EMPTY when it fires and unmask it at the next frame start.
> The frame start (FS) interrupt is enabled for that frame even when
> vblank reporting is off, and disabled again once POST_BUF_EMPTY is
> re-armed or the video port is switched off. VP_INT_EN is write-masked,
> so masking POST_BUF_EMPTY leaves FS alone; FS only needs enabling here
> while vblank reporting has it off. A new per video port lock
> serialises the interrupt enable bookkeeping between the interrupt
> handler and the vblank callbacks. The error is still reported, now at
> most once per frame and video port.
> 
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 91 ++++++++++++++++++++++++++--
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 10 +++
>   2 files changed, 97 insertions(+), 4 deletions(-)

Well. This change can indeed reduce CPU interrupt pressure when 
occasional POST_BUF_EMPTY occurs. However, we do not expect this error 
to happen during normal system operation: if POST_BUF_EMPTY shows up, it 
should be resolved by adjusting layers configurations or improving DDR 
bandwidth, rather than being masked.

On the other hand, this approach drops the per-line POST_BUF_EMPTY
information. In complex debugging scenarios we still need the per-line
error reports to locate issues, for example partial line data corruption
with AFBC on Cluster planes. Reporting only one interrupt per frame 
would hide these critical debug details.

So in my opinion, we should keep POST_BUF_EMPTY handling as it is.

Nacked-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon


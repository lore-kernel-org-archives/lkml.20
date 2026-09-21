Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20E43C1F36;
	Mon, 21 Sep 2026 10:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986003; cv=none; b=jr5ZoMI0wmNb24UA3/8A2cj2M+dHxnIuJd+WtdTFjNayCyzFUC4dzcg3npSjkgXJgNl13nUOP6vUWS47t6Hj7UT1TuXBTs/CDdU/kHCFf9HQPi6kFHYt2fPExDjLCcnWuI0hJTcF4jbU1WWRr/febouCL9FPJbnD+YqxWCmCbjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986003; c=relaxed/simple;
	bh=iS/knqCb5qCJLfWIIYfNisaIOoGLDLd7LFU6cnd1ZJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8zlP8iRs1MJ1CwjjHvH6KE36MddsXThrJHTiu1F1/FIj0ewQOneaoc2F5tMfcNe/LvdfeO+2kuzlZY977KQmEfvmBQap+p/m5u797Fbrjy3TpOESKQ2l+nEen9XCdBRB4HrIZ+Rwdaw7QOOJeRxYxvK8TYWZhq4V4o2cOHpNns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KTFBxGRP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KTFBxGRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789985998;
	bh=iS/knqCb5qCJLfWIIYfNisaIOoGLDLd7LFU6cnd1ZJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KTFBxGRPPKQOqKIZaaFL7HZLsZv+EWKe23gjJaJoRWTPJ+gdYswvz9m+xNM5qtOiU
	 fxXDrHUu3uFRo5C3XCIioO2Dgxid71zp++xl5lRoVYu/f4jkw37jOgWpw/7cEH7McY
	 zT8TVulAd4Dg8QeS0yMAYQY1SswruKkNKR3vvYrZfHoYNYoZl362he/1iLM+4aMP72
	 /J1cfQkqyEDEkYrVzcfWwvnUs/sYrvaZNTU/yZmU7p4FqLiws7t+VC//t+nNyPud4W
	 IjuSqEDwEjyaOqLrQAyLU8lc794uT6sUIJaHxtpYOswbsZn5LK2kqFX99wlVpaz2Y5
	 wBQ8QaP0OS2Tg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6666117E0104;
	Mon, 21 Sep 2026 12:19:57 +0200 (CEST)
Message-ID: <e1ee74fc-6cbe-4b72-93ba-3da830ee62f5@collabora.com>
Date: Mon, 21 Sep 2026 12:19:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add support for the mt8167 display pipeline
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260918175736.355305-1-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260918175736.355305-1-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 19:55, Luca Leonardo Scorcia wrote:
> This series adds support for (almost) all display blocks of mt8167.
> This SoC supports a DSI or DPI display and has HDMI output via a second
> DPI block wired to the HDMI phy.
> 
> All the hard work was already upstreamed in the past, now all that's left
> is some glue. In the first two patches we add support for the DPI output
> blocks. In the third one we describe all the possible combinations of the
> SoC display pipeline and in the last one we add the required nodes to the
> SoC dtsi.
> 
> The final outputs of the display pipeline in the SoC dtsi are
> intentionally left not connected to allow board dts to specify their
> own output node.
> 
> I said almost all display blocks because HDMI output is not included in
> this patch. I have it tested and working at all supported resolutions, but
> since it needs some fixes in clocks and a new phy driver, I will send it
> in a separate series.
> 
> The series has been tested on a Lenovo Smart Clock 2 (DSI), a Xiaomi Mi
> Smart Clock 2 (DSI), and a Sony Playstation Classic Mini (HDMI via DPI).
> Unfortunately I couldn't find an actual device using a DPI display, but

I don't think that it even exists with your SoC. It's fine though, because
you're anyway testing the DPI interface in one way or another.

> since DPI1-HDMI works, I feel confident saying that the clocks divisors
> are correct.

While series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Luca Leonardo Scorcia (4):
>    dt-bindings: display: mediatek: dpi: Add compatible for mt8167
>    drm/mediatek: Add support for mt8167 Digital Parallel Interface
>    soc: mediatek: mt8167-mmsys: add routes for all display paths
>    arm64: dts: mediatek: mt8167: Add DRM nodes
> 
>   .../display/mediatek/mediatek,dpi.yaml        |   1 +
>   arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 369 ++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_dpi.c            |  23 ++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
>   drivers/soc/mediatek/mt8167-mmsys.h           | 183 ++++++++-
>   5 files changed, 569 insertions(+), 9 deletions(-)
> 



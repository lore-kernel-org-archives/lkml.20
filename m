Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA344FC8D0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955673; cv=none; b=ZvtnaQ9vLgAUmRKpNl2615idrpD7cetUZDA2bmyfB8qDMVxiJUMcNWw+9kjomFzB3hUoLC3QsHYNl3iLJQ72lQK8SyT54M1mAc4LGhiMXY8qtgqsTI3Q3aflM1Rku5z6FP15R0zrb+CGTa4dnap/Jtk0MRfmWYZsFnwqn7w7eh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955673; c=relaxed/simple;
	bh=9BQBuj38BgdWrXH6eq4U/hcUK1ngD19b+0vvYWTFybM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GEbUW3FtH5K+xme/Eu9og7CQ5vun3GJ+qsupHWCnvKFE6OphvksJTqn4tlp8rEDak5UDVISpRf21CmkEjgy8xo8sSiUsoX8zuYmflBRevNJ+RDDvu5h70emiJjgnK0jPAjfduCB3GtajRP81H5/kC4N09OnoKqYBlmyo0OpdMzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qWtKsL0F; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qWtKsL0F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788955670;
	bh=9BQBuj38BgdWrXH6eq4U/hcUK1ngD19b+0vvYWTFybM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qWtKsL0FUA45YboMn0D+j7Up82RtUceDTesYdNppRsOMTe4csgne7JNe3fzIcRJ5l
	 kIJhI0s0J3tr3oPhI+Lcl97CN7tSxf9TIAOeKVE0XLyLlYnm+b5CEZDyugzqw77x/b
	 IpcABsa4Ynn5BhtNZiYpyblNP0JZ9or1O6cWO31+srQ0lLRSjadlk9ghr7zuTnXa2U
	 z4d3a3iQL97yag4sLyVqrFLEelidYnczgOnYHB/0SnbCJJbYbOsGfQpYb85MFvmWUf
	 rqVaY0UX3zxdXlGi9CrT1N+GGXFaSXaZE5JcV6oKWpVEHO11gScYHQRkJhbempS0u+
	 Xkn6jlGNJnU/w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E3AD17E092F;
	Wed, 09 Sep 2026 14:07:49 +0200 (CEST)
Message-ID: <a343f3ed-deb8-4105-82da-d652966a0c6b@collabora.com>
Date: Wed, 9 Sep 2026 14:07:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] MediaTek MT8195 HDMI PHY Fixes
To: chunfeng.yun@mediatek.com
Cc: p.zabel@pengutronix.de, chunkuang.hu@kernel.org, vkoul@kernel.org,
 neil.armstrong@linaro.org, matthias.bgg@gmail.com, granquet@baylibre.com,
 justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20260701121936.19407-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701121936.19407-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/26 14:19, AngeloGioacchino Del Regno wrote:
> This series adds two fixes for the MT8195-class HDMI PHY, found in
> MT8195, MT8188 and Genio variants.
> 
> This is fixing PLL calculation, and TMDS clock dividers, to achieve
> all of the modes requiring data rates higher than 3.4Gbps, with the
> successfully tested target being 3840x2160@60Hz.
> 
> This was tested on MT8395 MediaTek Genio 1200, Radxa NIO-12L and on
> MT8390 MediaTek Genio 700, with 3 different HDMI displays (two TVs
> and a 4k LG workstation display).
> 
> AngeloGioacchino Del Regno (2):
>    phy: mediatek: phy-mtk-hdmi-mt8195: Fix PLL calc divisor overflow
>    phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit ratio setting
> 
>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 4 ++--
>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h | 3 +++
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 

This series * performing fixes * got completely ignored.

PHY maintainers, ping.

Cheers,
Angelo

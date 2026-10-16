Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFD745199D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143134; cv=none; b=ac81+hgSW9LrBOFD4QDzs+A7jEdq/1yaw+rrrpwsZDNUm59rp1CVshOwM8cQ803WphFZ+J+M2DtdwZVkKcbDQ/e6sM7u3hSjIt9nKZEOjrOPm/f0ZsCYkD6j7iwIKZU1Wny5gj9kD+FDXOLIVtSgXbSlvlxO41T+9pkRP1JuQzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143134; c=relaxed/simple;
	bh=moPz88+BKWBqA4wI7xIuez0SP9HnxmGxxTZhvQgnrkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TRHaH3GfRbhfVcjtibq+CQZon6/68QYSVOZAl0Y1SBYv0opyNMqRZkZ/2IX6FH6yRWlw1008Tj1tzbD9B1PQ5u96aIYQFdRmoy2yog11JABnTJkult8rgH+PNu3dHgciLx8q4DaTFKIDrAGMA39kXZCBJu2Lcpr6FuUAfkMr01A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YIo6r9hx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YIo6r9hx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792143130;
	bh=moPz88+BKWBqA4wI7xIuez0SP9HnxmGxxTZhvQgnrkg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YIo6r9hxhFdJT3RrNKDuNtNzXUdaXGjT3OnP1EjcSV2F+72R81qKdDcWOI8EJMa5U
	 rNd/kVnzkOtJH+4YRo/n6AbnZOUFidnbDWMg+vvzdxxwB4I2G7bVmnRXvxMgB+01GH
	 f5Cwnd4quCNpNHy02cGSb1D6qXI+OWr/HI/rvwZcL40rTkoYBaC75L/ClppvoZwRz0
	 wgRklWA+/OVTuPvIFGHXpss+v0lw5hgqTYul/fiRM7KEAcsmLEV0hnGFafCq8aZO3B
	 bB0Zo8nztfOKGMed7xAGqY1CghsWoR5g9EmvQm1gIlqox+itGdBwksHoAqO2UUk8sM
	 lI2cRJR+MB/tA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 353B617E0411;
	Fri, 16 Oct 2026 11:32:10 +0200 (CEST)
Message-ID: <aa6ba0bc-38a7-4c24-965c-a7660c05eb3e@collabora.com>
Date: Fri, 16 Oct 2026 12:32:09 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: devm_drm_bridge_alloc() conversion and cleanup
To: Johan Jonker <jbx6244@yandex.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Huseyin BIYIK <boogiepop@gmx.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
 <179213353665.3058528.14437637653539699061.b4-ty@b4>
 <d1f0369c-ff43-4b76-9092-5c638b132f15@yandex.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <d1f0369c-ff43-4b76-9092-5c638b132f15@yandex.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Johan,

On 10/16/26 11:11 AM, Johan Jonker wrote:
> Hi,
> 
> If any decency or Code of Conduct left in the DRM group then also credit the original author.

Sadly I wasn't aware of the indicated submission - this was just an unfortunate
overlap.  My series stems from the following discussion:

https://lore.kernel.org/all/743283af-753a-40bb-96f3-d05b1e38e186@collabora.com/

Regards,
Cristian

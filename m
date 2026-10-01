Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC294A5ECC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843349; cv=none; b=KuBcwOaKWvV3QWLX3k3jlPZEEUtjqIJdaZunhbZHi0/Urju4zuRAqOr3oNUMdxA1qC/WQajuFNPAjMkHhPhWYetVv2IyYX1m8tz9C/YOMlYuBEb2/ujrk0CygkaiSGlMbxc8rPvKzjjC1WthGK0XGDRWEO/dbEf4xuoG41+uc8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843349; c=relaxed/simple;
	bh=MYocPHdp/R1mIff3vA0LCiED80K75rmILRlv0opf+iw=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=HgFaZY6CNsehYbnuyILMA5qrPr7OXR0Ro0QqYniqmnVyc4gMfTdIZSyLoCotJZRXQ8hdd6I0rDhogtNv2qtOI1zcS2U2DZItXipCwriFHg1tPe5K3YPe5/zNxdAyqr9f6szjoMBzJUfZvZWzccn1d6Nnue/+WSzgz2yy4gkg6Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4tHI92J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4tHI92J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5BA1F000FF;
	Thu,  1 Oct 2026 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843348;
	bh=yS9qbaAkLlPU9Fc9KuYA84WC0RRI4KwBqAJVX7ftcuQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=R4tHI92JvKEw/vHIct1JvsK2mQ54ppWRhnTscr6hbAmLUHyF+NWc298/5Ex/4Ilp9
	 B1wMpNd06/ARRd7DMcAP7LxxNppYh6hpfeirvmxEctAUOBkyIkYLi2qgXWYkMOs2cE
	 GFl8zgvc4d9nBOg8wNp5nUTaOLU6lCl0mtm2h7FWgcbHvd5RxYaNSvBXHYJZoAGIie
	 T0CtcFb5kXdwn73f2b72kP/hpBr/LVj+JiT1Z1W5tjG4WLh/Xau8n//UMJHpRJLQi0
	 gkWkvXseL3PK7a4nN1eyKVBYF9Jxs/QEkWBIQxKcvTBZchecE6ewL1wAB+TidYfcMl
	 fiUyg0AP8VNEw==
Message-ID: <8f9d3c610b98db28ca77b2b57175845a@kernel.org>
Date: Thu, 01 Oct 2026 08:29:05 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 2/2] drm/bridge: lontium-lt8713sx: Drop redundant bridge
 funcs assignment
In-Reply-To: <20261001-bridge-alloc-conv-v1-2-f0a1fe040a86@collabora.com>
References: <20261001-bridge-alloc-conv-v1-2-f0a1fe040a86@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "David
 Airlie" <airlied@gmail.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Thu, 1 Oct 2026 11:25:12 +0300, Cristian Ciocaltea wrote:
> The driver already allocates its private data via
> devm_drm_bridge_alloc(), which initializes the bridge funcs pointer.
> Remove the leftover manual assignment in the probe function.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

Received: from forward501d.mail.yandex.net (forward501d.mail.yandex.net [31.44.14.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0FB26C385
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.44.14.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138301; cv=none; b=tOikARH0KcGeBxs+r8Ao3Hn/XXDr9DM5wCIC641k9deK5U3CMLqnl+r1a5127a1eiEYGXJyyNHwTOWnGmzPj5ZVt3S/ENz9i5RuHPq3+9dbFNmyr5SSdhBqDXlQUAZqWw9sQTyn+Qh8eghKPxFX2+c6kRtB9P1edh3cL3Jh5mLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138301; c=relaxed/simple;
	bh=EdYuvRWUjz5JagTtDEuGHv+h9juKVwH3LgJxg0t/rEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/0SKW9UFvWIQSTY26Idvx8J1HXSo+l6y786Qj/COP6+s5MLuK1WayQBdHoOAY/MyRNWklZG0fwbM8b1auO4AxnEPTiEGPXxZsxM24p/miW2OHRUtEEebxBiiOe4Qim3LPVsVI7gOJ4DxXckfQWZTN6Y7DrYzXwh4l1qKbrinTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com; spf=pass smtp.mailfrom=yandex.com; dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b=f7qE8oi8; arc=none smtp.client-ip=31.44.14.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b="f7qE8oi8"
Received: from mail-nwsmtp-smtp-production-main-94.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-94.yp-c.yandex.net)
	by forward501d.mail.yandex.net (postfix) with ESMTPS id E1EFB8C89B;
	Fri, 16 Oct 2026 11:11:27 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net (smtp) with ESMTPSA id JBRg126jYuQ0-DVbcivsL;
	Fri, 16 Oct 2026 11:11:26 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1792138286; bh=rq6SMlQuCiakYGNieZYuyvDSsk5kerjEngv1ARm94rA=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=f7qE8oi8x9EViSgs5j3yIQIvEdvIJ7JRnJK2OPlDA+pKZsr3oe84ND5ICPhNVrLsR
	 Gocrh9iQ2tHoSPTTgG+pp+u5lkmia/cIEiCTxRuxpEXmnxgtIVn8Fv7fzI/cJuaibv
	 +LHaNQiSFiDh9RwwzXfuoF1d3dyNuw1c7b45YysQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-94; dkim=pass header.i=@yandex.com
Message-ID: <d1f0369c-ff43-4b76-9092-5c638b132f15@yandex.com>
Date: Fri, 16 Oct 2026 10:11:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: devm_drm_bridge_alloc() conversion and cleanup
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Huseyin BIYIK <boogiepop@gmx.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
 <179213353665.3058528.14437637653539699061.b4-ty@b4>
Content-Language: en-US, ar-EG
From: Johan Jonker <jbx6244@yandex.com>
In-Reply-To: <179213353665.3058528.14437637653539699061.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

If any decency or Code of Conduct left in the DRM group then also credit the original author.
Also remove driver_private.

Johan

===

[PATCH v3] drm/rockchip: rk3066_hdmi: convert to devm_drm_bridge_alloc() API
https://lore.kernel.org/linux-rockchip/20260904-drm-v3-1-5b36532a3b72@gmail.com/  

[PATCH v2] drm/rockchip: rk3066_hdmi: convert to devm_drm_bridge_alloc() API
https://lore.kernel.org/linux-rockchip/20260824-drm-v2-1-7f9273c6020b@gmail.com/

https://lore.kernel.org/linux-rockchip/dea8a038-577b-45da-bff3-703e9099b7e1@gmail.com/
[PATCH v1] drm/rockchip: rk3066_hdmi: convert to devm_drm_bridge_alloc() API

On 10/16/26 08:52, Luca Ceresoli wrote:
> 
> On Thu, 01 Oct 2026 11:25:10 +0300, Cristian Ciocaltea wrote:
>> Bridge drivers are expected to allocate their private data via
>> devm_drm_bridge_alloc(), which also initializes the embedded struct
>> drm_bridge, including its funcs pointer.  Most drivers were converted by
>> commit 9c399719cfb9 ("drm: convert many bridge drivers from
>> devm_kzalloc() to devm_drm_bridge_alloc() API"), but a couple of
>> leftovers remain.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/2] drm/rockchip: rk3066_hdmi: Convert to devm_drm_bridge_alloc() API
>       commit: 5c0cdbee4fa4a621f871d6dc825e759db08a1a4a
> [2/2] drm/bridge: lontium-lt8713sx: Drop redundant bridge funcs assignment
>       commit: 382c1e8ba409d1611cd256dccebdfa828c832bb1
> 
> Best regards,


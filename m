Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792717863;
	b=zR6TeUacsm1hz9rDosqSUKTqVRWXt9kO46xrvToH9QrcAD+dvV5j1kCy/Hrlw82Op7lG
	 mVZ6KZc/GRJXmlmWqPeNfadnH7t7MWqW4lpJj3RhmOvC9WJiGTXVziv1DeVjpvV60iukf
	 5YJ//Da/0eJdFoJt56zLihqQ8j4QOmSJewINuuSAbYno/5LMCxt4fLHUvwAikfNc82Fq3
	 zkGpkb03OKDqVEk+JCeGA9KWz7mlYJHtfeNiANxWcUd/UDgtTWUg2NGNUvoXkuLelSdB/
	 93Jb4FFIpNrOHozjub2aMYwK2855uKdEuEZKfptDhU4dxitAxnw327zVQmTlC6jM7iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792717863;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=o9iVjpbRGMBUkX1zQ4j+Bu+fth+Q4PLJuT63aIhz70s=;
	b=iXlmVH4evwtXHU0JINRYjWbstviyeZLqkuG8+PUGLe2nXSYxA6ZLKzeE9/v51LSPUBDf
	 P6yLzuNyN1KmWQh36LY3Vuq08x+I8tHbJnzcWIc2kPOvTxF4PVOw8s+QyN6YoUDu2FYaA
	 /HaShYCTZEu4lTII40FaGlPVsxsjinI7JlSqcnbb4DmbjIumluudW4HtGsETAZtsciUQz
	 db7ueI/j8NmXdCzqG95sOQ4s6ryOkUwjC7tOOXgLpMmagZR/0uBoVa5yNwf7IALxDsq/f
	 yoOlwtZcMGwgyO48pwEtmWirBNTLweCMqBS6/1dkMcI+zCQnfxa90WYH9bZDjWAu1fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=SM24z1Mt;
	arc=none smtp.remote-ip=103.209.128.241
Received: from mail-m128241.netease.com (mail-m128241.netease.com [103.209.128.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF53606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CF53606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=SM24z1Mt
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 520edd00c;
	Fri, 23 Oct 2026 09:10:50 +0800 (GMT+08:00)
Message-ID: <7338211c-d354-40a2-a6a3-624472f34611@rock-chips.com>
Date: Fri, 23 Oct 2026 09:10:32 +0800
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
Subject: Re: [PATCH 1/3] drm/rockchip: vop2: Use drm_format_info_min_pitch()
 for plane offsets
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20261022071737.508-1-kernel@airkyi.com>
 <20261022071737.508-2-kernel@airkyi.com> <2024729.6tgchFWduM@diego>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2024729.6tgchFWduM@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1664f856503a7kunm07c92d492d1190
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQh5KVh9JSUgYTE4aGR9MQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SM24z1MtDKUdbCHONbq797C3zM0OxGSPuDeKnj0a0orBg9Cnt0r723J3KgLwR9jM7icBaxNI+5FRwFvW7p9XeKJeYyqd8I32L941XvKrOePmyVnulomxv7KudfHyBSKxaPnEYOZVmM++xGXQQ7tLzfTnoEyqEag7Pu7JjpjPRkM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=o9iVjpbRGMBUkX1zQ4j+Bu+fth+Q4PLJuT63aIhz70s=;
	h=date:mime-version:subject:message-id:from;

Hi Heiko,

On 10/22/2026 8:59 PM, Heiko Stübner wrote:
> Hi Chaoyi,
> 
> Am Donnerstag, 22. Oktober 2026, 09:17:35 Mitteleuropäische Sommerzeit schrieb Chaoyi Chen:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Use the block aware helper instead of cpp[], the latter aliases
>> char_per_block and is wrong for packed 10-bit formats like NV15,
>> NV20 and NV30.
>>
>> Tested with modetest[0]:
>>
>> ```
>> 	modetest -s 86:3840x2160 -P \
>> 	59@83:3940x2160~96,0,3840,2160+0+0@NV20 -a
>> ```
>>
>> fb size (3940x2160), src at (96, 0) with size (3840x2160),
>> dst at (0, 0) with size (3840x2160)
>>
>> [0]: https://github.com/windowsair/libdrm/tree/src-pos-support
>>
>> Assisted-by: LLM
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 4cce3e336f5b..480aa8c8a8d2 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -1290,7 +1290,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
>>  
>>  	afbc_en = drm_is_afbc(fb->modifier);
>>  
>> -	offset = (src->x1 >> 16) * fb->format->cpp[0];
>> +	offset = drm_format_info_min_pitch(fb->format, 0, src->x1 >> 16);
>>  
>>  	/*
>>  	 * AFBC HDR_PTR must set to the zero offset of the framebuffer.
>> @@ -1309,6 +1309,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
>>  		int hsub = fb->format->hsub;
>>  		int vsub = fb->format->vsub;
>>  
>> +		offset = drm_format_info_min_pitch(fb->format, 1, src->x1 >> 16) / hsub;
>>  		offset = (src->x1 >> 16) * fb->format->cpp[1] / hsub;
> 
> missing removal of the replaced line?
> 

Oh, it is. Will fix in v2.

> 
> Heiko
> 
>>  		offset += (src->y1 >> 16) * fb->pitches[1] / vsub;
>>  
>>
> 

-- 
Best, 
Chaoyi


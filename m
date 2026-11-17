Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886900;
	b=z86j+9yl9k5kCTRhwxdLhDxx4Op0hoaQgjDfB+OvzcgxgF85F6bvw8HmWSGOSBx+Ln8J
	 oMq7S+OhtHq5erC8kdDz7BzIj5NdOixdbKwDD5ICVUpFVbSHzUw3N+w27YeEgmkzp9Oav
	 yN4/5hsdMIrASa4luX6SBHaL6IkiIT5JGsTcfSoXPhxJuqPFqSqQxrCVWgl8Ci6ohol8Q
	 +aUzgfzNUZ/n5ZYyy7dyVVtu3ZrdGSjJutJRnsEWUIaQEm+0qH/3OkkqqoHgSB8PL1+ZD
	 DJHS3Dj1C+wjnU4/tMO1+VCSGnnAuqcNQaQQqZoDeifjMxdIK62hMkZm5gqQhRUm+XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=k7CFaIYn1dfrHupuH6Y5CyqJe0ZNCdr90nwRUvOqNf4=;
	b=DD93Weu6vVSsWSLkb/wKJ7UIqBQPvzMtNOWc+SqKVZrRVz4akuqH144dPzrziTj5ItVo
	 zLh9fsWMihiANOsbcLjO6y+W5DOM31CubWN8x7Kof2ITPg66O7wmA7CPVmG6Kp/nP7nYZ
	 dlRaDka64gkAzNolhAs4m12xhqu0GDQC/yg2XMJzonyIpS/EbRkghXLAEYcxZnaSY5Lny
	 p2ihlIgUX9HZ6pMRCL3Qoc5/+H/jOHmRQyY/GnW9MSAlMHGotGKxxO9pGqzvGtnZg+LU8
	 05qO5X0q+T8QzfejTV4ewjyjwZsO3PA7hwbWcYh1n6sOjWe7bjaT4HvAyNRn1rz27hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdEUwdiN;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCC2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BCC2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdEUwdiN
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5363c8de563so53547731cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794886899; x=1795491699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7CFaIYn1dfrHupuH6Y5CyqJe0ZNCdr90nwRUvOqNf4=;
        b=HdEUwdiNxYZc55yheChwckSLrfco9NqjfcKs/Ci6JbuAx2f/2IiIMMXGhQo8fsLQ4J
         fAgawNA9kAHn1oklTT9KiMF8gsiJz5SyWGvsRd/DvfdtlD9j1Es56l6drl2fVfkRDz9u
         zzS1SplmsLgtnQ5Jc3yQeygLgBC0FVXcIJIhe65iPqImpvlzuRrktaBgXhe1wgD/nGSq
         W2giXf1/ezAGz/ikKoPaAPh8ZJNEMgB503vNFYZTUSFwEv9JWyzXISI2yi2IGnsOV0wU
         jyBiSvb0i8pFkAso7mnccqncWUNgqiQeOtwZ3ejQxMKqlb+yWRmgfQN+uzOPdOOSoMnH
         K7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794886899; x=1795491699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7CFaIYn1dfrHupuH6Y5CyqJe0ZNCdr90nwRUvOqNf4=;
        b=yXB5Yc3RB7kO9fOR8iBOEtB1z4kZtdRQbJYiLeBm/Rj29Vfe/OgiXi1vfIg4IqZ2QL
         T3kmxx2UyAt6F6h4HDCTRWOx7Mew5TBsXa8SxdDawycEN4P6DyScuZnQKq5RpXzPV6pJ
         OsTKuR30OmVj96/T4i33nRku54+v89zSDQqu5A69UkAnrUnhiPQXVpqkvwdmxNTp5wTb
         6hFTb6KUrA+zGcYy/GfmFsnw1ZQNsB2ZNHkImTH233kiHtGWyRCQe5G2rRbWuArVGH8u
         dZ01f7NS5oS5p+T2fPQQlvYlll7OBVN1E/e64sI3lLEbRdRBwaXx4PU+fVWmnZjSh455
         NvzQ==
X-Forwarded-Encrypted: i=1; AL+hErH8wO7YMhRfIdyeFWXyUzDzt/me+8Hix/a8+2Q01LPz3Mg0HmP4Mg83V4ZWvSyNB79na+sJR/WNo1dc8o4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DqE5aXwq4StQv3WkIKkD5kBvRdFWYoMx1iUSmMXFtDtQGLx21
	Sqb4H9T9jBjBMXIn1sxZvVLnio8s7kFoYpz1v1jwGBpVbm9aM7izGT+T
X-Gm-Gg: AYBFou38Y1MpxtaJ6G9vcX/dmAsdGKv5DY7cp6wYLo+Q4/Qgek3VJ2H7u5990acvLO+
	dumeIryIoFFg+AdMDxsU7l9Khi+THMhBZxe6UAfYGSaQ2JmtPFPqkRab034Z7nUnh5DJ3vJJjEp
	fbSRG+bd2KNixHfqAKkx7noj64mgMtgY1qHyE4y2svfDxA52ybakZcMA9uZ8wJj4quu4z8YPVl2
	KCeg43EbgYd3L+8RwZAlO5wVAHrFWxZYuhnxxY/6YliGEujrZ+bghClyHvzeBJwzKi1A8e2bTXD
	jw3auZzK9iTB7hClMkhkz7ZzGX/p1F0qBkypAVzsCtEuCYxwIKuAHLrejazzYmqwpzNxgmoAGFd
	t3O3zSiHeSJ8Q9JXnw+6MDtHK6r7mNYuNRj4T+mTs+WvoGQhoLZsN4U6Wzcx+jZJw0IPALfseOv
	r8X2yUVN+jlgFCAEZir+lpArurSwjumVk57Hlk8vZV0j8ubA5VnVBqHhcAfXogkzyELNIxo59E9
	hWllINsnnhoF1NwlwJB/lJhhIjdYeFHPR4thLvx+vRhSva12JyjIQh36UnPcMg2WDd8NxUiIA5m
	sz5VuRpaMGReX6Cqkkb0L29Y+qMXZwVIM0GhxnU/pb26Z7hdzSzdYW0XXh1wULsQVLxRJmcciV9
	TmHzuQYQ4jOejCLCsFpkWA5+zbmTJ8+195fKzBjnmr58RcrG6t1pk
X-Received: by 2002:a05:620a:880e:b0:93f:6375:aaa0 with SMTP id af79cd13be357-9494bccfa89mr1896919885a.80.1794886899150;
        Mon, 16 Nov 2026 19:41:39 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c86c946sm1003870985a.25.2026.11.16.19.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 19:41:38 -0800 (PST)
Message-ID: <5e8d0a68-5c88-4a31-9c9c-47966093a273@gmail.com>
Date: Mon, 16 Nov 2026 22:41:37 -0500
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
Subject: Re: [PATCH v2] drm/panel-edp: disable the backlight at probe
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Doug Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Linus Walleij <linusw@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dale Whinham <daleyo@gmail.com>, linux-arm-msm@vger.kernel.org,
 aarch64-laptops@lists.linaro.org
References: <20261026-sp11-bl-upstream-1-v2-1-efc84396adf1@gmail.com>
 <CAD=FV=U2sZaobJMHCimqB5Kw0fZ_-7=9tHAxT-KrSP8uQiY-vw@mail.gmail.com>
 <49e9a6d2-8665-4e78-ac17-da5a55abf065@linaro.org>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <49e9a6d2-8665-4e78-ac17-da5a55abf065@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Neil,

On 11/2/26 8:15 AM, Neil Armstrong wrote:
> On 10/30/26 02:40, Doug Anderson wrote:
>> Hi,
>>
>> On Mon, Oct 26, 2026 at 6:14 PM Haipeng Lin via B4 Relay
>> <devnull+jimmie.lin.gmail.com@kernel.org> wrote:
>>>
>>> From: Haipeng Lin <jimmie.lin@gmail.com>
>>>
>>> pwm-backlight can preserve the enabled state left by firmware to
>>> support a seamless display handoff. However, panel-edp does not support
>>> such a handoff. When probing a generic eDP panel, it powers the panel
>>> on to read its EDID. If display pipeline binding takes longer than the
>>> runtime-PM autosuspend delay, the panel is then powered off while the
>>> backlight remains enabled.
> 
> So we don't support handoff _now_ but we may certainly support it someday.
[...]> 
> I lack some knowledge, but when the display pipeline is probed
> who's in charge of disabling the backlight when suspending ?

My understanding of the lifecycle is that once the display pipeline is
bound, and the first modeset is done, the DRM panel core via the panel
bridge is in charge of the backlight:

Enable:
panel_bridge_atomic_pre_enable() -> drm_panel_prepare() ->
 pm_runtime_get_sync() (panel power on)
panel_bridge_atomic_enable()     -> drm_panel_enable()  ->
 backlight_enable()

Disable/suspend:
panel_bridge_atomic_disable()    -> drm_panel_disable() ->
 backlight_disable()
panel_bridge_atomic_post_disable() -> drm_panel_unprepare() ->
 pm_runtime_put_sync_suspend() (.. power off)

So normally (e.g., DPMS off) drm_panel_disable() always disables the
backlight before drm_panel_unprepare() cuts the panel power.

The gap happens at boot before the first modeset:
1. pwm-backlight probes and preserves the enabled state from firmware
   (BL_EN high) while drm_panel starts with panel->{enabled,prepared} =
   false.
2. generic_edp_panel_probe() calls pm_runtime_get_sync() and
   pm_runtime_put_autosuspend() directly to read the EDID outside of
   drm_panel_prepare/unprepare()
3. If the display pipeline takes >1s to bind, runtime PM autosuspends
   the panel (which calls panel_edp_suspend() and cuts panel VDD)
   but drm_panel_disable() never runs because the panel was never
   enabled via DRM.
The backlight is then left on with the panel power off, which breaks
power sequencing on any panel but on the Surface Pro 11 LCD it leaves
the backlight controller stuck. At first modeset BL_EN is never toggled
because pwm-backlight thinks it is already enabled.

> 
> Why don't we handle the backlight state in the PM ops ?
> 
> Neil

Since panel-edp's runtime PM ops tracks prepare/unprepare state 
(panel power) rather than enable/disable (backlight), by disabling the
backlight at panel_edp_probe() we sync the initial backlight state with
panel->enabled = false until panel-edp supports seamless handoff.

As Doug mentioned, v1 did backlight_disable in panel_edp_suspend() but
Doug suggested that disabling it at probe could be a one-time work-
around to handle the bootloader handoff.

I hope this addresses your concern, happy to try other approaches.

Thanks,
Haipeng



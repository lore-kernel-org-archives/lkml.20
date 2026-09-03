Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA113DD500
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788468314; cv=none; b=WaVm3ZjwfKZexBUqf9CyAFhwcYFRnNseZ0d8wq1YnB6iPf7WxdOrsFrcMBp+LEU0oVbofTDTqA7mjXVbHz/jj2tjmaXeksnzdbmVbpEczpNf9X2FOdA9QxapDxlu7LVh4IkwaFL3b1d4MsLXpTvr+SGn+AL/OLGLFt2EJzsItx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788468314; c=relaxed/simple;
	bh=qR60VCsR54+uWQfDnhQt5HIrd0M/lW7Z81B8pO6hQv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9N90YEw9v2DX8L+xtxMHSJHw02abhiyFkm8j90i5mfGrAaNnsncRtrcYINlYvVmr/KyK/oN2w/qugPVPFDCbfMUs6c22vCk57GasCp0+N/F5bV9OcgJe7bjwRw7kWC6wEyDSCmfSUxBUzC6ts9YhdTW0pmsK5JNQxKNNvazrmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aozCI7kb; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aozCI7kb"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a5d42684d7so23544a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788468300; x=1789073100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3guYpEVe0jojtjWvcu73KPb7DZ8REKqlzshck7w5p0=;
        b=aozCI7kbuBVcmP2zvmx7F92XRBC+RqrBYfYx6LT1t59rySbvoQExUQmzs+pZxTtlDK
         CsY1fkHuTr9U03Ak0orLW/tzqcp4yfHFpB2G7ADQBm/Tmf7v9ZexhT7rW8MlnE0HXBqm
         xDdZ2hx2ENXYl49pzHLRr8EQ68rcf4hsuUx86+aMRJoedfbijvfOiVmw/onhkrsMSKuG
         e75u+m2qEuibUv6lyrfOdxTRDj9gDTj2B7crVdRZHf1HDkDpsENQawaP6At2kAtlFinp
         2Fe/YRzXwUGIMHvexL352vI3kWk4VHsCPIRO3w1HAzpzBDjIXQg7U8ikepPaOuv0Zcjb
         Tqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788468300; x=1789073100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X3guYpEVe0jojtjWvcu73KPb7DZ8REKqlzshck7w5p0=;
        b=SNgXSu8FJNfiDw0krIZw6KhJKY5rPondeFEMmXenYI/pIc10KJefqd5BRyQU96eXEH
         ELwoE2wUlDKyKiB+nDWf5zN4RFEO7U76yjIK1hzzvFAcVCHeJDZtzqxUMonE02PQcUyX
         +mJXiBwKlx0S1hvXpAy9MYC7XOy6lfZ0ZDjj/joA79W8xpoWvKvsxse+GMIcGhgAPWMJ
         esIWzzBbwPPmpF0wRBEFdKgZtEKuBxVuwWlsH1Zf9hmRLB5lOypKYF6zI098Wzvgacrn
         eB7uHUXSJNJMgjLvCcY/qzn9ae+2c00ioYD6a3kXAMexdTtas+agG4r0/gzvhkeII7Iu
         GrbQ==
X-Forwarded-Encrypted: i=1; AKwUvBy++Cl6NopxgzjZSnipq54mFlB0EIz/xHyCCKboX7Tvy6/Bxmh9ZuDc95VqHwbdhV/qAXU9JR4ykf0+ofw=@vger.kernel.org
X-Gm-Message-State: AFuF++mW72/WuSMkqApYaR1Znij31RtdQMN/SNTTDItGMaPluzsPCa/w
	agkmOhCm9DTEqTdj8E5V9ZcjdVQJceYLovaiP/4ehYh6Df6Y88k1uO6n
X-Gm-Gg: AYBFou01T9+R0w58dXMimlhJAU7UDbkHsg9R0AYvWQ5/WJRfZG9rLZHXNOKdaNOaxyO
	fbNqiGVesn9CRmzOxGw+V5Dk5z2S8vNmKPfmEMWc/ljxs+dBsC3EJtEOBNoBTp50ljYRWjE2KUo
	d2BtqxLcaNq/HN6NWBAdceL819Gbxt0/7UK13z62HhKP4SBIMDERZU2BLd2BW9MJksReRVSVbxM
	GUr5qPIQ2kb/sqTe1YWL+eLbFD78jOE2dT/mj+CyvCcdc0NeHsoXJOFNE9wJvjGUxCj9WiDttqz
	4/r83ptEkTeGGXvPZHtgD0/QEa0ZosUGY9M1iJgpTSz44c6AMHrZAIt5/COzXhRV51kUN80floS
	k0PYKmhogjuoI0eA9Nn7anT2WSvurL5WWq1xwrOnwam7oQ1UM6lBSszMSEn8p0ZdBLe75wNdibJ
	4tKYacM9q5M85XBJJIriuZzD+aHywl+0XqFa2jLxgXCahdNtt8uYaNrhw3w6iyxdHXXokulSP4G
	6/ujaaLykTdyAxHoO1bq4x1x3AmcqMKsTksaw==
X-Received: by 2002:a05:6402:1d48:b0:6a0:d411:930d with SMTP id 4fb4d7f45d1cf-6a7e8d9b328mr180296a12.2.1788468300064;
        Thu, 03 Sep 2026 13:45:00 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:0:32d0:42ff:fe10:6983? ([2a02:a449:4071:0:32d0:42ff:fe10:6983])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6a1dsm233448a12.7.2026.09.03.13.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:44:59 -0700 (PDT)
Message-ID: <afde7cfa-bd1e-40d2-9315-d3d88abb7606@gmail.com>
Date: Thu, 3 Sep 2026 22:44:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/rockchip: rk3066_hdmi: convert to
 devm_drm_bridge_alloc() API
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?H=C3=BCseyin_BIYIK?= <boogiepop@gmx.com>
References: <20260824-drm-v2-1-7f9273c6020b@gmail.com>
 <2814844.6tgchFWduM@diego>
Content-Language: en-US, ar-EG
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <2814844.6tgchFWduM@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9/3/26 17:12, Heiko Stübner wrote:
> Am Montag, 24. August 2026, 12:21:19 Mitteleuropäische Sommerzeit schrieb Johan Jonker via B4 Relay:
>> From: Hüseyin BIYIK <boogiepop@gmx.com>
>>
>> The function devm_drm_bridge_alloc() is the new API for allocating DRM bridges.
>> This conversion was missed during the initial conversion of all bridges to
>> the new API.
>>
>> Signed-off-by: Hüseyin BIYIK <boogiepop@gmx.com>
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>> ---
>>  drivers/gpu/drm/rockchip/rk3066_hdmi.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
>> index f28d6a883e09..39c65ee07caa 100644
>> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
>> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
>> @@ -703,7 +703,6 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
>>  			 DRM_MODE_ENCODER_TMDS, NULL);
>>  

>>  	hdmi->bridge.driver_private = hdmi;

Can this be removed?
See link/comment below.


>> -	hdmi->bridge.funcs = &rk3066_hdmi_bridge_funcs;
>>  	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
>>  			   DRM_BRIDGE_OP_EDID |
>>  			   DRM_BRIDGE_OP_HDMI |
>> @@ -747,9 +746,10 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
>>  	int irq;
>>  	int ret;
>>  
>> -	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
>> -	if (!hdmi)
>> -		return -ENOMEM;
>> +	hdmi = devm_drm_bridge_alloc(dev, struct rk3066_hdmi, bridge,
>> +				     &rk3066_hdmi_bridge_funcs);
>> +	if (IS_ERR(hdmi))
>> +		return PTR_ERR(hdmi);
> 

> If I'm reading things correctly, the parts in rk3066_hdmi_register setting
> hdmi->bridge.driver_private (should use the container field of struct
> drm_bridge instead) 

The driver_private line was added with this patch:

[PATCH] drm/rockchip: rk3066_hdmi: switch to drm bridge
https://lore.kernel.org/all/20250428102309.1501986-1-andyshrk@163.com/

and hdmi->bridge.funcs are redundant by this change?

Not redundant, just funcs are attached in a common function __devm_drm_bridge_alloc()

https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/drm_bridge.c#L383

void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
			      const struct drm_bridge_funcs *funcs)
{
	void *container;
	struct drm_bridge *bridge;
	int err;

	if (!funcs) {
		dev_warn(dev, "Missing funcs pointer\n");
		return ERR_PTR(-EINVAL);
	}

	container = kzalloc(size, GFP_KERNEL);
	if (!container)
		return ERR_PTR(-ENOMEM);

	bridge = container + offset;
	INIT_LIST_HEAD(&bridge->list);
	bridge->container = container;
	bridge->funcs = funcs;
	kref_init(&bridge->refcount);

	err = devm_add_action_or_reset(dev, drm_bridge_put_void, bridge);
	if (err)
		return ERR_PTR(err);

	return container;
}
EXPORT_SYMBOL(__devm_drm_bridge_alloc);

===========

Other example from sti:

https://lore.kernel.org/all/ce9c6aa3-5372-468f-a4bf-5a261259e459@samsung.com/

>>>> It looks like you don't set bridge->driver_private anymore. Is it on purpose?
>>> This looks correct to me. In current code, driver_private is used to
>>> hold a pointer to the driver private struct (struct
>>> analogix_dp_device). With devm_drm_bridge_alloc() container_of() is now
>>> enough, no pointer is needed. With the patch applied, driver_private
>>> becomes unused.
>> Then we should remove it from the structure if it's unused.


drm/sti: hdmi: convert to devm_drm_bridge_alloc() API
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ac4531424d907f3983e919a7bda2b90ea0cede4f

============

This serie was missing a few bridges too many.

drm: convert all bridges to devm_drm_bridge_alloc()
https://patchwork.freedesktop.org/series/148229/

====

Please advise what changes are needed?
RK3066_hdmi is broken since somewhere 2025-05.

Johan


> 
> 
> Heiko
> 
> 
> 
>>  
>>  	hdmi->dev = dev;
>>  	hdmi->drm_dev = drm;
>>
>> ---
>> base-commit: 2709dd5ae32f0828f386327c76bba9f39f63a1c6
>> change-id: 20260824-drm-e4689f65ab8c
>>
>> Best regards,
>>
> 
> 
> 
> 


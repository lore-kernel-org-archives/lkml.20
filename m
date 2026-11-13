Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532550;
	b=ktN25VNnpejrM4t2rfA3Dj6GSrPVRZZOMxjSDeFh2sopployZ0UkN3cr6iOxJtf4MErp
	 bdJe3cGHOkHySFVOY+UBmB3t0LqBvcTM1n4sjjAsNUCrRjG6SP8cYVcTuRaqkiwtDNVKz
	 DfVmFS3rIWYLWJKftlOH1CL7ma/VhA6J1vCRATBybFnen+rpKehar8EKb4coPCPKXdm/a
	 KvTAlTCNkcbag7zW/cWBClRvuuPI/hiNuLy0hcze2MeJU5ZMVnAeXWykYewyzjvNyBHpF
	 y/zwqNxStptcU6EwlioMfzDAi0IBi+Gq66vokUH1bN0vfnir61OACp7jfoQ4zopwqDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532550;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=9cu9IwiuATsWuuheJo3Q86aMZzHyohT9TpnVIAb0zIU=;
	b=nP/PnEO32EnQ5CO3cYV81KC4WWtJWk1G40k3zdf21g/A2J/S4HRVfcG41K9UsUPU8u6+
	 ejk4Z+gVAqg2T4IkXv0hqjH5sqsPhjudpEH1zdJI7ryIiFLTvrkOUU7/tkgcySEFnsTSU
	 4oCGT6wW6VuAESWO0vf3Hvi59r121gEx4eeaMmxukcYT/aI5W0S4ta7yqE9UbbbpPWRCz
	 VA1Ta5CS73cmNdpwtIkuEveKW4CZWlq6qMhnynzgfJ2POcr+OS0qhgVzhAuykP5Lm5Mzf
	 J01qRTuxwzMOICq91h5/q4JYL0UsuS3yDi1qT9w76pjuN3LyZA9WyoOo2U/wVNqfjSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="jvZOX/3D";
	arc=none smtp.remote-ip=103.209.128.52
Received: from mail-m12852.netease.com (mail-m12852.netease.com [103.209.128.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB272606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB272606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=jvZOX/3D
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54833a7f1;
	Fri, 13 Nov 2026 09:15:37 +0800 (GMT+08:00)
Message-ID: <385a67f0-e5cd-4dba-9b9c-5b766462c6c0@rock-chips.com>
Date: Fri, 13 Nov 2026 09:15:36 +0800
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
Subject: Re: [PATCH v3] drm/bridge: analogix_dp: use devm_phy_optional_get()
 for the DP PHY
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jun Yan <jerrysteve1101@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20261110023721.2014061-1-jerrysteve1101@gmail.com>
 <DMTCFJVH99S4.27AWO8PN3ZPK7@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DMTCFJVH99S4.27AWO8PN3ZPK7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1d27973cf03a8kunmd978f5f73efad
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTE8dVklCGUsdHUlOHxpMSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=jvZOX/3D/bNlgPloRPtSZPL08WTVzeWxnVwbDnGy8297Sz/6soz2u/dTFqW4w+a41XTqz6uLGOZ9RLT5PHX3rMqY8t3BrnpMI8kS16+hZE1blf2Q+umzxuCX2+s7f5zl7H+iAH+TKYFTwJAG/fnDL0/c44ttKN2KyhDsV7sbEgc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=9cu9IwiuATsWuuheJo3Q86aMZzHyohT9TpnVIAb0zIU=;
	h=date:mime-version:subject:message-id:from;

On 11/12/2026 11:39 PM, Luca Ceresoli wrote:
> Hello,
> 
> On Tue Nov 10, 2026 at 3:37 AM CET, Jun Yan wrote:
>> The DP PHY is optional: the Rockchip RK3399 eDP controller (used as the
>> internal eDP port) has no separate PHY device and relies on its built-in
>> PHY, which is programmed directly through the GRF registers, so its DT
>> node carries no "phys"/"phy-names" property.
>>
>> Requesting the PHY with devm_phy_get() therefore returns -ENODEV (or
>> -ENOSYS when CONFIG_GENERIC_PHY is disabled) and the driver logs a
>> misleading "no DP phy configured" error at probe time before falling back
>> to a NULL phy.
>>
>> Use devm_phy_optional_get() instead, which returns NULL when the PHY is
>> absent and otherwise behaves identically, and drop the manual -ENODEV/
>> -ENOSYS handling. This also removes the spurious error message.
>>
>> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
>> Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>> Changes in v3:
>>    - Add missing changelog entries and reference links
>>    - Link to v2: https://lore.kernel.org/dri-devel/20261013134659.335829-1-jerrysteve1101@gmail.com/
>>
>> Changes in v2:
>>    - Added comments to explain the changes made.
>>    - Link to v1: https://lore.kernel.org/dri-devel/20260924020417.868588-1-jerrysteve1101@gmail.com/
>>
>>   .../drm/bridge/analogix/analogix_dp_core.c    | 22 ++++++-------------
>>   1 file changed, 7 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 6df6963740d2..637b1bff0f6c 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1426,21 +1426,13 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>>   	if (ret)
>>   		return ERR_PTR(ret);
>>
>> -	dp->phy = devm_phy_get(dp->dev, "dp");
>> -	if (IS_ERR(dp->phy)) {
>> -		dev_err(dp->dev, "no DP phy configured\n");
>> -		ret = PTR_ERR(dp->phy);
>> -		if (ret) {
>> -			/*
>> -			 * phy itself is not enabled, so we can move forward
>> -			 * assigning NULL to phy pointer.
>> -			 */
>> -			if (ret == -ENOSYS || ret == -ENODEV)
>> -				dp->phy = NULL;
>> -			else
>> -				return ERR_PTR(ret);
>> -		}
>> -	}
>> +	/*
>> +	 * RK3288/RK3399 use Analogix DP controller built-in PHY,
>> +	 * no extra PHY configuration is required.
>> +	 */
>> +	dp->phy = devm_phy_optional_get(dp->dev, "dp");
>> +	if (IS_ERR(dp->phy))
>> +		return ERR_CAST(dp->phy);
> 
> The original code ignbores -ENOSYS, devm_phy_optional_get() does not. So,
> either -ENOSYS was just impossible, or this patch potentially changes the
> behaviour.
> 
> Can you elaborate on that?
> 
> 

You are right, this is really a valid concern.

If CONFIG_GENERIC_PHY is disabled, the old code could still proceed and 
keep the driver probing, while the new version would return an error 
directly.

It should be better to keep the -ENOSYS handling to preserve the 
original behavior.

Best regards,
Damon


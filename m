Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377984;
	b=uD89BVNlXTWC3mPVqoabpfI1EqnuHWeMuQs1n4VTALPaA17H7LkQOT6cq2OTEV/3hmy7
	 Hp2Us/CSX8Gan87BMM5/m0GMMgTGBSXVg/3W/nC9DjNZUHjAMwkM40gQyoY4NcyCxe49P
	 U7CxXh8yK0OlCwkDAxe48o3TNKIvKBlq3/znaYyqwFEvaVshlu5mh0+FR5zzAV/Gh0w3Y
	 zzqOQIYI8MCXMSKlqE81NPjJ6JeUYszOprds3azuEtaDhH2QOqtHoVvu5UjObl+BE0Yan
	 uYYnB8mFtYKTFcuSKYqc7R7B3BnOx7AeGwrj3yB2BG0NmzKA6mWM54txBFBlaFEBFCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377984;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=XS5mBLwVG/2WkI+k9TR/yW0nuz+R1AOPXfUeB4VXSF8=;
	b=4ebRzvdbCbD05oln0K2uGl8WnHyU8U34UGRMySva6fD9BqfNL5Dxanra4050S1LY4OEP
	 86EIiHZ80z3efOnRhmgFb72Z6C6MwDUSGVnu9irMWikGmULH8Kk/ZEi2aMEF1R2smqgP8
	 I2Y2I9KUH0KnpsT3uxNbpWgVl42Jc+bxTjgyIDJ0Vj8dYJvDoB2avDgzKFTipdrI22xdi
	 Og9rkWb6mhCI92GsIme1Kk0gb0fD+4bvhDhj54g8zgYdfo/yYFEE29rWdOqH8gxkEBL7O
	 BUuvFFwuBqlxUA8ESq7O3UxGx7EKC9LfLKeNsM+8aFlbUUzVYt6H/OalkYTdx1BO2rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=NlIsZpPS;
	arc=none smtp.remote-ip=210.79.60.41
Received: from mail-m6041.netease.com (mail-m6041.netease.com [210.79.60.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0376606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0376606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=NlIsZpPS
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5443da424;
	Wed, 11 Nov 2026 14:19:30 +0800 (GMT+08:00)
Message-ID: <704571ba-af39-441f-9eb9-09d4a2c9feb3@rock-chips.com>
Date: Wed, 11 Nov 2026 14:19:24 +0800
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
Subject: Re: [PATCH v4 6/7] drm/rockchip: dw_hdmi_qp: Set the VOP2 color space
 from the connector
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 =?UTF-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018143135.5745-1-jan.claussen10@web.de>
 <20261018143135.5745-7-jan.claussen10@web.de>
 <cd6ff4c0-cd5d-4c42-8f52-5f3893aec015@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <cd6ff4c0-cd5d-4c42-8f52-5f3893aec015@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1c942f20b03a7kunmef3b884a81d8c9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQktPVk1PTE1JTR9CHhgaSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NlIsZpPS+ZAgSnMCOJyZ/fhpuRI6ICncfbRAEYIDCGzmKhhHkjrPZUwly1aNVM2tLOM+CozijxecNUuQP1FmSvpAvviyK2jnpcm+Exwdf80ojPZnAg2ay8vUMcLN6QrckT7XLVHk8hkiv+PvBvU1iF2v6nFTo0nvxrQ0B2obmnY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=XS5mBLwVG/2WkI+k9TR/yW0nuz+R1AOPXfUeB4VXSF8=;
	h=date:mime-version:subject:message-id:from;

Hi Cristian and Jan,

On 11/11/2026 3:05 AM, Cristian Ciocaltea wrote:
> Hi Jan,
> 
> On 10/18/26 5:31 PM, Jan Claußen wrote:
>> VOP2 converts RGB to YCbCr using the matrix selected by the CRTC
>> state's color_space, but the HDMI encoder never sets it, so VOP2
>> always converts with BT.709. Once the colorspace property can
>> signal BT.2020 colorimetry to the sink, a YCbCr output would be
>> encoded with BT.709 and decoded with BT.2020.
>>
>> Derive color_space from the connector colorspace before the early
>> return, so that a colorspace change alone is applied.
>>
>> Signed-off-by: Jan Claußen <jan.claussen10@web.de>
>> ---
>>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> index 9c4cf68d79d5..10c5b6d6406e 100644
>> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/phy/phy.h>
>>  #include <linux/phy/phy-hdmi.h>
>>  #include <linux/regmap.h>
>> +#include <linux/videodev2.h>
>>  #include <linux/workqueue.h>
>>  
>>  #include <drm/bridge/dw_hdmi_qp.h>
>> @@ -187,6 +188,19 @@ static int dw_hdmi_qp_rockchip_get_vop_format(struct drm_encoder *encoder,
>>  	return bstate->output_bus_cfg.format;
>>  }
>>  
>> +static u32
>> +dw_hdmi_qp_rockchip_color_space(const struct drm_connector_state *conn_state)
>> +{
>> +	switch (conn_state->colorspace) {
>> +	case DRM_MODE_COLORIMETRY_BT2020_RGB:
>> +	case DRM_MODE_COLORIMETRY_BT2020_YCC:
>> +	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
>> +		return V4L2_COLORSPACE_BT2020;
>> +	default:
>> +		return V4L2_COLORSPACE_DEFAULT;
>> +	}
>> +}
> 
> My main concern is introducing V4L2_COLORSPACE_* logic into a DRM bridge driver,
> which should rather rely on enum drm_colorspace / DRM_MODE_COLORIMETRY_*.
> Translating the DRM colorimetry into V4L2 values only for VOP2 to map them back
> to a CSC matrix doesn't seem fully justified.
> 
> The root problem is rather on the VOP2 side: the color_space field in struct
> rockchip_crtc_state and its V4L2-based handling in the CSC selection look like
> leftovers inherited from the vendor kernel, and I think this is a good time to
> clean that up instead of building on it.
> 

Yep. And if you look at the latest vendor kernel code, we have also
removed the V4L2_COLORSPACE_* related content and switched to DRM.

-- 
Best, 
Chaoyi

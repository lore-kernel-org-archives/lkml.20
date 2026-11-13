Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541957;
	b=HnZwukuMMwI3TL/IFbzppoouKdLIIcoHFyr/2FbdF2wqyVGNqpSYb64gMccLUD+XCAlC
	 EdnAeuF/YWfQuiCuR7+QbobUki1RucYN1ty+5IWFz6UCxweeE4cvMGqzuI2IFxiTfNgc5
	 kNRATBIfYBcxn7FoiQjiyALvpeApBq4tTzd/Mq9XUrAGjoQc3+FU0UXKbU+hLZ6VBxoXu
	 nEYmKr3h6AK4/lMEkqYaUZGRQjdu/oyuQVJhf/D2nxBHbuMwnAxCBu4IyoEwZ/NaguooM
	 NbikTH3mF50EiELrKw5snuEa3wG1/OTOx9YeTDCmqxbJXRa8n5ex90Rdt6bI/KqVpYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541957;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=I/Un0HSYvSN4LWf6wdzviavGlXnUoXtD6ZJh2utLOeY=;
	b=ttBy7w7RkQDCxeS8YqOvKNH4JCmwYmExbeZit+NSMDRPHOD0SWkkPLm7wHx6uvDrflJO
	 e6aDyogoz7rFv3fUBj/nXwv8kWRecYFKlQtzKTNLGBbjWq4A/p1zrO9GWPseb8Mx62hWG
	 bb0RRb7lBGyaqOGF6PujPFvDtGUakedf5JBhqKEp04ZRH+E+CgwSdXWB8G+iXNqNCMuY9
	 MBRzQJprtjTKR09aIcZDKm7U7v/tw7ASooKMicVACx42nYhiF3NH2GODiTI35UNad4qIq
	 KSk4zMEefOF0toMrsgj89i5tQDu7oL3G+OG5TFHyqxFyBA7VWd+25ClXrsURSfNCrIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=TM1+YWes;
	arc=none smtp.remote-ip=103.209.128.57
Received: from mail-m12857.netease.com (mail-m12857.netease.com [103.209.128.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6385B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6385B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=TM1+YWes
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54890abe1;
	Fri, 13 Nov 2026 11:52:26 +0800 (GMT+08:00)
Message-ID: <0a09d26f-7dc3-4066-a8e4-577bba4c3511@rock-chips.com>
Date: Fri, 13 Nov 2026 11:52:25 +0800
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
Subject: Re: [PATCH v2 7/9] drm/rockchip: vop2: Find the first mixer of a
 video port with Esmart3 too
To: aiyengar1990@gmail.com, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Andy Yan
 <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Piotr Zalewski <pZ010001011111@proton.me>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-7-8218c1cf8ac8@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261112-vop2-fixes-v2-7-8218c1cf8ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1d30905bd03a8kunm1257125f5c8f0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSRpNVk9MGk9KHR5MSx1MHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=TM1+YWeskbqPHRQQ9YlXevdQcPWiqoKGHCklEddPVz51Gg6CNkFSDbaCs8MSIKTixgvOqSzXnSrDsWs08S5WcDwUB1oIvBFo76F6GgfMCoDDi8H5e8JxsZpkNYaeLtL4V/G+QPlcf5BZRHppat45UpF8FjHEJUL90vHWQPlC30s=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=I/Un0HSYvSN4LWf6wdzviavGlXnUoXtD6ZJh2utLOeY=;
	h=date:mime-version:subject:message-id:from;

On 11/12/2026 4:33 PM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> vop2_find_start_mixer_id_for_vp() looks for the first layer that holds a
> window of the video port, but for_each_set_bit() takes the number of bits
> to search, and ROCKCHIP_VOP2_ESMART3 is the highest window id, so Esmart3
> is never found. A video port whose bottom layer shows Esmart3 then starts
> its alpha setup at the mixer of a higher layer, or, if Esmart3 is its
> only window, past all layers, and programs mixers of other video ports.
> 
> Add ROCKCHIP_VOP2_MAX_LAYER_ID after the last window id and search up to
> it.
> 
> Fixes: d3fe9aa49585 ("drm/rockchip: vop2: Use OVL_LAYER_SEL configuration instead of use win_mask calculate used layers")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 1 +
>   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> index ccbfbdb8d246..290990632388 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> @@ -857,6 +857,7 @@ enum vop2_layer_phy_id {
>   	ROCKCHIP_VOP2_CLUSTER3,
>   	ROCKCHIP_VOP2_ESMART2,
>   	ROCKCHIP_VOP2_ESMART3,
> +	ROCKCHIP_VOP2_MAX_LAYER_ID,
>   	ROCKCHIP_VOP2_PHY_ID_INVALID = -1,
>   };
>   
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 83203d18865b..088c1f3a972f 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -1889,7 +1889,7 @@ static int vop2_find_start_mixer_id_for_vp(struct vop2_video_port *vp)
>   
>   	for (i = 0; i < 31; i += 4) {
>   		match = false;
> -		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3) {
> +		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_MAX_LAYER_ID) {
>   			win = vop2_find_win_by_phys_id(vop2, phys_id);
>   			if (win->data->layer_sel_id[vp->id] == ((layer_sel >> i) & 0xf)) {
>   				match = true;
> 

Reviewed-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon


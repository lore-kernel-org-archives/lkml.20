Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304628;
	b=Xea7Qd9fp3waprNmPHQOh+H/gsOK68DxhfnDf3f/55VGRH3YfA0z+swO1TulJ5GxK5iS
	 RAwqx7rHi/BGJ5+wwOAgbQgAcB6l03sww80xzK23JfP6C26DC+Iw6PGE0S7tyQrnTjLM4
	 m9Q5a1R8yE/D7i7AEcSVvNf6amyZBOORxj7XQDHOK/WRQXyY7aL2QYrWJiMDYCwl8FsH8
	 13Gi5Bn4s1LRJHevnoQx+AdgK0DyloIGLZYudiH6uexA4H8M4GrwsSyvoVE+MbOdcLovq
	 auY7QFqIQ6vz82sohKg2rjRodpmXvDwsabTbwcamJB/iVGmuLkjNaLvZ9m3yosqwJLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304628;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=XDw9TAxp8+PVmYmAoppiNo2R12oIkwagkMS4XyFHbSY=;
	b=qVzb0Xa4U4UuwQMDHjdXAQvE/OAAsQZke6lWxOxEPTzIceN5lKJ/rei+DJJ9ceTY6+CR
	 nE7wt3+1Rl3Dfi4rj2a1JKxnQaiEX8orA+Y75PmLQgWdhbJ+LKlBxT3zTE6aVmtRZ5tNw
	 fr7cf0Uvn4Ofav7noU7pTRFiE0w8itv9iF8Ch42l4xHXXQz/22CI4znR8XveDjcBaNEE6
	 CtRRMXm5DMqX81jH/DRhBEoCAvLZhTQHZ0akQtL30tX6SW6ThtjpRjRvwfz36o/Hv9lmU
	 YsfKtelXqfNWrH136UweSqTtMOpNXSEmg4c4nA/yR6u+wUqXoG59KqGl7RCDlnBz0fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=FUPAm8N1;
	arc=none smtp.remote-ip=154.81.10.40
Received: from mail-m1040.netease.com (mail-m1040.netease.com [154.81.10.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE49B606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE49B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=FUPAm8N1
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 542714690;
	Tue, 10 Nov 2026 17:56:54 +0800 (GMT+08:00)
Message-ID: <d1e3a4a9-7cb2-4345-86d9-f8d1c0156b42@rock-chips.com>
Date: Tue, 10 Nov 2026 17:56:50 +0800
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
Subject: Re: [PATCH 6/8] drm/rockchip: vop2: Find the first mixer of a video
 port with Esmart3 too
To: aiyengar1990@gmail.com
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261110-vop2-fixes-v1-0-d336e9dd90d3@gmail.com>
 <20261110-vop2-fixes-v1-6-d336e9dd90d3@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261110-vop2-fixes-v1-6-d336e9dd90d3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1c4e3a1d603a7kunm6c01c8eb715da2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGR0fVkJOSE5LHhpPTBhDTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FUPAm8N1nOe1ZJvKxUl85v9FSy633IoHhaFi9+BagYYZlyk5Vkd1HjGqcf0KxVFMf6Gm+4uR17d1NKADyKNA1BHrHw+5P7lp4tmMVhQSo/JRnDHzmo/jDhCFTg1aWOd6RCwJr7GyfyQs+6TzIFou49nk5CaHU7+4nXwdYxtciqc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=XDw9TAxp8+PVmYmAoppiNo2R12oIkwagkMS4XyFHbSY=;
	h=date:mime-version:subject:message-id:from;

Hi Arun,

On 11/10/2026 3:18 PM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> vop2_find_start_mixer_id_for_vp() looks for the first layer that holds a
> window of the video port, but for_each_set_bit() takes the number of bits
> to search, and ROCKCHIP_VOP2_ESMART3 is the highest window id, so Esmart3
> is never found. A video port whose bottom layer shows Esmart3 then starts
> its alpha setup at the mixer of a higher layer, or, if Esmart3 is its
> only window, past all layers, and programs mixers of other video ports.
> 
> Search all window ids.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 83203d18865b..2843bfb36341 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -1889,7 +1889,7 @@ static int vop2_find_start_mixer_id_for_vp(struct vop2_video_port *vp)
>  
>  	for (i = 0; i < 31; i += 4) {
>  		match = false;
> -		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3) {
> +		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3 + 1) {

It would be better to add `ROCKCHIP_VOP_MAX_LAYER_ID` after ROCKCHIP_VOP2_ESMART3.

>  			win = vop2_find_win_by_phys_id(vop2, phys_id);
>  			if (win->data->layer_sel_id[vp->id] == ((layer_sel >> i) & 0xf)) {
>  				match = true;
> 

-- 
Best, 
Chaoyi


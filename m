Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479207;
	b=v/rHtZajRbVRrkX2u39cHsKSc872iolqelmLFRkgTV9frOaD18yUj0dWqhqrX2SNC1P5
	 rtr5vC2cy+qf6//VUAWjSAsYsNZTylwy4ANmGjESb9bGavXWGs6ivbuBCEzoLP/PkBHBc
	 zyS3V19YBSUG3fn+U8KyfmFzKorVC6TiIr/L0mhdajP8QWzJmoy1sSNdODSXp+vvLWtEO
	 cQ01H9/jJnvF638qvimnNn//zfN4TkBtQa9nPkrcwHNCw5KYmNodShqC+3NFD3uX5YYgP
	 KM2J1bRs9/PZsLSnzzqME+6UwEGwXFNFVHeqffb+HWM0rmuGmgVX9rv/M/Pcafxl1Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479207;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=BAGiVqo482Y2Wo+PAk1n3JBj92FYpa/0+d+5K1xeOuY=;
	b=SWg+7OsIniU4j8e/PlIgjUnXqMaedMeQ/zE3AuEmgGI6ypoq31gL749rxC4u0daPdarf
	 h9ZhE94Lg+XZUyWTwlxogW7qMvzZF0Dz9cIw4h/u1jYziFmZtQ9O0o5P0iYtRXI/sIfJv
	 GElCidFY+052NEw2bj4p6MmBKWZzDYEm31ZoSwkEXMO5OdOjy9lUEIz+A9b2MzJ2Q8BBp
	 eCsCm4nj/f+uRTp7TfWe44/09zCk/fbhLZKCBY3ROTZW1uZ+AmhttXgQzXMSzusW8nPkj
	 0aTiy76HsJ4cP4KdeMedQWdjtup2P452W+cmczyvgp68hU6ZldH5JJtinPZq9zquWgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=mBqta6sQ;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD2F606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBD2F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=mBqta6sQ
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 252D9802;
	Thu, 12 Nov 2026 11:24:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794479061;
	bh=Y/lQ3pq9rgGGVd75tXp0uthRUc6fWC7EXCQMcm636I0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mBqta6sQxO4C/KG4iD/5Q5P8iuJmcGhDCpZG2IVW2ZSqaM4FqPsFVLQq+7f4vZMkV
	 Ij3VHJ/qEGJyqcjlv2iPMs4WFb38T2AQQrwYvKjyHpJ7oY50tavRs6j46TzMeYV2yo
	 bgyNISVvAIhHz4i+B/MTh0cJyR/8jsxALO3mHBuY=
Message-ID: <8c71220e-c74f-440d-879e-06434b1f3ecc@ideasonboard.com>
Date: Thu, 12 Nov 2026 12:26:41 +0200
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
Subject: Re: [PATCH 1/1] drm: xlnx: zynqmp_disp: use
 dmaengine_get_copy_align() accessor
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank.Li@oss.nxp.com
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 "open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>
References: <20261111200739.3823753-1-Frank.Li@oss.nxp.com>
 <20261111231644.GC449775@killaraus.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20261111231644.GC449775@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/11/2026 01:16, Laurent Pinchart wrote:
> On Wed, Nov 11, 2026 at 03:07:37PM -0500, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>> Use the dmaengine_get_copy_align() helper instead of directly accessing
>> the copy_align field from the DMA device structure.
>>
>> No functional change and prepare to move struct dma_device to private.
>>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Tomi, I assume you'll push this to drm-misc. Please let me know if
> that's not correct.

Yes, I'll pick this up.

  Tomi

>> ---
>>   drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> index e998f22686748..0753236b9546a 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> @@ -1433,7 +1433,7 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
>>   		struct zynqmp_disp_layer *layer;
>>   
>>   		layer = &disp->layers[ZYNQMP_DPSUB_LAYER_VID];
>> -		dpsub->dma_align = 1 << layer->dmas[0].chan->device->copy_align;
>> +		dpsub->dma_align = 1 << dmaengine_get_copy_align(layer->dmas[0].chan);
>>   	}
>>   
>>   	dpsub->disp = disp;
> 


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478826;
	b=m5DKfQJ+p2eSwx5t2+gAyTAF+FfJIAAiyTJf8d/r8/FuThqcqbwp8It6LJ47naN2TdO+
	 8mVcw2uuJHJKYkogPHKoV447eTcXxVL6moXN2Goxjj8w7NuDhNNVIDu16mB/hkJcz2r/C
	 W5L0pkgoQPEKjbPaeJdGn/Z+mqSJOH1S+D30TBabBJXIMpLQvHrgky5qv/Fnkf4j3/tpn
	 ihZpnnw2wKOVdUIzGinuzSQKYnv3zKVrF9m9HrIzMGOYPtPDjnxlr9ZcfiM1Rp8BRX8o0
	 ZhCm3tUTjp13WuYUDectRhNS+AOIDBim9yqZ24Rb1VT4WACIAhac8lFh9yt4mGWYZnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478826;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=UE9wGF0pwW3NKk3EGGqr6iAQHPthH40KgegCDrxwBqU=;
	b=wIiljsJhp6rpqTspoYykf8FxhtcgX4607NcSmdjTsXO7p2Ybr/D1yI3q8E3Zhm0Qbsha
	 62AmFgoP6XKr5fElFKhxwnhfb/qXFt3X88d4z8x+RzdBfdtS+DE+oumHRUes6OS2Zcful
	 QP5JWLUWPFMTUpBjtEEQvPFR6F8ukY/bAm26WTm8yoJ6u5VgqCEL+FmCG+hMwfAhRRA3f
	 mhHEOZSqyVXHh3q9xf7GMgHKD0fMZhhJrV9K3uprhWQHFkk5jrPqdtK+wOFACN9Xxrr68
	 tfVw9BdP03xFNyoS4BoDLdAcQ+68NFaePRaEDSHjpCrFE1JvQIuNgYt8ccmtANsBz8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HuRfvXqq;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB7606A31C;
	Thu, 12 Nov 2026 10:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3CB7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HuRfvXqq
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFDD3802;
	Thu, 12 Nov 2026 11:17:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794478680;
	bh=Ea69BVEmwDtsKQtrsOr6RFnZuInEt4kFkMtLtVsqXYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HuRfvXqqmeDyqX+UL+f4rvr/mA255L8hwgpxVhlMpgE6dVqAn5m9MsNi04LZWxlCy
	 qR2MpQukaQTBZHVK/iesG2lLWcNaLau7nkwulnksLRcvpbaR8Xfqx2fUE0epqsxu3/
	 SkOOKmXvHdyI2Bgf6QZ9pqlnxKR3EmSwB2/ktXd8=
Message-ID: <de113745-4cad-458a-9834-ec5c04f2b83f@ideasonboard.com>
Date: Thu, 12 Nov 2026 12:20:20 +0200
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
Subject: Re: [PATCH 1/1] media: xilinx: Use dmaengine_get_copy_align()
 accessor
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 "open list:XILINX VIDEO IP CORES" <linux-media@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
 vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20261111171325.3424645-1-Frank.Li@oss.nxp.com>
 <20261111231551.GB449775@killaraus.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20261111231551.GB449775@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/11/2026 01:15, Laurent Pinchart wrote:
> On Wed, Nov 11, 2026 at 12:13:24PM -0500, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>> Replace direct access to dma->dma->device->copy_align with the
>> dmaengine_get_copy_align() accessor function.
>>
>> Prepare move struct dma_device to private.
> 
> I didn't see a rationale in the commit that introduced
> dmaengine_get_copy_align(), and I then saw it here. Without knowing much
> about the greater plan of making dma_device private, this patch looks
> OK.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Tomi, will you handle this with any other ongoing work on
> media/platform/xilinx/, or should it get merged separately ?

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

This can be merged separately, I don't have any series that I would be 
sending in the near term future.

  Tomi


>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>> ---
>>   drivers/media/platform/xilinx/xilinx-dma.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
>> index ece2116639fc0..e01bb40bc39c7 100644
>> --- a/drivers/media/platform/xilinx/xilinx-dma.c
>> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
>> @@ -710,7 +710,7 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
>>   		goto error;
>>   	}
>>   
>> -	dma->align = 1 << dma->dma->device->copy_align;
>> +	dma->align = 1 << dmaengine_get_copy_align(dma->dma);
>>   
>>   	ret = video_register_device(&dma->video, VFL_TYPE_VIDEO, -1);
>>   	if (ret < 0) {
> 


Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0963239E80;
	Mon,  7 Sep 2026 11:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780850; cv=none; b=dKDvW+1xoAuUpt54nKEJBrzWzV/fYk14TPcoS+uPNPVwUuStMACetXY0iq6g9BzQtmZAoeVnJoGGGG7djJwmuqaPbhHgifI3PN+UpoUjTqIO+eZo6rcSEeyUa5Us/GIyn24iI4npoiLp3aJ6GVXpbnVJqm+VGwi45B/shzSYFoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780850; c=relaxed/simple;
	bh=xqaPec23TxqBqrsyBPj2UG+Cs2Tuu/xm3uZmpyee0rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doE/b2d9tJqhBD//HGxMLTBDRe8dLxjlITNv9RoIaD4UAoEvJISlUiXwzC0BT2toRQUL/Gcu2wGNCO9nxnIwKUyenA6A+ban4QLSeSIAmOm1sRrEc/80dRawJAeWNlFDjoIX5TeaCDmhY9MRD7fgpL4z9nzeU6/n0fmrKdZwOc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bO/b20+f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bO/b20+f"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE0224B0;
	Mon,  7 Sep 2026 13:32:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788780752;
	bh=xqaPec23TxqBqrsyBPj2UG+Cs2Tuu/xm3uZmpyee0rs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bO/b20+fnG5f4iets2MhI5Yfji0Aik+bFWdcOcDL8RrPp9POMW979MoBUyAlx8sUz
	 Y08kUS1RJArTjK+X+15WuEgn4d9AwkBeU0bY7PVsjv+r+fXPBb2ZyqEhulXrtN+V7y
	 +0rzMieIh1FFOKX97HWYFC2Zo0Vf0XbqjS+90eiI=
Message-ID: <c52f0807-b361-4c76-8c5f-4aa59d7cde15@ideasonboard.com>
Date: Mon, 7 Sep 2026 14:34:03 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l2-common: add Y12 and YUV24 to
 v4l2_format_info()
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishal Sagar <vishal.sagar@amd.com>
References: <20260806-v4l2-format-info-y12-yuv24-v1-1-de2dc061be02@ideasonboard.com>
 <f2a442a8a21ff5d22a3bcdb4089b96604ce8344d.camel@ndufresne.ca>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <f2a442a8a21ff5d22a3bcdb4089b96604ce8344d.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nicolas,

On 17/08/2026 18:56, Nicolas Dufresne wrote:
> Le jeudi 06 août 2026 à 16:02 +0300, Tomi Valkeinen a écrit :
>> Add the V4L2_PIX_FMT_Y12 (12-bit greyscale stored in 16 bit container)
>> and V4L2_PIX_FMT_YUV24 (packed 24 bpp YUV 4:4:4) entries to the
>> v4l2_format_info table.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-common.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>> index 65db7340ad38..0951a1b42a5f 100644
>> --- a/drivers/media/v4l2-core/v4l2-common.c
>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>> @@ -307,6 +307,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>>   		{ .format = V4L2_PIX_FMT_Y210,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_Y212,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_Y216,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_YUV24,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> 
> This one is mapped two lines below, perhaps you wanted to reorder ?

It was caused by patches crossing... My original series was based on a 
kernel version without V4L2_PIX_FMT_YUV24, but that was added in April 
and went unnoticed by me because my patch applied and worked fine...

Thanks for catching, I'll drop YUV24 from my patch.

  Tomi

>>   		{ .format = V4L2_PIX_FMT_YUV48_12, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_YUV24,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_MT2110T, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
>> @@ -333,6 +334,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>>   		{ .format = V4L2_PIX_FMT_YVU420,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
>>   		{ .format = V4L2_PIX_FMT_YUV422P, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_Y12,     .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> 
> Ack,
> 
> Nicolas
> 
>>   
>>   		/* Tiled YUV formats */
>>   		{ .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
>>
>> ---
>> base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
>> change-id: 20260806-v4l2-format-info-y12-yuv24-4236cb991a7a
>>
>> Best regards,
>> --
>> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>


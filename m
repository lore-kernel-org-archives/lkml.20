Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794829949;
	b=kVMDH03cY6ntRPhxJ6HqZSKYb0ew9TXvexlsGL3EFKxVW6Ng8hBupxoTWNRLPPtnjCo6
	 zLH7VnJjv/jQ6ksUsUzHrXNhs/r9Cj/9KtxAKkbzl96iS76TOqwlwP9iZj8GuH6u9Sztw
	 7H3M5AYbFl2ofNbVP2Bx5Da8r8D41xNGC70jeGpEB3BRNCE4tL9V+q52U4SXM1gsFJU9M
	 keCusNlV9Hh+gUbaZpbVXallG1VbF+civNTmRyBexRY23p3yDradOdcoaup/p+pJf8Xax
	 AeGROlOA9qcouXS8QkDl+qoV9sMZABNkUZcxMJbmBIMV43iv30gVeDOaEFSeuvMc0yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829949;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=w26fEEm5ybG+G7gyNNOpBbzc8hwwqjZd0VP12Wt699s=;
	b=iCtHsitsJAnwpi1F4DPRszW9HgkiqUCgmKq92zcxd/ReBYYts3fu7NwrBw4mu83m2A5V
	 HM/wctCnFLqwv0OV+maDtqOdaFGfY/R3tq/0dfTELzaGDDPlG+mUgzY3sVQV1fgyeii7P
	 rFpFzPd4PVloIiHTiLe3JgAYInCEejiYWBP8yfNeYpq569EennkTa6GmehQg3aaTh185r
	 Fd2q1hfb9QJdf/WCwAbKcV5kpwMjRCf4/7CUf4fyTnR2Rfaw3lCFh3V9K0re4tUuq5flE
	 IYQjbkOJ9U3Y0Qc210CnsMkPkepIOG+sf7o/bm5J1/lGoONy2c9hHWws42WbNWgNpvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=N4qcmHqo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574B8606A31C;
	Mon, 16 Nov 2026 11:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 574B8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=N4qcmHqo
ARC-Seal: i=1; a=rsa-sha256; t=1794829917; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=irrbfyXogddlylcQkZlr6cFYcsiEft7lACg+oXK/70XkypgFcOjhmlPA7bq12bE16XzEfAWJYo4r3oWZcjOf3EUX46INf7/iqVbcT/NRcuNT9mFS7dg9/l2KKYIYPTF8fJlCSwLunT45fEXl/zkUcBQNFCd+V4pflORA2ag13Lk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794829917; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w26fEEm5ybG+G7gyNNOpBbzc8hwwqjZd0VP12Wt699s=; 
	b=D6oNnhh/8JLSRSl95JJcti5S9vsohH8/64oARoV8f0hCc7bQfImSA93NBfkpdwFosA9+xFE864riOu+NhuPED6i9DB1j6vHnT2txkXGIvpK+V9VAYv5NUNVf937QzPzylg+y6IoVhuWf4Nbs0gqve8aq48i8uH8WNoom1ikvaPI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=N4qcmHqo84guRQyqnmSu5MjnWgmGqqRgJx9a78v6H+YMDg0X2DOyl/HIZmAgFDsvibkEl5CTzA8eowA/zTt1HiGiSi0ht5rNR3SauwE+SxlW6i2xeongA00WAH966tOIosLWnLvvNIaFko5hsiXgrA4AvfVKhjx3Q9zdpAKkMP0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=w26fEEm5ybG+G7gyNNOpBbzc8hwwqjZd0VP12Wt699s=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794829915540706.1524411200606;
	Mon, 16 Nov 2026 03:51:55 -0800 (PST)
Message-ID: <8c3805ca-0be7-4634-8904-30a9c36d8962@collabora.com>
Date: Mon, 16 Nov 2026 12:51:45 +0100
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
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: Honour the requested
 bytesperline on MIPI
To: Faizel K B <faizel.kb@gmail.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org,
 Robert Mader <robert.mader@collabora.com>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-3-faizel.kb@gmail.com>
 <51b09428-9d10-4f36-a811-a681e479e45e@collabora.com>
 <fxrwhxkzgihpiz52rbeuomtqkzz7izgdfcbux7osamqruc7w7u@qhvh3nkqypro>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <fxrwhxkzgihpiz52rbeuomtqkzz7izgdfcbux7osamqruc7w7u@qhvh3nkqypro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Faizel,

On 11/12/26 07:20, Faizel K B wrote:
> Hi Michael,
> 
> On Wed, Nov 11, 2026 at 10:46:43AM +0100, Michael Riesch wrote:
>>
>> Come to think of it, TRM p. 2111 says for e.g. VICAP_MIPI0_VLW_ID0:
>> "Virtual line width of even frame for ID0 path(must be aligned to double
>> word)." which I would interpret as "it must be a multiple of four
>> bytes". What do you think?
>>
> 
> The VICAP register summary defines it.TRM part 1 (V1.0, page 2081)
> "DW - Double WORD (64 bits) access". So 8 bytes.

Ack.

>>> +static void rkcif_stream_set_bytesperline(struct
>>> v4l2_pix_format_mplane *pix,
>>> +                      u32 req_bpl)
>>> +{
>>> +    u32 min_bpl = ALIGN(pix->plane_fmt[0].bytesperline, 8);
>>
>> Please add support for the bytesperline field in all the plane_fmt
>> entries here...
>>
>>>      width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
>>> +    req_bpl = pix->plane_fmt[0].bytesperline;
>>
>> ... and here.
>>
>>>      ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
>>>      if (ret)
>>>          return ret;
>>>
>>> +    if (stream->interface->type == RKCIF_IF_MIPI)
>>> +        rkcif_stream_set_bytesperline(pix, req_bpl);
>>
>> Why is this restricted to the MIPI interfaces?
>>
> 
> The MIPI formats all have a single plane, and the MIPI path already
> programs the line width from bytesperline. The DVP path uses the width,
> and I can't test it. But I agree it should not depend on the interface.
> 
> For v2 I would:
> 
> - take the requested bytesperline of all planes into account, and use
>   the largest for all planes, as the DVP has one line width register
>   for Y and UV
> - compute the sizeimage of each plane from it
> - limit it to the line width field (20 bits MIPI, 15 bits DVP)
> - program RKCIF_DVP_VIR_LINE_WIDTH from bytesperline, with the current
>   value as the minimum
> 
> Does that sound ok?

That does sound reasonable, yes.

> A question on the DVP: the PX30 TRM (Part 2, 5.3) says raw data is
> stored as 16 bits per pixel, even from an 8-bit source. This matches
> the width * 2 in the driver. But for V4L2_PIX_FMT_S*8 (e.g.
> V4L2_PIX_FMT_SRGGB8) bytesperline is the width, so the buffer is half
> the size the hardware writes. Am I missing something?

I don't have any PX30 board, and actually it is the first time I hear
about that. Maybe Mehdi can chime in?

> I can only test the MIPI path, on RK3588 (Radxa ROCK 5B+). Could you
> test the DVP part on PX30 or RK3568?

Currently, I don't have any active DVP setup, but when you send the
updated patches I'll ask around.

Thanks and best regards,
Michael

> 
> Regards,
> Faizel


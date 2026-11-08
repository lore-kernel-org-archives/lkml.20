Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153948;
	b=W/Aq712qmjhLusT1ermD5vaoUsD2p4WS9btrL3T4dFuAwaI1fw2u6WKmE4H7R+pZBh9o
	 O5THEwgMCXBkjYyOPDzYe79xYHwHC2AMPdJVJfIQF4cGeQMlPvXbEzoFTCQFYNoETaylZ
	 yY2hYy9pnw5m9rq5X7LPgU6eijJ+YqZMYyUtc62YYiTsebwvLo7XOFUEzbmGFLN2qKwAZ
	 5GzswtBR5Z9HxOROVqVEnPmhc+GzHSChWfqCmlwZ9JHCeYBAwI7xLuu+5TgEMbOFNxPB5
	 DRE6IEi8i9AjP6MUFqn2nDoJ2Ctaim7za/5RgJyhCvNOuNqt/g2QQPuf1bDFElZg3Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153948;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=kb5blHaKqccC5gFIB9Xm+5chHCNmaHVStUhLCGbz+FY=;
	b=uyEB5mFEbutoaALqnZUtO0ZPAPJsk4jjEy7PGVtjSDzyhYGfpPbKfnXyHJtAa61NIJ22
	 mEVOLwczQgVO9/rnXZteEb6LUOzxr9eywJVTr3rofxL6TScBPtxyQQbHav/oQAYbaBUB5
	 lOQJLkems4jjZnsfjxOxr2M8Seoe6D0Tg7Xer6kvf4zNkNjquUZE6bvOg5UAjOTT7FoBz
	 hX7czuGsx8keKrmt3U/2SBTxbXqEQdMA1shFQfSl/X2mLHCni9vUEKY6+84ciDBnxQNpc
	 l+fvMBlrH5ZWMUHLzgQfpwn+yUK9j0OeEztxgvRLion8YEDosJeP+I42Urcc5hcHSxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=oRFfYqgi;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B74F606A31C;
	Sun,  8 Nov 2026 16:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B74F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=oRFfYqgi
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBA0F33D;
	Sun,  8 Nov 2026 17:03:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794153797;
	bh=F59l12QQkYD4c+deJ4LOY0pRkA3JLhepmViebcp+JTc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oRFfYqgiqbGxSzBuHVdSZypY0wU45bJQ5jtP7Y1Bqyb8fTJoCnZYY/qREXVNdKJnR
	 SFFqk4eu5kmy4s1OvIkpTAderXVb35sGrzV8ca4EnTYeH6rGD0szU4n10oqqqJ7umI
	 dV0gxaj8sXweRXviycqHtl/YSu1RnZkGFqy95gBY=
Message-ID: <8a1ff8b8-93b6-4853-a108-a3d0a45ca055@ideasonboard.com>
Date: Sun, 8 Nov 2026 18:05:34 +0200
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
Subject: Re: What should bridge drivers use instead of
 __v4l2_subdev_state_alloc()?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DelaySystem <DelaySystem@tubot.lat>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-kernel@vger.kernel.org
References: <20261108013106.1162346-1-DelaySystem@tubot.lat>
 <20261108102559.GA103930@killaraus.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20261108102559.GA103930@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/11/2026 12:25, Laurent Pinchart wrote:
> On Sat, Nov 07, 2026 at 05:31:06PM -0800, DelaySystem wrote:
>>
>> Hello,
>>
>> While working on drivers/staging/media/tegra-video I ran into the FIXME
>> above __tegra_channel_try_format() in vi.c (added by commit 40aaab9d773b
>> in 2022):
>>
>> 	/* FIXME: Drop this call, drivers are not supposed to use
>> 	 * __v4l2_subdev_state_alloc(). */
>>
>> The driver needs a scratch TRY state to negotiate formats with the remote
>> sensor subdev from video-node ioctl context, where no subdev file handle
>> exists. I looked for the intended replacement, but:
>>
>> - there is no non-dunder allocator in drivers/media or include/media;
>> - v4l2_subdev_call_state_try() is documented for legacy non-MC drivers
>>    only, has no in-tree users, and allocates one state per call, while the
>>    driver needs one state across enum_frame_size + set_fmt + get_crop;
>> - the active-state APIs have the wrong semantics here, since try_fmt must
>>    not disturb ACTIVE state;
>> - the same FIXME is still present in mainline vsp1 and staging atomisp,
>>    and mainline stm32-dcmi still calls the dunder directly, with (as far
>>    as I can tell) zero conversions since the 2022 rename.
>>
>> So my question: is a new core helper the intended direction for the
>> bridge-driver scratch-TRY-state case, and if so, is there any guidance
>> on the shape it should take? Or is there an existing pattern I missed?
>>
>> If a new helper is the answer, I am happy to implement it and convert
>> the in-tree users.
> 
> No, that's not the answer.
I think converting to MC is the answer. At least for a staging driver.

  Tomi


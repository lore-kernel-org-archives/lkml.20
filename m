Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479483;
	b=GtvDAUWsmL4MIGB4fJ42y5qI3V++Qks/9JXtNEEXidjHZXu0i2gXzYZ043BNHZ6r95AD
	 ifgFrJPuEOvaW5ChkzK3mbRndVVUr0ikQevWu6pgg+I4X6idyT/WnH35tY4KKzD+crbmq
	 Z91emqPNwxOsq/HCkRHJu5donczdEwuXhB1nP5vqeBK6lajGrBYTqSbGMqPhX58aeNGrJ
	 ccPU7b59Xoqcp/vQr1Hl7UEJ2gq0wpNkB/S7HKsR/7x+lNRmycSJ5wZdYzzhyKf/YPXZ6
	 N10JUDDxqiQcL8ih9nJv+BIJXtfwdax3h5v8FCHSVKevpJAHChL1SBVt5RBa/aX0jEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479483;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=x/3R0C43YAiNZIf6KcOw82RzTJCd2JeVTwUmw8+iu6g=;
	b=BKUofMoN9KA+ZYLiNS1R6bARwyy2Sc3x+tOW/L0lLYXLX0ITLuN5m98m3OBuDicloczq
	 AKaIR11NAsCDT10LUzSKXOkVxx4gp6xJFf1YOV9Bmw4UpW+xV2VQ7FmTU2FNW6v0hpAm0
	 SDpVQiSEg8HngV2QLIonytUH6Xd9HZ/r/TnVE2ntRLf7N+hgBPNYjaHDIBp5NwdSWaliq
	 aSSLQY3i/0HpbM+FGCOqcYCgUhd5rEroXofwg2pGNcCDc6/ucclYlq/GdE5Y4f++M1PG7
	 ghNgJO+YTcC5Y5NC+hzvQIfInQ2MkilTl2gIUGWV2kVBr52+xCyr86GCxM+/6fKy7Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Tu80jOx+;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E572606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E572606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Tu80jOx+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=x/3R0C43YAiNZIf6KcOw82RzTJCd2JeVTwUmw8+iu6g=; b=Tu80jOx+iGKr9Kje54pGhsr6Jt
	v4KEwmJWNmNWQfudbZEjR6WfBrhlCoK7cMj3cVMzL4vCSxUVyhg/BArsV0nMNuxaYPAIjUsuvjGu+
	LYMdiKNz04/tfcZ5NFnqUV/xVG0E4RZp/ryy5akm6VdRCtu5zTznh23nai5awECJycdT0DUHsTaCA
	NOivDOrpLb6f3jprW7CPWOVxPLrKjuKiKDY/ygs6HtVyZronPJuqMraNECYqpNt8QooR5216rcCEo
	s7gfS1YeTxwlKw5kbOS06OxpN0vo2qygAg7IYXoWUTaDgedYHB7Od1DIXkepTtqWPY99Z4UdfNJIW
	sL6hJHTg==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xJ3mr-004HEI-P2; Tue, 20 Oct 2026 08:57:29 +0200
Message-ID: <4dabaef5-25ad-480d-96f6-5feb26a64e42@igalia.com>
Date: Tue, 20 Oct 2026 07:57:28 +0100
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
Subject: Re: [PATCH] drm: Don't BUG when a CRTC fence signals during a name
 lookup
To: phasta@kernel.org, redducc <sushmit718@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261019161731.2341-1-sushmit718@gmail.com>
 <30a31088a0386d5f5d53e74632ea9a63566dccde.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <30a31088a0386d5f5d53e74632ea9a63566dccde.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 20/10/2026 07:53, Philipp Stanner wrote:
> On Mon, 2026-10-19 at 16:17 +0000, redducc wrote:
>> dma_fence_signal_timestamp_locked() clears fence->ops on signalling when
>> the ops have neither a release nor a wait callback, which is the case
>> for drm_crtc_fence_ops.
>>
>> dma_fence_driver_name() and dma_fence_timeline_name() load fence->ops,
>> check the signalled bit and then call into the ops. If the fence
>> signals between that check and the call, fence_to_crtc() rereads
>> fence->ops, finds NULL and hits the BUG_ON(). This takes down any
>> caller of SYNC_IOC_FILE_INFO on a CRTC out-fence, such as Android's
>> surfaceflinger, which hit it on a Snapdragon 8+ Gen 1 phone (msm).
>>
>> The CRTC behind the fence outlives it, so reading the name after the
>> ops were cleared is fine. Only warn when the fence carries foreign ops.
> 
> @Christian:
> We have now seen several bugs like these, which is one of the reasons
> why I believe that RCU is the wrong solution for dma_fence.
> 
> I present another rework RFC soonish.
> 
>>
>> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
>> Assisted-by: LLM
>> Signed-off-by: redducc <sushmit718@gmail.com>
> 
> Reviewed-by: Philipp Stanner <phasta@kernel.org>

Hm this looked familiar so I looked around. There was an earlier fix for 
the same from Andre with msg-id 
20260721-linux-drm_crtc_fix2-v3-2-afa8c71506e6@linaro.org which seems to 
have fallen through the cracks.

Regards,

Tvrtko

> 
> 
> The Signed tag btw. states that you have the legal right to push this
> code upstream, and that you agree with the kernel's licensing. It's
> uncommon to use with pseudonyms and lessens your personal accumulation
> of prestige ;)
> 
> 
> Philipp
> 
>> ---
>>   drivers/gpu/drm/drm_crtc.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
>> index 63ead8ba6756..1dbd0e9db536 100644
>> --- a/drivers/gpu/drm/drm_crtc.c
>> +++ b/drivers/gpu/drm/drm_crtc.c
>> @@ -158,7 +158,13 @@ static const struct dma_fence_ops drm_crtc_fence_ops;
>>   
>>   static struct drm_crtc *fence_to_crtc(struct dma_fence *fence)
>>   {
>> -	BUG_ON(rcu_access_pointer(fence->ops) != &drm_crtc_fence_ops);
>> +	const struct dma_fence_ops *ops = rcu_access_pointer(fence->ops);
>> +
>> +	/*
>> +	 * Signalling clears ops, and can race with a name lookup that already
>> +	 * picked our callbacks, so only a foreign ops pointer is a bug.
>> +	 */
>> +	WARN_ON_ONCE(ops && ops != &drm_crtc_fence_ops);
>>   	return container_of(fence->extern_lock, struct drm_crtc, fence_lock);
>>   }
>>   
>>
>> base-commit: 6a56f4f29711dd2da49f03a5b99ce53779e638d7


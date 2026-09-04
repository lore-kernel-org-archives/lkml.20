Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB37420490
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512849; cv=none; b=DcBo/PKUdmHI8bNNAs0xzuBuxO7EEIZ03dqNyHN1tFfXdRbgbxjYxowFJ989P3m5DneUf0RC/4m1U0gIzXzvUIYHpNLJZzXaKD4akRzZYHNJP3syWD6GN/7J6HF5XIvGWIKpTKVz0LGdid6Ibbsyo+uit7dtlipgRIZXyZQreFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512849; c=relaxed/simple;
	bh=wMYxpGpJt34AzXu9fEuBcpdkz1RLmyxJEpe/9vdx1gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFrmvUe4BbNJX5tunrk5jloCraEdY/LfPK1QWmVTURYNvexlvSCPIOb4o0AiG56CROy2Elk0pSG4CNLRZ6jSa3RGP5h2+eCxgX4rVCrYsgZ9M8oKsKdtBfB9+KNxV8NhHKqH8aZIanEbOGrn7rNN51y1hm6WKEswJCSApA4LtEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=H4m5ZwpF; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="H4m5ZwpF"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c169ae1cb26so349510566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1788512846; x=1789117646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7wdy2Og9YO6nxxlPkfUyoT4MUWUNJ9x4RWvdbL0oNU=;
        b=H4m5ZwpFa6jpq+fEAHyBocEC6QgCx6VnhWb13r82jurvPNenXmtcSG7vA2DjH0na9s
         HC/1heqf9pVlNNr1TXKaQ/HNfeK+Pbw5yPaoZKqFRAMKfCu5Yuk/xJFwZhDsO50QrRRZ
         TUKurEnc2+9btFpHESheqqX3mnSaaUUQMI/IHLGnyIMqqx9bTul6V+gXpOVuLiQROO1O
         p6wWoNdaHguGshlboix84ZxUJ30lM4MvAzF/ytIOY3vWtFFrBspIhN+0vfpX+hr3Ggg+
         MVuEv+t8Lf0bQn/QhtGysR0igK12VPZEERABUw/aDugu2ZNLj+QBushnLBbQ35wrmGj0
         OMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512846; x=1789117646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7wdy2Og9YO6nxxlPkfUyoT4MUWUNJ9x4RWvdbL0oNU=;
        b=UBqLop5UEzpQ5/u7m6eB2qNqDI9qfplRgLIOaGXcgLHMpJrnCxYDuylz3nYRcXHYu0
         s8xDS05HLJnGMieN2MFPw72G4Wkwo9n4f7NvsvyBOeVp0pUohj6hJXbuGVWRSaMtFnUh
         kD9bvGBZ2aDlATheLDY/3kdakc5fMLSIzqPQn+E5nPqa4t15U9ZvMMJRsMiEYHsO/NgI
         N5KlMaA8Aq6TQ6xmQxPVNBGd4jW3Aa285Aj7UlTuzJL8mjiD9CPXC6XiA94Dy0omfmB/
         oz5+esQwM8pDUikFSiXGqtFtjlNbjo/z5jzOghWZQDMWINsihSLa7aKuQBwEEQL9YSaD
         QJUw==
X-Forwarded-Encrypted: i=1; AKwUvBzmBF/yknxkwaUpsNLbFG1zQ1DCz/2k4HPuj930yFuKpBDtKmMDWCpLWQMgkMnYoGsKxmyesqEatpHpI/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++ngA+BV9Fd/6UFziSJAFqobUZTnKXBtZ5eERek5NdFktFLwL4uT
	yaC1S6Mp9GJA9WMIN8li/YMm2dxN8vjOXztuhu5ZmAeUYC5Ft3GUvaZP52cy1K+XiIo=
X-Gm-Gg: AYBFou2nlsiOFP8QnxyJAqqDKw1eQ44z9N0aXyOBxnZhrFH7raouZiFW9HKvBXqcNi4
	3hxqyH0i2BNRuj4pMPu0eHDch7/ke2693405AE/OgWwqHYIT53lfAjCX90zFiuEiXzRPckHeSkE
	iysUMLE6PJYbuI0UjJuSGDJdC0ffJ5DqmfXVNYGMe8plTEkmAQxyoSTdIFd91u7cwEL29YSeFr6
	Jhp+d0UnQVXvTypgoPodYBSZna7EJZl2/+oqFu83w2gInRAxabSS2tSUs+HSwELryU7UiF8msn/
	Spb8P/RPnwV00/ng+/Fy6DIL0vzuJpc7ItSwWztsMilYh0F3X8odGc3++4mmmbslZLNi/fcRTC/
	Fg4r6h2Suh+HSZLTY0ApOeFWCOUZXkmnvozcguEHoGxdV48sfxLZRw1WOqCf2KT1rGLh9WwWEV2
	RaPDn9RTkg3aoG7ts5jIKd8T5oBItTfC8KmZNxgBsWb185ZdSH0Lp8Rs854biX6mu/BDD3w9lHe
	2bT
X-Received: by 2002:a17:907:c011:b0:c25:f7dc:2d3 with SMTP id a640c23a62f3a-c25f7dc08eemr348191166b.20.1788512845236;
        Fri, 04 Sep 2026 02:07:25 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8b89sm77245566b.10.2026.09.04.02.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:07:24 -0700 (PDT)
Message-ID: <161c4e19-bff5-4dd9-ab24-10c5893047d6@ursulin.net>
Date: Fri, 4 Sep 2026 10:07:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/sched: cache the timeline name to fix a
 use-after-free
To: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>, christian.koenig@amd.com,
 phasta@kernel.org, matthew.brost@intel.com, dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mdaenzer@redhat.com, alessio.belle@imgtec.com, luigi.santivetti@imgtec.com
References: <20260904080618.2098450-1-malhyuk97@gmail.com>
 <20260904080618.2098450-2-malhyuk97@gmail.com>
 <f25f2a91-b72e-4392-ab53-c11ef60e0fe0@amd.com>
 <20260904083138.2135429-1-malhyuk97@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260904083138.2135429-1-malhyuk97@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


To address only one narrow point quickly, I haven't had the time to 
catch up with the thread yet:

On 04/09/2026 09:31, Jonghyuk Kim(MalHyuk) wrote:

8><

> One thing I noticed while checking the callers: the tracepoints in
> include/trace/events/dma_fence.h and drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> call fence->ops->get_driver_name() / get_timeline_name() directly instead of
> going through the helpers, so they are not covered by the above. That looks
> like a pre-existing and much narrower exposure (tracing only), but let me know
> if you want it addressed in the same series or separately.

For the dma_fence.h see the comment:

/*
  * Safe only for call sites which are guaranteed to not race with fence
  * signaling, holding the fence->lock and having checked for not 
signaled, or
  * the signaling path itself.
  *
  * TODO: Remove the need for this event class when drivers switch to 
independent
  *       fences.
  */


These tracepoints call the name vfuncs directly: dma_fence_init, 
dma_fence_enable_signal, dma_fence_signaled. So those are supposed to be 
safe as per comment and changing them to use the helper would create a 
different issue (can't remember from the top of my head which one - but 
the thread is moving fast so I wanted to reply quickly).

amdgpu_trace.h also look safe on a quick look because they are called 
before the job which can signal the fence is submitted.

Regards,

Tvrtko


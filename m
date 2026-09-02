Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648EE4322E1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344452; cv=none; b=j56LKEsiilX64Wvogvfl5LnyY5K3uKvwg45kQLskX7sQ/iT9zA8aXSZme7aq55ZRFxwqBKfYwYjJPge72PwmvN/zLPFsBNHG/Du7CFAXry+EUnffF5Zfj6dhPR2qInByeQRc6lNgh6547urA2kxBBCc1xQ2sxGqVuZTeEX8nQ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344452; c=relaxed/simple;
	bh=EBGcW/rfj35XVPA+TpwxLPlfmgbQISv5i027lp0B4Ek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eO1JU/hp12IuNA2EvHteSsi/xclp70Z9VyUThbZqNiifO66rL1Yg2eBCLXRM6zxykMUP76YldhtaPsUDKU5hcNJ3Q2L1QSZ1rPhQPMlE3lcl6NvRvZCSxGwNdCXJleQD5g5DxJMAQ6l+sbbJUyOhDCx3DEnsXJY82+06RC2J3mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=gyMBofGw; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="gyMBofGw"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2020421077so122500166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1788344445; x=1788949245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oi/NDwcA0J3U+bwSn6NVnqyGm5srlRNDTSewq/eZdK0=;
        b=gyMBofGwCEc2HfAvMnZZDsPxZgZKaulS1umelP+MkTcTV56QcSE8Ny9zwO7irDbCMw
         FqKOLyymMndLWG3MpWwjcSXWQFL65HUhOQVEbq3NwUj2fOyH+c5QSbvWEzSU9s80Dtzi
         UUXCGgtrS2l60prxFFXy8la3hO0fq0I67Gdfd/KCTQ3VJB4tsGgPmr3MRgmfwVaZScSy
         phIGehNX6iPNcRMbTN+bIbq2NK5KAogc4niWqT+a8YqoFzGC7LwE8aZGVigl0kt/hikR
         Fz6rP5Auq/HVGnio8S5YvmlqXpomLUugHLnSp909RoRJwUzt8Q589098oQgiiQsjYk9O
         LoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344445; x=1788949245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oi/NDwcA0J3U+bwSn6NVnqyGm5srlRNDTSewq/eZdK0=;
        b=VjWdMr/3xH8MPfP/3uXZkkaIUN4+3F1GHssMMO5Q06tk56QYOCKTBT7UKmALG7eh4D
         qD0jjslUzVdamw9rUBJCYAWEjwG9KxhCXQX4SC4MiEjjCVIekzc8iJDlk41KI7cIRCtZ
         97v4Rm7PzFWuzOAOD88LNaXXR8DPdLiAeVK+9/OpBuMhsE075JS0AJ9cfeFjFeLBnCty
         VeYsAokwOStHh+nRi/+CNSkmLFyESCWJ5hZHijjP307iXrf8X730O53qDDdbDnVu8gLi
         EVnziMZSpKwDgoGg9RkXqwbQ7u+Yi3ZJRKyWEGhTs9c5pOlG33JpFL7COrjE1tj+DlEF
         STEw==
X-Forwarded-Encrypted: i=1; AKwUvByLQKRAzo/d0q3vql+dHq4SI0wV1swOmi6hp2AkvfTeoS1TUf79urxLRAeHZfLE0WBt2lYcRFNoX1PoGPc=@vger.kernel.org
X-Gm-Message-State: AFuF++kc3vpHnZhommp7rDSDxD47oqagV8t/mDZk0Fr/+CC8dpIUu56S
	rR0yA6Xgq7/spjjE4LieENM9jYDqCyCrWEGSKyLmgc9HqgTq2FOyW0i8yXijWPXI/hU=
X-Gm-Gg: AR+sD12XlNHpUNtGIASdvOnp10DabpcaRfDlss1nxfxAmofCpzKVuYyIeMe2pYOVYps
	XTj55Qvu143JA2idVDhEgrTZ7fv7ZfQ1kFf0W/Ufpq3/twvw6I4l6M4yrqCIZ4+Ukf02uL0v9Le
	spL/16qg2zkmOpOICZPBimHZvLZAY1mQ7DDJfsxrJJNDM5KNhuHyDIETI4dOV41MtyVNt7ipniO
	RrdDtjX+XOgv7XmK9V0Rr2hohk5xcV7WCqXVRa4bjlQjvkvrIel7MWK+AsxZBqcEBgfULIEW7Bo
	8KpN7sjJWWPvQJoevwocXYCO30u3FTH5ApEzJu3d+suKJmN2MhYuR1WwRFPwyBIaZcPtLADbE8o
	KEzGY+pzjtNElTLPkR4sqflHEnvINj/D4TJ7bICZQrZCGkKXsQ5c8pt+d27lDNmNYrVG55BvTh4
	/i65wHQ4qFINkihjMVtdrtFMmIjg5wEhHrn4Vf7IrIX1PVhloFCW5uWsPLWoeFvrqUy/1SplgA/
	Epd
X-Received: by 2002:a17:907:7b84:b0:c20:d90b:2cb1 with SMTP id a640c23a62f3a-c25d4c90186mr231285366b.0.1788344445336;
        Wed, 02 Sep 2026 03:20:45 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc68a2sm107135566b.11.2026.09.02.03.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:20:44 -0700 (PDT)
Message-ID: <619669b6-69ea-4aa5-b91e-b29cc788e335@ursulin.net>
Date: Wed, 2 Sep 2026 11:20:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/sched: cache the timeline name to fix a
 use-after-free
To: phasta@kernel.org, =?UTF-8?B?6rmA7KKF7ZiB?= <malhyuk97@gmail.com>,
 matthew.brost@intel.com, dakr@kernel.org
Cc: christian.koenig@amd.com, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <8c2a4df5-37a4-414e-81e2-cd97218e5355@ursulin.net>
 <CADQRuqtjBu7wR4kKVDcS42KLKQTr+7SBtRn24mgZ+ApettMr1A@mail.gmail.com>
 <b8f98b9e04c9999008bcdec270b14247e3cd18d0.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <b8f98b9e04c9999008bcdec270b14247e3cd18d0.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


To collate two replies in one:

On 02/09/2026 11:07, Philipp Stanner wrote:
> On Wed, 2026-09-02 at 02:57 -0700, 김종혁 wrote:
>> On 02/09/2026 10:46, Tvrtko Ursulin wrote:
>>> It is not guaranteed in the documented contract that the name passed to
>>> drm_sched_init has to outlive the scheduler.
>>
>> Right. Caching the bare pointer only works because every in-tree driver
>> passes a string literal today - xe's q->name (freed with the exec queue,
>> hence 299bc6d50b1b) is the counter-example where v1 would still dangle.
>>
>>> Hm, that might be overkill.. how about we just keep a copy of the name
>>> in the scheduler object?
>>
>> The catch is the scheduler object is itself freed on context teardown, so
>> a copy that lives there dangles for the exported fence just the same. To
>> actually stop dereferencing ->sched the copy has to live in the fence -
>> kstrdup in drm_sched_fence_init(), freed from the fence release. That's an
>> alloc per fence on the submit path though.
>>
>> If that overhead isn't wanted, the lighter option is to keep the pointer
>> and document in gpu_scheduler.h that the drm_sched_init() name must follow
>> the dma-fence safe access rules (outlive any exported fence). That matches
>> what the already-fixed drivers do and leaves the submit path untouched.

Yes, thank you, it would have to be this then. We definitely do not want 
more allocation at fence init for basically a debug only / logging feature.

>> Either one fixes amdxdna/nouveau/msm in the core. I'd lean to the
>> documented-pointer version unless you'd rather pay the kstrdup - let me know
>> which and I'll respin as a core-only series (fix + the kunit test).
>>
>> Thanks for the 6bd90e700b42/299bc6d50b1b context, that clears up what the
>> half-fix missed.
> 
> 
> The issue here IMO is that we are discussing working around an issue
> that actually stems from dma_fence not being consistently synchronized,
> notably because of the ops->release callback being implemented.
> 
> ops->release is de facto deprecated, precisely for reasons like these.
> 
> If we could get rid of it for sched_fence, dma_fence would take care of
> the decoupling of the name callbacks.
> 
> So that appears worth investigating from my POV.

I completely agree here but I am just not sure how feasible that would 
be. We may accept to live with the cross-documentation workaround at 
least as a start since even if feasible it could be a lot of work to 
change sched_fence like that.

Regards,

Tvrtko


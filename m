Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43E843F8CD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777280; cv=none; b=ODHaA7cARLflFfc7Udj1uSXVkgm3W/9mWBzWVx15P3JgjD/u2vjZsuSrz3Fv1Up4PJtCGKYDKWaFteZQaPJpXsFbgEpSL8ZcpA5obLE6cEuB+5gEoJyhdqLbzxj4H9sNPOUu02Ex/1+f8g0c3po+weT0Fy+T9aCaz+usJ+v/xmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777280; c=relaxed/simple;
	bh=jFpAo7i529GMRvwEedXFKqgtoTVh//GOmUce7AX7C+s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=h0z721OKkZdujE11igi3Tm1X3MxRjYQyfagVt4fz5EFvOVilBmnz0qPPLOY0gx/3MiobJ/cHb673u/szqQv6ulxrGYqLr6uttBU72iqZS5F7VY0DuQ5m39TOKddLLMT6MTBK2ZN0g78Ua5NpGVEn3Ldm0xG3D339GTHwdT++Qzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=OlzG46hW; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="OlzG46hW"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a63c610b8dso4415737a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1788777277; x=1789382077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B+Aa6ObNtsWuLVnK07xngOY/Mvint7kr6yr+j3fGmn0=;
        b=OlzG46hWqGVlMt8HOlGeLzFt2jBUEcLbINmYcHyb1c/Rmgc54i75rNDBNaskIiBLsD
         Rptup58sd4m+i5r2pv80uck92X2ax6U+0I3kDUKXjAkb4KfCfaes4nQVpy3ZuGnOKNPP
         txEJTqTyqurjONcGbYhqtZ61qEFQBG+sy6uZi+oDBrlAKGR/P92xvKcRUsNURMeyI4hZ
         5sVzeoy+wEN5aXlLkqvyRwk4WyaeoJFUvXwQq/ABUTSAJp9zPhDMJvC0RGw3ZQdTSMy3
         uv5FbtO/+bOhKuSmfJ3c5hA3FUcaEj4o9FbEcAb4oeeF0devXK2EI5+xUav9GlFR0J+6
         D0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777277; x=1789382077;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+Aa6ObNtsWuLVnK07xngOY/Mvint7kr6yr+j3fGmn0=;
        b=O8wvjoJy9BRmjRHEehck0J/7hRmKsw9ylku3/6OGuXttjo1g0uHJpEjQa1WJRsWP6d
         iL4hHjLGLnZ47t80yky0SEXWPEOoq+soCflNZKduPGmkECNZ7BPCwXmS5AICyaeQQJ0o
         ydFplfcHIduY/KvXb1RZrhBU36Wqbny0eZfLh4+osUtDeQ4B3e/TezOhhoy5i35hHujR
         zsPMC/9v2+utRQgRAep15zd7cwF4G4qd659NSUpJCgIVEpzsCx72BB6uhOGSFk8WVMNh
         bHJg6Pmfr0eYL1OpzoI4pJOnQpPE5Va3irbgPlxI4kVV+dLA3eJ44WoiROGHyzr2qA46
         x8QQ==
X-Forwarded-Encrypted: i=1; AKwUvBz00d/G+JwOGzKx4w6WNcrh2oHFzaVGmJjguAy+s2aASVC9boWc3ges62HGL7z94oYPqZ+qFK+yFM1HkBk=@vger.kernel.org
X-Gm-Message-State: AFuF++lNHt0BqXBTvIlAdISopoYQBoKhvKmHKrPqUzV053pXauhNhkNZ
	ZVXWQL+vAGPik1ou6ugvlrElxTYzNFRNul7aYooUzOvZ+tcE9zk6EHMndL1AS5BS3X4=
X-Gm-Gg: AYBFou1zVnn10x7QUjpN2lyey90Qc2PS/bD2D31TkiFhYIWjrWK8a7R5iKCB9dnVrlW
	nh88Q7l7OADr40abIFLK0r7439qgPc1FbkhsI4qIJqKO0pTw1r3zU22dHAcXkbW7RTLAvD5cuXn
	oUfxuJqUv/s+E1ACM3s7Ew/Dt+c5CCGFUtH5rTXYUjbFhyyno11BMN187+kAhPdXvJEMwTxD8c+
	1glL4107+2YKUDDgqkdyhBKqFiCvrAAWv1nboCeKmvjNK6CSsZ8zDwMN73EjswF5Z2+KBAto7vE
	Ug8WAB5sDT28cJA4Bpo+mI7leaUDawGxS4Hp2IHX3o+06kdCCRcrJBX+cwvwco6bvxAno/33NG2
	E+oN6y3YtWuZ+FKCujquYynKQcyQLylZZzuJlhWzqg5i5HMNvoFUpcwCxY1aOCfcs4aTWVPByXg
	WvCYct633kJZPSDkruXq59NEDf5KphttgpUcGPDW2DhZubREHZi5OSzQnmbVHtrgzp4iwT//8eE
	Rmq
X-Received: by 2002:a17:907:72c2:b0:c25:2e93:289e with SMTP id a640c23a62f3a-c260ca19c04mr1482747566b.16.1788777276733;
        Mon, 07 Sep 2026 03:34:36 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cfaa2sm450462066b.59.2026.09.07.03.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:34:36 -0700 (PDT)
Message-ID: <7e98c872-6eff-4eb5-b53b-aedaf0fcc7ff@ursulin.net>
Date: Mon, 7 Sep 2026 11:34:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/sched: cache the timeline name to fix a
 use-after-free
From: Tvrtko Ursulin <tursulin@ursulin.net>
To: phasta@kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>,
 matthew.brost@intel.com, dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mdaenzer@redhat.com, alessio.belle@imgtec.com, luigi.santivetti@imgtec.com,
 stable@vger.kernel.org
References: <20260904080618.2098450-1-malhyuk97@gmail.com>
 <20260904080618.2098450-2-malhyuk97@gmail.com>
 <f25f2a91-b72e-4392-ab53-c11ef60e0fe0@amd.com>
 <ee27d37269f609192cdfd7a217d9731d7dca04c8.camel@mailbox.org>
 <a41a35b8-c78b-4c18-af11-26374918f222@amd.com>
 <7e4497506bb051fd1c25ed54f88a8036084e779c.camel@mailbox.org>
 <81e51d72-d608-46d0-a986-390ecd6f468a@ursulin.net>
 <d3d2ae0ae55fb07780f643de9517f3668484575a.camel@mailbox.org>
 <47464619-890d-484f-986b-9a6c06cd89b0@ursulin.net>
Content-Language: en-GB
In-Reply-To: <47464619-890d-484f-986b-9a6c06cd89b0@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 07/09/2026 11:28, Tvrtko Ursulin wrote:
> 
> On 07/09/2026 10:42, Philipp Stanner wrote:
>> On Mon, 2026-09-07 at 10:15 +0100, Tvrtko Ursulin wrote:
>>>
>>>
>>> On 04/09/2026 20:06, Philipp Stanner wrote:
>>>
>>> 8><
>>>
>>>> If you can think of a stupid and simple solution, shoot. The only thing
>>>> I can think of is moving the string into the dma_fence, as a hard copy
>>>> :)
>>>>
>>>>
>>>> In the mean time, my proposal is to keep aiming for removing
>>>> sched_fence->ops->release and fixing pvr and amdgpu.
>>>
>>> Fixing the drivers sounds like an obvious thing to try indeed. Along the
>>> same lines as it was done for xe and panthor. It is an already
>>> established and well understood approach so shouldn't be controversial.
>>> After that we can discuss in leisurely pace if something better is
>>> possible in the scheduler core.
>>>
>>> I understand its amdxdna, nouveau, and msm. Was it attempted so far? Is
>>> it significantly more complicated than it was for panthor and xe?
>>
>> How did the others fix that?
> 
> Combination of kfree_rcu, synchronize_rcu and storing the name in an 
> object protected by those:
> 
> 6bd90e700b42 ("drm/xe: Make dma-fences compliant with the safe access 
> rules")
> 299bc6d50b1b ("drm/xe/guc: Keep scheduler timeline name alive")
> efe24898485c ("drm/panthor: fix for dma-fence safe access rules")
> 
> Not too complicated on the overall. Simply ensure RCU grace period 
> between signaling the hw fence and freeing the ops, scheduler, name, all 
> that it is in the externally accessible dereference chain.
> 
>> If we look at nouveau:
>>
>> static void
>> nouveau_sched_fini(struct nouveau_sched *sched)
>> {
>>   struct drm_gpu_scheduler *drm_sched = &sched->base;
>>   struct drm_sched_entity *entity = &sched->entity;
>>
>>   wait_event(sched->job.wq, nouveau_sched_job_list_empty(sched));
>>
>>   drm_sched_entity_fini(entity);
>>   drm_sched_fini(drm_sched);
>>
>>   /* Destroy workqueue after scheduler tear down, otherwise it might 
>> still
>>   * be in use.
>>   */
>>   if (sched->wq)
>>   destroy_workqueue(sched->wq);
>> }
>>
>>
>> We see that it
>>     1. stops accepting jobs from userspace (not visible here)
>>     2. waits until all hardware fences in this ring are signaled
>>     3. only then tears down drm_sched
> 
> I cannot do a very deep dive into nouveau at the moment. I see fence 
> itself is already freed with kfree_rcu so that's good. What is reachable 
> via the timeline name callback:
> 
>      struct nouveau_fence *fence = to_nouveau_fence(f);
>      struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> 
>      return !fctx->dead ? fctx->name : "dead channel";
> 
> Fence is presumably the fence so channel. Chagning to kfree_rcu in 
> nouveau_fence_context_put() there might be enough for that one.
> 
> For the scheduler (nouveau_sched_destroy()) the same, kfree_rcu.
> 
> That makes scheduler timeline name vfunc safe:
> 
> static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
> {
>      struct drm_sched_fence *fence = to_drm_sched_fence(f);
>      return (const char *)fence->sched->name;
> 
> sched is then RCU protected. sched->name is already static so not a 
> concern.
> 
> As you say nouveau_sched_fini() only tears down the scheduler after 
> fences have been signaled it seems adding two new kfree_rcu make is safe.

P.S. Idea on how to test it from userspace:

https://patchwork.freedesktop.org/patch/642709/?series=146211&rev=2

But as nouveau does not export via sync_file you would need to adapt to 
export sync_file from syncobj.

Regards,

Tvrtko


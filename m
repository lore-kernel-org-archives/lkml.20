Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4443B9D86
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779220; cv=none; b=BvK7fqD9AlZasmKZLafK19YCFY3qv4AVTGMqchR1X0xUVY1M7yTXwPe2Izayaig9zxUWPtix0P0BpBYgLAX+jaAOQ8bP4CB2TnaaHz/e8IKYqdAVrAgESYYJSdjcylF/vZc8t83TWPU85qyeGeYM0NeasTvhr/VgHc4H39qBJl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779220; c=relaxed/simple;
	bh=SkJijX5PGytK0Frv0r3Z5amD3TzfjeVjS1vVD8M1Ods=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1gKKq9uZ0d22hifrQb1bMnef3PULNIRi7okl5cm9ooOUJ6WnhzvbS3vXyqlI4PuopCMLpwePfKqUnWNCoQoATel1k+uUAj7kBYQijl9TD2+7E8qRbbfyYqHN80ZZvvz06b5SGEU3SdaGaBRjxR3sSJKdUU3iQ9ww6SO/FoHbiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=Z6QKIE0p; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="Z6QKIE0p"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so314443866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1788779216; x=1789384016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dhAjW+vdg6oBYt2ixKDAKgKvkSQhUYU9D5adc0m7hns=;
        b=Z6QKIE0pJf6vSKxy08UVsdNwuKJUY1ywu1+wgRknPqcfPVwQOXsB61AgvWh4PoJ1/y
         +gIGeb6e/ZVb9RcWneoMzrvp8DhzRH6ugxDiEWAo5Sa+lc0BTOyJBaluq6Mu7xiDp3Hl
         PX4nPW/Ehki7O4PxvRSkwjqmCx/DbWh32TqpLJbOQ+4+Ad7cpfjGZVV9i2yqq/md9kx5
         /8DjiPZOfRXwpG4b3BBk+6xXdFlUYMk3XIn84eSy86R0UdDx4x296EitK9Eay0lGrM/v
         z11/dVkBLRKzihAFrn49raropmw2CwHJR+O8kF5bzp1FZIlaqYKYNi+xG9aJAdh8CsHf
         eygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779216; x=1789384016;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhAjW+vdg6oBYt2ixKDAKgKvkSQhUYU9D5adc0m7hns=;
        b=m52w/Ph61Hjy7fQWXgl/OjzsrmtXynbZnP9354Lp9UeMIzX/OEBZ1RR3Yi8nZtlQBY
         7A3kucCbeZSBjzxPluj/pmFsSZR/LM0u0fUbeBwQnYvR68ll7TMMEEp+ADIURJmCVvfb
         8vYcJPxtAxgUCGkdSV84ImkFxVSwaZSrVFima9XiUge0WEOf0LcqVuL4hCvzRSPwLn0K
         qal7POc7IwDH5MOH8nfce6xSoqrMAXe3fhJLt15bq+/kSJ6GcFMo6svjKEMXpB9IY/68
         Oq9vfV+VrbEo1trhW+YVMQXHiP9dqgXxI+1OydUWIpyI5lu2xV3mcks+vse56r7cbDMX
         5veA==
X-Forwarded-Encrypted: i=1; AKwUvBw44dTG/4PL+w4ac5LjBk9IZc2zX4yhnz/8l3M7vAnizeJcHdgrFLvXkcN23RRJM0XlNq7+zdMF5lNMKcA=@vger.kernel.org
X-Gm-Message-State: AFuF++l7g5dQ+nygX4xCR7oWdnj+lhALYS6AQzu+v72jMiPxOFdZ7iFr
	7gGQmOrFZkwZtYofbzGQfCsS9tTBCE1XrgwDkDJjzNDrKUy2LWdpXd/LAgJMG0ZaFco=
X-Gm-Gg: AYBFou3zlU7xR8TP8cA4meerv5RsNBZvKT+oFCJe+0QwgyhMc6vgAs6AJo0GNzt9yry
	moTIvgHQDL0zpAMOp6VLC6LddaEA3X9rS5elA7cidxPoqTXexXC9UnYHRmugsrKPLlPA45hNPK6
	aSrf7Rjmf5O4v3hQrNgvc4WJUQa2svp0zriywBh3YkvrToVA/0FPo6K/mHbVRe//1YlNVKPouuE
	fIeXcDA0Wy3Jb2DCwOxx69KPuZnOKTOCFpEv5M2eYD4Q2cRs1DvHQFtxCG/vWoCZ/NQ9PFfDsL0
	V0BMAbMbdGtBvQ3BAECWFGhgmqiYRzcSCYx2Rv9xngjRFeu6+Ut8BajCsy76+9OVVQ5ek8uU8sa
	o33bUuomB1mPnWrSuVFNRTwouH5e7DxcOhvg1ZFO+6KIpU6mhtv7Mk75HyzvuCRaBzHPQ8a26LQ
	PHBdYgUTXAPD3VMUljb3gWQqBBlcxo+37v1+5ZTcHg59wOiz9u2DVSd4GNSgqCav+hI89porqQd
	xcyUORL6EYTatA=
X-Received: by 2002:a17:907:3f98:b0:c26:19e3:e986 with SMTP id a640c23a62f3a-c2619e3eef0mr722713366b.38.1788779216293;
        Mon, 07 Sep 2026 04:06:56 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca88fsm290331366b.17.2026.09.07.04.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:06:55 -0700 (PDT)
Message-ID: <2aa58eb8-a33f-45b9-8ee0-518d72160f41@ursulin.net>
Date: Mon, 7 Sep 2026 12:06:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/sched: cache the timeline name to fix a
 use-after-free
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
 <c3434f0a80318390d183a3a2f8f8fb3ae71c9906.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <c3434f0a80318390d183a3a2f8f8fb3ae71c9906.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 07/09/2026 11:47, Philipp Stanner wrote:
> On Mon, 2026-09-07 at 11:28 +0100, Tvrtko Ursulin wrote:
>>>
> 
> […]
> 
>>> How did the others fix that?
>>
>> Combination of kfree_rcu, synchronize_rcu and storing the name in an
>> object protected by those:
> 
> […]
> 
>> For the scheduler (nouveau_sched_destroy()) the same, kfree_rcu.
>>
>> That makes scheduler timeline name vfunc safe:
>>
>> static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>> {
>> 	struct drm_sched_fence *fence = to_drm_sched_fence(f);
>> 	return (const char *)fence->sched->name;
>>
>> sched is then RCU protected. sched->name is already static so not a concern.
>>
>> As you say nouveau_sched_fini() only tears down the scheduler after
>> fences have been signaled it seems adding two new kfree_rcu make is safe.
> 
> 
> I don't see how any RCU mechanism would make anything here safe.
> 
> As long as ops->release is implemented, ops will never be set to NULL,
> (with or without RCU) – so everyone who holds a reference to finished-
> fence can still run into drm_sched_fence_get_timeline_name() and cause
> UAF on the sched pointer *and* the name pointer.
> 
> Moreover, all of this falls apart should the driver unload.
> 
> So I maintain the position that we only get it right by having the
> signaled-bit be the decoupling point.
> 
> Or am I missing something?

The driver fixes you asked about and I listed work(ed) in the context of 
506aa8b02a8d ("dma-fence: Add safe access helpers and document the 
rules"). In that "world" it would have been safe. Did 035219a760ed 
("dma-buf: dma-fence: Fix potential NULL pointer dereference") break 
those fixes a bit?

I can try my IGT and see..

Regards,

Tvrtko


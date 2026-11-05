Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869970;
	b=xQS1akS4PGEewXNnfFGmKYWx8tzsgxTKBGdkDyBgLyn71b2Y/Kldad36SmN1qHR1a3Va
	 MBAvhO6NhzQ6IakuI3KmhPEODLBBCXkm6QdYv0toG8KZAQh9nuHQL0bPBRs9bDTrXYJe0
	 uq/+eE3W6HX0lTBFiE/IzElzo+70YtbNuuhkfjE3HodPR+fz53nHGaqvTb7yHx0sT4UgP
	 w0lK3/LUeuymGnj8gxebLKbC7sShX8iMXldKEbp1wpNPUUeJO73rYVXMz8kZLYA7B2C5c
	 ZJ8shuFRr6rgGvD4PoRsshHhHi/L3LuMWVaaZVoGekT6G4ozr8VbMkFZKkTC4+rAVxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MSpuKsAi67Z9mDW+vV5cUezACEgkCzamTDE9W9vtWQk=;
	b=NYbap3MM6+OD8KLmu1Pa131cHNfB4PyvPeXVJMiJCWQneNRIC6Y+McVP2yag8wa3wmtf
	 2hbWEAq3/y1URjMmQm5hUvk4Hlu1FWSKMKiSnkdN4ENFUW/3iRwgruE6dCcMUwXXYBtAm
	 oGyWadrWLcRDELYUbjHW+VPjtKVg/uyJAQ9nBte05E0nvWOGyyqZowLnUswwxoLkmGxGN
	 i7WD5IAr5hDHvq04XHnTKZ3UnC/wiJkJbs0yTwPZDCqQgGLrHKWEsHNDGXKHcudLlysAu
	 KAqYV5+q8xDD05oNtAnaNgNdvEB91DAXBh4dAhPS5txwe3WiTHYhTKS3bDVQMTJg7zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ursulin.net;
	spf=pass smtp.mailfrom=ursulin.net;
	dkim=pass header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=Dq03R32X;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E38B606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E38B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=Dq03R32X
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so12342115e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1793869968; x=1794474768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSpuKsAi67Z9mDW+vV5cUezACEgkCzamTDE9W9vtWQk=;
        b=Dq03R32XcNlkuTgzgGWLlb4WsFLZ2Qx9NAXLcyuNx1JVnnbdecm2eYNAXvWA38NqVY
         gcL42rwYcechSFCrSxxMqWLkTpu/Xu6XtuWG5Kb5WEK3LsgwaQWSGVXaJUcm0/6WC2rT
         hjfKqTbjGyAzd5pFgbsVXwX24K6dr2WskIHmFkkt5DD5qrZZR4XhVciu3/PLIBS303rU
         2hB47mFdQGpV6yGzxfjdrfIGN0uTFjRW3NKc7hoMLlUVqT5/rSemd6NaNawgqRrRSiMo
         UwHg74wPJ0lSAK6YSKSiRW5F0iswmoOA4i25dWRJPmhnoy7eyPF0k7FaM9G6wYIhBY/y
         GZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869968; x=1794474768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSpuKsAi67Z9mDW+vV5cUezACEgkCzamTDE9W9vtWQk=;
        b=E+CtAKYKhvwaeMlzzBEFBFLIJFx28KhmWInRX+Deiraex1QNaWhhCJesoWDJAEha9G
         /LMvfbQusBr2Ch8xRLIUuFzHQKJCgdPZLUNVZZ53PN2nsaVKkNhZTvlRvJO4pKbTzD6G
         PiQz+2hzk4u8i2+kh0z07h+y96flCANwV4oVjuLeRDv6Yvbv8jGClbl+RIoi1bePxhYN
         B9zHBIdLCKcJ6ZJTkvEaVq5hWO0a4NZvi6CgqJ6nb93W5f1IJO2BewTJz87hOjxzNzcm
         pyv4rr6CnYcYDl5cf34k0rT/naWcRjIv3dRDwSHsK/ICIFG2uYPe8Uli7y0ofvSmr9L4
         fyzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxy+dFvKWwiYAsaxhrcoj2EFCLLDgh92ClC8OczOY2PIQP6ZuSXS86f7EAstGr0vozhDDWqBRip1QdOnZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZjFjnPLqKM41w6nDC7+AEabtd72O2pwlLGHQKoScMrju0lrG2
	SD7s2ez7UAgn3go76B6GjDXY3ufy4iKQjtJV4vwulbZG3pzbSvqB9VyxXEIaRRVILo+PQ2idbR/
	nFtaWGuQ=
X-Gm-Gg: AYBFou10/VyiW55SkNOM118gTC6VHtDggbSZylDXGXMvpEu/yKJ7IEnc1gpHWSKx083
	10bV2GIf8wd1vtJl9TZy4Sarhge3h5pII7Q3vNhTMBFgBu6F9AhEpAYnQ1FCgc3IyiJuKpsR3dQ
	ZyCbWC8o+CsUlITagWP0W542ntkmimUTedTyy3pY+nvWfyf6F5SUPKpd8yXtx54Fq4+zTryV0W3
	cjAl8J8oKtr8qZIbFUVEsxSfOpFf1j0tYIkVYQBI4dhDm89XmSrwtnGCr5pucrePh6kgR8o7HEk
	FqEFrEY2t4zHGT6/StRfrGZEchME3MVkAzF9Qd4YMiOIRfLZmkMyzsMdNbEoqm+G/yyQPU9SQFS
	U4P8QCXZ8VRjyo98+DR7QAElXsJaLgxyjcetZLp55TF079CVWiqTIv6K6VqHwKeSfjy0bBbhgcv
	n9bOyHrep0I/TGvluMw7kP/ZzU7zvp4s5oD/Fr1wWDizzmIvOFRUOn44UG6d811f2S1lnWn7lVm
	sh0JbDtdDpZ9ppblgvY/2D+yv9qDxkbfixLWw9sfC12CYoVP69ynhc3UzG/LMIVfcr98EW5EQ2K
	bUnmdoqEv7gEb5cO60J6S/PJzYsNHJGWLvCNBo656Qa4ink+8Ht87ZN52Y+s/PF5FQ==
X-Received: by 2002:a05:600c:a41:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4ac150b2136mr386865075e9.4.1793869967465;
        Thu, 05 Nov 2026 01:12:47 -0800 (PST)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99d67sm9014875f8f.24.2026.11.05.01.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:12:46 -0800 (PST)
Message-ID: <9c1805b5-06ae-426f-b286-9bbd43538afb@ursulin.net>
Date: Thu, 5 Nov 2026 09:12:46 +0000
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
Subject: Re: [PATCH v2] drm/syncobj: Limit the number of handles and use
 kvmalloc for user-sized arrays
To: "Yu, Fei" <fei.yu@intel.com>
Cc: christian.koenig@amd.com, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, madhurkumar004@gmail.com,
 mripard@kernel.org, simona@ffwll.ch,
 syzbot+95416f957d84e858b377@syzkaller.appspotmail.com, tzimmermann@suse.de
References: <39be711e-cd56-4a04-87ee-6aa2a0b69779@ursulin.net>
 <20261105081845.1230910-1-fei.yu@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20261105081845.1230910-1-fei.yu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 05/11/2026 08:18, Yu, Fei wrote:
> From: Fei Yu <fei.yu@intel.com>
> 
> On 04/11/2026 10:27, Tvrtko Ursulin wrote:
>> On 04/11/2026 09:44, Christian König wrote:
>>> On 11/4/26 04:09, Yu, Fei wrote:
>>>> +#define DRM_SYNCOBJ_MAX_HANDLES        (INT_MAX / sizeof(struct syncobj_wait_entry))
>>>
>>> I really wonder if we should put that into the uAPI files?
>>>
>>> Not that userspace is potentially using it, but this is part of the uAPI
>>> and makes sense for documentation purposes.
> 
> I thought about that, but I'd prefer to keep it kernel internal, at
> least for this fix:
> 
>   - The value is derived from the size of a kernel internal struct and
>     from the kvmalloc() size limit, so it is not the same on 32-bit and
>     64-bit. To put it in drm.h I would have to replace it with a fixed
>     number, and that number becomes ABI. We could not easily raise or
>     lower it later.
> 
>   - Tvrtko's series below avoids most of these allocations. Once that
>     lands, the right limit may be different, and an internal define is
>     easier to change.
> 
>   - The patch has a Fixes tag, and keeping it out of the uAPI header
>     keeps the stable backport small.
> 
> For documentation, I could send a follow-up that adds a sentence to the
> uAPI struct comments, saying that count_handles above an implementation
> defined limit is rejected with -EINVAL. That documents the behavior
> without fixing a number. Would that work for you?
> 
>>> That kvmalloc_array() + the following copy_from_user should probably be
>>> replaced by using vmemdup_array_user(). But that should of course be a
>>> separate patch.
>>
>> Btw I tried to do that some time ago:
>>
>> https://lore.kernel.org/dri-devel/20251106132645.28208-1-tvrtko.ursulin@igalia.com/#t
>>
>> I have as local, more recent version which applies, but apparently never
>> sent it.
>>
>> Interesting part should also be the other patches from the above linked
>> series which avoid allocations altogether for the vast majority of cases.
>>
>> If there is interest I can re-base and re-send after this is merged.
> 
> Thanks, I wasn't aware of that series. I'll leave the
> vmemdup_array_user() and points array cleanups to it, so we don't
> duplicate work. Happy to test it once this fix is in.

Thanks - just to clarify though - I understand I wait for your patch to 
land and then rebase my series, right?

Regards,

Tvrtko


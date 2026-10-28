Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207020;
	b=vqS+an8jkiSjATUucAWB/aeHPBvsZQuUYGvWnyMHIO6FxG6NheeV42Aee1JBesd/X5LD
	 8azApOT32RHffOgTC30Iqtv+6oWiQkItzabvab9JpzbPN4tQMekkU19j+9N/XytzF+Adx
	 nx1Jvnn6lyFZdDLWxLbVp5X6ubZjaIiCuIe1sAIjRy8IxzU95wGhWLiP1NCa7xNP59uhm
	 cdkt+zWLo+cz3lHSxNUyA5OwclW1vPpr30TYnNe/LYAsdbk4dItiEKkUSd+KP/raqrfUE
	 ifCctPh/7tSAghDotrh+FgwfbFgPJ+ALyJ4GXKbSBf0bUkO+5iR2kHBm8sXz5KjUrHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DO/5rN8t06lVCuIKT6Pz+YWotCVnUOjfp0iAhj+HMRg=;
	b=cgOLX10mRq7L4V8TtGlmwAS23PanNGlJ4Scc14STAncuJHJSeYGcQPEkPDcSZQdOGQ5A
	 BP/9eELmGzkOQltBRaX2I9EePaNUAAJNUcYpvNLzggosLAhtZiXjrfX1EoSOVvL+Z29Ni
	 GD+g51ivGVZ3hmHbrvHc1WGoEYIEAmnf2rljSC2XN5gRC3xeEq0CJaAnMeYgE8gGXTF3G
	 Z63MDKN0lH1AkMgTM3JNLcS4n6Ibb1S9YYiJv2Ga+oIZGylwnbW1Pn2HNeGC5UsDCSt+S
	 6FgAD4vG1oGfI5o0C+KG3YL4HzQ7M95mTF6e+y900SWj1u8ZgDHmxJIw6U2wZRNLGdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wh63upBh;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD6C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD6C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wh63upBh
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so192381966b.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793207017; x=1793811817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DO/5rN8t06lVCuIKT6Pz+YWotCVnUOjfp0iAhj+HMRg=;
        b=Wh63upBhKqln1Dt0rWPscluGhXAz6aZc8Mlo6+SFGXkxnjnAB+dDcYrmn4lRueuAJz
         QgQXJ5TznTgLv696roqARD6qiqrA9WOvsRldSZ1Nl8K3vW7z9nVrd+vg9J5d8I8NX5De
         LlzM0Jzk9R+NDW9gEs1pqwPpMw7RmJmK0rbYrpjAhUWwghUEbbUvY9LeBmfEVUeqwiTX
         4i/NAPLA66XFMzLOs8cph87ZNs65VLLFZfXaFQyy5O5vvJItM/+dfcmgFDRsryQmkPh9
         SdrPkNM7z+/o3nlE8wfm+G9JVu9Wste7YWFinxPsXiDrPO4RCJTKkoT/kEWixB/TMUjM
         IddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207017; x=1793811817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DO/5rN8t06lVCuIKT6Pz+YWotCVnUOjfp0iAhj+HMRg=;
        b=tRuR3W06GtIamw7IVElc+I140mhTqOSpiBTwghnJ0Xxu/ElhC2xoaTtE8SvBB/hBdq
         hXpzjpHiIprI0hOoXpzIKhMkMVDCrzdU+sc/vrSSTWQ1VV75m1jDSPpv623wh6DxEPjo
         7uZfcxgXJ7Nekm7dD984TxEKi+507jMHwgY3g4YAQkwbqwW7sKWv/cSimhfmhc358fOk
         yZKna663hMBW3s/FuIsk+Tm2Qoo25B2z/iI/86gWWGoehIyqeTnYbSlAiePeH+q4G0Sq
         SWPO/SXjZZUzu3yCw3rovVFwo6XC57GhKKQJBgih3FDHewJNfka4CMhBw2CNdzZWwLHo
         JiGg==
X-Forwarded-Encrypted: i=1; AKwUvBzMdKp4fG3RUE5r3AfoDfoCH7lDJujTYDacxVn1FDoK68Fh7i59pA9uACc2HhjIUt2pFDn9KZaDh4SK87M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBNbq7r6hopWMBWUQuCY22BoRxQZp0aWl+qUKiAgmYqYYQ35uq
	eo5gte61Kfq4qdSC4my+VNJjGPbyPilTP2JKliUBjPb54pTwMRQTKFSm
X-Gm-Gg: AYBFou1HH5gc7S5wr/N3AB2U7zgj3F3tYvPeQqrhdhCbYQcAvun70YoKASRgw/ssmAa
	i10f3XoIsfbn//PQ00z5/Hy2g2FE5PqoVVrudLWBtFySKlFs9OtHVAorExsTfHA5G33Q1PBUCja
	w6yVRZ4hokw55ZMKt1UWSm4KAL0U7/FuTz4KJrRUyE8BlTdqB7fdo8aLLceTbSBRheMaUOTDLGe
	eFgHxi8Og/aUQHsHwDVkG/e/jihb0/Rfn2sCQn/pTkj0Y166ctQfBnJ1GBy1QJzzP581FB9spq1
	kuEBm5fyJYMsgAJ70KXu5/wBzGp9Kw49hwMsW0IpwmqOi9KCwCsuQKvTfqquQG6oq+r6YbeAQ5u
	egxOqBrGfknhyYdNYe1uLQVld0gvZU1o2GjEIOxzd7JUTWEcmFnZcwbrGMwsVw1DDmCkm8B+pK8
	K9KnMBhj86FwqdxiOLuaGbbudg0ohFe8eEX8NnpaT1ML/o3ScTaf1naI1i/be4FLKObsSOO2pGA
	jurdglsfc6QNJ/6pYynUVhGUdTrYfTAvEBtpBtGtX3RMJajoGqHbGONqXonQOSnvCkAiuWS/mvq
	rsljiFKoS/0j8NLZUpGTGLfKYBiNffhse/sIXsDEVg==
X-Received: by 2002:a17:907:fd18:b0:c29:659e:2fd6 with SMTP id a640c23a62f3a-c49bdf2ba80mr270930466b.10.1793207017356;
        Wed, 28 Oct 2026 10:03:37 -0700 (PDT)
Received: from [192.168.0.24] ([195.136.82.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd77e1e9sm635884766b.67.2026.10.28.10.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:03:36 -0700 (PDT)
Message-ID: <af0c6729-6859-40e7-bb55-33fe67fb5c1a@gmail.com>
Date: Wed, 28 Oct 2026 18:03:33 +0100
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
Subject: Re: [PATCH] dmaengine: pl330: drop only the runtime PM reference a
 channel holds
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261028-pl330-runtime-pm-v1-1-f0fb5c34a7c4@gmail.com>
 <auIIIC6ATpcJgDTM@SMW015318>
Content-Language: en-US
From: =?UTF-8?Q?Krzysztof_Soko=C5=82owski?= <krzysiek.sokolowski@gmail.com>
In-Reply-To: <auIIIC6ATpcJgDTM@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


W dniu 28.10.2026 o 15:35, Frank Li pisze:
> On Wed, Oct 28, 2026 at 12:28:11PM +0100, Krzysztof Sokołowski via B4 Relay wrote:
>> [You don't often get email from devnull+krzysiek.sokolowski.gmail.com@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> From: Krzysztof Sokołowski <krzysiek.sokolowski@gmail.com>
>>
>> pl330_tasklet() drops a runtime PM reference when the channel's work
>> list is empty, without checking that the channel still holds one.
>> pl330_terminate_all() drops that reference too (power_down =
>> pch->active) and clears pch->active. If a completion schedules the
>> tasklet and a client terminates the channel before the tasklet runs, the
>> tasklet finds an empty work list and drops the reference a second time:
>>
>>    Runtime PM usage count underflow!
>>
>> after which the controller can be runtime suspended while still in use.
>>
>> Seen on an RK3128 board (dw_mmc using the PL330 for SD transfers) under
>> combined SD and USB load, where the dw_mmc error path terminates the
>> channel; the underflow was followed by "pl330_update:1678 Unexpected!"
>> and a failure to request the DMA channel again.
>>
>> Take power_down from pch->active in the tasklet, as pl330_terminate_all()
>> does, so the reference taken in pl330_issue_pending() is dropped once.
>>
>> Fixes: 5c9e6c2b2ba3 ("dmaengine: pl330: Fix runtime PM support for terminated transfers")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Krzysztof Sokołowski <krzysiek.sokolowski@gmail.com>
>> ---
> The same patch at
> https://patchwork.kernel.org/project/linux-dmaengine/patch/20261015-review-pl330-pm-original-v3-v3-1-5be09f37df77@crepuse.com/
>
> Frank
>>   drivers/dma/pl330.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
>> index c2d0b47..b0eced8 100644
>> --- a/drivers/dma/pl330.c
>> +++ b/drivers/dma/pl330.c
>> @@ -2090,7 +2090,12 @@ static void pl330_tasklet(struct tasklet_struct *t)
>>                  spin_lock(&pch->thread->dmac->lock);
>>                  _stop(pch->thread);
>>                  spin_unlock(&pch->thread->dmac->lock);
>> -               power_down = true;
>> +               /*
>> +                * Drop the runtime PM reference only if this channel still
>> +                * holds it: pl330_terminate_all() may already have dropped it
>> +                * while this tasklet was scheduled.
>> +                */
>> +               power_down = pch->active;
>>                  pch->active = false;
>>          } else {
>>                  /* Make sure the PL330 Channel thread is active */
>>
>> ---
>> base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
>> change-id: 20261028-pl330-runtime-pm-b5a30050b2f5
>>
>> Best regards,
>> --
>> Krzysztof Sokołowski <krzysiek.sokolowski@gmail.com>
>>
>>
Hello.

It is very interesting, but I have it for last month only in my private 
repo, that has now public facing side to upstream fixes I have made .

My public repo: https://github.com/ksokolowski/rocknix-distribution/

Set of patches including this one are here:

https://github.com/ksokolowski/rocknix-distribution/commit/dd3923788d94588b8d5fdb602808b13370ab4208#diff-27b400675ba20f118e98f9a25b963ece2a2336d9ef1fc9416c273f507e24c271

Anyway, I can confirm it works fine on real hardware for last month. So 
you can drop my patch and merge previous one as tested and confirmed to 
work.

Krzysztof


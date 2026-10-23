Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769163;
	b=P5xNa7TGXD/Cghdgjbt7fPxgiypUdRWR59b+MoCx9R0/Tjsn6PvIUlbvvxPNC8fT5dh4
	 Z5I/jv4glvHoIXDDYA6lAQXrBav8QKGHZCfwgwJcfLIpyaYWHZM3rI+ss1QCComzzp6DD
	 oQNiltlSxrHQ44AcD9yPrESyuHjASCTcXi2jW6omDPEXZnRcu/Ke8XHX42H+pr82069nR
	 RvWSwGxzofwfR8044ck0sKUxjNU/Nm91Pupif3chIs3JsinFcZ7rST1xu6kM9K2wdHNGw
	 7fGudppzZ9FXyaSzxdWURg31YB/H3wztLfdRscX9GEqMEeEBrv2oRZslnWRAZDsJghw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4a2HGeqSU90/oPjDCBfIOMhTpn84AQ4hBfmcEVcMu7Y=;
	b=lzXlRmmkBF0XRWmR5B6hW70pISdSDWZawoB5LjC8MA4dNW60OoPm52NccaSy+OeL93F2
	 dfZt1xfUyiYDfs0mqLU42BoLm4EU5ilgBcaHZUc8hs3pOONf4j8fveoRydcEuXpXiFk6l
	 JTuGE7JwiT3xFaCl3eLUtDq+1iOyIkcAoTiLCQ3zg3sEickuAl8YFQ5UMVJ4obyoMfh+w
	 NmZWiRyXRhnpRLge2XSoxhc7l+t8x3OWAxqDiAAHzN6dWbWdd2Zy1l1cLfi+qbvPITCBx
	 aV3VctwJp+divlwRdJ/r3maXY0/+uNVN0aFouMrPicLlW4Q31wt4Tic2rYKknQpyytA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=clz6LlPj;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FA6606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07FA6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=clz6LlPj
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1df146015so7365005e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792769161; x=1793373961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4a2HGeqSU90/oPjDCBfIOMhTpn84AQ4hBfmcEVcMu7Y=;
        b=clz6LlPjUTdI3liTjbBPzvaJkyBEN/TX3HWi/4eIyxmmD8ZI4SkQKMe8JEaByKZ2ik
         eRDS3Q02MyWHy2PC32Wy6vIuqBCo7vnr1u6nXWBuVNKCKKXgPR1pZJnAuOF6WVJ3t6rO
         10pytd3CMYvrnCQ6Dn/V7zVk4+RxfpV1d8ZZ6M9d4Io/cMYyW4ZUZJY31xhESceKPYId
         7N7O8IUvcNX7rQU/YQBztiPewCNQOmbApYI13yZUd0WOdeMqN6FPwbf8jRCg6S6KGBaX
         /CxfKtvmcVdVaInpniLAhO10G5Ie74B4YrO3ewquG0c2v2p+5S9TMTpKGcjV4OXa4a+0
         zgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769161; x=1793373961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4a2HGeqSU90/oPjDCBfIOMhTpn84AQ4hBfmcEVcMu7Y=;
        b=T+MpbBjKtOqciK9buy8E9mwHHt0uIUlbUdCeQr/V5iPukyaveN/KZnhhMnQ45gCi3Z
         nGLj/8BqSxoM+BgzVbLjHAnU0NxKm7fAmdyq7mEm9KUmaQuzOrm/6JIBCZk8mkpjsvwu
         VsNcZyzj4QLB3ac8vQcIq/Vlf1OZABPv+q+5SSAYp/y/TDvUzuvtZU1Fn3RF6r1/o1oA
         IoZUj3xqYmFZhutLS6smlqXSVrIdAlAc/y1vzcLwdJZRpsElb2UnK97BFj+mnQLBa21W
         g2z4jtHsQtKa/ODTHn7ycXncYMGPYHHxARRobPW+vs9f9lmerM8hn330eSGc7tZZnAVL
         FZww==
X-Forwarded-Encrypted: i=1; AKwUvByhwp4NjLga3pQ9SXZUFQa1OI3i6b+zwOM4zY6gFM4I8HVxabOxXwQOxB0GssdVNloaSLZ4Xeww9VuY3jg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTdPOxi1lNCaCnCz4CRxuVrRxRpT484hXD7E45+lk8GjOj7aL3
	K2Wuv+60phWCGoXoktbTrxxDj7FTwbJkjvSVmmiRuuPTx8M4bLQo3EC6IOhY
X-Gm-Gg: AYBFou0UeKtJODJzdWUhrCyq9QZaHdbzVw4Do+RSHjJHEhv4yBeyedMNerTVYGpJo/k
	79AQxvfo/FvIXITX2GPVGvnsi8zRQGJZ+fkdNn9wZ2757IZqAX6zcFSqhUw+nISBdfFnR5oIgUf
	W+aNUnwJRFiBpsroea68/pKMUkUr5PWtfnhAfhX+4a+pZo28ZBEqTixKMzFdoMlL8AsqjEAd7DS
	cIWhAUSOKz+GURq54G3oxtqRb6+wjFo6YrHjYcR0xWcA3Anp4u9p3KHfjc6og2Df1bpjKXp7mlY
	uAqFqRmrbLxld1qiY56fTPKr9UyLVKGHSfh9b11GimGeEGXZdv1fxMsVpWq/J7d2bVBU4EvSo4J
	AJg3pJY5zoI5Qqm50TKKRbGAf/RgHG0Jldwjt/aW7V2XpM2lGx/JfKZ2FZp5PFy1XySv2ex11HM
	/5f763TniUhW96j3geXXND6FgUeWojhVDUhJt9exqWK/O9z5nZ2ZEV5bHZOS0NPQIQmxn4Jk44E
	FrcjBKkQQeOp3jkFt0Kj0jQ8+B4hkKg7g6SshjbN37maptO5BKLuBm8jHaWZsM0PtN8Nxja5C9B
	YMeV7B/gSIR4wl0v4h7jsZC2AduNL1bZz5P9E4Ny/DhUYu76YPtMsR7tSw==
X-Received: by 2002:a05:600c:19ca:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a211c8fa81mr43106325e9.8.1792769161277;
        Fri, 23 Oct 2026 08:26:01 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cda9686sm11718245e9.6.2026.10.23.08.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:26:00 -0700 (PDT)
Message-ID: <af06c4b0-55a6-45e2-b2d0-81d64fcc845d@gmail.com>
Date: Fri, 23 Oct 2026 17:25:58 +0200
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
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
 <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/26 11:46 PM, Akhil P Oommen wrote:
>
> On 10/22/2026 6:24 PM, Anna Maniscalco wrote:
>> On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>>>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>>>> context bank we need a separate node on the DTS.
>>>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>>>> trying to separate a part of the GPU into a separate device, but it's
>>>>>>>> unnecessary.
>>>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
>>>>>>> context banks.
>>>>>>>
>>>>>>>   From what I recall, so long as we use the same dt node, the iommu drivert
>>>>>>> provides no way of doing this.
>>>>>>>
>>>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>>>>>>> and secure.
>>>>>>>
>>>>>>> The address on the lpac device doesn't really matter. I have very limted
>>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>>> I think, you were poined to the Glymur Iris patches. Another option is
>>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>>> describe the same usecase - a set of SIDs which are used by the device
>>>>>> but which should not be a part of the defaut set. With it in place you
>>>>>> don't need to have separate qcom,lpac devices, no additional properties,
>>>>>> etc.
>>>>>>
>>>>>> I'd recommend following the same approach.
>>>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>>>> similar case:
>>>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>>>> Let me check internally.
>>> After a brief discussion: it can be either, depending on what suites
>>> better (and if you can persuade DMA / IOMMU maintainers to let one extra
>>> bus or not).
>>>
>> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
>>
> + Bjorn/Konrad
>
> Not sure how strict is the requirement for compatibility with older kernel version. An
> option in your case could be just do an override in the board dts file of the
> Steam Frame.'
In other words that would mean not upstreaming the DTS change? Although 
we plan
on keeping LPAC off by default upstream it feels like that would be 
quite a big
barrier to enabling it for people that want it.

Also yeah not sure where sashiko got that requirement, maybe it's not a 
real problem?
>
> -Akhil.
>
>> Not sure how to address this.
>>
>> Best regards,


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


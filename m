Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716783;
	b=MF93BYf85Q3a8BmkqpssOGKCrKwCEorchplvv+jSm01GNm+Uub2/g2az+X4gY5Zs6OKq
	 znJwYh7vKUuH2tT/asJ5F59Kyw7qEJS6hN+Xl5gziBKycdRmrLsSZVNafmlBmTtIxEK85
	 ZLwwll5WuVOpQ9pMWHS76BNLQZflR9RIjH81O1u3JcPswwY9M1Qq8pzoJNxiqMFrQ8GK5
	 IcrPJZInd3bynhGaEXjY99b3fszD/1AsVcnu3UsjL53StfUK0GmX16uMHipc3K+v1UaYF
	 b7C84zc5IznmEB2NW7/L9J8rJ3bAQg+O1zk5R6FWmgCiRTjxTBSJUsfzhLJO/VjVDyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716783;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=v1hBCFPt9pyoy4IcWt59ljQVN1owNknCZ8FlWz7qGhU=;
	b=1JM6CeXw9KFrcGI/DVhhceygwvIFljbPQyzQTg+kriI6htAFSCPyKA6jql1kmZWGseLl
	 Nds0hkTXMAxW2scFaJUSXyB2MOv8JafepuS2NLvBw7v6XVW1FHR+3RLXM5ecNX55DoNIJ
	 gVJXrVtomtF1FJAfM/0FbnGP6vF9OAbXSLFCiIvlAT8Q3UuzMR02oVjEHijjcqr0Sd75r
	 +qEal8xD6etDIx9CR1rDkSzT89LjIbqCjfl+WM/inXbhRiz9+yBB5hSxWO+2//PBtCdx9
	 gbpmfo0Hw0cm8OeLdf6Un5iNLSthwU8CdtoE+pAorjfekyC4whKD5GoC3ojA8XXZ8nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S2DK1AiI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F42606A326;
	Tue,  3 Nov 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S2DK1AiI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4581F000C1;
	Tue,  3 Nov 2026 14:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793716783;
	bh=v1hBCFPt9pyoy4IcWt59ljQVN1owNknCZ8FlWz7qGhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=S2DK1AiI0vGex775OQMrtertUzEVp8INssARSa2K5grLZlgbSVyyy86hIqBL4+3Ft
	 C06Rh874X+iXZzv9xZfAITOIjE2rcztI9I4YvXVWoCUtLTYz9uoA6vzin02zIDf+tl
	 r6XwDFQEPBWeUBGitDwDaWOt0TpsBu7z+TCfpNzsa+y2b35ESs1MgwAexK4nIFFiC4
	 4PYV+MhCjYwhPWH/WVvAvjs1K+ywwcOLolp68cemNwJP/WnzWK/FQfj+mCa3bHYBxA
	 cFdOG/BhP14+bKLRA0oo2n1s8mz9wtuKpexYFVh4Z3JoIOhcM/xJE7vG2KMxOG59iM
	 xUJEhVYehdHFg==
Message-ID: <2cfa4a92-2be2-4f13-84bf-ecac133b525f@kernel.org>
Date: Tue, 3 Nov 2026 14:39:39 +0000
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
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence
 tracking
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
 <MPrRsE5vvB26tbMAT443IrH7Zr_tyIPaFwvQfnZj5TJUaM5uN8MyHB6kU6Y7rW92Sy35A5GfNcv95YOt-4YUNw==@protonmail.internalid>
 <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
 <7f3e822e-3749-41c5-8390-e6d74b203927@kernel.org>
 <36008be9-2b25-4f04-995e-f90e2547f7f2@oss.qualcomm.com>
 <JG_h5JjMWB6vy7eR2AS1dqGGrNxZZgcte904oblinYLOAtSNIAdesLgsGrFpYyxekmZ1_FdEON9Uoua7GmkX-g==@protonmail.internalid>
 <d3a7c0c2-f5dc-47da-8466-d0b77aae9b9b@oss.qualcomm.com>
 <57a326a1-81f8-437e-bd4f-25f79e0cd1cf@kernel.org>
 <RTmFZ9s8mJZID5gOqlgbB25-7YXOW69IODnJ0a0or3wLgu64MW13ZzPvahHElFCxst_XHlTf_TwVJOotEJRzwQ==@protonmail.internalid>
 <d4d0161f-37d1-4b93-8b54-202e691d66b7@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <d4d0161f-37d1-4b93-8b54-202e691d66b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/11/2026 14:35, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Bryan,
> 
> On 11/3/2026 3:27 PM, Bryan O'Donoghue wrote:
>> On 03/11/2026 13:13, Gjorgji Rosikopulos (Consultant) wrote:
>>>>> More than that though, there is in-fact a VFE specific SOF/EOF and EPOCH
>>>>> event but these require the CSID feeding a frame into the VFE pipeline
>>>>> and the VFE moving through its own state-machine to process that frame.
>>>>>
>>>>> So they are separate signals and separate logical events representing
>>>>> different things with different timings in hardware, meaning different
>>>>> things to userspace.
>>>> Well that make sense i agree that it make sense to be part of the csid
>>>> but it should be documented somewhere, maybe proper thing to do is update
>>>> the comment in videodev2.h and update the documentation for camss driver.
>>> Just an proposal if it is decided the id to be used, it make sense to contain
>>> stream_id. Then userspace based on the stream routing can map SOF
>>> for the stream of interest. But the API for retrieving stream_id is still
>>> experimental and i am not sure if will be well accepted.
>>>
>> Ah yes right I didn't really grok your point about .id = <integer> yes I
>> agree with you, the assignment of port/line number should be dropped and
>> left @ 0 - also what is the point of stuffing the line id into the .id
>> field is not warranted.
>>
>> Agreed, that's a mistake.
> Maybe this is a good point to raise. My concern is with the multistream patches:
> the id field is also used when subscribing to an event,  so it would be useful
> for userspace to identify which SOF it receives in a GMSL use case.
> 
> We can leave the id as 0 for this series, but I think we should discuss how to
> handle cases where two different cameras arrive on the same PHY over different
> virtual channels—for example, one using RDI0 and the other RDI1.
> For sure what is currently missing  in stream_api support is the events and
> how they can be adopted to be per stream/streams.
> 
> I hope that clarifies my intent—I’m not looking to hold up the series...

Off the top of my head VC kind of makes sense here.

OTOH it probably makes more sense - the VC differentiator in the VFE 
delivering the data but I think we end up debating if the SOF triggered 
in that VFE is the VFE SOF (yes) or he CSID (no) and if the VFE SOF 
really transmits any real data user-space cares about...

Leaving this series @ 0 is compliant with existing stuff elsewhere and 
lets us reason about the multi-stream stuff separately and potentially 
as you say addressing a gap in what's upstream for multi-stream right now.

---
bod

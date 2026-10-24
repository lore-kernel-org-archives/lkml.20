Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792853880;
	b=v03+5IyxepkPlCyzcd0iD8LUjH77njv2V5bLOGcMNrLhqWR0rIqtUsBkadxFUYffJ7sj
	 lyEsykiET5EMPSKu38/JUB0WNuonlRa7+dIOMpMpJaXqQI+0AFOq5IWMJAtCMCJdIx6SO
	 +/nt9PfhnLHvZ2iND7ygBj30SIcy+kg0qI7fNY1EQGo9Q2gVXMUjDjDHnaxOhsEV0DL5O
	 05wxGw1obsQgfjzqo4Yiq7393/7nqe40fuyam9W5VL13D0x8QjKJOzRjDlHLK53Caxbxo
	 UFi2x5zImcIUyTVYssAKjZJK7j9l9JesspGMkQu8hnSdbE+y/3yH0oDSTwvDIMK1AnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792853880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0glh7Tm3hCTaLHkk+iB1ZlmshEZqwQSCyeFUL075eSY=;
	b=n3r1gAa2tBizkjtzplOXcEXs2CQIRQHFhk6gHH2nBuIePUNlsZZ90haHMqjN+2BW0dDk
	 PczWGIuQpNVkOJeEybKntgxEd3vcTFQ7YySh+sK23D7/QV5GIUp4SN6hiwO7LVMGAimC/
	 1dZ6amQt/9civBZgyPAwmZuJ3s2mxtRIv0PZKhFPWREaNrNjp0pd7v6C+FlqyD01ymUI7
	 UmIOx5/Ed/1U7Ml1+1jMAoUB/lgdPyjbc5+j5ACjT/OBoC/yqvC8x3XKOWirAeC4vaWz2
	 mmQTE7ceT3VliUJg9DgqvHNNsgPfj+6wMvTneMB3PwN8LYYUkAq/aFci3OonwnQuRYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nMxrjfJN;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE446606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE446606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nMxrjfJN
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b042c0759so1120676f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792853878; x=1793458678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0glh7Tm3hCTaLHkk+iB1ZlmshEZqwQSCyeFUL075eSY=;
        b=nMxrjfJNFph/Sn/t1gDc23RmnPkpjH+f+gr0HSGObz4xkS4q0QihM+B/1cDxlUhIc4
         sDnXXIVtwJjBhP1yY8aNpREl5r+B7A4jWr2NCudhe+0CNu17U9Gk6VfIx/grCZUKKtKc
         /dzpm80Vot/uFLoyRD6Jn9h8f2/vRSrUL9uPREc4Egg1f3vhEnSRZTxWYqVUlwJ2sv0H
         5LkZ1zS21msqH3aYZ8/ehsgHVCRF1e+PsododjaTmJrBRtBk836CgY4/Jym1DGWzVowO
         9AFPAoXjhH0iRMvv3u6TzGC2IERxaRuJTCl+zZF0NMjyleTjpdGU33dQzkTIHKFTNmy2
         OkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792853878; x=1793458678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0glh7Tm3hCTaLHkk+iB1ZlmshEZqwQSCyeFUL075eSY=;
        b=crA0psNjWc/iCPsuVd+zIToNkazzB2Y9CzMBBJYe8JNVj6scuI7VqBCEyNclS454V+
         gf28GnjW8K0wXn0eiLBca5AsDHQNKH3C+JgM4UPV7s5txbOGwepVTOBcNdusx1Rtdm1u
         oOChVKDuyAOYo+ic2NGcwlNCCIPJIwMm1LwblF2aoexrxqj7b9BIh33vfW31pFe7Mfwu
         /9Sxgona9/mWnP47qgnunY8tFUPd2cXAmXDdZj7Qw3YDIOHylw1IplkqfTEzS2yxFFFp
         nRySoy90R05iJaFGPJpJOwQaA40NSFAs1vE9UuphqlyMWWujy2D/pECyIZ9xRw34Q7mU
         4Oog==
X-Forwarded-Encrypted: i=1; AKwUvBzqE5YczY73/6YzfdMbEMY6rJYzB31nWii5JKn1y9N68YaxrOKxfnEYO7shDwwSO1g8DDpN6lykcke58lc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtFrQYj7f+dRiQf6jvUg5n/+gWCED5yJuyvd7Kv/0dMYcmMaIV
	V50ghBSN+oQzcBaE7rMVZlkccQ9fzCV9qJ25CqweX5iOTccb55CnwTM=
X-Gm-Gg: AYBFou2DRxUkk1N958IyweVBHca82McPIZdLj57GYIaBeRuncbo9qK9rBJEaM9/iyLs
	/80GkID5CxTziyRfI/vxs1eHeiNdBUDpZ6tX/B50XIrZnVW0zVJJBeBg1S0fa8Oi1rLEm1nEWua
	EZsvOqCb1NMEDlxDA2Kj6JgZCgm6LyxAILWXWX+yQ/Gwmhzv51Hd/3B0MQCVOcj59/GOrUFzbOi
	3VqHBL6z2AKluVDN7ou+1Y/LKkrXcQub1jjgQ6NCnlDjiBhArTaWWYQaDS7OTxUngxdVQkqJjP1
	kCIX5UZhtVX1Y5bZXY26LxgGukWQm9OKSOjgTdBSBZhS2VeLWd4JzUM9A1AyhBsPK9NzSZXIgx8
	1Zmkl4q57xw8Ua3J99RI5L953RytbCWl+H4AokOQcYoiWbBD7swnuKxoeXu96zO818euKaVB/pH
	PqcDumo2viREV2HCnAia1QGhIca4zYfDYrgQ+IeRbbORsiLe3h4uOkqG+wZdRdIAqF0pyXs+Dnf
	/E3thnIavzZN/0L057aZQ9mLv5To/IM+XicZ6D8QH2LasDrDZtan7h1+gt0Q8MF+ug2jQy/dB9/
	0LvG8vOj/O/PGFPLTPysgLvVpFpGz0QTtXaeNSqrzmE5X6W96tnuul2QEA==
X-Received: by 2002:a05:600c:198e:b0:4a1:fcfa:2a07 with SMTP id 5b1f17b1804b1-4a35acafde7mr31200265e9.30.1792853878070;
        Sat, 24 Oct 2026 07:57:58 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbc718sm50327315e9.2.2026.10.24.07.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 07:57:57 -0700 (PDT)
Message-ID: <7d35f41a-c72b-4743-b8a4-0ba715be6756@gmail.com>
Date: Sat, 24 Oct 2026 16:57:55 +0200
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
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
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
 <o2zmplbtmoueumw3iqejfsdmucp5f66woa5hmw3vodbe66reab@syn2ashugzyg>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <o2zmplbtmoueumw3iqejfsdmucp5f66woa5hmw3vodbe66reab@syn2ashugzyg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/24/26 1:36 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 23, 2026 at 03:16:27AM +0530, Akhil P Oommen wrote:
>>
>> On 10/22/2026 6:24 PM, Anna Maniscalco wrote:
>>> On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>>>>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>>>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>>>>> context bank we need a separate node on the DTS.
>>>>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>>>>> trying to separate a part of the GPU into a separate device, but it's
>>>>>>>>> unnecessary.
>>>>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
>>>>>>>> context banks.
>>>>>>>>
>>>>>>>>   From what I recall, so long as we use the same dt node, the iommu drivert
>>>>>>>> provides no way of doing this.
>>>>>>>>
>>>>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>>>>>>>> and secure.
>>>>>>>>
>>>>>>>> The address on the lpac device doesn't really matter. I have very limted
>>>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>>>> I think, you were poined to the Glymur Iris patches. Another option is
>>>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>>>> describe the same usecase - a set of SIDs which are used by the device
>>>>>>> but which should not be a part of the defaut set. With it in place you
>>>>>>> don't need to have separate qcom,lpac devices, no additional properties,
>>>>>>> etc.
>>>>>>>
>>>>>>> I'd recommend following the same approach.
>>>>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>>>>> similar case:
>>>>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>>>>> Let me check internally.
>>>> After a brief discussion: it can be either, depending on what suites
>>>> better (and if you can persuade DMA / IOMMU maintainers to let one extra
>>>> bus or not).
>>>>
>>> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
> The rule is the opposite: new kernels must continue to work with the old
> DTs. If the new DT breaks with the older kernel, just specify it in the
> cover letter so that Bjorn doesn't merge DT changes before the driver
> changes find the way into his tree.
Ah ok thanks for clarifying that.
>
>> + Bjorn/Konrad
>>
>> Not sure how strict is the requirement for compatibility with older kernel version. An
>> option in your case could be just do an override in the board dts file of the
>> Steam Frame.
> Anyway, would it be a problem? Does GPU normally use SID 1? Or is it
> only used by the LPAC?
It is a problem because, even if nothing touches the LPAC ring, it's 
firmware
will still initialize and that will cause page faults if sid1 isn't setup.
>
>> -Akhil.
>>
>>> Not sure how to address this.
>>>
>>> Best regards,


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


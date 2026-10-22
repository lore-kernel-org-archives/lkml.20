Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792692343;
	b=U3gCexmgOJeqYCoJeDmA3Vh7TeTkAA4OpVimXSvVKNXk3atJqf8/AATqdehGyy3W7a8b
	 /A5ocgyBfoHMCICtLovrwnHfApoUhoBgGhE8wCScN4yImGavtHz+bOzZM8N+SwBN3ckI1
	 8YC1Y2furIbuJ1mvYZmSOF2hOIOKgDHKF/N1ghve1V0tCA5+N9efvZhApu6oVSlr1V4rY
	 8kp6yX/Cl8Kb2XWygooYS1ZIzHBxdyHwDPse7jwo5z83+fFa7+/XCxjfODeZGqWrv44Cj
	 cHUFycu7sADNlLoBJuW5UoPu1+zNxOQpvkFCbUFREch2DC+yKLqBAJuwQLj9wwFupwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792692343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JY/kgswJkw3rC1uB03Rt3fXoWelWaBya4FySXulL7N8=;
	b=vk1DeMF5BbHOIX6/KjIOGejAuhF/vq9lSBLH90KqlOLEhzbfv4u856recFODhAaqGkR0
	 xNLh3uiJlh41R5xnS4Zsyy4em11kjUPMp55/W7o5Xs7Y62L2wTHO6WAjpM4rOrMXJ5Tit
	 YKyB2C+70Q6RMTV37VBPxRsgj1qE1+tf2vLhj6DwKiRekzi5bAaTC9LCw41DLIgHpDc4E
	 6YJay0jGnoOIi5MkiLpqRY06txe02d5HVmzzk0wEgg+CQ2qD0qQO2NZuJDvXWPuo64UxY
	 PSHLO4cCzRPDBxqNuSZQX6U7jABdIYrNqDCmujn6TbQn/8gJGHafbok38c0ULP/XlsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENiGG3gy;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC967606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC967606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENiGG3gy
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so681825e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792692341; x=1793297141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JY/kgswJkw3rC1uB03Rt3fXoWelWaBya4FySXulL7N8=;
        b=ENiGG3gyyAuVeWIKa4LSnuOTEfgIAnd+HliVCcVvSd97dGwI6+bb0LpYPHo6PkUhTh
         cXLAv7cMZKpMSaKp1xlOAHaQrEPRp+Qqcvvu9jMexARfKbIFjlgs7TPyJI6ptY4sRcJ7
         pnHKxke6wzEvPe0C+4sWoOS7fNm1Hz7UeYddytJeKWtdBlr1pXgF3JsLtc0Qbk71FO1A
         zNwpb+ECp6OuM+oqFq6mdi4sEC6XQ9NfaU+4A3Q5dKnFNQ/P7cxSZJ2On8cNhfa/UoE7
         PVqbFHyi73gJU57gv2Sb1YRRm5dqOLgZR11k9/R4jd4q+y4oM4XJqk+7Gz7ys1NviWvz
         a7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792692341; x=1793297141;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JY/kgswJkw3rC1uB03Rt3fXoWelWaBya4FySXulL7N8=;
        b=A1w22LRAyjCLAQ0NC8lYVleOVI5vGuItxkQQ/P7fSGdNvKYD/5T9tm1QJ8qvOqcq6g
         Wq62HLnBmJKoe4BST1J4LjFoqXD2M2U2Rdd9jPia6EPVJEGM62zNBOqXRf4LSyTsMlfn
         zJpHyXVDz8KdzXzlIwQVFOt0P2Cg/t1Aw56szdkENmGqsWmfGZ35rTqFHup8jgBDkX0p
         osyZCqDlplTlexKnk7eFfQl3mLfnFSrfwiluYgmmIdAdMiTtj9QoHrldNhCw7nMNiFds
         KOWIM+DinhmYSFEV6Y+/1sQVFM6dgsXEwsmopfTheZ7gXTOrNNjPgRR6o36vRXCCPulj
         bspA==
X-Forwarded-Encrypted: i=1; AKwUvBxpBNK6cvs/igSuY5ZGQXWnmuXwcTwtPsfdbLOEjWxvFS0W02eXddyH23nIagOgwmakYK/mD7gXMROPHHU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoTaHTyd03q/YtiUxAwuX1/VrsLQJREvkbXbu4xV0S4mvFC3Cc
	jYl+/VIzW/3KrDkGmi8jsIzMVOfWI2Vs1OsqW+FtuSZyCANBWNabsXY=
X-Gm-Gg: AYBFou27gxYnkFfUmc78AdjGScmnBCwJYf9kbN3NgtfHpJ9Alv/my9gdOzgFbwPJJxT
	riXBa+ZBNVzIU5BDsJQ8KOENfkPpjEcbfhLjxU59454LkMADIjcjxuPJG/fX5YNKaR2Q4q+bZmA
	qqeAgyuBFWLHN0kq7TSUhVc7PVxpYAW1ft/tf00WtRiWdJ9BLkwFwQ2UN8PpykgCWjz2qbR2nTY
	66xa/Fegy87wo3rqZ/WsqUcab9a5JjCeWUW5VeKnEcfGQuW0uey6taZskjIsF4FdNTnFpUEyV1t
	mYPkq2QVf7gho2Im8SGK5INi9geXYaEQ+MLQiKZnHIFQayj3k3ZwxT2AJ9TekBELqKbpzAyrjMv
	LWioM5D71OoTuU2Q2LzY/3GA+MCfqCRIp6b65NagRYYhFYoESotZf70odv2IKNkZlShrixstHS+
	RxkUYVLkCjkAzeY1hGRquJA3eA6BWCE/ZcP/Cw2JdxZVb2HEZ7CQa6ixUH0zgGFhyEEqRpjTRRN
	u4J7gZgRVRWZsM6BOWNvs/UXevIhq0hQ/i6Kf0IkvqHczsMPcCSJbXfkfzEviZGxfkukGd7zJOi
	x4Gw8n29z67+TnLamSzIkEHYR4L/MF96VcHt
X-Received: by 2002:a05:600c:46d3:b0:4a1:acaa:c355 with SMTP id 5b1f17b1804b1-4a1fdd0b191mr127111405e9.10.1792692340943;
        Thu, 22 Oct 2026 11:05:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2104627e0sm14106125e9.9.2026.10.22.11.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 11:05:40 -0700 (PDT)
Message-ID: <31970f28-5415-4e78-aa0f-51f15d779e1b@gmail.com>
Date: Thu, 22 Oct 2026 20:05:38 +0200
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
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Content-Language: en-US
In-Reply-To: <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/26 2:54 PM, Anna Maniscalco wrote:
> On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
>> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>>> context bank we need a separate node on the DTS.
>>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>>> trying to separate a part of the GPU into a separate device, but 
>>>>>>> it's
>>>>>>> unnecessary.
>>>>>> What I was trying to say is that we need to map sid0 and sid1 to 
>>>>>> different
>>>>>> context banks.
>>>>>>
>>>>>>  From what I recall, so long as we use the same dt node, the 
>>>>>> iommu drivert
>>>>>> provides no way of doing this.
>>>>>>
>>>>>> What kgsl does is having a node for the iommu and then subnodes 
>>>>>> for gfx lpac
>>>>>> and secure.
>>>>>>
>>>>>> The address on the lpac device doesn't really matter. I have very 
>>>>>> limted
>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>> I think, you were poined to the Glymur Iris patches. Another 
>>>>> option is
>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>> describe the same usecase - a set of SIDs which are used by the 
>>>>> device
>>>>> but which should not be a part of the defaut set. With it in place 
>>>>> you
>>>>> don't need to have separate qcom,lpac devices, no additional 
>>>>> properties,
>>>>> etc.
>>>>>
>>>>> I'd recommend following the same approach.
>>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>>> similar case:
>>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>>> Let me check internally.
>> After a brief discussion: it can be either, depending on what suites
>> better (and if you can persuade DMA / IOMMU maintainers to let one extra
>> bus or not).
>>
> One thing sashiko is pointing out is that new dt should work with hold 
> kernel so, in general moving sid1 from there would break it since old 
> kernels don't know how to handle them separately.
>
> Not sure how to address this.
>
> Best regards,

Also, looking into iommu-map, it seems like I would ultimately still 
need to add a child device.

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


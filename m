Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876599;
	b=Z03raRjOULHWW5sdtWzlXdHY4rX2E9A493JLjUZFWWz/1YbMI4cJcn62d2zaBE4GMYq9
	 EHTStXpzDRkbdWxEhOOkJGRfu18o7rEMrFLiLEnhmfmkIXrExauDwDiDNLGTjcOtp/IRq
	 81vOWOS8O+dEoaTsCfi6bpVNL5OL3kCHrwLdnkkYUSnwzUTJkJWaueOhSLnflXe5zrGQa
	 8IpLhJwp8HozVFEQdXWF1LTvLYUCDaHE6+ezTm2HvDUu3CHJZKCC7xxMXKOJqJvhnZeXU
	 ABEZqOUwtJWKBk6jDIkNpAHFSdZeC7prs7tOK1OeFS4sVsm63xcmoQLz7m/2SYmpKAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876599;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MNZcSYKGNFF9ooUBo5T69bdazyG3b5sb50t0n2nEr54=;
	b=wpOshgdPglJNoB+HnUDITv4ueszWqTpaOU/E0bbaCPBMZenPkf33mXUWdWCofIcvKtLO
	 ab8b4Jo0YYDWKzspecILzC5lTSU2fhCpzzfSFXMJW7IgMjN/GKD/tJRrf49Kw0n9WUfVP
	 Pouij36GVsYtMmdWazvt8ZWIuMffmpLMg8rps1LYnciApfAtmIKNnbZYdjZef2rkYj5JL
	 1YLnXVfQ/6o32wCaNQ1H2ik9Qa8U1AmURvsj+xzOi6Cl7bz/uO3olCR80qey/SyBSpxtG
	 u9XZK0rZFg0btFIvA2OhvCuD/J5lCEDOP5iCyy56dxIth/N5Jrm4SrH2XTKG2eAP5Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jF0ExUx0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LoRAp9mw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C6C606A33B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C6C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jF0ExUx0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LoRAp9mw
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tYEX1053390
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 11:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MNZcSYKGNFF9ooUBo5T69bdazyG3b5sb50t0n2nEr54=; b=jF0ExUx03ACGKakR
	whAEaqh9BwuKo10HtQ+tUkaOK/yWNcsbbUwYIejCKHU/sWDMFoKP14hxo5X5ARrI
	vaYmZbSaJNLvXWzi/LGpkpkPEt8lxh/JvVO2wPCZke47HLdJNTrdAVMd3gj1BVTG
	lf2N8tjDNdX94tOIA1P1+gGSvq2JququWDBgTfObfqmOYim6kSamkQUV6qkyL6dZ
	5iISF22ADRBIF8FgnAIecr3jPeUXQqMczkA3ia/baiuTSVElwXCA1tuel6NfPe4c
	uXHeDvj0OkD+AVz2Owr+nN8nV9MNCnaNnSuQN1/xBNsODe1spFL/AglbcsCLzhFZ
	DdLahA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f8b6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:03:16 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806756ea40so1413910241.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793876596; x=1794481396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNZcSYKGNFF9ooUBo5T69bdazyG3b5sb50t0n2nEr54=;
        b=LoRAp9mwoNFjBdJ4ze9RUrjq13li63LpHKvJa4q901Qkxbv/Prt8p0NBerjaBQf+et
         fF0gQXV5t6BOWMJstpktBGjo4EIfZ443/BCJpnJI5n3TEWFuowSkkvj1nfB4w45gkD8D
         PuelOMPtvfm89Q2Qj1wSjtTEzy128xrzyP031/BVnLk+PZ3sYQeHWjKBIDJ68t2CRjD6
         ZCi4UoGUIen0KmghVZFXOK4RrnNuewhZNkWCv5d5sIL28DJRypsxV6A4EXFbtsWUl/+E
         lGGNHwOlm/dGUSN0KS7WnNlv+uBi7Ce302ESVrsr7snEGuXAMgIH/3+ki2DevhLFcbUf
         I4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876596; x=1794481396;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNZcSYKGNFF9ooUBo5T69bdazyG3b5sb50t0n2nEr54=;
        b=DOAeE6jKl1bmAeZb/FhZdKExukRaWHX0ie3jZTdug7JeYjZUr/wylyG9aO6IcuSNgp
         W7LI/Lx2UeRt5DwGJNsTF9DC2PUQAtUtHzyPAjKSTaNk67XwYS4j8PPiUakHaquyrvXt
         o9zJjzjsPNiNnna6ujinhEh7EPHeIYPr751S9efb5IXC8q2KoEyyCC1qqDchBGn/9tEK
         fIK02v6u4E9tnwtCowdFjtQx954JJShjLAnG3B+IXsFRndb7yb8JIOI+XkXxWbP9fvdF
         S7AvreJZl642Ag7c/NTbSSvGjVXGcreZEryJmwqZYVz0xEyV/DtuIc0xy+5uRDkGgHLf
         IHUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwt+65bZMviUsFkmLRZridhJB+b9g87BmWS2iZvTD8E3k748PtAE/WTcUSurkRHgg2d0HJ0RgZxL6olXDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kl1I3hJB559Y8IeeTPwcyl2ExfeXHLPjESZWuFQxgtWlIfWWl
	ZbXvNI7I084sRk1dxDs+5pKYRzbTTl2L0xF/7G/4KbjRkT/G8g3E/88N/OnakPOWlkVlOA1mZi/
	YD/9DrEwgxZGwRpiUSFWzXBeE+NJo/vXRiSUnlNnwBke9EccUa7tIfZ+mJj6J/vveYpo=
X-Gm-Gg: AYBFou0LZnhop64gJc0k4mI7Pzv4iKiDG3UhujQN0mctKpb7m30UaYfblcOrj5qlsbt
	ELUGSrNfoqVzXAT46aRM0NAxr5r68xH2bmAe8EInTmgBB5TvsumIKAgY3GH49qr6zf9duVWSzhM
	TPg2Fm2GloCJOiFTMYj65GqIeesuKaojn47Pclf8NwzUir3uWTUtfzlN6Imm8cBzGJrsnTnKFB/
	fV2orXnsobH1t3KEEfwX0RW1y1pGSMMlZ2HN2ST9bxpLaxgh5tbE29mLlTVV0sBE0cdaro4IPE4
	cgtsEAfGTgneiTHFagwOflFVUVqb5ceNeq3dXbLddZ/FfXZCr8qcp0CNNYJQ00nD5jg478n+KwE
	Ryo6tiVTJXJKQLd0LrKI/bnCoggeGQgoHyGPCKJX6aD2mMETWNU9eepH4K/honLmGDYSzQ15UnQ
	==
X-Received: by 2002:a05:6102:3707:b0:7cc:115:ddf1 with SMTP id ada2fe7eead31-7d072ca6eebmr7950972137.23.1793876595910;
        Thu, 05 Nov 2026 03:03:15 -0800 (PST)
X-Received: by 2002:a05:6102:3707:b0:7cc:115:ddf1 with SMTP id ada2fe7eead31-7d072ca6eebmr7950951137.23.1793876595418;
        Thu, 05 Nov 2026 03:03:15 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180eaesm10978778f8f.2.2026.11.05.03.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:03:14 -0800 (PST)
Message-ID: <8abb2394-5210-495f-8420-a02bd16ff466@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 12:03:12 +0100
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
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
 <auxMOdmFYDYGjqa9@shikoro>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxMOdmFYDYGjqa9@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX/ZRjWDFAGBID
 BpEtMc1V38DF6seyF1/mteuwJCLOjIAUEQe9fsdyxzldWlJOnC6yOGeZQz9gUpq5n9HdT7+cABy
 THkZ2yWmYFNRXAuicDbCCbQwAOIW6N1yFumDAue2Se8UJLWJ0444g3XI3gAgFO89oTgwbYGfU61
 EWky3AJjLOAHVZIDstGaLXfhM/bg6i0aH1XaYnDQvm+etKFfd4NGjdVCliAG+rWICesODbXbqRW
 Sds7t6oMcvcLERmEjPkE0oPIAiHLIp3m2QNjTSBLWajl8RKf6msaC/1Ab8FzjqXs5SrupoA5J2b
 32wS2CUbvXtXxfh/YgI9jc7+TuLqx6wZfSX/YRAHoT312y+uNrnlvR5sUlZD9hMrFD0S10Vdq7x
 9waRtdXcQtozQyrLTbdjeqbq2OLc8LKGLV+8/y4tE+f9CAm/qcW4kJHsI+i8u17wC2fl3fqnzqY
 vsD+tHk77cZ+DvxJGPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX/erwRQHU9D4M
 vFj/3PgIGW6intQx/qqmXHGacqfgF0GEmSszWPC0xKrkSGqdAjjmPNNmfGyEbHWsay/vqn4PiFD
 p0BILTHLx6PPyn7Nlx4jyRyBj7Hcw6c=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aec6274 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=iee88rELAAAA:8 a=7vjvkMWgNjT-vtUVTPQA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=dabF0gHGKZk2vt9j88Rf:22
X-Proofpoint-ORIG-GUID: DTVlSTE_TEl8TSGYS6msmpQz7thjZOl4
X-Proofpoint-GUID: DTVlSTE_TEl8TSGYS6msmpQz7thjZOl4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050043

On 05/11/2026 10:28, Wolfram Sang wrote:
> 
>>> Yes, if you want to spoil that, you'd need to introduce
>>>
>>> 	Partly-reviewed-by: ...
>>>
>>> or something.
>>
>> Ack is for that, no need for a new tag, quoting:
>>
>> "Acked-by.... user may not have carried out a technical review of the
>> patch, yet they may be satisfied ..."
> 
> It seems you are mainly aiming about the "Ack/Rev"-distinction problem.
> I don't care so much about this. I care more about the "# subpart"
> problem. A list of 10 Acks without subpart is to me as useless as 10
> Revs without subpart. The subparts give me the idea which parts of the
> patch have been looked at in some way, at least.

Sure, let's encourage that. I do not oppose "# subpart" usage as you can
see in this version of patch. So far it was simply implied. We know many
names of maintainers so when Mark acks patch under regulator part of
files, we know he looked and acked at regulator part.

> 
>> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
>> found acceptable according to the Reviewer's Statement:"
> 
> So, for the SPI patch: if someone spent time and reviewed the complex
> core changes, but only 2 out of dozens of drivers, this would be an Ack
> according to you. I would, however, understand that this person doesn't

No, and I explained this in this commit msg. That person reviewed the
MAIN concept of the patch.

"Reviewing pieces of the patch while ignoring the main part of it, is
much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
not be applicable."


> want to repeat the boring driver review a number of times. I'd happily
> accept an:
> 
> 	Reviewed-by: <hero@reviwers.org> # for the core parts
> 
> But still, the driver parts need review. We got a similar patch for I2C
> and 4 drivers out of those needed some cosmetic improvements. I reviewed
> that. But I did not review the changes in the dmaengine core which lead
> to the driver-fixes patch.

Nowhere in my patch here I said you CANNOT review part of the patch or
cannot even leave Rb tag for such case, right? What are we discussing
now, exactly?

Do you agree that if person skips the main point of the patch, the hard
part, and reviews only less important part, that looks more as an Ack,
than Rb, considering how "Reviewer's statement of oversight" is worded?


Best regards,
Krzysztof

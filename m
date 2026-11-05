Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876170;
	b=Yiq6jftXv5rVyWo1U0+OEjI0S4iBYlffTbpC6Y5HbxwnWCN+HnC2y4PVOwZt6g10Zdxh
	 9LowL1ZYxm1fUn3qeiiUIrv+KKlRi7d52hHAGwgRH2/XH+65xDwsmJNa2mOzxLisy2XT/
	 5ZloVTp1KAK3z6PBMQRI/6FM/68TmKZGyWWniggW9cj9Bg/8TAhjx8qhdt1cjuPVlOW7N
	 HOnnGTpiNsLQPYeonhIlm6EBGZVibIOoBRqBzchnnesU61lZsFPqu3vG4ML80dtbpWXq0
	 UHcE+5yRLMt60vFhVSzLb+i64ljA43RD9PFbZdvMAlhfFaXt8p50GsU2nOECCb2z1Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=q656jYSec5KrfK7vFLzGffTu79NdryJ/KHB2O3s05a0=;
	b=Gg4N0zOI627nWB94JBIx7jRc64zAUfVx2DuSFvpYvoTjjS0wcMSVc7PCdTlyvpJvcOgM
	 57oh9NhCTKuaAgO6yZli4XmyWJqaWm1xJ6QCIlyRR9c6ZFOD0n7DwkXmDWSoLOr8SCYJy
	 sXoNscVaRY47z9qAM7LuL1nhnBkzePcNyBoSVFfbusLfSKrAxLEmjngGB7WMmDs7KK6hx
	 8U5JX+BsYTPq3Ja5Dy7gWJsVQT0DKW0OrQOWh4xlJZGuTWHiQspJID4diLT05q13ipZoe
	 g4lU8TwwFfUeHAOp8G7HQY0x+XXCXkBHqR6dI3uOKoEOZdiI0KEaa2LkCR1eUj125zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ogx45S8i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZZBk2eP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C58606A336
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1C58606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ogx45S8i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZZBk2eP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tJ391053135
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q656jYSec5KrfK7vFLzGffTu79NdryJ/KHB2O3s05a0=; b=ogx45S8ikpioi48u
	30lK0LgGgBeGGT5RyPpO9J4jhgbzQgQ/3/Ph7Ffg0xyh/0cFJcLgvrAJ7cGekLEA
	N3FRsdORFOkGL6vBwl3Uc9Za+MXCYECkkgpFWOwOQC3UHI0d5IbEcBr7/2rP8AgS
	6HlUxCse8VuWaRlFF+PdomQHna6mrAJ293Y0tmpjRawc/UwCZ5RsGPzp2AV+Aqzu
	P7m3mPneO5erlT6/ZAYsSCqL8yBoZXQiUcEHtL1zBr50Ok02wJDjlIEicI+5d7mG
	5/obDX8pOunpQoQS2UgW3fseCEAJtFqiZ0dJGPdf2n7MyY8ihlg0X/ulC/03hEAK
	tZmO6w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f8a4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:56:03 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-990835cec5aso433657241.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793876163; x=1794480963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q656jYSec5KrfK7vFLzGffTu79NdryJ/KHB2O3s05a0=;
        b=GZZBk2eP6x+KEKw5uwViJtmzheDqvOkvIDTHXvsH2fbCCz8gJmAFaxaE48I/ZNAjHk
         12gYx575yDo6IdM8zPlYCr+HvrY1lKHrE35cRSL0D/i2mSJpXFdD4xd9hoDsfxutU8W9
         cFSMh9TmutJ2YQC4cdgYOVD2mjs4/5iJAzkD9MmLZmT0LrAH/Wm32TzI1vkgwZYjPa6L
         WRlSAWHW0N/M7dIr8rdRmwTvZd5hHkhhfAL0Y9AcNFi+hzg6C3ixOgXWgCnxyu4qB5XV
         Fk+qdlyMAcJd/6v8VNkIPGwhQMZMtvUJlDYJ9lbHNZpOHnC2vZ//zu5HAichjW/NYxJn
         F5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876163; x=1794480963;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q656jYSec5KrfK7vFLzGffTu79NdryJ/KHB2O3s05a0=;
        b=CWbdmbUGTG2IgS+ihqR1Eunhkf6vklj5tXjBQpg1lKcXL3DlB4OCvcZY5B7QteMpUl
         p+JRr+kkBNhHCQp2qGpXNS2DxPk3QLmedok11t4DooRNS6aPlaY2MNdJWjCxMKT9ULQr
         YXbJnKg7sLapRmKu5wjNkshINGkp7UyeH2W3cAwNN7KpKPduwG1K838QXCGAGnaajcSN
         OP2YI8G3yHDJtZjwuY9pXRlvGqMcHNuU9UhypfSPCr0vvjxRxzXAAet/fqoRgQLt2fcs
         wl0jcgqMZzsnROEyNcU9X7YCyBnulZYhZrU7I1zoIhaOso6SN3Kfkqr7lo21nreK4kSJ
         KxVQ==
X-Forwarded-Encrypted: i=1; AKwUvByNHXyl+dTNzCOTfp378RNvvupSCMhZW5N/TmiKA5n0hSxYswyvc2C3EIaK7z9KgVyau+5HNNhvLoHJsEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+GIEAKCVjSZLIKnzNKdBWLAvgeQCx0uFw6DdsYQbY4YRnQh1s
	s5vlbxLVSU2tO5xH7uX26+Vqg+Rz7v7/U+q8EnmeMLNflNqeWboRHvTSd7JW0T9UrCGUSilYYXE
	fFIIzJvbxG4vAkF2n77e+z2k12dlS2YlOCyOzDQk7dc3eqgTSFTwSeWo0cjHorkU0jDE=
X-Gm-Gg: AYBFou3mHVWqQ6lqBBxabgAUgTMbDjXiW5VdjlIYg3f+qLYjQKBktT8a+fCjtyQ10mA
	k7ll1ytQrQJf8FrGEYJPEW31/Meub2OfaLsHxszCmYcuH7S9JFWKMdBgZHzT+26orn+3WlSFaJq
	QNfmbdRyXxMzLLA4w+MOppjcGblUH7OnUw4z4wuwRiNVHQJsFQH06c0G1GGyUGheD99q9/jokT3
	IzCJ9qVEtowUZkrXzhrFRVuXuLa42dxHTq+Kf0hesWxAv5tbKnO9jw2saEMi30XyVvCCEPhdpUj
	ti1Du3wpmWnJ7+FpuYMY6dfcAryW+hDnMTxNUzJyaun8clrLyi7rQfIET3fquxdrdnbWaA8Jmod
	BRtTB5SHkrtahjwEUXrKCAYYnFCBKwPRPQMj44cOvBbmnaoe5b0kQ75yJVHwobL3O/uPclpfqaA
	==
X-Received: by 2002:a05:6102:6b0b:b0:7cb:be5a:c62b with SMTP id ada2fe7eead31-7d286bdf57bmr1198444137.43.1793876163085;
        Thu, 05 Nov 2026 02:56:03 -0800 (PST)
X-Received: by 2002:a05:6102:6b0b:b0:7cb:be5a:c62b with SMTP id ada2fe7eead31-7d286bdf57bmr1198429137.43.1793876162607;
        Thu, 05 Nov 2026 02:56:02 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1f100sm9483255f8f.46.2026.11.05.02.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:56:01 -0800 (PST)
Message-ID: <179b3509-7002-4437-965e-e0e47e59a444@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:55:59 +0100
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
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
 <b4e49e68-306b-41c9-a374-74cf7ea5a7f0@oss.qualcomm.com>
 <auxQ_ZYMHYJPStox@ashevche-desk.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxQ_ZYMHYJPStox@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX+8nr43B6ULXP
 F5SZ89AnccVu3mn5HBok+MceKvRzCD+eE1wm+LfuCPLYxrI7cVy3DW55Gbf3/990Ms5TgMV0939
 OscbVd62wr5trAnp13IL+TF6gRz379FlKj42XUI2XFkDoIfkJjF3PcXD6wClsHNfJLuAbmRj5fy
 U6D0e49w4S47Q3QC5HIXp6Wwyq0HajaVcI6MMBdwxcem4Vg4fWpZkt9VyU4piAK3v+vf3rIxAuA
 1fufC/gF50L8SVErHXs9YCucrUKpQcupb3EbJWKNqDz5hvy63hb2X5d8ZwDJK3Uq7YtlxCUW13T
 hsKSxu3RAmoB2KOC+gZlD8UMxNYqwkvtsXoN1/+tD8iCI3KR9v5PWUfT2x+zo3iuigfKpFoKqtj
 ScHaffbZWejuukfXvsu7wqxM85epo4epX8zS9MvCTHC/ayc83wlIInZJvga8l5YpR0ocaMVTLGj
 3A0zdgCCVCE1PwY5pHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX9h32W95BcfWO
 EtCrgoMJp8iJxGEnSTbWajnAwtn9mMnGF0xPLvT/CDoNkhHzPfEDZyB4rS1Q/0iZ8MOJ0PmOTQe
 szqJGi3liAhAOWDDn3X81maxtp03+HY=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aec60c3 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=OeTRdiMGzQZ1hgbNYWkA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: uW1Z4zoF8pTpuWI8LGWZq52xbJy78XhT
X-Proofpoint-GUID: uW1Z4zoF8pTpuWI8LGWZq52xbJy78XhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050043

On 05/11/2026 10:48, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 10:27:17AM +0100, Krzysztof Kozlowski wrote:
>> On 05/11/2026 10:19, Andy Shevchenko wrote:
>>> On Thu, Nov 05, 2026 at 09:27:30AM +0100, Krzysztof Kozlowski wrote:
>>>> Refactoring of driver subsystems or some core driver parts often come
>>>> with change of the actual drivers.  If that happens within one patch,
>>>> people giving "Reviewed-by" tag only to piece of the patch, like one
>>>> driver, and ignoring the rest including the main concept of the patch,
>>>> are not really reviewing "the patch".
>>>>
>>>> As explained in the Submitting Patches document, the "Reviewer's
>>>> statement of oversight" is for patch as in "entire patch" meaning:
>>>>
>>>>   (a) I have carried out a technical review of this patch to
>>>>       evaluate its appropriateness and readiness for inclusion into
>>>>       the mainline kernel.
>>>>
>>>> The sentence is explicit and complete, meaning it does not allow
>>>> implicit variations like: "this patch or part of this patch".
>>>>
>>>> Reviewing pieces of the patch while ignoring the main part of it, is
>>>> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
>>>> not be applicable.
>>>
>>> I strongly disagree. It's all explained in the plenty threads you have started
>>> on the Subject.
>>
>> Please provide arguments. You keep responding "No" or "Disagree", yet yo
>> do not give any technical, discussible data.
>>
>> You just wrote:
>> https://lore.kernel.org/all/auxGom0XR-Hax9b3@ashevche-desk.local/
>>
>> "No, (partial) Rb != Ack."
>>
>> to which I provided several quotes backing my point of view:
>> https://lore.kernel.org/all/00390a20-7630-4066-9779-06c8f915a176@kernel.org/
>>
>>> TL;DR: As a reviewer for the piece in question I have done my part fully. It's
>>> not my issue that the piece is bundled into a single patch. We have options:
> 
> ^^^ (1)
> 
>>> 1) ask to split (and review as standalone piece);
>>> 2) add (partial) Rb with the pointers of what exactly has been reviewed;
>>> 3) ignore (silent agreement with the respective subsystem maintainer's opinion);
>>> 4) ...something I forgot?..
>>>
>>> (even partial) Rb != Ack.
>>
>> oh, here you repeat.
>>
>> There is no partial review tag. Please read arguments I already provided
>> to you and either respond with counter arguments or just stop repeating
>> empty statements.
> 
> I already provided you the argument, you seems missed it (see 1 ^^^).

The (1) above does not address that statement of oversight does not
include possibility of partial review.

Best regards,
Krzysztof

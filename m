Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876365;
	b=c+vtHWwxfGy6JEK4sYtg5IYZe0CEgiKwuKBFb1YUcAN2ytBKeuQ7lbXIib2Btqtjr6wO
	 TNqBcmuiNG+AOI79QJ88qZTbHspbURwYhaU4QOj82LTPfQHeDAoldawPbjEO0HHxQ7hAG
	 I9+RoApz1TQOSy1yGb6A7kcFLUlKTsXLU5CwToNDiJ52RAdanuveOAtE6GJVLOnszY91r
	 elKcmj0VsJjTL0SydFMKQr9iXtw3OMT+1XQ2eLUZMij3lnw5PmEJ4eW+HvvoTZf5Sr47A
	 bpmAmktnwqZS9NDHG6+2hC2rFy2pGZa8yHWNx4X+8mURcbwoZvWpMxSB+70xB59UhjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GF2rHSAQzy8g6x6FDaTDZtSR+2fPpehxPRCgCv+MWLU=;
	b=BqWcIgjj2YseW1HTRIL2nY2KU9+Nlce9x/DBshsqDMTMjt19ccw6oRzk4fEqaQQk95lg
	 9Sx0sdDJqroYrAhfuQo3Q0yvWieLg3hc2h4w52gyjlYU/Ue/+NfeMmsSeJuTkUAHn/02b
	 jVJTYdMrR6JjXhM6Xp7mc6f67un2Vb9B3Pmw4X1sEx9LQCo7xi82mUo9Oq7qgxVo+wrek
	 SVVgn3pWqtTpyFSxnrvVt7FM7A3mMwk4wRxPGRFqUlDn95MVWmoz3GCxEbCvsSkTPhOyc
	 gW0UOubuibV5PgtdrpphJoF/vzx2mfgW5dtO5fe9Bn5H3ALYzSUPIaetFoUXsAE7w0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S4GdoMnb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+1AAZFJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4952606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4952606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S4GdoMnb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+1AAZFJ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tGTY444517
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GF2rHSAQzy8g6x6FDaTDZtSR+2fPpehxPRCgCv+MWLU=; b=S4GdoMnb62wxLXSB
	bAOFPC9hrugpFg+RHlDw9JO2vsYxFB1c/Dn5tN5E9Kd88ONF5RZ+fqO9Kg69MB8H
	TUQVjD0wi/YB4jjF04txb+nKxjAphrYffJR8jddWeya2zaTQ9FEa2tVA1G+CVwVP
	JWu4E3pdP0JgE7LFKlX5l9nWG9WflODdIGilAcll3FBx/RiiTiHekbatUzw/Nr7B
	kbZ4fbi2Yy7nW1xCBejKAgAdJ+GgMzhqdc2fbPdxKDhVLorBvpkgMhVyW0SgmtPf
	XnOYLhGH0FYfFmETF8THooXbH+SkM/fK1mtEyQwYz5UQR8obgcv41q3kz7AnqcPP
	ACVGyQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaagkfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:59:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f568dee56so322593485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793876363; x=1794481163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GF2rHSAQzy8g6x6FDaTDZtSR+2fPpehxPRCgCv+MWLU=;
        b=N+1AAZFJNoACFTzUnpe29S2yAioy8EBUsQp7kZNysQc1OOmLHt1bBIeDE0N1PKM13z
         U7rg724t0zqxKeXfLxBMZukTl0X2mF1nGeXZfn4m2a/xJQgHbTwHUVG7mrWjEiqQ41bb
         M0vYimbtqCBrvO6Gf/nA56Q4ytdSYrysR1g3O5PPBcSm8OEYpCnAYCW1Uvf8YvhJwzax
         27PjT4iXDPN6xu/d8e36wW0O0a/6cQSdUIdAxV48LMSNrr0t/2HoDXTS/lnhe3rwrGRa
         vmtp3k5Ia0FCt1u1lM2VdOhQnraPYiCTrWW2Tpgm1x0lIiz/ZPMNhXUziyouyRFxltI5
         80Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876363; x=1794481163;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GF2rHSAQzy8g6x6FDaTDZtSR+2fPpehxPRCgCv+MWLU=;
        b=ZAdeV+A1UsSBMgvhkjOZ5Tzc8gOX1XXXxVnfgOmRvg0lDXk8PX0C5G1tn48XOZ8sZy
         jXmUBeEFsZzgqdj5Op9czxpwz0RiTY6adQIDeEW75uSqN0ytVIHP368C1BpGC6/OEqvL
         WV3Yh0HdSmrABrckGPj/nYcWd1eQhq/98jq/o3wo2ZYFpqPZ8NMnJiTyRnVfo1Xj/XRi
         f7eojdrkWbYUD+PjSus7MVbMA1wljQeoOPz5nnO1jxKTGd8uwtUwVUxzwJhMPx6Tg3lu
         h3K5LRrYRc4NzKNahIOTx2eHJnleVkcmvsbDsl2/q4Pk2/16fCqmW47snVokn7qn7Z9g
         8t2g==
X-Forwarded-Encrypted: i=1; AKwUvBw01KQU9QDY4VWykBA8B7odYwdHfgnQiwWCI8RxZ2MI+qTFsIHY/tKAd/nYBR6Yte29w60E3sn6bkpFzDU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mFW5EQh+G5ajoHHLaTHOgvYci5Um+MncWINQBOLYImKNrd8yv
	z9WHI+nlBc6gKe5kEA/rFGDBMSoyAg8xLENsu5eeXU5z9ZK3Yd4SiS6TOh1TccxksBGiPvWOf6i
	+6yrAWCcaIYB3td3X0FS5l21tCFO0Io+Q+sL3CxgYDBOpBfC8//GFyoxMxrUxQMimLlsb98RDKF
	0=
X-Gm-Gg: AYBFou2+dAlCoZ1E3k6u2Y/0iaR1KpoJV4CKaEi8Vfim7KbwdRROUo5x1NC1XNvwuIA
	Gpyn70dF3Ik9mHwsMC9jdomN1Yf/hpzwye51HonwURo6yU+Ztci0x5JdDOZwtRtddBnj2Pzh0vO
	4cnbdEuzPidAAIP+FEdlGwVv7yFsAdD4vtdWHhWFaeKIJoq7LWaLySmcwbuBkAiYMy/K4vD/533
	Vd0Kndz5y9vCTjVKtRBIvbdiSGGTt8PHrwqmfI0UnnyIp7d1oJ73NoRyPYlvEamwCwtic8NTgH+
	6q6Ktvymkje+q0r6rKLteEKA4sF3VQGHxCZ7cwhTv/BojDBQOOTA7m5PnJ6o4bcYXAVNBGlTgtQ
	Kr+feuaa7j2IAs7Vm/embvWogDtrCEKLPlxsDEoc74w8JJynX32KCyQEKkh59g1fDOMJKaW+XAQ
	==
X-Received: by 2002:a05:620a:1a0c:b0:93f:1ca9:f2f6 with SMTP id af79cd13be357-944217439d9mr3169291185a.77.1793876363008;
        Thu, 05 Nov 2026 02:59:23 -0800 (PST)
X-Received: by 2002:a05:620a:1a0c:b0:93f:1ca9:f2f6 with SMTP id af79cd13be357-944217439d9mr3169288885a.77.1793876362488;
        Thu, 05 Nov 2026 02:59:22 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm168704185e9.3.2026.11.05.02.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:59:21 -0800 (PST)
Message-ID: <daa0dd4c-58c4-49a9-ad2e-7823b6ab0863@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:59:19 +0100
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
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
 <auxLyK65Ycr7R9Un@ashevche-desk.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxLyK65Ycr7R9Un@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX2ceFZi6r4qNC
 nApCYoJHcMZuTS+WJe5zLYuLMrSiu4vKZmwphvltWLyQxCLP+rvsa/68Ubgpw1pZG/lu9ezg4Lh
 FIbCMw6PizeCP0sRjESUvJ6wf+ZjoExvWLP9ne2I6LnO+wMmM3IstlaBnktBgksSHIIfgJ1uUc0
 5IMl8SfhzJLjbDi8K5/QmpVSXDYjA1JN6XxOMMtQbA7YE+D7x/7VUly2ifc1Twk4g5Lv2ctthpQ
 +JKRkTYSMePNg+/3rqqo+QJE9Uu3yZnC4L4iYo7jWW1OjmNRSM31+lJHXKNGdiia666Ftqmj+FW
 cbAhTPXYBJ/oOGbGRoas7ZPe/R3ZpQZh3cFnqzAvC/akzRXKpLmRDnHrvvH3cp2Vf1mTqtgb1RJ
 k6j5G8y64+DRm7uZl2YlzGlMrrbVFKvddA9xBJ98i23tHnpgBNaLxDSZkmiyIW3Oqsx/4ZfUASZ
 aVRH0wGw4Lb5gUXARwg==
X-Proofpoint-GUID: JPpXAnon6wrfn40cM4I-qKjVPylaazCo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX40/w0dnbpw7l
 vqkWQsbiuTYA0bwCDLK7wny4Z99JQb+Y/1Atip/q73tC2tBiIPbSLvb73KVo9Y6gVPtGXL/rgyf
 xNx9YPXMj2HlsZfvI237351C6Nd/CYQ=
X-Proofpoint-ORIG-GUID: JPpXAnon6wrfn40cM4I-qKjVPylaazCo
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aec618b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=_kQXjUI6ka6CN9DD65QA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050043

On 05/11/2026 10:26, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 10:12:00AM +0100, Krzysztof Kozlowski wrote:
>> On 05/11/2026 10:06, Wolfram Sang wrote:
>>>
>>>> Reviewed-by even with the "# subpart" still appears in person's credits
>>>> and reviewing entire patch of 700 lines of diff code (like Frank's SPI
>>>> patch) is not the same as 10 diff codes for one driver.
>>>
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
>>
>> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
>> found acceptable according to the Reviewer's Statement:"
>>
>> Note that there is little sense in reviewing - as in statement of
>> oversight credit review - pieces of patch in context I discuss here,
>> e.g. one big complex rework combined with updates of drivers. Who cares
>> about the drivers? The complex rework is important and should be
>> reviewed, but people skip bigger picture and put their stamp of approval.
> 
> Nice, and what as a particular piece maintainer I should do if somebody
> created some helper somewhere (not Cc'ing me), waited to a cycle and started
> cleaning up or refactor the drivers based on that API? Basically I was stand
> in front of a fact, I may tell NAK to that, but what should we do if half of
> the kernel will use new API, half will use old one due to disagreements on
> implementation, naming, et cetera? Rb in this sense tells that I have reviewed
> the refactoring part that has been done on a piece that I'm in charge for and

Do the review, no one questions that.

Statement of oversight, thus tag, how expressed in the docs applies
though to entire patch.

> it looks good. Breaking the flow or behaviour might have been done on the
> upper layer for a bigger number of users.

Best regards,
Krzysztof

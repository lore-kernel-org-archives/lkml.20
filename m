Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792614837;
	b=PGG2ausNkU9K3dm4JZc0bOx9rR8ga4DkHa1lnBqHVHioxe7ueBkArXDNOTl0PouDklCt
	 PYZFw936Yq9iTXSOMxuugpDTNAgGNI7jr+BMEmurrapsr/ACkPcKYfnE93oq8SUz8SnpF
	 iJIqiJQsGiWiiFdRprxEhIxa28sbWB7RM3FM/uOrBUr1Vjoq4DE1dbH7HopKDWXtUximH
	 RhbJyFCh11xNjrjt1Kk0KBelS4K4bMSv/ODkyiwGUBBafBK1nVubTNCBynckje60SE1Af
	 jisLcsbaRsWSau9pNBM6Z2drMdbwLzvkbYJ+c7ZGBmk3MYqe20NvkCAhEenr2gPsyTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ych/Zf08x28o9LLrYkYPAjNwcDM5guKZUT1kj8rPdFI=;
	b=Vhgq9qikfAlnZZeRWVc57axKDL4+C82ke8pmwPZeNvvB4si9TQcYAx1WoGrHEJN6YYFH
	 Biz2yHwam3ZsJm/S4yudCEp6x/3Zb+IIFQP3IyaKU2QbIyvZplCz/KPYWGIyz08MI/OAI
	 8YVx2fkwAnQpMXnvHffZ0pLryUh7/v1LasxC9e6dCC7YFx3EOZkYmOqhyPITZ6ZOLihGd
	 AaNnnts8qBJgA9gSHNn6sRQQ2aBDArdsSRp5W/McyYBFiylg19A6ZeGs5r0bfO4LylL9/
	 7LzBVY8aggAD/ESyb4X2HjD9UuxLU+86j9cqBNNMNLWfqRBfelTxfOA4zTqbF7Bvt2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1GCox7h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RdbjUuwk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D85606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D85606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1GCox7h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RdbjUuwk
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LHpGm92384123
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ych/Zf08x28o9LLrYkYPAjNwcDM5guKZUT1kj8rPdFI=; b=P1GCox7hGAIm/O10
	RkUKDcUdwgBtJh5DEYYKv2HJLQFB7IZ6yjgwRq3u+8yogg44VxbugAedosyDvBlh
	f4S95RgA3DUHI3BYMv7lUVAdEqXn2SHk2nYSxleKRHWja2aLoVpu/KdGw0QSR7Rf
	OnBKGSwq00QT8XUJ6J0xPbGNMsXaeqMLzZ6+Zvs+FQOPrL8kq0bTv6Dz+oMKphns
	D+olk46YyJ4BJCqWT91yUwNmbtYbvU/n0vYB3TMWur7D+P7DlzZZy0Z8IrYZCtum
	XMyXmoU46tAriNOpJzKgExr02iNrdV7Hq5uP+NKf4fI6VFnmXruwzacR2w32ELJZ
	nO4BNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0ke1213-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:33:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so236171585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792614835; x=1793219635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ych/Zf08x28o9LLrYkYPAjNwcDM5guKZUT1kj8rPdFI=;
        b=RdbjUuwkP68wlv3KlKj+BEX+ODK1v6F3OgVoh6qRfdlfBtdxLxZ1Mf8P5eNIMw0APU
         FrHq3xDtGpW5segmUAdyuaz6EkhK4kkofM3DKNfYrZ6acyY1smsiD4fBNK+BKfwasOQz
         4hm/dxmtvQGEbMh2jT9axYGXBuH/ZtWKBx6AqZaYgAx5ElB/ZCpkL3HOgdZh1R7IsmZG
         UsfcuELITGi/ag669QUeKeinfMx2r3MTUeRAM7yVl0ClCn8QZZzWdm3PdV39seKz+kUM
         UnaqWhfCFemxi6UDwzGvH1OTi7P9EVKMUcLRUXnG1ACZ4819wYJkKyW1VI5hRkgHQ9VG
         6rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792614835; x=1793219635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ych/Zf08x28o9LLrYkYPAjNwcDM5guKZUT1kj8rPdFI=;
        b=yKzc6pfYOcrdSCGQdLNx53wlfSFaxU/YLX70Wsd7QrIaWb1dY6MZOpljZnnXWrT9ro
         WJP0xQDpjWeaM8WJPGSfkddtcQqaZu6lyA1VgasryDLnQErv1lIyLV3U2p+vx8CWXWuT
         1mbYSZYJN4+cOOer9JbbO27Zpt9BVoPtOlTJPo3uv9hDXw9POZBfBxXcZGZ6vW+iLQnp
         cxQzzhalGxrBZczxRFp8Pb3kbgRTTV73Mhzb6vlSImEih4mNs9O/skCvOdTTV0XJwfkd
         69x5OaRxLu7ki/uheI6zhT4qSq3CY6QzbUKmxCM5fLQyyzjCdpFsHXdZqa6uc3RthUnK
         G3jw==
X-Forwarded-Encrypted: i=1; AKwUvBxiiyYfcbD2PgCdrpyAbcW6MKx5W90oteufeayHULlJ15lyWL6J5ipuEid1SNkzubeRY/xdtl0kCdfPNlY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/emkP2+qDQrzeoyCwsyTLEe+NeDmyRwR8fxYp0AYp5rbhMkEF
	0+QsrucHa3oOL/8tjs2wjplYEw1yCeBQPoX1+95R9jmPh4kztDW3gRkTqaTujO0OuWUbnesMb/0
	KUkb1Nk17DEmu5NKNg78UtmU4ZQgHUYzVI5XzFYPwNXwdk6Mju1xX5vTbdDYyuBWAmHE=
X-Gm-Gg: AYBFou1Boq4sTz8VQcGjNpqN6Oger2M9S8q3/NlDJBMWG/rUTYM4hJ/2W4egS2z0SnR
	+IyfBP8ZlDGhio6Lsyp5Zipzf23fm3WU2P/IZRW/T0I5WP4DQzpjjZ7TyAKGwLg/U1Mmb8lA7tc
	tlYHIyzmM9uOM1B8LkKLBTYprBtRW0PHQGi3qBThfp60j3oBw1UwhsW7Bfsi6TtJojGTb3WvGe3
	l+LrySeny9P53tbHBzIcY3QcK+8IZ49eXS2aA9WrK07uEb7KQm88K3rqdh0nFaqB+0beoy/CAUF
	mNAgzXZ3uB1LQzCtjwJQwIxr1ZwEgxMb63xfgsK0/LH1TAESWwQjyD7x1UxcQiC6pUT2ppqBMs9
	W50M1YYUrWu266mGDh6oknh6WkNagX+HjED9sYTPfAjMu7FGsRs44Qzmch9LG+A==
X-Received: by 2002:a05:620a:6605:b0:93c:c98d:e1b6 with SMTP id af79cd13be357-93f57f9c47bmr614752385a.48.1792614834733;
        Wed, 21 Oct 2026 13:33:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6605:b0:93c:c98d:e1b6 with SMTP id af79cd13be357-93f57f9c47bmr614747785a.48.1792614834122;
        Wed, 21 Oct 2026 13:33:54 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3887:4025:a805:2ac9? ([2a05:6e02:1041:c10:3887:4025:a805:2ac9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254ef1bfsm8068153f8f.6.2026.10.21.13.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 13:33:53 -0700 (PDT)
Message-ID: <912b3de9-cb81-4d90-9d2c-9b99297e2645@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 22:33:52 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Stephan Gerhold <stephan.gerhold@linaro.org>, konradybcio@kernel.org
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        johannes.goede@oss.qualcomm.com, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <atH0oW5j9pxsTty4@linaro.org>
 <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>
 <ath8tHxHOdA7G-Bx@linaro.org>
 <2d885d41-7d05-458c-8364-e206dab12792@oss.qualcomm.com>
 <atjy8ZVUW61VBa26@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <atjy8ZVUW61VBa26@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6sgKIJD6I-GBYT7FwhKiDFrWSceTvzDC
X-Proofpoint-ORIG-GUID: 6sgKIJD6I-GBYT7FwhKiDFrWSceTvzDC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MSBTYWx0ZWRfX26Z/RytAnImW
 bbKnFeYHqOfBK8Cb3Lk/6E75+DQwp7uytewtFyiOrKfrlaRPvM5r7ANon8qtHpfZ4E9DcSNPaDv
 bT4lU0rNVVt34rF8118eROoNHwDqosc=
X-Authority-Analysis: v=2.4 cv=KOzPn1Fo c=1 sm=1 tr=0 ts=6ad921b4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=DpSQHuFe0l2nUacwF_0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MSBTYWx0ZWRfX9fU5Pmt8HmTH
 1+B0Exo4/n/Bm0evUXmp2iSBxbBeQ2lqdoZVfvA9LamWIYIf2QTy6ADXyXmQ4OMlVkdkOXa204w
 BAsHEhrjii51U3ww7tMpizuPt+uL8l+iggOewVKuvXmzD3MHgR166G3JTROhukJ4w0GWOKwqbMb
 CTebWpTM+CWyUfBYL1YQcrtAbFmxmp6+Fd7MZn85UjTg5OfgdRnCyGVTD7h4biD7JxcUfyG7VzR
 VdfCzpGSWmpCT3FIZ5L8o9gMTJ19uYypUz1OAY5Rc9ZD+DqRHZ3zABBDggLt9fXgDEvvtccD31J
 uNNA4ywH9vCOdWcx5xXxDWLnO4yg0kH8YvSxxdzuI8HjhD/aqZ3/mkyECd6Dzzqe2aLEw3Pae64
 GPXTCHOW+lLlhigNx255Jh+3m9toeyuMT01/nOdpUl/ezUQZSV2V5iCkBdhs+wlZCmtONPg8PDL
 Zk8+yL8lm14cbrM7zrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210081

On 10/21/26 19:14, Stephan Gerhold wrote:
> On Wed, Oct 21, 2026 at 06:20:55PM +0200, Daniel Lezcano wrote:
>> On 10/21/26 10:49, Stephan Gerhold wrote:
>>> On Tue, Oct 20, 2026 at 06:08:56PM +0200, Daniel Lezcano wrote:
>>>>
>>>> Thanks Stephan for the additional information, that's very helpful.
>>>>
>>>> We currently have an urgent thermal issue on this platform, and getting this
>>>> thermal mitigation upstream is important to prevent overheating under
>>>> sustained workloads.
>>>>
>>>> Would it be acceptable to address the sensor naming and description
>>>> improvements in a follow-up patch, so that we can get the thermal protection
>>>> in place first?
>>>>
>>>> Of course, if any of these changes are critical for the correctness of the
>>>> thermal mitigation, we should address them now.
>>>>
>>>
>>> I have no intention to delay this patch. In fact, since I'm using the
>>> latest unmodified stable kernel on my T14s, I'm also suffering from
>>> these thermal issues. :-)
>>>
>>> On the other hand, we are at the beginning of the merge window and Bjorn
>>> is unlikely to queue patches until that ends. The changes that
>>> I suggested are purely cosmetic (the names of the thermal zones), there
>>> is no need to repeat the thermal validation. The throttling behavior
>>> will be identical no matter which name is used for the thermal zones.
>>>
>>> IMO we should use the remaining time until the merge window ends to
>>> correct the naming to avoid any confusion for people reading the patch
>>> once it lands.
>>
>> Ok, fair enough
>>
>> I propose the following names for the thermal zone:
>>
>>   dram-board-thermal
>>   gpu-board-thermal
>>   fan-board-thermal
>>   wwan-board-thermal
>>   chg-board-thermal
>>   cpu-board-thermal
>>   typec-board-thermal
>>
>> so we can capture with the name the ones related to the non-on-die sensors
>>
>> Sounds good ?
> 
> That works for me, I don't have a strong opinion about the naming (maybe
> @Konrad has?). I guess people reading this might mistakenly assume that
> these refer to separate "sub-boards" in the sense that there is a
> "mainboard", a "Type-C board", a "DRAM board", a "GPU board", etc.
> But I can't think of a better name either. :-)

Hmm, yes. That is a good a point


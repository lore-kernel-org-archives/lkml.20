Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291111;
	b=jf06Pi1gDUA+Kjk0GzoeYa/tDtSGziOf8BBFCNBQj3i3tUMU/d81DfIu3f3vdCJHqHzH
	 WNIo+vsupT+edrv4DSESidWzVgfAuDb3Gk2HFNIY+nkXjujBtvlohTsqUhPdajtYJNCbO
	 MoW7Yjk7wObOKYRQsOucXv8YvsKQA+aJ5OqpKuaUHqKuhPnqBGbxGPZRohB7Yf4H0KxF3
	 AQUwG7ATf2TPRSGZ317deqq6YTOm8tAclE6he1TJ4M6B4r/ribwZGBk2Tl3aUvMZaJHoi
	 Em0mjO8jZN+0/Jacghya8QuOtk+sSKCsbQc8rKi0L4+wu0yd5jFj1rwKRy5gm0+Ud9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WHUU4GUOeN2ghgJK2ElUJumx5e8totePhzb+UTaIVko=;
	b=0UeSueF7RylB8QZGIEzTZNS04AtCuJ9SFv5I2L4MWIF+Q7ORqQbKvAYQu9aflh6yrLhF
	 oZoZM+D9/w8kWjRsKaXE/oH3nKW0j8dPkDaqfYcc8S20yc3skT/NfkdQrE8zzyvYTECkG
	 GHjpxNnHXflSEvxprgGu6SQmRQ7rk0kcFyJ2eISFt1oAwmviBLYT1U5Wodkj45sexpoL+
	 mF3AlPLthfiE0wLE7awweI7WzKWF3Cnmm+cJY+zaCmNWgTWdxozT8AputtdKCo+v/bjRf
	 PLxH+wjgPHPv7Rf+b7Zk9nQunaIDFjcIGkR0/poscw+50VBnNNmykqoS9fYLewXDC9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsZMex3M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RRG/BEGD";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B57606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsZMex3M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RRG/BEGD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGF5qO053160
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WHUU4GUOeN2ghgJK2ElUJumx5e8totePhzb+UTaIVko=; b=SsZMex3Mdtdel1lm
	rp7ABocgH78LHOS6rFNUdjwO8e0GHQbap18dU8eE1iWCTTyNNUUZpceerclrFupD
	UnVz5Er4GHVCg1xMWaK9RvUJYpXxcgVXErPqnV30Sh6w0YJwRKX96tx3AnmttYJL
	vai1q7sOz0ak4J57dq4yj4N/ifyAJNAmUThENFlnh0XNaTVVPXAWGW36S6U7CjnX
	ZdjoFhJY4IPiYqyS1wQlky1tSqIuDBMfzaW5FQI54S7Y/AH5w9RM0RXSyzTF4nwV
	y7kRJ2QNqbo1Juwl4PMkvIDFnYE80USRoZYGg4kh+dI8eB9FljFYI0L0YSYImsA8
	hTSJzQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3nc13f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:25:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf3a6cf1c8so1647079137.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793291109; x=1793895909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHUU4GUOeN2ghgJK2ElUJumx5e8totePhzb+UTaIVko=;
        b=RRG/BEGDdeGvb5XVgKca3oIreRlRwTNqw1U75TuMyjEudtz2Nx+6f1qV3ccIRIjFQy
         HBNFB3Qc6YalX+TPnm2X8uVhwjxTOS4Dcrwq6VvtnAg+Ydg9m8I7HxluwCrwmraEGE6m
         ltAjWeb2nZzQA7eYitlY13OCMmeVynaGPnObBcIVaH8OaRwRcaomRq8oZ57W+Z5a0VNp
         E3n4OgpoqqBoqMvybeGC3Vf2ld3PpynWMNgu05la22UT52UDXQCazcPS33Lpy1VLWp11
         pzqs1/o5pfVc1sLsz2qyKNZth895Qvl74oJ++RAyoHySI2QSoao/xfOXqsfDgAdIxWJe
         22Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291109; x=1793895909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHUU4GUOeN2ghgJK2ElUJumx5e8totePhzb+UTaIVko=;
        b=JVvxmCX+TauhH0AUddav0VKyvPtiMW9m8N43UW4v9VJxCNnCCHKmLsuRhOYGyUzCLl
         7SfiPBPyiluiyQ4l4ao20Ei09g56aJ9/nIj3A3slAwUSuViI+/mPxHx7W04kaNSSu/2O
         dk+2FOtYNA8MdIairjTVXF1GBH4uypOlW9XDEyiED/UYj7T1jyUcj1YilF6BmGfqOfhN
         uZr4tF7p9rO5cvYl2W/qi9w7HwO+ENzRpta0PoMfZB9z4ytid9jxVNp5VgMvHTHw7yYp
         NmElYMwlRvpm5dY25JpuSaEOuokq5oHN5jByWLEp/vfXmKTAC5arGBlL5qWBOAzt7b/j
         5Ugw==
X-Forwarded-Encrypted: i=1; AKwUvByG3TJW9OQM/w9XcbKLnMBxsNf2+r8ICKOvTf9redH5hODr+nDlvukJtWonvuBZqdUumY207OwRSM651IU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhk+ky+0ubBm9IBn7QjSUeEx9Fvg+DRDANjlHjW5S+jyin172o
	HfmkZZto5Nle2Z8xminmkTFLpmRlk5+E9ETIP+RKcJ0O882jJdwegT/W7j70DfiSS0lT4Bm2cbH
	2yMPylApZdP9O0YCo8h09IVG308E4Xe1ihOxTjh4nJNLYtjZ5gHGqcudj5UXNSxf8LXU=
X-Gm-Gg: AYBFou0SMhzVw65pRFoNB0FAdPFeEYIByNViWu7HQAfvNRmcuQUcVK8Q239T68vRV+3
	CtqsdwZF17R1/gH9gedtk2Y/ZV/4U650hjSKm/O1yGz57uCizAZC2sXsOhLY0Z6+1mel+zPcvc6
	g722mY/oXa80+Q22cYJxbOfbhor5ViURiC+zdj5g/bfxi1FqOvanKtuYnMn6kKD5xCgwTNaztAW
	q5XMLePSPs+Szj1vL6ZghKEj/jUFp37u69hPnFAARVSs8AU9FNC+yyJomnakFsFJvI4IQ44jMO/
	MjfdsovhpyDjEBi5+fU/yv9e4A17wlQQeVt42tEGpNobbKn2ZtaLYnq33AUchVgPmbumnIBm+ZM
	npuuhpLMl9NNE1BZUxag3lp5hqYT2YcFA7pZ4oGijmWq9Vsel2xJMnISI9tDRhwxl0Kfsb4FW/I
	FWLdV3gWYMO9be
X-Received: by 2002:a05:6102:448f:b0:7cb:bb33:8413 with SMTP id ada2fe7eead31-7d03a417ec3mr3095923137.9.1793291108709;
        Thu, 29 Oct 2026 09:25:08 -0700 (PDT)
X-Received: by 2002:a05:6102:448f:b0:7cb:bb33:8413 with SMTP id ada2fe7eead31-7d03a417ec3mr3095908137.9.1793291108222;
        Thu, 29 Oct 2026 09:25:08 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df9625bsm163829f8f.26.2026.10.29.09.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:25:07 -0700 (PDT)
Message-ID: <ada94208-4a90-4e3a-9d9c-1ecc87b53d6a@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 18:25:05 +0200
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
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF
 driving
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
 <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
 <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
 <1371d5b5-d347-4456-963e-8effb4a82f27@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <1371d5b5-d347-4456-963e-8effb4a82f27@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2gbW7ctyKW5WYGpgsxxNkhxjS8w1xdva
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfXwZcOtZ0jb2Vi
 LlR9UwuQaK6pS8H5ukTCtO8+U6Og9x/45UZy9eNfoplO1npVn2Bp6sgYsUYP/zhgnQIcIrpfuxF
 aQBHe3FgyU3WP8hzqPGhk8tPHL1go/nPVB4Do9QtgpMyYf5AbTJiKfttggdUnnpwmAaP4BDC/hp
 vm11Ful2pG4O966gUjorYma65txXeXX8d275NHI7XPXkkaFNc83iiz2bScACypRjcJLxCdYnOYw
 mf0f+W7lC+vJHA4Ypa8DqsWM3xKKe4Rj+GWMDjzjQBZj3AlOs5wBAiJy+DUdWtPvrcoO9ZiW5Ad
 Ijy/BoN85c+rbgQjRUKnweT/UpAFS1Gg5YVsIYJFaw8ziyoIT4LujqWJ3iUtOMauBxjQ18RXUvF
 RGSn6Q/98dNaqw4lMBe+JQ45jsyaOI0Zqix7/Jezout3jGR5vnInfLQROcgejFxKKhnvHAnzpoB
 SunCU47wsZJa09wFNzw==
X-Proofpoint-GUID: 2gbW7ctyKW5WYGpgsxxNkhxjS8w1xdva
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae37365 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=9i6KQpN3WAVTwM4Z1z4A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX7TnwXHhEe6bC
 OK9/E19J4pHVWkFlIa5P25JOZ7ehKnpg7U4sdScsxvUA5UEAUmbEUMbkKJ/csFXsDRaEssLLQ/q
 eYnpVn5FokTk7EYLgQTy0aGhqMxQiiA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290064



On 10/29/2026 5:49 PM, Bryan O'Donoghue wrote:
> On 29/10/2026 15:46, Loic Poulain wrote:
>>> Is this something that should also be tied to frame_sync_en?
>>>
>>> Also, just thinking out loud, are there cases where we'd want to
>>> toggle this dynamically at runtime based on any V4L2 configuration or
>>> pipeline path? For example, should it be enabled for the pixel path
>>> but disabled for RDI?
>> Obviously, if userspace subscribes to the related framesync event, we
>> should enable it regardless.
> 
> That's the behaviour already :)
> 
> Again though we want SOF so that we can drive seqno which really 
> _should_ come from the CSID signal not from buf_done() *

My opinion is if userspace does not need on SOF events, the buffer
sequence may not be  important. However, for use cases that require
bundling and matching frames from different outputs such as DOL,
it makes sense to tag them with the same sequence number.

Therefore, if this feature is enabled/disabled if userspace
subscribes to the frame sync event, this behavior should be clearly
documented.

~Gjorgji

> 
> ---
> bod


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB3E463B6A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055527; cv=none; b=HDxgJzEstLFtx9Q8vJkMBP7dKL3TcR0yfzkrEuYd198hXnIxzDBxCm5yukQgFCfm3CZmrmyo0cBL96oQZtRW60bLVrzX2YLB23oU58i5rrnyaCxavbST6ghPRxktgeCKa63hShiPpg407O5UkyjTw/Thk28KhtJ0zOvia0TiVzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055527; c=relaxed/simple;
	bh=14UNhDwSqIGwxH8eFCUOb/Ru8LN9tAiu4BmjCrwghaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vqrr0zk9knshqub3dgEfIDB5ZRHdUQqh8OtUl2DCufH+01dvcIbiyGK+do/kCNAmfNfUUdn02TNjokngrF173cPou5tx0ywchBPfxyFNuu0uqvtOoEcNkSBdFNGqfJVJs4mQUNwOmsDA/8aPfc8tZbELSsPG0X0IF4aJtTEL15k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMNRiQwI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdZJIOaw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMNRiQwI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdZJIOaw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7qtrI1707237
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUBB12m89z/qSO0zlxArjpEPX2BkQ4pnL/v03QTeSF0=; b=aMNRiQwIIFWHlTal
	SIMFgwXbrdTzdpk6c7h5Fcz1W4YB/+YEt+u2yda6R1bMQEhvFAFGefcMhLVx4d6b
	cfrx+yJtHLY24a0xFmPGjI0TgUQS36D3YZFADs+ib07/NM0eNuP5HDMeuDPBF3Az
	FE0Z4+ApkZAntbkmtGmpDzjqllBIQo7FPDXkmRcQRKc1iTBOo23zjKxOiDzxLtxE
	xDEGP6YBLly6OPtftIC1XGtF7RpjLajAgWFHSsXoFHXniHNU0lpjME4SKEJ2w/rM
	bjC4ShzKR1cvtLxdqSckr/Y/1bkdqM0G8UOZUmBocuZ4WnZLj6N7+WgYxtkOgZ+m
	oXxSjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54sq92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:12:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cac495d99so39317985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055524; x=1792660324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUBB12m89z/qSO0zlxArjpEPX2BkQ4pnL/v03QTeSF0=;
        b=LdZJIOawlbS/ar0c4iL2op4HXcHDicWfU5NnYxtsitHluYHJzrUBWSFlCdAX0DK/JR
         STR2bh4ugvTf2zjzLEkifKkXq+mqwVsG+CoHrFwxSBE+Nlg/3vA/4VTf+RIYL+HHRtP7
         NPlnOwhZMoTVcMi/lw00F60wYHMTgXsCTV70Va38Co8+y7kKfwww7pgoJrm7MljxaZxg
         WN9woDzk5TPf6Zf9XnWoK3kPndudq5GG4gnxiFnHpTZ9P/KWj+bQj237X1yhYYlP0X4+
         ZfkA29f4NxZ1ZAqb+nRk8hVlrQzQr/3A/xwV6hRSfExZUTt2P7h2R6kOEn5VKD7w1DYO
         d43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055524; x=1792660324;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUBB12m89z/qSO0zlxArjpEPX2BkQ4pnL/v03QTeSF0=;
        b=HnFKuOf0/jjqfOd0FrmoWgbRHvxg+FQXKMBPFRANdHln0H5fy+977vdLWccPdlh+Bn
         QQPnJqWB9FORdOA95jiw7yfkSkm1ozy0ti/qjoCyB/0EqgtvtQZTQCyRPztDw7A0oTEG
         0I00SUgcinIdgGePpaUralI3nHMjmyhjUPHzU2XIPVaSON4oqHWQIg4jiinw32b1sJMR
         Ur+c794co4exyQFU+ExiRE7dxVci6ka4UNG8mj3ZyXxkh0S7Jl+QW28oNGTVBbXlpJqL
         S/B2fr0/6Yb1C/0iqxJ7fX1qRqbKMxp5co2No84po1/3oj2ijgSwqWHfYniS7/kzihUk
         dv0g==
X-Forwarded-Encrypted: i=1; AKwUvBwLaZFRM5L8w+B5mzJTtzfCV7JuK/4f9aURNLxuggxuMIGhzNHdCJ8wRzWj1LOsbM5DD2/srm5QXsFuQko=@vger.kernel.org
X-Gm-Message-State: AFq9FYLv9ER3IELuAReFWmLP2xk0P1jmkAYDkBRhFum9yNzzwjA07lNZ
	6sKuQi9S0b0GwynzS+AGXF0lj7ydcoStAF1dDLRhwGzZ6/dK6179vUS0N/pCFMatjmYbqPhmUGS
	tx/+CBilvs2gBbY66zVUXxJd+cb8p3+O3CsjIRHlohx1EQH5OqzoIXRjLJ6XBr1CvBxc=
X-Gm-Gg: AYBFou3O33VrF6gVUB3Nd5ECCqQkRNs+aE0KpQqguGDg5kM4p4rraUa1bNOh4M1/ySV
	j0ACU4KWOMRyCoOWuKe4V/wOw3XhpnH8xjTeYVqA2X0lMNmEtkK6RSLBXOdlR4eFHukvScCWKxy
	S4zjv3gF49Lkq+DFoGbCrknINaPPzumqokA821t5vRUkb3MRDJSka+ezlM79IS+28f1HN+JLzPd
	sUyJW6Prejz9KOUx7z7guTfOlz+t0Ix7Wirp0GLH31A1kpB5pEiTE6qxKgqor9p9wmuU5KDvzwX
	bhdY0WeOuZ0h2xbYJMDWffwMVtmBhQb5Yko9TVripDNZXMhQGeXaAzfE0USLdeH36XPUmscPl9A
	d5VJUPYRpz5Chu9OXGGhESg==
X-Received: by 2002:a05:620a:2b86:b0:93d:9dbe:5bec with SMTP id af79cd13be357-93ebd10b418mr3112658285a.2.1792055524094;
        Thu, 15 Oct 2026 02:12:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2b86:b0:93d:9dbe:5bec with SMTP id af79cd13be357-93ebd10b418mr3112654885a.2.1792055523631;
        Thu, 15 Oct 2026 02:12:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20388c1f1sm2263767a12.26.2026.10.15.02.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:12:02 -0700 (PDT)
Message-ID: <eda50ac2-bd4d-4151-b041-7f9fd56d9fe3@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:11:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] backlight: qcom-wled: fix unbalanced OVP interrupt
 enable
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-1-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-1-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad098e4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3BQMGBUH80HoBbyhx_0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX0pW+7ncaJ/Z+
 V4lg7121GjCSyOA2IPdGDnCFXQd/9gkutV1PTwWyv+hvjnpAwMyH5Do0I2RQ5ifEtvuSj+5jyVM
 oLPOrqdyLDKRYHU6/v/2zkY2nx3w5ysFmX4zUkGpet+NLuSxpJY94lNyA6+p+8Rsu6hmfz0rGZE
 qWFTGrLQCd+1Rr5qJ3QR80wXWbFAcymj1n3+h5rEADNzwpjOXGRGNmM8IJhRXRn5CELYicjU6Zp
 YeSuLkAYu4Zth5wswUP28fuMEuvGNvCgQNKjZrxVGUDGK+RK4qAVIgdb6/pmmRelUsMzMFtKS05
 RsWL/XGGls5a7yL77F9u4gvtlub4V2i9356T0w8XhhkRPAn9RXx+F7wj2UoXHXv8/3ZaQnzqv5k
 kT4k1SsTYBJ4o9JaJSEHlG9ewt6Ythf3+zXDkduLeXsjeDZz5w1nhYMpDYHHTeVw0jitWy36SZa
 0x4SuLPTjCZ1eR4lDpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX1okV8tUISDZm
 YzXLpyc/+/5hOdioD34rMt+l5pFAMnpVVzeZ7pJ3kEIMdzhR0QM7oevnqvB1w3GLGk6h8esQcNT
 CAiR9tKcNNoKBPMhDzxIGzdor9586Lk=
X-Proofpoint-GUID: rKhct3zWoKksKTcnxtpmtWOqFaNTlSWX
X-Proofpoint-ORIG-GUID: rKhct3zWoKksKTcnxtpmtWOqFaNTlSWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> If the bootloader leaves the WLED module enabled, the OVP interrupt is
> left enabled at probe time. The first brightness update then schedules
> wled_ovp_work(), which enables the interrupt for a second time and
> triggers the "Unbalanced enable for IRQ" warning.
> 
> Track whether the driver has disabled the interrupt and only enable it
> back in that case.
> 
> Fixes: 8663c188beea ("backlight: qcom-wled: Add auto string detection logic")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

This was merged yesterday:

https://lore.kernel.org/lkml/20260921-qcom-wled-backlight-v4-0-bab8c7ef73cb@ixit.cz/

Konrad

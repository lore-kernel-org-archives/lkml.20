Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865396;
	b=SOgJMxRtgTDZaaxGFzHkcfxeGN8Ur0zOz7FZ5PCDI67cnC+tN4p3iRiO4Ql7RORTknd6
	 oQhi16int27G3buDM+otXb1gDvdZzgc9dDEiUax9YKgS9mdXb6TIg7H/hhnXF/Ne2ayPJ
	 uA4VE4KKa56NLw8M+XuLFtzwUlIQk0AKceLnEWkUFccCLQwI21eijzHsTfCO2bzq/PeNu
	 SCgL9cE7UKGEIBq8kjtHQJ8WW47YIAfdC5W/+KaJHtTrLYkYv/PI1q+2hZeE7eP4Gpavw
	 WbhiyVKRmsPPOmXlVTSXhg+tS91MyKsH//D+DxL0LIl3eMMRrbxwpImx1uEZbhiZoFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865396;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z95zJjNEcveUOGv+Ft/bTJHehaUOWuswuWjxqJIJ7rM=;
	b=TZyeO1l94bYsicvSwlRILVFh7R808IvZQ0b+qkz6dl7gBPHydoeYj+Z5DAHWVmRmu12j
	 R+IE441kOqJeRM/2wEDrgXd8Md178dZE9eNey/pmK6jPX30Q4HEuo1oRY0/Ao/riRzIdh
	 QHLMdASgqUIzA3wsv+n6XuKwNQOt/D0tSSNV6L4uV1xHwf+KTgG0nBd0edzA/GfUaz5rk
	 dp7pJjpu2LB5f1HGvIXvvxXiTRWcpQnJDsdN5/JMkfYgSw71Nlv2i23PyUrMOnBEny2yi
	 KFGvK5a+4m4AIoZVwTQshBn1opePe7VHTL5qy4a70qbui4gi1tcfYDxNhuoYx/QnHeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XzXoREhe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WuQIVIwl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80F4606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D80F4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XzXoREhe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WuQIVIwl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UEwC565298
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 07:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z95zJjNEcveUOGv+Ft/bTJHehaUOWuswuWjxqJIJ7rM=; b=XzXoREheXEpQRakN
	/q9jPyWh12BhXBC6alrTAsQrOLIp7y4u08x7CBCCwFIKR6POxc73uQE2VS69Oyxe
	TuLUVDgbWPgL5RlJI8k9jdvRM6FA6yUl4X2vKpXUpFI6pKUF7C2yEtLZ99aC9y8+
	Msp0cdsj/hBmInT30he2WKYPebBsOZ8qSN8NPhjGFQCKr/szkHNLfaAmjlTGTHYr
	M0lU9cts9pr8eAuNnrd5ZPT6d188DwcBjdXpy/ggqPSwMNP17dD9Jx0F0W2EHfd2
	cCskNBk1jPTvTHpMhG+fmuFSlDiMz63eCI/22qdciYkr3/6QxP7RxCR4vsnrRvNP
	LkrS0A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq8n3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:56:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c4d46037eso2317196d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793865389; x=1794470189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z95zJjNEcveUOGv+Ft/bTJHehaUOWuswuWjxqJIJ7rM=;
        b=WuQIVIwl7XPYs67KhdygZuhIgct2FJiFTvcbfZVTDEEcy1fMemhrK6NlHlyWypHSCb
         evfJFqaDq/uGGSWwESRXGu5L8OuEKyq0CWHEjReTXvmRdceOoPxRvXrQWmoZqRPLrNeT
         GrOFy4Hb6aa5Ea+DWX3phbKgrkILKZjW9q77GDfEo7fX0xgrHkOIV3r2HKdBJHrSdbrn
         PJj3J1pFbwZ7VO1ubG5QiieYJrv3cFP0hDAdLih1a90NSh5IDwwCPo2h6x8VaXbeq2CK
         8A6M4j+CdPEpMeOUwc9q8finTMh1YzVWHGCNpVWLufXdOjbxKIMFek3rkOH/lkJihX/c
         bB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865389; x=1794470189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z95zJjNEcveUOGv+Ft/bTJHehaUOWuswuWjxqJIJ7rM=;
        b=J1/QB55FSrLOTeRTWaE1NAInsd3e9g8ppQwqUs5RBp3pp/a0ZHf65HzBVnTn1TeY/w
         i3pWt/ezRmf1pbgNs+Q03HiBA/ujTimuu552AnOpdNh/XiKYrZIZQ+1sy9PBq5GWMSw0
         hF7PofEju7AVgjTNmNky6gd5hdX6eBUrDLGJnGNPqZ2JLu55RNLdFHbU1A/3W2ojUYXM
         f3LXXnrIiks0T2PYx5pKHdtw3XwWxoewYE65n2eaRFxEeJKhET87PpUmlQOHxTwlnT3S
         XEYTrB/D6T4wxMJPsPE9cL/NdgxbDWLjJbZSrsjhppDER8y8y5asvhT6bv6F0RePVjiN
         XQDA==
X-Forwarded-Encrypted: i=1; AKwUvBzkUlthoHRdLBzsNdw5yfoSzHtw+zNSXB3RLJrUJCWZRyTFIESyJ1LrEMJpdW//FjsjZAvavNtJjYLCwEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C1yWHd81FMZB5V8wmyjHQTjtagW+iQ4PvDtCq8DcvNGXgypYi
	8QeuBthPytu4uVMf8R5GhQfwZuju2zu+mRnmjzxUR68Hfz/FO4K6rWv+5abS2olQUpsEXa8mIK/
	XMv/3d3m+DBH0oqXgTlrI3XtjhO/FlidrTQJSm7A0B0p+CtpWUFLCRCQA90DpGIvrLS7vTFXRyi
	4=
X-Gm-Gg: AYBFou2p7X8nKKoQZ2IM/q75iOJIWTGkHizjc+iJEvyov1NzZ2GtG4+dUcWJ1D47JqN
	2Yf516X7f6ECbfAsbB2BHPg+qX9/ebUFWg2irZ4MpXmJS0Wxj2lq5zYRjQDTHBzuAsNm2aHSmoS
	BQr71eWXCrXU4WPTQBE3BbOQTKm27lcmBGdXx0AFDb9hCMV0QfWPT+qssZPBxaUlvsNXCuatr4l
	2gUKEx+nfeiZBiJPaeliUXIbJpYHQCWwvOfLt8gGGVd8wb9aLYY6f0EkX/g+AOpYe1StD5WokpY
	Ms5JEo8xcoeVT6P9iR2I8zSxxi0Mtk8LHMUd+MOUPAhozgSMlinQ33dPip4eeGWaE3Z4BLvNu/e
	9sIohyeAKMhZRdax3jrE08pOsWfOSQ+ZM2Zpp8cqzDXNyA/y3BN+rYu6Fy2BDyMOv/Fyg
X-Received: by 2002:a05:6214:1943:b0:914:4464:41c4 with SMTP id 6a1803df08f44-91ca4b23661mr389914846d6.4.1793865388983;
        Wed, 04 Nov 2026 23:56:28 -0800 (PST)
X-Received: by 2002:a05:6214:1943:b0:914:4464:41c4 with SMTP id 6a1803df08f44-91ca4b23661mr389914496d6.4.1793865388480;
        Wed, 04 Nov 2026 23:56:28 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e41e0fasm150506566b.19.2026.11.04.23.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 23:56:27 -0800 (PST)
Message-ID: <d4814d85-cb8a-4079-8bfa-3a2c6267d158@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 08:56:25 +0100
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
Subject: Re: [PATCH] i2c: qup: Release DMA channels if interconnect lookup
 fails
To: Yige Jiang <yigejiang86@gmail.com>, linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
References: <rc-review-20261105-vc-48-dbf6a486c74f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rc-review-20261105-vc-48-dbf6a486c74f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -fAsJEDdy0UINExQEgquzxtJSJmdnBLg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMSBTYWx0ZWRfXwO8h9q5IdMmw
 tDNLervSLImfoeigelkgcdc2j6rT20myMUErogdDjiFZ1Vn6OrdQPMUkcIZgat5vdlsEW2ef8g7
 nK8iO2ST8otKmVwTXTb/k87zsfKB+fo=
X-Proofpoint-ORIG-GUID: -fAsJEDdy0UINExQEgquzxtJSJmdnBLg
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec36ad cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=0RPhLGylvT0nOadtWzkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMSBTYWx0ZWRfXz7OhENRDDB1E
 x7KcrZYztQ3JiYTvkzHGoo28HQkrzWNjupape+sbdgngvY3QrCZqsZ+ZHgP280FbyEJOtWLz1iF
 1X6zIKyYWIEefbLYt7rdY0w+k8Vqy39H50UM5ZRcQ3iFRyFtIefccxDJMSy3sZSdLbj7tSILAvd
 95iSu2WkAjAskqEqHSjh9eBrTYRRlH3lQFUo7ByiG1bEC/QwbcJ74yTxIoLcZYndSjYlW0XTWOR
 KASBgSjcdQryo/dbtSHhzVcbkAtn5EKY8b9wJnIH3A5eANMR2UyfWZ0Jm03Rvcpj0YUZiho97v5
 duWSL+rrYVWKIOZYf4oXvT/S4I19ZQ3YkJTSbiiNY+H4+XihrcAKGdLxe7sjKuDZrVM+B+fYod0
 e/HalXmNPiR0xYVMkRiUcA4mQq4EuqEYW+IN3Gdrv1XkgJ6aAo3z1GZCcfQpxI+D0Xr41yrtAiQ
 q9OXz6L5y5aNEtuyLKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050031

On 11/5/26 8:42 AM, Yige Jiang wrote:
> qup_i2c_probe() acquires both BAM DMA channels before getting its
> interconnect path. If devm_of_icc_get() fails, the direct return
> skips fail_dma and leaks both channels, including when probe is
> deferred. A later probe can no longer acquire those channels.
> 
> Keep the reported error code and jump to fail_dma to release the
> channels. This avoids the clock and MMIO cleanup, which have not
> been initialized at this point.
> 
> Fixes: d4f35233a634 ("i2c: qup: Vote for interconnect bandwidth to DRAM")
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---

Can se use  devm_dma_request_chan() instead?

Konrad

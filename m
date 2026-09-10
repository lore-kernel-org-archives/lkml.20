Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97C53C0A0D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025899; cv=none; b=L2dNn59IvHGJHFvJ6bw+olP0nF5ZOL2WxQ5UEXMs8ApRgqD6Q0oEURx81oVafS3b0WIG98alykEGM9wWeZSvSAOyR26CBs7sxFp8ZLlVQJ7ZRMPOJVp+W1DfiS8G41ZlJqECNTYHx5ixC0FulnbdKFLch6dJAX/TLuhJxNYzSuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025899; c=relaxed/simple;
	bh=yFx8LJ2aOskQ5Z197d1d87Hlzz62gvVdXK9GUbtNQiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcRcdA63x1x+ifZcuTCFsIcovply5+/MICVvv6J8+4veasrgjRpx+b8NDC6viGUU3J2Kau+tcr9K/bnltgaV8p4H6aOLUMF818ODqa3f8Jgqxdtx5J3QhRiw9EOykRkj7hoCJzIhyjlN9h7RLg4tL5gtbxBq3llnE/5iL3evBQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ict7Smoo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmnjiWD/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ict7Smoo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmnjiWD/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GShD3487379
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpoNQYrLBIJhuLHAlfG2fUBcoGRiViUf1SVLvCEmnmk=; b=ict7SmooToVev/87
	kEaF/I5qPcL62JfNAc+bOgPli/WIhWXg/Hwyb8pJsf11TCh6Fp1L7dQYPL/p06WM
	QNrh65a3cKtmU0OQLTf9cC0KrxXBVRXYOcMI+4pNc/ERijfYet8eQT27PRp/Y4F+
	HtqZXJKl9V6pVgyWN2Ufl1Or1lE+yEeVcNFIDGbvgHaNQcC06rmMZA1unbF4pe2w
	aZ8wlAuNv+CXa28W9QcJBT2WIn//HYZYNtx+CmeeGEKkUZ0Z/ZqD/+DK7WeouHlZ
	yKMtUhvR605U3MJ6vzyw+TSFmtt0DW508S1PpDBFFp2CpJUpRpgf29oaJPLvW3x5
	A9QV5w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyejn9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:38:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90cd500ad0aso12490896d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025888; x=1789630688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpoNQYrLBIJhuLHAlfG2fUBcoGRiViUf1SVLvCEmnmk=;
        b=OmnjiWD/ChbzsYPBEeosNl7QUiphBOnfBxY+fBOwO71xXtrE3veOxRcDjhqdEY43KE
         uCfIqPvUVXOG0x4m7xw88t5tcnn0BWrPx+t2HaRHIP2mD/glBZ246vavVxFli9cacC3V
         i4XVJ5qiS0ccFsvCbB9BK1Gr4vqWX7lZo9Zr88CTiFqG1/bSh9vJ92FaBZGM0GtDU26B
         XlkiQpSVarDTQiPifHVjisOkxW+eFguT7yVka4KrfVJxs1oikOs+Hyl5ZTiqxZaJUu46
         G0E7KFfsagjAMHUSHluDudj5U1KggBYPRb+d0tABpk9bVfJBfbs4zAh4KR3dVop9uR/K
         nyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025888; x=1789630688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpoNQYrLBIJhuLHAlfG2fUBcoGRiViUf1SVLvCEmnmk=;
        b=N9YtkkyCJ2bqWn/NpF+yb14DmeYMsKD5Am2BGuPnsaFc4+7Y/Ri6q/GG2iNhKye2GE
         4Wz5PgXYoQE6/e3Wqa/o6qwClPsmODIJw6rsm+vfdn6dWwBNekRK9sPzXmNGPvsCNA2P
         tbktNce4n2ZJwIRxNEqOT8pruGD5T5tiUJ8R3gpdzoYFt6k37n5RBCaDdFqU8jxlte13
         JXBc05LkyrUuy+0oJzdrSj6lQ9xzixN8TwcLXL6yx1kUvtF1jGvoqqPxDC7UcVpDAciP
         ZIO3wlYTxPNBw5bx4HrQRnrdkNwZkAjFore1E9y/QvalPp+DEL+dnDEOKX019q3KUFr+
         76vw==
X-Forwarded-Encrypted: i=1; AKwUvByRTmF47eT2MemVj6Fu9RBMAH9BEus3GmIdGCPXZjswXOxnGDVtV+XHX5vPxj7Az0A7NmdGEXzuqd3ssxI=@vger.kernel.org
X-Gm-Message-State: AFuF++nVE71WoU9+wfMZGuHwtZ7aK31uXFewb+FWUFq7YkoTJqmg1YIi
	l664sUCu/PwHx9Xf9xo2VN1Bc7KG5UR96G5ILiHFoOOzUXs2Ufe10n1bZKBeT9F0tauIkP9zWBM
	VVJcFf752uCVYOOBvkNweUEE2GaXU6HBVALqd9DtJsK1/UjVGIFk16q4Pibzy4L4ZyjQ=
X-Gm-Gg: AYBFou1KlWpKivrWU1O9Sm7D5i5jwZo3fndyWxgIgbTI2d9Ra4vWLaFc6CRTPv9kChT
	QcQRUrsQ6tEVAKOa7wYjXfLIvvLYVsx4gLuj7TrPB/YRlZlPfWz6MGvRxUjmn9MlJ28Zf2AOyxJ
	DHN5YxxUSRM5OvlK7GwHakib3wQzpQKQfFJjgQrE05kb1MugWs5qIYm9UdhrAXRTjw8PBJEe4Bc
	ek/BPy+xCuG6ge+ecapcK9O1c1x0vRMgYOmXy9ZYxBqlOzDrO+KrrihVlqx0JN0rEJDi+JOjuZP
	uIl9oyJrmgFSwijuVcbLcaD8+9CFHUxfIDOCkxi+En/+6479rJXhhEF0iTbIuifRFtfyfUGk315
	aaWWJ/6mgHoBoafcRUImz+Q==
X-Received: by 2002:a05:6214:5c47:b0:90e:9aba:f095 with SMTP id 6a1803df08f44-9104796275amr329705716d6.5.1789025887644;
        Thu, 10 Sep 2026 00:38:07 -0700 (PDT)
X-Received: by 2002:a05:6214:5c47:b0:90e:9aba:f095 with SMTP id 6a1803df08f44-9104796275amr329705556d6.5.1789025887275;
        Thu, 10 Sep 2026 00:38:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca88fsm708891166b.17.2026.09.10.00.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:38:06 -0700 (PDT)
Message-ID: <9dc6664c-616e-4a8d-8cd3-9a790c09fff9@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 09:38:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] interconnect: qcom: icc-rpm: Don't skip small votes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-2-6dc5b5e97626@oss.qualcomm.com>
 <eguvscm5rutrezg3n6oncxfbma3qolho6acj3uibiknp732nah@n7fhrx5jyfdd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <eguvscm5rutrezg3n6oncxfbma3qolho6acj3uibiknp732nah@n7fhrx5jyfdd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MyBTYWx0ZWRfX4w3PienBX/Hy
 Hkp9NxDXLzLkgKgrRf7X5cN7yhUyYql/3XCmCScOaoEDmcsx2UP4OMSZl13Oi3EpcBnGxwg7hP6
 OEhTltdZRi0szulKBjObQBDrnUHFsvQ=
X-Proofpoint-GUID: C5tGfg_CLCpxYfCmwA8ToRhNc-WhzC1t
X-Proofpoint-ORIG-GUID: C5tGfg_CLCpxYfCmwA8ToRhNc-WhzC1t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MyBTYWx0ZWRfX0t/9NEOaUf6i
 AhZMMbGxarWSGU0Lj6HjPpyL7Du0vQ/vNCAT5TWJUl3GbaVo2OGY55nFHWgLk1Nvig0cqNYVeRQ
 LEYeA4LGJG1K2RKUkfJxPr10lPumis2rZeLBU9sW48geAU/x6gwc3HBhnHcmnYmIj8oXaYIDoKs
 uUviiQ39MVpZxEAQBi4k45xa2R2Ng/2JvgDRxDyKUBjnF4bvmiVyJFiIOFLtAHz6NyAsW3XcLv8
 z9IsLQdD9zVO+KizZVA+3OYCirhmOa2kdaK1edCJqh5lPKVcHIxJh+7DX0aLmkzP3RNwkspuYQ9
 zdGI4NE4W1QbPMAi9i/yVTD7/17f8kQOnC9ZrLs6TRE/26tk061UKEYhpgfRCRRfYgznYBmZL/4
 y3Z4CLIkdAc9aj84zj/d9j+2QWJlpNdRgrdogXuSCZ2CJFWHD58vM1fylhdnrq5HAYm6rW+/MyN
 tDJQ5ofzeio7JNHmx3A==
X-Authority-Analysis: v=2.4 cv=Go/XaU1C c=1 sm=1 tr=0 ts=6aa25e60 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Bsi9rA6XVeWCVWKWEHwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100083

On 9/9/26 8:38 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 09, 2026 at 06:41:55PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Small votes (such as 1 or 100) can end up being rounded down to 0
>> midway through the calculations. Use qcom_bw_div() when dividing to
>> prevent that.
>>
>> Assisted-by: LLM
>> Fixes: 30c8fa3ec61a ("interconnect: qcom: Add MSM8916 interconnect provider driver")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/interconnect/qcom/icc-rpm.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> What is the reason for the drivers to cast such small votes? Isn't it a
> mistake on the driver side?

Yes and no.. the interconnect infrastructure on RPM/RPMH is a bit
"meh" given it accept kBps values that it then converts to bus clock
frequencies in MHz that are then clamped to one of the predefined DVFS
levels. Many drivers want "level X specifically" or "anything that's non
zero" or "anything just above the first nonzero level", but due to the
differences in topology, that may translate to different values on
different platforms.

So 1 was at one point deemed okay for "i don't care, just need the
bus on". I'm not sure if the uses of it are valid, given that doesn't
*actually* reserve the bandwidth on the [most often] config path
while the driver may hammer register i/o pretty hard, but at least I'd
like for that to give the expected result.

These "safe-divisions" are more meaningful in the RPMH world, because
each BCM defines the units in which it accepts bandwidth (may be N
Bps, kBps etc.), so there's much more potential for truncation there

Konrad

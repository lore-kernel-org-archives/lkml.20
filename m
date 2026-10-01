Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8231F09A5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852794; cv=none; b=VNMI+CLhYshnO4FLwyePU5h6PKnUcZciqk6/QU60rhDxgP5Ymlb0Ae54pHWnOtl8KCcuR6qVz6suatfXPFPJH2Dag15C5lRbUgMDI8i2tmyJt/simXmayOtHNX09lBNVE2ITLf5Ohj46BKVnn0zl5hQWV+x4hYs1ATCVgmXIu6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852794; c=relaxed/simple;
	bh=OudGoG1Xw1V4jzeG/S5z47MQq+WzDcNfiByweynrSHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OdUGToC0XY+vqL/5ShKLsMpZmam0IvkAe4nMSx0AaX7GCPPRm7BJXVjqob4mcTb6Ma/0emv+8Ct7A3e+7pToBvUNEPelxt2SLMXjnElzcf2ixE7TfAOcNdpbkiaEEqKRTjvqSaqC1w4t9GPNmyXQuEoU0sazJf6hqgbcDOy++QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VcEYBc6+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSkzbXRH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VcEYBc6+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QSkzbXRH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xaIY962458
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 11:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j07mDs8hKEZ6BOzq0/CtthubvO4QWRGm91M2icxKLIg=; b=VcEYBc6+b4C+WVDb
	iLdfvqBvSw5hT01rhtU6/L26aw81sYFLL3XXvE2BklbjHA55Vf0/0eA90/e+lqtn
	kvbrAvmpqAnU308cfX8H3IHIDxeO7aOpi3nsm7ELV538arP44+bJ0z7CBDYE/7Go
	hX7RW4iXzt2hTVuu1UkWr1CR7aDQehJkelwt4fK5fNsHfcNhea8mRpuWsBZWJKVe
	hwrdYktc9vK4+B1xC0IV6oHS/Jxojr0itEjWq0TpL7ofIGop39mT7rqkxJZYy4sq
	Ycat3YypEdZvv2hqRp41bCFP2Duf88xS0m8X/AFWxfqLoE21hNKzEth2vvNyOCia
	Wi6CfA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcuvr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:06:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bfa915da7cso496353137.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852791; x=1791457591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j07mDs8hKEZ6BOzq0/CtthubvO4QWRGm91M2icxKLIg=;
        b=QSkzbXRHYhFrSrpOerNCAEKs5BKuM7xXRRAfcOlyhYgf9zkkCmHSeo6x3fFng2Htkp
         QeeISg8YtAGBRKzvSGTLiNi3oG8QEdrtnzUxEV3EpHfzuY30yPNN68TG2WZUT+wQEbnU
         rv9lyJcTFa9NqzZmw+oLmpjROEot3tRHc+kSCbNhHfXitg8i+aP+WgiA/yXq3qy0RHbC
         sma1lRdSmOZpXO3vozSktckSOMdGKwl7JUrMUZmiEuAcmwmtWaOHcTaxV73mWfVMOcbN
         YQ+5/H3sRyCzqAvOsrFa/yXaX7BbBT1wh6G1TEwSlvWAdUf2RdZ6ARiWrntFA1Sqj1jh
         NRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852791; x=1791457591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j07mDs8hKEZ6BOzq0/CtthubvO4QWRGm91M2icxKLIg=;
        b=THmpCUtNXTIo5vH56YnYKgcQ2eszygq3ZUTR/IIuNwBYsz0C2qzpt+40RPAVgxHUR5
         q9vSTGXd+SMQBAIm6WTTtQS5zU+ya3ydQuWzaVeA+U+74wvgv6fWsjm9TYm3A3vhzg5f
         EZLF6WESamowsyvQ5ioJfDWj33SAnxS7mN1erTrQZiEGiMpwGH+SPXtXKiqsrrXjNSQD
         bFfBhzgR/qFMJdVEBzDApev4ACTj6p7ejHJ0luXzNJjNaBpg9mEj3XM7CbAx38tsmrcM
         7oNDaZrAjIvhTHOtBk3cvfAbxSbg9gCyNvc1r+kRziE92UPpvMw35OK7qMsRUTby1eck
         MGpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwR6ps2p99Y+FhfVabigttZmcDHYZytsoK3G40fl50owVHzL53EYKGj8RINbqRb7KT6989CLv6IxX0ETTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5/uDkd9lLOCsDU+tc08+IFrIEM13+EAPUs/k/iABJmMfrfXfa
	gVDfZE1sh8R+5wZF90cCkWEgLfFQFjGZRo96H9mYDfO5GmdkjwkesyUEGdTi3ai1zUnSG3/OtH9
	yHRTR+ysrrIfO8cU3r0M4SOu4HyENo1/VpAo+mAsuwguhSHNdkoBcVjzKUAk/zOtstF4=
X-Gm-Gg: AYBFou0uSJx11imyIxKTfWooOoAtbLHgWXDkJE3t29pYYPuYWz9eYhRAqR9awSkTn//
	wmeqCdEeNvE6RyTj/F1WNfQAMezrA847nnNNlUlxxeGvGQ86UYiwgFWyWmylDgKeyrBU++T4j4Y
	JgAcJT6zzpU5Ht3AvkAyCFc70mYFnuUg+CqcE+bk1Fp7zWrJ0zoenRxqKEk17mCU9qiPRs4YxQS
	MpJSQ8dkWK7DigmYPkIM6rTSHsCaXUsObW3GhHZA+Dl4DZAjjsEYPSbI3iMgVYhs42lTBvIQrd6
	RBxbvjDVZb+WqAHjlqi/Tdcr+QEESeScVbTcZS9rJGqBkKyyhFkQRhnRDMDH/8ON1dn0kxs94YX
	1+k/4rGKNW2K6eVDl2U6TK767PQ==
X-Received: by 2002:a05:6102:2244:b0:7bf:8ec:4996 with SMTP id ada2fe7eead31-7bf83a64f28mr498344137.20.1790852791574;
        Thu, 01 Oct 2026 04:06:31 -0700 (PDT)
X-Received: by 2002:a05:6102:2244:b0:7bf:8ec:4996 with SMTP id ada2fe7eead31-7bf83a64f28mr498342137.20.1790852791121;
        Thu, 01 Oct 2026 04:06:31 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2e31de168csm132870766b.72.2026.10.01.04.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 04:06:30 -0700 (PDT)
Message-ID: <586046f1-8439-4353-b60d-dab6356de3ba@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 12:06:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soundwire: qcom: add multi-master support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, prasad.kumpatla@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261001093806.634862-3-srinivas.kandagatla@oss.qualcomm.com>
 <0ca6ee6a-020a-4705-8323-d524a813d3b5@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <0ca6ee6a-020a-4705-8323-d524a813d3b5@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NCBTYWx0ZWRfXwSHq/Zdp/cZV
 4wKMcS53Gp/o49gjlfU4wfewHJwM4SrE7sygFx1UBoJ2C8H0WAzLhGYgE3O/Muw1zWuJE8VnMSW
 QZZpblpXkIx/dXQU9NUh2+fu2xaDutLRXaedrKxLMiVZeRQuc7sBhBWE7STLvc8iT8JD4+GCRYR
 hyn/wvNKcBb+a6Ym+H2Qjdbf4hKX3NTROAlx4sPUPgfs00sexd+syDv/K/F4O4/QGnewH4c8FyC
 egDJxmq3cFuJIM5wcLSGJzWXuyFcwF0P1VyZLDN5/+ovC+YF2kXxPvUWzD5apHDpTa2nkBbbOCJ
 ++0KROAMng+Z6joQfsVP/DEQYW0LrTpDQhFNiPjIi13Dhb/EBB9lM3WsNc7HeUZjSKByJPHrPZA
 12mls/H3dl8nQLDlbGUvWM+lCfLWT37XY6eK+TmLUotPgGeQDw9oZK4tEG19wG+wfifKxsQ1Loy
 ULDZNdRabbrWdVpxO5A==
X-Proofpoint-GUID: 0vuxuxflUIxHqqKJVB5cNHpE0RsoBPyY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NCBTYWx0ZWRfXwP++INboqnA1
 yRyAMJd3VDbcqynkRMLNo7xSGD03rdx7U/DIBs2CM8Qhzw+GLBajpWHCDVAGNAmeU8B6fWwKrp+
 LVOBcqMhblbx+y7KZNVyuzpQMeX5RJ8=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe3eb8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=76a_tzKS8ymlcKiXT4YA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 0vuxuxflUIxHqqKJVB5cNHpE0RsoBPyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010044



On 10/1/26 11:53 AM, Pierre-Louis Bossart wrote:
> 
>> @@ -192,6 +194,13 @@ struct qcom_swrm_ctrl {
>>  	const unsigned int *reg_layout;
>>  	void __iomem *mmio;
>>  	struct reset_control *audio_cgcr;
>> +	u8 num_lanes;
>> +	bool is_dependent;
>> +	struct qcom_swrm_ctrl *peer_ctrl;
>> +	u8 peer_first_lane;
>> +	u8 num_peer_lanes;
>> +	bool is_primary;
>> +	u32 peer_dpn_offset;
> 
> nit-pick: do you need both is_dependent and is_primary? One would think
> that a single variable would be enough, no?
I did try to do that which made the code bit confusing to read.


> 
> also without context it's hard to understand if lanes are independent in
> terms of transport or not, not sure what 'peer' means in a multi-master
> setup with a primary controller and N dependent ones? Code like this
For now its one, but Yes, technically we could have more dependent ones,
I wanted to keep the patchset simple and right now the only have one
peer and i dont know if we have other setups with more dependent
controrllers.
--srini

> function below is a bit cryptic...
> 
>> +static struct qcom_swrm_ctrl *
>> +qcom_swrm_port_target(struct qcom_swrm_ctrl *ctrl, u8 port_num, u32 *reg)
>> +{
>> +	u8 lane = ctrl->pconfig[port_num].lane_control;
>> +
>> +	if (ctrl->peer_ctrl && lane >= ctrl->peer_first_lane &&
>> +	    lane < ctrl->peer_first_lane + ctrl->num_peer_lanes) {
>> +		*reg -= ctrl->peer_dpn_offset;
>> +		return ctrl->peer_ctrl;
>> +	}
>> +	return ctrl;
>> +}
> 
> 


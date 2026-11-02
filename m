Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627082;
	b=LDfKrqNEpikrWpHm0Sbf/eyO/w2Im7oKh+clnoOo0GCJttc6RK6Uf+kgdRFbKQda9p/O
	 m93ezHUGsOqg/aWd6NEx5pnwNEfSzATxpWXWaFs5PM0IC9uPqEZxeo64eQrBw3mhgOXpl
	 KXj/WyNSvyf1laFxkaK0FrWpZpcYsI94ka11wKtP8R9lQpPnLvmH1Pk1elLFvnQyNUqXo
	 fvS49+THOsNY9AKm0RxUvmrKyhbiZgcDgeGr6MIhRFAqdxLQvatK42+sVH9NKprdwGpZA
	 trB67q8j85hRBzPChxIQaNv2dCkiLHlwyiziYLcEeiGqLiFfgurWO/1bkXYoHyBCZWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e8MBAdBKrttfmf2SLeeFXH0l/P8tVr7RM3jVh+74XjI=;
	b=nCYbAnqMkMB1EP7CROUqJBL7O49ItoC87k2/t9Us6nkm/rHxVH7kmIL+uX989iQiadhq
	 M7/vt8G5jD8Thgi4uQ3qyXJ4e6OKhuROZ63kripFKIMEUlBs3YFJQa5/Wou+vQ6qLTLGb
	 v3vF/jDyAKNGeYuk2wacV98MxzTiLVWwOfQqfftgZ3dxeVfjQjujD1kTZgxMUlrb3AxmR
	 E8W6KWH2AU6ftoZRQ1FQMZC8j67NjxO+ePcU86FPAtkohAmXc9n6jehg98zkp0YNAxs1K
	 FI5Rs8cWcDwR06H/pFDnyzySfUSTh8m+8OUetrIdxxWPs8pJDJU4pxMz0jV/7cEYdSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j7ZXNnyT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tk7NGPHw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A05606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A05606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j7ZXNnyT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tk7NGPHw
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DATXj364732
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e8MBAdBKrttfmf2SLeeFXH0l/P8tVr7RM3jVh+74XjI=; b=j7ZXNnyTrTG3DEnH
	81h/yN3RpHTa0cumufUHF1oONTCUmIAk4Uh1VB+V71WDB1LlLFBnkO0CJNXxUNAn
	pQwTmX+60vHzwt+UKSpNV/BovivWDqPE+5e/qUW1xNg+MHu5BqEsShtFsS07hFsg
	QVBtfS/YUd0H9oFD5FsuCpmiWQUNjiZ7nf64AXPq3S2IQbImNKXgRxhniCHmWZqr
	3F1t6pmvDbQxECoJUa7jKm6zH3s3Z7ofUnmd/hK5qj0auKNF6zZab/N0vEwNzFHQ
	62Mc0X9CIrBDYLZ4g1vMYCqkXCeM2Mv9Fo5TMsuCeIWjQmKrpvuLxlOHNCf+rKb+
	dtBE3g==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6rhqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:44:40 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-7035f069837so3019790eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793627080; x=1794231880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e8MBAdBKrttfmf2SLeeFXH0l/P8tVr7RM3jVh+74XjI=;
        b=Tk7NGPHwhn7ohpa60PiwvT0bPUJdGdY2MITvU+GgAFDAiMe7gEK2VEosH4zNKqmNXb
         mbTmqYXRLhPmiZGQSdq5y6D9CnKWuxiGCeLsUY1IgwtlUQAPLunUCyiqvj6oF1/zAcAg
         eq0SeGsUa2TcSIu+k7IxxiacOqGPH8B9tP6Ac+BM8qD0j0fQ5JlrtxnCoBGGa84WHDlH
         OMHV1OCH9LvaJ2AdlzUuHq96rnE5TwOOwa0wU8WoImyxFJ5ryQzOsLTarERB7tlrHHVa
         FXvgzWzdxo5GdoQQgLv9HY4JIVeYXmyxA/gQaI60cL23xg7bIXu12PHVAuMZlxRJDeyH
         1/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627080; x=1794231880;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e8MBAdBKrttfmf2SLeeFXH0l/P8tVr7RM3jVh+74XjI=;
        b=PyFb0meFV2phmsU1Q0D5WSfJNACwSmCjjlptVDDitRJrQwjd4J9vvjNid7GyqbJ26T
         maMSeHwluDs4IB5hQ5U4tBXm7nt1xGgLJuyxs+xHSd5ntoMCcNL26G1oUj8a01PB0vlr
         Uq4v8TmzLmBOAHaPfg0FJFfKUKRQeYj1/LHOX6KCbuvlDISn7Iz9YEbFZUveEqbMv5J0
         N+QT2r14I4n7wM9HMQCmjWDVBxIdKXl/PBUU3jQQ0n69/8ws/f+dO6GVnSQa/v6qTclX
         JjWZB5BhfBUk6SF8LY1CSe0tbKGaCF2DjubUeDFB7NNGT0ziqXn23wRfVYccaJ7NQIZl
         ilUQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8ckDDZGklTqmILH88sz/LEHew0k7cSrDZFX5UNFCcwpODTqRq3y8eHncwBlvl871C/lDeFExzqvipkPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnyYzvmy02In217kxPzKxfThWzrpbmXLK56rMTn8jU7fCcLqyd
	CxolpPv6zUwq/zNxbacEjkXd1ehUGlDRpbPhnDSPiKRcX/f9K/PyjRdJnoWbiCXyQkyyeNGQsfm
	oiw2+ueoo5DrSFXX2t1grSSFH+4DEHk+etdCr0L6hvw3b2XTSamoWtF/CFPKq/0bDzsw=
X-Gm-Gg: AYBFou1bmALFFPaKQ9NDPEhXnmchFo9A6m/7Olgelt2/8MRQfEJNiojdqi1Kx6su5Kq
	a2o4/Kt1HIuoFDXyCVoJ/HseA7BHF8sABkc2TiQjRQY/azb3Q9gkwj/zUFB9pHcjvaK5QJeUgNC
	wj3nMiTbx4y/p1rsjgqLWgS7ODtVUerdLrtr7JPsMEw/amongj5+9uIHNhojjEzvs/+zEL4opqX
	GBdhhYBe4n765fgdZ6AJFxP4RLztlPuvXSsJWyS9ebS8VPA76KvG7NAoKd3KUdDzQXYdASxzKcv
	t10jdzy1HZkx+Rstr98Q9qn4c28MCUS4b/ONA9I6+/9qNVg+RiP8ia50P33S9LVAMSXY6P8m5gz
	w9RUDmtXcu24Z2AuyrtC/oODkgMeYGGuM5+r3zsU4omvpmJQ4dqkfUwPzuLs/6gFgqAayEN9kpQ
	==
X-Received: by 2002:a05:6820:151b:b0:6d8:d121:a970 with SMTP id 006d021491bc7-714f27a0151mr5260219eaf.76.1793627080085;
        Mon, 02 Nov 2026 05:44:40 -0800 (PST)
X-Received: by 2002:a05:6820:151b:b0:6d8:d121:a970 with SMTP id 006d021491bc7-714f27a0151mr5260199eaf.76.1793627079603;
        Mon, 02 Nov 2026 05:44:39 -0800 (PST)
Received: from [10.92.207.38] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2e5b450sm8780853eaf.11.2026.11.02.05.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:44:38 -0800 (PST)
Message-ID: <395a146a-5c60-486c-869b-d3706f5e85cc@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 19:14:32 +0530
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
Subject: Re: [PATCH v5 5/7] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-5-1460691b35d3@oss.qualcomm.com>
 <b27834b1-4ed3-4eb1-a8e3-a1239f20ad43@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <b27834b1-4ed3-4eb1-a8e3-a1239f20ad43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX3UV7H04Q0jNp
 h2q5GgwK1a2CJZuJNd1h/zQNHJrvEV+JtgKS17w1Ej5dzUQTDpAXoj2vQs/xs3lnNVXOVCZwT03
 LniCt8yNj6/bsPqBOTIjTPbgr4G+CtN91j4h2DBjFV2hVp4ByWrv8f9kBZlKRvA8TnXpQGsa+u8
 ltElR7SqOtj0TM9uDnH2wRHkgsjV+UXBWgzKNtQkVzNp5dbAyIQJqS6i4VrLlOomWl65Qo+a5lh
 mwk28ddBAdPdcoQA6xBmBrb7CUqM7JCJ0hXbXJ02/vavKvklL+o8Ow0UWk205cGnf7/emIydiAp
 atqTnhWosmA+aXd+A4s5HR4Vb2Hfc8BS5tuQS/kR6tIo/pYNyj9JSlxR2cjoMYT7Oay6hYFw4lE
 kSDdzrcLG3HcZFDH1QYXKDCJlNL1QDl2Woc/AwWq6m8Tk+UU/g7cFGf1aE5W8dgMSkEeiusaIAq
 Gz06Gw3TWtVa8nGvgvA==
X-Proofpoint-GUID: xq_v48X0gphM1QRhTWWKc-C-BbRJUFl1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX3XKHU1BMf2ZP
 lY9o8VHlZGywxY/1F2uQuqpgdzxg03blY1u9nSbiRvdqAmNRa1rzYtAj/PnmbF72qzv9GsmA2J2
 iOFNp6L6ZqAvfDuRvTxI4DjrX5QaasY=
X-Proofpoint-ORIG-GUID: xq_v48X0gphM1QRhTWWKc-C-BbRJUFl1
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae893c8 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CC0UIsglRpZkCHxahuUA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

Hi Amir,

On 26-10-2026 09:21 am, Amirreza Zarrabi wrote:
> Hi Harshal,
> 
> On 10/15/2026 10:39 PM, Harshal Dev wrote:
>> QTEE exposes certain secure services implemented either within the QTEE
>> kernel or via pre-loaded Trusted Applications (TAs). Such always-available
>> services can be readily accessed by TEE client drivers via QTEE's
>> object-IPC protocol if the service is registered as a device on the TEE
>> bus.
>>
>> One such service is the EFI-variables service, implemented by the
>> uefisecapp TA which enables kernel clients to access EFI variables at
>> runtime.
>>
>> Maintain a static list of such always-available secure services and add
>> support for the QCOMTEE driver to register these services as devices on
>> the TEE bus during probe.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  drivers/tee/qcomtee/call.c           | 160 ++++++++++++++++++++++++++++++++++-
>>  drivers/tee/qcomtee/core.c           |   9 +-
>>  drivers/tee/qcomtee/qcomtee.h        |  10 +++
>>  drivers/tee/qcomtee/qcomtee_msg.h    |   1 +
>>  drivers/tee/qcomtee/qcomtee_object.h |   3 +-
>>  5 files changed, 176 insertions(+), 7 deletions(-)
>>

[...]

>> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
>> index 60fe3b5776e3..4a523a95bf0e 100644
>> --- a/drivers/tee/qcomtee/core.c
>> +++ b/drivers/tee/qcomtee/core.c
>> @@ -898,19 +898,20 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic)
>>  
>>  struct qcomtee_object *
>>  qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
>> -			   struct qcomtee_object *client_env, u32 uid)
>> +			   struct qcomtee_object *client_env, u32 uid,
>> +			   int *result)
>>  {
>>  	struct qcomtee_arg u[3] = { 0 };
>> -	int ret, result;
>> +	int ret;
>>  
> 
> Please initialize *result, otherwise for instance, on mem allocation failure,
> qcomtee_object_do_invoke returns with errno. The caller checks the return value + result
> and may print garbage.
>

Ack, will initialize here and omit in the caller.

Regards,
Harshal 
> - Amir

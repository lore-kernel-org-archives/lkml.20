Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902263;
	b=hOYcy30k5USZHCKn21M5yvolVtSgs7WVFK2GpOk1q6pm63CABATkFDz9ZPF1q9U5HCe6
	 5LOJUoXL3R5bliiLNCIp6Pfji6N/iQqGD6pQzSzIot2odwjaYD0mxX0wankpUn9RM2CvR
	 FUzJBocPfwQhePoFLyDOClCjQSUzX8eAkkJGZqPX/5nsnfLAtne2XWFAA7NUYxD6YmjD3
	 eoftxUNR+XIWQUZTs1NAjzrvN1lwGdoXYPVR/T+jEngfkUtKJqt1whIB07oXZ7/WXoiqd
	 uyYXY/FztPDzZdR0eEgi1fVdeOaHife2VhnmTNQn5+v45FXoOKzNJcr9Zs4Sud4TTPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902263;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MLlCCShlOa+MPZ0JlAdJDjsDVBjSAOvo1zMk+KLQ9bY=;
	b=aHKlbsHKMTVWs6NMI0kUjgSGrhD9K9G9AYCtumboaqFnWkdOy00cw+oLg42wKO21kFnT
	 XEZMpwLSwwcsLooNMUqA1yV7pSU18+GjcXHAAvuJY+DX511ClsLEmqWhlqwyc3Jlc4EhM
	 u70lf+JIYo2CFfb9gIOKAAoGOfdcOAXW6wiRDOLZNksuz97u/eMPA+S+7eCk12giQtvmb
	 JvMgwyBMXHHb2JsZ2LV3Ai3V6lQ7KGHfz+nPrf8iAtEOS2EIGq5DpezHVxLt1sg06wZXJ
	 Tldn4EGPUOvkjgg92VTguR+efjEa7UcakHrsb2YVQQcsyOLWySQPPQNWbqHFkQ6zy5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FmQwt4bb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtgIgQWR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41615606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41615606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FmQwt4bb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtgIgQWR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH44MNm1699694
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MLlCCShlOa+MPZ0JlAdJDjsDVBjSAOvo1zMk+KLQ9bY=; b=FmQwt4bbWhbkQ6Ts
	W0PvawoGMyhL7hp+98zs4c+/dRDaPCwScV6Qd0qLno4+F6QZpAQPfPvBisW/w2u5
	2+/mIo6vqbfVeWp+wIljKODwLfrteqTRWsCOFhrrrntOc/tabxQaQwyu2qGR81Db
	BRXlRLtDHnQYFQIOj7vW7TAiTOrp6IdkPTyc6s73IpDEtSldpOT5Vn2dCZMP9TAC
	TfG14XNeFsFoUZIRLRlekLdPmwnWxgx4yk6EA1OiGEOrhkurqtf5g8Q9N3GiaeNr
	mfIWtr9l5L/OUV9+OVyQhySbXXkVoshpyKR2XZtAeDehEG1ko1PFVFETR8I7B9Fo
	XnVbkQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjugrf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:57:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so5632340eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794902260; x=1795507060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLlCCShlOa+MPZ0JlAdJDjsDVBjSAOvo1zMk+KLQ9bY=;
        b=PtgIgQWRUPwyFAcZnIWuokqaMkEixi+NvN8cSjwIaP3QHP+XEUpg5FqsLZuAWQ1OKn
         Xh0juSRs5XAkC1QsJh0Wyw6mwoXleyrBkFKncJcPg2CmtDv1sYMuMt2xbIi76zneoNdu
         f/RtmDfH+eOdpnfOdfK4TlAS3EnyWJkT/P3gtGddMlg/AlVC+CleRtmlB7trhfFWHZaq
         smYWI4tX/Mg41evpCs0B/sJN/KvpgPifE4ZQw9oRF0GtTXvcWa4JoWVQAoyySRLNpScp
         HEzEup7LTZ05GudFCl3DW/pE3fg8F/1rt6FSd3r6R4tloENryKo0jjC2Btkafwz5pg0I
         fgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794902260; x=1795507060;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLlCCShlOa+MPZ0JlAdJDjsDVBjSAOvo1zMk+KLQ9bY=;
        b=DzUuoOGZd5GIt8HbIYOFg4ZFmoua5ixfsQA+zrlS95Sj0X+rqNjT/BC88wuUp091HY
         kCMR3VCmj/R6tNcrLq4VJbqFkg0qVA5IvUkC/Bi/W5uwEEriUd9Ohk+B7ANwLsVFhK7+
         csoImjIfsjrZzJtCrCHLULdBGrkqsGqLWramkHbNV2TxrNB3wtLoFTBnh8bB0Z5zdvDZ
         peyiEnejCbVO4wWsZHuo6Im+M9eXbn6LgvOYGu2fJQFYf94ycaAA5MEAiXa1wnr+oYHS
         wFT0Inu5vRkXkzs40QnY4atgKgDl+L/Biw01p3vWi8hE1CLTw/1MJW5hsa4EdHqVFDDH
         /XAg==
X-Forwarded-Encrypted: i=1; AL+hErEg/F2hJO5CyfuMPG6RVzlaZ8LlonnMgaCno8zFbmNhGO1vtFBk9PB4BOpdjtObxoSRADpelc6p6ScATh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z97VcyGiKcO6OT5evGW3YtHCeKME1J/CZ7Cl/AoRUP04VqMi3xe
	dYlVtcsze9a3EdKwhS/wQ15xFOb/NyIHjThZIpdlYkAvkyG9feeOacHfGdD79vm2rumhClk5swm
	HfCs95ZfehsytxuSB7Lj6YyPvQeiEbWYUG3fJALy0g490oNXjueeI7Wy7RKaBce7DBSw=
X-Gm-Gg: AZFdTZc+iy0YvlMzHd7XWh+kHnHx2Vlo23j8UOa0ZcG1GlKyBGXAsLGzKtsXpXcmQEY
	F4NlIRradEcuqxQHfg1z3wgoURj1f3ZC84sjqwKKOTHjWON0uuLVjsDH/zNz2iJKpHPgKDHyS2f
	b/fKrPRyVceZBKKFEBe8Re9vmYA29lCJ+YeRA/MEeBDtOnbIhFe+3BZzDZgq0H9kSGGqcm+YvTp
	+XzC+2g25skUI8vKCpUDfxIuf9imESfNEaXbenC9P/FcmSb4QcVPbzAzeuJh2kAi+kqZ5JCzt9J
	IPzgZKHJ8Nhc13vxd8G3HbOI9C2jr2lth5rdBEHyyAg3xXuCyrxZjnaXczByjVANUaGMdliWGqb
	3soFyHCrqiVQBczgN1vFUB1bgWDv0XYbSCfyVYSm7kgi4PI1DdCqIXLy+qjK9h5UD3jusyepcQ8
	EDWy1x
X-Received: by 2002:a05:7301:fd03:b0:36a:3ac:b15 with SMTP id 5a478bee46e88-37968993d61mr11889997eec.36.1794902260031;
        Mon, 16 Nov 2026 23:57:40 -0800 (PST)
X-Received: by 2002:a05:7301:fd03:b0:36a:3ac:b15 with SMTP id 5a478bee46e88-37968993d61mr11889973eec.36.1794902259508;
        Mon, 16 Nov 2026 23:57:39 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380e0fdcc36sm6089673eec.25.2026.11.16.23.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 23:57:38 -0800 (PST)
Message-ID: <f3079c6e-36eb-0c65-2e46-c9cb0a371656@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 13:27:32 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] Revert "media: qcom: iris: use disable_irq()
 during power-off"
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
 <20261111-fix-disable-irq-safely-v2-1-8e13f68c2ef9@oss.qualcomm.com>
 <39881cfa-6f44-41fb-aade-041d9cdf2f9e@linaro.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <39881cfa-6f44-41fb-aade-041d9cdf2f9e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMSBTYWx0ZWRfX0he5uxZ6iXlA
 PKZn+QVlX6Y/JDOMmAig7CuHNzptgZ7Kk8qmfN8hTS4h1VkZNxNWGvbqX0g+Pxgvn+bqmw3UUaX
 6U1k614w1eUozFn8Sz2ouvDxEBfZidWX/UD3eCoJ0aCSUOS8IsP0klgLysiZLSfohaxRJUmsRev
 tWyJO18aYpZsALIpNjBeo20RDj5LjV/jknOh+YbLsmaJUNATvmtYmw+pPUKM3a25a9mVcYgG+u+
 RA2uhsgOlnKlWjc2IsbRkGEPevqq8dsyI2vmc8jrqqpOeLUrhiBFjq8RXRyc86BbY5Poea7xMAM
 FmQr2CUsCdh4rLIaJCZmGakXkgK4BM+/QFlN/28UhybEpBnanK9Wr9NuSk1ghqbTJLB27ik1EgS
 lZCAGE7GsVqN1X75mM+DuybF09+eti+rVgs0ZcyXIF+DOrP5ZM3AL2cOd3reVLnt7MiOojbiBqu
 MYcXUSjItZUyX7L05Ew==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afc08f5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4gvInHfGZssBu6MVqJwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: u7ohDdByQhg7NFqVz79NBLr9KBIZhVdC
X-Proofpoint-GUID: u7ohDdByQhg7NFqVz79NBLr9KBIZhVdC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMSBTYWx0ZWRfX9tN0rBh9tGwC
 58Jx0io+KaT7Yx9zOzTHaMJKS7n0oAMzHh0EzVt2M0DSBIxmkmsIx+5K+742YnRzzZSagkJJDvt
 OLP1U21kLzWT0IDeB1kErOVGQB6Pe3I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170031


On 11/13/2026 6:25 AM, Bryan O'Donoghue wrote:
> On 11/11/2026 09:05, Vishnu Reddy wrote:
>> iris_vpu_power_off() is always called with core->lock held.
>
> This statement is not true : int iris_hfi_pm_suspend(struct iris_core *core)

Why is the statement not true here?

iris_hfi_pm_suspend() is called from iris_pm_suspend(), which already holds
core->lock when it calls it. So iris_vpu_power_off() is called with core->lock
held on this path too.

>
> And TBH as I look at the code I wonder if it should have a lockdep assert if
> that lock is a requirement...
>
>  The threaded
>> IRQ handler also requires core->lock to proceed. If the handler is woken
>> and queued around the same time power-off is entered, it cannot acquire
>> core->lock because it is held by the power-off caller. disable_irq() waits
>> for the handler to complete, resulting in a deadlock.
>>
>> Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index 243bd845349f..1e183fc4e58c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -240,7 +240,7 @@ void iris_vpu_power_off(struct iris_core *core)
>>       iris_unset_icc_bw(core);
>>         if (!iris_vpu_watchdog(core, core->intr_status))
>> -        disable_irq(core->irq);
>> +        disable_irq_nosync(core->irq);
>>   }
>>     int iris_vpu_power_on_controller(struct iris_core *core)
>>
>
> Looking at the next patch I'm fully recoiling.

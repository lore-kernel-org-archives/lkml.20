Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AE53D953B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148815; cv=none; b=nT2duzO8NhPy1RWgvK0q0OfvLOLw0gTq8WpLq8sZ/kOruhs12/DSQgR5tI1eZdpD2/7EEsYzHXAdAI/5BM93UNRPaxUYDJs+EeHUiOLKPzhjXJ+tSgwDjNhcGATNulXIh79ZJEtUz/45tA8O+/ZQAGpJpZz1FnLEWPEb4Yhk/1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148815; c=relaxed/simple;
	bh=gCTOUSz6Xj9/k9OuCwCSYnw4OvrWc6XZi9pYFF7Z49M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzcT7TyKdUiDCIPqCOs8tdrREAGSt7h2c1jOqgsyvZxQmD//W6WMo+lNE3yx5PInyhJvI3p1U+jxRH/iboq+wJFfl+cTqSMtd7DJzIzQE5tTRCpUkWru6t8R+rS8/OkjU3w6mdsJsXIC73ic7T7/ORdA5sgwYI3WPLbej+Tt+Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTveZBb/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPNHnhaU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTveZBb/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPNHnhaU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAPVj2496922
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SON5F/DY5kya39+CRJQh/XmORSH0D3r0659aeUKPdBw=; b=lTveZBb/LfwgkhOT
	nxrVKBzvVO3V7dzy1NukRSDCY3fK4rBaH7IqAF+I+W73hivanGzQ5nK46ejExf3z
	VRhf3tL07iTmUNJ+whBsZi2WKcUma+I8GN2GV4vblB181oF0L0+z9jPzlMP+NnN3
	TBQR8U5eDRcoOOGixn6KGwtdGasWbPSTk6wB5cJPk6LCL6DcNU4L+W8cho/eDZ95
	KxCltqMM+PZCzXxXZ8SCbov7Bm8TzYDlNfovxVmwWmCfcBqPvZ0ktO6WNW+R1JTu
	hBB/hohAZ5L/khNKvwhrYzN7NmrQTWelWSTiOiHKFWCVxoGBlBGZOClqYG7kLggS
	1Qef7A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa3dyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:06:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338a4075d3so19913461cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792148813; x=1792753613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SON5F/DY5kya39+CRJQh/XmORSH0D3r0659aeUKPdBw=;
        b=fPNHnhaUQTXRXzopuzlsL5Mub6sQqmtBl7O6zOnks7QxCcdkEyHl8+URjptXjXca3A
         q8+jRxikHWM1sfK0AA+AkqzMpU74PQl8K3Xer812TAI7BFuUICmGXbH5UJykBUo2HCIh
         PNBfxshkLKfYCgtKIzmxjx50An6kHQxWM0Qp0L6KFW5OPtZOjZY4GGdJzRmuVGupV1fW
         rk9Cne8Dwt5keIKKofsk1rjCy18zoDae2oazTIOIHwHxxWQU79usgM6p6mB4g4GzgBju
         xQFbs8zpkr/HpmsG5GMjHXcFbpifP7b9N8xYmJY4B33SA0gXpe2kxCTDZZR16+mFvHcG
         41Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148813; x=1792753613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SON5F/DY5kya39+CRJQh/XmORSH0D3r0659aeUKPdBw=;
        b=XGaACddRL3HV1nY9Hpe9NRme8GHpF9rv9IVtjEiZ4/4HmQjmqfo7Srk2O7qpK7WBzv
         LysUY2htZZFOKtWV40LffkXKnH5OJnqitr3alUshS4Q0A4c1WPIxFPZidxoOxzsWil9z
         gaL115knWk77cubRRk3CkE+FWP05twJXxKzykh4Wcxfp+32wxs8fnlQPIkkHrW9oUgf6
         sSdIwXfkhL0K2gtFeQT7HU6iZphu5lbsVQZxI7oz+6oOp07omrMDVj2ylvpFc418pPRn
         ch7eNZE+Hs/3Snw6oU1iRXoqxK4xkzNKu3TOCQ+UxxXS0NOpxnG6L0uYzZMi3lUuHbGq
         ZDXA==
X-Forwarded-Encrypted: i=1; AKwUvBwZwLOTzdwps6B1HdkiWjFmLR6N5KvaN4CSxZpEjSbSv6qPiwGEIxjJI8kwLj5aUMa3Ic7QsENYwFAn3TA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAmq0PFyUF/SARt+jvb7I2VyX1Fn2kBKS1SWYXN+Abv2pHNi0H
	Lc/Rj8BIlD1c1jpSJRGoiGeVTJUFQMHF3FMY//HN5vViRz5NwhlY+BdzafhonvjHcvvafqFzbkG
	sOx+LtJVkpnLzLXHJlXYjpRscNbffEbITrNxAt/7P3U7DqeMWE7eRbv/OuZv+vcJYnfA=
X-Gm-Gg: AYBFou3pBYuPhjYlz97sOvdI4gDk2DwSyP+eWYNDymix3ZlHp6JKzhOJsijq52DXEmo
	oThEfiVUo0iW3j2sBAGTCMOjZxo7G4G0Ur9gGjhblCnv8iaJVIg2FRawjnTgS/R9j557xiS/Tqx
	IcFlUpia2pQSS2sd5nGIMbG1OjLqpW1rucQQNCYoiqXOuqqB5YVdCm2zphNeV4ZjvOP2KnNwP7L
	1bpjmA52dxIT7iqhVKFBrupG54Qh2bmD+RKhowX0kBvPp6O/xKQnfk74peir24w4WxbGZxzRnpU
	4kWajc4/90sZ/3J5jsvuyc0KYK1nichUiUCClG5q4Dg/8JozLYhpV2JE6TQmqPKYtPXiap98Gsh
	CB1HiEyYv8Hfbh901dMXMOA==
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr428930831cf.1.1792148812394;
        Fri, 16 Oct 2026 04:06:52 -0700 (PDT)
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr428930121cf.1.1792148811681;
        Fri, 16 Oct 2026 04:06:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb4ba6sm59964966b.75.2026.10.16.04.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:06:50 -0700 (PDT)
Message-ID: <cd2318b8-7619-4885-bde7-5ec6961ac5fa@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 13:06:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: pas: pass no resource table when the
 firmware has none
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, mukesh.ojha@oss.qualcomm.com,
        sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NCBTYWx0ZWRfX/v4xGTxO5p3t
 PkNA2ii4y+4zvsIjmHjKy8R7UxG2uoozTgk8K/12OC8n3eq59XDgEFUNpOFSGVEq/wWLkHou3Lg
 6rHLqfivn5QYYp+bw9DHT/+UDj57waw=
X-Proofpoint-ORIG-GUID: av_F88v2-bOWDtmyRZ1EYHrDnBFpaftJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NCBTYWx0ZWRfXwudBcrAyRCDU
 rJ4PZfvCeiHqhbawjqENDXhTb1uirDkhWL89KANu7e7CeVlyOdx/hEMX8c9aqdAoP3geoLQIP9S
 d7pCAijFBcmgQq7/gPiqfLIlHe3gZngTF7xhTGHbA3Zaxh6ZQo2xH2cXRjffGg2ufM6aRNWOEgO
 Z5WePCkwBFvAEzKy/bVdBldIu/VMAdIWCkvO4LYwvNB9Dh5NLkK6l9lCv3upOXY3YngmggCJqu7
 H9h+s35ElshmsmtGgDu8WzoYPDSpfpU+woBSXexDYXBe0fsV+U2aQ9AlFYbZRbcUbJbM3GfmAIG
 3h3cwJyUb2SkXkWAKR6GxlHS+pA/efR8Qf85uL5rLO94SrmFtfzvPrBhoYzJTmd3OmAitPjeY+4
 24wi6CYxPphIDyQWhe4BI7v30m7NSp8IIriBCs2iKRtLb9fjiR9nV72EDXrASRkC+ypPgBEb7kt
 KFd/KWAfVg8FoTcY1hA==
X-Proofpoint-GUID: av_F88v2-bOWDtmyRZ1EYHrDnBFpaftJ
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad2054d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nURcFc7YoTJHLg9ZjdYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160044

On 10/5/26 2:54 PM, Jorge Ramirez-Ortiz wrote:
> The firmware resource table is passed to the PAS backend even when the
> firmware carries none. This only works on the first boot, while the
> cached pointer and its size are both zero.
> 
> Stopping the remote processor, or failing to start it, frees the cached
> table and clears the pointer but leaves the size set. The next start
> then pairs a NULL table with a non-zero size.
> 
> The SCM backend substitutes an empty table and hides the problem. The
> TEE backend copies from the NULL pointer:
> 
>   remoteproc remoteproc2: powering up cdsp
>   pc : __pi_memcpy_generic+0x110/0x22c
>   lr : qcom_pas_tee_get_rsc_table+0xf4/0x25c
>   Call trace:
>    __pi_memcpy_generic+0x110/0x22c (P)
>    qcom_pas_get_rsc_table+0x38/0x60
>    qcom_pas_parse_firmware+0xa0/0x100
>    rproc_boot+0x2d4/0x380
>    state_store+0x40/0x100
> 
> Fixes: a4584bff63c8 ("remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---

To my understanding, this patch is right

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As an additional safeguard, we should probably drop the stale table
size whenever the pointer is reset to null:

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@
 clean_up_resources:
        rproc_resource_cleanup(rproc);
        kfree(rproc->cached_table);
        rproc->cached_table = NULL;
        rproc->table_ptr = NULL;
+       rproc->table_sz = 0;
 unprepare_rproc:
@@
        kfree(rproc->cached_table);
        rproc->cached_table = NULL;
        rproc->table_ptr = NULL;
+       rproc->table_sz = 0;

        return rproc_attach(rproc);
@@
        kfree(rproc->cached_table);
        rproc->cached_table = NULL;
        rproc->table_ptr = NULL;
+       rproc->table_sz = 0;
 out:
@@
        kfree(rproc->cached_table);
        rproc->cached_table = NULL;
        rproc->table_ptr = NULL;
+       rproc->table_sz = 0;
 out:


Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E101C502767
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903880; cv=none; b=NJO3Anc+4YicgvAzhi6f0H1sPzJdJVKpWRSWXzdrEebJIfzhh0KG0WGnH+PEoQxruXcmBoYCA8NnX2qcvbbMMg/qxZC1CnU/yjzgCWO3xV8bdvWi2s+BopQCJjdvjr2qUKChfxsLtEAgs6kGCq5I260owIYOW3vyEnLCMhAp64U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903880; c=relaxed/simple;
	bh=YwJ/4Kh8dgIbqE3SXVnIlum34oAB97j1aaSxvl4JjT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TS4PSB5BmEsnf9/Kkc7mZ4yifsVaqrNGQPYkv+iNZ3lhbiCQlnNsM7ktHHT/uQrcO4DOOsW5prsM9LKXNBUAK9rpMezY8rQZ9421VNVo8jOMg2Lv1Guk7Rc53wRcYoZdzPA8zVbavj/OHxQTbxxe2GysKbSHtHj5a90QV28JML0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bc9TZcGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HctcgWR9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bc9TZcGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HctcgWR9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE41bT900183
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPK3uPVCdiplnO240T4BT5juz8bHcffFNDKBRzJrh6M=; b=bc9TZcGXX0RUVy6/
	RlvZU14waSJxX9UDqnxpiQhwDw/UrzN2l5KqwUbMnKN0XU4Uov9spoCzfv3xfS0y
	P/84TpmlCIusv1RJlvpYOfVs7/wFQ1AHOgVIoFy1E7nys48XBdqoJHJMx3FIpFOe
	Xzg9mWDk16PB9Dj6YTrjWOQGE7GsHf36tUVxL+z8C/z0qzY9dNzlzXxCe9O8DFqu
	uXlKG1u6XTbQnyczpJ8eYBBWK3qNa0WjBAye85R0oAqvhnx0pfgujaQ5PPiO/mU2
	+nv/hIl2dX1gD4wDJCfmmWJWx4DyPbQmYSqaKi1d+3Z86rpkHNJMM8MAWYqdKxea
	vQK3eg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uhwgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:04:37 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c97957d83bso81423e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791903877; x=1792508677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPK3uPVCdiplnO240T4BT5juz8bHcffFNDKBRzJrh6M=;
        b=HctcgWR9+HtTlmKJZeKe9tINLcgVpZCn3TBN0n74FOroc/C0WX1R7T7hX3S1RXIdyb
         6ujh9jWnXzKl4aVR3/2kDe+y69qReyWrZaUnREPdhAgCCuhlfhkH3ox4In0+BypnMwp8
         kqHBlJQunNpYBH7kVUcaelr688OxsGQO7lpkLZAiVUSgXmZqpCOC+9I2z881OUlXCTy7
         qVa2QdM468noaVXJPYSQRg9ApiAUQaqjYR2cUZPWI5ynGXP8oPImmHuXO1ltfI4URDF+
         siqGlmpt8mW4v9jZGYXl4H4ESF6ndcRV8UZHNRWrMgsaoRMZAW6ECtu3W3zHik9co/7M
         4W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903877; x=1792508677;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TPK3uPVCdiplnO240T4BT5juz8bHcffFNDKBRzJrh6M=;
        b=kzO+26TLi45PH/zgWHDbSs3Wu9Sax9dpDdjCtrsL86peVCAMrACzeIIAhyJ97CN7+2
         wysRuRncxDkDGLR29NuqKgldRpsujiKOMY24Uk+/2R9zqc+xAF2Dg6qkHzubwhxGQcp1
         doLsAHarQ2UXQ0kXIgGBUkIA1Ngr2FYx5705/FAd2vzXBVDwtaY5UoQiEFmHFW3fmquH
         yHtfaIL73RPJ6ge2d/mFrISFvB32a5zZbUXTF41bF92kGd/gkM/FcEBnMQU3V9Z5Q8TY
         Xq6WvipSCI2GV3PbQqeD0Ib7POmlCe6IgNG26SI1+Mv9kBC/XimKFw0+GQRYJiTGIuLE
         rA/w==
X-Forwarded-Encrypted: i=1; AKwUvBzk3JbVACT5GI3yJx9MC/uGOEGmyp/Dg/TMjSea+N3U5EoELSwWGW46MPnMctWe1kFJ/pGFwq7mJdMh8yY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+G1db53rtBVG7UUDqmTzOaw5yRJyIY0wRNMuy2pOCxjCcPhED
	/Ry7TMfmYRYFjkcyoB1LxsHCpOYDS2Dlq0ayAJbG7YVE0jankpdksuoejUCNJUx6NigDAZyCjAv
	3+0E5NTw4RIXdjmBmAf18NuRqk+YAk1De5RCsMtKp5tk9SmfYbKFDO5g5pP3JqXfS+DI=
X-Gm-Gg: AYBFou2uoSNGn+1oP4EggRXW0REr5BXxxWzkL86aHlXoUiMIIfLrH0PIe1dO37K6+Pd
	pIFVMSMZtlZnhmaXE9bpsWE42Ipm5rOjd2di4DLi1xu88DgTC30TQNFOhOvYjl/U0g0Zmovoe9z
	pqkkf7I4DenwQwuvTI/zca4rdL+x6ImATjEjbUDpf0bl7tCB7NwX5miuQ77KcztoLeILDriM4wt
	hTKaZTGUrBhbFvFMNKc/WWesAPyZMjqb5stmOYN/swWA4QXsP+NCNrKuubC0WnTaa/M9CcvsvPI
	OXHr4p4c9N+D5xW22YKFPJYASMKTVXYsusCIY6t3tOINtTTXkwYImYB20ClJz44i9yKVUKSSjDI
	sW/w2b1UDqr7NStuINgXCOg==
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr1052081e0c.4.1791903876739;
        Tue, 13 Oct 2026 08:04:36 -0700 (PDT)
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr1052049e0c.4.1791903876180;
        Tue, 13 Oct 2026 08:04:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9f776sm595740966b.48.2026.10.13.08.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 08:04:35 -0700 (PDT)
Message-ID: <0c195d46-64fe-4d27-9147-678ccd561329@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 17:04:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: glink: smem: preserve IRQ acquisition errors
To: Avi Weiss <thnkslprpt@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Arun Kumar Neelakantam <quic_aneela@quicinc.com>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013124328.1273340-1-thnkslprpt@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013124328.1273340-1-thnkslprpt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2MCBTYWx0ZWRfXxDRU5Legfg2P
 9EBcECXUcmo9KnVjTlMjmPtOoFi/DgIoiAP8zzm6+UY5c3ISyGc112CnS6OeMXYDsaomVlnzX7a
 qS+kE26GBAWW13ImJs6pQTgx2t683zqycmVkOJ48qtzu5oyFS9bLhR7wfPm1KmtqbjSQ8v+xH9s
 JYYbtlYgIPXUx9YI73KvuJYXiG0wJTchUxusk2TOayHyah7iizctoq1hviASYaR0MdJ54rjDDVs
 kBzWzUmpooHC8SvDLZ849+ITA5XvndzUcCiyDy83CpTQlYfOBp8rj2VxxxzkG6S72sobgOwhwzv
 H2nXa0zYtMOE7EXXGqYvJthhA64cK5FcfEaa6iT1H+93Rhmu3zWd71MGjwke75bjJLwpMubbd0m
 JOnZY83wuo82Q3n/uIljjn5JND/OnZ7+1Y1kqDBguHA6iFM/lrinPXxvj6C/0R9j+ZIc+nynBt9
 ZEK8X2XG6m2oPvM/uYA==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace4885 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=RAclOZT44kLJCt7_HWsA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: iVFeIbnCzXuiYYTu8zvE4PSG1crz1dcg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2MCBTYWx0ZWRfX6p0Gfs75TzMO
 jKqMN4kaq7WQIvyorVJN3sFBsMKImiFfTIG/qHhZSFh6/B+79WRNHG4nsGq+YBQ989/yMrgqO4B
 WObJtRhIOf5tiNK8UeCRDQ8bcdTYIvc=
X-Proofpoint-GUID: iVFeIbnCzXuiYYTu8zvE4PSG1crz1dcg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130060

On 10/13/26 2:43 PM, Avi Weiss wrote:
> qcom_glink_smem_register() passes the result of of_irq_get() directly
> to devm_request_irq(). Negative errors are converted to unsigned IRQ
> numbers, causing the IRQ request to return -EINVAL instead of the
> original error.
> 
> Check the IRQ before requesting it. Preserve negative errors and
> return -EINVAL if the IRQ mapping fails.
> 
> Fixes: caf989c350e8e ("rpmsg: glink: Introduce glink smem based transport")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
> A dev_err_probe() diagnostic can be added for IRQ acquisition failures
> if preferred.
> 
>  drivers/rpmsg/qcom_glink_smem.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index 35bb03e67ae8..010a7da64906 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -312,6 +312,11 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
>  	}
>  
>  	smem->irq = of_irq_get(smem->dev.of_node, 0);
> +	if (smem->irq <= 0) {
> +		ret = smem->irq ?: -EINVAL;
> +		goto err_put_dev;
> +	}

platform_get_irq() lets us drop the zero-dance

Konrad

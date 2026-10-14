Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6092A414416
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959666; cv=none; b=EwHOUsybaIyDXS3Q+CQacPaBkITgT8+NTxvLZAlwy+4na7+U/nO9gknXTdzprABR9/C/rulyL9BVGmpRvJdCkL6eq2wOkQU5GrY6mtYbXg8di/myqtyEeusq/v0Kkerc/o/rHoBQSNtk8hdNhKzEVcQqGGpSSaUdogwZagjdc+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959666; c=relaxed/simple;
	bh=nWInz+T6epfCYbWyxNpOFpxgjZiH+HNLFhl7tc8Vlto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgkhvzsIdhOnl1c6gqV2jByreghlgEOdi5Gbm+Uq8DduHRLgYeaFtx//rsHYNkU50x/o7GtP++oEV9DqHj5zsQJHEHhqdtSv19UkKwBTnwH64uJTylutudbGNGLvt6xvGuS/jj1ZQ/2G2jEkQ/2njn/6bURha4xOMh0APOZ5P5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6lYs7mo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jv/xIViG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6lYs7mo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jv/xIViG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E3XW1v2222162
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwlQq/zXuZY21MZy5QVnIWWS1D5S28zS7MiJkciQeKE=; b=b6lYs7mozFsFvkyO
	XXdXvROj2DeUa1/i/UvNlwOItWD8/p7xgyTI7pALRNyH8/ZGRGVTY+hUbl6dXQ9P
	y7cCR9PlQl8sXMvDMpKzNdzTGGsd+AWU6FeR6rSa4z8G9TUhCA6c9DF0jT3hCctY
	s0xI8p6/MRLZSP5tWAJ91Xj2MkvQNNBnrTd6On8mi4ABCWG10SqQuhVnBykTxfcw
	NTi1ZGW1+iWV7PybD+W0a3vd6hQFKvSrpegIIpeNztmal3nX7jZvnMtwnmDxkzz6
	xkIPXp5/EU6N8DWH9Kvi2IZW2xb3ZEOBYX47AzS9TkHPK8ISfz9dictnBWV3w4SU
	8ex+8w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsa4t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:34:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88a10162189so97262b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791959659; x=1792564459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cwlQq/zXuZY21MZy5QVnIWWS1D5S28zS7MiJkciQeKE=;
        b=jv/xIViGqrMlxZY05JsZbAzWLGAniS4UbJKU139Qxg+i44LndQBToJJsLsw8jlDzF5
         VGmghobfT0xuExGBhIWV+Pj41xHF8y2+ML5Hu8dvc3SpPT/XfkeegfK77/lEVnzyqcDT
         SmrRuqsBWrihMLdK2yWHftXdJL9hK90hbwl+G6V5Ckf87fnW3l585kQ5/Vweo+rwiPrx
         5AIH2vDq2bKrWD/3wOjg8A73nx3qHslt3+/sUEOCHIDljncVe5ZYMifL3CIVna/47R67
         LLokVA1yjmWcGnytZwFnCCEf/9JqFpYi2aqUvAtEvH4Ttkh1yXeEpry8fPs3LeibSEN5
         EhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959659; x=1792564459;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cwlQq/zXuZY21MZy5QVnIWWS1D5S28zS7MiJkciQeKE=;
        b=Jp1lck53goNrplan4/ch0lRzrmIW8nA/xVn9R+yAZ/5MMAJ83Efx+/TuCvdhm9X4c5
         dVypyVZRfEpev9pmgGcpx0qjMg7fiwQUq08g4rA5dGx6/tjvqy4uRaHTLMZILgybaGGk
         p0eTCNZH+WzX3Q1iLtpHPM6BBWxMQd+E4lh9aKtI5ap0edyNysh3/w/bU1htxNz3Ej3N
         DljNQoLH/HNlutK6m2hfhXAaraIw+UllOka1P/R+kRxcTeb+Rh+lRqLzakXzr2fQ7Fn3
         z1/7jqKaglK99cQDp1NGMH8RrxRPxWTgyFmt00p044TZ+OYqwwPTaZVdLOgJlSrwcHHo
         K6Cg==
X-Forwarded-Encrypted: i=1; AKwUvBzkUy2LBiQx37nlqdu+eCfsGdfe6EkM2X86YLHPPdkWv59DxFf4PNJdowMEStBvpCptVg6zP3sxkbU5e0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHTy2+PLRq9Ts2pXshgXjSQaqYHN6wl3Fzku5scGqn6jHFLmKc
	AbAWzZYDmYrING2/uT47kR0P2oR/y4aXMT3y2521u0YIOUPs27ow2mhrDLDtYyk8XUxK24mI22l
	BsyUOS3rz/ys+x2WxpGX4trOYpK3tkjjjuHW0v79WLr/gUUcmrXGsdzUOidaSLBUt2mo=
X-Gm-Gg: AYBFou2P2oBqX+uxknuL1zGfdUMrbvyNUb72fShYM+lpaWUwiWoO8YE9OQIvVHmYruc
	lCCMQw+CF4qZjHFsysFfjiykFyINZC2LIp+B1IIUqI+QE1M6X+DSyxvGD7CcZNTtoZToYT9cPg0
	8Jo7tcrADuNzuVA6lol4TFaZUBnOQUh5bLjX3Zf4EkFiRw/On0It52hYs5tq6TYd8Nm+us7NosJ
	Avdt0df916A41IR2tHN4s5H3At6JWIzuomnzNI2yKdCi5X+2mhqLBMlrfp3qWuvW3IV6PIoB99M
	RnYq/sFR2hZMvQQ1dPtw/QZjrh7KdQsY1ldwIHXbJB6xvie6uNWo9rA4y+Qa+KaxLC2K6fb0Trf
	PwUbsetyptVfQTKxA+W+XuIxOEg==
X-Received: by 2002:a05:6a00:a1d:b0:886:6b5a:78 with SMTP id d2e1a72fcca58-897c6e1bd4bmr13170333b3a.14.1791959659007;
        Tue, 13 Oct 2026 23:34:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:a1d:b0:886:6b5a:78 with SMTP id d2e1a72fcca58-897c6e1bd4bmr13170310b3a.14.1791959658518;
        Tue, 13 Oct 2026 23:34:18 -0700 (PDT)
Received: from [10.218.26.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d802a47d7sm714854b3a.12.2026.10.13.23.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 23:34:18 -0700 (PDT)
Message-ID: <01986f3b-7571-4e5c-a43e-3542354024ad@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:04:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: pas_tee: handle a NULL resource table
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        mukesh.ojha@oss.qualcomm.com, andersson@kernel.org,
        sumit.garg@oss.qualcomm.com, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNSBTYWx0ZWRfX1Vn3raoUAgH9
 BQNfN4U0cQY4gHiPvwysS3me6mvk/ARkK1OQWc8qlEJah2eqCIbBFD0njX/IQzdQjiHwewYhYjI
 KtxmowI4hJ/wtVfug4f8qH6mO5MZRxMxjvbS+S+j5DvLEG1+DnJEUrtljYRLKJldWUdsk9E7TSt
 aXarDpcXe87pb6a6NAjwjIlaAd2gNIwgMaI2zgSfHfSgFpoGzz1d8IGOAxBazXveVfYISEGO1Ou
 b+Ly8klCvL9JAkq0KAuimyHrdZSd1I3SJ+O7upVf0VcAYSXzaao1IGxdCrmgGcbwzRE0ZeBGiiM
 gvhyJcvuBxk4ai2JrJf2MERw1Qf+20AMKOSuzBUJjP33yDXuPs5u5rN/GjIpPjNeuZaEmb5HC2s
 1kzp3y8UtJY4c1G6kp0jPHie6bkLvT+VVDoAKxDWIYXKFziLnY4UG9OoxCt2t8IWgKK1r7nnd/K
 JmY9ZEEljA/7JYP7wHQ==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf2270 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DbjZ2u-6SfG84hTmyQ0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNSBTYWx0ZWRfXzwCRX0bd0+sa
 o08tEwRaEwg+cgJ0po9nzFNfHGeEtzYwgtUYY+F0LI+2Tiyy804H0wX10b9UDj6lbmzFsRhO49M
 RgZd611U9L4ySLTFR/G+hSdzVQM12TI=
X-Proofpoint-ORIG-GUID: Bt_N0kwff2CG0KzQBqsOHPmxS7mvYdEo
X-Proofpoint-GUID: Bt_N0kwff2CG0KzQBqsOHPmxS7mvYdEo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140025



On 06-10-2026 12:11 pm, Jorge Ramirez-Ortiz wrote:
> Stopping a remote processor clears its cached resource table pointer
> but leaves the size set. On restart, qcom_pas_tee_get_rsc_table() copies
> from NULL when the firmware has no resource table:
> 
>   pc : __pi_memcpy_generic+0x110/0x22c
>   lr : qcom_pas_tee_get_rsc_table+0xf0/0x244
> 
> Zero the input size when the table is NULL so the copy is skipped.
> 
> Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
Tested-by: Harshal Dev <harshal.dev@oss.qualcomm.com> on Shikra

Regards,
Harshal

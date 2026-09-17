Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7973C438038
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634518; cv=none; b=lTLBc88mJTl01dPwWcdwaDZgPEyCg9xS0ik7KYBeVlN6Mi3r8P7Kg5K6X+TStfPM0AfKrhF4PxrDvlHynPtxKEwj+zDDa9SSnp+xch1U8SWhkcqW5kMzOp+CaxvE77QmsZKbbRNDYe0ezeVUEgEjDMP3BdcAA07WO0Du58gbI0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634518; c=relaxed/simple;
	bh=KDaJqLXNcCVyqguB7u6yZb8TXNUYjurXSZy0CIDUH2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VjbFAR4I2Ynq+gGvZEnNTbPOFtX/+AAJgeOO0Irc30eGL53LWliltcbPUekP69RSdIItIJEP1L2X4nhaxWnc5FiXrvdDZd7Lo/n3t/2TFNrswx5hyKYCAwGG+ge8KF/TNudt+wncGYZ2yQaxm/Q4kPGIn94vXb6gjKjqvqo2drI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U33FJM/j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdXuHhu0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U33FJM/j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdXuHhu0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60Kde3702394
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZjQDioJHJpaRJll5O5OcVoNVSPLQ8ff8oyq/g5k0SXc=; b=U33FJM/jPVwxzlKh
	dN/VZ7rR7FwaTuIESZ30pMuQkxN2KkVdjxUyhDWCXs6HnM6F5CujAZEueRJUwvOr
	keswmPgMrOJJTPsRIvslVQ2GrDV3iRvi9qANKcgfspKm0DjQq92Pn8V1Bmio2CGC
	YTZ0EKotJLR6sfPVEhqJ5FSS3UetBq6WeL7i0S5JeTKJEjPr6pLba190l+rSnv2K
	AOToNyB8HITveSDYhqaUjEMWtb9qeMsnWjIrDBqGCL+e2t2bSmR7bnEkOYZ4ubNe
	ixpm8BpMSS3ASQTE9hG1VMBvYiKEXUStfeX3bHz/fGCyJwe7kq9Enpj0pYxx+o4A
	xe5+qQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc989u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:41:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f8e7ff71so13813085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789634503; x=1790239303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjQDioJHJpaRJll5O5OcVoNVSPLQ8ff8oyq/g5k0SXc=;
        b=LdXuHhu0dzJcyQr9l7UncFAEZHQU45DFp4Lcqc8vYGwDY1RyTFBP0m+XuJ6zb5YC9O
         cGFd3hyU/slDPICBGFj//O+6pWKr0Uonnbl1xbjaFHknPMzfK/78Z62tOigCuqvFTriQ
         faJvmUuAICKlHgdsEYeZlv+huYZ8wPjG1JVBcMjEcb95h4swY9YZyFfOxIX80EIoICmw
         B432FgYBSwR9J9TvbJUxccer1XdTiBkKbhoWj6A+sjwg+YvJR3VErwUUkfi5QqIJoP6y
         RHEgaeZUMnda3JPklxgpv7Q9KcyV3xgKilpHmqrdb1UJ6+op9EHzCm459pIf91ANbYNU
         0fJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634503; x=1790239303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjQDioJHJpaRJll5O5OcVoNVSPLQ8ff8oyq/g5k0SXc=;
        b=1UPcZd6Zs4LDBCYsI49wVuj5YOw756+dAq2xsuYJDf66qhR/DFWDtYO1o+qd5SdcDS
         18hGh3DnlVfg6rO78oQs25ZWiFVqXYnHC9SelddP92mE34daa1Z9wAANDbl1bjYwCv/T
         7E3N1n7FZJMW250cmCfxRkYp8Gr+IxwCkpZJtN2Pdt+hVwnJii3Hk/LhshcDuqaSQHG4
         sXN+o0exiWyBcfd2gxXcnW1wLbRgG00vXSIg2/AVMVn8Ani5jtKRTi5UtHZrdyqsocgW
         ODnUzVGV0lvNzT6CSwB/TImIGLeflj1XOsbxnb3gnW6/xYvWSOUwDB07H4tg2j9tJkPF
         Jpig==
X-Forwarded-Encrypted: i=1; AKwUvByfLnrzPYUMrJrQkLxxXS6i/HYMq4q6RTUwjhzrQy4Xq55bgqvmPKVdqBO7Cfi1oHwLlhiE8NvUfoRxYhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n821ozDnsmvsOk68O/dRUD+JPkioqRHVTafdl+vPQYRE7dVoRT
	1wkuIluiLwLEzCagA4GP5oX1K90XyZp2ls4lsKGKZCcwb2aGqVcgxyJ4QFBw8XrD6w3aPGatiHE
	K/sd8HdvAZC9Sci3sxTTBl6aYXs18tgUU/qYWVKY3qkD9K/EAw3rO3hl/I6BZW7aRf+rGcDSEyK
	k=
X-Gm-Gg: AYBFou2KC+blMz5+p7dJEarWwNymx9KtRT91fFLKKAmHC5svfYt5lGHDxCsQ0nY2lga
	CMhKlQh6W0ryG1SL3BzxtgYsBLXVr0BKYGldhF5iItvpywI2rTzksPSmPIZP34M5hZ5iJz8Fe66
	qBUmtyMXZOUZpNiI4J4v6jaNAGczsTDnCDvuicNw3T+cZJbHrR5LDam08Yn9+fmCRITxo/Hnj4t
	y7hV8NXLy2ExojchsSjF0si9UEZ0Cl4tFwQH1O79YzE5QJBGBtMDxTyyB12kPrXx6vo+/j9gbdz
	CPskbdVvKf/oZCJMlrNctBdmIzHkv0UG+21zPHmwWuWOxFvAO9npTXoK5dJ7id9acmBJKQphcIZ
	dWQpXgYLjoA0sIZvI1fKIFQ==
X-Received: by 2002:a05:620a:a189:20b0:93b:beb1:5790 with SMTP id af79cd13be357-93bbeb16790mr525453485a.5.1789634503312;
        Thu, 17 Sep 2026 01:41:43 -0700 (PDT)
X-Received: by 2002:a05:620a:a189:20b0:93b:beb1:5790 with SMTP id af79cd13be357-93bbeb16790mr525451385a.5.1789634502896;
        Thu, 17 Sep 2026 01:41:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de0898bdsm260029866b.5.2026.09.17.01.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:41:42 -0700 (PDT)
Message-ID: <6c61d38e-e874-4278-b188-166cbfdad067@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:41:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: nord: fix GPIO interrupt target width
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, linusw@kernel.org,
        andersson@kernel.org, brgl@kernel.org
Cc: pankaj.patil@oss.qualcomm.com, maulik.shah@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDExNyBTYWx0ZWRfX7echisM2PyVp
 ixBULc3NcH4QZTe84jhilijaex2g1JS95zr3OW9cC/t6YZffygPtAQgR2PV+15z6M1+wHct6pwJ
 I/dsCiwBpxTrQFVCCqWbO/hFs+m9MOh8sUzNR/PA9Atj2YJfvwDUMubvcHkl08l50Rnizm7f3kQ
 yAh8M0LmLkteP0Anw2DXRVxuRuMGwDNmXGy2FtFOtauuYdBoPk3Rnn5j5KPRrPpIs7+fjAHPScr
 NRMegFRGinGvkXHVm1DANbbILbjJ/xTI99w3seihsa+39sHdBC7fK2m9auDj0r3X7GSCr6aCcf7
 1C4kOyc+jVCrGm3FwRSNghhtEw7njfCEAogz7NHgpK0XFuyw3JMLu1ESOxhPf4g4y+ap6P6TEN5
 eIifB60KpwIsyGL45mqHQrm7AwzyYbb+tcr515kQOT9HOZjx/hlz0F+nXO0+E6fbyCQ7QUophaP
 xL0EIl9u8jbG1iYgT+g==
X-Proofpoint-GUID: BByjUtw1LkvPkSLkvP3-63FKfrJ0IQ0-
X-Proofpoint-ORIG-GUID: BByjUtw1LkvPkSLkvP3-63FKfrJ0IQ0-
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aaba7c8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NCczGnymYEpDLu10qSUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDExNyBTYWx0ZWRfX/bAMKpJNC4dV
 86BsZknQy42ZwAFfzSiN//PiBEHYN9pJoJG1sOtVURBc3/BJO2feNcuo+qBriFiTslvG0K3Pwtn
 Qi94m0dVMpCXJLClPvK+Fh9JqIuuZQE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170117

On 9/16/26 10:57 AM, Zhangfei Gao wrote:
> The TARGET_PROC field in the Nord GPIO_INTR_CFG registers occupies bits
> 11:8. Describe it as four bits wide so the common Qualcomm pinctrl code
> clears the complete field before routing an interrupt to the application
> processor.
> 
> Without intr_target_width, the common code uses its three-bit default
> mask. Since GPIO_INTR_CFG resets with TARGET_PROC set to 0xf (NONE), bit
> 11 remains set when the driver programs HMSS target 3. The resulting
> target is 0xb (HPASS_DSP_1), observed as an interrupt configuration value
> of 0xb1b instead of 0x31b.
> 
> The GPIO interrupt status is consequently latched, but the HMSS TLMM
> summary interrupt at GIC SPI 208 is never asserted. This affects all Nord
> GPIO interrupts using the TLMM summary path, including the Ethernet PHY
> interrupts on GPIO55 and GPIO141.
> 
> Fixes: c24dd0826f06 ("pinctrl: qcom: add the TLMM driver for the Nord platforms")
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

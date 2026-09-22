Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20255326C7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072511; cv=none; b=YtjLnWrE2wPESuD/KY8fT6vf7YuAfh/ZcNY2aLVrqrj4VQT+vzvYUDICd0E8Ack34zGRxKAzv/SlPkKTu1F0PSEw3uX7J5zkbplc1xIW2gDNyHvK8Rgg97foeNWC/1oF9wJzfKaIanmNDd2KdRl1Kq913V+vhk4WAfsb1yp+CMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072511; c=relaxed/simple;
	bh=0gDly2DjydPH7eG6XkrW3hL/VzSJZdDSMmMDrUfdRRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hC4Q+Lfl8h4dwUMbT+/XY4z2g98SPcPIG4svDV6fqKFaOWnxxLE+LT9AeppI66AJwO2jgWTTcvMBaPCb/eyZmSbwLIszOIjmes9KGM+PUWwiBR2+erWZZQEIUJx+Yyd+1wIfPkd1XW+qOIX5XjklIigEWd4/FgBqaOYxU3HuXIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLJBMg34; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEYkDZbz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLJBMg34";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eEYkDZbz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M8dV123705080
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qq079AvZdlE4x4HgFsKSI+fvGI2Gh2cpL12kLdf8LiQ=; b=QLJBMg34CZ/MlM/K
	MzQJsvDpgbFiY+OtG5wBVptTPyvuGfvjQUTqjxGSHFcxGlVN+QTXEoGb+CqeSkA0
	9G4u5HfpaX+9eV4eo1Jlp0ieFv5tk6jXCZAVMHbM0bE6ICrvR2lao795rmD+yjFQ
	vp0ueGe+hyT7BSSYof+bF/wyV2JMQYhR9Cr/UTozbKeN6HKPutacuxvbytjKCqq+
	MnLabpB/U/nwcPcpnkjbkbRpKZbzBbzJUN5ZQ2Lre4IqZ75voT+tGQICj3djM3gz
	HRF55iN4bp6CRzgtZVQsOobbkBSM9DauczMen7Ew/cgr3n5g1HPED9cJ3MB6hZJa
	yyob6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqgdrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:21:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530d04ab694so8368291cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790072508; x=1790677308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qq079AvZdlE4x4HgFsKSI+fvGI2Gh2cpL12kLdf8LiQ=;
        b=eEYkDZbz3u8cqiaMXfZq/p6gPPgYfL37BvQpk/1thUEJmsUcc0kOl+8F9kFpRCZLJY
         zo87I/z/IRysxH9py9NOeluROBsODVrF20bTP9VZJPgXII3MrFZ4nni1A03z6K03IttH
         wZDR6J1R4DzT86vRP0sXxiw+UwQrBqKPtML9ouQQlkQ1WfOS09m2UnKX1RWPsVeQ2mUy
         iaqIIWAHMAip4VnrvUSw+LuYTYL035eceVm63NnnvaxmtKKYsQ2+QuNoeAb0m/4BFFEE
         wv6S4xKPXJ8fjV3RREVPNfKYMyVTMdtJQNqpbNBbk8wihcjykIQti42dqsuf1Qxe44HK
         Fahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072508; x=1790677308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qq079AvZdlE4x4HgFsKSI+fvGI2Gh2cpL12kLdf8LiQ=;
        b=sZFDgCYtXjdCyD8H6z9lR4uwG38Y3VLgphOr+JNHIreCoOGfJNErS9LErEy46IF2QW
         IJk+i3cNX1MYo7xwopfRjTwG/OwarevlIuznMgT2EUoUFPL0Xsw67Wt6kpikVUWitVUc
         I+9dGJXgQ+YKi1J0O6YmdE/MUlNVmrPmpveM5HIsJdeDkHK3ZfR2F1XiTs8ddRlZpRFo
         5NEZ1o4GtYHFHFxMKZ1M4W8La6rybIg/t31jLfiUG8NYlDaA2BohLrRbZGzjaRNTc+Us
         krw3Nsd5dvrbDpF7yOCXI5jjnxNQfb42KbHJuVzVsqjbtS/rdpIVtuJY6c9I/Gvo/3x8
         +63g==
X-Forwarded-Encrypted: i=1; AKwUvBxqkeJF2Vc/+r4wfE6//CS3MFbT1Gmc9PrbYSrDb8xvBeTn+15n47dePPvUSEcWfLCv+w3y1UBcdJdZ74U=@vger.kernel.org
X-Gm-Message-State: AFuF++lnTNZ0SrpOi4nK0fo8gUajipSnTitZGCdQHJPQl1moQmebhGZA
	95ZlMlzOgz0lBexaIGE7T8QrXE1GCvUei2xSoTblCiZvuJRY8eB2GEeWqnFR8phlab75W1rrt6L
	TBMLXPc1LwxwAZHPb7L1/v71RS3arS5yihCfads7NdHZm0u/cgzY7ynlaPR3zZxYrFYk=
X-Gm-Gg: AYBFou2tj/+OEBK7NS8yxRZkcij+jylw12xk26M+fvhlXoBGyAuvYLE2Qjf5hvaFkLP
	UllcokdvesxGs4tom0MBImwkzbM/5PioioUL2kDRXxi+EjHEtBnc2J4KCczNgEZNxYFtfYrSDeq
	g6x6OjhIZ+Grj6Wi3LcBh9hVlOyksOmz7/lAJ38eg60bHVmOD13IK7k2R0S1A6SHWQUUD8YxYks
	Tvb0DCLprSO/GfiXiRm3ILE2DHrM6U9IbG6ejWjH1WJa5pIXyVVMedTWHZJRVJthQvWAT8RmdYa
	AQoSePznO7o3tQoHVIAePvqocxRiX6WKQTsinEkFUJobsKnZ4GV4rU8L2PbcU0i8jDq9RjBG2t8
	6N5yNbIsHB9ZhHefijIhqcg==
X-Received: by 2002:a05:6214:5b04:b0:912:4680:c97f with SMTP id 6a1803df08f44-913fc9f41d6mr50278076d6.4.1790072507977;
        Tue, 22 Sep 2026 03:21:47 -0700 (PDT)
X-Received: by 2002:a05:6214:5b04:b0:912:4680:c97f with SMTP id 6a1803df08f44-913fc9f41d6mr50277836d6.4.1790072507603;
        Tue, 22 Sep 2026 03:21:47 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c6287b8sm60692866b.55.2026.09.22.03.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:21:46 -0700 (PDT)
Message-ID: <0030499d-6a74-4483-9d2d-e636b58becb6@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:21:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com,
        shengchao.guo@oss.qualcomm.com
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0OSBTYWx0ZWRfX1Tc0GxnSvY78
 WuLLk6Ot9o4iSiDR3c7vaLRP+ARCmJ6EgaRRRZK+tDi3in7rJLdDUPc44EIFitU/QHzHgBn9iSg
 FNqfeiXfgGV26oVX0l7IWVi2/iJjxrjDEOeyYPz75Tb19Y4tEq4oatK+jQj3qs1b2QWB5lvcMnC
 1lZlR6z4Bd+n8dQh9yUYxGbvGavn+tSl/OpPB1gddNG+4EJf0E2Gjt0nFUm/fKxmf7/kDvPVCZW
 GbUZhEUtvZU81E/PzMO02Wj68zjMSxnxdiznsJFYZjZenzyGm6CePxHDLzTvIIjxoeAFft8jW+6
 UxnPo9xHwBHn2AiTPx5T9x80283qhXQwp6YL3QR5xy0mtq9PsPJYAChnQRUzA3ZuzDLTqxOaQ3+
 ZXziqX5N98yw7kIcVEk1C0lddi1M5CGUjAnHW+pcmXIc2ZZeUHzAr97kfiljJI3zMWSv0QQhvBU
 E36sMhBYhRCLL4bXoaw==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab256bc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OxrQ4fpuk6iiGASJZ2MA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: YjR84tRCAOgc2Tlb9DrBZ-aXLcPs6fcR
X-Proofpoint-GUID: YjR84tRCAOgc2Tlb9DrBZ-aXLcPs6fcR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0OSBTYWx0ZWRfX6Wcw2aB78XDK
 sRuRsFXhu6petciPKTOVa0a/IYYN7U2XFPNr5KoQKCTGvD46141Qu2R7GPfVTxNbQpA5x9oImi1
 CqHlDNzrGM0iakr5GNnNNCeNmWZAbho=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220149

On 9/10/26 3:00 PM, Anurag Pateriya wrote:
> Add the sub-cache table for Nord, derived from the Nord AU (Safe IVI)
> SCT table and limited to the POR use cases that have a unique SCID and a
> usecase ID in llcc-qcom.h. Nord has the CFG0/CFG1 pairs and the full
> ALGO_ALLOC0..3 set, so it uses the v6 register offsets.
> 
> num_banks is set explicitly because LLCC_LB_CNT in LLCC_COMMON_STATUS0
> is four bits wide and cannot report sixteen banks; a wrong count makes
> the driver map a bank aperture in place of the broadcast region and abort
> on the first broadcast read. no_edac is set because the bootloader
> leaves the LLCC EDAC registers locked, as on Glymur.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---

The robot concurs this matches the reference settings

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB6949CF40
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048263; cv=none; b=pSiZp0QFQNpd/b+rP8uqefzMlsDlqfIHr7BP2aNH+9U753YbPAMKKrwT5REb5jwIY1B3/uBZ2+CrbHvghdxJSW8f5VB3oUsLejPNlSpe4s95pvWAk4tRo3P0++wabXVSU7lm/+m91B5dgiPZFc8wEBew8bAfsTHySUdI8L+c4s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048263; c=relaxed/simple;
	bh=lrHkqTeo7uD619vM07k5lHCSbLgFJ5tG9eHMHhzaDQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZDMh2FplN5v8iBVf/0bOm75EOBUTD84FS3+dhQONdy/DUfKwlvSwMWMClow76u35E0OSx7XBAdHRgaUdCTFffmKDSpUxnzeUR9i4qucrKGppTLfV1DMcKqtTtOU1JQlp6UJANgGbIAu5vW73+ytj5Nn90V8XBNPWUGdwcJcqqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZtfKN/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTkYfVBM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZtfKN/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTkYfVBM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7YCg216009
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HbfzeIYkh93I5t1B2s81xlBjd1elN2hz+aDhuBqRHnQ=; b=JZtfKN/VAeG1gUUt
	xrr9OspZ8ehqwBjMCh5BD/mSbIGdf1ZQ8CB+94ewwhW/R28W4Iu1fSVPmT6IOof0
	iR2k8hknngnSXx3MwgxeW0dHJPPndrf8iYvICtMGk3Y6gWClLHsN3+pA6Hz/iQek
	HQVv1icAvn5eCPJBlq7jsYqqrblStHJBQ1UvUlgqRlfrScUHxxDSsRDxIqsuJiZG
	ki708fbxIXFZFqqJOOSTnHtPuZNLNebp3kM8XT2QSXEUHDlHwAjIPdPCIMnWD/N6
	eK+MjIHlowF0SSVCtLcBbi9sDnrW+Jnay2JMA5rEmrXjtds2U9ioQxuBHfjXTke7
	H64OKQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn9ckh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:51:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a74698972so580454b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789048260; x=1789653060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbfzeIYkh93I5t1B2s81xlBjd1elN2hz+aDhuBqRHnQ=;
        b=aTkYfVBM0c5aZw2WAOEd1M8MzqbW9+D2AwLe+G+TmYEbp7DX/BCSqqbnLlJcouqwAW
         YL1JvWA9DCNYEuoYSNGjQHVslq9DLFrJn9rtlboB7sWsOWAtU3t3Zi/pMefSHkpk7Ebc
         2csH39bdjQJyt6QgIPjZiyXM7a/3mAVq+Nrey74woFum0ugtHwJzgThbeyHKCP2RpTdr
         U411MRxaNw2Anrp4vKcmUB2SOiVRhVvf7xV8Be2XGjMBDgaAG5uVQj2NN/SzAPye6/tQ
         4u9+Jfif9SxtEhVZ1UJZEUliz/Whvb7b3qIAc6lG1Gmx8qYdINDaYIm4tTVoEtlNs4Lx
         V56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048260; x=1789653060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HbfzeIYkh93I5t1B2s81xlBjd1elN2hz+aDhuBqRHnQ=;
        b=cWlLUZ+kqHbNpzScnBIrODbWZHWcvjdRpjUE7d0oMCsjDKfT9KpsndKBWAO+HgwlhD
         D/XonRMCjCNXoVcrI/cXpDtrkjNRbEa1QSNdr4p6HVgFTRmM0IiDAA3RpfeYRkCJi4c/
         IbjnA23PP8FG7JSs3xY5M7NnNs7WJNLguFKLK0VPmp6/1qaBL12TsySo8xUcZ2ZhOMrp
         Te7FdchUdRjDZ/TeFQUQ6MX5anO6laFU7XNVeI7gFAj55kjyZXjZHLzGjoht1eW0LPA7
         at2t4kQDAQdNSR+OJ+qjJDjutzhb2yCS0m7Jz4xQulNtrzDam5EvN+q7uuT7cVxSqTVa
         nyHQ==
X-Forwarded-Encrypted: i=1; AKwUvBznTtb8fEoaq0uVifPpCLod4lo5QYr+JQd1zUXifRAK4RIUe5PP2Rrwm9LYJm6xY1NXQVoBur6ZONaNhNw=@vger.kernel.org
X-Gm-Message-State: AFuF++kL0FkHLobe20SEH489zZT3MzxkbRLrPYa5MhHDK58GntxgaT1A
	JkKfQ+ddV2EdMtDXm7Ai7VRMMGYHLzBquTJIY5IZ22M+NWcZzaoPfmJ5WefM7pvtHln4+iW2iTi
	AXA2FwYiXYN4QFGkXB8G0mLbL//TYYmP2Ua3VPREb/r8cHYrwAnsXTtqXg8SEnKNHWSo=
X-Gm-Gg: AYBFou3/hUb76TOpB8sAYtwt6w7cRVJ1SHVvzPtwU9iCROOwP7zGiLK/wb+7Cmjlsby
	WdRTob2BpsuK3l5bZvUFGtPxNBTBfF57ZhbO9cnIZfJhdKGoaa+NR2UAbAvjLcWUK5dgU+LQ5g0
	KWU8nwJD0D3GxempvAZVBb1v823Mtfzg2wtop4h3nZ0WzMVenjs9q+DOP94bdJVX7CFHodsThYX
	xE0h51YIsCKztLUgBupjZ6CjM5zY5Ej+iJJf7YZclRoNkClgfbrvIeytbUUKAzTcVo+SMM545rc
	f2MYtLbettKljIF7NGxRl1t7rr+U/llfqu6JlCTZg0HF4DSoUrsbfKQM4F0qcMIyzfmR/casSWa
	Ed8rSlD2rmu5DyzJSOijroBu8brc=
X-Received: by 2002:a05:6a00:1489:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-86945e5fb8fmr8547207b3a.9.1789048259357;
        Thu, 10 Sep 2026 06:50:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:1489:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-86945e5fb8fmr8547100b3a.9.1789048258767;
        Thu, 10 Sep 2026 06:50:58 -0700 (PDT)
Received: from [192.168.1.83] ([117.64.75.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-869a5b727f6sm1015221b3a.28.2026.09.10.06.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:50:58 -0700 (PDT)
Message-ID: <c1bfe656-a190-47ed-ae8e-be01b81221e0@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 21:50:35 +0800
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
        devicetree@vger.kernel.org, shengchao.guo@oss.qualcomm.com
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Content-Language: en-US
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
In-Reply-To: <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2NiBTYWx0ZWRfX8MJ/8ZSwTlF3
 gV8VCjT7FEpe8qc5Zy/e6N9RVTnieAAGW/Npiu2lPA7/DRkNj6s5UxKhcXEBF7aJ3Hl1/tGGDjg
 HXXRHaZ+yIXG59yJAPp0OaxLEyVKXW/AA2id080+IrLUNaDJCAd6R7GEhysUCgbhOhibCyAtDrQ
 ZOZDqHerAQ8yo4slerFYYIEZ66sdlnubImF3gYQmTWcSZkuO8YiODr6fs2NhT6uo2Vsx0LLYy3l
 vvYkoeC68aGRLDNy0n9qjHUeX2l2icIbz3MY427ozTy75doFx53dcH6eoseUG5ALLeXPcAXNr9q
 yh/1drVlJ2S2saq9SS2mwPhYrpcSWbodSXsHiMLBLnvZjQrfb6ksnDnmw7A62cYiRevXlygGQQr
 Fw7j/GFyjiY2SPxcUaXkQ0ZnfXMF+w4a+RJpAN1heDa+QnH013SRD96A2Wf8Q2/UsU0CIzPfRTR
 N8NX3AkEvvy2h/lDCRw==
X-Proofpoint-GUID: UIg-buYKivZgG09f-M2R3IlaloPD8XEr
X-Proofpoint-ORIG-GUID: UIg-buYKivZgG09f-M2R3IlaloPD8XEr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2NiBTYWx0ZWRfX8UWt9Ypv0Jxa
 1cWX/9VDoc3vEO1uOicKL+4uS8BESKEaMqOP5iM3Fq0pJopWcJwImaW2rotMv1Fl/bW8rLiZTGP
 tXQTPE9S9V6Fom5V20jj7lqrUO2ReJo=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa2b5c4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=KiVCl6X23253Cl38wZou3w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OxrQ4fpuk6iiGASJZ2MA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100166



On 9/10/2026 9:00 PM, Anurag Pateriya wrote:
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


Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>



Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C15553A8BD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954157; cv=none; b=HT/l7w/xFDHYzqTOqrF2lMwQuFQFwFcRdeiSe8MDoNWkfy+AKcyLOqnpCLcuCKQ84GSkYCY+gPdBgah/ufdV6fGAAFmKIqBYceszIrZDsaaj2eGqNVHfXMSUo8GtC/Vju7pNRu78tnuykVe42SGF/h1ZryQQUIp3BhgVX/8zv5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954157; c=relaxed/simple;
	bh=dPrJAeYgm38j4+vkp++72DejL21/ff9Rh8+g+/KYRwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YR7vTj3LiOM0+aULUoBvRUc8memYqQBZ8BSvHh3Vl79ZdVI5m6q150B8LKL2WEh8Cbyy7tnLlhSA+jEsEragU+CjBYyZo4LUJ7KVOm5kR4SMBTeyAvVKstaW3ISL1U3FKQK2/dgooUc0zt8LrUl0nCtuWVXgiihoxCVoEPtLpS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKu7SAHP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCK/VcY6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKu7SAHP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCK/VcY6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUDF22654001
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	epxMbI0y6nHSNagsiwEyeMZgg6Krl3r4f6apObxAlN8=; b=YKu7SAHPz3RYBeFl
	/1BsREYL5SGOwU6weWgn+RLtfyq5LvtZau0EvG/v7yUkGJKEpBuTL3i9nmX1bnnG
	aq6nBBLLCMfyiOidx3AursUXVTrTuaK0hwFGp3/KfucGIyBhDLr45Iz0D1P4Va6k
	zQHO6vgFnW/MGm1KZVFvB8xPeFEVf1L5lLU04LO5Fv06PFtJJeyC1Hxd3C0YAllE
	ERd36xX86aNgtHe78EY3gHVqLRW+HH9RcO4mjJRsf27UD3iLv587XDs7cDqeq5WL
	ymj0xLhoRhE5NPbonHipubSWMHqdXRgQglL9yHtbXu16Qb15Xp4RyFZ8KwYBUMXu
	q9I2ZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha3tyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:42:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53038881f1dso10890731cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954154; x=1789558954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epxMbI0y6nHSNagsiwEyeMZgg6Krl3r4f6apObxAlN8=;
        b=iCK/VcY6EogpoKs6FPTBj614Cgqb/MuAE44L8GYQBsQ41/m+P1rDfvkcqwEdmaDPU1
         Pz+JCkKXkDA4714QFEwiuXzvJTJDozKqOZQmE1DF4lIikP2d5rvVMnreDj8jZYrYzpAc
         p+YWba61ECloEl6oQ1HQ/S/B6/IysbkC1E0uU5ZGWeEQrML64/L4bwAdr25PhcHfEgLF
         A2+eABZnayE0BleVSUhYQMaWFFlVqpfFXUVWLtr+iEcVwxGLr0eHIk4NCkhHrvjmRWmW
         Oa7cNz6rh1GBIGaeED/ex2gwYVyDP2CBxlcH4WJR4wWGEV5/k0C7Ezz7GGAt96cuddoK
         6LCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954154; x=1789558954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epxMbI0y6nHSNagsiwEyeMZgg6Krl3r4f6apObxAlN8=;
        b=kKmcNm/9ZG3VHQsiZaOjDnqQIAiQvzvCWGyJiCIFk5c6xFpB8behHNCVgTXzvjHt96
         ClBLmv4+ps/g1Ve+pURcGCJCIGECUOJ38N4ykYeFV4ouy3UZddBdXAlzfIsZVa6dEGAU
         IYkWH1GKu+zKN80rOuNbcaiWbx43ztePp0PnEdDvd/hk1NgKSO3igeBoZzLI7f/MzXVq
         36SlfPLMYkSSKr5tE6HYHxd3zZD/UVScXJG++BfzyMtBTf1iAq3jLHMzhVunQK2gSmGm
         L0v/NqKf/dKVunMJ2Wv2Cw/hEiMxxql6w7rTniBLh4pXlPUcLXWoGb+3GGy0bsDLCSRi
         oHlw==
X-Forwarded-Encrypted: i=1; AKwUvBwqQDCW08bQFg4q/Tohpl4s7DVrUr2BYIa7cMWJ3BwMv1FnVLAKRKWd8D6t48y24SpWBIBsMRzI9AsOiV0=@vger.kernel.org
X-Gm-Message-State: AFuF++nXzfx2SrSr0uWhn3AU2bci6lrFoCJLzC6yiiWKpJq8leL5Nsma
	Wx2evcgVrpO7GT+2RYqd+iYNAbkASg8Hf0YXbv8ZVeosFU3DuPeDLBEqg5S2TwdzgkvDzT6TpsH
	LTfYY+4j7tZQmPeuf3DqAnNA8Gg0GoP67+glBS4n4OyNuVKx/uuqVcbmT+pxZOzfUgH4=
X-Gm-Gg: AYBFou3/UoMevVO5kit1+4a7ezHuzZUpltoAHPYvMQwLAQLw3Mbsgv5xPPAClk/+X9h
	KcCZlbEWXQp9RBNYEP3qKKJ20lhRyRN5um20OJe3Qs1gSEEymfmos0JOVw6SGTxXB/OM+dRugJ+
	pE0Qi4LaEgeSar/eOhSfP1WLxBfYSKUYUSUZwHNLWTpbXNw4WeWJvQRB+7zyiIp6myfkjVMxxqE
	e97dXxNvmL1A/9D5e3woLRc7pk8wmC7AlaGwYRNbiGk0IQRrKy2MFZ7QuRTgARNFjY5qhnPGdJQ
	VDuxGj29w5iVDj/6nLm0WbmWA9b7L57v1IXINd1F6wDaMGcMxjThpJxu45yR1niB07JjnPQC+/y
	vCKJTzK8/kZOrrf0TIs1tmw==
X-Received: by 2002:a05:6214:1251:b0:910:39a3:c5b4 with SMTP id 6a1803df08f44-910475e31ecmr313455526d6.0.1788954154206;
        Wed, 09 Sep 2026 04:42:34 -0700 (PDT)
X-Received: by 2002:a05:6214:1251:b0:910:39a3:c5b4 with SMTP id 6a1803df08f44-910475e31ecmr313455126d6.0.1788954153796;
        Wed, 09 Sep 2026 04:42:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5768c2sm739578366b.39.2026.09.09.04.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:42:31 -0700 (PDT)
Message-ID: <bc2112d9-4085-42be-807a-2242a1c510fb@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:42:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: geni-se: Correct QUP Core ICC vote
 constants
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Matthias Kaehlcke
 <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20260909-correct-icc-bandwidth-vote-constants-v1-0-fbebf6b3c341@oss.qualcomm.com>
 <20260909-correct-icc-bandwidth-vote-constants-v1-1-fbebf6b3c341@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909-correct-icc-bandwidth-vote-constants-v1-1-fbebf6b3c341@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX9eJbdXxcZY1f
 vtG3X8pnuP1LqfEgrwE/uPj0tm2hiyIhrijujCG+nKwxR+gOI/D58aKfjsDTlM8svE6HEZdtX6D
 /zsqARmX9q8TWr/0urdaP/puk56s0k6arP0fTRPWmWpc/YZpN2o7rjwwtXo9kscOIX4PA1MJH3h
 ylIYZlGGa3ZxIFhtHoSNDaDmnDhKtaSmefn9jc0uFLc7N7yqWgbH1WK6vxit6uC/73Ki8C8eMav
 YlXk17QVEAkPbB4c+eFEZeRgYdGtcscMSfR9VA1edJewJNvTyTn3kfmnfDotIDzGU2Jr+6VnqJp
 qGlAsPUti9l8cq9Hw9elHmZHaES2EGjDIOpFPH6Lume1atDCLLdsg9hzOWs6txLjLKzh6fDNs+G
 hUjCM3LOcmBhkf04vvDQRzSr3DMRhFD/EDVnATZyS3eBEXeJKf6xwY/RjjMVBJI60bIAJtwfHcZ
 Tx/54xg8QvbRWQBh4Dw==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa1462b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=FQoka4uyCIFQdJF29asA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ES-XqETVR7BKDnSITuuTKU-FBejFwgLX
X-Proofpoint-ORIG-GUID: ES-XqETVR7BKDnSITuuTKU-FBejFwgLX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX5W/m21Z3kdQa
 pzoNeDckuZ9JMvnxrnTgKw+OeXgjSVpdXCSabe9HlFljivuoEZkufS9hO4DCzgvBzXxZlXLnCHH
 4SMejN+H3v6Q8FkJyX5eJ/1zD55kWv0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 9/8/26 9:05 PM, Viken Dadhaniya wrote:
> The GENI_TO_CORE ("qup-core") ICC vote selects the QUP Core 2X clock
> rate. The CORE_2X_*_MHZ constants are expressed in Bps, but their
> values are several orders of magnitude too small. For example, the
> 50 MHz threshold is represented by 2500 rather than 25000000 Bps.

[...]

>  /*
> - * Define bandwidth thresholds that cause the underlying Core 2X interconnect
> - * clock to run at the named frequency. These baseline values are recommended
> - * by the hardware team, and are not dynamically scaled with GENI bandwidth
> - * beyond basic on/off.
> + * ICC bandwidth values in Bps for the GENI_TO_CORE ("qup-core") path.
> + * Convert them with Bps_to_icc() before setting avg_bw. The QUP ICC provider
> + * maps each threshold to the Core 2X rate named by the macro suffix.
> + *
> + * These values are core clock votes, not GENI transfer bandwidths.
>   */
> -#define CORE_2X_19_2_MHZ		960
> -#define CORE_2X_50_MHZ			2500
> -#define CORE_2X_100_MHZ			5000
> -#define CORE_2X_150_MHZ			7500
> -#define CORE_2X_200_MHZ			10000
> -#define CORE_2X_236_MHZ			16383
> +#define CORE_2X_19_2_MHZ		9600000
> +#define CORE_2X_50_MHZ			25000000
> +#define CORE_2X_100_MHZ			50000000
> +#define CORE_2X_150_MHZ			75000000
> +#define CORE_2X_200_MHZ			100000000
> +#define CORE_2X_236_MHZ			118000000

Today, even with patch 2 applied, many of these rates are unused.
Are we going to?

Is there any logic we could apply to derive them?

Konrad

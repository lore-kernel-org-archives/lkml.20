Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88D3499F2E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166969; cv=none; b=QVdFtZrUxqFOv+NLnwFMDs16JoO2cMq48Q2CF7fiTg1ZJ/a0Sig4S/OcYUFpJQQnxXOCVEJOBavYmIbIiIYzVi41JLTY8IGwFCyf7s1f55LrfL/ZjWq5Vkm9/rHbkS9pnwJ3jrxGO0G3jU5gtklD2PlG8xpmECoOihjlJ0vZh8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166969; c=relaxed/simple;
	bh=5rf8O1oVIni9cf4nr5YzRwhAFIpAIxuZ32ao2m8cctM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIYjPk4fnFJ7hqU8l63pjCrcVuJSfOU84guhPIBSZTOHjhgTbvWH1diNax9slu9rD0t+NVvQnER5EdetGiebZv45BhB8RVAnYI+OBtIDHQOvLsyLdeFEgaiWZtscm6McOZzLRkqou95jnjaIfyTTeYfBCATQfdr3IRM4D91vFoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEFec87l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kXtR2mhm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEFec87l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kXtR2mhm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbhJf4145187
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rf8O1oVIni9cf4nr5YzRwhAFIpAIxuZ32ao2m8cctM=; b=WEFec87lR+Tk7HLx
	YShHG8sZmqijeYRHt7G/E6SQauDGSi+r+J+G8nayG8w7XmOU6upjYsRPCbO3tqX9
	+wcsbxMvy3d98CFRsLHH/L7W5r+CQpcig38jHOmHblRw+/io+Nqw3bU2sIPi0wgV
	bP66nktIK7mcAYDMzV5v8Ps5vbBJ9rElF+F0uzhy4xeHZqHOWOr82DHx4/dEvQYS
	Hr1dg9fkhjxpz7bSQMVnzGRlEguUlQ+rfvtnaXYVKdvgbntNQh4qlg5+6G0ayE4u
	osbo1qLC0AAbuYcKBSyUpwDfl3yZA/g+8U89A8ZjQRILYVYNxX4yfqg15+M+LM9J
	+RO+TA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428trq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:36:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9103db79014so1825166d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790166966; x=1790771766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rf8O1oVIni9cf4nr5YzRwhAFIpAIxuZ32ao2m8cctM=;
        b=kXtR2mhmnDq9/kvSo/DUuvS1THvxhtNdOQZn/qIOfPaJTb0tj9revCDNKeypiAOw6s
         5AipmVUO1NDjlvf0blhuQsSbKTGvrKJ7hqaUOaSVwpsWaCWwDTNejpj9kLVwUDqpbFDJ
         hECfB2QhNCeVKWwZ/051BKPBvyY9LjctuaCOTfpbRubkauUjMWNnrgvzwefmxfbFQiGE
         D+YKCYjIaxfNc/V9jJ3B9AFrP2HKkbxxWk9Ej8Ybt+3nBT57gELa3zEgfg6azxgXvTlm
         0BT/Qp0Tm5dZhlatr3H78DLQ5XCqmOqEwOZnq5EtsD1UaKtajfM0My4WrrUHXVVzNohr
         XJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166966; x=1790771766;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rf8O1oVIni9cf4nr5YzRwhAFIpAIxuZ32ao2m8cctM=;
        b=FOFIZY3PaKi6cOz6+WtbkysLivOUqCE+Qw4PKFVKKdZjv0MYLoz6tIk73u9rbjwTDW
         CqzdeBEUFC40p3/hKfEvuOdVQmIhoRf/ZeHDvTwWpFN3Nm2FKu6HQ14JKwR6Pq0h+eWj
         +D88l7VnhWvNUyAvRl5gk4B1YSw+buwyvCll+CdpfsN4ug+/FMaEsEqzIcjdOZjnzKmV
         b6cro78x2OkdVoAlBBDCUaCNmBH0nE9DDbChkesWNXeUX/FSAG/DLr9ONLmbblo1h+to
         MYETvXUzNu7rq43RBJcm5C1NzlYfxkxbiX37MJfOtFh1Wa8yQSfeNP61zbwdxcd0glkZ
         ihhA==
X-Forwarded-Encrypted: i=1; AKwUvBxKbkSW71gfUgAOu61xSd1Qp6YhrHH0xC9ThnQHiYcdHEXN50TmfOJGH9CcZXO9NuzjHrAFwgyDfL/AfMI=@vger.kernel.org
X-Gm-Message-State: AFuF++kJhYWcfZaHL6JlcOJQk9iNL9pN8q82EN18vwD86WlEkf+DSB5a
	g3OL0eMjYmP8To+y8VZMUjulZ8Gqrw0TO6bZsuzBcNAixuaC/yEjdy9vyw1GJb178ne5lARBdbg
	p8mPpOlz1s+vXU9BsdKC2EB2NIc85q//1czTqhLx5YbCGcqAj1vxXvVw+asU9N7o9/7cinFyIjx
	U=
X-Gm-Gg: AYBFou0hkAWhqAQpJM+KPjKuiA93jyVuv0dntPl06RhUmU15mcGu6P98+31xqW2IAxS
	YtTYjri5YOyjkHMytLiQeaITRsyH9sLvwOpWksnAeU2Uv9t9ue7E+ug4OBFAvulmYiAfINs83US
	6TdXyf0z5TqFjpomePk6wCphylolk0w8DDBY97GtjGWmSyn/afLI87n+89JYf3xO7dUo0ueNC1c
	SDt7TJf31+yQuDSr4glV0JDYZDNhgXtLjGpicKiDmMw+48+PfSD0TJGjOKGUTCBd5iGBpCRxFNe
	PBJpgkHu+WhNxrC5R1Vf51mEiPe3O4aPXS+phmsHk0zuI+vr2fH6hmVaZyoZnGO9zHgC00e21V9
	VtyxO28i93PzcVT7eRFbZdQ==
X-Received: by 2002:a05:6214:b6c:b0:912:bed:c78 with SMTP id 6a1803df08f44-9140c4cea72mr41158146d6.3.1790166965751;
        Wed, 23 Sep 2026 05:36:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6f0d:b0:939:8148:1e3d with SMTP id af79cd13be357-93c250f4f2dmr339813185a.2.1790166624584;
        Wed, 23 Sep 2026 05:30:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae65843bsm116549566b.38.2026.09.23.05.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:30:23 -0700 (PDT)
Message-ID: <d8f0b127-adb0-48f2-a5f5-1b6134e75456@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:30:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Introduce Maili SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
 <20260922-maili-dts-v1-3-ac2b1b76bfd9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-maili-dts-v1-3-ac2b1b76bfd9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab3c7b6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1mxdLe5LFHY1OMs2JWYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: ljezIS6Bwc-IIP2al5yrvZD2cb0az0sg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfXzj1MlSZ31TQk
 bMXIKwZtTKmVzdh2TYxwOvHmx+033R9vFkSs1TmxJ5gXSR2Nwl+ylKOwsT3eTcsB0SM7zseb/6l
 HfILIY2wJCIB1EZg+WF252W+EgbiLBT+Rn1b3vErqq+/6hbsvd54sZUt29gJmkQ2I53EufKMjeY
 VGiVPrNXfCTLGGS1duPg2d1fgsxSaodIlah9Nu0UiZSioxx2D5rC8fjCbDXVRQ3E0RxIiSd1li9
 D4Kpsz1/JgE0zNa49ETp5I109UTAN6L1O0FUbwDeIS3SbghoCKQyvvuetEq7HlvkrUY3841eEmw
 M4uxRtGT9B+in2e3b7eFXVGNONBjlWQpXviCVu7bRmBqrA2bZG42nYGtyge/xwDLgMuqUIKo04w
 lJXrxYpAFC511b8yfqEjsq6K3YLQjJibVpJvhF8pQ/e5Tq1qYqJvHfaxcMfw/dAiYFbfFFgAC+R
 AdaktZ41MRjSqJWgLFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX6F16JbyZOSyV
 NURa6BmxRJRlendKfWE4TP0ugkA6o/o6FEESSgA4Zb4k9e+7uKLoz02imMCsoB3CVVJr4idG+dP
 h0z2JImIcHzrtwQbY9EpLLjl0fgCFdI=
X-Proofpoint-GUID: ljezIS6Bwc-IIP2al5yrvZD2cb0az0sg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230050

On 9/23/26 1:20 AM, Jingyi Wang wrote:
> Maili is Snapdragon SoC from Qualcomm.

Please submit a patch on top, using 2-cell specifiers for iommu-map
once this one lands, this is not a functional issue

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

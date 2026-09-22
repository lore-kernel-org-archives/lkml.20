Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AE6556BB1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092664; cv=none; b=s3H1Zw0u9bRgUiXfEIxWEYnZIydqN0uUiYtlo5LinaZvgt7+7dsHgPPHT/tpJa9+IuuKJUPsBZQ6dqJoNE11HKHCGRV9fCrlBxSDT35V59u0EoBrm9J3iJPf0seLIzS/sr7Twt3Yylkb2cVYqUUBa7qTf8emjuOgjGdFxvSwgxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092664; c=relaxed/simple;
	bh=w/1aMUrorD3GhsnwRGoM5GNBpZYYzxfteJuw9evNJ/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGEM/XW5/ICCHluhIZvhj9ISmTPFEHDmjFNXZDSPlexU8IzPicxFtQaO+aoLn53O28pG6YtKCUw5+tLx+qZkBpZv3qit0jPaBWlGDNyNtzRJN/7P8K18+/1CmfzGIWwWTY5R+eRWT/mS3gAbv2psEJE1zK7L6jnEFHI6XgbOa5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfKTD6l4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESuVLKuR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfKTD6l4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESuVLKuR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjHOG573094
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EoVjOh/L5bJN9JqPUfRk2X+zSPYfrN8HTxLTfYK2UCI=; b=cfKTD6l4I4Uy5Ybz
	LCN7pmTckh4u1zCr/c0vjlKAiUPMIUXztpVs9upp4YMhUN4XyW0tU9ldqiQpVCLD
	no38JWJd44YIIQO1Y0tGAG6XVa2LfsisvUwSgNq9bWyL4VAE+cjaJmcftx7qtcU4
	tIMr5jN4CV0J65GHhW5Jli2m7dYtSkSJ5VdsiE7syHsPwJjDpl2Sn8cnrgkdA/yu
	6pDK+6F6QHN4xYfMxDsXyhZMvESmjZLlH+mmrJUoxC1pS4lbjASOIbw4Bchn/eM/
	JXJn4jRtnaa5Y1KrQle9+2thq/HPpo2vEqRM/yGCND3F60nR7XM/tiaaYmrSBErG
	UbzQwg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkjaxme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:57:41 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c9ea608ed0so70941e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092661; x=1790697461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoVjOh/L5bJN9JqPUfRk2X+zSPYfrN8HTxLTfYK2UCI=;
        b=ESuVLKuRYM1Hps38jv/CF3u3ubpedxE3Zxe+wsrshCvu0SZTvTLTBkzsjV/v4saAlY
         OfTdxOofFW/ON9mu6IUi4CW9Luz/ySHU5xtdOny8iiMppPAYXZ7H97h+EQQ66jTiy6Tf
         GzJHnBf5yUhm4RtcjBDlCJknxNifDNDZUQ4pxpyUuMV0fsmeBmG54sWFT8D5YyLFzTdX
         sXBqVcrviy/xCSlvX5lkVgMgA0ObDMJB+7ctrYXyddP73ehxIHQ7dcARiG5FnVscom4P
         4LVudZJrAzLGpaeDocBcTatWgiFFnjNmq3gDrrFM5s8LYNglc6BVm/USZjeMNmwfhKKM
         yl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092661; x=1790697461;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoVjOh/L5bJN9JqPUfRk2X+zSPYfrN8HTxLTfYK2UCI=;
        b=QIsJauRuGjrQsliwGqoxcDdetMS+ZexUJyt03XcKLBzoJgwmWZwF1EFSARMW+4HDlN
         LTV7nqobPsRhvOiutbnbjRA1zuLTxkf38n6qbYVoC90qog9difx5tfLtdg7dR2DnlIk5
         hYFAlYJkHNrVT0taJnQ7hOF6MvFwbsDMBN2oxj683Ltb1NWFy5CBD3TA6OPT57/RO9/A
         k0wvUzgx36W1QkkJaGUlZ1yRLJ2ayPdXW1wrIjebINLuhCnccd1kRspOlr/ut6jQLika
         MwbCtEEBvB6HWvwGs23SrmCLPn/NDiz+898xHE0DP7s4braE2mJeVjAB/NtxDGsBDRIH
         66ew==
X-Forwarded-Encrypted: i=1; AKwUvByNs9WASlS4yZJFrDIH4m/iboWoREKN+b2GNIBspht/PRL7nyWudTsVp+EusGlqsk72ZlQ8xqi4q1vfTSs=@vger.kernel.org
X-Gm-Message-State: AFuF++m8r0wtrln1Mzdy4WEY8nD95/LqKleUeevfGiusKIvUtCohv/7X
	3v8knlRAceZtDf4IjMcOt137LNmSGuGy+IFrrthFi+KRfDq0Bx6NPnVBfGsIvk5XZtlCIhflPB8
	5PkZQIDQqeXKczjWLTPJHUCMdLyjHF8i57ZzJm4JHnw6iCIbjdIdeE2lz4dn0i8aA4X0=
X-Gm-Gg: AYBFou3P5tmWtjWvrOo327GgesVz/w0Z61miAht86LuzT9tqCdCmZMAZjcUwg3Ttica
	rMTWLeEaLgkAFlroHzSrIm2dsMlNI7j7WZIvKgdbt9ACo/jDPp/BS53+uz4VyVmGrUpSBLVlInw
	OmnULhIp9i5genYxIhDIR67QWAd+vFp7NWu7ubaKy2UviQPAoXg1aBfgNvM6P5pBoq1Iwd3iRz2
	ua0fyxY3ePwdfynsYjwzrX9UyT/UiLVRLvFjDjjZV57EvWtI0lD3z23oYW+aMV3rH8ZodcgLTK6
	s9OeAu2wBcp3OiWTmNtFNdLCqB2ApYxlUQfZSeeXJIuhQ+ZUdk25Rk33tJPMYEuZZMmwYRh7kSp
	MC3AX+1T+9huEkCbw2UXUPQ==
X-Received: by 2002:a05:6122:4a4f:20b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5c9b86e8c7cmr7634476e0c.0.1790092660863;
        Tue, 22 Sep 2026 08:57:40 -0700 (PDT)
X-Received: by 2002:a05:6122:4a4f:20b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5c9b86e8c7cmr7634436e0c.0.1790092660464;
        Tue, 22 Sep 2026 08:57:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa450c50asm1274129a12.21.2026.09.22.08.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:57:38 -0700 (PDT)
Message-ID: <97cfc107-e00e-40c2-b20a-8288b74162f1@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:57:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910231642.1794948-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TaQ1ZFpq5Ect-BkULZwNhQyR2MnCdZyK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMiBTYWx0ZWRfX7WhFW1FYsRb5
 pwkP3bAOhCEZ3Nj3BaiwqZ+C3b4N4ARFz8S75kC9mGb2zdMuSjvvomT4xpMa44huLu3fxvc1iWl
 9xTlbTUyQRiXdN6nXHL0QFbYaXbVVY2xPoalgc+tsTh1Z7jBXLVJF8bk52PkQnzfQutaof9Rjmq
 fewKLlxVSgkvFFqb9zWwbmSM1HBksjMETDLIJ0yKF/zVibvvUxlxLc2N0wqvyEEqklLMNLc2byt
 85XtG3QLUVjoJKpd2ypSUqGZeOsN1/WAL0hy80ELAafWkPb7ZGQOEgGC/NZ9DOq1U2RLnm+l2vv
 N05BjB9dQpHZhTHkNPVJLh+lYiSH8+AyOpQdQ98yjWHlVsUttARS0VLE/PyTlHtfbs5vrjA2tLj
 T66wb22yIfMgU8e+tn+MflFyi6zXaZPo8Co4NRqMHSEz3zybxONIT54Edr+6kTR2Ag8mYClTI/g
 83NEOtd01XIx0eh3xaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMiBTYWx0ZWRfX0e4k88m6RgGa
 xTZOAG2OWzrFKLecQrktd+890P4N1m1E00vZghtu5gaGe91Dc1ONNLMSOlm9lcX8/kRfELt5iD+
 UG90sdUBh3yGAf/s3yYyliTHIXUDN+E=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab2a575 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=o8yTP1-73JeV65lf4HsA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: TaQ1ZFpq5Ect-BkULZwNhQyR2MnCdZyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220232

On 9/11/26 1:16 AM, Mohammad Rafi Shaik wrote:
> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
> front-end links to backend codecs.
> 
> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
> the QAIF block. Keep the node disabled at SoC level; board dts files enable
> and consume it in subsequent patches.
> 
> Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

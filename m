Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19214CA797
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769220; cv=none; b=qKbBcA4dgyVB4T660c1dVRMUuDubUawkIMD+FmMonI78WeS6seJM+0Q16NEmcIoaUPX5Vsdz9Fm25Zz/o+C7ZRcmfjcM06C+X+v20UB4FEHd6Zf6FxQy+C17JfY6NbHucHFR92eMOr53BUo938uHvSARI6ogSPF6thVEWLbkdcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769220; c=relaxed/simple;
	bh=2cnELlXD+d8nHeJy2IMCMnOpquMq+7sdSSGzFyMc2Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksHpvDSM3gWycuo98aU7ACR17ANMBVlYLEaBBof6jhL0AdKMJpF2OpF0ChHlAK86WEklO8B+ro2rkeBpSDKVk/GNTkLxDm3uzPm3RD/bdKOTfVuGaLEAWJB+V3CyljI9as5rLvN7hFWja++BCFbPy3wK7DQqQUXmWFs8qsXwhPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmqBPQXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5cCx2iW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmqBPQXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5cCx2iW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8LUG2898217
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOfw5TQVqizGtKblbz+l2126JGzlJDbm91qdzAl/n7Q=; b=SmqBPQXhbipmltUQ
	/awXWS2ERc58qQNMMm8atgOnp9iTfyegw67YPn2R1xEEG6alwJPjLCqD+3655j3X
	I1R6PAVArkc6vexEX7cpgp7tyJUw/JXWlhNJfB4SznF0sDeUQIcIdI7rrq7XJocb
	daeRe/DvchiGEEZfbNihWLBkgEzNZO/J7F6LRo+2lcx9PVrOGeojQG3Qvq6y2iwX
	ojWNPzIN4o682sIaAaxGoH8pAe6gJIC5Rpojm4nhZR13eFhktcRM27iZzmiRoNHH
	0Bi0u7d7TJXQnnkyQtfDQa9Gejjnbm5E499M78WbzhdK+pF1NF30Qw+xfNcApO0Q
	pGOljw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn21th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:53:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a312222dso99878785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790769214; x=1791374014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KOfw5TQVqizGtKblbz+l2126JGzlJDbm91qdzAl/n7Q=;
        b=E5cCx2iWDUwVfULt/WyUvhylZYB3BDtmMpiXFnV8EsUXIGbL/Xs7LMJDWvjKc/QcUS
         yVbknBTnQCDk3e2NXwgungEy645RhfcCH87xzrPmGkdzV4QBArOF59I00GnOtbmPWVFz
         gfpO1aS1iBMPS4hoRGL+KLlH4uvzcziyQUh7o/Zxojp75TxMUqsrj0m1nHA+oLWQ3Nxh
         6cRAwawSvmwViHif3q7V5QZ50pSnjkz9KqfCfcY+h/G4FHfNf21sPU4Y5vaxf1Bc45gq
         1f/ttODzb5JtkLzRUx6R0niUpSQpftPnveHJWYuRdsV6kOjL1qp4J8tU7x0CWYiw4GNU
         IDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769214; x=1791374014;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOfw5TQVqizGtKblbz+l2126JGzlJDbm91qdzAl/n7Q=;
        b=Xh/m9BCba8//4t9fD0X9h8UH8l4zV5FGfV83BVPHEe/PxB8hSrVechYXrrZ1EeLRyo
         zJ3P4dDOsrCo6inRkFJkARRBnyTLdgmQk1TWQTMV668qb8pfMrC2RqgDv0Rs3uOpb5+0
         BeF6E8KHtqku5Y4DvxbJvthpXkkkdyfK2/k9QUV/mZY3Q1bbFPBPtAjJGpO0tnJSKGLi
         FUr5XGkYWQ6ifL9c/w1EpUrvaMwFzM/ig3xoQDrVdaMEoJh1/Ldc9DYN5KBLgYQAinTo
         uC4hiKJTfi6oxgVi+WzJXmZoMgk3rs7AR0z9V50WVDwiDv2RBpn7RR+WqjjnZqAIfNrp
         giHg==
X-Forwarded-Encrypted: i=1; AKwUvBy9kXM+d/2JEVpTO+AVlQfW5/+qUn1sqCTR3jtk2mRmV8YGzoMjjgaddJ09Mkrj9W77UJtLYcUgDhbVMjE=@vger.kernel.org
X-Gm-Message-State: AFuF++kKYDrxCocI4+nNLEjKAg5FV5VRdtlwnrE/4riDRf6k741aX93g
	yiOUjovUB5rnJJLBTCaHOw04qqvh7MLf3Qoz7oqdxqGo4m5775m/e5UI7UAPAW3oQP0GlQkQHXM
	aa0+XFbGifV3ztBw61R2dWENX9IW9oaCtAa2MsQFdJYeY/gX51vz8CfBGH8Bjk5sSH/4=
X-Gm-Gg: AYBFou1qq630QO2W0uakKYybh+nkdHgHH+SSPkig3z/ilnxE8iYtitEbRGwcvg69gcp
	XcU2gHO45izCebZCS0ku4ie63sUd++CXcYYKdDng9MiLFE+pCPbDqQWngR6gAj6N9xrmMls+6M1
	iIqDnHcTkB1ME8WPfgIEG9cjPB9U853lQ5Uv1iBkaBcOyEP+nXeN8RLHsG3G2vS5B+32EfILsF/
	s5VIuscs25BJgm3id/pEiu4DSLBWMDRIH41ssXujoWayUogZk1ta8sMVWcFSgxRitjKdWi+t4/E
	kHVPiqvVoF7LB6c+ge4DDuiNI/qyR8rA3iC6X+7Siv7HLHs57s98rJlP7kyvnAjPV+5UkRHUYKQ
	qSXl+0vKH64Wa22eafFbx6A==
X-Received: by 2002:a05:620a:6f0c:b0:939:48e9:51a1 with SMTP id af79cd13be357-93ca956cb77mr153881585a.2.1790769213491;
        Wed, 30 Sep 2026 04:53:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6f0c:b0:939:48e9:51a1 with SMTP id af79cd13be357-93ca956cb77mr153877785a.2.1790769212834;
        Wed, 30 Sep 2026 04:53:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9e8csm746673a12.2.2026.09.30.04.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:53:32 -0700 (PDT)
Message-ID: <bff27892-eb57-4c94-9c47-d641e64461a5@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:53:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abcf83e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hDswOLquOSrkhpMzeLUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: bl3wnVW5SgDVKdYMHu2w9A-kU99GfHu2
X-Proofpoint-GUID: bl3wnVW5SgDVKdYMHu2w9A-kU99GfHu2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX4K/hrZ8xqFrp
 ri8uzK4OXfBjMi68lgWVYbxYCuXqRwevjr0u5O6BInkfpuxiKXI+6BhAsUIENIhkZLqn+/6YetY
 N4f5X6uKyxhzADjxpYMFPwCZYcuCQ0wfKQ4Q4nYRCgcxT5SBuAr+GSlts6ur03oG3gKckJwNETO
 WpZekDRsWhCWHcmfNqUQKVOWVTQQUd/g5lBDpW+p50YeBQV8qMrQwA1zi9sazQx2wta6w7BNtzk
 LGuvlqj39/jAjW8J8nHpCyqGYwL1/gjtfzAOfLN6tVx/lnJYzby6Apyf5ESpRiU0n5o9fsy4bQT
 0JPJgwu1b/rWyx1ToH5rfmT4oKLcjgLtwUtGHQLCeJwKwjWgR+8LohIeU+RI0iv8UAwaRdrkLzB
 DVXGqoF/xKkpCvMyG/tqTdrHvHzu3HtMkFxxlUyn/zhCnJN1wJmyQZ1aHy3iGOYNd5OHAFv4oAh
 dW4hmtMhjr5/2QS1EqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX+pWiKkp08KfD
 nA/fy6LOcHIhXM4gNSzafnLtIt+hx5G8rs1q+wvpOG58INRNcFR5HcKzNG8cF9y+cJFvbaYJmXm
 qi4r8y6iXYzt0UGxymy5cwu10uHdMNI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300047

On 9/25/26 10:46 AM, Srinivas Kandagatla wrote:
> Add support for the lpass audio clock controller found on Glymur based
> devices. This would allow lpass peripheral loader drivers to control the
> clocks and bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_reset_map lpass_audiocc_glymur_resets[] = {
> +	[LPASS_AUDIO_SWR_RX_CGCR] = { 0xa0, 1 },
> +	[LPASS_AUDIO_SWR_WSA1_CGCR] = { 0xb0, 1 },
> +	[LPASS_AUDIO_SWR_WSA2_CGCR] = { 0xd8, 1 },
> +	[LPASS_AUDIO_SWR_WSA3_CGCR] = { 0x300c, 1 },
> +	[LPASS_AUDIO_SWR_WSA4_CGCR] = { 0x301c, 1 },
> +};
> +
> +static const struct regmap_config lpass_audiocc_glymur_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.name = "lpass-audio-csr",
> +	.max_register = 0x1000,

^ needs a bump 

with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB442931F1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338650; cv=none; b=q5yAo9XkBJpkCa08YeP6uODhJMAJ4kKtJ8bhTLQj294G0MMqdBm8GVI4PCzqaU8BlPxoS+XZWXJ9XXkpca4g5VVI/rDkF6uLJzibpTtIlgMVoaoDvTXNP0bIAmow49FLcQk9DdKcb5sV1UNXE6HHDrTqZVIQtd1MYZGZeU1VN5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338650; c=relaxed/simple;
	bh=pOTg33rrGv0PWyC/4cqU59Cnn4egrKff2SvU8hNM1Gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSKluY6bjsac4FgxpObt4BcILIhHlo1w+yL2WF04li/o0tpeJh0ny94VNTNjMPJF6dYfzZwmFqMkix3NczUxq/7ajtgpaocmmz1ry0aAr4DmxJbHVA+R408wH6OI5gnMRizIJ9qds8CPs+w+NUyWleW0UHLVoAAkYhF5gOMeLB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fZlYqEs5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aiJOeB7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fZlYqEs5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aiJOeB7R"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JS2A3628345
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dvum8f/F249YZIo0q2vmJCMhfniVn8Gm1B/edD2cHpI=; b=fZlYqEs56Fkldity
	FfYQxfvmhoz5zHTvs9OMRfXABK5iLRBRWD45qK1pVAh7BzQ8sIGSrIt54jZkSHt4
	RjI494lWcsLYzcTyso4KhC+7xJCEOv3MqNglOMDlFiso/Ulqx61xVgWRaI0gsIMc
	3GXdAa6IQGoMo59pULdj5EjLvFhNBBTG85gqrHIsWDcbLbMTbklssDVYJw+pN7fV
	UtbMkeip6g3Me8ykv+5I4mFPRPIELWn3aBIY/SSdWbRcrl9ruxx5eR787gzrIvgT
	WpBr95EfDSL1gDdS4ROWLh3aLYU8EMV189Wn+5UoisAq1Tnqlv1LjWBXKzVGhRom
	AFf7RA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq399am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:17:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso7506585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790338647; x=1790943447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dvum8f/F249YZIo0q2vmJCMhfniVn8Gm1B/edD2cHpI=;
        b=aiJOeB7RrHKLd5Y0A2tvKjk5WNm4eRvEvg68y18ZszfEdFofcOOfWcz/FVJc1pT3xF
         H8M3yMuWuyjZp0S9Yws4/t00r6AuYDpAhstfTxxkfIKpd+B1j0eOhxCHdctshdewlaZP
         3VB1vlk0JhLdcNgjI/lVfkeavgG7d8vdPTSnwJ83uav8ZaZ/kQZcBueSQjnJNSbMvwHk
         LkcAEFG+/6jYZrB5VmMA2P5WY7xFpMDQGpUgbT02EuWusPywqcNKUYhpyvymYeTqRYCf
         LT/OO8PqYz/MsJDYvo6ZqbZulk89sXUGFhhnlb+mYsiK/9m59uGAorFd+wUNI0I4Mhdq
         jIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790338647; x=1790943447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dvum8f/F249YZIo0q2vmJCMhfniVn8Gm1B/edD2cHpI=;
        b=nyJTiulkBLKwDY6yxBwlHHrrzZtFdeG0VDJHC+7wUNHNX4DllrQ3ThlTWp7X6UZKHd
         QciNxKuUDIavpyzJA41bdLKA8OG7veCC4tNvicd6m6KQ95iwxcoSadgdGRtcvqNusg+a
         Hn60atYFZoMY6rK0t6IgHtfg2p5TBQ7DeMWnPYmL2E7/VTJXcw5kGB7iPO5P++hbx/yr
         Dc+ryaE9IUvLoTHx/FhgimruwJzg/qmKsLqLFs4gqHZIa0ksa+42EUNmicB/NdfG4QbA
         y/1jZ6kDrSMnBaJypcNLaDcVS1DH9OZCiJOqXbR2f/CvaMvZQM/8DzxhsUA5iqp82fzj
         /9wA==
X-Forwarded-Encrypted: i=1; AKwUvBxBdm4gbJGxCbfnPwDHYG+/7MqXbcEfYlJf7v7VUqA3yvaV0MnqXHimGd3gOaMlkQm48LUJglsZAXxSCQM=@vger.kernel.org
X-Gm-Message-State: AFuF++kcTVrqpJJZI3DkQK/09BymKy5g/ThFyJpmgonQZs/zr3ViDTRn
	dEp3luLU5yNtsfVXOuwFTvJiKWUYD04T5hqgQEQqPTH5Jfa+6gwx6VCg1ihfweSHgZcUu/UN4Da
	wbqVuzeTc6HoZoAiWRU9j051XcLR2iw7oziXssIaEWORk+MOI/A48zFk/GabCuuZEfSA=
X-Gm-Gg: AYBFou1rhhKcOp+dsOKI3alZ4MLERS2pOxlex89LAMMtSFMzeJXubpJTp5XeKV8pGNF
	uBQG8dFQHFtAp61DOExWtcn7K4WOOT763eSUou9BfzFvifYvrMlArUEFKTtqatLimBqcCEEZKnz
	dzQOVhnXEQjd6f8i1Z9587WD5DTfOzgPhtX+eEe5gHT64cuPsvFIuX0AajlmStVQ2e/Ahpl82Za
	xbGSqe+AIerywwfrMck3GCTbEkIYem/ZZBiF4IxGaiVddZ3NmU4ApLtCIPxHT83YzeXBRuAVgJ4
	Bp1RNIwblZyAJ98u/EtmSlbfDAsPRE6pWNXNipaUSWTITSLwQOHipBVUWANIVgt15ZZUfLJ1NSm
	d5hjQhdhG310zzX+gNJclxw==
X-Received: by 2002:a05:620a:370d:b0:93a:14c:329c with SMTP id af79cd13be357-93c43b93796mr401948985a.1.1790338647297;
        Fri, 25 Sep 2026 05:17:27 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:93a:14c:329c with SMTP id af79cd13be357-93c43b93796mr401945985a.1.1790338646907;
        Fri, 25 Sep 2026 05:17:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7357c17sm106318666b.13.2026.09.25.05.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:17:26 -0700 (PDT)
Message-ID: <f23837ee-340b-455c-b3ae-1ffff2b49237@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:17:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Fix GPLL enable register offset for Nord
 SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OCBTYWx0ZWRfX2sSaAsA+V0Au
 eKy5XTZZdsCvmj1RYGzbaUF2skuy0zoXH5PNBCyF/5mm3XU1eqB9hxdpTXLnQHy46QO3WRPRggC
 DrLf1/f7f/MAW9HpPERat0EmAjBE1BU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OCBTYWx0ZWRfX5/eJKuy8TBdy
 9HXVEz/irSPnKjZ9Q1sxAa8r8orpTXaMgbq0aDdcQCMR+/uxfbanSLnDQCE4ZXPmNA+Z213b51x
 tqRFyjC2+EEvtPu3LxCBgS0PLFfkcjMW9c73o+U+Hw1Jx5U5BUcT88gpTG1wspzRklxZndyrcZ5
 qH7cymm3G3wyEoKrfoPfv0rqpoal5M7GMcLYi9iEmanYhySyscnWsDj/kTw6ZO13GhAvBm/F/Ib
 gnamHHweFCMChkRQibu2JD57yucl1nSHCYHqkr9mNVTyXt2BuvSzEsG9JwihVTJZJ3IT4ZeZM7l
 sIkRH3RaryRJWP2cWMsZDgi6IAou/i3P/B4f4dh/9KBmc5i+98/FzD0KiAOeDOh2UE9oQTcWefE
 kQZKY8bvPCm+7c3ODLfZi4xqcE5qYPvgeDv+AjXry4envB9DDi0VstW2vfN5MXLzPhQsclCkSXW
 2+pe/Da77tlMAYfj7Uw==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab66657 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7o7Fz_jXMTEYJjNRgMcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: hgsxdGGRU8DJ_G5tK3oB6RvELOQVgsWU
X-Proofpoint-ORIG-GUID: hgsxdGGRU8DJ_G5tK3oB6RvELOQVgsWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250048

On 9/24/26 11:39 AM, Taniya Das wrote:
> The GPLLs in the North-East, North-West and South-East global clock
> controllers on the Qualcomm Nord SoC were registered with a placeholder
> enable register offset of 0x0. As a result the shared PLL voting register
> was never programmed, leaving the PLLs' enable state uncontrolled.
> 
> Point each GPLL at its actual GPLL_ENABLE register (0x57010 for the
> North-East and South-East controllers, 0x76008 for the North-West
> controller). Each PLL continues to select its own vote bit through
> enable_mask.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B623F4A49A5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048518; cv=none; b=DqKtvjdfoBT1dkrWsk1pABNdlpskX6SBTONp23JkYo95cIbUWFnCc8SQVWtaSm0enhMtT9WIHfW3V/3+St0FyeAo4vkFZ2FvLD+GEuAE++MNiB4kiI88SFyKD1VJyTTiba9WFBP2QCJg6cBPorgnio25KU8Vncxgemm+eAbp6t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048518; c=relaxed/simple;
	bh=mfOTURXkLHsUM2K+xfvN1AuN6AP8ZVFosHyF8KwfQ8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFdNSHCon/PcE5WRp0K0IErs8qVKb1YpycAXX/u1P4YxVCTXee9qv3KOw3VtT4PdylLTn3EPBeAySls8tdrQ2xs6J1oaWKjr11dcppp3KKrZPD4M7xUUN0Jmzy/ovp36bW1zhTxU2kYGutFW3IYicDbn7WQj3ggIOJvQgI8Zhh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hd7cS0W8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EF1xYKHs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hd7cS0W8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EF1xYKHs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F5xXUu500409
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5fiZu0AOBD5KzQVMVHnoqxelmroz5f5CORHmW4wi7g=; b=Hd7cS0W8Jl1T4G3W
	lIcILYHUthYwwNp+VnnsHgPvPOzdatwqQoxBL97dDpY1jgVW9T4AMHDUInX/948F
	QNKPhMrinCeS6Wo5YZSff7JWxGVgC3a4+HJmtzEdtYF10OTC8gsan+QOl1aUyGWa
	4Xxohs22R7tprpWhHlPWk8MCeDUzJu4Qa0P/KtFxydFbOd4W1Iy3Z3cJfL82zowZ
	hFjjQNlY53V13GBNZldvFsbdDrrLoETLWo4xWWzSZs9pZYOOVJu2Nd1va1xp4GBu
	Nu/uAb+R2L03pCkEQvT4YJXLboMuBdGmX/ZWDW0b69nwcr0xDu57hWA7fW0OS/6Q
	mX2uhg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf3qyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a8ae5154e7so6539576a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048502; x=1792653302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5fiZu0AOBD5KzQVMVHnoqxelmroz5f5CORHmW4wi7g=;
        b=EF1xYKHsFTdPceAWMGtL+ZR9KxCMTNHVEkvPESGt6tadU0ns4NJZGUinmYyVn5JVKf
         Vw7zU0TIV+xEak+5B0w2c2LFAKjKRNG3Gr2clSi5t+gi3vrfi6tue8QZxVkqNMU18yZM
         qBY/OA7dG47hVKombAb5ysSdX7d7NRB4pO/LU9Jc8Vxkb+WOhZ4W0c+s/taIui+ZYq96
         Q++LroRBGutMLnvCFx8xe4BbCY010qzC5zIzyyfnd0e7sjzb4VarU+jwZ10iBu2Rw+d6
         8tr/oiYVGpvFQ71FuoxMJNfSfswBHy8KRzTMFQKgFM7H/eEHsDG+ffgurMVCNsJED4Qi
         eA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048502; x=1792653302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5fiZu0AOBD5KzQVMVHnoqxelmroz5f5CORHmW4wi7g=;
        b=A/Di00TBGR8PW8tsml/Ir4Y45A8MB+7zUlVi0+5nYZVes9nWYgf81IdCDSjoTyRNIQ
         e1nIIqWZ6bSsHKQkQjcoRhkvP5IRGeoAhtv1hkjiu01YXuJzoz0PBtEKJ1uObW3ZPjm8
         YElyVgnt15OaM12OMxOtwAXFPUhqQfPCrX0N7hoqA8xrwPQjnaLZ+L6LXRwhfIsIRohY
         Ov2Ayzny0QpgYe4e2u3+ma5fUjmIbJSP8CJ8lO/GAm2jgaLJVo4RI6V9TSqg9t1k2FKJ
         HRnW297fszR5PRR1Tmghv/JoSwU++XMDYxYdcKu5CmZnAftyHYoxEcL1Zjy1v5OkWZSK
         caKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwV/KD81X3sCFI4weDdwuIZ6rBWtN2+kzfZJEkhZsUxYAJLRYgyTJZbxnIDsRxS74+3fEl3f4Z5HasdwP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEe3DPLkJt/kvKm85CIit1cGlBy0fPhoQeK/wzQX2SqlQaQdpQ
	KC0WfB9iPWflJ7n+MTdu5iKifnr8i7opyV2wAgj2wXrafQrL3Ee7dRyLkSaKq2tUZNhuRCIMgUj
	O5Nyar5RODrUR/PlfkIupuRz/RXaB3x4kF9pqtw4DYfxBsR8QfVqV0ebw4epywrrHWok=
X-Gm-Gg: AYBFou1YHGaK2hYy/QxkjE7qWWAGzIgsOim53UxSUoQDWwjHZOGbBkOfbMxNZmE2jiZ
	XNCumVIC8XbOUHLheHf7jO7v1nxZw28VdeCgTjAP7o+jN4k2FOPGa8GsCnP/ul8MepfsD1ONug0
	fzr/VjefF5+9Ea3YCrzJtA1wv/9Z/QAusJCTS5+318dxKH0vFf9o6LhalFqcbsmTZXro6ZQcofO
	1WitP3dX2YZHlcw712JT8rDR2WW/sfRmKi30CF1w576SMxaDwjPZHZcek3X7CPeUO2OGm9KY/d4
	VPQnjE5oRCzyKAx2rGwiFtYpLTcN14AoTghYThonZcJzBfRZE8x+RzLBKMS/ETqa1GaxSovvSE1
	TQ982Dl+CBrhivggXpr+b7+shl5A=
X-Received: by 2002:a17:90b:1d4f:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3ab3a94ff23mr14061605a91.18.1792048502042;
        Thu, 15 Oct 2026 00:15:02 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4f:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3ab3a94ff23mr14061583a91.18.1792048501560;
        Thu, 15 Oct 2026 00:15:01 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3221300a91.10.2026.10.15.00.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:15:00 -0700 (PDT)
Message-ID: <edb0c405-e0f4-4d17-9948-5cd1703d0c44@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:44:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add gp_mn pin state for GP M/N
 clock output
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
 <f6fc66d2-b40c-48a3-9dc9-bae849353e74@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <f6fc66d2-b40c-48a3-9dc9-bae849353e74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX9zJ/UD+kR8VL
 bmG90A629uU7rbljaYXx02zLmlDLhckPic3J35dIVYMzu3NquPN+35LZW8aeKTRAF2EvG65A4ir
 IpMKBC+2byNbkhTyMG/Rm82UXy8nExVhTWcCT06E6viiuYgFecTUgzkmPj2uSYIf7hjCsUrSP1D
 0/5cLjQdj77zx8p955CdaV+JChta4daOMjHlDNrBGm7CkytoyPNip6f5sVeJtw8xIT92nmCseDn
 VvsSfwA2NeCqDqnNHC54ga64UoqTnP49aS8vSzGnfrR1i8y0qmb1IAsoM4IMo0c5gYnexzRPjJK
 n4Xe1daSp2tUdb6OLY5XWoXan5msI6E7sRpkcnIdF/mQKUrjp5TKOhTm8Kw+lUwrChd8Xj4Jd/9
 zzvkPxKGpe9MjqI13WrKdXAUjiE6HFClUAewBwVUopfTQfmpEGgqWninQxnimPfZtmisaW+1uxp
 Rie+qx2MnlxUtJ+/kGw==
X-Proofpoint-GUID: 1FHpkjgd5haecTqJ9OTw5U3nCYQGN55h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX+taFriVbSFnm
 CmOWVHF9C5CP4jlZscNbyyRWCkgV2l3SLgWGzuZsab5XVe6Zl1ri2z66oyvlpD1CuVwOcqLuMLq
 tKAy+0anVfS4gwTchcPRPYRPXpwkW4Y=
X-Proofpoint-ORIG-GUID: 1FHpkjgd5haecTqJ9OTw5U3nCYQGN55h
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad07d76 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CaCc2b9mPIm3Huh5NNcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150028



On 6/9/2026 6:58 PM, Konrad Dybcio wrote:
> On 6/2/26 5:21 PM, Taniya Das wrote:
>> Add pinctrl states for the GP M/N divider clock output pin across
>> multiple Qualcomm SoCs:
>>
>>   wire it to the GP M/N clock controller node via pinctrl-0.
>> - kodiak (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
>> - lemans (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
>> - monaco (qcs8300): Add gp_mn_active state on gpio32 (gp_mn function).
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> Please squash the pinctrl addition and clock controller node addition
> patches together (single logical change), and separate them per-platform


Sure Konrad, will take care.


-- 
Thanks,
Taniya Das


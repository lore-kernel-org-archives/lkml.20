Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660536;
	b=QPKV+F9Hq7A2N88iRiJ1WT2C4783XuUZVa9kenVx/gyNybb9oV7UNDNVqMln/Qs1ZMHI
	 o86lordSNaYrSZT7L++8//t3C/HS/bFedF32QcqPY18QICIc/xKS3eEDUevQoij3N9aL0
	 2dWuLJ/amFfralf8Gk9WzIC73PzjjDEcoBI5R8ChT09+rgaWLpS3XZ5GYGLzGp+cJD7S0
	 V+nwOw059iuf1KYM6WAcSOqkRfJGyuKMDZ1HjFwRtVODcVauklftRx5Zn4qPdYaxq0SMu
	 lQZc13gOkVohBqkrrz6SPlADTYLX2uLEJolkZWg7ALFOa4874zIUSNcwB/5Tf2JPhHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iGfmhnUO89/XXIIG4QfdwzlkeyF16djjoRswU6IDmwg=;
	b=RVRW+YRLVpqUAFF0PSvbuqaBKnflhlkLPx7vD9VbLP2TYTGtA0xYqNAhk10TLQ7l6Hjf
	 zBHvA5dZeUIET32M7wxJM9sOa2+QU5dX5Fsl3REMZMScvplS6xl3Jt+PRj+njdZWeOGWr
	 J/B63vJyZJoUATsLQL7uBWdT1g1manq1jzpk9DOSsao/nRijEwJ3WdmyOp6ID3cANexpN
	 EHkJNdYOJlt+1jrz6922wFc45DcMKW2ZJ0WRWjwSovvNmXibKkUi6urcDj/L5ujP+uwrY
	 0TBnn0ssbMmYArTvhz9FwbAUXUdJ0/wa04bcnLZzP0/SHy4ypaZ0qfGqRdHlLSYUcIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQic+qDc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gyCUDJVG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16066606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16066606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQic+qDc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gyCUDJVG
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M707Sb4136664
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iGfmhnUO89/XXIIG4QfdwzlkeyF16djjoRswU6IDmwg=; b=SQic+qDcVSYCx/+t
	H4gIKSaUSwd5A9iKu66KtqA7hSgYZfs1XePZDC97brugiYunwOlFmceQ/UBeiFr5
	h1o8sFdbOEt1p04wMJDV+p+UJTSpuB4zHV94+gk8Ypjw5l4GGU3aSG6AX06x+Bha
	59lNHVCmJso+Mv760ima5l3Jrz/K3vkO3tEoy4HNdjxqEZHb9UBYRQol6i89Xc7s
	oQB0d+pz0F6ws962Gw1aJ/VewQO+fOvXg5ufDNEUG5/yadOuqpdcpUOa10PmbgUs
	o3pCAlJfAbVShV8snznUPUdwibtUDFqc3RkjDjxgo920JSpuHA3DPpfDe8uTbBJX
	lvfK9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93d9n3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:15:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e58614290so36067785a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660534; x=1793265334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGfmhnUO89/XXIIG4QfdwzlkeyF16djjoRswU6IDmwg=;
        b=gyCUDJVGzTt1DZJsR/OWyvRBaNCp6hV32/AZ+DevdZx7B8yE2A06QaDeoT9kY0mUER
         m+r0qpN80hcpPSZNSdR5N7w71vAuPdrmEh5NiLxwMWTbu9Df3byfpqQIe/i4OlRUsl8o
         sFKBKVIyRjllbsiZXQ4R/Slim1STw1s9O3Xjg/mDGv3cTf0IjgLlnszjJbGuhsTdnGtA
         Pl7g412gZyQA5cMr8cr+IsEeRsFds8wKMbB4emwIsKCOkXomL14quRZenoOAJzewHGg7
         LhN2hLNUgnVQKhRqrrfckQxVqhzGPI+NdEneJJj8j6Gu6QQWRQDJDsV/k+qgVmRG7IGK
         s6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660534; x=1793265334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGfmhnUO89/XXIIG4QfdwzlkeyF16djjoRswU6IDmwg=;
        b=p+Un8jq9ylzdW+23BS7DuV7tn7R09vou1RUAyDRssbiU1G9xLMQRh3dwN6Bi3j0+Pz
         qxLMBJ4YijScsS2vD924z/gUXi96RENP5QSQhCtK7K3j4MtvWk8lSFKtFrDTEUpI7rUX
         0cnRLRjw3lExJbOcjgbKLxqzTsE8YsaaS7exTHvdXeb9k6oOVNkTeUNT9loptImm2whk
         OTSJa3hkKI4YnwMn+7jUzcibVmn5dqElMRBYF5EyFkRTr3YwVs61aZuJQ2PYa42ThM0R
         QK5Gqk4YdJNIv34u/OpSd7llgw+MivOOrgkzeosxPMmHBVCrMT1Z9zWOKHeI7wjltvvY
         G5Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxHl9MhD6PUw1DadNum/+2ZzVasfY+Wmbd9zGMxlCgpIZRilHfL00L0j6gcwEL6fRT2lZbbt1YOPH4W8Oo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcyx7RnU5H3bJLNi87RVhctgdzmyB6ZJ6grNxD0rp5FlWAQsaj
	jWg0zDYVKbtogCQemD/1Q2g34RT0PUhGGvZ+9dmam2okNgvbSizv/kDgSKNqGjbse9PVzGz+mWT
	axArTBxLGPnnBBeqVy4s2vXI8VHHO1o3aI4F7pzqi6DVqIXA9u+WqzKOX+oPlMQn+mn8=
X-Gm-Gg: AYBFou1V/ANJkN6w+s8RBbPMT5DhBOkG7+v3lI3OrioxoWc669rRj6GxxF6a873CaLh
	KzahAgoIla48etx+9fTMMq5qGum7y4CgnlweyTJjZOvv+sY7Vazy9Obzux5niZFHQXHQ5Dzo9t8
	csXSO7a4YOPo97D5iKjS5jGucsJVoO7NhiVO+JGmJwBitKCQnVMbLFCi9dTIB0NUt3w3F3o22zH
	dfiPEWyUMVTP/bPYEnSQusuX8O3sxfwg065V96/y+YbH6f2u25GWZ3Q9gP1E92VIPIjUNosMY3z
	nis3+jjErM78ltwRj8dQHnOZLBOwmJIENSdk9D2GIIplbjKYeGZT9Ktf1KQDmJjHGNkIma9FWEV
	/xE3JkzolOQLBlUuWcPXAIA==
X-Received: by 2002:a05:620a:2852:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f57fd982amr988228885a.5.1792660534430;
        Thu, 22 Oct 2026 02:15:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2852:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f57fd982amr988225985a.5.1792660533992;
        Thu, 22 Oct 2026 02:15:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a6182e8sm82796766b.81.2026.10.22.02.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:15:33 -0700 (PDT)
Message-ID: <560a1b2b-d7b5-4c7e-871c-f98d06cf088e@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:15:29 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: eliza: Add CQS SoM UFS variant
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
 <20260928-dts-qcom-eliza-add-ufs-variant-v3-4-9a2fdbf6baf2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-4-9a2fdbf6baf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXwgyGu8aawUJj
 ncOM4O7wOPf+lMeWoVQNWPzCRTfICbU0JPZF1GGTTGNPGGCEWOrmiz3Aa+wHD0LuacqbC7o1i1f
 1J3rLeVQW8Io+SpcCgDNAluIDKXd5tY=
X-Proofpoint-ORIG-GUID: DhHZiVei1khn_sj1-FRASpBdbiJgqxdy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX/daxe6MJU5Sh
 5PClq0PitS2wOYdPJAaplN+b558vsIDrir75INOgxq8vnNl4yyY4HxLlrLOD5NZc9MOFVl+ix9E
 ze0HV8boNzoEjZf01++Qd4yKzOFAUm3MHyCIa33LLAZ+r/ZKTkQKI75E9oDEWY1S0J/xnvRBbI2
 08vHyGXMKwRlFCxNXF2puZltDRWdCoarl2/3lQAvVNdLfY/ud31kJLRze3G2moYyebYCV1Z7/7h
 e2pTzPHAhFOVDDINqqyYMfvNhRuHLSQBMMsrl3mgQfeIO+YTfyoFMSq0xxhsaLqe28DmuZ8LHDT
 uHX8dUZYRfPmT/qbjg3L4lAhJEn8YsBMsnDBX31qUMfJus//w0PN5zvDVQJXlm4IsT+lnevBCSv
 cb2Zbf8VMcu3eWyGiPyG4nltGGhmHK7PdaNXR+I81PXW3fFLCq0dlX9l+H7GyRHoarWNBya31Ub
 4/Z0ZKRvsaBFS5ctD9w==
X-Proofpoint-GUID: DhHZiVei1khn_sj1-FRASpBdbiJgqxdy
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9d437 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=w59uCl-My_tAlYnkv8MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 9/28/26 6:36 PM, Abel Vesa wrote:
> The UFS-equipped Eliza CQS SoM is not described by the existing eMMC
> variant. Its storage uses the UFS controller and PHY instead of SDHCI,
> and the vreg_l1d supply needs a 1.14-1.26 V constraint instead of 1.8 V.
> These differences are on the SoM; both variants use the same EVK carrier.
> 
> Describe the UFS controller, PHY supplies and reset GPIO in a dedicated
> SoM include, along with the variant-specific vreg_l1d voltage constraint.
> Include eliza-cqs-som.dtsi for the shared hardware so neither storage
> variant duplicates it or inherits the other's storage configuration.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

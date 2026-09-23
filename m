Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742AE5326D2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169830; cv=none; b=T/KS3yS7VEvD7M1rrApv6z+XkW5xu9k10qpRrvY/RoqyaSK7JRqkMcsQ8TBhJo7643Ki4I1pdIsfL/T2ws9Aaes5LKluBoXv+16yaOWZnKZyXdlHZrgOtKDj4IzB3yuRrXo3Dc2wmpkKCFwTOzlMGo67mkLcR1BuiHs/eMSkKhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169830; c=relaxed/simple;
	bh=vrbjCTtsJyzwtHuyaf91WcAhXyYix8svgAK1qoMzsKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwx6hQNk44NwOT5RXr9gEuqaBoeDMIvGPyeC+64gtUf0jg1BtUURKKUSH4k0B+Gue+KCK8gj2E622fZreZUQj8T0KQUpk5a0ZyaRSlez/IL7+VHg15+g3ety3dphBCYUbO8JUZM0JOGyOY+1M74aeNgyaY0W8SK9+oqIS+AQvN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJ/GfdNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFzUniUa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJ/GfdNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFzUniUa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKwEP2056502
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ui/R75E8kUWbSRcH6Jr3UdntL2soM1PcUyFJ6Wtu9YY=; b=SJ/GfdNvpBe4wTkT
	S1mXf1SgvWRVx7plQgwMrWgIYlNvgoqCHBexV3CFDcics1ykZdqJp4GWOnIufIAu
	xzAllA8gYDUM26ua3NS2ayqtDWF3cHqXmNUoqbpjFP4fp5IAgFFo1+Y3UeyWQv+n
	HxA85LZLFSuojbNHlqKvUh7v9bvcD7sMG0WavXFhIKX5jKqgBhko+uZ9Y+Pf0JKH
	i4b+uPFGeWhBqT3QnKYqBWCxm6lWNVTJ9p91WjDICDILVUkGBpg1NoOW8d/b6psm
	a3WkcNZ7KP0o53mPbD+LQ33XoRoiFxSpzQn1SPsRB6/JzUbfKsgfjuRWCEANVgGg
	JtJY4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv00b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:23:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530cd3dff25so1447611cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790169825; x=1790774625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ui/R75E8kUWbSRcH6Jr3UdntL2soM1PcUyFJ6Wtu9YY=;
        b=KFzUniUaOQLhI/TMpgnijlKixE6TW0Mt7UrnrYubGwTP4oqT9HNB30mzlWp7QpsfWU
         l1G6mIW5K73tSFPNPRt6CkubtO0KmNH+SHBXp7446MVLnr4ZNUVJbuo4W1f9QknS4ulr
         w6nnEf2k3BKu+t3MMfYbRbPZHI2B9zFuhcn11HkcVm7qRDwTF2IGN1R2WcJS4iySfweB
         qhbmSrQ4M6BLpP3Uc+tAGEVf4h7yZwhMSXgpfHEabyP4Nle7WXR7t00HHiFYpppvn044
         0f5BpGCCqsoLkpu0srADWQ/IQc8haRlrBgLAcpJk00Mh15A1NrF2l4EWSumC1we+xrhA
         vRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169825; x=1790774625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ui/R75E8kUWbSRcH6Jr3UdntL2soM1PcUyFJ6Wtu9YY=;
        b=1m2rMBywz4VsSodQxkRd8AWq9NqLtzarl9Zo8LiUJZBaehlctt75rGtWilXmhqFoj0
         7oWVfXl4WEkn6GMDuuCxmA5d/JfHJA5xh/QyA1Mq++p+CC1MFPMLnxwrbggy8rX8pQ6O
         7PpFN+jKpIBfZK+cEJhwQUMV/YVDGR60drEwpvynQGp5uV+SfzaLWSc9O5IL4Asma//n
         udhXDORyqzjZ5CkzMfybz9nvRu7qwmr0u8R6I2a8khLdM/NJgxjy1zNHc/W3MwXn9Qnu
         aasMReICKunhZXdtd/Ibn8TpJWxpJe0akNT7LJWD0NGNxEdUSXAZv3fYd26eYk5U4Kbt
         qoXw==
X-Forwarded-Encrypted: i=1; AKwUvBzpqw+fyg93eLgB7JQ+oCXOfr4N4RJGsHDdNxoYss6vEoeHcCc6ocnW7QViNnc0HsnTGdaKSaAixfc8WCE=@vger.kernel.org
X-Gm-Message-State: AFuF++mapgLJHYYS9ZyLseA7uuN6inS3cXAR9LlgtDXlSr/SDxBKAcz5
	O+lU3xn3tOXp8n+fDNasfTUOnxRew8Z4IDc53R54XO8wpBtIyMyJETQ8TjIEBXgeUMHpGR6FT/n
	+QtNaz880O9C/Cg+pQeFIEGRIB2S+sPdOr0FKIsVsq2rfzHhdPbirikW4Ype8+m1ul48=
X-Gm-Gg: AYBFou3I6s4R1FRdvYQKfjItEI1LW/ZpodiTN4xQwdhLrA+7UnHQnnnIj4rrkY4T67R
	fdjDrbU5V7TNVBhwLJbCDLB6jA61R6TkcpFsBiYG+KzdZXL7hm5BHPfBiSXV+CDqWkPTZC4k2BD
	TZHvvbGZIWwNjGqHjfjlTaWFkaNXzC/K+iZTWNSiTy4rvZJKlcgeTKXI56CHSAtGE4NBkIlfPnM
	c41nHbE4WOZPB0oLyhq7+x8afuX5kbWdS/3FJbGffG0C7KuUrJfqSlYzm278y30rNn4J3mG+Y2z
	IGs4Krs4pj+MhK/lqOR7oBT+d1BLv6qXX61qgGW2uB0ehqTk0WHgLbdd6c3Pd5NvagipC1ETSep
	IToqESQFlIpVR5UoBcGsTVQ==
X-Received: by 2002:a05:622a:60b:b0:52e:3991:84c8 with SMTP id d75a77b69052e-532eacc093bmr44926541cf.2.1790169824670;
        Wed, 23 Sep 2026 06:23:44 -0700 (PDT)
X-Received: by 2002:a05:622a:60b:b0:52e:3991:84c8 with SMTP id d75a77b69052e-532eacc093bmr44926131cf.2.1790169824160;
        Wed, 23 Sep 2026 06:23:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f5139e2sm7037091fa.26.2026.09.23.06.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:23:43 -0700 (PDT)
Message-ID: <a41366e9-2bd7-4a5c-bbc6-e5cc28acca0d@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:23:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] clk: qcom: Add support for camera clock controller
 on Maili
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
 <20260921-maili_camcc-v3-2-2f8d739ac2d4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-maili_camcc-v3-2-2f8d739ac2d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfX6rGabmZpr3Dw
 6UzyYZ/Rzyo9wzVv0PlSO59EBdJ2yINLaMy2+r9+kF/7xZjr08RWXTwVFMH/KyI8xVAaHb3UQhw
 XlgXaCqI+iLe3Y9jnJoHokrUHgfahuJ+LsCNmnWfyqItOAmnE52ak4FvjZFQPjM0zuzOOqn6Sg8
 PvcAJjxX+RbSHN8ZR3G/RS7/tPnKd4hpWSY1CbzBoYe1U6hxEcEqS+Wy2P9y+rzdzXlXpZzxzl2
 uQUEGq4kmObUbp3pFK1pI+REn4DiQvZqII9cZRgTe+ui0vsHsUe9ihb9/IKIBn/LnIXI3M/cPOU
 uUQifOFfN5bMKpDoSVKLdlLv/k/dIJeteMy0evr1Rr/+xXcj5HYEOtbK7n6DHON4gxJU1pZC0cA
 b2Yun7ZtID4Ytg+UInlHh81z1nFBhPcWRzeZeNk/QQNaEbDthSKeadVs8x8F5R0en7YsiqfmNfj
 eBQNXaoB3gNJfTJbvGw==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab3d2e1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3jvcJnBrcLkHgcWL8XUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ndl3rkWraVN8_15F7i2MJ6vYiXbpFw84
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfX5UwSHVIXWFca
 NqzyJntQu2UEtSX35clnY8QN53Lsx44Y5hKvpz/8k8slqxHje1IFLwVPryKArJY5IoOAnxVRso0
 c29apBuZHc4HeFXhjbPvvECeo6FlYLE=
X-Proofpoint-ORIG-GUID: ndl3rkWraVN8_15F7i2MJ6vYiXbpFw84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230053

On 9/21/26 6:40 PM, Jagadeesh Kona wrote:
> Maili camcc is mostly identical to Hawi camcc, with a few clocks
> removed, frequency table updates for a few other clocks, and PLL
> configuration changes. Hence, reuse the Hawi camera clock controller
> driver and extend it for the Qualcomm Maili SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

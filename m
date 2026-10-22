Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659719;
	b=P32QrtDeUK+XigLitJve+VyJUWc3VjWU8L3f77CwTpuwTLaU58zuiF3DzJYbickrLxLC
	 n2J5lNSsKW/2aTkI+v6BXH/Em4G+nXV1LqtnJshVzFioP5dJzbNwifZFfejNpp7uRmIhT
	 6iW9A8YGzli8Q2YZw4liVLGRCFc6xjFcTTI2P4ZWQ8qFkCsO5LDvS7hJ+iuWdJvhocCjg
	 Al51oiOtXUNv/GZMIMhmblkDKNxS/DFKlO4MclaK8RWKeOzar21Hcc3ltqtnnDEC8owMj
	 rJGlwodPACSuNSO03JAuxrE0aMn/873T7G22i2ESiAVWDHts9OVpUNsj0DXz0AALL5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=;
	b=NtbwI2AxrOsziVypL7ZdK5tkNrLCMvuJq550a6bLecqeTo1jRLso+AFxtTNtxBkzvMsi
	 7aDCPfobTXNo5d9qiE2/1qoxKKvf6M1bxO4RSYD2YINg3PZ4BdFHtyu8hR1UYny7te/qS
	 wQ9v7ZqFkV+NEuC1H+TvB2ZSBYfstqrNv41E7s+yWQE4Xu5GZQlZaeXwAhihMaTaAcu7g
	 QATrJCgr/MS0xC/vkly0viKU+ljrKOBavibKV5uBw4uYd8xlSwjKLqHTqJuG+qbgl0km9
	 1l9HPUJIgRp3XGNNcEG16ixBXCxpbYHEiOJH7WFvWDgjgmHlyPfZAg2WPwqTt7wqmuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMPoQa2g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LEjBTUs4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CC2606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53CC2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMPoQa2g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LEjBTUs4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70EFM2516128
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=; b=HMPoQa2guFdKcKJ2
	G8GejBQwAZfoxwjD6s+wDvWlEfmNChBNdsPgLiuINwK0Wm4CJsw2J6NCpLBrF4H3
	XXHfLsVJE+tYVq/P6iUmb2Qat9w7VzhIQ6hcfX472BSG1JJ/BLa+BglC/NHOS7+u
	O1APBbyb9DhHGCfilCdjyzc5s8SFX/FrcXbPKBK2k6inoeoYglLc/mfaF4Ac+EmJ
	R9YUGCjvL2/ZTjlKxVRVQlkAuiTdiI/L6EC4X7V9p4vTbhIOPp1COojbYdOPqIbj
	zuk+Nb97SgbKOEVNmqLkVT4NBH4kcw6dtADDSgUjs2JSwgPGMt7q3oEqVAHuNy2h
	6c1UNg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9kjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:01:57 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc2d6292b5so16667137.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659716; x=1793264516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=;
        b=LEjBTUs4gSLMnZVa7pKvd0iDicVuN4kXD2/hXkx5YUYWPL7yhjkXTZ3fdFu6GdUKCm
         xh0L/MC2RIYobQ4ehnwBWxgMdWgpfu0H1NS663dotUnpfkeB4tYvbgxCX1JEuOK/8FvM
         JrQaqnI1DdnVK3C+Mjfw1onHsH51MyazQuezxcOA63OZ0DedzhQd/j8W0ivR7L4wA0DO
         wr15OYnx5ZSq3a8D9+x2UwSgLJ2fl7WZP0jP4EmiQYSuI/gZ2sKMir34sP9+nhuTd7b7
         Jt1FIAG4PNidBdYrh6mtNs+D3LqBSLdIR9QHuFf0R3NFlRwWqQ7WQ8I0ydEWol9KUqI+
         V/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659716; x=1793264516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=;
        b=yXGevp9OWCtkwO8FmFpI/l9CXzNYg9nP/3KzsML94ElnNU+NJIZEJmFDkeudeRIi2x
         OA6aksZRPqZ2/PNc7KHjbLjzm5hduU9N1aeNna6fecOLDPIyVKA2LmVSuHXPOZHtWtiJ
         pF6HbVguBKTJEMpHvgYHeYFAU66Chh2LMhVopmr+yl8NKWTOZmx0num2pP1lhi4Sal1v
         a4Qi7VHx0OFWt/C0Yee65F0AaOor60L2fSWaoGQb0aLsl+WcDB4DR2wud9oS/V1Rs6sh
         NR5ClGUh5WmleERjgPd/s1KYole29QBRhbAQz3PNG2cd2FltwpWrdnFs02tKeFMzSN1U
         ssfA==
X-Forwarded-Encrypted: i=1; AKwUvByu2NMOh+Kwpsxx31lDdEoEqndGE1oxluiY1ppQFTEXmM8tzreVjHXl+p3Tl3uc2loRPA61u7MHxQ7DMrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8VuQrV2rim4QWZrhx6UjoDBQ41TbO+NiRLDr1A6P3dDOv3gA8
	P2SypyIIeSRzonftybqoSvmQU15eRUY5VmRrJA7IkdE+06fU3sgTziokUGzC7tcWahlLts2nboT
	neCgFavpsDRWwTZbUmf+XlHGAbawvnaZlCZr7l4yppA/6Aa4QAz6iCVYI2vS8TAveQzM=
X-Gm-Gg: AYBFou3p0X5Ic0so+sbY3DHe091jCkKf7LYHwCC1TnYtlf6wFVB/yMVd3kGST1eGl0B
	5u7acI8EF8opSLTLM77Yrj8IVPVRTgw+YedDhOEXF55+ZZoGGwxQzRP5DpOjof8sMEjjB09Mm5f
	2UNjsdxjesoAR4ie5mCpjUYmGV1CXypVAjlPJcc6GF2h/l1bh0XnwPE8/TzDfevEtb+KxEx7ITy
	80tvBt0/ls8Jr3q7jzwgilhry3xYTDbiUAitdTOWSFjP8f0eQR3HKCzlR+Ae8CgFxcUSd5FYO+f
	0Av79Rcr4AoJ02h3k00MQJWe28n0wldYtBih2fXbaOwBUZwXI1YpL6yHx+e6tQV98wgl0u1DfYz
	t1rGd9o7r3COOZCmRQMj0Sw==
X-Received: by 2002:a05:6102:2d04:b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7cc926699a3mr1620654137.3.1792659716412;
        Thu, 22 Oct 2026 02:01:56 -0700 (PDT)
X-Received: by 2002:a05:6102:2d04:b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7cc926699a3mr1620635137.3.1792659715973;
        Thu, 22 Oct 2026 02:01:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c001sm82124366b.31.2026.10.22.02.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:01:55 -0700 (PDT)
Message-ID: <8750ffa0-33bc-48c3-b136-fd3aa4d75743@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:01:51 +0200
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
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: kaanapali: add iris video node
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
 <20261001-kaanapali-iris-v4-5-642f9ac5e699@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-5-642f9ac5e699@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9d105 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fK-bvxQjctYCA93nC4kA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 4MDlrjFWA3JDrPZxFXGtpV8lkPsingfH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX2bGNF+kQqZVL
 61QF6AXbCN0vxv5Km/uerwwbnO2lDeYMLL+imGLmlbPP2vSADFckvBUCAG0fNZLeRePuRWR9Xzk
 vOB/16+esjck4+VQTmJZvxBPajuUDEA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX+7LpbrA+ECFd
 tkTmhA0W/HuBrbuR7fcquEo98K5/OBTbeaDvbQ4ooXB4QbrY9kd8SbrhnNE4n8sHi9165EXksdS
 Vnubeqbh4GYbyMMVZ3gjwgz/RVsuz85R3R2pc41u5NNdKqpUEkmSpX9LKL4dMinxLFUW/o0mBnX
 wdgnaqYHzRabqmjTr8KtSZXK3YtuuYAEfnB9JKd7aqCR0+evq7S8quCgEsIKyF2glF4SenhvNqG
 ObCBLVbj8pLuXc9e8iD3705wMPuGr6X15ChaY0w5WL5Le8+Ktvj12qTPslgZssM+Vpmb97hy2or
 DxsOVOCJlNrjuVoMK+L1EbPLAv5UY5TFt3uVVT3o51pJ7zP8nsxLez9isKoXWUp/0AtW7FxGCfH
 22Tl/xywf8uTDOITT6ZmdoHvFS0oQQ/O9OZQ88A8vZUv/HsQBSKeRl01NZNQ8itaSp1vvuAXl7J
 T0o3SXEs5AnSVSY6xtA==
X-Proofpoint-GUID: 4MDlrjFWA3JDrPZxFXGtpV8lkPsingfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220035

On 10/1/26 5:17 PM, Vikash Garodia wrote:
> Add iris video codec to kaanapali SoC, which comes with significantly
> different powering up sequence than previous iris generation, thus
> different clocks, power domains and resets.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

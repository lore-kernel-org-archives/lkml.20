Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758656;
	b=eYWrXcMSsDP532bN7VsPAXJkWIcUpMcqCuq1fwtSaPTZc81xEojhKpgeAxdbz+scuhdn
	 /OULxdLwkqBDL0hJykxKUb/FFbnqTzfF3cKH+aNA5HxsKNsXP2LcxAT4eFrgpbX/uP8u4
	 SwTiUBkZra1Pfwvmx6FmJGgRfZm0SIYCUPs553GeOKHa1pMcFr2MCCIbXqGkoR9IWOW/u
	 zCetTEsVgLbIS7FdIr4QHKpAyXpIrKtvrgqTzFmL1uNvCkRCimsY8ZJ4k0y/m4OkNn/kL
	 Twuvl5mSKyceu4Cvmkm1Ipw0DbFtESG6MWhH1epZm/RN+XzpTSe9Cvf+3Km/wuoQgkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eJerYATXc5Ofmp19lEAv8MyKqAGNtX5c18EGoX1GCog=;
	b=R5/fnU1rBjieBzT7qMfA62oqAsh8qevhN0zby2QOgT7SsocW4PRP/jMmiL73cH9gCkDR
	 UmUzfRyAw3VqjJh0swgIHztPG4ew0/BPEfrGJJ8WAFZ8xvlMLlsXEIoC5ne8fjR/5HoD8
	 3F8Xzh8kbUW3j0fiFxi+YifzA5J807kLtiabegnNTGQo6/A8Z/kZrpihIbiNbjAPxzOz4
	 PjaEmxI2w0J38+NDFdOCf5gHfs+HhWq0OPSZKMRHAF16lypthpDWYbeBzGMXnyOMI123s
	 JS1+nEMNzuAgQ9ZgZM4uFhslAOH0WeY+udyK5AyV5MI1sF55PkreEv0CjoBBHKdwpMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7ZDfs5B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KiSSZ2nU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE432606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE432606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7ZDfs5B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KiSSZ2nU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAYI62965983
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJerYATXc5Ofmp19lEAv8MyKqAGNtX5c18EGoX1GCog=; b=n7ZDfs5BA9A8bQpY
	E1H2S/nbo2cvfF169cWF65Aol1lDcXjjU5WExuNarNWGPsT3JlaYWJ8dWgr7aGM9
	OLYZ6m58ai5BJEuRH6jVzggtVa9rEJcGnh2OQB0wlKUi0VQTkYOjyOl2lqixbDyW
	NVWte2fq9us5Ri9hYX4Sat0Pz6IrHel/OZ6uIuHxtnmEi5D4ubyOHss09NEQF/Sn
	Y+04LVcwpil4NHqnuIXSUHqjRMk0Gp/ImrIpWYQXhGohcYACfPP7EZYaa2cTzbId
	ktJUF/3ePHtvRqCUVzcf7FlgvB/VVlT2SKAj1As2OnMJLm7cyB1WSPCAa6c9/f+o
	vlTt1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0m5jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:30:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so16013585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792758653; x=1793363453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJerYATXc5Ofmp19lEAv8MyKqAGNtX5c18EGoX1GCog=;
        b=KiSSZ2nUF+QqonlYUdshma3ZbAuRcAnxkAMXlqH7UshGyoVrT/0BiJ2vD8VxQOqJmS
         67AARUxFQM96dQldd6AoTNaCooRrw6LSvo7CS8GKLjNBPUJ5AoPG9FUlKXa3bnA0ePTq
         IJ1c8x9fQ/jFPnjYvt9dzoHkBt2pPzC94TwqgUYOS4/0i10pP19cZYECUu6GjbWdWWKd
         kNyILDW4PUeuTj5FWJku0iz8l1B13t85CUMD1/msCrQsCq1K+OR3Lm0gBoxs8HVxyLSz
         Po3zqUEl7qEBrc3dtMOyf4cANzqqh/YJHcvLHx/g84CgRRdw557IWtKAtL7ovLmApN3q
         CmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758653; x=1793363453;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJerYATXc5Ofmp19lEAv8MyKqAGNtX5c18EGoX1GCog=;
        b=qz6Yg12wE+jiVngonZJ0G++dHzOMTStWjZypyruB6U5J90cWllN5vFCESGoDbK9Gl9
         zKtnhCAWcZkeFZk9JdWff6KYxAqE2GZcuz3vGJXJoFOG5hLH9xS5XJgD7X5x/HZecgC0
         ak6a+rTjxrQuFncvkV2f+3nqxNjONYrjpEeZCezQE5ZDeycjbP/jt4hCCRb3jz2b8XM+
         bdEcRjpTgVNSjxH5zhZgfz4J5t0G1qtryo3DMjBsPL+OtfYDaD3id2TQ53JgEch7P+Gf
         fqqfW9CExbG35jy8SFgOxnaQ8M0DL16zn0hxMIHo0WDkAysvO5AwYD3RS22MDeggBm5Z
         kAVw==
X-Forwarded-Encrypted: i=1; AKwUvBzkw5C8gLK8r77eF1RyBiB86BhIq3+LoMQaSGeBR6U4cmWqCju+BoLBVPAQK8zaSqoltX7vPl6UicEBk5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCHjw/Wv6GrJh4AoMIZ8dKzr30o9kmbIh3S9/ZWIAmnYX0lztI
	DDFx8SDotr6tTYHp3XvKgT2yW6UwLmO4pFKk9Zcjzl+0UZwsfZp9d2e+yKVJS1dZ77ylb0v6vuS
	9+MmLDTBT2Fw0vRXg0iFEeYvejgnAVCgJ8w7L59sWv0OLhh4AX7SKHg9Y8SEfLP7SswM=
X-Gm-Gg: AYBFou2/LTE4qWR8hi5fS1q6jfvwPzGZrbjxaHHdxGPhXFN4imxrrXHD/OchFsuc4tR
	ZmsTQKXt21+hW/Q0KNqtZ9BO3kxCCmllsSDsmcLyKlTtFm56q1GOK6JcONERBgh2OOn7Q6qiwC7
	X3fIy3sm2GAcSj0OJdw11XIdr3vstCVN0o+W06Ry9NDbuz85vU+yt81Q+mqnP5S6+MsxBjhDBZn
	rCg8Gf6OCVJD/VojgMY7FPbCd6sg4uPlA98s/bpRfTbRi0hAb8LnPtkjBbrpH7of2FmeAIFh7dj
	5Eb0uA7ZRmyxPy2e9c5WfWYnpjOxnOLORy8chJ6oZ1XWNVUQpCPDoxI1r/FV/dZE5gBSTJe3rRw
	i30zsHp8XVyNA+Txs+gJUdQ==
X-Received: by 2002:a05:620a:a0db:20b0:939:9205:4d78 with SMTP id af79cd13be357-93f6f8ea8fcmr359354585a.3.1792758650107;
        Fri, 23 Oct 2026 05:30:50 -0700 (PDT)
X-Received: by 2002:a05:620a:a0db:20b0:939:9205:4d78 with SMTP id af79cd13be357-93f6f8ea8fcmr359323485a.3.1792758647587;
        Fri, 23 Oct 2026 05:30:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cbeafcsm95025966b.62.2026.10.23.05.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:30:46 -0700 (PDT)
Message-ID: <bc06957e-56fa-4738-888a-02723efa3ecd@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:30:44 +0200
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
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans: make the emac compatible
 specific to the embedded variant
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8BvXgj0CUDLISlmH3mWtrlrnIbvBuEO0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfX2yggy29/7V05
 MP2a6+JeVop8tIW1dLzpAlx81Pe1n4H8eDAm/M7qcexxWdPBUt6pnjT+EQW+BlpOYh9IFd1dqNz
 YPtn27nkZPlDQloEIH057kL7rGO4EnShScFqPVvki2pHhG6QX/VrCRazrr1L1Z+HA8p2kVYdS6N
 NwomlV8acHtDLcn1p3afrrt4AVZCsupRvoKRmrS68q7XIT7NDkmu0cYGFAHGH2GyEPQiCODaymq
 jD7K8M0uvo7LPIGxfb4fdjffEGpU7uWYLqtW7G3RX3H7H3KgUJPVp++1lGbMA6VvS9Uc4qdyAe9
 Zq9MiS+P3YymytDuhl20C4RYZsEW81QWgBp05xUweZlH/w2amSYWVYd+XigbdThc0NKArgwJQ0t
 B3hZvmzayCnFBHYz2P+wMXLJhrp0dFjFEUgHfkNSRLJKJdCJiiK/kFbMub8+o/9+EvzslraQrOP
 +fUmyagCf6HrmrPsSDQ==
X-Proofpoint-GUID: 8BvXgj0CUDLISlmH3mWtrlrnIbvBuEO0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfX11YDOA/2Swjt
 a2AokICB6yk6aK8aHEhK9Bs/qkS6DRPbwjKympjFleAnlbCNzOzoLDzESkjUL7srk3s9LjkRHP8
 mgCv0fjhI8i6hP0Wr04yTZ7xP1PNL5U=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb537e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tUKzjj2clC97W38UOGYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230048

On 10/23/26 11:02 AM, Bartosz Golaszewski wrote:
> The embedded and gearvm variants of the ethernet MAC use different
> compatibles so move the one for sa8775p into lemans-embedded.dtsi and
> make place for the gearvm variant to be placed in lemans-gearvm.dtsi.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

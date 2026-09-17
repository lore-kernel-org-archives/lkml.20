Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B3C513540
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651165; cv=none; b=Pegbwnb613fDzQOFUkHoo9esGxO3kaTB111J5JJJ4okN8X7om1dUUnnRejQgZNNOU9VQ4+K1laeE+Y06GYNfrFPJzB8SqKbDGsdswbIemV+zJTEW2B0m8LRZw5gNmRJHO4Tuc9Sj6T2/uIDNFadPlrR99DCmIGOzHXmrIEXcLG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651165; c=relaxed/simple;
	bh=8j8skYM9nhkMoJZfGOrMaZuQ/ShJNnliNXSQOIg/41E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSmNyuGPeQCnkakNxNIZRDrjwG+MANcjv+WhnoNTJ6AMClydUsv+SBoL1eYYwnH/OrJlIO1sNvHuNUrX5U4fi7/IfYXGLKyz3qfpKTDz2hve0jr7ApjUZWzGYv0yBedNAbUqghMrkQvpqGm4AMOLbZzclfq6dpau4OFYxMzPPNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S68fAKnp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaI8nkzA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S68fAKnp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PaI8nkzA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZnLj2210952
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ov+KJXLMSy+Y0RLLK5WRW/U/tz71r9xiy+wF4r5roMk=; b=S68fAKnpi4m8IcIp
	g7sve4/JUKXst/9RjdVy4l3iLwKN15TCqaHctSzPFVeTcZe58c/ygjZWkp6wCV1v
	bAKFe/au55Ht58EvfAdHdVfyCZgJji9dqkyt318ccx7ZoZ8yZsy899wDRgMSz0XM
	m4gDipUNy/WidmznJWFntcPwSiuMcu094i67eDirP2TWlmSF9tPMpigsRR0VhpfC
	/nOYHf2MK8uGr3k3h2sz1HbO9qbCEtoKDjXpSlBxPk+6fSsfmSiX6eqUnXOfCYCH
	jIHD+Vx9oZUJoad8/nN73iMnocCsvbnSaKhSRS8k4qs1t59kM5RGne8pyhqUVp50
	F0y4jA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m2jbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:19:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so1747552a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789651163; x=1790255963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ov+KJXLMSy+Y0RLLK5WRW/U/tz71r9xiy+wF4r5roMk=;
        b=PaI8nkzAveLv1E4Js9fu03PUqxfR0rk5IG9FHvVAjOKuMuPfT8Jbou441VUosHabAt
         Ex6jdIXJ4uWmFaX0jR5/RZcCj5WO+r2iGR80mkQPqMg10AWcqJpUvLQoI6+49EL2nkzS
         /scD8sj52yHPksVnhAPkwtUl0F079u0L/5HIghuBNkXeJxPyfRAs04Gwn12J1mC9ATFs
         zVL9WYQuY/pP711xGuME7Spr0YR78jND1ABM1kkgKx16OCaiTNFgoIxgg9g5dhab6WUn
         h3xJ7o+r1tpBbWNo4rF9ef1XDJ+W0hA0VsOfb67tfng0ri1IVFUU4IQfob/h1OFCLaCQ
         S7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651163; x=1790255963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ov+KJXLMSy+Y0RLLK5WRW/U/tz71r9xiy+wF4r5roMk=;
        b=GVJ7zUNqvWVLlVagPUaIBPcVrrb0REcFgqMEq9oGmsgb0gBq8x4PE6lgyQ/2mLI6M5
         EFOSoR7SHAr1P2R51fxNzuRxWadusjY/ajsrqkLRVhadtH/ZbtT+KeIbshJdyz0c6XL0
         uxcu3FV+vnhZNWbLx/8GnTs9KYcLUUIAWNv53jKgEZB7oOtmriQ8FFw68FH1Ckc3WaQi
         MH4Xr+1MVH1cMG/t8VGOERK+mNd8p9MRkAgtZVIcYehfipHixIDzvjguFjGiOQhsXtRR
         oZTS2HjRkm6Ff2WAaHXroGA1GBpCe+lzlMi1GHWoGC9oqA+2xOspHFwz8VeEy4y+v533
         yu8A==
X-Forwarded-Encrypted: i=1; AKwUvBytLDsWtna7HKzVw570UK2NgxEd0YkXbZUbRoSspPjMHooVgbzr/11USOpzxRFLneXs1wo3DVMFIKI3D04=@vger.kernel.org
X-Gm-Message-State: AFuF++lRSu6Vh6lWp1lHH4O3CJuO4i7nW/iRAqB0cnx6znSb7OHKfvJO
	0jpYJMTQp6JQPbzHVg3gwRmq9XrduIAvNtxq+BVFRYnTekmZesKsKwIooE3ayiY/DNYkB80WT5d
	9PNGGr9AxlsFkIUlpYk/o8XBevRgBwL8U5GuP+/BB8IfNeDEPxjtb9h/bPleHOwt3Sr4=
X-Gm-Gg: AYBFou3iPhS0d3/h1FAD89gv3TtItczlEZsh8YhVbWnFYeml2mqB35Ukzro32ljLtjO
	F5J1RrcUr7jcLoQvh1raKqwgCkJozOSgjD1V7L10qxRj3HbPG+DXtPPOe4wvtnqt1fl/xTIAFx2
	Uur3IFzFSLGuY8Utxjq9jDT+I3GidIRXb0K48GX0SpmEIy78QnF+EleUeVesP8S8j2lp0h3Y1w3
	oJDXMVPOuqEMPBtAuZRWx3qKHO+JbNjyfhIzCX+C4AWMuA3FVAJci3bUs1Qi5lV2WWIFq8ZEUCG
	Kxlpy3K1S3EHVTBTUZitnOLUL8DBBggD3nZur2kahGka23K6Zw8O7BJuSfWAH1OUOAmekbjfPiZ
	2wTFaoST3ge0T87hDxoQY7x4uLkOLgS7bkms=
X-Received: by 2002:a17:90b:2c87:b0:39e:4c7e:f041 with SMTP id 98e67ed59e1d1-39e4c7efb13mr591032a91.30.1789651162946;
        Thu, 17 Sep 2026 06:19:22 -0700 (PDT)
X-Received: by 2002:a17:90b:2c87:b0:39e:4c7e:f041 with SMTP id 98e67ed59e1d1-39e4c7efb13mr590981a91.30.1789651162511;
        Thu, 17 Sep 2026 06:19:22 -0700 (PDT)
Received: from [10.217.240.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3c06423esm4238606a91.15.2026.09.17.06.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:19:22 -0700 (PDT)
Message-ID: <21bd8cca-78b7-4b36-ab4f-ea19cd6d9fde@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 18:49:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Talos Lyra EVK board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-3-e3a76dc9e21c@oss.qualcomm.com>
 <5492ecfe-3c3b-4bc0-ae28-1eab79f6936c@oss.qualcomm.com>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <5492ecfe-3c3b-4bc0-ae28-1eab79f6936c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aabe8db cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=oruCHivJPGXHP5yeABwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: U17KGc5pxw6xaXmSGoJxmsnln_lcPYjr
X-Proofpoint-ORIG-GUID: U17KGc5pxw6xaXmSGoJxmsnln_lcPYjr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE4NyBTYWx0ZWRfX/4NOU5Z+72Ax
 Vey9U9wDi45gj79uJrt64T/Ufd45/RAbeOLEtmQcPPdzyHZo+aDRShsiEnRpZzN8o5cnKA2Ozta
 atwhcssen83HaVq1IOJTWPPHvcEoxVrsDA4aPQnX/7gMiuYTI5roZXX/tdn9Xn5VdUUfxwMVrHp
 tynjKtIOqADSlvybHsxe6xISp5vfv0MkkOfXEGu4MR0FwLYxUsUImLl1jitCSl1sy05biliXgF1
 LrNcnjullnggNaIMCkfJjcE8iG83EqL4nscZISMVP4qfkuVQ2aHRKFRdvNFsacsb+pIlHvU9ULH
 M2xT/NPxchZWV80QX0Jxjz3j7+T0L/Fpzw5sjgH4x+Sf0A/QzNQ43VdnialzY3zN9GqVI7e2KNH
 3VIqaUbCcr7tjDVmGTPCOXrl32ZHlMy5uEwnF7Qc44I7g803VdtxcS2R1yXqgInlYK1x4pkd+oO
 qzFF6KFfZFbyu3IN5DA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE4NyBTYWx0ZWRfX1lxeuufHSv6X
 4ubRnv2X4uj0wqSVrkyYQqeyO0GJSog18bPDPqKcp23s/juiW7/Y63ZMIwo492cRmBnCEw0N2MS
 Re6vKw6h84gqF6C5iqC7jt3p+qsqAqY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170187


On 9/2/2026 3:50 PM, Konrad Dybcio wrote:
> On 9/1/26 3:44 PM, Avaneesh Kumar Dwivedi wrote:
>> Add the device tree for the Talos Lyra EVK platform which combines
>> the Talos Lyra EVK SoM and Lyra carrier board.
>>
>> This device tree adds board-specific peripheral configuration on top
>> of the SoM, including:
> [...]
>
>> +&i2c5 {
>> +	clock-frequency = <100000>;
>> +	status = "okay";
> nit: Let's keep a \n before 'status' consistently
Acked, will fix in v2.
>
> Konrad

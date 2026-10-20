Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482057;
	b=lHR0Xn24bnrGooxpRhs7pvJEt6bu50CiyjdQCOqecU2goftOVYIgc3OQ1/SI8DXweosy
	 tHN/yf0aquNGXcU+6roISGUXnaIbQzjiUwiwzW/o1H/UBXbrror9kZsUqfWwGH3aSWFmU
	 hhy7uj6Djttn4v4+zgs+PXy6s5Lurq9KqkAQ7rCnCZ3x8Stg8mNVb9AMNHSpE+eoojuz5
	 sD1BpyHDWt9CsTb7CvX+z+l5gzuA/0nCDcntwWdNcIpIyPylC5po+fbQBV5nNC4ts2zCf
	 IfhVNq6/sSKqJQI5J/L+p1j7GQVuSSMEUXxiWFx/XCJMnYZpMif5mC6PJ6WSUBfSNBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482057;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hy4W6mMhOKdF/nbRv32rjMZMzD9lBQeunFVQ1Fygj/8=;
	b=lPqbU+AL4tdT4VzcCnivwsJKTSs00p66Tm+SYuFY5IT+iFwSCC5uhqfxiochpsB8b/u5
	 aaFnKl1H/AjO/XMn6TJtrbP/ld7Fzt7SF1SN8Xf3TBGFDzKZAQR9U2rOGByQptabfPhwY
	 Z1ItE3qjmQZkOpoQulKhN0itJT4nSx88ddnKFIWYaHcDmUXIcMMxKD0CCC09+c6wblDCT
	 5n8rkSxtBUjWazJ8vHr4fma6cWVnGovSld78K/lASm1wyQ5TtsA/CP4dTpQcL7lTqZemd
	 BPqMq0SPM+VTB0jR8XqPpeG3DHCe2c+1r2I+vfMDeincPWLUNYPYUBQNT0Iv/keQQYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqdI2ViU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="II+s4/OT";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D710606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D710606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqdI2ViU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=II+s4/OT
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t7kR3806851
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hy4W6mMhOKdF/nbRv32rjMZMzD9lBQeunFVQ1Fygj/8=; b=GqdI2ViUBphwRsIq
	LJdO7tVHBBCXtj+kZrsG8IxGgvJBUUgDo+fB9cNCo8JchN1seaMleSoNtvqW/HjO
	dWo12bzQitn7JoVFBLDFARms+8FnK2ijKgQ9IpyrmGE8nQjprv3KBAnsk5fk987J
	lGGGxTcVmlLDiWA55N1cDu2m665VU8OBWtdPg7GYLXL2f/lWPNxRhNts/JwDt8th
	Rs6sUvvDWx7OB5JvSBErZ23z85H+73cKKLDZzmOg5OfDI+gyCCP5QCp3xRcuDgRn
	uw4C9+lneT2f0jQA9NmPVRnyZJyZW84VpsKMdpxc9d5M/rdbdzePpOGyhzWkDQS1
	eYjMgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9ed5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:40:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e58614290so45136385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482055; x=1793086855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hy4W6mMhOKdF/nbRv32rjMZMzD9lBQeunFVQ1Fygj/8=;
        b=II+s4/OTaH/Fl+iViWfkTJWFnHrWfqJpEg4nEfQ8Q94+8eZwMuiR466bWjPmgG45YN
         PaZjGJlm4JCT1PYLFvKwcgJCUUyj34ZnP48i5JpjRebLk+phDGptzFqjmiU5ndBp9ZdK
         tX61Yg209vB3QBejtA86v82MOp9Cpqi474ielILquzG7ajojq2fkSosLxUrFelcpzng3
         WEUe3zrfRB9zBe5u/prIaz7rNxtMu48T93FZGsFyjW/5TZ689PAZ95DdGfjCtM5V6RHg
         d2W2JQBsh11oWX0jifpKLO0AfjBVVbODlPnz3dQOGGLAFMBjqE1Hdosv5Ms9D2dMEKiq
         kJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482055; x=1793086855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hy4W6mMhOKdF/nbRv32rjMZMzD9lBQeunFVQ1Fygj/8=;
        b=M+aVD/EekwCYYC/PppgVoo/ka0u8uCthRfWPPqpirVPypVbIiuQOor8+jaU0HfBONd
         U52NVT++jBZqR++/JwS0467iBPnXrhSNlAoynwRk2/6vZhUIfqH4Jtsbg0qAX9WuDj7m
         kGQi1FfN8aOp2X3vv/wW4/NnEYDPfVXh4QNx1FKcHdfbMmWoqOyq59nYZCffzmNABOSo
         8x4hmS1QWwOoR8jH8CYlAMXGSPJSkG0Btoq44pBV9x6yw449vT8olv5ZZ2RKolB8Ex+/
         8mWfEMUNslsCupDQgKp8Xn+JDJFxnFqfzLroh1c62csS7tp99jXh9B12QIq56WMgn/s4
         9bVA==
X-Forwarded-Encrypted: i=1; AKwUvBwUdm1v9m5GDWDEc4wASA+19psfABJIy97sXTGSM6yFMDyDLIbqDh5QrxMQjq4/Dx0Z+CQq8yN0j6NziFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4FGGk7O9F+FFeKzZ2k8CeehinU/hpsSdTK+VPq269TVJhXYyv
	90mw7+tU3gdbgFza7JQVMysXuLV6ubnXnM4GFGnsBDFiuWwBqttFntlb4LTs55JK6GsXkaq+FGt
	G4S7dfomU9nfeicaL+ZHU+4BzduZ63AI92TVChaQzMouI0Q18+iuXBSM+Wwql/tfWtheB7NkLN9
	I=
X-Gm-Gg: AYBFou2Kg7mDmXAJzCkPbuqmloZ+zRT82TWgN0X5KdBb6xr2lVibt5ZWi/f1NyYmPvD
	P16US/GVrzWOMZT2PkiAuOgEObDew63nYl7xCxG/lwPc6dWgLGoJ0RVawS1p9HKNnRB2QyCQSSY
	32toq/A17TL/s8/FjYCmxHcnhDrZBzAsk9uc3uVFtJsF8jDFp9d6T/0ziiGxX9MsFmq8FVEbnG8
	SoX/aToBRASCQaM8joTKQx68iO2NfgSgivU2FE9+aBGfZUeHyOzZoDeu0zYSnUTqO0nhkJKYCC3
	Tbn2o+5aq5n+WkF1gUyQIfDelALQ9g6smyS7R8aaiNDk81hsxDF6NeXgpYd7o7KMqPARbbStDOt
	iKd9Of3aKoWdCTCLgtFzoqQ==
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1773168485a.6.1792482055295;
        Tue, 20 Oct 2026 00:40:55 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1773166985a.6.1792482054808;
        Tue, 20 Oct 2026 00:40:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c42a3f4eaa0sm287773166b.0.2026.10.20.00.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:40:53 -0700 (PDT)
Message-ID: <bcdc5f69-bce4-424e-b498-893a95f3cdc6@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:40:51 +0200
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
Subject: Re: [PATCH 2/3] arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: add
 'qcom,ipq0518' compatible
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
 <20261007-tplink-ax55-v1-ipq0518-v1-2-0ef058756596@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-tplink-ax55-v1-ipq0518-v1-2-0ef058756596@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4zS5K3ve8BDiYJe-UV7ez1hK8Mf7PuFt
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad71b08 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GWSpooEIi9OgKuXyjjUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX094YDKBQuCGG
 6cjZfL/Lc6cN+4To8i7sbNXRVU/4w6YClaiYs48+JikhdfrWU1Tg37w8RSle15GQPeEAbt+nDZC
 Q6Y8+jgWyUxUhzaICW+58aESeuLO8o3Vj9x2vOasVWOkFMEb5YySwpkq3dClUD+WawxcR424Exe
 6qKX801Zgyx5x7VVuV3y6/mu66oGy34+OHrfRRe+fTPstmBznj36CrApxk+pnEJsYWFjejGKWXa
 D64zcC+nU0XdExKDaLCHrnsOtLQL5fGtA/c5yiVHNbIHv0waDx9MzGHExmr/73T41DYtZaiGg90
 Cwq/AGfR8Wz9fSvuyit8wkNOAFywbePFBtmLuFLb0F0XpHZgF+Mydxp0jea5YDvXe2PwyXbqoaY
 EuvWYzs6AbNauDQb4cqmfKN0uHG86kqQz6J+Vnx67NQYJqT88FhRcAiBRN6Hh22m85rpciDKPWO
 f2MWxEh9W3dedMCHxbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX2I9jdUddGOlX
 JYhJ90JaNh0d+awZ4+CMb4klkfWILVjWi4jVMMeZCwNPNfXNWdxHFbE4+T/nZf/EO0qTo4OMu2c
 4zHuGOh3S04fMCTBSQSUlnz+BkgOZms=
X-Proofpoint-ORIG-GUID: 4zS5K3ve8BDiYJe-UV7ez1hK8Mf7PuFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

On 10/7/26 6:59 PM, Gabor Juhos wrote:
> The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC, so add a
> new 'qcom,ipq0518' compatible string to the board dts file.
> 
> Since the SoC is a trimmed down version of IPQ5018, keep the 'qcom,ipq5018'
> compatible string as a fallback.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

The naming is really confusing indeed

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

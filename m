Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D488223328
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420405; cv=none; b=shyr6DuDiqyndm6zKHWmcrfP7b4etVk3qlNaeHDPwERWpxXi4LDTu4jziH3GOJ4qSKFKOxccwdGmlRlENp9Fak5vthfj69cI2++mje4JphHZ7oEE9/5AnpJpdOpeq7mKP8F9h7WJ1dzIwfftXe8DecyaQNBgsMliMguiLTII1i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420405; c=relaxed/simple;
	bh=cBx2KYokQieQkn09GfACSVjIHXBBt9w5AS1zTR8uLVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uEF61r//eHPVMCgbhYJ7dbS4QApn8RuAjYxIuRyo7uWwlMaTTC/AmJbLX7q5R/hQ98vZmVLk8bJJbo2qOVJmGOSMW1/z1C5sXPwQRWAZ6lJBTmYx0orl1heTh14IisC3CKeybflVNqBUxxHaDkkzzTHxYiWfez59JeRg8hfWdcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IE5Dv+vL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUvF6zn+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IE5Dv+vL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUvF6zn+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835m6ks3245975
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGhkDRkFN4UB7oiyyITmRHwra+Le5AfKlpzBgCZzEcU=; b=IE5Dv+vLFSsykooZ
	eriohbqfVxeFdcKUZuklkdAOD+jVsn2dGHctM3Mai+vSHF5sVMADe4QHGHw/SMfc
	SE80FOy7RXgz8gr5hLDGhvuaLwr6USRQRAKWSWZ87AlDILQ7Sa4fpvdDsIT98dyg
	oSkTfyxEpDrUa2BFmm7aI/2B6BUGumGScrv+RLvtzljeM8xWjMPD4aYzSHv/ltkE
	AIwOk8FqoRK/xzdVnATuB+1AJ6C96TP19Bi9umraIMNQRy4fPBw3N7/VPJf77lcA
	v3qCWo+vtRzmjTyGzsVxEYebOiNr1BT1MAB2Bdzcge+di6l/FVShWLOqVQ7lIQa4
	90eshg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemcec9ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:26:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938fd633df7so40544485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788420402; x=1789025202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGhkDRkFN4UB7oiyyITmRHwra+Le5AfKlpzBgCZzEcU=;
        b=OUvF6zn+gfai7/ps/AGoniMqUcMdn1qgDMij/GXdwx+hO84hpVA5RNBKcJFCM/nPEe
         VAJAckg5uq0GtYb2poHv96YUFDKE0FYFcUJ10OvWvd3xOVP8M51VHqNSsprSOU0VvA/O
         xFdG27S/NOnsnTNxTdyn9KVSNk0KinfX/tUdL83rPCYO2ETBIOlqbEJb2YfJyUJhii4u
         IvEMPIndNlSN/fJhrLt1TNgV0Fi/Pd1XnZcDv5LP1sG7sgJoSuCr27jeSK6Lz/CU1RVX
         ZM0AYK8tFSS+3P1cNiy5k1hFVZDlnG66aq5kQHG+yCsJznpQTEoNDrv8p2aQbPENx7/a
         gHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420402; x=1789025202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGhkDRkFN4UB7oiyyITmRHwra+Le5AfKlpzBgCZzEcU=;
        b=LwnGPopR/0Fr591Pny1HbB6hMWN/O2ftEU7mHjUKZTpTzLpouOGnh0tbK5jrfd8idV
         p0Ewye9kzLLIIJGTVrJsICAx71/JdOs9C2vZ+jSyrYY33Om95EXcUYb+7Aw9/ZJnB/O+
         RkScayqVeVeidWynDJOlv/J102DKXTFaIYOYSbECoM38evhs0yOzm7z4tRGcg1TVl2Ku
         XCVZg3PQx1zbgX7WIkirCvIL7b5t4gfnpPKGj588Ks5R50dGI4neQWL22sbaqn7f5ZG6
         I2J4LzOW/EXC4q9dN40M47ij7Nc3Mpwoh4a/GbRVOYmV0TQiZMv5/hB5BfA4jrHLYvHz
         9KQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhSjWA88e/cHQ0t8/CJFglmPAcAblYFr5CJcRdktIqoqtx9i5M8FdvBDiyIpy5YSYbl2f4Hp3pCkMEBaU=@vger.kernel.org
X-Gm-Message-State: AFuF++lQW6RfoBopOpl0WA12KQLcSs4bza1VOTyVlyq85j9w0xzOvcCy
	QDLoqi9qTRySGLztwlh5lY8tvzH/sue/nCNxpRy42NM7M8SJt6BYRweCfOXAwlckYCqt0YRYTOc
	B3s89JIWufkbwtVp7XdKnqSCay5ZcluygMtjGUHzHum4g2uriCDrSfpu5e4cOSQNZETQ=
X-Gm-Gg: AYBFou3mHw8nTPw3RHaryy1pMCkpHSVzZW5JEU9DkY9GNgGST+0s8yI9fbzaUtjZOZ1
	FU1BKC4RC0/y1BQE2+029Jd94yqBAoPPwVuYgmIZopV1jL1BZKOfhNTy0E4jV1b+b6QaP8DHw8u
	0EKtV2vHmaf8K8W3eL3ucV+39rjNwlHEHXUHXvrOxDCIfsC0RrEMIlM9hmZVvCCuMg6Gv6leYpN
	rLbrQEdVTakX9BuvPOaMmAJOKb+0XPaEyhF54VdmTSg93MiPIW2X4cdHJ1Dv1mrTvp42M0Td8OW
	5RhHOEKxQweGPLNCPEioLJTA+1vg8Ldw0MQRIqqfRzTilAALt5RQDtwFcX92w1pMVDlyNGsRw2u
	CbNTCcY8pHOpAZ8pkwVIZuw==
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr724256685a.4.1788420397319;
        Thu, 03 Sep 2026 00:26:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr724235885a.4.1788420392092;
        Thu, 03 Sep 2026 00:26:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f6c2a8f6sm44785366b.35.2026.09.03.00.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:26:31 -0700 (PDT)
Message-ID: <e5292ac2-ed2c-4f9d-b74e-adafc0a77cbf@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:26:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-evk: Add power and volume
 keys
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260824-dts-qcom-eliza-evk-add-volume-up-v1-1-0cee16886d43@oss.qualcomm.com>
 <bb5e86d2-2525-4abb-8ebf-75ba7780bbd5@oss.qualcomm.com>
 <nl4lhbhbz7i5pohlenlbnp2odqybcbgv5n6aeulh7hkhq7s5nn@7ylcarl2fkil>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nl4lhbhbz7i5pohlenlbnp2odqybcbgv5n6aeulh7hkhq7s5nn@7ylcarl2fkil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NSBTYWx0ZWRfX5EDIMgctNNPj
 aSs0cVGwTbmWZdeOhtdEkGf0ZvFKyP/jzYn11nsR6vSgdNBBE6uqeGxJvjhab44Xq5lyQzrmaU5
 vrB77YH0/CDanMiJuEnRyN8KVJPRdVvqjEQDr7bfhNnmFPMMppTCoae0G+RQVixcEWirOmLX2hN
 kQE3vkfdjKRpETxZ9zL4/rM3NnRp9Sq6YDnnXNfCgdvrVhUHLNZ8G90z6Yh2xCBFaDDKS8PT0ke
 NXoK3uhqsarXd6Kcvt3JYbMSTR4/IWFmTc0OXTpX0+Wk1s5WqCwnLBg/L+KNDsorBdALgwIHuT1
 bkJ/sPcb/0kma4mXE/nd8KnnxNi5VhE1MYVdfYHYElVmcC2VdRZll1bTmpVYPAzWEKBN8aPd1zF
 yWi3Q45lDjrA4+p33KL07HX9pm32CklimuG1qOIzmd+QF4jXVjJxi3EdruwRcOd3ocQfHYVp8yI
 p4eWBZ9WORfz1+OWqPA==
X-Proofpoint-ORIG-GUID: L2MlOyBy5ObC1iQtHFqoeS0RZw8aQ94s
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a992133 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ULLzqpmbMi5bXA3aPCsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: L2MlOyBy5ObC1iQtHFqoeS0RZw8aQ94s
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NSBTYWx0ZWRfX1fxTIGDMF19v
 4GyHL2fy0AwQ0cY0ARdxd11bfIxi5QlL0JIMpMReYvrbxymtisUJ1VidX8N7t2qtigPzrDk8JPt
 YFpMxB+e49uLgTNy/3t11GQbPZyUyKg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030065

On 9/2/26 10:52 AM, Abel Vesa wrote:
> On 26-09-02 10:30:38, Konrad Dybcio wrote:
>> On 8/24/26 3:45 PM, Abel Vesa wrote:
>>> The Eliza CQS EVK has three tactile switches: SYS_ON, Volume Down,
>>> and Volume Up.
>>>
>>> Enable the existing PMK8550 PON power and resin keys for SYS_ON and
>>> Volume Down. Describe Volume Up, which is connected to PM7550 GPIO6.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> Can this go to eliza-evk.dtsi instead?
> 
> They can, but what happens if the CQM variant remaps them to some
> different gpio? I don't know what CQM looks like.

Can you find out?

Konrad

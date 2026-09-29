Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01E0518136
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686717; cv=none; b=sTYl6W3koLSGQszPVA9/hCyMxR6KsvyUvPYdeE5tSHv0Sz8sUUTH0Xbm78M3h28uYj7Bq/HK6N5o1FljMNShueMHMwJfcoT93Vbsmq3PNg3xAJzDyrlfYtbW18ZpGApy/WQEGqXoAisY6dzZuKrb/p+hkun9ArMC2XvhKUcu8jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686717; c=relaxed/simple;
	bh=poKTzgMcXmt/rXMV3v5aS9FWUcoH0tIk65sQFqa+kWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwzZfFbNXzf5gN0dPQmQ54jhKmPKMiNRADvKjVHVtfgR+BecEPgNuhhuoiHVoGF5VHPXmCXavi6zJSpVwrOMYjzPIRIrwnjMrPNlDEYy5XCl1AWvY4YcRRXn9tXZP43zYE9zThAsdRJRatDd2fH/9oCfH9W0M50FKg1+MpIgQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZqjhDjT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUwdizTL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZqjhDjT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CUwdizTL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqrca612070
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h+dfVS2AQIbYUhZhPWcbjcXR5H77ZLShPoBFzO/u0Ic=; b=MZqjhDjT0vZVncHZ
	Q1W4OKXD8HoQp/xNhjb/0wUlzoAvXYIbdaj7k4u/D6HSWoVbzI7MGVblODPDtovC
	kZjv3WuEXNDvujVjaBVIj777EB/VwsrbhZOMY3hqboUWeH/jDENH5/hGtKItQfwF
	aUcRrx5G/Y9PaQjg6r9GjyeWf3yn6oJJBDU2QMc2N+MHcQP52g8QmHzl2NFsMLsN
	mJJ2aJ7SE3muy9AwmPucot7tlrFWBEYvtjQck6J0i4WJgeTxWWpmj5P1UBTKLIt7
	AY4FvSE8+GvnQvaDhY+PBNyvy9Huiy6a9dfSDZ9nfcYRe4w+nEv74IVv/cFS/yWs
	X5VG8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u4ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:58:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso87941485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790686713; x=1791291513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+dfVS2AQIbYUhZhPWcbjcXR5H77ZLShPoBFzO/u0Ic=;
        b=CUwdizTLngRy4GB5Joj40ZOcmb/YMapYtMWlLDARhxPBjIMpK+aMMno1OdXZ1OI+PZ
         /i46270vwa3opcUB09ePwFMlzW+74jI6at1ycZO4rjdCkS/ETl0Ofht8AinWujseV00H
         x9Dp3/QUcuY9bK24jVRW1G9QjdEm2oCURgilmAbWRS0001WquSTQJ7BJTuELKwDXvtQO
         jjeZZFB84EEqk1NULrVNkJk+dSg46gmnSfiFk4EZrOvF8wsQ+m5xvxmzy5eSQ2Qk0+7A
         3QSpUhCTb7aLkut013751PC41PUAwdjKDnerHIuj1Pcr60xruqDjBXvVrveeOjtbLk/F
         QMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686713; x=1791291513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+dfVS2AQIbYUhZhPWcbjcXR5H77ZLShPoBFzO/u0Ic=;
        b=P7cpiQxs6NGDsyE39mlXLOBFoG51NepHw8glt7vmVfjX0kim9UqmsN5Fy5qoNtXRLQ
         wh4a13MV10rfAY0O5N18NYTiD073JTl5NPh7x8Fq7pUBSdAbL2+BO7Ja3bEqOdJNpgeB
         G76gosMEWTXbMFiAuy11/acNefV/ZGkOaziolyONFXM2zFKYUvUTPO78fNlUc5fxc1j2
         XHWhxxkKJ9hahtYUr55C0hTPTy9D8wJjPsbepfNihD08fw1yeUwMSb/bOGW5kXWXwh0Q
         Hj5jM0tUCHIhU3TZQyfjtyVis9NJ9O1MhyJLIkVVlNfMy/ezEGdQufzZ9HMPxXpy6cy+
         9edA==
X-Forwarded-Encrypted: i=1; AKwUvBwHDNBaHDyAKXUIoTgaw+z0mjpO/cn/FtfqIC7Ptro8iA/RrSUIQkpzKz++FVeiC4LZkBLYvb7J8jVTi0I=@vger.kernel.org
X-Gm-Message-State: AFuF++nqADu8gh0cd+GMsQiCZl4j6xHm5LEqW+9DmQiTtOFYHdhb12H0
	fGQz3Y6JakYR75+Qlnus3za7bSy9eQDBauITO6gstMCRsBbRDUktXlq95u3XsUsmVEG4cfp7Zpy
	Ap2BLQjTLw1JVfRLJfCdCmiQBH1HbcCcYYO9zsrzXWvgWStxSsefPU/PIiFo5cn2FkXo=
X-Gm-Gg: AYBFou2VPH7SMlAT1SDNA16xw2wupmcqEkREKVqJdqd9IOFFPXbMUuCOFFBkZBKaIC3
	7Oi2NcGn+dZ00nV0pdBh2E9fq7jbQPb0DBbvBRnO15RFUvmCawgJclVdlfzfFdNlReUZqy27qSt
	mXgJ9N1qC/cY6IEqiNrouybGmjs5mOwn3mLTUPdaHt8Li2k/9D/pTFNHdtRZTYqJEjwI/SC+E6w
	WtX501FF5v/xB97v4vcSFfEJG8NGpuyc3aqQtWlwK3Z06NxAq0RZZCRd0urJKRhfVaVc8YvwVN6
	fKdtwSfEKwwB2REk+ZIPEilNOH5LQQyUCO8T5sYBwufvyIzKCsTZYyutWV9/UVaHuf1EvjPlkNc
	8m0AToNgMzx2jVICAYt6z2w==
X-Received: by 2002:a05:620a:600b:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93c43f5e580mr2597726185a.6.1790686712744;
        Tue, 29 Sep 2026 05:58:32 -0700 (PDT)
X-Received: by 2002:a05:620a:600b:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93c43f5e580mr2597721085a.6.1790686712170;
        Tue, 29 Sep 2026 05:58:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9deba80c6sm1361214e87.28.2026.09.29.05.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 05:58:31 -0700 (PDT)
Message-ID: <7bc9ad48-b8fc-4feb-a5f4-56d822242773@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:58:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: fix sdhc interrupts property
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260929104127.3156764-1-arnd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929104127.3156764-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MSBTYWx0ZWRfX9WdZZCC9rm9I
 ndQA9CSrh3YmGrM+iM5GHWLkrEbVfSV/HLRAf+YxNHaU35+o3g/1hfwvPxy1KqongaTgof8gU+3
 GF1G/3qDco6kuUxt5CX+6jQxGPyAPpc=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbb5f9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Eo4bF1euHd9rOWEQa6AA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MSBTYWx0ZWRfX6D35beqQVIw9
 bfZVYBapD76P9nOViABYcvPZAsK20vigl6+4UuOiPnBobAXbzA5xyoFajkm+lgadD/c2XynzegH
 t4sE36epTOy5Atu2TbKrMMul2MsBotcCGsf1zmsFHXZaX1IV2wc4Qtmsfl8Cs+CrXyTWt7dMcAr
 rJh2wMJ7Yzv6lUoiduMkAT9dcy6wGrzqv+YfjQyX/xj1vGLQfcrFGQ8t+s3MwzdwcDfyq+zomy1
 Z5ikMOyNApxzn5uB2PAfJY8jFfyvOysfx8YoX1v52yj+sEcNxLTpQ++lwzfg5pL8s9fi6iKrtEA
 SDGe7gIh/q9aUJm8zSmqDqRcMFErJaQXHFqXPWNjhqXmO2SpDspBUBzMeDNZBN46J9s2vcxUqnU
 yxx5xW45fUVqqmK6kV72eTKrsup7mdyqm0HF6zJ93QAg3x5Di7M4jbClLwT/OQc/QzRiFK+rawh
 zN3YUyXf7OxBzgQ3Hsg==
X-Proofpoint-GUID: fP457mU1c4HAb57KEwuR_AOmQ5Sd4U7p
X-Proofpoint-ORIG-GUID: fP457mU1c4HAb57KEwuR_AOmQ5Sd4U7p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290051

On 9/29/26 12:41 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The gicv3 on this chip uses a 4-cell interrupt specifier, which
> includes the affinity, but the newly added mmc node uses the
> 3-cell format:
> 
> arch/arm64/boot/dts/qcom/shikra.dtsi:4151.4-27: Warning (interrupts_property): /soc@0/mmc@4784000:#interrupt-cells: size is (24), expected multiple of 16
> 
> Add a zero affinity, same as for the other I/O devices on this chip.
> 
> Fixes: c8e3d40457f1 ("arm64: dts: qcom: shikra: Add SD Card support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

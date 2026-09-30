Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C2B48594B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764422; cv=none; b=gmg8FjDI1Kb/soUvONahmfmaE/NFSjhYzjO7bq+ZTI/gUHDMRuwPcybNwO6KGEURcrw1gLdIMT/kL4OF2gnJi19ztjQ54szVeJU3tGRKU2Q6/hWsqd0pDKE/dZjmdAVLjXaAOTf/TCUrcHCOOf6JNk5G6O2b/HbQwbCr4Zi7wRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764422; c=relaxed/simple;
	bh=7R77TQqIMmdGoS2eO0kXm9TNz0zOrN2y4HHSkA/2YWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUh9P/FPZb1FoacCEw9ynepNkFYH8rwogiWx9v4w4iOVkB9eScuH1WFleZtWs1lq9S9Uc04jnZXe3MwqEeDsAOScs/Yc9WzVdGzKDScHldqnfmSeDara37C57Du/MvSLRiE+gGkOp26qPSIp3dOON/fZxBRDHVdYY//07w+h408=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XI1nt06I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KPatqYKL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XI1nt06I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KPatqYKL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dgoK2820144
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oGZvKGq2A3pM90buZ2VNpRfUMGSk6SlqzeIIAOV+V2w=; b=XI1nt06IC4Gfyq9B
	JaF7mWhGVLDxYdGSxYjijvlM8YeKzgINZOmi8J67i8aHtGJWksB1hEPIV4ig8K9Y
	7sp7uM28bWnzm8YEbZG+EabfsxVJ5gmmuwl8NQPz9WDmbJ0zje11WAEEJyAkBHVJ
	GBnhrWjuTBdj+8llu4FsgTfPySBU0+56wp9sTVcxWv5epg02/kQzbDiyKTKtWENb
	4neqAvUEjWOvc5nxH2sZnbcqnfMiqX8dYXTNJz/PYEf9XewTJlmpt1ZbxDTlJv5c
	ewy6wCextAHBTubv1xxsUA9LSABrAESqb2b1F0Fff3uh8ug/Au7ScgXVwICz539D
	8V2UlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rj2t93m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:33:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so4179585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764420; x=1791369220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oGZvKGq2A3pM90buZ2VNpRfUMGSk6SlqzeIIAOV+V2w=;
        b=KPatqYKLTa41CEXSlNOr+4zirS1jeOzOrIvsT8dAbYQJjDACdlKzsFDU3kvpa4okVZ
         3deEjRQc1O094UB3uuuyfJr17RWobZLchQnb+UTt8jipfBTy2yOK6Khtqghpj8LlUwre
         hBXXTWaNDsqTPMV3+zDmzEvtvSf+XlrLdJyIRExORHBeXBi+Oygtt26BejwW3A8QjfIa
         727Lek7HlK2uC7AcxATow0DjDw1yt5t0yeksYGU5ZezGHZI/kMAalcnjIKc4CbPgEN4D
         A+hsesHIt39/tih3aDuA5pIp79Q5Ek+inTad8fKH0acxme1/w1ELcEDjVCgbF9aqE4LI
         jMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764420; x=1791369220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGZvKGq2A3pM90buZ2VNpRfUMGSk6SlqzeIIAOV+V2w=;
        b=De4SxN1pQ7Poxw+pThdGD9jKdbJOFCUtNJyrXcaAh7Jiy8vkdmXVCky8P80q9pzxSu
         /MjlD03Tn4ULmJpdFgM1NHEpsA9uSbUoVkYrEViEW/OP9gi9ZYBsjPt4MVLU5LzaCWhA
         d0BAqDYMWvuzGA02HQcVUlsXaoSg2/56CvaAi9tuJQGVAzT/6eEQ2SD6xy2yVDhn/pEZ
         c4qvUS34S/uwLmj7zesv41b5gfPDo8OQO1B+CvXZk9MtjFcNhOr3Z/n8IApZ3D70heJ3
         NKmE2cEcQahmCv2XMMYY6Ct6lGOCGtSWA6bI5vYs435w9daG29gbEfGxFByR77B1Kx0z
         7C5w==
X-Forwarded-Encrypted: i=1; AKwUvBzrYyoU0Efu1gYlYVUzFwJdV77zab85bYRZeP+OtCOXk9E7aXEZfVcEZTQhsE62owtvRQ4Oc320I1mJpkU=@vger.kernel.org
X-Gm-Message-State: AFuF++lyzfuTQBycYLfOo2eMdSe2A4/oQABHlwsOiCfSXqM6mFxnhPan
	jI+0oike7xDX8myiZMaKNb/MnAnplaWLNaqoDh3JCVbkEABrI18LudOp4JvJQNji71bSNIo+Itv
	ZpAc3srog3z/nsS3qWG+J+PLD+q9TQlDmKB4+d9lAaLVCq2umfgA1a565ZCHzWljiW7w=
X-Gm-Gg: AYBFou3McodxsdVuLjQVQ3p70WCovj+3KaGqufmQzUhZuGeNcXJ2qbLd/GIjKOAFRbP
	t6KBTj0EeSNRKZmr5BL9C2WxanmWtgfPdGX+CFyCockPP9N9bnrzq+BHrsbIvD8T2UFii3gtbnj
	uuVVUBf6pCa5zThynsKNjn0Wmkzl0Dp+ZXJPqppfgZLo0Uf7G80eBgD44gSHaM7zEOG6UYDz+3L
	VxsbH9ofNH9PrzBvpX7EUnVUs4A+yGmJ3t40uPGwwJLGPELjGIPMmKDl//pmQCeGMeU855Nvwin
	fpKy3f9sNwfRVKL3NDQchbm10bGjV7ZIBrLjX3nVkJrnquzpWoF6daNW97DrjGYiAgZ1Rpi2Ioz
	AqBr+7gVVAx9VDBu7Hxwobw==
X-Received: by 2002:a05:620a:3195:b0:93c:5bda:9711 with SMTP id af79cd13be357-93ca980894fmr145338685a.6.1790764419687;
        Wed, 30 Sep 2026 03:33:39 -0700 (PDT)
X-Received: by 2002:a05:620a:3195:b0:93c:5bda:9711 with SMTP id af79cd13be357-93ca980894fmr145334485a.6.1790764419199;
        Wed, 30 Sep 2026 03:33:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9a39sm671766a12.1.2026.09.30.03.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:33:38 -0700 (PDT)
Message-ID: <255658f9-cd6b-418e-989e-60daa36ca498@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:33:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] arm64: dts: qcom: sm8750: Add Iris context bank
 subnodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-13-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-13-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NBAz2f9hJnEBab9AmtKjwzBS7jKcGsAj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX+TsU/hTLqM/h
 T9UDg8DvWdzpgVhpoH5rON5bWlyYbXrdyKwgy+sEN3nuovVoXHDqT7LDpRX/Nx+WfsSYsDuDAKM
 R0FHRjlUBfuTuRovWh1YQhLa//rPq5zt2oT0zRp4EPT5EOrIOjW/eaeOdxOcecM0r4dLW/h7CLf
 vqnk0OwglBDAZ2wJ5/9sdMpJ67RxYGhpKsWCB6FNS0oW0ouDjFh7ycGMkawcuuOSvXtagtylLLF
 38MVYeYqfMK0Kv1sR6nUgfAZa6riMtPugYO0NzZomkBHLDw2fPXSkuAZ9BVnkRmwc0kp5t97a17
 k/aEZkhb3uwUBLqj7EWeSUao9X4zuEFeJsHLYJMrAFR+WGPK6uPJ2H4L1Ut+HxSKKFXoCLxRhdK
 H4ydk2w/6C/M2MPgHMM/b6PlbOcoFQWOU9VN5o5nA10hg/MTJyQTB8cBIL/keS63eR2a9brLqxq
 U/cyz9Cl48v/NERC1vA==
X-Proofpoint-GUID: NBAz2f9hJnEBab9AmtKjwzBS7jKcGsAj
X-Authority-Analysis: v=2.4 cv=Ypya1IYX c=1 sm=1 tr=0 ts=6abce584 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4BULcDCo1EIeXDFKsSoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX1DWa/ldxtwjW
 snKg1bxA7JXU5DEHmx8SIDx24qcm6xoSXng3GWC2SB3e6dFLbqcJk7mWt3jP4K/WBcAkpFC87+A
 v7+NuvOcI4ZQREbZRbEivBkF6xg8ja4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

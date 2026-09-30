Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9233B4718D4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764376; cv=none; b=ZWudUmdNqy6UsPDQmer/JHxFIsRzttPwylCGik9/bBh5l/JsBtohqnmlYmsL7rKdaAmU3WRnZyl/lwES9oJ2BzIJEYGoUTux92IPlYuPS/aLT1tF5jQ1r9dvKqqQDCTpAngTNsLjY8rumL0PkiTVyBT54n1SffJOfGgLwlNux6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764376; c=relaxed/simple;
	bh=K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3BH/BSPVCMoGTa0AL3wJ9RU+C//YwRqdLl1gglEugXiG1oOCudvZKg6YIOtlKxPlOtuUpbVXxdjQlxCZpD6j0lN3oTWKFFFGPNGO2MgD0s6rsQzI5L6Fkg/ofglGs8ddy9z1X3xBlocx+Eh16oeg5jfROwlpz7y5zUHK6ie+/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYmEqs9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WruygaGA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYmEqs9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WruygaGA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dQ2w1556131
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=; b=HYmEqs9WutxOa69a
	OmWATf9BkDwYYv4FkJDlY64AaUtirh84PFYtB+CNWdzGQcUhE7oi6tCqbiaXaqb+
	6r/Xc+L+lt5liw4SbqvkO5r+SSOsGmIghGx1H0xv6oxdeNOMZM/BiCWZISknnGv/
	gWdH+Qfj004GR6fOl7WaOGuIEHJy8ysn84IPJvVO4VP4QfIp4sV3izuSWCG0cP/X
	1LVXk1wBT6uianUh4/6lS66MH6B8QrVhYioNYoUC2ptvJWLXI8vG/A7S7igPK0Im
	yQZJtRCpvYyc/ivq1h0nRHQNiNUCFPbCTh/+0HU17sKCFjBpbCpak5cHDegT53kE
	7U+JcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c0sup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:32:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so4164985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764371; x=1791369171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=;
        b=WruygaGAb0DL8RpebvJBnFCq0p9dA2bvadk6O0890Q9Uta9mIR3iAK08j1u4BwNhHU
         BDhghA6ZgVr6gFrhSIELeJf1CxU266c+B5PzDLbGDb9I+vKwbVyFaibjvzILwRVMCLJH
         SebaqIXByd4/dmngAGrjS3+ClZMBnhSs1l4REtVLK0RxtmImRBXM6irA5sXxmlODyRnI
         L8pv+/1b+wCn9xEpr8Fl51889volJL5QD2bK4oN4Nuz7FsqcqXakFBvZ/jupAF+OqdMh
         OH1RvRGzV9jcx37IznOpelvntjB12Yy++lHywdxiWLpVTSY46Tnf3BDHSEtShMN9hB8n
         8dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764371; x=1791369171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=;
        b=tDw9T6/SzshpSLlS+VpwxDKt6fmOZyDKLA0j6muZmVwhwrjKdifoeoJVQ9EL3qdnZ8
         RNTreoKAb96w4I40E2Fwn9ClAMgkUWy+MQjPy9/Bh+eFVeDtCBwK6B2tbZttJZHtGb9p
         LAOvxdq/QlkM9F1qX2UdqJ2AZGmASufxUp+M9oY9c3XgTcsHp6cUzodm4o7WmRx2XzZp
         JtyUSAzbyhn1I2akLpXTLkxYrE5fcfiLLT664DMkz4SHNPrIqc0A6iDwQnDQViZoVuf1
         68fXXC6JlThIAPgXYBhGobPsrwVdTUamFnXJjc0AWHNL1ycrNvXjyBvoUZcQxgyv5C/T
         P4qg==
X-Forwarded-Encrypted: i=1; AKwUvBxueR2QkNo87YgmbXucjI4kufwFGip8pNUIN9C6OU3FHZP+yrkPocEdoyGSru9yoSW0bcSYPyvBSygbu7s=@vger.kernel.org
X-Gm-Message-State: AFuF++lFSk8e2xOd3xR4tekIqZJtq/JbOH5MPlinS4JX5jfaEp1ezNzN
	ZJcfbI5IdYs5r9vS6G+zG9CeFbvQ8i38ln5zxBjlrWc3yU2R6skhtdV+WDqUuWHyeq45cKDfXdS
	PlG0n2PqBFHqC57pbYScTbq7Y9rs/bXBy8SPhZG3IWXUm2ACsNz8IKYAdnvdEaPV/3Bo=
X-Gm-Gg: AYBFou3dMlcQrEN3Bpxb7jkhe9DmLNMNNfO6dHrv7vnyQ4oeOx6izkdPKj7dZVNGGba
	uzj9g4aV12P0itAHoy4pSVvRPzxOF+xqfHww8aKYbEbiByhy0lYvh/P6sZ/GBSY2Jgr2RFJolBw
	gbLIGTfd9v6+s0RuflMKy1tT0ZFNcen1CoNYcW3IbCweZGKhuUBhx5sx8BijZ5HpWnF5p8b6PIn
	S5BOqy/EOOoj17zmgqnjGWnABZsH8U/xksJdPsQAkoMhiKsuy+EzrZobi/LtxePjmYgfS6JlFC4
	Gzi9HgWz3IqZ4N+RbiGSM6l5Z7kj8KoTZ+fT/r4yCFn7ZbqC2shfy4MhOO84K5koxweGZe2DXz3
	So01UkFFzjKuHZkT+a0jwyw==
X-Received: by 2002:a05:620a:40d0:b0:93c:6a0d:762 with SMTP id af79cd13be357-93ca93365f1mr131781185a.0.1790764371139;
        Wed, 30 Sep 2026 03:32:51 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:93c:6a0d:762 with SMTP id af79cd13be357-93ca93365f1mr131776485a.0.1790764370645;
        Wed, 30 Sep 2026 03:32:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f7f26asm44710266b.42.2026.09.30.03.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:32:49 -0700 (PDT)
Message-ID: <543bd0a0-e0ee-4bc6-8988-00f595334167@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:32:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] arm64: dts: qcom: hamoa: Add Iris context bank
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
 <20260926-vpu_iommu_iova_handling-v5-8-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-8-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfXxYBYfkyyE44A
 2dWkJychScClxDE5p4BgFmsRxm5ssGEc3eVFMU1z3h+5/G8gmMwPtgAPZYrOfJtZlmtCNlR9Qmy
 Lx+EkKYM86bWm/lkcMUF+ON1sRnEsSE=
X-Proofpoint-ORIG-GUID: mwDfohzbnVtWbvUtQasKauzkGDLrfhtk
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abce554 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4BULcDCo1EIeXDFKsSoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: mwDfohzbnVtWbvUtQasKauzkGDLrfhtk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfXyLzVF4LMnCib
 5mhEncT65IjG5sqm1O3merxjgaYshn7oRM3eed/Vq8h6ivu0NYEIm5IN+qmZDhx23kSP34sjQlW
 kyQmYtNX8CNgPlSReZyV0/QlAjhfufxD9X4/QrkPIgeZe+TVnxce90ylL+N20uG1IdeTQEwK4Hs
 cT5n759pkKy6wb/hJNvApQV+SE2qYoC35czL3YRySMg423R2vU47y56PKbn+H2tYGroFod7HLZ6
 prHkooEZnOH8glwLmCLxH/TYKLpDemlQwQGEoLmwVWw1f8TXUPvHKDiH0QzWP9ce+TUgxv10Dsk
 UPXwnTuv+aq71SriE0fU/gipKgj4FAGMZi7IKmR/m6/ZyKfIG4r6tt2W/3Vly8XCn9N6IAfS9sI
 irECzmyC+k6NGjlcvzP4CN1Bl4YImdgl45eouO9bBx4FO4OMkQOKXUemwbZfBgwSpeO2V7Up7Gj
 SSJolYvmTyhLEwwWDOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

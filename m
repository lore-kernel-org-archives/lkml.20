Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DE14EC660
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970812; cv=none; b=KcB+gb/vBusEChK0FtEHCSRVvtVlHlcVrUAKqbL3HZPwfSH2TgrIVs3aGYKg5abOGOqoRFkjFFGnfpxwqbLgeLQUFdZhauXRaKZh90h+lnzhWpLfdAl2AUh2JFNjR8PPOPoFM8QIuSGaZXxB51+a4Nmgq91TFBid5MUsQnRx5l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970812; c=relaxed/simple;
	bh=51EDfJ3McB0CSbNJV9tRvd0LTlnNYRq8kN39WqIaSCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4v8fYjHihgbj//HKtrr1vrEZwK/GQA6GjLeLwpfxyBISrCJlHiLzg4+McTNZp6lsgFxUd8DVwuBcKJTaA73CGfeMaxlQqg5cvOAd3mvBgDVUj0AXkHaGtyoEbtlF2wqCwEnMu0jllkEnPzWXSwTIGaGgwKdsjz52zNmhpAzJ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKlubNWP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKLmW39m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKlubNWP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKLmW39m"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6Hru83103826
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Sfg51us9zTiOgc08N0134DVVlSe6YnZt1r5O3RNu3Y=; b=RKlubNWP560b5l04
	iznFlYW+WkYYdzxbkeYKdsCa1Rhz/DBh0sFxsW3W5XnRbidW3S5kEk3eHVKDHO7c
	ch/DJQNh7hqy1zgifyssTBjLKp2uCuMgUPk3kf5mJFdMGKs4XezSlSsy6nyylY0M
	rhOlAGqJuYW+bqkfMS6ddhvLY0AytY99XoFwDq0UvtK2yBmhNcrGtTScktYeFb+P
	U2OtDj5wb3OXFnRWHQDeaivQDYKUtgapAR7wDIKkbUMkg1koH3CKDNgYtaY7Qege
	IoMBGd44p0OePhIhwxMI5AAO5sfhBKauOkddknaiR4kAnRKkbRaCCQgRbJqCItQZ
	0vYkQA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9wgt2a0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:40:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917aacb7abcso10601876d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791970809; x=1792575609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Sfg51us9zTiOgc08N0134DVVlSe6YnZt1r5O3RNu3Y=;
        b=DKLmW39mgLp4bwERFmhQs5ZjsQRCNnrJiq/fTEmipbd0ZNZC79jLZZY787KemcROGA
         vhqPgyDRv82bcyCp4O9Cfn2Y3K/fQftX73jTXL+ZiUPAtlypIkh6IXYubNL/0MawCrgt
         mJP9/t9r4iUHgINNVeIE8katx9N0mKsCbCHegZ6AO6Oe97p3fokFJwXs2r9QSDQR5Yu7
         TeaVel0scrDZcd5cC/Mm4TMHac2KafV/2hDBo+9lVhvENeWHdjtxSAU5/Ai+YAiOVaA3
         +GI9f9D89m/ozFO9QngigMARyJ3kClMjRsuU4R8x0eNLEAqZ9uHACGvug96a6O23lTnV
         xojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970809; x=1792575609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Sfg51us9zTiOgc08N0134DVVlSe6YnZt1r5O3RNu3Y=;
        b=zv/TMeu/lFe0Q2pYs661h2hLl/ccgYuQXe8OFcf5KWm9tZ1BEwUT+XQP4I+CeOUM6Y
         b2uqVEsvpD5dcNrktdw8tyvCbyb+u/6KrDt4WIRV4vn1l758F0edZtAkVmS6Sa1THfHr
         Jza84xaR9yY5JCOlMAYdUQJ4X3rM7xOwh+XPNpxmYPDR5+Bwpeiofbaar6IhhxdIKoRX
         7Go147TvrGJvRg1m/P+xJ0nw0qtEmuXHBBFFoDB+vCJ749QWIcnJ/+ClO9uNKwV5fMHI
         CFVH/Ru4jS7Im1j/YIw4Doxx/BeMeEKZhwFIYw6SxLasSuFuk25/1l+iIayhnconv296
         xIOw==
X-Forwarded-Encrypted: i=1; AKwUvBxXaJitQiCdcbtBZdA6Oa+V1mfa+0jZfDIOCMuCIC7S29Zqel7PNqOg4F1NQz/E8lqmOmgI7MbsvBgE6T8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWUbw1iFCj/C43DzH4AS8jHxauh2mZJOb7ABBHhrGYf5olaZhG
	nxlYmGBSaLCdln2cZGT5FPpu6z7vY9prtFu/EkyJ9mfemArjWWH4ByeRW9lViy7oj18kgYXJGty
	YaVLAym1NHzTDnbj7RqkhAiH1XtJFj70Cv8MZt6acsxwO+Br4EcRpf164eZnFkgvBCAo=
X-Gm-Gg: AYBFou2mhe6cHGDYnVOhv3SZamP5lZ3wrPKGiR6PbO1tfs3C8FxAD7dCmhgTil9O9Ym
	8oeNzUvsI1dHiHLo9uHsQZmz7g7Pghinv7PzWgRsa6fEGRG3Et/eb8yuHpDITDyO1EpmIRtqNKF
	fMg1Ren3HrlPic+aVI9jCcpLGoxX/yDPYkXeRVabnWGae+eylwW6aV+RT8RLq//TrwLdZUHwd9z
	GOLfo5IFk8dCpkXRxB/pD9+Ts10/8cR8k48eXlOcQ90rf+dN/U6ZG0F6oVQL5MxheS/OBY47ajj
	mHutoM3bJnFm0kxyOrXYaHNVBcZs6kUzfHtZpz6tqcsj+ni19HfsZfKIOhAYXbJ2B+nzm6OV4Go
	bQjTVsK6uB+uMcmpJ5dPJew==
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr3020854385a.5.1791970808793;
        Wed, 14 Oct 2026 02:40:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr3020850085a.5.1791970808095;
        Wed, 14 Oct 2026 02:40:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a68c08sm682278366b.31.2026.10.14.02.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:40:07 -0700 (PDT)
Message-ID: <6df78358-92f2-495b-bbd7-3557602dc677@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 11:40:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Fix GPU SMMU context fault
 interrupts
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dragon@radxa.com
References: <20261014-sc8280xp-gpu-smmu-fix-v2-1-eaba3afecba5@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-sc8280xp-gpu-smmu-fix-v2-1-eaba3afecba5@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfXyBYauYRtMoju
 yfgbqE8ZKT4EBIkiFSyZIUqGmXftSUExsLDKTrbEOpFCVE/3CclKb2y5kr3hCEAnM/kNUF8r5nN
 ZeDQlgBBehVk5lyloKo1IyJXGP7qGKdcccAd6UywXZ4SLllYhyN2RMGAM0nmuqPLla0FbWjzqmS
 Ez3RLC90JQrRqcKrZjIhqfCzT/CN0EMc1ClqCLfT00dYfRaUSYfAMSs95ownrQnSRKaz1w5AnIt
 Pb6ghNFSLwTbvESj6GxE3AeeIEona2KbY1ln7zJj5jPtKkAcDTVjiE3giv4Lw+bxqr4vSTNr3om
 HV8BtBv+pzc2WCXe2qXv+JfYXQjYxPv3wghv/vNXNpdSu2pr6DJTJ0AePntdcCRnDfLjdSM1oW8
 fR9VqLLHkZ87VF/l4M5C59tmGXMQ0Xn17OgRETLZMSGJgQ+EwlyZe2oiEPQj6vtyyQeBlAmXXO9
 wI44rBrSbxqVjUdRxZQ==
X-Authority-Analysis: v=2.4 cv=Jp1kP84C c=1 sm=1 tr=0 ts=6acf4df9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=v9uaEyY1ARKJclbH3V8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: hl-yJk7jHwH0rtotxNOA2lYzEJKqfLI5
X-Proofpoint-ORIG-GUID: hl-yJk7jHwH0rtotxNOA2lYzEJKqfLI5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX+TlRnwTXltx5
 v1H1YhbeEUgbHucbB04lHzxILrSM/sN0viSCajbHns1yzr5mBjAJ8cllpSsymWbdHovXN1Ta9VD
 WT3D86SmgaXum3HGavIalgHYIEGfDA8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140038

On 10/14/26 11:27 AM, Xilin Wu wrote:
> The GPU SMMU interrupt list includes PMU interrupts as the first two
> context fault interrupts. This makes the driver register context fault
> handlers on the wrong IRQs, leaving translation faults unhandled and
> potentially stalling the GPU and preventing recovery.
> 
> Replace the context interrupt list with SPIs 680 through 688 and 703 in
> context bank order to describe all ten hardware context interrupts.
> 
> Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

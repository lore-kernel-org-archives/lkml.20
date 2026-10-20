Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480289;
	b=oCx46YPY0ksMaMPpcDeZjbcBjhgfSVQDhhwE6/Q7TalA11qb0qG1FL5oZxQqkmW5Occq
	 cffQXp5/qZaN7/1mMimASnJIccLYN+n/p5GHabifk22wGF1mgL8jH1Ed0sw2NV7aY83oa
	 Ax6ZOht8wKdKdtoKeP39v6rh+1q719MBjMl4QKimVikbn+6EtUOFurok7g+W6QLx0QzTF
	 SQBskDB7dMmalPHfZAnQzOyjSCLgKZjx3wTb5jx3c7k+TiqpbD9pg7FDCFArRJUx/kb7e
	 CUzhwBUaY8twhs2sTDmei0JWyELsKr4tz9CH2ctmJmwcDwr1FykqD9IBeyHqm//pT2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480289;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wTX1XPUrH8Y+FoYjz13zUU9//OlPh4ZooYpUqnx0wTA=;
	b=bYo0qzqyBfWAzyDdZzQTPNHEN0DzFLlGioH9A/ChuTDJPXAJ2cARqqXWOEqjh/6t6qQN
	 C7bwaIxWqV8Sz7J6O/tuYmGzVd1xr21aamzu80dN9b8m3wpGQIWSwJ5B4FcIDKzKj5hHe
	 jwCk7p/sFf3Mt9kO0bGtTAspN5q+z9RJMzegMwCwoL+KhF0As1d28QLmPS5sw7cRzfOOY
	 9SOghnAibA/V6oBD2gWjoS4pCWv13WDOamp72Q4Pa20KMe0CUfpphcU5CD/tI+RiXqxL2
	 chXLI8UnsrjD1vHv+EHlLQprqLwr6vUmpBMvxPecE6zNAeOHWdjAWyoZKblljQP9rMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLerq1Xf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evDz+Z51;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90344606A328
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90344606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLerq1Xf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evDz+Z51
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tFoJ2877939
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTX1XPUrH8Y+FoYjz13zUU9//OlPh4ZooYpUqnx0wTA=; b=fLerq1XfWL0LqVaw
	Ktqz+9wIp9AdPxGf5kZdqOdJj6h4ARs0mg51SqZhjHHJbom0WLOIMreSGHtGmb9x
	bno2pBWyH+3b+DKnUPt3pEfX2d6kN242wgNvc2h+Cw9CPPUJHfZx2vOvxloqkJgd
	YAcsOxVknSZ10CRZwdcWCA79VO6+oIz/QeX+yxfZliso3Cu3GqyvXoGgszgLeIEI
	g12cPBYCp6T7yhfZyUKYld/yS57OHooBztGXO53qMWlkuKWUg4lc4UN4PhDisVly
	EL56zvL6g8TQQWKmDhNHwQ3z4hgX7er0sKXTUN0X8uAIpsIhmWIvb0Cvw9lMSimb
	9FfV6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5psaea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:11:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so71959985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792480287; x=1793085087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTX1XPUrH8Y+FoYjz13zUU9//OlPh4ZooYpUqnx0wTA=;
        b=evDz+Z51PVZQCgJ6QR0OfOlawoPCURORf4Re5W3IAIYXIrgtdWkOe1qgbZF/8Vhe5H
         2PqPwF25Avx4/ZPmOU/yqMuFvJH4+PTa6+cuoSvQE6AOLp/7Sy9l2IkN53LfO9T9JHlh
         gqWHwxVQ1ImHLijlNVBhmPmdlt0UjGakZN4GNp5XeoKvPZkSlxz4iYDZYNT13Pwxzv1J
         7i2455Dx0xG/dVkh97ZVizQezpqDo4oZmEHhajkyyjg+b7vEA2KosnebjR6/IIEeJTNA
         IfycqoPNlx5zwFcszKDg/EvdhTLWm8GYnajF+SI9pKHqzO/vTyGfHdo8+Z8uXKYAdd2K
         9ySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480287; x=1793085087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTX1XPUrH8Y+FoYjz13zUU9//OlPh4ZooYpUqnx0wTA=;
        b=ugs62PYmQnVTKOzRZBQ1cXgYR3gNdpdA6T/yrDK7pYQlnSdtx9typAmpKSrigJC1WB
         BgZgh+O5aKSLb/aZgNH7n8TvOhSk40VKZRGuj6kb4Nw/HNdqeudjwILdmJk7MXCQTUek
         XnYV5sxapAxh/hs6+YGbfBbr6igpFOfiOH25VMIm+INP7Dly2Bh/oHRqTQBX8eYcPX42
         lrslt7ANDTLnk+p7lqnO35gm+O8nmjgXHwmIuP3RRuHmLE/dorCdb5xxjhcxBuIQIsFi
         xp3a72C1AhJq1042Ogo/XMyT/gcWy3gR79P0TzfjmDF/gN1+ggTpg3zG4nQ0NKXFDqzw
         OQ1w==
X-Forwarded-Encrypted: i=1; AKwUvBzIso8pFwYj6aUAicZ60gFfWWyOm9sBWvekUbmD8ga+mJeEZXbOfDIuKYit3YJkytlgON0dHj+45voEKO4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdwzi+jMoikeUxgF/NYngN7nDjE/YGz9daEbCGcV7keKEwcgi4
	iw1DOSwS7PWz44jFiF5XCkm32iSOgoQMdUR0kjvbVM35rg7rTdclg5+p8jORvRzgrkY4Pnhu4yx
	tPsNH1TWXB11sHMmUSSsmaaiIgUasdU+x6FSWqG1s4RYq2u6UifjfcV4cvN7B0MF3myU=
X-Gm-Gg: AYBFou1hfsW8KyaCULh413QcObscJ7EhhhsLy8EIkq+mEvZEeaR9mFy13ON7VnGlAFJ
	YTtByj52QyoWpwC3QjZ0eBZusNSnqyJc60lNJKi8SH7oNkuOXYKlbeNG9hQYM6V1SPCQXC7CBsp
	o5ZzPnUxCpCNZpoAqxePmkvK6BXCsrc+mAqr4xfMZnPxy1hfKnm8Tf6qH5OAzqBL06yWrFvjb+D
	ra2to+0SMKMG8BSKqWb0nVAR4kubJbuLZV+bd/rDLGxP/lrTfoICbAYOzkpLDxPN9XiPBAQ8NWH
	PjZB11Awrn3f+VF0pDD3zJBprVYDUNZr2PWy001i/uCXAoy7v06Cl4b/zLq8zyEr3JDkgoKUc2S
	9pNFFTIsCTjzyfD7cVYu2fQ==
X-Received: by 2002:a05:620a:c4f:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f29cf1ca8mr1876234085a.4.1792480286777;
        Tue, 20 Oct 2026 00:11:26 -0700 (PDT)
X-Received: by 2002:a05:620a:c4f:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f29cf1ca8mr1876231685a.4.1792480286369;
        Tue, 20 Oct 2026 00:11:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091fade41sm448370066b.82.2026.10.20.00.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:11:25 -0700 (PDT)
Message-ID: <c694383b-7a22-4cfd-81e9-0a06ded60393@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:11:22 +0200
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
Subject: Re: [PATCH 7/8] arm64: dts: qcom: msm8998: add interconnect provider
 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-7-c2da3934b6c8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-icc-v1-7-c2da3934b6c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad7141f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QbpiU1Sgz_2JnChUH38A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfXzkJTJPjkngjb
 xvhzzpyx/uC8egILVN+djwWmerP5ISsdZ0Bs1kUkB6Ed4Y5F4ITPE+EYz8C9wbWFPk7mWbgdK0I
 uqerRdjq9RMNAiSmP6iBO80dwOHv8VnRxYP8tyS2itlMn0c6dDETboN5K7knnxEwM3ZG1Fovjml
 LHlGLQjPM0aZLZLwvQn1Is4htppo/GA1U/9D97afhVxZLMH6jamo3GngOpgLYsf2KKyghLNsiXl
 YHaV1g3TF2vlBdcCR23/LNvqGxT2Te7b9nAXxPgaHCq0VhZv6r43VikmzmJ/HGBFwkYAstd0jb/
 Rrh762ISFUYVZQwlR4r4baKQou6EhQMtdPjR3xWLv6i+rDVyKAbfHyQuGPR8Vn3Bkr7/n9JR/gN
 CDJ9vqHuu6uicSuCo+htGw4TSGT3R+hi3S80jwcBmLABC0nlAass8TMEsRhJ7Y7BLXlrlT/Fou0
 wg+sB5a2g1gfidKvkbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX0WX8vl9x2lxE
 KFQ+tA551HDA0Gn9Yrj6lSehGO4u16HjOMfRxWyQRD8htEuscqNX82k0u46PvDq0dQHjgZLqMX+
 GgwqA/3wPKLB+3kv+CpdpjEeuJuqae0=
X-Proofpoint-GUID: queqiZdNweGH6OIfDZv1PBSrmdl8kFJT
X-Proofpoint-ORIG-GUID: queqiZdNweGH6OIfDZv1PBSrmdl8kFJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200028

On 10/19/26 4:12 PM, Dmitry Baryshkov wrote:
> MSM8998 has an interconnect provider driver, but the SoC device tree
> describes none of the NoC devices it binds to, so no bus bandwidth or
> NoC clock scaling is possible and every consumer that wants to vote is
> left without a provider.
> 
> Add the eight NoC nodes.  The AHB MMSS NoC shares its register space
> with the MMSS NoC and is described as its child.  The A1NoC and A2NoC
> register ranges are shrunk compared to the downstream ones, which
> overlap the SMMU and the MMSS NoC respectively.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

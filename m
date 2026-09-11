Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D576492E58
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135178; cv=none; b=VKpo8JSibeLkK0SlpqdDXcBMzp5sDpI3JvoIJ+NRTlHjgQY0EKyV0ccLsYbOgvQ/IL6tzJ+x60ZMOiwhMGj5EawVwGcyIU31HWFI+329JJQDoelcQo6hQlSqWOnIb7ZB/5YlHORHiIYMBpNypKvAPXh37BLiMpS4kH7AUdDzm00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135178; c=relaxed/simple;
	bh=Cfk7Wf7OJL8eydsCbFx6AkcZQNkpsmWuq6yeNztYobg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gG+e2riTexeEcrlZpkvNoU7Cq8i+3emuxIBzba4gHnSCsxwSAwXYraVGF1Kufa3cECYcQOn1UpzCJtSkvMjGrEPWKwZ2/H3EUKe5E8xFEe0FWSjBmVMyyaXAScGvY5Wej+v/3cXr6gnLGfGBrGBSxYr6d7o9JvWAB2Q/+KkTKFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EaxGx1fC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JL2GMymU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EaxGx1fC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JL2GMymU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjJEb4040984
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LDeCS3eZuekduy4ndqVJ0IHC
	QIxJlJj9sTDSGZEJfYA=; b=EaxGx1fCfdvGuDn7PdQ9L9mqLg1PORnK0PQemO8K
	LPw+8kujUEY1LyQTh+sMHJCs9pj53r0H8gAiPir8PScafxsDdMrOYvoRfalUvuyh
	FJSwVLI2y2oNnCZAttJNWgmwk1/Dt5oYU80ZJ+iaiR/FapS619+dW9muhGmsiS5D
	7EBj2RGKFpxcesk8KB9y+Bke3rQ60w3Cok3jAaLbWdOqwU+VRVzS0cuxws02+b8k
	Yjvb2PKFAIzqV6Bi6Qf5PLKUPR+4l1HQBfsvYvzIbVFNGF1ou7NjPlEN3uW8yP9k
	85PFDKz6sjvNhxyEEGmvdqG4aTaWPPSMzx/++0O4sPTvyw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2c6u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:59:32 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7a31f3af5so318366e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789135172; x=1789739972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LDeCS3eZuekduy4ndqVJ0IHCQIxJlJj9sTDSGZEJfYA=;
        b=JL2GMymU0zd3k5RbyHvv4MTVa0WFy2OQtrbmLiOQbTAfTixsswr1ybZMTcDgo3iz//
         IEDCvAhSKX47x66jXolYhmIE+cbRtffLNSNN0fj4GaIiQLL5WM8LaNY5KKSG6mDDH7ZJ
         XeUpjUOfKluWCxdTdrudnlINDZlSpdX9F/L5hrfBbrF4GZMH0B+YYNT4DifzmuiR3lqQ
         oc+voHsXheBum9i8Mrpg2aEwiqZSuePBWHcNvQWkfkwEEWteVgMxkblMWG2hakXbgzBU
         4VoyMtjbMXDPox9TVnzBwcz0dsMsla4D+uQwJ+20BlktNQXo6OEppxiEs0ttyD3VY1bw
         B1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135172; x=1789739972;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDeCS3eZuekduy4ndqVJ0IHCQIxJlJj9sTDSGZEJfYA=;
        b=PRXGo04u3FLttYuzCCUy+4W8DxHxz3gL5kSZpMM5m0co8cXlG8cWGqf/WArgkUNy3N
         jye8JMf+DUCre8KSpk6ji292hln+xSr74k6ypD956T+VFGPdsulUV9LRaZ7ruOVeQU21
         S0cG0r1XaM+5Ue2YesTzSTJGtuXyMWTW/fuYxQ9ULcSsJaXBXmUs9yTMZVOZKRjR9OO5
         AEjHNnoKGyePRzcJiYh0hJAGqFdwCdJT713RG0VMbij0UBu1eslfVDLVkO8gPyPufDiD
         IYVey+P+idKO/OxZRbiiH+F13HJeN3nwfZLnzvK+TUjgV08NtVpklPPXov4GCZWtihGb
         NKrw==
X-Forwarded-Encrypted: i=1; AKwUvBy7KS8+zbVamViADIxhRi3EbJHB4Q4sPt0dvPXZcVCy8bAjv4TFu+DrdbWW61tEVwMXLy9cwKhYe7Gq9oc=@vger.kernel.org
X-Gm-Message-State: AFuF++mfOGXpkFlKZniNXsrn47P+cAk2S2G+am3xirptBNfP0gfETPVZ
	mk2isGQLZsFxTKDcTkALx/9hX2tKH2dil3CxbZK2WHepxsETspcgmZielm0xkExcdScXg+IrWLn
	JlpSTDsdCRU+F2oxwNV3n0cgoEHQxzLZjeuur8fCXqvHAtdM2enuAiyjJJq88I8iLiVFVxdllby
	M=
X-Gm-Gg: AYBFou1Uks9trqaIUPh8jpaLN79zAXe/zJxqOZiRfGwM+yg4mUt+n+BbV1/xYUJNIU6
	/TcQdPhjEJDue8jJb33NWVWH8+WJlKzCjy0LLHOQL0VPouPEqVnxgBUn/EWPu6BgPH3SKtwspI5
	/zJ9kuTh2X5tsIxbRkX+QRvluaUsB/H/BpZjWH8IoRiRxA7bjj5FUfvvtNWapXe+jw8SBYUwXYv
	pRFL6o5pCRyrVykiOwDUPnUj3Q9zLZCDZEYdzv+YCDiaoCtgFGNLMlArUs6E53hqvgGhBzoGIOc
	RlE/KhIpetEdXISgp7pP3myJKLoU9i43fuS323OWlBTYaAerZIkgFm7wKA5xoskauDDh9aSDaB7
	sSLSOa0Pg4q42ThM=
X-Received: by 2002:a05:6122:3783:b0:5c8:44fa:7230 with SMTP id 71dfb90a1353d-5c845f4e527mr5860239e0c.2.1789135171536;
        Fri, 11 Sep 2026 06:59:31 -0700 (PDT)
X-Received: by 2002:a05:6122:3783:b0:5c8:44fa:7230 with SMTP id 71dfb90a1353d-5c845f4e527mr5860159e0c.2.1789135170931;
        Fri, 11 Sep 2026 06:59:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm5985011f8f.1.2026.09.11.06.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:59:30 -0700 (PDT)
Date: Fri, 11 Sep 2026 16:59:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Ociepka <greg@ferrisoft.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur-asus-zenbook-a16: Remove
 RTC-through-EFIvars
Message-ID: <2jtbekwtmzi5zot4fmxj5goaw6wznzgxymx6xubc6hk73yx3pq@7mk7agqbyv5l>
References: <20260911-topic-remove_uefivar_rtc_a16-v1-1-0967d8d4b3a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-topic-remove_uefivar_rtc_a16-v1-1-0967d8d4b3a6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa40944 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=a8UEx8NLAAAA:8 a=EUspDBNiAAAA:8 a=6ODT9UzxMjEpfHFhlBgA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22 a=-yeuc7zBjbfZT8aiaP-D:22
X-Proofpoint-GUID: AOZdcSTem_JsHURu2PC8HtAk0UTgOs-Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5NSBTYWx0ZWRfX+40FSBxoSMix
 P6HZji2//0hiq8URku6HH0Wl9yaiOZKVaSFcCJTmngq9dzLFBHSXDp7aImLrKo3XFlO8ijRYQJY
 p7XqX+C0X16NfH//ba8xuRqH6dxoF4s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5NSBTYWx0ZWRfX3FeX1lYZtuRe
 1sGzWn5Z37AuzYdP6OxISiIfBsu/Oti6EgJXp32nH3hmZ3cvtSZzJ51qyQJS8kInYhmhQ1/31BQ
 7bfKTSDDlYXafv2Ox7UD6Z9FivF86L86S5cxn3M3RKV+5tUmC2thryvqCkKOwNX75iZ1nsU/8wF
 iZIHXDvBUWMf4zMv+eRZYTB5J1oOiLleTsOPULMLjVVpiAT908dCeicV5PQyNQOntbeAvFnc4Gm
 CP5ZpMAXiikBB6NvcyPjn3wyuM8Fdxi+QMLcF+zvl/ck0OQZgRmfHni9UBSP0YqvB7x3J6aEeBa
 argYxRGLF1RhAcIdfswOSa1XIGYYa6Gtsldb976oohjq6T3IXXWFiZJanbvCZ9olGRZqTtjA7gU
 XcBcwkYT3Wj1FMRoiaf8PPmBSFyjrAZhBICql8RN9pKz2swSZ7VTTVuAMJ6pWy98tSAM9TigQxh
 EHLsmG8V5FyzUbpuWEQ==
X-Proofpoint-ORIG-GUID: AOZdcSTem_JsHURu2PC8HtAk0UTgOs-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110195

On 26-09-11 15:27:03, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This machine, unlike older Snapdragon laptops, doesn't feature an EFI
> variable to denote the system time. Remove the property that suggests
> it does.
> 
> Fixes: e8fbbca94db7 ("arm64: dts: qcom: glymur: Add Asus Zenbook A16 (UX3607OA)")
> Reported-by: Greg Ociepka <greg@ferrisoft.com>
> Closes: https://lore.kernel.org/linux-arm-msm/20260821181148.1642208-1-greg@ferrisoft.com/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

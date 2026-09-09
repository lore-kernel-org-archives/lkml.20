Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5833C53ECF6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956257; cv=none; b=OLMFbqwRrVj+sGr/JxWMdLVTtvhdF2Yt3xV2bgLqzV316KLHjkz/sWCUPP5eGjcZbQtNY8gLMvIaFPMDpasGLUtuWM5qr6db+UqPK9PGrV1K2eUZZx9q0/Ow/yDY9IMnbGfN/ptxesGhLXdjj3VvnvXMvWwzM/VNImk1zHSMskA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956257; c=relaxed/simple;
	bh=bXAgZEEwtA/jkRMEdLGdUvl1pzruPAiUjgoVTV0DKWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4UVv77+x6k7dYFyf/KRm6o6WACiEQOCL19SeReyMzF/jHc4nesGNoyrzKfWPwQZ0EMruajzVjKzB3ovYSdh9Efz7jwSlq5DLDWcP57v2IGmZpIfXuEoFxCwirhjZbDFjX1UQk32kbxmP4tJPDeQijW6j1Wugn4HjIKTM8B6/ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nfS9ydQ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJn1yWzw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nfS9ydQ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJn1yWzw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2D22019091
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jw8r91oW+VZku89S6mMUhr2xWMOiY+kuCAJf7oejI2A=; b=nfS9ydQ1+Y5bFxe7
	/qpgH6ob9X7llIkWofVSYZ/zLPn8907T6gClj9B4OEFaXZnr8GJUXaK0pHLhug4+
	+Zv1GzrgdQ2PdwsDqvsVrfydmv2USvmjGvQcWGYtzTYTl+JEdsP3ULcgDbLfkoMz
	uHC//EJUDyvTpcSJ5DTSGLoEvLWZq7poFk6Q4ljN0JHx3kR8jhv8ZNbrGsMhTRBp
	hfnPE205Ku0IBDdrrNAMv8gDT1TSj6b/ZMxzma5K/X4i2ScPCQKEIQgvWnpm+SbJ
	UDnP6wnFNcqTtbkaXcvE7Hg888vrC7ZSKYnaDVDT+e+5aD7mcvxKTPDnU2zJ3QXF
	jxPvOg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x89nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:17:35 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7530aaa7212so170067137.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956254; x=1789561054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jw8r91oW+VZku89S6mMUhr2xWMOiY+kuCAJf7oejI2A=;
        b=bJn1yWzwiuRTvFzNvZRdS0zE0bgD2ZqXq3Tu45SkPQeytFW39Zf451a+mFMBKWEBvB
         Nr+SW01dEI8u/vV5p7trvX9w42Fn9svCXy9BXb2Otx8F3kAbotuq7pYuLPU8DW8ZhB71
         ybsRcw9QeUnXo3GMeBEvMuvqnIYnXgTdyZE//M+fA4AicIYHh5pPR98nW6DgoTcSIxM3
         aI/TQPx3MsH2LBB7hzKFC9xEaKxrVF/y7n6Xs/OF14YrOPJzu+SkxNVQm0fArjnUJSKz
         +zHQLHd6KO1uhpKUvAxt09c4s6qEeKauRzdQFRPi6/QZ/feeehA7KjirtD0iJ1EsMFA0
         2nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956254; x=1789561054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jw8r91oW+VZku89S6mMUhr2xWMOiY+kuCAJf7oejI2A=;
        b=MvEibDMlzJdKid4pyW791o8zjMryS4NSEPZ4mm7kkElI7kYFnpkRG6AwF+Gcm6SH/W
         xtx96GI+sxdCKEsg7VpycK1BSpY+7vNm6PV1ePr8SklyJXGsQYCaDIRqnO1mvf/ycjFx
         xBXCKmAZVwfEU7Tcwcdq+OKfKvVS/KbpnYqP3DLIP4xZHAOtvb6QtjJHsFGRQF58RQ9B
         j9K+Sy35hbmOwACmdOfLlgzCkOLrp/NkrUhRfiuLJAr2SxH7Atcq7A8avRmE7xGJypzH
         saXzbEZDa0QMEOJ0g5QuVa7rF0owpEL8uGmIjkMR3zUBzsT2OckKgq1zKfz9jqFsIRnl
         8K4w==
X-Forwarded-Encrypted: i=1; AKwUvBzMx7v5ecb2x6BAk+a2VxSKXnrlfiMxddIXRXdnliNy1pwsqBHSN5oP0OIWs5QGn68BEoGDFVYf4iCB31A=@vger.kernel.org
X-Gm-Message-State: AFuF++n2EIT712n6BfpTiNgOepmvwIO6d1G2ZXzf/1+8uk3CvMiBE+Ef
	j+DeeSRWVj+MKeE2EDbsARxLLMsTTD0RKytGMdbyRE2ZvOzdHcE5iOsnQxM0orbOGP53C+c1R5t
	egUMdmrrqp9/m+1tbw+HBWLsY1sKc9Hj0H79KofWaA/ygP+EYbbRAvcAnwE8r6Z4do0c=
X-Gm-Gg: AYBFou2TMy/tgS8zla5eYaWLKhHxAfgvWVufZvmNzf+r00Ld6PYT8edJq73JJayMKkx
	RTtc3hGWI7hYgt8lU2gIvoSXbfHPvizxzp11EI+v/x8tKOHwG3QFWHqNb0xhoph9It8xn4NpNpk
	4X/4VoYQrGr1AqkZBbrtFud5wYrr8Y26Y7/sM1MmzsZndfEjN4VO0Squm+dMTSus0UcVTRLYzYi
	qiHb0q6hgL7NTAM9I/qaAJP77nZqiiWkRw/bjQbjZ0K82bwDRYPDAtgIqv1re6QxM0t8VEYwHLM
	KR4dklrkme+YcI0wpVHu16Pi5MLhUxdrCPxKNJTACCp31g2qKk84P6K5cyP8wbx2Ulzt+QkxYW8
	B7rDnCdAJ6flz7pJX5bDIzA==
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2553360137.1.1788956254510;
        Wed, 09 Sep 2026 05:17:34 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2553349137.1.1788956254004;
        Wed, 09 Sep 2026 05:17:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293ac38ddcsm49873166b.41.2026.09.09.05.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:17:32 -0700 (PDT)
Message-ID: <e382fb22-0f95-40ef-8a36-afb22b3d79c6@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:17:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: Add initial support for Nord
 Ride Embedded board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <20260904081619.593602-7-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904081619.593602-7-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX31ANmZXtlx3k
 rPDygLpK4humL1KWlg7bvI/tJ+/t5dpauHmmdHJ6pt/2Pqdi6y3kUVETd94zO4ztdD+fZN7StJz
 M69GZ/T/Wy2vT0Rr/JbpUNsscY/aDEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX1SKYAfUaVLR6
 MJtknSoPBvtnmKwVvmoyvZVF0p9+qW4N2gOpHMqUw1NOW2qKLBsnjf7RFdxQA4mB47TgnkcWzXK
 MrCE63Za9caRoIIJoBvMH6GZiw9k3D8wNalANJfOUOwVdWWNNYnrQB2XNJvL8Uc2C1cKJ/+ut2T
 SSFgdtzNfClXrYlc14t2E/zzStcPvrjQVGSmsPmYnKgEEbb4RTDDJ6WZXKj5v1oZf4fA0p7WaKX
 kUFN6fhUToFqxGr3vX5XnxhGNu1xIojgQRQ9SJC4btbqujFb5dBQ9Dh9qmYZldT1LpUnEb8e89w
 J+EyF2WJNlCM0gM2qsnCl6jW4e/D9fSgp6lfDKyZTE3YMgFRDGym9XlLw7q77aEUUuUG19NpDWh
 RMmAvz1J/9a0n4MQINbrzR5Ac6flqKqQ/u5jXVgbq6FsYhYaShEjufitGKsjvfqk9NMHAchYXhC
 ISKXLjSzS9gVSdiwqUA==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa14e5f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=GJqCLuEFmrbm5pLexBUA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: UIGO7KTtI7iWroC5PBhuVp9X4GQeHAaA
X-Proofpoint-GUID: UIGO7KTtI7iWroC5PBhuVp9X4GQeHAaA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090136

On 9/4/26 10:16 AM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the initial device tree for the Nord Ride Embedded board, the
> non-SCMI variant of the SA8797P automotive Ride board.
> 
> Enable the debug UART, UFS storage, the ADSP and CDSP remote processors,
> and describe the board regulators supplied by the on-board PMICs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

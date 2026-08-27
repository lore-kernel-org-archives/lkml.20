Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518E730F543
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787812933; cv=none; b=AoNlMjEo1vSswo0Od7/v2uLcYy971YV933tz4SzCL8QAOp/LVIlMzKaWeXqEXvTvwYd3E5j33kiC50WVMzYD/kC5irypXWVm/3qB4m8xiWZtOY6ibbJwUaNjjC2YZwkZm9Liujk5NzBZq0X6SU1Sw9c+ycP+IIvdO0v5XeZH58k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787812933; c=relaxed/simple;
	bh=VpRfMjkDIVgIG1IpVnvWLbUY77m9BHwbtWthaup4Qr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2Orly+lRH3BUXCC1ez/g8fHBeNkzap0xhigIuHoxA+Qsv5g2VSjLlQUVP37mC9We9JUjUWvJv4GXSymU4jkFHk31I+WVtKDKHw7Twf+ojSJdCyBGa+FrQBQVyRgv6p0u6coRoWc9Dq9C3QZGo33VqCECRLR9GezSbHED2jCK0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxBIQfcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLT9JVAM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxBIQfcR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLT9JVAM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6R8373257821
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ShQA2gHtvOv/7C4MRutuVhaIXxmOVy4BCMu2y+jIWc=; b=LxBIQfcRVtlQdTrO
	UOJQyP34Uz5/HuqMwLc0TRaw9/nYqDj5/YaKBkc4CAryllu5s0jpz+LpkEgeU0b+
	M7ao4WkzbCSvIRL6VHELrNKYjXS8g9vEjalyqDHEk1TdJVmtUb9RRtZ2NEnEUpUx
	8b/4aQA4wrY4Pwq/9M0CpiZPofrYncG8HHAKHjqxCcHPxdGpyRdBWZ2D4orhxsy6
	IHxW5I7KPaWy4yoxlvAYKqmfHnJW3DCsNbkvsC/ZH98zeJiGj+IiDJLaTWc8OtG5
	JL6BzHqTB5ar3VGPYWw1xlcvATeYHdyxBlVEoiEm0LSnTRhORWghymSku2v/uTKl
	rRYkbw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4ecac7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:42:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso1816004a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787812931; x=1788417731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ShQA2gHtvOv/7C4MRutuVhaIXxmOVy4BCMu2y+jIWc=;
        b=MLT9JVAM+c7tmAbZa8q0+CvHdFGq/Ka6efIlpSbxJ7XfIqNvp77A646kjOW75vxhUj
         mW85svNTamDLRhRtFgnWsFNA/AS4zH0CSBEQdZutpy5b4jlpQJkXIhwBHM/H+t0H9SZ/
         SVSdYIqWauTXzTQWMgxP2xJRkSlBec5r/3HbubTGmJprkqOhtFUsJeK1Quq/rEb87BKt
         wW3DL1WaVz6wkHHIrjWqBOITVRUtaNnisOfa3bTjwVtqPuXWVcagKNVS7OXoG6hqVzzb
         DZhqaEWghbdWM8bnhM2q7YhNujTVPS7owUM+OE1276QCfsF2ZCyEbEUAMUDfVj+ioRmU
         h6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787812931; x=1788417731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ShQA2gHtvOv/7C4MRutuVhaIXxmOVy4BCMu2y+jIWc=;
        b=G177ecvePFrbUT42ROurodQSfjeAsEIKz+Aa00X4mi0N53H5f8vjQ4qP9BxN78EuXp
         vUI8dzrG8sy4rbSjdtBASCm1y3aqDqnVWtD5oLzLWhmdDhKW7D9WT7cruOopM4haqK+M
         9kClhzhAb3/gdg+OUgd24/IvaUv46xiKwvpansbVnQZRuGAViQ9WIjUjQB9A4egDkuKF
         nQ1h4e54hpwNZUjyiLw95gQx0GR3ZJvRnlrmKW6zbFLkoopV0gKHj3CTxInlc9j8exvJ
         3euxFudtpZ1Qts1Z2nwLq2keGnE8Etl6crIsi0vQWJAhrMgZK32/tJ02DkOMx9p2YMBv
         jMZA==
X-Forwarded-Encrypted: i=1; AHgh+RoK4kcW0cvsU7gR+oy7WNr41hFVeDRkDjTtVXYewm9nCrAQtLGwTMGk5nHgKl+AWigqWNyXp6RU/wGV7sE=@vger.kernel.org
X-Gm-Message-State: AFuF++kl47rWWeZd5XCXESjqFanGsMrAV3f0M7cAKIbynSwBu6gCZ9XD
	PiBp08+EEbRXgTI4vGAFYZimyDphomsvJRrhYCRmHKKZb5WUjcedQw4gh8F4rIRK8jkO9a6hjbB
	LO8G/ALQcONF15iZs9V9keya8pb4y6M3DFt/oiWbL4dI+ZgyX1tapbXd6T+e89eynMwQ=
X-Gm-Gg: AR+sD11t7wvL9Kir9o+Qe991qxM6qjBYA5lpXkRjj93I3NEBZzDTKvIU5ZbVsFnVwnk
	FCCg/bcbUFeELDXSObOvK1mMXdTbMvLysuYAqQxVFZhgWM1jSK5FqUuGmDVAqH/er/+aua05+r+
	v+Z1n5tGz0QrctnxklWzX+XK/NsJB7T83QbmI87ZdU6cc1LE6FxoeQc5IeIak/0oi2uUNkXHh/K
	mzE4w291lbmfH9TeE5Km0k2Goa0EhMmoF42SjwETLw59w6us/H+mQpiFLot6Ua2kbvk9VHLxsgD
	ZeHiiZOTZp4Piu0+qbabZRKptI+yqFPhIIMzeQZdJr8rIzjAHNW4+PSpGDwztDyYsILyBPudWMf
	FNifqX9QP2pn4kM/rU8SMkR1wv5V3RtM=
X-Received: by 2002:a05:6a21:4593:b0:3bf:9b61:f7ae with SMTP id adf61e73a8af0-3cf8413dffdmr28629363637.14.1787812930915;
        Wed, 26 Aug 2026 23:42:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:4593:b0:3bf:9b61:f7ae with SMTP id adf61e73a8af0-3cf8413dffdmr28629279637.14.1787812930531;
        Wed, 26 Aug 2026 23:42:10 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1bec80fdesm1693669a12.24.2026.08.26.23.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 23:42:10 -0700 (PDT)
Message-ID: <167f6b2b-a838-4563-99b3-39ef8077ee9a@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 12:12:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE SDHC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KIBqylFo c=1 sm=1 tr=0 ts=6a8fdc43 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-W0wxAWcNmATYll7EfoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: BJrcdG5H8mStvwuk7v5U1nosIFMcKY_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA1NCBTYWx0ZWRfX3i98KLYirJjK
 eUMKRqkf3NO6B6draG2OPImDq+x+9avVPA9dM8JP4SvRhky1eb1CHLZr35PXr+arzpzfePE2aRX
 R3la5AkS+oJr9PWhTbEM2WO1GgCLVuLCN74SQI9T7H95HrQUPUV80AgGawrx9hQ5hr5W73imMsB
 zZIX/HuDlikn1pDTjRIUuGE4exxyn24lHltNR0q9wuj7cUJVAA7c1TtA2KpAKeMxQ0F8cPoN+87
 jWgqleEKGds1HQuVRYtTsZ23D7WYKO9NcqGO1J2TwfG76Wtk0QkLj/iMZ01kTYCNK1Y3YjB3ZNw
 OXEeKsCowFER9Yg89jXgMMvS/gdZEDC86jjgLqtmHK2OLYz4DsQ80AZOWGApRPn2wT1+ttPQUYg
 FM6dNwYIQ64gcXFXNvjLwJLvOgZuR3lpx5K5KWLMO0wh6X8lEX0WgWiDO8H0LqZX0u+rRSyw/Bl
 i/LajlqfmmKgyjnuJNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA1NCBTYWx0ZWRfX97IJqMJ1t+rj
 6Qg+anbeHne7iBbutIdaNqe3X3mlke4o/JsLCXYGxj7VRD0dxxiBKLyK07ZzmOJSNSqIxxoQ9Q1
 kzclCBWWwb7wy9S8D2ozjAv91qsUFM8=
X-Proofpoint-GUID: BJrcdG5H8mStvwuk7v5U1nosIFMcKY_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270054

On 24-08-2026 01:17, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE SDHC device nodes for Monaco
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


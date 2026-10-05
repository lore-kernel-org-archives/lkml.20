Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E54189B9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191212; cv=none; b=CHpOR5m7vO/8EIVaXdklBH78CE2IgwQF88XZV3NGUcza38iQZ7vT6XYRosQJDrRAEKqUUIYOchNuEXBUFrHaeQC7ZzTamtyBNAyV1RB/NWkBX0VTKo57/wEX11UkoaWMtTv9zjAcGqVjXvwKR7RUrb2WHc6CwA0v1MaanTGtxjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191212; c=relaxed/simple;
	bh=4h6kpbjLFRnTGCOP6FLTdm/2YUwHP5uJ7+u4N1dhcA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KkTOTbLIidOKajzlVgRo0jtM7cO7C3qs04iLSuI597PH/EdoQeRTYgtoXq2YnJsjZv+Yfl+714dxANvUQ9PrHI8St5y2vDI/Jz7ZFVzHerNUfJq4pOMsuvFO1ng8ZhZTCwPbuBY+vXl5VW18Og/ch3yviGgJHOqVLjhfccW8oks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGu82ZD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnuMxzf0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGu82ZD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnuMxzf0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xX7l2472538
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 09:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kNA9wVjQ7WyzPMpGzB4L8YXM0jvLodaFmlvxSYaCxEc=; b=fGu82ZD/CUdFlJbd
	II6not+0F1l79vXmLvb3uqOIbMlvAftxdUhnIhGCihdyxiymy9PYqXoISG6MWNzR
	LXAb1R2FlT2r4XI800pITORzxwvbfrUcp//semwCyG20/Ob4mmrVCQyP01twsqvl
	2i8s/WlU4TfNs0rqMy0TQY0jK87TfVTUA3P/q/qBzHiw4NuJG1yR2fXQI52ej3QX
	Z8jLVJgjWIlSyB5apg5Erwr1mfcwHpOaamTFo3itjhobmSSjv3mOT8ygu6mde4KP
	VWuWdhtWAD+RC+ZzFDZQP2DBoxl8Pcit3yDMQhif+Jep2U+GXT3B4fRpW6HbkMHf
	gcgASw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssn59h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:06:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso1022480a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791191209; x=1791796009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNA9wVjQ7WyzPMpGzB4L8YXM0jvLodaFmlvxSYaCxEc=;
        b=ZnuMxzf00o6TEN+gHlkStfg+joP/UXmk3zWIyegzp4zJJVJxOpGUbV88n1vhBS077p
         pNJudIHuRT9eNXIlpGzRt6lD9bqu8KpcLHOFZU+lUM12cLq9v+0Y4sewxs8Hz4ZQm/4g
         WNf1wi5tlJok1ZjlDgG6gZ6YRPsWOJsbhpoD68mNWM1israqFtLI+GKTPhADq/6FMIzw
         CgByYrEcyKGpb0Q61QLwaaKfLsLAAHPCJbkggXH4OyhOYWUb7Z3Wp5uj3k8rUg4SuJhM
         QrF5q+UstkVi8L37bEIFj9zBl8jQuFy7OIIYwDeLQnq1rTKPcYrwaxwHQtmC2e8qRwks
         z3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191209; x=1791796009;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNA9wVjQ7WyzPMpGzB4L8YXM0jvLodaFmlvxSYaCxEc=;
        b=md27wmlpC9kt6QxAnD8mQeZmAuKTN2DFTbe/WDsyu4TJs8Z+5tX1X4m9mo6ku7K6Fq
         /B82WeUyFlFBjOWlYmO12ompyVw2JcZdaNNs+GHlljH61aPOaPQGXubKAxi6LykD4ig/
         w68RDIJdoIhAMsIa+vxkbpkEKsaPAiVaZoNc6MIMojgc2HPDU2d6HORmeQzYId0xK6Hv
         YgRC1RjSM7CT3MP2Kv9MKOlktJTCaWid0QQU8gYV7t1vEKt/Dd/jnoZCZPSCM+FVHnXB
         FYdS+mjN2QEqhipxesPqQJOKhkIDv8d+5EHwJ8kRF1FwpBV1/AYAs+IsKUsOY8wMzvTe
         ypEg==
X-Forwarded-Encrypted: i=1; AKwUvBxjgzCVEK4SltRtD1PnorFVgL7mFDoyvaOkeH9zEj8TZpu0GtoWbToC2YGJDdG4aLW0Wi+qW6vj455bGCE=@vger.kernel.org
X-Gm-Message-State: AFuF++mGXqp5836X05wnx+KDUiethIBpCP30a1GaTDn0QrH9b7dNt+C0
	CmJohs4Pl3BlH+HI0IysRdCWqDy0AbOX2IQEEiTdbBfS5PkvF5Y9vKTXOHm3HZyYnB8W2loEeD0
	mwpdyLEJA25ffl0jmTxhwp/yClFBed6QZXLDqY8vmPz9dTre1ZXG08LMy6QGnsPgWp3U=
X-Gm-Gg: AYBFou0Xx3RoQYZFhiG3boW8TRKjPfQU2GpOs17HQOC8ypM9WPHg/2jPRWNIOldDvcw
	nweF1KJ+RE6RMjSUy8VrEfAHzXp9pBW1rufEdYVAacsAaI68ul/HvLG7K3rPtR3/ec/vaMUQCFn
	3NiWy0H1G5L6sMTISRoF2m40CjFHGSQtt1tkorDus7wyQbGKqayTpSe13Cc3MR3COQwvpHM2yvX
	jwWYKHVoGog4NOx632kg0bDmWFPA12JBJjwQYCO8SA2OMtdYV6m4R37pwwdb5ttqWgz5AOyxPu1
	vzaYj+s3gdSXZ+QLZcsJdSPHJdAQWTsq5b1bu2pDcGYGUdmgaCGSn4FJxRrmlpwefJ6QiXPeSkK
	czsTnIYPgfIEmrBo+a3dCknJ6q8yCiu9j
X-Received: by 2002:a05:6a20:94c9:b0:3dd:a197:cf1b with SMTP id adf61e73a8af0-3e0bd44e649mr10349816637.63.1791191209214;
        Mon, 05 Oct 2026 02:06:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:94c9:b0:3dd:a197:cf1b with SMTP id adf61e73a8af0-3e0bd44e649mr10349777637.63.1791191208766;
        Mon, 05 Oct 2026 02:06:48 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6e5930a1sm481861a12.32.2026.10.05.02.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:06:48 -0700 (PDT)
Message-ID: <f274cae3-e7b2-4976-87c1-b4e5d7607487@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 14:36:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: release runtime PM reference when
 set_rate fails
To: Rahul Pon <theflyingrahul@gmail.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260930111641.1134-1-theflyingrahul@gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260930111641.1134-1-theflyingrahul@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfX/+CxMszC2QyL
 VQVKXa7PZQ2AjNTyyE5ASdU0yrTqA03+PCCZnXIdDBjRoLyaWl16lPw90SIXJTXM5HYuVJSFjz/
 T+Ab4SJpthEpoNSINqJUSQ6Pzw6/wdo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfX5/CZUs8gRnro
 WqGI8fh+zSKr2vfMkg4iEQAeOUOOhkhv77//5pfbak0pJRZL6QLWe8KztgEOY6OK7SKx/emLnF5
 7LLokzvQ7O7O4WVXttaaXc6tUC9BlznV+MET87oqefCVA5UVDGfX5ot4zOYVoTvgBlXefCz/Y26
 vazTca6RxljjqbH1f7D70Rp4XzUvfrj5tEYdjc+ivU+kWgfg8kxZEHNnYwGGrKb1SpuOesB+98V
 RwR8Si/9ii3QmfYYrXlj9m/RYCpdR0D1uZvk4PqG3GJKca/9Ky4p8GPxqCcqI+6RzmlD1pyt+LA
 mMbVLHegPhnflu3dJYoWH4Q9ytmUGgREaehoSnrr/l+W9uCW1TCTYtGAcQyQjiK2i1c/jMkYWTJ
 2c+I1ZmN9e7chF5g3uKc84o4k4gdPZlh73MpPZL0Vg/Z3CVOlHICJ9ThaPon/9X1cAjr1fS2KFj
 Fsb8ecaiZRqN0VfFn+Q==
X-Proofpoint-GUID: J_pEXjH0VMS1W1gFx7ixx7qBUOVM2iau
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac368a9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=M1oNvLFnHOu12HvPULkA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: J_pEXjH0VMS1W1gFx7ixx7qBUOVM2iau
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050036



On 9/30/2026 4:46 PM, Rahul Pon wrote:
> geni_i2c_xfer() takes a runtime-PM reference with pm_runtime_get_sync()
> and then returns directly if the set_rate() callback fails, leaking the
> reference and keeping the controller resumed for good. Route that error
> through the existing cleanup path, which drops the reference and resets
> the transfer state.
> 
> Found by code review; compile-tested with arm64 defconfig plus ACPI and
> W=1.
> 
> Fixes: 10e74f4c5046 ("i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms")
> Assisted-by: LLM
> Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

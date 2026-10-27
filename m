Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110064;
	b=ubrXmUm0Mvbij6ChAy+Fl8mWJpy9HtUzREGHrefCHUtRg3MaPI8trjPUEyh7xI0zd15G
	 JV8BXibN7eO2o1qBrTpPijqrVuHlpHAxo8rFpGXid45Eo6ntV5OAZwKloqEIDN+cTCvIe
	 nW19EFqD3HAS1cbsvtBBvhW/D2o3vFxW6dIXFYOQTspA3s6B+TvaKpttU3yVF9U88SpfR
	 u5bIi0FYgJSYQJy6IaUbZisu092+Lgde/sJQ9HFyRyOyzdy1SlhtV6iT/0nz7kkvPHYQb
	 9fZFsdeVTvM0h+uFgsE7ynrhQ7Qiy6gpD3QjuFS5NrSuMiG4zZb8Jy5+N3lQNurKfaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SEg1nya0PcPpSx0ic092fxlis9YBlwbf8B18X6+8KOM=;
	b=k5Ho+ida+vMrByslgJBOZ2m660Resz0uVOoth2RdeN/gl3E/mOm7jmE9vMV46xjotQ63
	 G7KfBfKF73aEUD8D7TN4Hkrs/uGwgyfJKsexjXNIkuUdj4jF0HpRw4Vs6JHUJYizA7EU1
	 tzUBcruQbFCtcsB5YHZP0JGDFBP2XJ9zj4Rsuq7/fpC18agn5MaybPk7YuZxaDLkgeQLi
	 JgGzZRT8RNXNHj/FiVJABNtX3H9wE7jrjklYCRjDhNT2fPwIBYB154mxPnFDcuIOkrpq2
	 GcdiD7Xhp7Q1ChJtL37vsO8AFa3BMZy4nNcmuWVKMavvl5L+MnRKEecW8LIkphwRWCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IVF9F3tT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C3iO3U1x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F0D606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IVF9F3tT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C3iO3U1x
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDo2b82344355
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEg1nya0PcPpSx0ic092fxlis9YBlwbf8B18X6+8KOM=; b=IVF9F3tT/2br9RF1
	ZDyeHCfQJQIAIImSKnbZjsKOzAo1fRhW/2s1P3jOVGnxtA78SSC6zOjDyaZddOMH
	uq3QJ8dGhxtnEc4Rv6aCpzowDm31YjC4/I188yC/M1CiEwqRnRZQ9vmd+CfuRT0k
	cWK+xQKXR8RBXF+mF9Y62C1etpqiOPLCUczIl295fkhI5ztW1cnv+B4hatHWZ1j7
	p+wE9R7zca5fHbp1iCsOpsTPbPZO6lHP5T/aiSr4GcKal6SmY9zULsUw/JjDizQF
	wb6G3NEno1rAnPykaFSv92N1PqSq0EOkPvfrzAhx/1O0rOX7G/T7JfxIttdaLAbI
	v010bA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq698fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:07:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso805976285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793110061; x=1793714861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEg1nya0PcPpSx0ic092fxlis9YBlwbf8B18X6+8KOM=;
        b=C3iO3U1xFdsG1yqfSxNZjqhYvUE4f5QxCHEbDsrJOPQS7yCAL9WeolktE95vt3aA3x
         jENAnbvxeHLuwvJpvZBnlIrsWy9RkeTyMsUd6X5bQ/HJdaFPH3mI+4VOmaR5iaeJm0Mg
         SyO7fN9fF/79U5g+kFwZZ0Nww/T5fOQMjQw/StW+/CfDhsvmZGKnD0Xh3MgvHpYXwCU9
         jQdnnEM91jFFD7KdyQp2m73eBqa4f3+HFq2XRHPuKHBOFB/TaFGk27uh7S0b/CR3MRTU
         /1AW1eyBuYqeghy5U3eBQo0tyHL3l9iJZndnzkFNqAwrjAjpJiu0/oDYeRoUC0mMOQfM
         lr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110061; x=1793714861;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEg1nya0PcPpSx0ic092fxlis9YBlwbf8B18X6+8KOM=;
        b=m7HLum59CC35q43rpEj6QeDIg3AXM5VtPgzK1OkB5EEoM3QxX8ty71FRNKxpBQL+9z
         6uHb2XtNeqrRuuv0TOmi/HLRHCzefHruLfBR8mvOy3YpA4W2K40ccu5uVXKVpjxjbOoj
         hjm1TTiOyb9VC0gUKKp3Xq02tD4RSlaA7pBye5CljXX4MmLgxNPhzthEskHT5gyE618Y
         NeCaCMOQLvmt/pAOw0YjsA3B7YajUHI1v3ppqPv8eCQSK/znZhOPAIFXgNeUAMCQFJ/h
         whck2W2OcrxbWvy1QUiYg+MfR6sRiw7jr9tDFzWC3yKGcRdHfyva7ExCVlbFmzxbWX9P
         5cOw==
X-Forwarded-Encrypted: i=1; AKwUvBx0olAfKSvK3XdT9Hmhe8qrEJR9X+HMHshkpuZpi4KTs2lKNK2u4RW1yo6i3155cC30oJqQBSYJkKpat0w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLI6cJxabJJuGecwEKH0DvIrfIAb953OqYtEhj6aStY3ysz2zII
	vP3OkcTHYSrxenyPvLv8Sfh05VPiRaWCkfbnidSGp291glcokUXV/fiCxMG84iMn2BcQmb/tkvs
	qUKcSpPVPrzGUIQdZf0w4vDIXGL2JuIpJ1OH90Tx5Vk5LBiNLbpaw1ROe+kccsYPxgrc=
X-Gm-Gg: AYBFou2yhf2D/5ugnbpWQEGCrgB6fVWr1rTG0VgJ0O7uv/x4VbRdMT3WRZ6iLD2LfOZ
	Iuv3D5bkrwH7cvpfH9S+6yukec2ieRxY+CFsgMRaigGrAsc8B5V93uOIW/97N4JcmLif0VUd2Cp
	cGh0YN4Ku5V++yeQ1u29l9gfMnGjq8/PKdneQwV3qxOr7d0/KLXbbJaZICK95TV7z3MPVArT9Mt
	6AQtSTeY2nh77dYqvZ9NNA3+g22UFwK7xgwOSbxRwTX8Vab8v+JM8fy/oM3+e39bFexj1kYe1jb
	UM81f3vhtO/zcxsSHZ/60fSSfG1z6db3ueejpwaVAfcp9qD2mTRZRrFe43ux2o2Qm0sfpZ0/z1U
	f5okyM7VXtFVGineZYUIyK+3O0w==
X-Received: by 2002:a05:620a:6ccd:b0:93f:43a4:a47e with SMTP id af79cd13be357-940ef8db9ffmr1657775385a.43.1793110061483;
        Tue, 27 Oct 2026 07:07:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccd:b0:93f:43a4:a47e with SMTP id af79cd13be357-940ef8db9ffmr1657767985a.43.1793110060943;
        Tue, 27 Oct 2026 07:07:40 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b49642026esm96803a12.22.2026.10.27.07.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:07:40 -0700 (PDT)
Message-ID: <b7fc002c-4c01-43c4-b404-a9599a938fb4@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:07:39 +0000
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
Subject: Re: [PATCH] ASoC: qcom: storm: Fix of_node_put leak on error path
To: Tang Bin <tangbin@cmss.chinamobile.com>, srini@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261025081610.2675-1-tangbin@cmss.chinamobile.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261025081610.2675-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0b02e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=R5C9hjxsAAAA:8 a=EUspDBNiAAAA:8 a=qifAAX_Yg6spbNOiTWIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: rDdveECh2pkzaWOnqBovwcmikr3O2Mv8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfX5q0AXlXOx2NF
 5+C5sgTYktLVKMjcXco9hcAFD608J5GK0yXjci1vv4FV9E0W/dVe9ibwiLaljLsJhxkuGmZ8xz8
 OyJEyzbEuHEt0xa9ffnHbIGB/mSPjes=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfX3iugr8yMRAiU
 8pb1pNNUGCYjfUF4vTnmE5+3V/CV+x0MGIuGPK/3sn3jf+MeSB+WY8JMH/5WolFkHIhDFiH5pVv
 MzocEp3pC+bFk1AGpsW1G+cYyScZ9gVGNbCZebkGcWa/U7IcFgfNFwvAiTDBMbI8k8LWu0Vt6VY
 MJvrO6nRI6dCiV8iaTY6qsjmz2nGMLAtylXriRdnczMPl1AaLIDb+cuzWF1ZRQBzSlD8JTyZWzv
 D9wkwSYK4aTUV2CIJ2fWRfHWpqtQzzrb75sRcyaIEdZ+Tm8h8zeLZHByc8rVp1vg0Fq8Dw889Yf
 Q8HqyxbHfZwjonLJNa6CBOgvJkyLwTyKQdpygPmf31PVaf0xf1eqOpWs3u8oeQSM7k7OtKeg8tO
 cgaQAsbcqoGZIOY849b2ma1cLnoCFp4NNTb0gD9ynE6OsomgqHXAkWTJWLnSSMj4hpWZ5Zzo/cq
 JlPwa/gGywAgAr0LUxg==
X-Proofpoint-ORIG-GUID: rDdveECh2pkzaWOnqBovwcmikr3O2Mv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270056

On 10/25/26 8:16 AM, Tang Bin wrote:
> In storm_parse_of(), if the codec phandle is not found, the function
> returns -EINVAL without releasing the CPU phandle that was obtained
> earlier via of_parse_phandle(). Since storm_dai_link is a static struct,
> the leaked reference persists. On a probe retry, the CPU of_node would
> be overwritten by a new of_parse_phandle() call, losing the reference
> to the previous one.
> 
> Fix this by calling of_node_put(dai_link->cpus->of_node) before
> returning -EINVAL when the codec phandle is not found.
> 
> Fixes: 79119c798649 ("ASoC: qcom: Add Storm machine driver")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---


Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini


>  sound/soc/qcom/storm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/storm.c b/sound/soc/qcom/storm.c
> index 6b42fbfd2..6a42876ce 100644
> --- a/sound/soc/qcom/storm.c
> +++ b/sound/soc/qcom/storm.c
> @@ -79,6 +79,7 @@ static int storm_parse_of(struct device *dev)
>  	dai_link->codecs->of_node = of_parse_phandle(np, "codec", 0);
>  	if (!dai_link->codecs->of_node) {
>  		dev_err(dev, "error getting codec phandle\n");
> +		of_node_put(dai_link->cpus->of_node);
>  		return -EINVAL;
>  	}
>  


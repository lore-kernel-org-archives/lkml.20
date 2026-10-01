Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C28246C83E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841369; cv=none; b=PuBUjq8TE9Ui7pGlgCjmlegybO8hBpSp0yGVCWO7DWxM49CoFh/046SiW4rNPdKvUOSsThwnsGMnpA39SiTSZJpSjo3unUHF+u/zilMl13S3ZFBw7fLdvwjTp3kLPCOEshM1g+GFyivFOJ1CmUVMoStcxAcMMN2hp697Uuhc79Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841369; c=relaxed/simple;
	bh=jt2i06PWJwL+Zd9sRJ6XkgzJwqJKI5Up5F87w1qvJ4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXe2hOCI2BaQGdOfIGZEfPLOTo1uvlKs72iMqcJrzKiyBC0Z5Ic7jsEZvQP/+X2+X+7eH+9WGjUmCm2FnZa+ZiAisJpiaagdYd0xs9PUmHpd7MXq9VePwE3peAs5DO8SMOVOdSF2Gv0SzqF6XvjSb/sXPBiQRCg5+hu4rWF8VT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFcliw0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Shn0CtV4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFcliw0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Shn0CtV4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xmPU1661085
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 07:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGUAnE4LAxdJYburvBSyFauCmovjGgE6tI7LIQQqL/U=; b=JFcliw0RaRQ61F0K
	w7WoNUOTStg3sb95mI495SNogaW6XoIYyt7wihQ1v3kIoQsxfTGlk/q/sayk+cqN
	KjkTJMP3rAQbo+/IritbIaqn1fxtUA5dUpFTswL5b2tYsTdGv6PA9fw8cpoH9ckt
	YXIYX9Y6FMhoo2SaHLcbzWy3hXZ7X9xtrh+OMMUQxLf+VTiOdbvos0pebzcTHtIR
	IfNQ8FQvwfcCYQPcoJ7JyV7cKnt/pXrHycVugC3hgpKHNeHwsJi3tZ9FmjLX0oJR
	rp2Ws7fggwQOznVyl4VM/luLUAEWQbvdD0quPI+nG/zDCAU3xJtyh5y7pHf+E7U/
	azRGLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pk54x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:56:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c29d85d0dso68034185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790841366; x=1791446166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGUAnE4LAxdJYburvBSyFauCmovjGgE6tI7LIQQqL/U=;
        b=Shn0CtV4T6vVWTjcq5ZR+6n0vKwhnqdZzmj5xOMZa/mZmAwZ7PJzjmW8szRvmoye6o
         7RMLILgidqasUrRLq0Xm2AVmNef4Ofcuz0Sd4kEq3ZTegV2VJZ0HjYkWq8/h3JghSRTA
         8WLtfxvFKPEvrtNDZ8POGNGwxvsbMgKzeNHQ0HDy/XKMMkx6Ri+YqlLL8YdAdYrpe53D
         YVT5axtVoSHwhI0hzklZGtHLz+U3S3ccsjTGxQMoYf8kSBap0Lvmn/PQhLXmvGeEfsjS
         P90eQlcwRVx3uA+c3MxOQeT/2LRYMVN7Ei3jzFeNon88M1Ov0ICSXF4EAGWp2xO0dBt7
         56vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841366; x=1791446166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGUAnE4LAxdJYburvBSyFauCmovjGgE6tI7LIQQqL/U=;
        b=JWy3clzbu16kMnlxZK0Uxvqp2twpvUjvdr0K2iW9nUAViXMyThcw8iyVdKJ7QAwX0B
         XB8dvbyn06f/G45KLlBRvF/Kx2Hg4L1UYdaCsIae6bomTSU2S7hAJLpXwcHvkZ7QRRSI
         5WEdoKJZce0BKfsQWWTMhkNWpsYnGjM8oS2eZ+wnDxhSM/s3qr/MFYlfjqd1LcOykoPn
         ICVSy8xWZWSddJSPPV+FdRJ9XgOLCLPXgiI84s7bVzUPtmMNhdoIRhcPEtCdqBA/QZVZ
         7rKTQ/3D+nvu+iF38Yc9fy3QNpvMuHCppu+BnQcegjlA6zQdhvWU4mNMYHQPHdsbeFgJ
         hgGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxThiY8ZiaXf54Z1NbfPm3h9yHmodqq4s8g/CLBkTr3e4R1SBTrlWzpWVmYWu0hqPQJ0WCYiRo/n0UjibM=@vger.kernel.org
X-Gm-Message-State: AFuF++nH0Tu60sAe6aDZFH95+X0Fcgb6ayJjGD+HCp2eCqnFMWSe/LVM
	WSv+jXKBaJjIRX7i6FLsINK7ZZ7lsSM9xDVOYRktYg/mB2/yi2VnwkvfcG5byxSUrKq2OHOOPMm
	0pzoGeyKuklrn4t8j5fcuS531jFqFKGtjtSeZgqsGqK8wyO2NBUwB27LanKCxnWafuNg=
X-Gm-Gg: AYBFou0g4+deqyRn4LiIKAKLyVLoEo0BiFK9N8y+XK6BsLkhZ68TFlwokzNiB6iz4vp
	NEuRVBLZg+tBaykh4fxXTrQ12s3S4fIHubgYBxDGdGKBjCtUM0ARoDzv5hCq6vnuw+Q0bKxhNJa
	qxH/OF6XMkR2KsIFdzZkEIvNkWP5R6wpDO2umq1P3o007uh42qgasgNhpGnkw0Br9+1BaLnvPZj
	70f5MpKluPFFjX9UKM69PiX0hq4TEy3y7tPt/ONdg7+HOynZBnlQaIJJ9DZ0KVrEWTD/2wWMIq+
	02res69NFVnMo6vZaWOJRUxd+nMavIzu5M0SbBiGQzrvTaF6274YG3hHjEtKjzsvz2d7Dlz2CMA
	APUyZkecDNNoz8IGPT5cxdQ==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr666245385a.0.1790841365636;
        Thu, 01 Oct 2026 00:56:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr666237885a.0.1790841364372;
        Thu, 01 Oct 2026 00:56:04 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca74c84sm613066a12.29.2026.10.01.00.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 00:56:03 -0700 (PDT)
Message-ID: <45c87199-c98f-4f77-93fa-1c3ecc1e6eee@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 09:56:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/a6xx: fix use-after-free of OPP in
 a6xx_pm_resume
To: Roman Demidov <roman.demidov.nn@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org
References: <20260929142103.81854-1-roman.demidov.nn@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929142103.81854-1-roman.demidov.nn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XVD6Mo8DTf4VLq6rxdgnc3PrN17NCZv-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMSBTYWx0ZWRfX9R1uoM9yrKYu
 7mb5S/ANpkZtq/IbDT6dN3NjLphca0tRqSwa6XMHmpM2CJM/CjfvuHQmufZMuqtdqcQwSF/e6yF
 mjyN0m7XQI8aH+nAI3pubU9DFLUpxxc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMSBTYWx0ZWRfX0zdB947sSMVY
 /6TQj11WY60c1QRo2beDg6uEPpC2LJ9OfcUg5yQ9c8gVNI4GSJ0wId4NpjQoNci6chje059MDox
 H0UxFnuOlLxUZTTedwnca8itjus0X+KBWByutlE7qt7XVvVXK5UD1ifdWrdYWnIQ5u51vcAOo6R
 5btJYsPgq12xYg3iwP4PHBRbwa/3r34Fg0qMEq12UsmmKqoUth3ZxZ7iHkv0g/An3AAD5qNBrWu
 A1oWlyrI8S0SLdZqLGNnx+Y51b8QzcqndoizRstKT8EncKHv+EwfnYSOyBE6NkQ9b+XXDAgCT3R
 Qvyx/pxarj3fotwv9bLx58T4I66bfbwxCzIsuu3m/pzudYNr2RFNak43gxhqAcQScMhRdPCBaXi
 azJNsQR+xWuLKr+bFdOt//1hwNY10FARJOzM+hgWuXIWTELaxjn2MMDEhZnhZIfSXs2WV9SRnVT
 YzaE2GW1Lmc823Igoxg==
X-Proofpoint-GUID: XVD6Mo8DTf4VLq6rxdgnc3PrN17NCZv-
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe1217 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=YTtnF9t6jTAegt3XP7wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010031

On 9/29/26 4:20 PM, Roman Demidov wrote:
> The OPP reference obtained via dev_pm_opp_find_freq_ceil() is dropped
> with dev_pm_opp_put() before being passed to dev_pm_opp_set_opp(). If
> the reference count reaches zero, the OPP object may be freed, leading
> to a use-after-free when dev_pm_opp_set_opp() dereferences it.
> 
> Fix the order of calls: first use the OPP to set the required
> performance state, then release the reference.
> 
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

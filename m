Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A004846C83E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841410; cv=none; b=TPz4WP2c4bvHNOMXELaJd6/VDz2rcXjSCvRL2Qf3sowEBz5DkCAkUDhc/yJWSffSbmO7TsWuHkdDRk3fTiB9YC9zty/eoMeNosPVjDZI15aT0s96XDduYFMabzQ/9AzAsEWrxhHgXoWkpG22Quy/taQByfpeJUJFCb/T8Tz6z3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841410; c=relaxed/simple;
	bh=v1D4ajydzyqYEMG5R+vTMdFB3iFKvVChNSVYqQUyMhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bb+tpBLEUocXamBREuX40agmzmSZq/gUyQaQFixEvwWLB3Ms9Yx1x3wy8lGfdA9R1gmaIQFwC3dqewR0dZZLYE+SzAd5OsgQ51Ir4EzaglwRzkmvCJKXHnfKNGUmrQUdLV47xu8wwWXn4AyM3V6j/t43nwhKm1UbfV3dh2Mphk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEnDPkWt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itn9LCD4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEnDPkWt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itn9LCD4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xJnx2805833
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 07:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	55BoVja7JiXdBlZ+YWBAfLc8GBsMp64knOlHKQvzge8=; b=AEnDPkWtkJTJRUjw
	nNdGsvrlezoKKR8IEQXvEEsjaViue8/L1mSDUz4s3yhs0PM0zVcF/O2ewrZ7Ndwj
	sEBRz7D9E+T6zwAIYk7ZoaYDsaflCl0Bml2wEZE8n3VwlTZ/ZIZMuU4MqquyROui
	4QxO4A0+EU/D6blqv7bXHPHfyyr+j7v75CVSdBdTDt7eXaIfkTSXfuBRBzbrvR2a
	aqQ5+qok5ee+DUmeNA6pfpMJJpxTcA8rDq75/69CNYEGBsMwLMX2ylxCpb0WwOtb
	AC06X+pvTf4yU4Y9V4ZnAM0A4EH8PVsl1i37L/9Dc+l+jshLi069YcG/GdNVjhOc
	hVwBow==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1hvkgdbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:56:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91795e52969so4223096d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790841407; x=1791446207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=55BoVja7JiXdBlZ+YWBAfLc8GBsMp64knOlHKQvzge8=;
        b=itn9LCD4aoRphvMNzoeLmTFLcuHnq0K1RqQQ7acekOyC+T4iiBvwR229XcHdlTQgHj
         VZUj/+xHF48EAm8Pf0+ovA7vxMsT1YS4XxNaY7qx8CDXjNCM3frtHw7hh1iEFITQMXCz
         GWad+8xkfAHqBwLJcU58IwJxOVqXO8fZ54pTqv06Nh/uRO4W+S8tRN2cwN+4wh0Skf7K
         Atdg+LAzMnLv1fNMLTBqGrmCPF4EnUrcYtBH+YernfXU3mlrays8WllNnhd+63gcpeIp
         NjX/hdFyaa9ksqmeQfr34srgktOtpx8xA5CnPA8PJujeZiDCpyH9DSQJM9YQoKt0nNFb
         jecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841407; x=1791446207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=55BoVja7JiXdBlZ+YWBAfLc8GBsMp64knOlHKQvzge8=;
        b=POxnaNtUhmN8jaiQwSgBUd0O7w0NeGi7w2naMoRMT1ECA/5ZjWDG1G7xGIqj8kS2Si
         kn+k0lutDZzj+/RtVeSx0YESJE8rwMJ7yVqDleXVS5fnFJipTb9NIqPK38VYFVNiLtGy
         UvC2jAZR95KOleH6C76tS7QueJHxbwX3wEG/AMiCSSjeBzp/m40TUoffGgalSm6kXR+v
         4L/WUVbcJpU0bGy46vh52yuQT7hcDW4+75RZZxvbHY0S6lRjqPbd4ahXN+jv9NXW+lbK
         TTCTu2yPudPgAfstA9U08Sb9RxiS9qeHMi8UAAlsQUsWzq+SrRH6bFiqrjJCN+LwJhhq
         VqKA==
X-Forwarded-Encrypted: i=1; AKwUvByQEwNv8TP97SdwLFQFXhnziJB253rZ1Altl11VM0H4iGh7duYK6kKNXqoB24gbT1ISrHhHacase98WgwE=@vger.kernel.org
X-Gm-Message-State: AFuF++kBQgYkJbGvTOblxoJeRtLIrlQ+VLfd69sqsMdvDRJtLXW1nb7t
	aIVTwV/+zE6KpJOxzZF/dF1HWTzlP98azV/0fAZkREorEs0sS9U0OGcGAKXkrEptb+wRAlmjVzk
	l19yf0z/wyaetgQYZ20STPqz+1LbvXDr6r8wDjqMy7qQAjHEWZeq/7CIkVZSCOZrsJqw=
X-Gm-Gg: AYBFou0HPhHImiBa5ZD0xlm9mu8qihhQkOh85XzVfi4Xgi13+583DilyeIfW4Rxa4lw
	SXYcGk7VNS//26WcvNX58ZR2CUlZrts0xoEgZSGFvJqtqQLvYOr6FLiromA8eJfKv77d7h3UaJm
	cFxBKRjCCa4gKZCSolZKpp/yjlWwPebKhSX0q8XXvNQW0iKf8xr3WdVhWqwgJ1AOjOn/EQu7EGl
	eMceqXG6cBZko0Amu5V+akniYN7yEMGsgus2jOqZoOO8v9qVhmVNbz4FyX0AGUqaf2Q/6ANRwsq
	kP0CmR5R56q7ZuxAooCzTNGYpDAdyQ1fPzxAAxKYqlgAS/Y25RLrMEYEhuU3jc+e5OM2re+ugWw
	lKOHKP5+by3H3wH53ugxvnw==
X-Received: by 2002:a05:620a:4541:b0:939:eb09:4458 with SMTP id af79cd13be357-93ca96cd5bdmr657117285a.3.1790841406697;
        Thu, 01 Oct 2026 00:56:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4541:b0:939:eb09:4458 with SMTP id af79cd13be357-93ca96cd5bdmr657114985a.3.1790841406140;
        Thu, 01 Oct 2026 00:56:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d866d9sm104499266b.54.2026.10.01.00.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 00:56:45 -0700 (PDT)
Message-ID: <15e32d18-1f58-4a0f-85b6-affac29a0a48@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 09:56:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/a6xx: check pm_runtime_resume_and_get
 during resume
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
 <20260929142103.81854-2-roman.demidov.nn@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929142103.81854-2-roman.demidov.nn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMSBTYWx0ZWRfX9PE0j5PONCgM
 vXMVC1t4pOhyWmIyqjKX0Tej453WtfDC8hmXMQDW1bEwGRG+zuF70DEQ8bBTp1c1P6yQ4n2Jgy3
 nFuq67oTXcOx4gvulH4pJol+dp4ekYM=
X-Proofpoint-ORIG-GUID: Nsu_RprMxs49PwlhXJynJou4NfzF8vqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMSBTYWx0ZWRfXwRZZO/PNc3i0
 FlM03XIiTLr/Ff4/rtkMFawn/at5r1nl/dXe/7hdPduu0DpFNtNcEzZo3DHx7cNJL8w8iSd4PNW
 TlCIALqoYeyLWkvgWxHYd8A02a9NFg1WrNnYPT60ixVT6LDJY4+rBAd5HAUhkl/6y6ruh50iYLA
 lI02VcnRn/c7xev6vDxRdFVxMqZzy06Nc1QLaK71NjJ0JtEYCya+KFEGbeU+GZ6Cz4uyjovYKbs
 w0tdzFEXqONJe4gUC0Mr2dtV9tJ/5bnKULbNFN9hcK8VO/n2WsCzaDARkC74b2RNS5Jbj9VHmV2
 W9V1RWaT4vawr2PuNYuAS7Ge0LPcQJsxAwhE6IlvgY1CBldNV0HVzvGW5PkVTE7RFHwZNSl1IGq
 bwMXRvaUImd+bgPU4jUO5b687k+g9U8oIDBJ9uroTJuwTIQWR1ngMpynS4/Bfw5YYDoMLmjXfzx
 /m+/VOBcIfrmE5sSofg==
X-Authority-Analysis: v=2.4 cv=IY8Symqa c=1 sm=1 tr=0 ts=6abe123f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=HH5vDtPzAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=8WuSQyhVeKmarUdqJEgA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-GUID: Nsu_RprMxs49PwlhXJynJou4NfzF8vqE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010031

On 9/29/26 4:20 PM, Roman Demidov wrote:
> The return values of pm_runtime_resume_and_get() calls in a6xx_pm_resume()
> are not checked, which can lead to hardware access on suspended devices
> and PM reference underflows.
> 
> Fix this by checking the return value of each pm_runtime_resume_and_get()
> call and properly unwinding the previously acquired resources on failure.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

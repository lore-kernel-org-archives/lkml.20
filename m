Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37024347536
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 03:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791084025; cv=none; b=gRanNR4P/1hylLUMnpeQFUINBEVKBeQJ9GewccW0owIdj8MqGzJ3ZwTAXiTNk01+5rdGPMH8dAh9h1Tof1/6gcUjxqeGqQX0MX/3cv0jJ6aDRZGugs4a3uesNgeeOxbUeOOtJF7ZFo7LNZSIoNl8OcKMlSz/aqCOTV71SnUejH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791084025; c=relaxed/simple;
	bh=8EeAdMpmWyyGuGS8Wc9n/f9E1wn/7pXUTMydz6a18sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8/PDJ6VxbpJ3qjauz3a1co7b+Koe8wuS78mMJ14PbeM4PvcAIOutT0feE26UH4DVffEfqve+2OOqot6eJtuupKCGmLVNl1zQxKy6pcEcJAa7RJssJWfE4vR9MN5WOuFgF6fay5v/KV/xZSVAp0/fXk81M2a2fDpctIMby6uVi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AUYyJhVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4Ika29N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AUYyJhVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4Ika29N"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6941tjSu2329862
	for <linux-kernel@vger.kernel.org>; Sun, 4 Oct 2026 03:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wwzwV9aFuwIXK56SSztcZ1Mu
	EY+VheNe9eTYzrH0MpQ=; b=AUYyJhVi+zBGfbhtUZtKDbKxAJk2XJcl30M1e7vk
	ZcCVey6kO1eadZJzm4dMsMy1mAo6yeu7akHwJNJpjVniKhXvvrHAUBHupzDFLFAG
	2hWtZ79MYBNXPfnow626hmBj7yLiq52IOT4f4ZheB/NHkvPCucu86d4bjA23MFye
	V5D1Do4DlY2aSVNtN5DDUIqUW0BCjQv0CVofNxkf4Lc6jRC8hW1VbwI6shsSyggi
	B32SKd6KicxXUbFqd9ZXdpkUIdmTOnQiZTxdj+o1DiTs0Wen0rs7M0NdvxWWapJg
	Uoc8aKd8ldxWw24816MghA3qBQgcvb4Viufm450hOcJZTg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sq8tasr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:20:22 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c93c294214so227194e0c.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 20:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791084021; x=1791688821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wwzwV9aFuwIXK56SSztcZ1MuEY+VheNe9eTYzrH0MpQ=;
        b=j4Ika29NoMwvtK8eQPMfNtKK9nTn8rkNNqe8k0NhrCnncU5y5ge7tJKTPNL7E6uLZW
         rNtPim/qJ7xXJnxMEUva9ynHYOqwsL+6erlCEucurusdR/CN8xBMfgjkXYlcHhQ3khqj
         88BZG9/vnm14j4VwKzbgA4Xhet+CSoJUZha6Ldxjwsu/Yd1MQywEUBUYZkOqRxMmhLPq
         LBfJ3IyoCHDFyHSzMkHiOxMb6BQLu2g1q5Kg3U156WaJ8+rRwJySc2LKozLAFnFDXmzz
         dJJJin9HBAc1I84ZwulRHMYolBo676ucXdFj99Cd0wMuXbHU7y3C6OuTYcnuDDYHcXpT
         lM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791084021; x=1791688821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwzwV9aFuwIXK56SSztcZ1MuEY+VheNe9eTYzrH0MpQ=;
        b=SeTKr1kHbPdks+3YumhU1/GGq4YfkXL5c65oBnMKWJwQ3gB2a7ybozVtChuAu08qyZ
         z4SSZ+NSKy0A5ehcQbuPTnSCSm1jV+tM81ynwe+iIiiaQBLENtx5HxKFNP1aAe0ESXjZ
         YR6bNizjDPry53yVAzYqiNVDtYzEXiFL22jVrQ2aLd7fKQLfwkiq+xUtXlqxf6f8H6hh
         MiLdh1QwVaV5tLZmWXLP7vRPXEoo/3HdVF28tO0juWPW41T0+E3ltHxftcyrwgKjLQPC
         SxZnwvZVXMvXTMqATv0o40G14Gsa9EW4og4hWZL/S5x1H8N/Ia/zjZmEuWm9sx5ozxyW
         xBmg==
X-Forwarded-Encrypted: i=1; AKwUvByBbQiueqitlJU2B1wMdYNOHlfdvYUfo3mv3gua5p3fDJIGOsLr7+8A79WMlvxDUi7HnX7K0zRTzMgxk+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxh/QDhxCMWl2/8KlEKRLINhQTsG094d8SFHU7QI4e1ya06jeR
	XXm8WHUvqxsvG7qIVc28Cnua3gX1caiZykso74dubUY+QWi13AMuN5Orv7sv2igAyElRGJ0y3w+
	knj/1CvCAF55D0E9jxoU5bLzJbr9vbr+8eqzC4qJ/2ouAG7MrkKGUBIIhBKtU7tXDheI=
X-Gm-Gg: AYBFou0/vSIj0bCTlnkiO4TZy3eEGcGTdEsOn1YVsSUiWynT2WgtmjsrF9iHaYIHedR
	PfNQVolGuvPm3BbXQj9p+MpMA2zDprh/wU69D37Ep6EtkEaDldm09fc4u8QfI8g7koZ2AT4AQbD
	jieuuKrrXawlsjbLVA8B9HHY+FANpQr4zp6IRkRmZ6zu9aQglpRgpj914pQgHLWSAq8vRjzHs58
	8Spb6G9wxbXXj1x2wK85RP3PCRctBFjtCNMRhZ4zeENMS1rX9LY4JFG/u1uqsyA8dG1bNfedeFo
	p0LLTdqdXZlF5fke6LA6tijcBa3Acy+GsbWs5gPcKinfdgwkKlWi89KDYRNw2oeY7Oe5z05yuLO
	71WuarwmlU9Vb/2pkrRqmuy5uB5RBByg/xhkavDYHiN/C26D9ySn9QY6H5WgbldCHy6HGbmlr7L
	o+WINHFjo9iZ4o
X-Received: by 2002:a05:6102:4190:b0:7c3:5218:1dee with SMTP id ada2fe7eead31-7c352182ba3mr401423137.19.1791084021160;
        Sat, 03 Oct 2026 20:20:21 -0700 (PDT)
X-Received: by 2002:a05:6102:4190:b0:7c3:5218:1dee with SMTP id ada2fe7eead31-7c352182ba3mr401415137.19.1791084020708;
        Sat, 03 Oct 2026 20:20:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7e43sm26563241fa.11.2026.10.03.20.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 20:20:19 -0700 (PDT)
Date: Sun, 4 Oct 2026 06:20:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Sync registers from mesa
Message-ID: <pxzdepjxrwdpboj2bktlbpslj4r7zabnccifnaae7hmteoga7i@dvpsliuxzvok>
References: <20261003223723.400020-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003223723.400020-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: on_7NbGNIaOUTFrSxjEckGaAnrpFlgG_
X-Proofpoint-ORIG-GUID: on_7NbGNIaOUTFrSxjEckGaAnrpFlgG_
X-Authority-Analysis: v=2.4 cv=TKzQ2Fla c=1 sm=1 tr=0 ts=6ac1c5f6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDAxMiBTYWx0ZWRfX8uWGjeN0ebqv
 8ZTycd8SkFIqtHn8c928XXGy705m5yv5qHwj60fuPvzf27lFBZ2jJB+pkbQlOUOOc93amgCcCOT
 QkARs92hzLaidXMexu+VJpr9MQuInwSSk11TszCinAUVddEp2UnqQCnh/mGcm0avROars+aP33K
 0mH8xV1hgvPKEmZ0COps/axX7y1fT0oIq/ZLD5SoPZ1CulLp5YxwJSZcbwlUsaU+dbebHTcdWQ2
 O4la/EYnEvr0iAMyaBr4emJy6OKqQU9LEokOoz9Svnq0izZ4C7j7U2MGZ1CU87/ktkWFMU/ZPGX
 7sRrc41Kr9Mu87foU9T5eVHjCQIkMBzwZxnjrc6Ey/z84hrrS+0mCD6XTBkOZxO72S6dWM5yIxC
 n81XMSr79iueO0RkE2uPIasMeNIy8F/dkQ3Vwark3hKZXV+QGcCKuF6zS7RS/K7tn2wnDA57ArN
 snmTqO8sMRVccPhKMrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDAxMiBTYWx0ZWRfX28qMLDfJqOKE
 ZvL4dj/oVZk1iVTlzPHwJ+/vnOBig9aEwB/F7/9LpWYVoo6k+fXfeEuQp30257PZaxAvwBqD86d
 0BurUtCKzU3NTo5xz3ycezL/+QRueOE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040012

On Sat, Oct 03, 2026 at 03:37:22PM -0700, Rob Clark wrote:
> Sync changes from mesa commit 81fae85847d2 ("freedreno/registers: Sync
> xml changes back from kernel").
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  2 +-
>  drivers/gpu/drm/msm/registers/adreno/a2xx.xml | 25 +++---
>  drivers/gpu/drm/msm/registers/adreno/a5xx.xml | 17 ++++
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 81 +++++++++++++------
>  .../drm/msm/registers/adreno/adreno_pm4.xml   | 41 ++++++----
>  5 files changed, 116 insertions(+), 50 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

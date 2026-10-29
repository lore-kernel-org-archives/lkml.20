Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238692;
	b=yyZoqrXWkahlNcn/lWiEgGUyrLo2ksyE5aLDj4cUyKuEpndD/TOb8I3euT7Q1xM7Tw1e
	 PjehKFiOukJgZDISEjrOf1V8STQsJIwj74LWSmqBrGQWk6FHHRpo6eRn0+LIEb7xuYBat
	 pfi5XdMu+RYrwIIvnmnkUOgMaDFN2kU4JZ0UVrOvyZv8PoFXDNoWp/dCV6Tlze9a8G+OG
	 yrE2WNi5hf3wkgQyp0LiX7rHCDwZlYpsoiaUiWt0AozmxwvaKUbLmUDglJdRagaZoNgeb
	 J29SqKfX6oR5nP52PIFNrkRtQxdydHjIz0Xc2/VjcSaniQoNeDjHzRbsuWy5cwCc00Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rk9+wkvXRNptLffy30oeFYSi+1Wc6/AhSR14JPEURjY=;
	b=xiG+9bKFSc5bCxb8DaTPux1ystJMb+R81juxc0ixFUKIddKSvzKSl8TDVK9u/lmurs1L
	 kor1RU1qhx3T+IZj7MmXnmmlm3f105Bm+0wVR/Jo1z/gFV5D6iZeC5Nq9F6yxU2aY7EWY
	 0N/WxwEZ512NhVrTW42sqIILHwcZiiLRr9Fu6ASaSY7BzxpzusqGnI0K0On9hU+UeHj/7
	 /ZqB38tg8R+T364Z3qRTk37uFTc+WUXvoHylWloiXiwhsuq2/mcYDctXHuHY0qIYPYJ5D
	 6BGbbDRrA4AZih+YGsofFQwooLp4Cv6vOfE2rBKavfOaYzO19HTHCkCOap87rtF2fVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IdyJweug;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h8nnCrnW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF12E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF12E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IdyJweug;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h8nnCrnW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jPjp2886486
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rk9+wkvXRNptLffy30oeFYSi
	+1Wc6/AhSR14JPEURjY=; b=IdyJweugAsW4uikydO6c/JTsfdePltsT3KCRJr0o
	/2xODwtQyCtF7ELQaWuhZqr/JujQRu21pKJmReRe+yl4W6skPiD5tx3bsGFiV6nO
	5nLrq81IzT0NoFvpANvQOlDxqapzsEm/yOhw3aKYUEbijg/xGEBSV9FH3fo0RMSO
	xUgEeZ+aO/2RE/JVvG4t9oFWpUaHVEXEqG1R4mRTBJdQMmvwLHhg+ZZAYgDWJV3I
	qDlOojq6nRnyfGLCRQaJqTvt9cBVxcCBj2TF5BuUjBX/2XZX6ICbPYey6il7IvhG
	cvUW8a49ws6dd0ByQoPW9aH/uHV7cQEvsI2/qL9oB/jfkQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3g634-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:51:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-533928ef33aso25290021cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793238690; x=1793843490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rk9+wkvXRNptLffy30oeFYSi+1Wc6/AhSR14JPEURjY=;
        b=h8nnCrnW11CugQ9GQJ6SvREnmykfRPlhVIetfvYFbM5sUdjIbgfDd00lBMEojmS9mM
         JZDUi7ckwRWStf77NgOe1RDzTYbpYBkrRsFIJhmfyi10RuszlOnYr0oyuxPUaD29Fvjq
         Ov+g7dPO0fM3jK9/5I4zU2xow2QvEy6yz5lysmsousl9AHCVhqYZiBIUdMY3Xl6Ow93Q
         bbQ4Xf77iDwusZvhZraYO9vrGd72Z/2SJEHBlNPU3QALv81rSQt3J0xuvQkMaiNGLYDs
         GUIZrlqtSNeg3H7N6xeBm/d+V4fqSnc1GH2Zn1aURLLDpdXnUWD3uXVwvO/6svTx8KFR
         NK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793238690; x=1793843490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rk9+wkvXRNptLffy30oeFYSi+1Wc6/AhSR14JPEURjY=;
        b=oJ6QN60u4oDa2TYgcps+rbG9iGhDjc17gKSNEoYrbvM79+moEfAmijj78yArIi1fAW
         IMhjCwo+rLS+tOUvZ2Dc30G0cCFWNVw6WBVMo0JkR2qlSR/s2M7qNZdkKr+zTVZIVAM7
         hadY++487pBGq/N3U6k3w6FnJY6CtNNxwO5qL1cY5AMPLNYyFkh18AWVZ+E3QSIfq7H7
         BfF/Z25PcS90uGKgjAU/MXXfEUrFzasqYIOJ8ONyAFvmlGf6nELypdadbCX7CBtTEluk
         mUmR+50VMB43EItY7Y9fssF/D5eO4lpFfPUuS2FYU2t26jSUoQhvGdscgW5UcuU+DiUl
         NT5A==
X-Forwarded-Encrypted: i=1; AKwUvBwHjfI8qtMZutpSRHSRk9pj6b4JvFu/osRhjGUj+/qH2wnvw5WbettKDgQzh85oCGpkTZqoL5OIRaM/WJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz0WCK50xsjoMfWdJ8KSRkAzC/JcDepLhFjO03/whp1cJ6S23q
	ILTi5z/W6uxUMTFx2NTj4VW/wnKZt5HZlH19dRjTG6QcaMuCe4C08fcVeyhZr8M8eMBXdcc5Kfa
	sWqr6n9SsjWM/5L3xE5czYnF7jS4yCeYf4u/r4Te2wiTjKt9OL5aHm7kP8XT7iEzc1DQ=
X-Gm-Gg: AYBFou3ZYIsavzcoKtiC0rpy/cW+xW2Sj+y+1WZM5XNykUjVm9tr4p1HxihZ0aj4gj5
	rJUQdlKKwlqa9n4HEO9Bu+S4PzJGvAvhckqOURixFpbzstEtImrIaBuEfI7TYCtkRrlOlErL3xv
	0pRer+9qiueleoSV0t7M39ylpA+VDeOhIG4DrWO8UcBYyg45IqiNvejjSnfWNueTaJ8rFViwmfA
	UxdhUbAzvrIPAbrE4qCQR5BNRnguWVrgwhBOzSELFVzLh1TJS9EClKjrbIpZtcT0PoUJxl8WrQR
	PDH2sQOP9/0cPzl789NADz/x6pwVTODYGeEPrOpDqfoaJj5pgyROU9Ojy8w9Fg5+kTgkUwo7a3Q
	nPSpK/d+4mYMjE6vCRghNwvF5rSl1Nmg+Lm3B8Z6hMDDsEb4l9KY1cnLlmdlWV78QBMofbfYsuT
	mnKZleqOZyBBpkWp0vBD53IhVxcfLTwG2TBkRM4/4Kbo7AG3AEEtP8O46HITptVA==
X-Received: by 2002:ac8:5987:0:b0:535:958:b9c1 with SMTP id d75a77b69052e-53fc8bc2e33mr71787851cf.11.1793238690202;
        Wed, 28 Oct 2026 18:51:30 -0700 (PDT)
X-Received: by 2002:ac8:5987:0:b0:535:958:b9c1 with SMTP id d75a77b69052e-53fc8bc2e33mr71787621cf.11.1793238689674;
        Wed, 28 Oct 2026 18:51:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f33b5sm34356161fa.23.2026.10.28.18.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:51:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 03:51:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: Soften no-firmware message
Message-ID: <uoziyz2q5wmgxtlchecfm3bo5mzlmxczldxfq5lsutrst7nrdx@5dk5xtwft5sj>
References: <20261029001601.82269-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029001601.82269-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwNyBTYWx0ZWRfX4y4r2XXvIA/G
 Fn4K3nmCzqHe2aS4vYK6xWD9Rc1Y3ez45oA6s9F7ftKazVw/G8cYhcaB/Tac/1oKmc6pmrozIWr
 31l59TP+wAu4CsYxiYSBguxV00BnazQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwNyBTYWx0ZWRfXw+uXsJTwNXRO
 +s+Ne0+dfDBtbJjwkBTBOq4Lyo05IcmA8kC60DW7dk07eeMcOHQbxQYRT2HXEDW4TVSX4RNTORX
 Gmltl7aYU9IE2m+2cKGDJgmqCX0eNgUERuyfb6zoYk5ru8TvtXdVhsZxk5whP2cgoUIKl8YQsJS
 IAJDTm/FiNNv5a4NvHQC+bzLpPh+VSwP0KqnGZ5c3v9UzxtKi5h29DSgND51maJDjddx5yNDHbx
 lbcqetlaSJQmTe3flF3H/uCQyk66e3eBxtfakPkD7/DN818Ut1ioLcDv72UoSCyeDoPZ2g5oqUj
 +uTjJga00mkyjP1j8DzgaBza9hRN+qKr+ptxZzXiw/ZXGax4EPZQgdYFDUp/S2fN792MNBCdra2
 2RGAl7GOziptS8IuilszKc4eFRXkwFbEcFb7Qkrx4d8ine81BdtFaFxpPwlie2C/MwRl6vPh4Qk
 uOhr0F026IEowqpItLw==
X-Proofpoint-ORIG-GUID: 0vQaeB-6RDF7wgeNfm4g7ykO3_WJ1fYY
X-Proofpoint-GUID: 0vQaeB-6RDF7wgeNfm4g7ykO3_WJ1fYY
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae2a6a3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=jF9eNvnS1b8AvMrK6iMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290007

On Wed, Oct 28, 2026 at 05:16:00PM -0700, Rob Clark wrote:
> It isn't _necessarily_ an error, the driver will try again each time the
> device file is opened.  But if you don't have GPU fw in the initrd, you
> end up seeing this error message at least once.  Which seems to confuse
> users.  So try to re-word it slightly.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

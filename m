Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C42038332F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343468; cv=none; b=dD0eXWmYKCL64a0x5qJX0Msvk30kDuueiUOyDi3ZMJXQClt11FjE8FEpVafBRdckZFXBR4ecng7bVsiiWy8nhSC8niRCh2dvmBWDvGnNjYQ6Rj8ePRpNXDr5ypEIeamf9uy0OU0/egtJTAsnMgHr5aITjR3Wf/VAB8+g6mL3ob8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343468; c=relaxed/simple;
	bh=p5+9nTdkKqAXTX4kQasxfAOPRcmCFjL8NQDhgdpg1Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tz8kz9OFmnRCQ0OjE6LpFqOX2j8GRUrew+INxs+foltKLg++tGi7U4AyMVQ9aw5YGK3YLP7cbbH6CMxNSQf71x/J7H0ai3Gg+33fq4/c0p8ZYTP26GFsqGemlbdaNIEPzdbV99oXlsnrxETGhM/zgxSXaX2jJ6B4qG1ewfBbGqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LzPkO/LT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUoy/ntV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LzPkO/LT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUoy/ntV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DNZp0T2599441
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WdFMlmauPwxaVbgf2YMHJgMA
	PrT9/NnB7w9Jx4opmZw=; b=LzPkO/LTASUrCu8bMp3vKWoq0UZutRrM5M8jGYJP
	A8NZ1JwKpiYq+CvFymCSgTfoD4TrZXJ//ZeknSxXaGDfgrvmGOEhBH842JdlkS+0
	rTuYHXLq/JKCHi0M/MS2JVdmwcsyBxJfrBnhAGHiZeidDlEMmfFlbZsIloEKN3Xs
	Uxh2fA+uegD4dQdzT8iIMVdQSrfcyLD+5ZAKWSeoaFa8xwUwRBwwivYTTrbc+j7t
	cYJHVL/hHgXyRCII7aymQtsJ/41TG7D083/kVSGIcgu1zOJXP/mbnyBhhTLdHcaG
	ct6l1vUuYDBJ2k3mVKbfLL7DPVliAxuxwWyRCrgr4of5fw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd4d9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:51:00 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7915a83539fso2541963137.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789343459; x=1789948259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WdFMlmauPwxaVbgf2YMHJgMAPrT9/NnB7w9Jx4opmZw=;
        b=cUoy/ntVSHBtlp0xOjKr+qNrV19cPgbyuSvuP421g8d9cGEkdRmcXg7tUFNZPn+An/
         AhIxnbYJjnk7QQoXl+2du6Ki5FB/1+m+T5sgykgUTVEDcQGqWrPJ5NNR3FEQBLsU7TTU
         8qTr9S2E589ZT2l4/6jcUouvHoeD8zlhsEQeK9LV6XcOAX/xCxCTiBin1DCpJohZWVvj
         XGchc5nZ6eEQMbgMA8QCC99PQgXjOomWE8r1olEpN5YDsTUrjo0XH5WETmiDv13ZPU5T
         gOcPwC0flRXXO2l2FAIYcaedb3P0hEyHavNywjcFQheWHPlM1MRy5Iqu0f/xdZYG4+45
         030A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789343459; x=1789948259;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdFMlmauPwxaVbgf2YMHJgMAPrT9/NnB7w9Jx4opmZw=;
        b=E6Knn9grhKlcHnjgxR0gkcHmN2hwSFzMY4ERF2CHgc1QEc/LoZ2Qv1o4KDwTdqbE8s
         m0xz/JbwwbPirBjmxEpYARKvRrKB0+xPCx4IgopDqqN3RLraIODB/f4DKGSxgeCkX41C
         hDDh00DTQOPibypOpq29zxqe3V+FDItyqE8/NKVCk52+bfRoLDEeP4Fh2DDnDnbF324e
         sl6f3WVyFazgPY7XzURGHaNE/XvQeD1wy9MziyAXhPMqDzq62S4LnA6P47AqjgjLGtVH
         rMJgPbfLvaz6adBAbqO/tySUpi3FlADkY77fVskH0mO+LWUCe+BuJV1fDIB21GODUMTK
         CDtg==
X-Forwarded-Encrypted: i=1; AKwUvBw16iV6ZgKc2acKuzKR7XKgk2vC2ka7R4dEW3FC7GnC9DQPPdWRVIdDVWNv04quA71oR1Uh17qOSzglMfs=@vger.kernel.org
X-Gm-Message-State: AFuF++lPzzqXccBSMvpnMdP7grhxpo1sKFSOi6nTDQvYtGFnytASbKKj
	3jCjd+lERavRWc3adwONNriHgMnxTFsmy4kK1rkAkcb3V3i0UClxfD7g0VoAvHqbPvjLPJLWi4B
	TnnLdY7x2ztBlUHhxbYg+hfOiiAfsFh5/fAD8fBpriVhuuEmoOaGuuL9T75VUW9gwiT8=
X-Gm-Gg: AYBFou2cmxQ2PGRUls0cHrOdG7SgYTy+ooK/ogJZ5dWjy/eG37+3Uud/UITL9SADjYw
	elkzuFDcwv6pHrLa6IlpUUKkhExYmDWaSepeTxWSuIUp0rJ/k+pcbu0zL1qOsODqMcCrWK98a4/
	mMxiFw15Qes5RlTZflqjF2/VUU6jad3g7uUKxyFbegVxqjDyi4l1ZPIYT7REuuYQrY5kf1a/uek
	pGcZSXUZ6/9Lxj35jfBFtEJ/+5b2c0HJIKzTYKhywSpmNQQbWM+8Qnr0Bxw4yP+Zh3wXDsHr0c3
	mt6iWG40641My5mqSG1U62Oe+nX89cT8eA1K6XDr4VXyohyd47QzJOIK1UyK2yCqZmA4Z8vapJ4
	Usq0wO/W7YnNrH5h4xm3ky17/IGot1g8BMZs60TceIwXMneqjsSB3yEVDQC07JcmuXzA0/98JgX
	TkemQw6/4oQrxg
X-Received: by 2002:a05:6102:5f07:b0:786:c86c:4f5e with SMTP id ada2fe7eead31-79b579afe80mr41604137.3.1789343459129;
        Sun, 13 Sep 2026 16:50:59 -0700 (PDT)
X-Received: by 2002:a05:6102:5f07:b0:786:c86c:4f5e with SMTP id ada2fe7eead31-79b579afe80mr41592137.3.1789343458764;
        Sun, 13 Sep 2026 16:50:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456c06sm2080930e87.28.2026.09.13.16.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:50:56 -0700 (PDT)
Date: Mon, 14 Sep 2026 02:50:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 06/17] drm/msm/dp: Add support for DP controllers on Nord
Message-ID: <pzcoffvcnailaqogewwys2zf7aizlxwzwz7scpixngc5ootds3@fjxeopzxa53p>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-6-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-6-e25c073cf1b6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa736e4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=m5hMcXIjv9hwPX1ZnFIA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDM0MiBTYWx0ZWRfX7HHMEWKQWBr0
 /5rsLLVKYrAQK8gH74ZPwe4clib7xBo8LjAavWeEcBYxFqq5X97vOLI5++r81IbuTmrEaCcj4Sj
 /tP9flndXi+ZvTg1t6mTGdAtwbv2ufkAXY/766paBQr/yAjHmcoq0IOAt/UPsW5NDFcLid6GBXG
 zpXhV9RUKjzNhO+l/ko1xQmb7fIM43hiNgc1CuM/vIbNreUHoaDI7/9tnIWxFJpdt3l66aPYzKY
 KmUGKG+IP6lOWWKncWNcCR7O6P7IVAXehNtBB7Lptq4gDKC+DSniyVdkypdQ/IBDZjpVQWC7md2
 yzXUe8atXoX9UA6+0mDU9ctJD8ova0lLFwp4ytrmIFPzcU4CKr1WekmjiGdraXQnyJU45ttAwdY
 RLj6PFP/Rb9g9ArxYYlda+I+F2vTfR5KLo94YBI9Hmew9o3iAzbjAr0YyyfqT/okblbx9zehFgu
 tIKXyrHkGredGMRsGEg==
X-Proofpoint-ORIG-GUID: dc6gbWA6UapXHzNV-n9Mb8374o1z9vqb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDM0MiBTYWx0ZWRfXwJpLHiZfQz/q
 VsbGHGvfPhbzbbgqt9wlC7DgGhT54pPrDNna2Wg71U2ou3NOgSbpDwzkok+si1QsEGfnutw7XMa
 s05VN0JMhplUfCZKxz5jR9ZSTGHcUxs=
X-Proofpoint-GUID: dc6gbWA6UapXHzNV-n9Mb8374o1z9vqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130342

On Fri, Sep 11, 2026 at 09:06:37PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the DP controller description and compatible for the Qualcomm Nord
> SoC, which provides two independent DP controllers, both wide-bus
> capable.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

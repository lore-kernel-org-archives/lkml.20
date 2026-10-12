Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EDF4779A9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807337; cv=none; b=lFTSkamNAvtGDASXVB8amgHPQJ14GAXDxcOqAkpkBqXU6fw3ahiAeDwXDLZ/24o6VUZRdOSK+eYjNDLAeAxAlFWEOlkCWdXrSuEXx9wLq2IBrCad3UH1rteT2B43wDf2ZY57OW6yzMvzu35B7YOLm5DwtZSoY4v6ZTFrvq1OjfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807337; c=relaxed/simple;
	bh=mNmg4igm56aIhFhjoBzo6FuKANN9+kRF97wFpfQTZz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7b3i3qFHFZaMu8OIFQgKmzvMkDONTI6kdYKBMDWCcyNIW3UHZMaJwYrUijn3f5JnN85c4FErU5RWKuUJLuCpldSj5IidzwStcDsype/Vf2VwfOswr+2VHkW43GfYOQh3wX8/ToBOOHhJNz2bO2MNAb6dFXO+n+6oaoy8HODVgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxE1te11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikJ8Jghq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxE1te11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikJ8Jghq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0PCi2088511
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W5Oee20wld3PH/cVGW463kUn
	G9EKd1KKP/fCR95AWfM=; b=fxE1te11jvpvYkuiVwwTsQSTXk/MB0NPmyKhPMrC
	AJrnrusz6Fo641hxXNp1V3xt6ttNkv8vZsmI8ZGGUy6pA2mXE/5Ivirg+8aQfuVR
	QRzAfdiDxAT0iKviWX9If4Buu+7ASPmqD6NdLBGQLeOizragQ1T6cjrBZxHBu0jq
	wAc0RLky4P3i0p00hksSATIUC1dt5qfr2rocFTIVrZRSM0q2zreegGrdrJaQROnq
	KUcJCxT28V+jYVFGK5CR+xEqlZ5EGx8SO0or/5FKrTaeHts3kINp8L2kOsSTfoPs
	aB0gD9qzaGoqJ8MH7SCeCa1tSCHtIiobEOvX36YIPjDNLQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu1u75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:15:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338cfe567eso40063161cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807330; x=1792412130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W5Oee20wld3PH/cVGW463kUnG9EKd1KKP/fCR95AWfM=;
        b=ikJ8JghqrsW36uyz9CY+2vP2OI+FnMlOG2Cv5BHuiHYOp7i50lF9+74dMLJ0HU8zm7
         rPoitqCEjmD574jvrTVPyjt9Uk545zZQd8jviL04UmwkUk6wDQmMgmDpiXrtY7JPcuAO
         JB1R64sdY8LJklmBRkA4krFzxqiAvfrFJjLDYt/Xb1zeWeC9ynKj+DdS61UkyY53kTMR
         Wg2s8RLFeMymUXWcHrbzRFoGKBEa3PGC8fIyZfZyS2I9aXW4MT//SL9KuQp4GAjI41HJ
         4LLlq0B4DsK2ksyygIFKl5wHg5RIfdMHBXhhgY6qoTx6yc+cWx3lXl5vV243sTS5dVs4
         6Pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807330; x=1792412130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5Oee20wld3PH/cVGW463kUnG9EKd1KKP/fCR95AWfM=;
        b=fw7xhQ3wKFO+h430iN562u9okgpW3ZHZdUZRkILcLdt8xoQC+7ymA5Zl6I+bza29C0
         qKTjw4WnrX0ryP7tgJkS6GSzKjTEGVaCijJ8qfOm38aH4+QIcmJFZnYSpwNw//wWmEvv
         p1Ig4SaMXu+yUlTRG5Xoii87vyI2hyiLM0/aoeNzDp8ukzeJ3212lcklgxRHmIn8dKt3
         TN0inPaZy/ig2EbANmAdHQtkhP1lbjgl2m/WQd8DogqOGOBLpgAud1DV2OxMRlGpFHcI
         0VEWkn/plysjfXXmVWG3kr1LhwOKa0DbMbo0VbXelEmPsRqwH/T5YqlSntoBIy/CfVAT
         oQew==
X-Forwarded-Encrypted: i=1; AKwUvBwfHWpwL1tNKIyO5nvzApIaHKHMUaBitndLAJFW3TLGhWHPW2QVeUBaKLCMa+YwZn9HN9GK05dksZWkT9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwdZcAo6h2WruLNguJwfe0RZOb2n9njbl0SAcI4vL+krO+VxqD
	xhIJk0LKIRjQn6YQdkGbwTMF8Tiw3WHPa779DIJn6jjadKmYV+Dn4GyPNTUG0otZ8S6SZDX5owG
	z2tJzyKH4+sk0E2hVZ7hsIOcBFuZb/GXlb6woR4EvP9Nav9SyCM8Ao2bXfLrKc6aMy4g=
X-Gm-Gg: AYBFou31GU4AnovnP841x5eohnW+bvtgbxyAAktmSo1o5vY2zlsAIXdC7j2qclS/wok
	Pt9p3bfUBKgwMEmeZiUqjDOBOIIBSQ1l87oyRS7yhTh8LPiK+0pjdfP2mhHi1OLF2YTbeRMRQKa
	4EmqJRVhUWc9cAE8Og0d6nppnuxDxQQgIx7aL+7cEhsh0m6ZotedAmWoQi55BvNPKT7fjSY7lPh
	rl+QtruU+JfryY6Na3L2RwdKM+LHpgiwMhduIEENb5qj8Vcj1iZwAMgl7H31dFbp+OKl55bMG+B
	wHIVwHLZDtWu1ezt9VStwVr69C7t+GgpxOCX4Ala0Qg+UIjsPvB2U7FrdT2O7tzk9KrmCXYS8Md
	JcMXUfSr44WsA797rkAu3UT2maBV8xvfmT1VznG5hhiL4/D7FrjfH4MeWmbShM4xgSQ5ULcIKpi
	wDXSrwla+Mnfp2
X-Received: by 2002:a05:620a:6303:20b0:93e:c12c:4416 with SMTP id af79cd13be357-93ec12c494cmr973982885a.82.1791807330383;
        Mon, 12 Oct 2026 05:15:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6303:20b0:93e:c12c:4416 with SMTP id af79cd13be357-93ec12c494cmr973978085a.82.1791807329765;
        Mon, 12 Oct 2026 05:15:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf2ab872esm909446e87.41.2026.10.12.05.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:15:28 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:15:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] drm/msm/dpu: filter writeback modes using
 writeback maxlinewidth
Message-ID: <7n7jevfti3hty27mbbsuq22oht6bxtrim52umza7xmpctpqgjn@ov6vn76takpt>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
 <20261008-lm_fixes_final-v4-4-fa986071c3c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-lm_fixes_final-v4-4-fa986071c3c1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acccf66 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=BE5bDMB6e2GY2Q6Qa0kA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfX6yMy/kLSfzxF
 GbdwL8a15Ceb20wBvX+cfkNoE1PompCpq5JM5bTvdbRO31cLlISyQJ+sKl1wwKnmizCUwG71/u+
 8nZVF4V2wZe7pg33/MLom8U1TnEqSrd1kQNwC9XAbnk3uw1NVkS+3v0YUj/NsXw8Q1R/kvMZEhl
 9Zz6fa6MSvx5sH7mXAY7VYFa6kI1xaZLz3KfzHh2mQY7sA62BVluPQM70I7ztq77b/dWoJfD7zK
 F5xd2jdhrN66e93IgGvxQArA2K61meSLYpaSxKY9NUlZD3t98I+z4jydBoE4hv3V6O/40i0wvyj
 T6oPlXKtcOx4zjoTYCWvz0dRG9wcWCv+izAcsY/H7o0l04a6gA5hST5ro072KHiHOaALRnyPsZk
 73muzJ7qUtxAWlCHqp51isk1s/mgndX069WZ8w4LVIwH6/Uoknmxp/E3/bTAvNLRcjlFT9NyKh9
 rELbxKIvcgxA1nXJMmw==
X-Proofpoint-ORIG-GUID: EU4Jy9b8xx2P83bKzn60Nv9qZ3dFHF7h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfX6XBNnS59G0O6
 LYUHkAHpd1S2T3bSdIFOeZiwPHEILyiC2GlKEmSoubv3Ons7YeinIxopJSFt/SaqiKGCLiZuk/P
 z2we5Uhoocz2j01rzpncXITbeV57pRc=
X-Proofpoint-GUID: EU4Jy9b8xx2P83bKzn60Nv9qZ3dFHF7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120048

On Thu, Oct 08, 2026 at 10:53:50PM +0530, Mahadevan P wrote:
> From: Jessica Zhang <jesszhan0024@gmail.com>
> 
> Maximum width of the writeback mode is limited by the hardware buffer in
> the WB block rather than by the LM properties (LM doesn't have an actual
> buffer). Use the actual hardware limit (the writeback maxlinewidth) to
> filter modes.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> [DB: fixed commit message]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

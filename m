Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301C948AE10
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808246; cv=none; b=N5ibZ4tsB7rBcBISiBaW4YwjMKthiWd5ITP87fV3Qz/R7jcahiFIRFD7H0MOlaMNSUAmP039+U3WPwOXx2xFu8HHQlVRjCYzma+P4szuiK54JN0avuLtD4hIUpVAQuqh/mEzwrn6yRh+0Y9L1BHG8F4bL1+gmmpmqurb8LgCuNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808246; c=relaxed/simple;
	bh=v7inc+BvlhYaHiXBPenT0ZSdp0LR04zp97vmXDriLIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PU2EoZ8nwbHmzFHfX7V5xJo/byNL4LbNw748kWpZ9HZkU+X//ZQgKMdTAKvpaYSl+6NnfNsG2qQxtmwxft/3fgsodF8+C8LbRW9BjL4uhx/5L1uRCYshtwEe3A2SnK2pBqLraEAjqgnrhkV7VNsiRr81ur8LcTqPa9VEuJfQlOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFrGlgPT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K24cef5C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFrGlgPT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K24cef5C"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxvq6800781
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e0yYPVIKMmnK9rTXk1h7BEsH
	GLRAY3pbRSFJzuzDlBQ=; b=GFrGlgPTPBFwYT3nhbJPmE3dcVIoCq37LB36kKb9
	8zWXD9iu+3iL+xBAPAOwncIHJScQX0RwOubckj3WlTA3XoHcvSvhZGi31k25oxp9
	EthtTvq38SgJROc84nYFblFiA1db+uNiEZe7fOfmstqSz3bbQq6+L48sE9WragHn
	P75oHsE2vgNiLS9+ZvX/HWSPZ+MwoM2VpvZnuSdVIa7pfMCNUcOjlr9PE5jys/tN
	VXwr9BXgNinf5DG4so5PPzI1L7fOURdgO3icrAZRtIj0rtFFc4TFqrYBkxAP9Yx7
	FGpkQ+X2hkH34sv2i12UOGAiM7tzG+rQjemhUD+TKDU5Ag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcrnht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:30:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc359d9easo318059985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808243; x=1792413043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e0yYPVIKMmnK9rTXk1h7BEsHGLRAY3pbRSFJzuzDlBQ=;
        b=K24cef5C7Ad9/b9Rk05S4SvgseDLqiwgvVZRZxYjsU4NAgYorKZDZ1Usj8nnMT/q0z
         PL+lXxul6AUfptqyJc4Zfx5U0+0/IGWpczYMMWJwlZ5N2Xnq6MKwkHCQQhQ8HKHv1rgP
         BoafQo+04Wf47kjL4hWE9Q69fw0cKQA9qUbHqtl9I/uy/0Vb3FR9BfQEWf3ceXnZyXhW
         5TkaYUr602/X8cf2IlC57ChV2q4t3ARY/LVPgaoR1XFwRi50YEKea/zlx85RC4FXOQWq
         M20MzdOUt1R5KGxpbVuF2jzuF4ehDNXCU63ud9waQAjHnlMv1lEAqULcouJElLqSK7vu
         VDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808243; x=1792413043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e0yYPVIKMmnK9rTXk1h7BEsHGLRAY3pbRSFJzuzDlBQ=;
        b=xvvbyGOzHTMxQrASACa+c2BKuD2DZlT+83D6XUuVnnYUb04EzF3fk+ETDmsILsWZ5V
         TWdzWd1mRvi0YuZjKpepE+rYhEg4MWF5OSHe1agkKiGguQUqsw49XO8VRyTx9ZsRKzsA
         EfS0bHf6j7PeAWcsDogpQbx9el4EnLJAHuyRLbzS/Lkb08pt1cmS89FVMmTL8CJc9dbn
         XJzMZ258f7z6FSjHom7Td4v0C8cBnEDiKkn0PljYK5bI3lsC1MaeYVcpg3Kk8CpUVoeQ
         wPXE1s1174aWKWwz7eGSsozHrzxgcYQkoQ0wCAMMyDAvn+tlrE3e67bWHLQf+1ZCLF3k
         MFAg==
X-Forwarded-Encrypted: i=1; AKwUvBxqcWHRfb6S2Mpr7OBeOyWqfORkrHCA7Cmn5e9PT9Zznvxo77D9q6HKLhN1S24cBhXmySlV1YmEMQG8dNQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuFwfmkpWCGdX2WEf6/+Fp0cGKrkXYaoR1JXphRGhx8LaTNOnm
	FH1ZH6wlc73450/ZcBGQjiPBNDSopKU2wd7gVl+li69Vyysvize4Zq1AqnK7JH2Sd/bgheAoICd
	5cNHa7bjZnld8MsmUKwKF3dY0HDSv0QZCh5DMajCB0cGMpkEjSD7FwWkcjsWpTk3NzQg=
X-Gm-Gg: AYBFou23Vf4ctL7CGPZksHATCIPvDP9ICYqIvoa+Xq6HVxzf0w+ViQCpfZcsq6jRYQ0
	g6iwR3QthaOPfOvKBKjZJ/cpDRMxO4Gl552OjXLTUaRAF8RS6zRqd0nFTbHYSgtgD7A/tbjRAh/
	1Re5dINwjAUW9g58s7g3m5CHmEaFHdgVQaRiFiO9GYmLsUD5GW4zPxMrtDkNZYx7g5AhdKusufn
	xaCApaJ+lFN3lSlJPN7BNEPxsuBvc7e8OU6/UbNcITBJbSTbS5y0S4knSB91RfLKVEHnZeFf448
	N8ZiAsOvfZ2Dmm9XoJMqv7OlhFaEJWlrT7cwKVLQ0foOJZotmsbUJyEthHGljSWOVKUasCbAj/T
	NW1pq38V/CuriGLG4eUkGrgdQesfGtxBQE4T5hP4V4V8A70U87vv69pJ/0HhhORvOCLpfYFVRhc
	mB0GL2ZhgZUOkw
X-Received: by 2002:a05:620a:890d:b0:93e:9627:533c with SMTP id af79cd13be357-93ebd265157mr1462917185a.50.1791808243288;
        Mon, 12 Oct 2026 05:30:43 -0700 (PDT)
X-Received: by 2002:a05:620a:890d:b0:93e:9627:533c with SMTP id af79cd13be357-93ebd265157mr1462912085a.50.1791808242582;
        Mon, 12 Oct 2026 05:30:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde912b3sm2766910e87.21.2026.10.12.05.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:30:41 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:30:39 +0300
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
Subject: Re: [PATCH v2 1/2] drm/msm/a6xx: Move a702/a704 to a6xx list
Message-ID: <ggwbnf4yr6f2pguzu444akwt5fdl2cwk77ovhc5ihnahnc24yf@ohnqcwyo5pb6>
References: <20261010154125.726149-1-robin.clark@oss.qualcomm.com>
 <20261010154125.726149-2-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010154125.726149-2-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: QWZ3FltsK1d98cDMkYdry2wYT99UbWRo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX6NdIb9Xe/q30
 exeYeXylz3Oeneaz+PZILnxC1/j84zdy0h9MILY24u+MwxqY71HQHn2F6kHZD1P/yzSC0brPonu
 9M41yPVjIQftBfMmfQnIQljyunIfx0E=
X-Proofpoint-ORIG-GUID: QWZ3FltsK1d98cDMkYdry2wYT99UbWRo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX5EXxwiqwOJHk
 LoUJg7wHmxDrSOUblsqpY7qRwdicqMjcwO80uxBAcLdeqv2ir7DmlcK03xXbuFa/9d+h9SsCVzF
 Vw0VRFr/7RbhFGp2cZV+OytvC6acurQ0jLVcrihNFHy/8ca9VY+7lIbcfsBAeh6djfrADuMSHsN
 J4WxZoa/DE1R6dAhzI7yyZaxPp/sDJAkOF/Ilt/y86TlYcb2UgjAwXf3mAodbR5rjQA4fRHqyZC
 v0cpz+as+Ajkv9mQYoXdAaxtmJ8w22K5fch9ouxMpNSVOKZb9QnBuVAZKmN3LywGIlDC7KC0zOl
 gWOzMewF0xK4xF96lIa8/uk6+hreP9ePGsQIy4xxz6mgmGXFmKEULoYX7QWjRWWKUPvISTWmHEJ
 pYHfd1p2Kpman6K2ve6Hpeg2hre2sjRMAidnHMp5i6io4B3pJ9wWRwtj5/3IS3+w9HpblvHTQKs
 Dgo/+kcq21pL8H24RNA==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6accd2f4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

On Sat, Oct 10, 2026 at 08:41:19AM -0700, Rob Clark wrote:
> It is a bit more a6xx than a7xx, and this simplifies the next patch.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 168 +++++++++++-----------
>  1 file changed, 84 insertions(+), 84 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

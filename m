Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412323;
	b=QmbrGTiYceOsTAJjGueQWvNdZJVoeOPu+X1dy/WfH0eNYqpcfEST4/F1WYNFHm+OgV2F
	 tST3mgBZTQ2k49Q+3XqTOmMHKOqUeGv9Bcj32x6Fk2c/WDSerYZriMKV9gEMS5pt4Fsa1
	 9PeiI89+91BnJy7We/e+k89uBw1VQ734jtCZYDAaFq73lD0ickPQq7pQDHUVerKmiM7VC
	 H3iCMg9fmaQCjI8vKJLUrdW1of29QVCm0pbT5/P2tryw8AVW3YRZjrCOrz0ARaZ0W08ub
	 32aGK8Dhm/VYHo5iHQE6Mwiqfw4MlfBPkHyB0roSvdR6VtoM+kmBoFI2qRgo7vhrygg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412323;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V93kB7u05RsWp0bMsBHWnhdzwP8D9erQ42L3lDrjbOo=;
	b=rQhO26K+ohzjwv+26afZdN3V4Z1K2//DwQD6IGRtE5tRpneA/FGZUpMG8wdA/ydVEt0s
	 9sS6X09huPqbr09kFcjjkNiHBgFPB/c2AYSAt9x7Uhpi5RiED5zh6qGkSOwJPt6vHcm1I
	 HlUtdzSqkevQY+xjTx04FX/1D5a/ri8rLrBPR3We+ZimZBJ22wMi9TsQb/+FLkLw/dPJj
	 VvWbzNiEguGWQYyOyBs+nT/8Qgw6RWfiq6f/fi02TqTqoetZ1TH5bhxBcIQiRR752KbQQ
	 tS5X4GE8finkj2yHvWBRElzFB+v9N2xZfv1OM9KB2E0V7IVQqGTLhdkEmBMVmlS2zQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fH9+ikMx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FYDt60Gv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDC2606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDC2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fH9+ikMx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FYDt60Gv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0UOD2594027
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V93kB7u05RsWp0bMsBHWnhdz
	wP8D9erQ42L3lDrjbOo=; b=fH9+ikMx82geJa3TucKjpmFU7n8JCGIyKlR0zHX5
	VqZ6kDY9HtMQIt4WvJc9rqbXVG0X0h2fZezpU8vwLoYUtCGJGBSmz5Dtly/pHuEa
	InOCM0hwq7g2RaG8aMwKk1yFunRudlRVNy/LapKZ+m8q5WS88xX6hhVJF1sEUmHV
	0qNI7SpHEuwlWvRVz53b2H1MOvQfELWJ1kt/iDgMvyV4wiTTMndiH9p1HPfjNiSZ
	9SB1jkwO8c24Q2Y+NS65/4Z7Wo4ZiK8KHwB1Tqu1jUFpDISSBQsXrxLlgjDZtVFC
	UNSmYCRNUTn0QKDBT3xhxuFesHrv4q02zQs999Lz8zxIiQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm9y19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:52:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-947a607ec40so193966885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794412321; x=1795017121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V93kB7u05RsWp0bMsBHWnhdzwP8D9erQ42L3lDrjbOo=;
        b=FYDt60GvAHHV/DXeSSfwMcb9m65jABnxxJFxN7tVHV7dm0x+YkJwWQ2DZGORlOk+W4
         BDWoOWz5kupTvg3vWfR3/RuWwRRJJHsAM7d2PbYMFWQM1KghWr5kaRkoqOT4D4LfGy0n
         NooVOFlpTq3wqSJMGue99WZhj1Qw+qkJu0/1bywu33k4qGJ6HOPuA2V4U8yVmFWacNR5
         5PQMe0NmYbsqZ5u7fHUGne6bBodbTEjy6VjGL0pUy8mzGpgl4DPZGWRg1WHQWMLAuLqU
         ok7RY7UpFRRfEegejdE28aTUoF4yQ9WhmNbg8+ryA68cvZLXarMA53Juw3WUXKpz/Iis
         ReOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412321; x=1795017121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V93kB7u05RsWp0bMsBHWnhdzwP8D9erQ42L3lDrjbOo=;
        b=sglU2oehHUjJFrDFVK+FSD5RqYAiTXWAApjR0Jo7LXFQo6yw9EOxupHpUORPBgaYmY
         alnnouzsaZpRf2uggJ4uTJ/4rt0plWGtn39vM4CrWiRtq3c8i0STVJT8sD8a2I0abcEP
         dJh7rDrqurwVItcmPPa0XGGIwcRtgSJaBxcJxAbDcQDcCxGU/0ldYKcGsp5G00ZuHu5Z
         L1yDQTz1M/igt7oObm5faTu59/FcMLd6XzdbrAvvG/A55RSVw7aUtv3C/qU0zR25WXyr
         dRIQuk/uTfUden3IFP/QdgBHLgLzcdMTQUyqzkyEFa1XDthUN1m9oLW5tIcZWmWfVIt5
         WOQQ==
X-Forwarded-Encrypted: i=1; AL+hErEZSODMuiMH+mLy9GpiTxzS311N5QwGXieVM0WExoHzU3bN7+OlafWkH6wBPXygnjKhbXjF3GKp7dQp7nk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KNVk48fhd0YVa6lh0H3AAAKxJ5PAoX4n+LpsGjDmB06ebjG3b
	uelsxXQ43usIxtxcnfJdwd82NFJujfoPpoxqZOqbl0mRc10BSvm91DoxW39QeFlxdbKgbD9Sh2S
	ULBpSvg61fo14AMrM4ScipAdHcfR3RFdPSayR2RvZfgPf5KUqCtB6NCVyV3YHczo/3o0=
X-Gm-Gg: AYBFou3S1GzYazR6fj8tr/FuZ7HA6QbjNvQgprdGmHke2ldLqNBxWiUg8FCEXeAiIzH
	b2lAjrnqkni0ERAKqWk3CphISyYzNW/ayQSLBvtgMH19ks0681i9/4BVWTy4uijEdfPDvJDdrsy
	Pc48K53NQ+y75vm7kh6H5AWSzbOSxU0ugq99hf7LbtP+5rkiY85pQ8ItqQ5txA+D1mg7O9UxpfY
	wse+sChRV8HcXD/Ay0J2JL4SDsk+XWpzAQ/s45Aj3ZDlE48cTERXnSGnYLQCpxima3V76KXOp1Y
	r4bTOAu7lqR4uVL7bjXCOI3RlUeolXfsCXoTl8/x21kJzZEtwv9ZhcFa2EsPP/ZGUdIhHQIh86D
	r1Rvw6742RbDS3iau4IKGLBpEhkma+VweGhjttt5BWyw5PLcAFbCgO8pLdtmIhZ/zS55+uSKPs8
	F9MKRiSx4oSEKrR4C4AlY4bB2wz/IHCT4d97BRFS/cYQa+e0VjI2miRddZCVQtmA==
X-Received: by 2002:a05:620a:a01b:b0:948:d833:1bee with SMTP id af79cd13be357-948d83321camr201207585a.3.1794412321438;
        Wed, 11 Nov 2026 07:52:01 -0800 (PST)
X-Received: by 2002:a05:620a:a01b:b0:948:d833:1bee with SMTP id af79cd13be357-948d83321camr201199685a.3.1794412320217;
        Wed, 11 Nov 2026 07:52:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092293b0sm11950441fa.17.2026.11.11.07.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:51:58 -0800 (PST)
Date: Wed, 11 Nov 2026 17:51:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/gem: Deal with partial mmap's in fault path
Message-ID: <ie2suz67iwxidcggliefmuyi64rxhbslk4to34cb47ctd7jmw4@a5ran3vouptl>
References: <20261106190317.17904-1-robin.clark@oss.qualcomm.com>
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
In-Reply-To: <20261106190317.17904-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: oeczVc6m0cBBj8f2UPmrtO73NM0GuT3x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfX3yTHFSCWjs0n
 ELE9i34P4rhPiHpr60lPKwXq8oC9Wdn7Ps3XhADaQEqxCkj156etGPDkjlB4nl8f9986iouxIzE
 tldPpydIi0EEenMTh16qBoYdmzSjCmJODchBvhozQMt2W0mXFGvq77hz/TyPIft1Owr5/eU6KKO
 3/KTkt1QNudDgcp6nZvfEImqdTG1X1BkqPqsyoD8rx1NclGaZP/wgRE58thiHdDTSeQ3skrR69t
 BkhksKCGTtBMCuCmKZ5hXZOPco6FYiWkyeRayzMcIuRjkI4QQoTkqpRuL/GR4wvXFADOxyhzCd6
 fR/1GdacbGtk7pdPT99F2LgFy1nPIJvZDZiFZSWxDWAIY65YbT73mMJV3yKr78jUcimr/a1iIlt
 wcxl4BNyLyFT1sRH9QB1MCjMzcKZMzXkhcF3z+avEyVv8OcjHeN96wZLa9ZmAF00E8JNvXryan4
 hMLlCFVyUWodn90Ze2g==
X-Proofpoint-ORIG-GUID: oeczVc6m0cBBj8f2UPmrtO73NM0GuT3x
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af48f22 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=cM-CtGeE6IhlOtB9VQsA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfX2PFPAEpPCHbX
 nR1GPGan3lzBedfXYu9W+favRc+j6UBH2ucUpyrUVWX76+pKDV69couMOFHlPI6CNiEBnT+euvf
 XhWxaictI66X0PixPr39TJw/LPSUYyU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110063

On Fri, Nov 06, 2026 at 11:03:17AM -0800, Rob Clark wrote:
> Historically we ignored pgoff, as it was a "fake" offset that simply
> served to map back to the gem handle.  Mmaping a partial obj was dis-
> allowed.
> 
> But we can instead just subtract off the fake offset.
> 
> drm_gem_mmap() still expects an exact match on pgoff, so unless we use
> our own path for that, like some other drivers, we don't fully support
> partial mmap.  But this at least makes things more robust if userspace
> does funny things like partal unmap.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

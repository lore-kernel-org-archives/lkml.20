Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56233DAACC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534902; cv=none; b=HeenpViK2hJQV743YrKRHEvFQsgf2NKDbPE1dnPVIj3P2+4zTA6mkns5oT9PxLHQTFh+RWPgmdJLCqj2s8zZaTrSM6ucpKi8jwd3l1OisPIjfJfVs/KWovNsvbmgkq8TYjwfyrim1n6Bgxyg4hyqgRihs3rPFYPmTAxIa+WY/7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534902; c=relaxed/simple;
	bh=NC+2eeo2n5QNMbUUG22T9VrtpoJoD3PzWFKPk2u4F84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzwLB5wWcS7DufmunV6jy/9i2S/ouP2rCpghBKzlP2d3jsHqZbQl5uQTojGeYn6hLmvOe4R8InPPFxnrFhstNzhfC0hPvPJ1xkJAkeJPNeKmHu634rfASXTnlE977iuCbj+kG7dMk9X1hySEARRdZ2Uvg0pgk/lp0OaLbSVl/go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ty7vvkaM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K3YJWw/1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ty7vvkaM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3YJWw/1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KG3x2257140
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 08:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s4pQsGddClrCrII1kmbcET5k
	ZqpNT7v4RjJRYWDy9+I=; b=Ty7vvkaMmZ7MDralAPHqHSDYwDUbfCAa43KeasGQ
	rLEYQltkHcCPXhVtDYD+nzS00pGeRHaK//i+cRlWM/bgEkb26UrTd5as5r7vQCE/
	xiXkMKtwZYX/aERJHu2a5P2mf+gQtgQkg3pBUDb2+ZYLPAP9DrJEYqMRjiovwRBi
	/TaZDYy58zPDhfhpkjTMwfLgUoOWKsHmZibpzLdujJlszB6vOI8PfJIBoLbsxs4z
	mkfJx1dnP3fB9Z2AbvX6JpIJd9jxDr9I5t/fmgQmk71oZ6m7GP0QVUHOruxushEK
	l5aO5lEoYt6GGnMe0rpUOIdVQpZNkmjX84Qxd6/ieXnYnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufsgcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:35:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso462783585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791534899; x=1792139699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s4pQsGddClrCrII1kmbcET5kZqpNT7v4RjJRYWDy9+I=;
        b=K3YJWw/1uSB0U7PTwoIlOdeEDVTKHk3mdgiqHPnv4phC4nIrZe6PdxGTXZ20Wck6qL
         se3c9Osda7wWtQGiLn5I2FeEROBtXq/3ieJBzstv1reTNcz8EQCBWUHayEy4BC+lEVTN
         cgIp2SiIoz49yTmJOO5U6gmfHcs5cGh49bmNu34bK66tku8q9j0Q3L0z2l0eGXW/u6/T
         0HW9fdQFD5gP+1HXHHRi5hC4+RUB9YcUHtLmyVMfRDlJi8akbI1Mra2xGhhedTfKH53N
         q2yYarQ/lA2uzN7GMHXQ/VzK+Eck6PEDrcsxisXUEa0+L4eDeepPaUlQrPOI0skDoyFQ
         4imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534899; x=1792139699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4pQsGddClrCrII1kmbcET5kZqpNT7v4RjJRYWDy9+I=;
        b=bp6Iz/CB+q4UvU2Hyhg6whuXsFLqhZ6j6dx0/1OLJ6YSS4LU/Kozx967ScDpYudP2I
         FVQff9ip3GTQ3bvKnrrBYW+SE/LbC5vRWZjfYnrSHZA34sVx9f8sPtM45+6vDC2X3dwU
         TAhW6Tx9CN2aC9keJYXFikbH3xVkEe3/TfwIC5vm6ZEarsd1CP4HQaTF3c5GKJk060Ra
         5u7lQlext21gGo/StoWnDZvZB7VL5jsMq8Glnq+Y12fcl60PiAJC3P+c4eFSXJ9rYhyQ
         /0+VUzIJ4O39HVHDBGcQWxmJzjsDqkfiPJ64s07+q4gAzcy86UThKVX1iimA/c6KZA1n
         CyXA==
X-Forwarded-Encrypted: i=1; AKwUvByLwwGsQZPI7ioQrJ0bCnJw8GPA804h6NKi5IZQwtR1DE/sod0cHJQcjnrzpZRxpaK6cF5AjozsCaizqas=@vger.kernel.org
X-Gm-Message-State: AFuF++mLPgBR5Co0OTX8+ixVF/LY7G1088BmwVm45aZJ6mkiZJr+CSH7
	VVASgv57Gya2G/a3QaIwJ4Rm5OidejLvPc/rpy4459BFCQpFb4JrigtZgJnHG1fe9fUNtdYCeaX
	jkzQrKsGKI3xTGkOoiODhbmHdVwjC7eZias/wBrinVbprbcqRlPwkGUdwpYrk4MQntNA=
X-Gm-Gg: AYBFou3008oQkhQD6UHt4Dswn9rnvllyHcDzDAOw5sqBQjKRO5uIEMBpSYlab5zs1QA
	vZuBbOdU6GI5c6uVwRqu12zKI/eY09ppCaMFl1EjSV91VJEurrkoSvjacUwZjOByD4ggg7ho13M
	O9hHGJe6WryosiJkvVzQrCVuBXtqS+33T1z1KCwwlUOoqYbFMqOB1T5ng0eln89UeTCXAuo7uHI
	dWDuLIDKhQ2/upBqTRXMqlq5rGZVLxoTRG5i/dkQhdldNZToU4qZmcq6IE59WMyy1NA3Rpht7kb
	BQf37W5HYRnSpzbrc5Wi9c5tWAK9C9B6Wgd1KpLz4gy8CtS7nvif+DMgk9HVyoDF7vbeEMoGCra
	giE9xry/1HSTHxU5H/nxIQauOfG6p4sCJ59wnG4UujLkj+CwSEUbM65MVoLK0UPUNjk7/Hn1SPk
	fCvytwSXBC+Fkt
X-Received: by 2002:a05:620a:3181:b0:939:fe55:402a with SMTP id af79cd13be357-93eb966845dmr239799385a.31.1791534899003;
        Fri, 09 Oct 2026 01:34:59 -0700 (PDT)
X-Received: by 2002:a05:620a:3181:b0:939:fe55:402a with SMTP id af79cd13be357-93eb966845dmr239798485a.31.1791534898596;
        Fri, 09 Oct 2026 01:34:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36004sm446004e87.8.2026.10.09.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:34:57 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:34:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: kaanapali-mtp: Enable DisplayPort
 over USB
Message-ID: <mh2mmbrs5omoo25u4je22tq32ka52kusz6u3xkeohea4oa5o7p@uww6ugjnutho>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-5-6faeac3a6d59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-kaanapali_dp-v1-5-6faeac3a6d59@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8a734 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tbCzt_ceUV_s8fUbo54A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfXw1nTKaBGoh/Y
 BeDscOr0ge/052w9t9ITOfryfu1X1v87FNbbkfpXRpzfHYPbge8kwKfHnqgdP9GdztGLJCe9g4h
 wsAey7vIi0mXbuy+b1HMMKkmjimOM1s=
X-Proofpoint-GUID: ttnh_I8lOUmrvpQi_t4it8fhG0teqlLf
X-Proofpoint-ORIG-GUID: ttnh_I8lOUmrvpQi_t4it8fhG0teqlLf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfXx+h6sUocT5wP
 WHtMgzHpkzbMhY3lhdoOzukDGgMCM7a1iGG3Mnsnevu8YD8kwcGmKAhkXOI+y2Ppm9aLNXdbf1d
 vwBXy1XXGpAd2hd2mzWQfkoDL7LcMHfSvmGm1Tf5x9kK3ys/n1KMophQpO04aaoGPwF6R6UINY9
 9uArYUykwpd4ifaGrnkcb6AECWnYk2+uoiffTsXO3Teub/HhAzy6D/GrR4aAKe2UpAzhB1qDV+4
 BcrqIe/Wz2tv1TR4AFXDLJyp5EgCtC3syUUfsBEu5G8j36iWo+CsZvbXw/ZiGr7OCL4GKU91QXu
 QAvJrYsY63Ox34/c4ZTy78WA/C61FDrNDsM1hqr12b2koY2+HLYPmCiFlSAc52SzcltWul8LhAZ
 wFUETGzx/g+JuRKy3+Gks6OdqyQ1oQhm96BoTZTNqNL8w3mKM9DO6kA45d/uDfuLNihFd2sGhdQ
 keJ0rutc7iweNsPBygQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090034

On Mon, Oct 05, 2026 at 12:54:30PM +0530, Balaji Kalkonda wrote:
> Hook up DisplayPort parts over Type-C USB on MTP.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

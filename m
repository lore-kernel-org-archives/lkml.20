Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BA44EC647
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867839; cv=none; b=coCvdDFldUR9ahRdT0bN/P+B2lHdVRigkgN7BHJ2j2FG8kn/lh2vNGPK8yiG7NmDSitKITQhIp5otd4eFgkkpD5PfqMoMvY7XIjtRQaDncul4xf5orHHjNO7NPSpRLroH2yw8naxkhJMw6xT6lrwG0Goe1WDwY004mIiWRh3HXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867839; c=relaxed/simple;
	bh=1klMqRFtUdYaByRu8GO+szw4t4l9Ph0YcFP9HtIkvhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTCREWbMFL6uu7mJYZ8gQHwPw5LZeYfTY7QdIivXL2k6rbt7xjj+T9LRmD20wa216FiycIACO9ZAzgEBloQnFtzX947G9CN+lpp08S9B0mQVzRgearJFxN/HTK+M1aPvlLwqzlZba7jz8kyswgTriBb/nyz/h9d8JNdOJcKsyfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OW8SIQ+B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HF2d2ASz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OW8SIQ+B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HF2d2ASz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ADaFM3825948
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eJtXEg7vUHM0z0XVM9YoohNJ
	DcSIprCrERl1dn/YsEE=; b=OW8SIQ+BWiTQ4NAr/sWsoSSCrvxrmTzclnnTdZK6
	jBUHASaBiQTy7Gv5ZMwczIYe2NGaX5NiXrJeyJq67KCClIeN7QT09a7DePqn5YIm
	ab/z2gDOgXY5+4GlmgaI2NoVQWKeYxweycwz0Uq3zUUY1t+jXNYwk8nolK6xwahI
	iypTBdfTkxNdlT4GziH/AjIv77KwSTNopEYc0Gr1eglP94H2fEBhXK05QsbpvOkC
	dlUEOFtDxGpBLR5f39EsA+J0HG4skPE7oTwaq73rQNStMYIEIaJUPPprhXpS/Nqn
	gmFgvZVWUuqfKAUhjKkojLuL9s16qI8v9nV6Fc4SVW0A1A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0p9r4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:43:53 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e9c9e23d8so3380722241.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788867833; x=1789472633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJtXEg7vUHM0z0XVM9YoohNJDcSIprCrERl1dn/YsEE=;
        b=HF2d2ASzDOIarr5WfoC1LIUcmKi+0bpv2+/OLDIA8b/IDJ96U2NYvJ6ZUNfUGOxhzY
         JcSnT7Nlmld3w6z4fuX3PX6mzy/SUGKYKsEtayg6qFqks6PXLIdgYEJHnXXuRKA+iKd5
         XWekfcQgYCaXAsHvocUIJ3T6C8YamS+iNDK2hKRdaYCamK+qArKAkA+Exlj1VWJqurUW
         /nLbBidu9mVmYsF4CwxJ3KXhYcDVFXDeedxynW3kl264zMsOgebgEkcEF14uLCwLONPt
         Zx+F8PvPhIJf6EzgizD1DB3bGNsTwpbU5VLJNuOtvuu/jrfIwz3h7WjMLWPjHMm+CvBH
         tWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788867833; x=1789472633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJtXEg7vUHM0z0XVM9YoohNJDcSIprCrERl1dn/YsEE=;
        b=CqWv15g03f3yMZAufwOoByxLCClYYhqTCwBhrYX1qPTuq0zyIorSFF+yDLzW+Dgp1f
         Heoe5PooKkPZ7GJhIqTfBV59Gzfe8pOlDqIiGAu3KbKF1U7Qt9kgzSwaUCEGYvXJA1ie
         iUibcCxRKh7leRX6DmMg5zVwmj0m5jEaMM7BDRe57MOMZHDYCmwm6+1ZGjA8AXB7IEgG
         xemAIjgzQtlfxEI25WxgnQlLhsy6xRIMThmckzTq1+E2U9NWMTj+sg5AY4fjNJVw5hAs
         akjree2meF1ZtvETTAjcSLqjyLclQL88OrMgbMzCLEQz+qI+/GFXpjqPV49FGXYUGnH5
         SgUw==
X-Forwarded-Encrypted: i=1; AKwUvBwjoCwbY2Bn7IwD3ry44/Dyc3xREAsLuEOVyu6D1f9XGRSyJWEH7Ipfju1Vus1NquSOwOSJhww3ymV9eXU=@vger.kernel.org
X-Gm-Message-State: AFuF++ljsnxPGje9beQiBZ2/d8Bzt39uWLhf1pZ/gy/f8j7h+Rp5gsw5
	ZorSaQR8M1fr4SawRLDt+9yBo4+w0pqqrdMl1CkME2ZPtsFQEKKSV8y1PxMLjE++VyvKEOUibfb
	7X2rBidhfilS4ZoPco66eMOwcijWCcN4gYtk9maWywMcaSqqAl7Sujr/NBx24IWUalok=
X-Gm-Gg: AYBFou0YXnmquV+r9Is8nxQNOH01hQ7fyXPZdm5n3LUubXWdSz7ayTcVVrqDOZB/m5G
	DTVW8A7LxmQm5WB7dmInkcZC3wAaxOk4USGME9b7PWbrkbSJy+Wr5y21DXqnVMzxHj5oP5DqLYW
	8H0zjl4gyHklLCPIcO57460d0bKbpY7B0WidNH0GzI+LQymPjOgEBsdvKJ8W8vdzUvkplJ5ubFv
	KTqrCj/pWNTjDIYdtX2vcKtgoMc2X6vF/S2O0Uts/9r7qh7YOwPbCdPwV+UZ9V4OpG/3FrkwDEG
	GV0aQ7oI675BLuGv0MFuT3BbVksww3g/qN5SXnMqTkWHMEGEkM09HNWtsJShVTAoHaDtxG7XEY5
	59wQRkn5MHuPekVOlPvAdmOhc7e67NVDAN5FBqtWv+WMaPCJL1tgYmZN+AFGxdL8EUgwi44Y0Yp
	BrvtIFWgzy+oqF
X-Received: by 2002:a05:6102:5093:b0:783:79ac:9db2 with SMTP id ada2fe7eead31-78a4a64b7c6mr10797472137.3.1788867832675;
        Tue, 08 Sep 2026 04:43:52 -0700 (PDT)
X-Received: by 2002:a05:6102:5093:b0:783:79ac:9db2 with SMTP id ada2fe7eead31-78a4a64b7c6mr10797436137.3.1788867832062;
        Tue, 08 Sep 2026 04:43:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b619820db9sm2943377e87.54.2026.09.08.04.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:43:49 -0700 (PDT)
Date: Tue, 8 Sep 2026 14:43:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
Message-ID: <le7zslxe27qauz7duczbxl4rrd3kbekg5cwxzg5tmsy77r2t2z@7gdoif3yfkgg>
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <80eb9f51-9cff-4c07-822a-759360617cbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80eb9f51-9cff-4c07-822a-759360617cbf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nKhJf_9O7k2cV6-YT5ouDKoM5a-Gpdng
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEyNSBTYWx0ZWRfXxmm3vVg5gP2C
 JKTH1DNYHTyOyXHVY1oCAi1ku01PNIEtN1nshgynJbGsqvQ7+HeZVBx16M2GpLteRDLpVldyW09
 Ai51T9/9sGo/rTM6ytMWXooUHA9ad4Q=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6a9ff4f9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=OqzjHUTi1ChSdUIkaaAA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: nKhJf_9O7k2cV6-YT5ouDKoM5a-Gpdng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEyNSBTYWx0ZWRfX1O55RX3z6Vhq
 DQ0JnSdbPsjTUNSZVwAd6YExD93dOe9b7DOYSNLnGx0sP6kxqcM/pazTgMSluMLhNOh6boVYAhM
 fR/jE8N/1SCXpDNBSR5avM+gkuFT1h/7nwmQZOaqN2+gNLCeqqNTzzpiNtfFVolgOvWVjQs1iz4
 AxvdXljLGRJFoDmNEsqxp4t3lpbi6SJEZxvIXs3b8X2pDRPBHeMYnP7OQMrpXQjN1URYkLXj0MX
 MReIyr/8al6KUSl2Du/hDfgDOeGgfBiPPK5oCjnvDDg2+WK1veUbuebyHdLsC3MDiX9BcgM7IRE
 stql1t6qJ2UNEEetScX/Y3+BZjgp50QaZxJ8OkigLtxDwqmte+j3VbRmAOinsosH7slrO1GMyjQ
 ptobQzwN3i/0APhYKrPeinK4DFZKE6XfW93e8rvOyercwJkRaiOO0/ZfQQ8GqgRP+WEEO1yUNiU
 e4z6WXvU+adnf13sPkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080125

On Tue, Sep 08, 2026 at 09:03:55AM +0200, Konrad Dybcio wrote:
> On 8/28/26 1:13 AM, Dmitry Baryshkov wrote:
> > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
> > zero whenever the GPU is powered up again and the timestamp reported to
> > userspace jumps backwards. On an a702 six reads three seconds apart all
> > land in the 500..1200 tick range, stepping backwards twice, and on an
> > a530 the OpenCL device timer conformance test fails because
> > clGetDeviceAndHostTimer() returns an end time below the start time.
> > 
> > Save the counter in the suspend path of the affected generations, while
> > the GPU is still powered, and add the accumulated ticks to the value
> > reported to userspace.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from zero
> > whenever the GPU is powered up again and the timestamp userspace reads
> > jumps backwards.  Accumulate what the counter reached before each suspend
> > and add it to what is reported afterwards.
> 
> Could (some) a5xx parts use A5XX_GPMU_ALWAYS_ON_COUNTER/0xa879?
> msm-3.x defines it as KGSL_PERFCOUNTER_NOT_USED fwiw..

It seems it also restarts on power collapse (so always on is not
actually always). Also if it worked, it would have helped only a530 and
a540 (MSM8996 and MSM8998), leaving SDM630/660 and all MSM8956/76/53/37
without the fix.

-- 
With best wishes
Dmitry

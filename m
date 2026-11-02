Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615236;
	b=MicYdNqaq2SNLDg2ZFrsm7TFXxvr89TdpG1tSvPLPO/F/xlQ8Jc7LPUz1j9vFXAUyKS9
	 dH2a/gSwRJu37up0QGbFr+1n/xkcr6j8UIdqKPvz+Yti6rsqlwK8buVoaHuy51ZyYUFH8
	 jw/fwkfZKulhj1YmKzKVtYlO/aTQjwpwkOxtjbytXm0HbiSKMOCBg9HuhW9C2CtUVNgB1
	 oE3+CQGv4ZYOqgidliUuzQydJxCnXg7s/YKl6UhHFxWBRV3RohJVuw8/9r06txsy37yuc
	 y8IIU+J+v9/Dg0ySGXXGg80qQ4MyPP64fBsJBdyTmbaNZHTOWN7YEz2d689PYFj36Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ib+6Qj7A9ckU60iJXh6OYZ606g713kfL86TlY+QIpKE=;
	b=Bqc+vKrVKz6DNPkJDWJvO/ZxfX8uNmx1LmoABk1IQpUJmx/seT9dQxehFxd1hFnkc0MX
	 NwSk5PpA9En5eQkdUbZm2Z9xLHkP49yVXRU13MvfL2qQCexGthApT7QEIwAn0fsjcw0Z7
	 OMiOAboT+xa/i2pRse+n/Ui7SimyGsIMwDIuAwSNZldQ6vvBFWZvMahOzke4OmBXz7JtL
	 hSmrzlUGPWghZUlWFaB+CwpQfm5e5Dmb9hPPyveM6Aa5de1+tAoRgYq/1YXGuF6DA8gzo
	 lHaOI2NzgyzztSf3J/mUky2UFfMFOPMBuJGHGVzSNois216+mEiYkkiFT+oQERAUc3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rc74JD1t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aP5/xo78";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F89B606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F89B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rc74JD1t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aP5/xo78
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AODa3086551
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ib+6Qj7A9ckU60iJXh6OYZ60
	6g713kfL86TlY+QIpKE=; b=Rc74JD1t5B2olBnDuJ5opJY6/MqRjdN48Vx1qN1P
	R70XIQjX9PmM6YzZklHy9o4Uue3mEVrjnDdMPAG6q1poitExPHeG6OeDhnMlQjEd
	HnyANHPJLaU4M76+gqWJEzuAyZeCwsiHD8Wz173LnqeyjMco2CgIztVdfxv3TYbT
	9/073vcVjhx1iFFaKRKqn5YLZzUmxbDt5h10v+95dN2zLKoKM1YSzu/aRYVYslE3
	W8kAeKAxccFyphpbkXN93cqof0i9IWlEEwv9zAetqpZlTl0aYVL3AyjTb/wvVZDJ
	WLuyhXSspFdewmB2+PhzBrDlwRIh3ZYGzbxpgypmP/AIEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61bc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:27:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so588259185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615234; x=1794220034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ib+6Qj7A9ckU60iJXh6OYZ606g713kfL86TlY+QIpKE=;
        b=aP5/xo78Q0tBWvCvUUQ2NGLBDH4xn7dj6K+9sWCgHpzIQSp/Qf2TCrGkpazh2SMjaE
         fyTeW2a2e25YnadxBEbHUt+lEpHQVfREH4DJpgT8aeuR07n2x5Q0ROkoSy+LBtPHyF5J
         GueHPB7pQSw6GwShyKszSJ42osOnQ0vAUHHikRLCiWfGn9TVcivQDY1VA1rfnTa40z3m
         f6I0whOKveCdy3uKz78CtLNObDGM2EYry8Q9mzlbs3i7grJTUfN3vlJfeoopLzfxBgbi
         7jA6Bn3v1ANqqcEQOwRmPHnrkJHPSZhlna8ajkGLWuB5Hi1ZYrcQrcrgu9/KGqB20NKS
         fHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615234; x=1794220034;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ib+6Qj7A9ckU60iJXh6OYZ606g713kfL86TlY+QIpKE=;
        b=DoiQdRgeo+p/cvHkF289P6X8go9Vg1E3LhAy3RRLRmq7BaCAPVBhSeGV4v9uYU40f5
         4pnE7AbbnQ/9Sc2/PDHyvh0e8yPFWbmKoq6v2raSBMh9c94Zs3/p0zTBvwZRjWT6FoDp
         yJWN7PJ2iTfiM5ibDMBFrkB67of0wyGWLuHvLS03N2OJWMmWdWVFRUcjZvSENEjTehum
         43cUWQMAL7EBkGYZk5jeP6P+oGoHO95u8D52sdiwJms0z5Elhe39WuosF3F94PiJiKyI
         uja55+/bYGMM5Ce1J/6HEZSZeeyCuuE/0RNNJdNkW2zwBgYsA6cNjJb1TF3+Xngg0bbc
         /yBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxR9lWW5e5wOeOY5izM1taQfC1GxPVjZ7XvgJrnwL3c3eMtN6s+9DibF/DrzQIu3VY9HFylYoMsI27WE78=@vger.kernel.org
X-Gm-Message-State: APuU4Z++Z2AUxPlBYS39JUmW0xaTXXhR3GcXR+dEqWchUVnMGDwJcl/V
	r+O22Yn/8guCMESnGR9qdZeVeGKyVw/3w+A4xwoBCoLybz6tjKZBtVh5cKactDo8cZ5w8qUJUPU
	+W/kcAiPYL+4gB7EadbJ2bewmvnJ5WQUDM2YVDfA1iqU+lZYKVB6qzcvBdp3nTFpn/wA=
X-Gm-Gg: AYBFou23/L65cJKDM2uxWhdaCZxYWq7DprFDpBQH/nXAll2S/ai0+Ac1/K857CiKuCl
	jVmYSKgXOVlnYcxsE4C2KjWRmeaR5uGoi8cWRvvjwvnHXBaE7ZXexLDkNTjpNcIz4YBb1aCGIU/
	Ajgt5XNb/ezwyC0OfWKdJ5g4zzQ7tk6KXINqtI/XultCyxCMLLZA7J/8iPInUg+Zt/7irJrgmqP
	hrIMf73FgIT+2i1ADFzofNpZc2f1ECja+Y/LaEPpZptlAOftLdY+saIOcEooMBS2hCPPwVsdvtz
	IEM/TufeNglLu2H8bZfZfaWDskQc8bjyDQOznYynXBD0mvKuVq7eDHGeUJG5Ds/JEBlRzAxTeMQ
	kRxU3S0JYBKFIMvQZ4eHkOOyFEZcKTTMa1uyMVvemr5MiLudofvKc+lJgA60aLyvZJycod78gIK
	IAfoozTt3L2lyHcS4owDOJpLqtt2xJQR+bAQG2hgBAkFbIBhdtQM8GblcQxlnB
X-Received: by 2002:a05:620a:a295:b0:945:afc1:a73e with SMTP id af79cd13be357-945afc1ac08mr460188585a.8.1793615234332;
        Mon, 02 Nov 2026 02:27:14 -0800 (PST)
X-Received: by 2002:a05:620a:a295:b0:945:afc1:a73e with SMTP id af79cd13be357-945afc1ac08mr460186885a.8.1793615233931;
        Mon, 02 Nov 2026 02:27:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edfd3sm1554653e87.8.2026.11.02.02.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:27:12 -0800 (PST)
Date: Mon, 2 Nov 2026 12:27:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm/gem: Fix VM_BIND range check
Message-ID: <4wnqvr4dugximyavejigdvddessngvhgh5xpkvlpi4bvbsqijz@nvmxmmbmnwee>
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
 <20261101174911.25184-2-robin.clark@oss.qualcomm.com>
 <90ae1b4e-d83e-4209-9df1-7ebf778a881a@oss.qualcomm.com>
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
In-Reply-To: <90ae1b4e-d83e-4209-9df1-7ebf778a881a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Y1W7cjR63bNDxdSPdMgWmzr45e5eSq4u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX5/fSSSMrGc8r
 wgpJESOZbcVeg2bm3G8AmU1evNe+Zj0t5GFCp7P4cpO227rZG8MC4Ea/gJnKSyqfjDjqSYiu8Ed
 Xvw4Aoxmvge7YCmgsIva8HPx5Th7ldc=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae86583 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=NaZcOW_h6FOph8AvsZMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX07sNdmVsIsdA
 mxI8Rp5CVE3cDF76zLetOss7uVULO1C2dZ73SlvtIyjOk7oZLe6xwfAoR5mAbTtmCSjXIJvXkmU
 0Vcy3Gs+ds/cHcgDW7dx2emFJl6FI22e74tmvn90PDTZrb6SFsIeIZJKgN2K4u3pDt75Y9M+bsy
 YpIQq1hG0zr/hbZq32zR+2M7BlGwthPeCnLCjopRiR2jhP/XNDhUa0KnoIlKiGvOlg0NuVsr0Ek
 ZcW3om4BoB0V3nJbqRI3uqWkAG2LDSV6dGA/5I52HNZw4QPIp6rNNvk3HwozVscVjxeoy4J0Wef
 tj/+XTP9DOZk67ypOBasH/sohNKkJAXHivwnvyBBG8QoqkTlIB8rQnkAkZkVSmz1i0hk4aoX5Dw
 jzxoLdTO9k0lI67fJSiJ7IzAghdhpdLKZcSKJYy/uhQ5xwzKWQfwV5Zk3IW72gZUI24cGHv2fzR
 XgjOv5Ni4NFXNPjdLtg==
X-Proofpoint-GUID: Y1W7cjR63bNDxdSPdMgWmzr45e5eSq4u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020041

On Mon, Nov 02, 2026 at 10:40:06AM +0100, Konrad Dybcio wrote:
> On 11/1/26 6:49 PM, Rob Clark wrote:
> > Use size_add() to guard against overflow.
> > 
> > Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> > index f687a629629d..16b3870d5e90 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> > @@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
> >  		op->obj = obj;
> >  		cnt++;
> >  
> > -		if ((op->range + op->obj_offset) > obj->size) {
> > +		if (size_add(op->range, op->obj_offset) > obj->size) {
> 
> GPT and Sashiko are unhappy about what this does on 32b

I'd somewhat doubt that we would ever need VM_BIND on arm32 platforms.
a2xx isn't Vulkan-compatible, a3xx is questionable.

-- 
With best wishes
Dmitry

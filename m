Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EFD1B6D08
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789336777; cv=none; b=Ctk5p5h1BtBAzwqKj3Br2s3RUPbOmytXV+bp9rDW6Qxc+d/XJyKGzXhE2HE3EWJfEKgkrpP721el9XAjO0JukQy5H7GnqcRIrjv8eXjKXfEsk/PKeHCOreqtRYNn8pMIVQ1IrxOS3ovUur6o5rrwVIHdYBS3QSGimrDArVtECak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789336777; c=relaxed/simple;
	bh=F4CyhSRXsOKZ0xZf1afrsqQt9p9O5tstOdz0XZsat/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4XzBmcy0j1GZzZIw74tuf1DeJ+H+mWfIr5aDrNUteB+E/wQPltG1ZqIvi071Le6DXzoZcGjCubBcGk6IDgJ5BtYexHg8QHanbglGY5/OLRB/QC76PfyJSYxX4qioFOxEEudomkUzuCnTUIxtWQu2oF3M+LjgTeZJrQZeCDwLnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIv24318; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jltm7kr3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIv24318";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jltm7kr3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxRAj3775294
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C5HYUvgwnNyezi4DPkW8H3ba
	CzRfmbYpk5g0hHr8iEI=; b=QIv24318GDSw+I3oxP6aB1sILBiVgSXDetUkMeGz
	29IUAhrqAja6P2giZ3Zv0Ve4Mu61H6U21K770k/LlzaGoq7dZOOyVq79ih2rVxQN
	uRZhATZVBp6IXQiTRMb7ectV/fjyRSF7jufX67EINMhrDn+cuP166Q/uZBmfnoQI
	nmXcuE5xFMEWeuWr124W/FoIcU3gtkmua8aTEoBWO0n1JT2G9k13QWHFR7ak634o
	7YKK2YoQpJQ2mvy0IsuOtIIV38NqnZgyt7dbSZSxUl18gXld7KMVvVyOvwD1U5Uv
	cH77OFbPAdnlPQX7XavOKHeGRgB5l+8tdhig+dmysZEkUw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cm7d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:59:35 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-798c310ebb9so560015137.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789336774; x=1789941574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C5HYUvgwnNyezi4DPkW8H3baCzRfmbYpk5g0hHr8iEI=;
        b=jltm7kr32iiZrMDHxD1l5WFmbrT5+r88fMDjT2T1r7jGRlybDn8FLwUQF/pwq6fTnB
         tNF8VtVeRtxo5HV4T3QRy95a7aMqEveJfVNXlX7RneaSVMmkKYHkW9clm++coxdJfwhd
         PyZipcnXHBzsHw4vXFcXzZHQAvgiha1rRwgkaBXOcVvhBnx3QKqbg3XbBQsXZkWc/Uo9
         qHUcLK8dKxZOTBxyPfrs/ba+PFXikHvX+6gIO4h+/QVVGITQgKNYGLyDwdE/RZHDLns0
         PF1Vw8ZnkewySostt31DCaV9DRT56tBwx+f6++py61pFFxEfGo2nvC+xE3F0Mc4DcyYo
         u/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789336774; x=1789941574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5HYUvgwnNyezi4DPkW8H3baCzRfmbYpk5g0hHr8iEI=;
        b=httKDBYGvLxt9NG1wlTGv4O0NfMUsmMlu8gc421ZZB/KX2tU0D4pcrWu6vmRwS9/Lt
         mGmaVSSNQw5NnNARbHl675zPQp5O6al5zlDLU6v4MDofERMfhNj0lVuxH4WpuNMPItET
         uXadZToOCCCKaPrpchQQmmDDi8uOtRHkd+eYD9wvT0JU7BHhqBvbE1VfHltlmsEoZyZ+
         9kV5KE/krngLozBKGcRh2c6a9Oe7doH6LBFo/ymxcBuzxD2mjBds6PUlcrIqrwXFjOX3
         bEufT8l1X48xWRKZYhoBYfvAze7hwM60Aqplhc8w5bnIdNk6/q2WuTM/A4YbvXwsTciT
         xbbw==
X-Forwarded-Encrypted: i=1; AKwUvByqwgSFsoTT3x6zsJ02t1VLsNHbYj3O8s3amBBaappRp5zP08YCI+88XNrxD8k/+VlUvHTSrYsHM04SzTU=@vger.kernel.org
X-Gm-Message-State: AFuF++msNMWV6DBttHnF709ysHWnGpnhtxAi8LxpoH5KR1k8V7HpEir3
	wElbtTAvvuinvWCSuC1giA+ekmYLj/4OqoxWi5IzJYPBt9EijjulzZ+5RWLpfv1se3JlD+BdVvM
	KSzNGfwKbom3wUuuR3vXJj4lQ7rgFbM+EaPXQrQ7vQvWmy7DLHvAQeyHt99vvou5HPwc=
X-Gm-Gg: AYBFou1kCrp4X81i1sEUxYnB3kO8PMkXLW9KRmHC6P1nzlILb+vdvyPkizUxLvxoL4F
	inVL8s1Meao4e9FPTVif4UABVtdwbgo+ZEFzX6KWunrqwvSDkNxYcoDWKfFObc2D3ARWh9+yyzH
	X3SpPdBZUMG+tIUGEUs8SSQWxYPYyi25YB+0dfRhEDPTsKRlflRsg8+xwnWJ3+Iiv4/X2/NPnZt
	Gm86dBMZaoBP2QbeFkbpcHQlBoqyJExKSvvEdjZv5mUJAVcyZtlYNLL0ppIak2dm1qKqrA0Vte+
	LcKN9yBY3hIWgeK/r/pRt34JPbG4EZk2pB8X/ps/iM2GYEAIp6O4jX3xr1IjssnjW7i1T7HuI7a
	jLopnPlh8Qq5AtTA2yfPQLP1IjiiEWTnJwQAfjhfAlrHa2Dmp1XgtlhVqZtt/EmS6svobkJVoYD
	IzaQU/g8HSQxhF
X-Received: by 2002:a05:6102:869a:10b0:79a:62cf:2a50 with SMTP id ada2fe7eead31-79a62cf501emr764776137.7.1789336773893;
        Sun, 13 Sep 2026 14:59:33 -0700 (PDT)
X-Received: by 2002:a05:6102:869a:10b0:79a:62cf:2a50 with SMTP id ada2fe7eead31-79a62cf501emr764768137.7.1789336773560;
        Sun, 13 Sep 2026 14:59:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0457189sm1907495e87.25.2026.09.13.14.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:59:32 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:59:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saim Shujah <saimzst@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: clear pending flush state before physical
 cleanup
Message-ID: <wyoltftfpoxowxs4g4uwa2vi2pnspubn4vw4l2y52bwrhcjvew@xh3og5yp7uaq>
References: <20260826182459.1506522-1-saimzst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826182459.1506522-1-saimzst@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMxNCBTYWx0ZWRfX39GNf0OkURfn
 Yj+8o8t4k/Q/s0nyHlRisQCyiGseoj8SmFCK5FG9g9EvHDXxe5WHbV7c1vgqM2QpAmZPQKoOCGh
 MU9hGOZXwbdFq5al4eXDf0NUrKjJfv3KHgvBVtiV+DuSVCAlhPyVa0Sv9gQXlL6E0G2TSOpoBY4
 Dn9FkUtFqsnXLw850SP1x3gR1gBONcdDZInfo1+eX5NNoRtaWSofWA4VY9lUlvAJAVMmVLN02L3
 uc4wXp6GzjolUpG1r0Rj9RAjgBcPe48poAs4v//wLG78jtSccMxL8BFaWZkfB7/ObzDbqkNcqD6
 +2tVx17Eqz7SSreOxWawM+u4Zx6A+1W1FNLkvS2wd9t8ioUZEmn5DA9jNluHTwWDFtwaj9nudtt
 mz9+kHV79zF9YrBPGTWJBhB1/Sa1LEj8cQp0iL/U/chAvke/R+51FVB+FqbfGCEvUgDBQa8saZK
 ibThORWhKXCN+pMouLQ==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa71cc7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=r5cTPNi_baYN2tIuLokA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMxNCBTYWx0ZWRfXwpFeyiRDc5tD
 fbP80zs+FSQPmmq9T8UUHqIooWjaku4HeD3XJlLQP6r9wclBhxs+gNXpWogaOuvowWw7HCA0T5S
 0vvpsuShSPtqT/n2U5IwpJt+afEfoNI=
X-Proofpoint-GUID: UopH_4itGFjonL5gFTZP1qQ5LPeHVvel
X-Proofpoint-ORIG-GUID: UopH_4itGFjonL5gFTZP1qQ5LPeHVvel
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130314

On Wed, Aug 26, 2026 at 11:24:59PM +0500, Saim Shujah wrote:
> Hardware can consume an active-frame CTL flush while the cached software
> pending-flush mask retains the submitted bits. Video-mode disable stops the
> timing engine before physical cleanup, which then adds teardown bits to the
> stale cached mask.
> 
> The teardown trigger can replay source-pipe bits after timing
> stops, leaving one pending and preventing the first commit after re-enable.
> 
> Clear the cached pending-flush bookkeeping before constructing the teardown
> state. clear_pending_flush() updates software bookkeeping only; it does not
> write the hardware CTL_FLUSH register.
> 
> Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
> Cc: stable@vger.kernel.org
> Signed-off-by: Saim Shujah <saimzst@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
-- 
With best wishes
Dmitry

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4BE2E738A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943680; cv=none; b=BwNDc0KyYDj5GslVSy8ze305wFREJEjiIB79+ROEIfN1Awy8YeDgfqcYkWNChpRlXHfXALztV6ybkslOW3ssQA5anZORSUZM0mJgEWUKH3uNikaYMG4QjAWIcQHSuMFGSDKPQV/b23hOodwPakLcZskGE1B0Hw3ERgCir7c2LCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943680; c=relaxed/simple;
	bh=2LejIYv1mw3zhtuSKKt+Gu0dMT+z/pVFgluGypqiXvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dzjfh3U/QGUJ7IqvHK6zN28wHVna5zBHL7zXihMO0oeFV7vpX3zg79YCSuwGwC+KOjh4ZHX4tu1iDvAKa1JCjbzMDRY0EuXgkCmivZwkzBVHuAWD1ApHI06yG+xyL8gY0Bu88Zd6ihflkojHgqBIY0YbveGEBn1nIj/7w2A6xDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiJwpzIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NSGfSZr9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiJwpzIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NSGfSZr9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nSKu2062046
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 12:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wae5KuvkJ0kAtp7ZnZDsr83K
	4A2AnXNcvedN/k0fXnc=; b=TiJwpzIBToM310YAzU6ACgCASTz0OoHb3OEj23dm
	Ax6ZX1cSwKkIFII848co3sPc7bRFgWeG2GVypLniVuow/M1k6Kwt6He8KkRcrYLT
	lDn8faBRexmecRaUXtHZwjbffMUJY/HzZBPpJ/pwiCuXGAqJgOtvygyx+MI2OHhI
	umtkcDLmDa/Q2IgOFqWbuPAxLnUo2N/2HGl9eZkRRtS7/o/8pWOMj8B6e3yXZDZV
	Wncn6sNocfLAnMQQFY0UYzXNewmvOmFbJFjlcg7irE6KqLvwYf1DDqBtmP2s8Ztn
	IcsJvEKLIlciu6Ya65sEw8F132yepQrFFFLR2gwx1mAUiQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mscnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:21:17 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7be858243a6so538354137.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790943676; x=1791548476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wae5KuvkJ0kAtp7ZnZDsr83K4A2AnXNcvedN/k0fXnc=;
        b=NSGfSZr9BrD1QES0Hh2HpcZmmYJztaDL3ryjfcYcw26J8IgLrzL6PJ5N/oeTrU/Cbg
         pDjDeKVevtEEKt8SfC04gVVtUvPKqx7sNIKEY1BWdMdSPqSB69cI+NxjEjMFqsWeWRCz
         WoG6U+0VxR1v1pw8z1iHtgxpNzraB87kWy7/jA17UjWohjmxQaJ3qgIP2lMGCg0pNHna
         LhAFshFfGdZhw+g/THjaVcaNmXypeoPyh4VzS5y4aricLwKGa1AoVhoh8lMUjDjvA3uE
         pDJMZSRvzFOhPUtUIAjGtxRXmW/pze9OT8jePitm5qvBVdbOVogjPm7w0iXWKlOi09Kw
         HmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790943676; x=1791548476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wae5KuvkJ0kAtp7ZnZDsr83K4A2AnXNcvedN/k0fXnc=;
        b=iMfXHqpzL412ha65vFi+D6b965C1bhyBYx95F7hG6DGxUAOtsH1R+DaLCqxoWKp82T
         Yy3F8JUgmXaSzxh6gXnyjkQ31TjlsLc53iICRe1WYa0EP16e0WOnzHKR4FKVO5LuADAh
         B2PS18V3QTrbJtEZwZSoVaSIqrC1CBfm4IaeGwXljxWdWGjiHPuZZvGzm9ujeo0uw6i4
         GGphBK3Zdm5Jt3BTrMRtz5+LyMfDfOxhqe57aSPZ8kTcW/3D1p3bU7+2cfuuzk0u7xPi
         kD/u2Sr0s5bz+lp7M+OKAgwhPwaXsM96xBd8TmCRO7iZcJ+Qy1aIrBdZlH4HiOZEsEJR
         gkHg==
X-Forwarded-Encrypted: i=1; AKwUvBz/qKPcYgHaGzpbwpUIQkz2sJr/6Dd353FaIayPWfJh+ovu3aLT+XCLVULy08OM7EjTj4T4AyheO8xA99Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8Ss2AEKCcMI/roREZ7U0rjEIoJOvYCfvTKrDHzDiumf4jsCfP
	rS9oqfLBnP9QPELPOjtfWUIS2VbjiYhBQ+Tujg+sOlXgrkBziS67StRE+SjFFy8Z8uPoO26cEU5
	5ookGNm2lM/H8PjTsygoFr6NxW6YN8ingEYiw+3MCvPkjoZUDECd4hIkR5/5/JHEI8qg=
X-Gm-Gg: AYBFou2Hv1oIfxqiDpB2+hgtFThPZomXo0kfwwDqPwubrYifet4VNm7tY/GJPS+80E1
	Dt47+E4+kXPJNB+Hba9cBLQAbZFuLRY8CXYr/QzvSRH30diJ/D+qW8uGU+crRyi4NA2JwR/Dy3O
	jMmeUqGcatJvKvEFx6vgSMSrPUA5aHN+b1xcfsfU0+tDgwgxCIq1Y5xq2rkmCqTmwxeI2847Ge3
	KLasbcyKiqT9b0XbPxzk+aNOFN/+j0zI9hC2QDpKiYgt06HqMcWHw0ZrTvMF2Xwm9sOkXrPbNk1
	5jTOmaEmrWTJe/5Gig1QNeCriFU8cDA6D/eymKmW9geM8UCa7SL6gXeKD29LAtTNCaYF55GzFh6
	pmIWLSzEyJ1HHjQAy7Acy9NSMTkFIouJ2ERAsy/J+AmF04Ijtj7aIjC+F8e5hWqojk4SxBgz++r
	rZnTf8PCQUtmpB
X-Received: by 2002:a05:6102:4bc7:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7c0f59b3ca2mr448781137.24.1790943676405;
        Fri, 02 Oct 2026 05:21:16 -0700 (PDT)
X-Received: by 2002:a05:6102:4bc7:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7c0f59b3ca2mr448770137.24.1790943675425;
        Fri, 02 Oct 2026 05:21:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e32c6ccsm8966761fa.38.2026.10.02.05.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:21:13 -0700 (PDT)
Date: Fri, 2 Oct 2026 15:21:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        valentine.burley@collabora.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/ci: Remove sc7180-trogdor-lazor-limozeen job
Message-ID: <q6yw7ksztmybe7zz7tsrfbnjwsvgku2rsybqn4k56kwd5gk6ka@7uo6s5taakt2>
References: <20260616115410.325837-1-vignesh.raman@collabora.com>
 <20260616115410.325837-2-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616115410.325837-2-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0OSBTYWx0ZWRfX3Qvu08AXRPDM
 NTrgKCFoPU/vqIxgTqlXydbHavoqIzCoTLuWt4zzD2sRRpSNg5p1tJWlwwFLti7nXPE+tkqQptT
 pd8YVJrRaZGebjJKYal9E6Kad5yzIdo=
X-Proofpoint-ORIG-GUID: uwQAH0pdcyFMJeTRSCXD9mV-ElsqkY0y
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abfa1bd cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=JEwvJmOL-QIgOP14BV0A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: uwQAH0pdcyFMJeTRSCXD9mV-ElsqkY0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0OSBTYWx0ZWRfX+O7cXlmzHsIm
 OFu1+75XAwhSSu2adYs6Bv5Zb7YyDk9N4Ftbj+XfXmtGMLIS5pRnE5MF75vUmpv30OHq35T5XCF
 EbdgCm7MFz+8ChECRsV9ym+FWb7LiblrSGohfRHltFbtMeavlf7yW3ILBgOkyUyFuRkpz50KKu3
 sZH7sbtkHfetwGU4ejUuKbvdr15SkXTpRZm3+uoOxnxTk3v2OIPZtiuoGZ6DVrMwJLfH8fATUva
 k19p3LkE5/bCA4LwiHsexeehE7o4X3nMiYyn4/hyJmL+LsGIwaUe6sDA/UDejOKWbIjhhlaR7bW
 bXnsLzs5HBMDt3G/xdgmMLuNVhh5ZK9PCM3ZF95OySRSlTd3UBMjlaXNg7Q0vOW7skNs1OVCCUV
 K3DX11MQXxD7x9c5mdKGqrudiHEtgqF5bT3ngdxwL07LgAtIM4VqgvFy/JvKsP3nijMFZAL+hd9
 pVHo9L7RwkZx1OmDMPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020049

On Tue, Jun 16, 2026 at 05:24:04PM +0530, Vignesh Raman wrote:
> sc7180-trogdor-lazor-limozeen devices in the LAVA lab have been
> experiencing stability issues, and 4 of the 6 devices have been
> retired. So remove the corresponding job from CI.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - Remove sc7180-trogdor-lazor-limozeen job
>   - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221
> 
> ---
>  drivers/gpu/drm/ci/build.sh                   |  1 -
>  drivers/gpu/drm/ci/test.yml                   | 10 -------
>  ...sm-sc7180-trogdor-lazor-limozeen-fails.txt | 22 --------------
>  ...m-sc7180-trogdor-lazor-limozeen-flakes.txt | 20 -------------
>  ...sm-sc7180-trogdor-lazor-limozeen-skips.txt | 30 -------------------
>  5 files changed, 83 deletions(-)
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

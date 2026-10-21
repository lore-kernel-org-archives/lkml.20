Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792598752;
	b=44P9gMu8dWCt5IHs9xH+dNaTIyUn4jtyknE3/05wtpor0tl4t/uuFYvl4algd3Mcb86h
	 J2ETjjLxT0aPFizzbpzc6UOnZ7olfD0UPDfyy02eQM0otVEWo23kfMJPtMPAFVAZyKraa
	 QQwZODwGtbM0SQWZI8RUQycDEypaOh6YoP47Im6dxRFUGM0PF2WT/90yWJB2Htl9cNZ65
	 plxNK3KYl+GMoZsSiTQY//9M0PIKpLjLxy1WAB4h3d1KMyAxJhuZA7T/Qs36bPMspSDMu
	 8EAtH4JIPB2kX4lTgA1lG020EyHHIhz5/RUhJQ4SsCRsX6ebDb0VIC7Lu3vW/lIpjbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BGhrLTjEVfeSljGkSaGNfONmhTnpvkCre2s3TB8eGiY=;
	b=wh6o/SqgbyB2dbKeL82VC2f9cL9HdnKAY/fDvElpJkr92z84iVoaRYXqbYwCa7Bl24r0
	 NKdzU8fqbUbi273LxRMxbzbT8V85Fae5hPGw5ZELOPub0F41KHujCm+1m7pusVhPskqYr
	 7gaRAG/1ubjvmbsw/rUxzVOI/axLJCOHE/Pcq2IxDnZkwFWI2odIeLh26jo4m6JVvx0Ok
	 L3HTIoVw4suD0SG1MDGmDgA/62GxYv1WEB+2Ici4rpz8YOXeA3rS+rB+y/h7U35jfKzlq
	 FpfIEQSi/C0E6kUvL6Ri21KuuAoAQAD3TTZVSMxvStYKs9Ht4fzbonT+hJQ0l7CEayw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QF+iY6NP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f8kNEQP8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32CF606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32CF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QF+iY6NP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f8kNEQP8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU3Y6992026
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=BGhrLTjEVfeSljGkSaGNfONmhTnpvkCre2s3TB8eGiY=; b=QF
	+iY6NPtVXDmkFg2c754dCaLi9wBZJ64tabbPIqvCYM2hw7K6TXqh18264ncOM+vE
	zZGvgHNo+edigL6gc/1wD+g+/n35dC4k4EYCl5iEhXncVUXlZFb3+r7wY0mOuQsq
	d865b3iiJsccMFLqflj4kW8MU2bEC/3n5eDnHKh0clPtJzpaL2h4a060IXOC0iAZ
	wwn0spZv94Qv/mPqTvnnf9+e5t5g6nENhuGu6jxtnaakUdCgK/nrNpGP9iY+1Lyj
	kI9Idp3Hk+WiT+IzrQ20sygP+zOn+0fwJvLDb3McMzB8iFo4mIhAmicUmrKyTqo7
	iicxtwYBIZTQAjToK0NQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r3x6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:05:44 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-48296f34f1dso946441fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792598743; cv=none;
        d=google.com; s=arc-20260327;
        b=WfDaQtRWOLnIqAKkTmUZxyOWePfr0VKcm/WumI7EzHlihBFW2nKsqx2vlH3S3PrnvT
         GQeP1PZIB3Smznnt6RycX5CRQHFD3KzKaLtBopht+bhFrWqjvwLz+0vfVJv5qCaNgRNR
         b33AzIZywjf91vnSNOBujwBJAuCIyIVsMgyeSoMIdtrSkp074kNNwyGmlG/gDkVQiqfv
         EmVdIfQ3zk40thUIY/K1RtIHpA3K0Yhp/71Im69AspAXKDHX7CSV9kg0lqCqa39kEnig
         x3HsnxDVknNM5JwsnfFPxqwAMTdC1oHmBfPxyi9DUMlH6vNHEV13ZtZowqj9ei/IXRHe
         RYrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=BGhrLTjEVfeSljGkSaGNfONmhTnpvkCre2s3TB8eGiY=;
        fh=6VCSd55CNtZX/NVTQ1+boqgN88pu4mjmoLetF2XogfY=;
        b=M1om58NyHcKPm+Tf3rjoyZneGLienldH7MaoUhfnXDvg27Tf83W+ZOvvHsIps2WG2G
         H4nlia5K3BTNXI/e+fo3ZyPxdwTAdljQxdqKndgc1Vhdez+hChqGSmYbgZJI/D3cOHNi
         gGo185qNsqsNLqLVJSDjyWDJ5Yoewcw8ErDyGliXkgPYr/6TONkH1QqpwqEKyuD2bgDm
         eZYM2nU8P98YffDrzYfbT5ne/V1BYnQ1QM0/VokdP7at4c7Avhow2p8P4dCn/xAKyvdP
         +KmR0aZp7RwHPPHUeqehz+rS6ym4NwS9KcOhmXVFK4zc2Jmt7I3MEfSPgLEgEixRE5Cm
         lsFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792598743; x=1793203543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BGhrLTjEVfeSljGkSaGNfONmhTnpvkCre2s3TB8eGiY=;
        b=f8kNEQP8X8rh+NdaHVkZrkjGM3gWOJNtu/vwlEmbaYTJ8eq2jgPLUqTuOSAsoGYiUT
         BzI2DszeUwtGAwqFKAZXZ4WGzMbB/S3wCzZlyWDIalzi3RimOTXcF9FiE02aNYTzKfFW
         8B4S4VEH5JB0JYszSGD5JPKXMR+ipmQrCJJqmP3gVwYN1mLbSFhbXeTrD9jr/Zv75C3+
         C+NMwhdek/X4nvS557REhc2LedGslkoLryJl8RYYk3XcKOD80zkeyv1QBOpK6o72FsKd
         sISG7TNwiwI/S70osHstcwJH9vtTQ38Hj+Q84bJxZaPVE65bmBWYEVpKrr4b3I4kWTz3
         AKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598743; x=1793203543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGhrLTjEVfeSljGkSaGNfONmhTnpvkCre2s3TB8eGiY=;
        b=P11uLGM66uSWJk5I2kE5NufDhCE40hbyCYVpVe3nZcs1fCqpAQQony4RHciTGgHx1w
         JUvlHI7vJ0R6erYwYG76DSlRQ2HiqGg0GXHqI7fq8TWf9mAd+vMMAJOzAT2hciyruKjZ
         PIrfkGi9R2T+B/QXYx0aUp55uq06wm2FYRRp3+3yczlm5W5e4QhxiIc6CR1s0kVJJKWk
         Yu+j87GigyoewRqfsEFIntpDqRUzXCy7c2heW4fyVgre3z78xJeC7ggZIn05lMexbh7w
         V1iPUA/05Bk8tNifaX4lyAXl3nkchuaJgU/batE2KuzMAxzuIL2z2LfEFZmGtsFS1Fuy
         reSQ==
X-Forwarded-Encrypted: i=1; AKwUvByLqU6VfZ4jgx9TOMbIDRMG4m+9PhjsgWKr6zkJNG2ODwAX4bwSYefMRGQZXcbat9pv0cRLqEThy1n5IJY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8Q/+4xvSkZ6y0cO1KtxrtYY/9uNUBAh4OGPhZzAqrnRSJohQV
	tfK2MxsCz7qhtPLd+N5nFkUeOrbkxPJL5HANs2pSlAvIm7oCovYCF7Vomw7cHOsqTyxaV1FRtlW
	psA4N+soFZXIxTh+IelBdfAh1W38hVAB/YFm1ZowNxnXe96Yli7CDGK+GsF29zdjZiKu7k6BcPn
	3OPfWOxS/+fuQ7cwASJZyguXSClI/uNVQxF/dpubihWA==
X-Gm-Gg: AYBFou2NasoO5ulRO9QOBHlBLGFvZREvJ8klqmVNEGAycdlkBUCtWY9VCWRHtE7HIZV
	dhLOC+3RApWg6YWWl1i847bk0ftHLpjpS9AEGricoa1eo1ofFN51UtfSHH+flDTcmKD6ZmInU24
	7q1CYSyvrzKrB05JNUTBhJQGwKx1guY5Ll1Rey3azILL3IYlyXAeLwc/pzZA==
X-Received: by 2002:a05:6870:7d15:b0:47d:b8a7:40f5 with SMTP id 586e51a60fabf-4a7dc2035ffmr1350669fac.22.1792598743649;
        Wed, 21 Oct 2026 09:05:43 -0700 (PDT)
X-Received: by 2002:a05:6870:7d15:b0:47d:b8a7:40f5 with SMTP id
 586e51a60fabf-4a7dc2035ffmr1350633fac.22.1792598743215; Wed, 21 Oct 2026
 09:05:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
 <20261020204728.28844-10-robin.clark@oss.qualcomm.com> <7f3a33a2-8194-4d6a-8459-73371bbf1b16@oss.qualcomm.com>
In-Reply-To: <7f3a33a2-8194-4d6a-8459-73371bbf1b16@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:05:32 -0700
X-Gm-Features: AclHuK_bRz_aEIm5tFG7vlDWVRVzspcPQvhEeeXHkuLP65uLy6f3eGGa47m5FX0
Message-ID: <CACSVV03b9vRO6fqH4ERhpAWT_=F8dKfP-MmqCD2cT_=Gk47=vw@mail.gmail.com>
Subject: Re: [PATCH 09/12] drm/msm/a8xx: devcoredump state capture support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8e2d8 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=Exdpg9e_d2Mu9UHmcJoA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: m7Id99ZIeIl151S1c1TR52oMNyiDY-Cp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX9gY9BGAROmfM
 bfdc4JmAZtk9/WofTRQaNvzgpN57tiD0dur8ypE5eln39wq7JT7Ptjd32CyLHpxFQz4HxG+kX+H
 jTPcvbwxWm66BgU607RLXrLigNE3aHuM4yYUSao/xga90NOJrz8FoHwd/b25lnCv2d/yJTxK/zf
 etxUq84StPJ+nsVWcQZHDBNIod0LXoCATtg63JsR/deE4byTUsaqRdpc4/rR8xStAAAm7GZMNJd
 /7kqHsObQEIkV2IFNHjvvm+58NZ9HOX4DGIkG1sHyMtIpdznywOc+rl/V6oHnACJomdRlz+cWN/
 BcSS5Qs9sl6xhb/1VBl2E+l+0ItdxhMfjexKA/GJvE/LhRvnC49XhxJoH7fecTVtQUB4YKHQStZ
 IMcatHIdFKum7afyEAg/k/C0sjohTF2nAojmt+YO9qw3zA3mEw7zVGxCsj0yah98WEyWXvsBkAT
 E9Ruyrjy3RRQW+WW3Lg==
X-Proofpoint-GUID: m7Id99ZIeIl151S1c1TR52oMNyiDY-Cp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX6yDtCDHaWujk
 kIWBzESysVY/54wu+D/vvM9gaLtI3XGinzQ7M4bq6SzVbA6A6j5zq2Q+m1o9MnnipbebdtjxybG
 l2zfgD+7v0qga+RBWRcfKlew5RT4LxU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210064

On Wed, Oct 21, 2026 at 1:42=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/20/26 10:46 PM, Rob Clark wrote:
> > This attempts to make it easier to compare to kgsl, the downstream
> > driver, to make it easier to spot bugs or missing things.  Such as
> > re-using function names, etc.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> > +             .show =3D a8xx_show,
> > +#endif
> >               .gpu_busy =3D a8xx_gpu_busy,
> >               .gpu_get_freq =3D a6xx_gmu_get_freq,
> >               .gpu_set_freq =3D a6xx_gpu_set_freq,
> > +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> > +             .gpu_state_get =3D a8xx_gpu_state_get,
> > +             .gpu_state_put =3D a8xx_gpu_state_put,
> > +#endif
>
> It's odd to have 2 identical compile bounds side by side,
> I'd just group them
>
> [...]
>
>
> > +static void gen8_cx_dbgc_debugbus_select(struct msm_gpu *gpu, u32 bloc=
k_id, u32 index)
> > +{
> > +     u32 reg;
> > +
> > +     reg =3D A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(index) |
> > +             A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block_id);
> > +
> > +     gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
> > +     gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
> > +     gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_C, reg);
> > +     gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_D, reg);
> > +
> > +     /* Wait 1 us to make sure the data is flowing */
> > +     udelay(1);
>
> Should that be a readback instead?

I'll update to a better comment from a (different?) version of kgsl:

/*
* There needs to be a delay of 1 us to ensure enough time for correct
* data is funneled into the trace buffer
*/

Hard to say, but sounds like the delay is about more than making sure
the AHB write lands.  Same goes for other delays and barriers.  I
guess downstream snapshot is well tested during bringup, so it should
be safe to align with what it does.

BR,
-R

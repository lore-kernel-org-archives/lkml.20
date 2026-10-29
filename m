Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271320;
	b=WKXZWqSTBpS2AHMyyzE/S/wnHmxvhzO3V3CMTE+h93owXKZsmhJCsty0bXON4N2Zl+r/
	 lGLz2Bb6AluGsN9b6SGf/+5orlMcw2CjP3dTiJKh22ZyU+JFcM5pKJuwA91UGqbzBpU2p
	 Q53i5x4qhGzw/8aTxFF67Svkg1FdQ2fgJAmQ5TdzZVFqPghwCAgn7E9MKnwv1CzZvhLk7
	 SD8UMwzZyUL2K0TbxD91kTB+6Uknblgspsj3BAlxY9+v/n8ozmwaoMWveTDhWcwd8r8RQ
	 mEWzlN0ivPwF9r8zkF5j1TfJ5plL61NtY9deeYWBuVUKpQ5h81KusYLO2HhluKreYsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kRQ02HMpLQO7yduLf0Ej4eDHdHrDR4RBPe/ZlU/WyLg=;
	b=sZ6QcjM89O7JuJsfIAJIudanQQgO7+BxB3FVNEM7oQM/a4MGaWkFuZtrIO5pO9s9mqN2
	 /T+v/kGJIaH8EsuJwvSuc2JqFvcEn5OXBPpt67hUQv5xCxLZq5A8Q0btczqTT3GU4PY41
	 hCrLQX0kJhxPIAUt8xq/gfgxU4yg6CYwwmLeQy9vp+vL4yRAnVL46exWHcJ+n5BCBY55o
	 LgUCK797W6GsBWbV86fLo2DV2gU/7UAUxIPbx7hQstRUs7Gtv4suLGosDbkCMZDu7vHE1
	 jcueU6Mhm70rgmwrFOnOltXkVq/pUhWai7QQOYzp0nkYn2hBXEuK2VH1E/fhjbyOpiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h5ds+4Nz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTZcDSjc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C053B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C053B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h5ds+4Nz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTZcDSjc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TA3juZ3607046
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRQ02HMpLQO7yduLf0Ej4eDHdHrDR4RBPe/ZlU/WyLg=; b=h5ds+4Nz31FxFcC0
	yYd4bs2DRWtngnmfVlkeCjFwPcXpfBRKRoujZxONoZCYvnbEH8QO/v8Op74WGRp5
	YDqqQspGamx9P0rYj9/OQWTlpYrpoYR8T4xxgniSp/FCYc0T09Pt5Dvu0W54xWQ6
	NLK4uoEmIVP7/CZ55Z4HfcoSy4ivMTabaY9N+Y9DcwaUqUucTkP8QplGZkhix+O/
	8J2494qywp9lOIc9pa028aB8Fh1QpfpPdlVuUuCKaRljSN4ErnDQGicHxC50YPib
	BHS2eLk65yJFNPXwSZ6OVdwwpe40qzz+7rNiwBWMIDVz+roM4QrtNV1Uzas4EvXr
	NxM0sQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fg5sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:55:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso451453085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793271318; x=1793876118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRQ02HMpLQO7yduLf0Ej4eDHdHrDR4RBPe/ZlU/WyLg=;
        b=bTZcDSjcvnWDXna6F1ke4t6Oi/T9jfgYJIZiAGO1ZxRVCTQxa94dZCjKCyfLOEnyGH
         Lg+AXHGnqDIkw/z3OMuM4VzWv1YwEDU4+0WSO3dCqterVw2517XGjSu64XmMPg4RkJtZ
         BTV1yvfH5knC5Mz5ObdALqmmzJt1tZ/bMkjPYRy8vmQKGP2oEiGwGjPkUL5nQrCz9r6K
         xl4AlHNYJcRhRB+jgiMxBCn4jR3ljwVIdkFJGjmyWqf9mbBOIiztziLWfe0odH0bUOeL
         7/l2XDWefDXagzOmCPlbb/NTguvb5RPZJKS7RRvYdveT/OnaTsXl9wwBiukZc/SMgHTb
         9nvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271318; x=1793876118;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRQ02HMpLQO7yduLf0Ej4eDHdHrDR4RBPe/ZlU/WyLg=;
        b=v2ThE7Umcchc5ZLQ22H5BL5loUcN/N9O3THcUVbVS6UYvhjSbloS3YJvwz5n/pGdc2
         63A2cfgmziaX/xgZAgyTb1Ch+zdQ1QTsx2G3vqaF/CuBZQrueOV/FMu0qCRipl/JfkU9
         mSU/0ffVjubLiW71NofKmddIppxfqYkAh4Z94HeAPTdeeH9fM+X1MoRmI9UC52oJZRQh
         x76xVl0Gpmflt9yrZAMJMDdTpnU7M/0m7aegcDR82bJML7MXt7bsBJ2poFFV6Uw1IWr0
         fkqaUySCZpfUoYAbSdy65NQvUClPoDitRemjZO/qbJ8pE2btrsQxzFAZt7CZiwYJGx1Y
         y08g==
X-Forwarded-Encrypted: i=1; AKwUvBy2Eoxnh4C+aLTPxDMUMrgd3joesIP05DtE97ZlEM+ooQYPWhu00Yls3MfcFInHgsJ4MVapCyMpCAxTk5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFf03kTN8aciZ1ivymCpDXd0Qc31VSwBWgKFapGcFtymANEhYX
	9mllTCZ+FgC6q0l+TJmnDymz8i/faCeAph9IYv+B//NruACmyWoyrUFN+MVeUnH3RNuew/o2XZ0
	7XCiaa8ub9g8wXdEKOe9T1J9Zm+BjNEOgQhMCkwgWQ/y3lCdjUsEeYQrbM/VDGWFZL7c=
X-Gm-Gg: AYBFou0U0D4bQb/dJLvdzIF3PkK7Ikbt+M1TJtJoHgFkZ00oen2be/jhdUK/hZlSUFA
	RrNjT1mgYkfoiY1aatTKG47cLBJ4zeJSBGc984674dLukYSFTPTRkWBh5cXGFOd9Qf8Hh3dJL4A
	iSJwPbCfa6/54p6SxnczC2N82waTfptdXNWb5rbAcMjzubrgCY2nMSCdAuBC1CvkBuP8TNstOvM
	yV0+fvKkftzBibMsubl3/8g1JpcIUlTvQ4E+hyQESChz5V3D+2i9eXAuWicBSxOdRNKkaPxP/FI
	vlqD4t1ZYxrxpkaAA+eIEr5YsHcVCI2iGxYvGuxEcJkFQ46HC/7me5dhEeFnUYUgleSrrIJPN+i
	PvdvjE3Cyq3bfF0n55qW+7nMZzAECyY9pogy0ZMTKUehGvVEpn1Vl3TmM8Ve/wo4fMBO2UpcfGB
	HFA4abEx4vw2fmI+6Xnh7XzhuIQMx0QwEneUasP5k4eazoXAqkPvZg0rnYJupkIijHKL421nymX
	3FL1ctN6T2yIfoJI14TdHsG8ZCx6SC4vSlpaq82KNo=
X-Received: by 2002:a05:620a:170d:b0:93e:c691:a1c with SMTP id af79cd13be357-94408d45cbfmr723009585a.76.1793271317929;
        Thu, 29 Oct 2026 03:55:17 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:93e:c691:a1c with SMTP id af79cd13be357-94408d45cbfmr723007085a.76.1793271317256;
        Thu, 29 Oct 2026 03:55:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:8e96:3679:b9c:de47? (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49d0734d9bsm95378166b.41.2026.10.29.03.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:55:16 -0700 (PDT)
Message-ID: <646b3a89-0a7f-4db5-aea1-42d1f066b4e8@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:55:15 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Soften no-firmware message
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029001601.82269-1-robin.clark@oss.qualcomm.com>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261029001601.82269-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MiBTYWx0ZWRfX8DQQlz7nF+Ki
 Ui6rbQzbZHCPm+fcB/eniCl2cX9jeg0EplmOjT7Gxy1CM3bZJFe3pmMX/57uESVJQBJsxsDBSMo
 SRfJ9rr+ORDc7BRX8HGyrfXoiin9191UVSB58U9YctAAyXFyNAGyjMa+u39xRT8W3KNiopGtNQR
 3KFQuc+dBhbsPPoeNdXZxMKhyuqkGurBT0rGojdEX0ZXbb+cbDm0S8zzIYYeq2XSruv15LtEW96
 BBQyusUg/gtzwB7bSEMkzo5AgRAuPJAAuLPVHFKCqNWwJYJ+5Aifj2HkLPCG/LMa2kCdxoTcOP9
 EewC8dGFGQ4RyZbaZLMX5SqVKOQJJ5TZtqVCA8CncD5N11SUBgrY1317VW86EokVj3aEWk8yLRn
 tSMvaucx/pZnyYlT3mFslHutQBa8unHNdSOmPpY+b+lV4n3j3PXg9bz/PVm//O3J7kM3nRhNJMi
 v8Q5yy8vFs+tIb4PXYA==
X-Proofpoint-GUID: NhA9SHWTGfnVV8GojavozxaDLJQ55Qf1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MiBTYWx0ZWRfXwK3v6jbGbUrM
 GpV8jM1cl7hNvuVVikAAZEr4udSAzwIC9avYCooXKVtTZmR3Qog734HW2DspuLB7iGwU5YhvRac
 4qrasoYD4PrUitOes293Lu92EQRTS6g=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae32616 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3MgKiW-6PIQHAM_P06AA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: NhA9SHWTGfnVV8GojavozxaDLJQ55Qf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290042

Hi,

On 29-Oct-26 1:16 AM, Rob Clark wrote:
> It isn't _necessarily_ an error, the driver will try again each time the
> device file is opened.  But if you don't have GPU fw in the initrd, you
> end up seeing this error message at least once.  Which seems to confuse
> users.  So try to re-word it slightly.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 5832dc25d6bf..6db6cb7eb287 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -558,7 +558,7 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
>  			adreno_gpu->fwloc = FW_LOCATION_NEW;
>  			goto out;
>  		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {
> -			DRM_DEV_ERROR(drm->dev, "failed to load %s: %d\n",
> +			DRM_DEV_INFO(drm->dev, "failed to load %s: %d (will try again later)\n",
>  				newname, ret);
>  			fw = ERR_PTR(ret);
>  			goto out;
> @@ -578,7 +578,7 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
>  			adreno_gpu->fwloc = FW_LOCATION_LEGACY;
>  			goto out;
>  		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {
> -			DRM_DEV_ERROR(drm->dev, "failed to load %s: %d\n",
> +			DRM_DEV_INFO(drm->dev, "failed to load %s: %d (will try again later)\n",
>  				fwname, ret);
>  			fw = ERR_PTR(ret);
>  			goto out;
> @@ -599,14 +599,14 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
>  			adreno_gpu->fwloc = FW_LOCATION_HELPER;
>  			goto out;
>  		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {
> -			DRM_DEV_ERROR(drm->dev, "failed to load %s: %d\n",
> +			DRM_DEV_INFO(drm->dev, "failed to load %s: %d (will try again later)\n",
>  				newname, ret);
>  			fw = ERR_PTR(ret);
>  			goto out;
>  		}
>  	}
>  
> -	DRM_DEV_ERROR(drm->dev, "failed to load %s\n", fwname);
> +	DRM_DEV_INFO(drm->dev, "failed to load %s (will try again later)\n", fwname);
>  	fw = ERR_PTR(-ENOENT);
>  out:
>  	kfree(newname);


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411559;
	b=n94u4sKO8CTWAY8aRZ/E8V3Q4IA5AymCg1Wm8GxAFMnw1BiXtTSC1eJhb2oW608IvvOh
	 URyoNBR7sbOmCEOm3Klu4UcKf+fsAVt9zN7MVNpeCcm9cmdU3tkkK6wXnhLKeu00XHZLN
	 FZbhqdkpwYyH2KPF6lkFvCo8EwgTTTcWOec8Im+4RcaajHpQ68ZReztc3o7ueD3RVJKoy
	 QD61ru/1l0NtKeqPCN96mGFxBy4QOXdETHcjH00sMFfVPqKKvo/u9tuncqX5xEKvgRVGW
	 lrsj8J2DLDSfL6QEIYu39+m3aKVcKmA9rp+3aZ282Wi14LasFHuvoktUizNxa37OyCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411559;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Cttqldc4K8HVD1wbRQk87+5y4p5x85/EZZq9nMZ5e98=;
	b=NCkOrw464Vy7PwxUwCyGLcMkHB93PsL9wKR96/wzsiIUc3QVtyu0fnJ2j+BuPI6lsN4g
	 2s3dxFT9ZB5Uc6jcHu6Cm5ayjtj4roW1kzAHsZkZClyrMYR0NHNGkKxk+QkpFe02nSXW+
	 n2N4u6/imPYPS3jueOtahC1CxfaanmLGoXtYCEtTbtMEnHriZsqumhqHCQBOTfJgvBC4F
	 RNlE2/bLmcorpxoWkOGD3tOGKHxlW7eNK1q2xOE3HmR51GjRqPlckI6YyX5xB0BnQ0LwA
	 IU/wL0ZRRw1bLZguByBRSou5pZbj+CWKvZrAx8wO7p22kghyrOa2/50tt+XBUPEj/tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="T/zu0/Tc";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PVUiuliB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16B5606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C16B5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T/zu0/Tc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PVUiuliB
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF043g3597120
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cttqldc4K8HVD1wbRQk87+5y
	4p5x85/EZZq9nMZ5e98=; b=T/zu0/TcsbdQZMVbAApJmyZ17eSXG9ZjSSnv66lO
	mSNFQh9T5HlenITk1F64T8nKjKCK80zlnXjyaj4lXXEuBxTQg9SM/ZE777hno8z4
	7Zvkq2y/oo8VxQLk8WiT5OmZE4XYjWtK0Q6MAZ0GNIRQusfEWIBQDFhCfIK7lXWh
	9hRUYYa8gALDaXY+5+RSCxbx9+OxhI4Bl4qiKf/WgHY6kwQdnN3L6GhPR1l0cvWm
	zJuDM42zdnQwM2nFvz5/QpauMPAEq8INQb0hJQPs17nMe7Ll1EjNEhxNwGc72svT
	ExEY9dUYV7mSr8DU7ua9Q/glhmgIPxpWAza+w5a21XSxqg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1u8bu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:39:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-946038e22f5so782981785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411557; x=1795016357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cttqldc4K8HVD1wbRQk87+5y4p5x85/EZZq9nMZ5e98=;
        b=PVUiuliBadUZgtrOLHKVTruWHyS28n8e37ML0T8bURNvgq87M/zcMmibG4E6poxwLX
         d71HGHPS6hrQKzVwiRI+3R2H/ZipYWwTcAcOzYvh7+2iWrcHO8fTnj7I2TuewjogmBLo
         lmgTTw1FVlWKECPMDP98U2oyCJK8AGrlgc4xgeMbGNhpMhv8nk+FgZ1N4KQcd2sMJJuK
         JsDWHAeZuev90b/WhHIF45uTjpsLb/B/+eLubNjNqmKt/WzcPxk5l8NAZvhEttRQeBLu
         /KI39lBDqF6kMe3FoPer5nA+XHfzroFxSronITYIa09QAO9JkrsAKscNZ8BTK7yLCTzz
         xirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411557; x=1795016357;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cttqldc4K8HVD1wbRQk87+5y4p5x85/EZZq9nMZ5e98=;
        b=vBZC6Ypf5wgv6RWQBYgC2kll9e7UQHvXShIG3tE/WUcqFhnWglZNh688gpNLbjhRRg
         MrlRhubCdn8kJq4WnR2ejmG59vbh5NImUqpKha1Jaa52qCYvfCwjZUsdepYjI6PJWtzM
         6onfQIB//qmOIJlf2FfPvQF09hODL9x3Doi3TVLgL8nm0/jj+9KxLvHjCZN14H0jzYY2
         Ej6pa7EyivWdH0KUPYMang1pEeUiUd9nfxDYRhrnG4NEHwdP00xwivv2LUO8eWUWbszq
         SBSbdIVH1X7DcxrKaQLC1a+BIy31j7EzTP9pTiraNhdRADJHQywiKw96q4IV4v3DFLar
         CyGg==
X-Forwarded-Encrypted: i=1; AL+hErHZOgqyOxQrcE29NPjwS3TrXxOwDKLf/9vROZ8wXyZQq0ibbJqzDG37AGZe3ePi6I8aBxoSySDLQeBboYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R2jx2Tl3AU6Ep5QzyQW0BOXnG6EaByVUN6Bnv7sw++5lYsyAb
	bzSirRm/trn0awZMUOWvCe36r7rbmx4uKml9WlNEauPNZ/5KueCYK1jBfbh1megMrsmQGMMnaRo
	PVmEoYZVnGElK+60b8ccSNH56dh8d7ZnU+/VW3NvjBxHQT4Qpt7hJ4gmN95d5uU9b+Sk=
X-Gm-Gg: AYBFou1Ho4j59ncAXZ3X3irgrmYQEwD0w6ppVf/l+OClyGW9+94dJC0Gwd1+dnRkTtK
	PIbybLRhhR46WV4vF5NVUXWssH+URm2f6kYbuG/5Y8OjsiVGf8vsuTR0haoz+VsVt9xm8nzEWjR
	VuWqjXqq+hiY5h63rojb18FRVlazmP/YR6a1GsNhfsbkn35bxfAq3xX6S9M00tXzjMqHmPEzhwK
	xSTB369+qJ1K94cUuBKAeKn0B1hWA84qXUxTaxuuunxcmfn8y4aZkg4NVDxP48kyhMMmIhI86Sn
	1+eFkxw7U9Ru4xlgxCSUIpDwxKmm+pz3DF3IN1xl1/3dcTmIyBHtbpPIFU5jMnAguawxlHEu5dK
	Jy2l/VdRCNYJjNqKTY66OA0/A5ZQiJSDg5Ykjnh6si+ZJzPSShKtkPACiBRGObgfLQhRWdgrYPK
	BmBXu7snLfonQBVKsiajfNjexHQbB4IzP8MCeO2emnmYPCfcY/YhZGoAzDjrm01w==
X-Received: by 2002:a05:620a:2852:b0:93e:d1d0:67f with SMTP id af79cd13be357-947b0075f66mr381265585a.51.1794411556814;
        Wed, 11 Nov 2026 07:39:16 -0800 (PST)
X-Received: by 2002:a05:620a:2852:b0:93e:d1d0:67f with SMTP id af79cd13be357-947b0075f66mr381261685a.51.1794411556305;
        Wed, 11 Nov 2026 07:39:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae091739edsm11782131fa.1.2026.11.11.07.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:39:15 -0800 (PST)
Date: Wed, 11 Nov 2026 17:39:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: avoid an unmatched fbdev IOVA pin
Message-ID: <isnqaepemtnbo7lejjsuk46wkfentboedqk5tb6lhe6ju5anrx@2qrdrgd5tb7b>
References: <179424371125.96483.2462884435294600442.msm-fbdev-pin-leak@michaelmcallister.org>
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
In-Reply-To: <179424371125.96483.2462884435294600442.msm-fbdev-pin-leak@michaelmcallister.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXynIMPSQJgTcg
 ltS/wFt72RgZ8F8f5lZ7DtaO861lb4kZxcBWMLcY9bFKqXUSdQo0qB6XsqD9AXq7JeP8Yd+qKGo
 moKTcF6vRc5tJsojUXwQDaiV2xaUbog=
X-Proofpoint-GUID: R_s8YR9epC_dRkype-uPhzPSsRw0w27R
X-Proofpoint-ORIG-GUID: R_s8YR9epC_dRkype-uPhzPSsRw0w27R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX2aTrcRO7rVuR
 fzkV4zDpgHvi6DapgZFQ0olzS2VcTzfsbqXr0rBJwZxAyQa4bCZlj7IVI6kyn2kcPuSxvVu9FEs
 8QprQipX4bPrH+fVm/WBGFkKOT0+d8TKGdBmei9Ewu/2tHbnQWupwRnE1YjTFYqKHfKmRTPgAOH
 hNcemt6GIw71UM/W9olswHdjEjR+67RDWrCAlGugaX/ncMqGtJG5hDZCmGZZkjkGmRobrt6dFEP
 GaBPQO5a/1kvJ0HUSIEsgdfKBODQ751fiWQxAsJGb5GumSRaQm3cGF22zCuZ8MO7Qp4mhW1NZVt
 WsH6WrJQUkbhQgUUDKwDQOiAv136ZoonUYpl6onhl4Cihu6Uk4yuiSvoD0IhfJyYPnfT7pyUZUP
 N5baaz7+b+zM0AE8GAaR8PXueAtCxynLQcG547wWtF76/vkmWOFe2yFzDoa9mtWInyORPr91Wir
 gd+mTPWAsVC0J301s3w==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af48c25 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=JwJ85b4fAAAA:8
 a=9Vp39pDZEKLU9gGmolAA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110062

On Mon, Nov 09, 2026 at 05:01:51PM +0000, Michael McAllister wrote:
> Unbinding the display on the Moto G10 produces a pin-count warning when
> the console framebuffer is freed. The fbdev probe takes an IOVA pin,
> but normal teardown never drops it.
> 

I'd say, it suggests that the teardown path must be fixed instead.

> Use msm_gem_get_iova() to reserve the address without taking that extra
> pin. Scanout already pins the buffer while it is in use, and the CPU
> mapping holds its own pin. Drop the matching unpin from the error path.
> 
> Fixes: 7ad0e8cf6317 ("drm/msm: Count how many times iova memory is pinned")
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---
> Hi,
> 
> I found another pin-count warning while testing display teardown on the
> Moto G10. This one is in fbdev: it takes a pin when creating the console
> framebuffer, but doesn't drop it when the framebuffer is freed.
> 
> I tested this alongside the other display fixes on 7.2.9, including
> unbind/rebind with the compositor stopped. It is independent of the DSI
> command-buffer fix I sent earlier.
> 
> Thanks,
> Michael
> 
>  drivers/gpu/drm/msm/msm_fbdev.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index dd6d6c507d..c3bec6719c 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -137,12 +137,8 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  		goto err_drm_gem_handle_delete;
>  	}
>  
> -	/*
> -	 * NOTE: if we can be guaranteed to be able to map buffer
> -	 * in panic (ie. lock-safe, etc) we could avoid pinning the
> -	 * buffer now:
> -	 */
> -	ret = msm_gem_get_and_pin_iova(bo, priv->kms->vm, &paddr);
> +	/* Scanout pins the buffer; only reserve its address here. */
> +	ret = msm_gem_get_iova(bo, priv->kms->vm, &paddr);
>  	if (ret) {
>  		drm_err(dev, "failed to get buffer obj iova: %d\n", ret);
>  		goto err_drm_client_buffer_delete;
> @@ -162,7 +158,7 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  	fbi->screen_buffer = msm_gem_get_vaddr(bo);
>  	if (IS_ERR(fbi->screen_buffer)) {
>  		ret = PTR_ERR(fbi->screen_buffer);
> -		goto err_msm_gem_unpin;
> +		goto err_msm_gem_vma_put;
>  	}
>  	fbi->screen_size = bo->size;
>  	fbi->fix.smem_start = paddr;
> @@ -179,8 +175,7 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  
>  	return 0;
>  
> -err_msm_gem_unpin:
> -	msm_gem_unpin_iova(bo, priv->kms->vm);
> +err_msm_gem_vma_put:
>  	msm_gem_vma_put(bo);
>  err_drm_client_buffer_delete:
>  	drm_client_buffer_delete(buffer);
> 
> base-commit: 1e59855738454b14021b64115f0090eafc7526ae
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

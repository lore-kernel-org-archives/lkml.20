Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417377;
	b=bxKox/TPGNaY2GhjgikBqmf1AEhB733aklhoD882T2it1fOnDggOAvJp2Ps/l7G/Lj8D
	 URWaOoHvBEOSfSQhf72BNin3MXsXyPqT+r+9jt7malwujfHd36z52N8sk8JkNNEKHSmXg
	 nNmWuEpTER5A2AE45V8whw5bT0YyIkGXOYO6DH12F1P2Q0mbIhUVqgbL/HbsYCFuXdae0
	 Gpogy/gTWTC2nEzZ97lYTBDy4o5fSlez+Xm3vaEPWK/I3759CzL5amI76A1KXSPNWPj3D
	 E+LPj3bHivrMETDvLbDsSdQbnURtVI36RB61whNMkeezcUlZmmfRwLT7yBOUkJDH6Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417377;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Th56ue+92RWSYswc5X7s/HSv9lUd6z9Xku8GEtzh0/E=;
	b=uTSLfif2ft80s8BD8NtgUhgEs1vJG+xJY5bEIGtbprJ6FkP0+uXTzEsD2ihIwmvwk7Nq
	 AvqvkqPSCzCf2F4OQ47i2BJ5qcqZfjJODwk9hMeSuTbqhrBjzYCJAgt1hA/gy+eLEqJAe
	 9xg6oE+R0lBPlJLVsodMw9Bw//2t/imUCAOKWBd8NAsa33JmMAKQa1wH2rCIIUvuhfLvk
	 zs2WtVtnK43T+xTtV9TJ/2nWxhX4GUigzmG2QNuU5ZhhqEgZ8k1MHe7pTyVhLxZeXBzyt
	 mFwS8OXwMOlt/I1IJ6LNCWKAsCOLRvuXvZSfn59XXsKKw/nM8SLw4PFr9vsWhDKheWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hy6MTmRb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PX3nzkC8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68128606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68128606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hy6MTmRb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PX3nzkC8
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0P2h1565809
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Th56ue+92RWSYswc5X7s/HSv
	9lUd6z9Xku8GEtzh0/E=; b=Hy6MTmRbd8McWpfq/m56Uk8aIITPw4xR9+PTzOzo
	RQZDAT7vBRTF3ZIO87q7lj8P486dcCfMhPiSGO4ClB2JCxoBsVqLgIIX/8kt6OGd
	i54YuCzNcqKFiKNiKdTWpx7i7yWhTPjUvC+2kci/5/K/FXiBxrg+mHMuanHnvmVQ
	iOiX6D4W9fMXZy8h+v4BeS/Barz2fn9hK/3C8/xQ3c2F/1j3UvHeV6IzyRyUcC6z
	fWuufxZRR8P9on/Bh25Tn8miq+dG94/JkCW9FjXbzDvzPDTvBx2JxX7vXwrHBmA1
	2TtSOfVvB4WJgGBLskqnUROmv5IKlPQEtSWjlmMkNne+jQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m13qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:16:15 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so3199345e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794417374; x=1795022174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Th56ue+92RWSYswc5X7s/HSv9lUd6z9Xku8GEtzh0/E=;
        b=PX3nzkC806pZ7ijdmt0vhRiVXaZGyXbqu3gjmnsk+FommVT8DoTqQ2tlK6gm4StvoR
         J+BOpmXyJPCAOEQi+htnvcm5Lni/1VWMUVmUk4EFRCqLM5EJtNM+VjdPbREyuq2yuf5c
         VV5HSv9uvXsQC/WzrhSGNYTmUl9pgpOU7Zgq/Gdi0BzJLmmWivzSa7siWPXcx5aiTa1h
         BK6WJiIvIZpuT4EuQTeXZe1sSUkX4FC6Ru8qvHZMuM7oReXHKA8hFFcMIRalskU7PWaG
         ffMdsxr2wL5TyftgEpDyxWjJjWiSUtn+Y872uZhK8rS5kPBjcI6h3S0QfUyGBricBF5Z
         RhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417374; x=1795022174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Th56ue+92RWSYswc5X7s/HSv9lUd6z9Xku8GEtzh0/E=;
        b=LKV0S5PU/Wh2FWHJtn5QS1H9eoWMxbuMIg+KwDDvEXvb+3KaUfMFIzHyQzOcDOS+ZE
         PaJ4Y0P/SKF16cyCdAL3I0hiYgjs1yLSPuKuNqw9XwEU1yDArdbA3YpLTmiX97pfesZ6
         boo2tVh76dmyykFi2RXZLt/2ix+ulPx9GBFaYtKQ6/n/L0oZObxqMx4ubh5ION+7hRR7
         +Nf5TU3oH2cAlxn4ufZ4pIkLi6864pshQal/q4BayyGt91cmWWkpERw+TvsyMiGugOaF
         5IAYq4k4D0wE/WYe80tD7gARjFB/Ju/e+Y+L3T8jKuf0CTaWWWhrpmZdQRNTUxgsNiGz
         807Q==
X-Forwarded-Encrypted: i=1; AL+hErF2VlHArHWpvLhiH3pGFA7tJ17SlFPypUpRXfP7+MWLmZ22Bld1gpbyBAQQmwdiWaynqr0YweopZ9H1ub0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o9SaMBxRnLPyhvo/rmFQkwwyNBCIl1662uln6/9Ni36raCDyp
	6shnXsrnZ780RYLRdjUHAhtLz6yz8o5jWPX39bTClOgHAg6y/vSOi32bPV6XpE33hok0J8px0No
	NJa7l3Xz9D6gfWbfpRm8M9FXD3mrq6wib56HYFQARsjvZeKB1y2XzFe9OffVkBMR2xdc=
X-Gm-Gg: AYBFou3t/DXe5ZZIwfVUAfoJ/VW0Wz7+qPL/JuqGK6TCxFz2epslQGLfN6SE2Pf8vhT
	cFkfb9FGWxHqGDYUk//VecgUDMLtlH5dfySab7pX3+sN9RVy2XGXqNnlv8+j/L/R1TMyIEBpt4Y
	oPg4MW6LMPaGDToVDkpQqLWcL6z0vjcA8k4oCvRTfQz6Fo1p5joXcyPLX8XYzXAGLxkHxrkLekl
	lwF8CTrOQdZa6WRlirZWFgAgn2bShYy9vExhkf2yeVvJ3MCKAlEitVSTcrw6qPIkHic0iOdpnd/
	pL3lZURK7lpKwWdb+Pk9kKkpoZDohs/4esI7luMXC9y9tj2mHK1Vzyc1Zdghq18UE4SJjfL2WMA
	xH3nU2bQKJ3FnuYyjOUs+QpKHUpvYYN6StSudszsLoqeHUINtokBB6d/kZrItKrp1nbjRXRYUXg
	h52hes8lsmvl+HuuhKY2hq6fDyZXtEORLBX2LUvBj2f0O4KbwsSAhkplVqNfoOeg==
X-Received: by 2002:a05:6122:3287:b0:5ea:9a2c:27a8 with SMTP id 71dfb90a1353d-5ee1c43413fmr1408289e0c.14.1794417374506;
        Wed, 11 Nov 2026 09:16:14 -0800 (PST)
X-Received: by 2002:a05:6122:3287:b0:5ea:9a2c:27a8 with SMTP id 71dfb90a1353d-5ee1c43413fmr1408223e0c.14.1794417374012;
        Wed, 11 Nov 2026 09:16:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157ba56d5sm1031489e87.23.2026.11.11.09.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:16:12 -0800 (PST)
Date: Wed, 11 Nov 2026 19:16:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, yongxing.mou@oss.qualcomm.com,
        val@packett.cool, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dp: hold one runtime PM reference per plugged
 state
Message-ID: <oidwbklgq7mqjyvd5n3irj7uxarxhke4fdpmipp3kwx7uqo5qa@7t4pal4q7wki>
References: <20261024051952.2006-1-26rote@gmail.com>
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
In-Reply-To: <20261024051952.2006-1-26rote@gmail.com>
X-Proofpoint-ORIG-GUID: QHrmYk4MRvPeEb2wIw6MOaLEVn73YYwI
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af4a2df cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=2vbH5c1cT-B6TzbzCmYA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: QHrmYk4MRvPeEb2wIw6MOaLEVn73YYwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX08zNlL0gdjAU
 XeWCAkOIuoJwMh2XpHV6HWQ3viB8vaSqIDtooUE9mSzuvpf7brObA0d6G6glEqcg6FQDLBXuZZs
 OSPkk1QNoA+s9yngvsGq3dPo87We7OZp4FSJ8zqy+9yMziv/NO/DOuzgkndAbB/c6muM0SJ3vOE
 Zx41KwiH/J9OMW49VsnNU90i+MCknQBR6dPlqpwj3J3v+MMT+SLIS0wc+bWXUTyCXSbakpDyRye
 Qd/YQm1kWIfhwm7+DRGY1/MPV/VleLRezOdYBR7UK4hlmvOBVlvHdScGeZC2eitfdY55Lpw/azb
 T8ue0RcMWO8hF0NSDkjnI9Vry4sdyyD05geS920j88RijwghyLjD6HVEVZtO0leDwcXvhqGAswf
 j14uhBRuJ93hXpT3Z4SiB2NqzD7wgumT9kuHDrDFU4V0OTZsGB1qhQQ+cXVu4s0auT2Gwi89Ga9
 /w6bZ0k3kIshOXOwCwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX9kL+giMXaMHY
 YGhMneqFLZfi+pw/tn8DvRL1+F8SSQ/1dYnNMmiDE5biYHWhOVjKbPCWGwZtXDnThKmYxMynaHT
 0Drpd5GW6XNDHRdsXnWeYUYlYmFrfS0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110068

On Sat, Oct 24, 2026 at 02:19:52PM +0900, Joonhoe Kim wrote:
> msm_dp_bridge_detect() takes a runtime PM reference and keeps it when
> it leaves the sink plugged, so that the plugged state keeps the
> controller on. If the sink was plugged already, the plugged state holds
> a reference, and the new one is leaked. If the sink was plugged and
> detect() finds it gone, it drops only its own reference and clears the
> plugged state, so the unplug handler skips the put and the plugged
> state's reference is leaked as well.
> 
> detect() runs on every probe of the connector. When HPD comes from a
> later bridge, such as a USB-C connector, nothing else keeps the
> controller on, and the leaked references keep it and the MDSS core GDSC
> powered after the display is unplugged.
> 
> Hold the function's own reference for the duration of the call, take
> the plugged state's reference when detect() sets the plugged state and
> drop it when detect() clears it.
> 
> Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> Depends on patch 6/9 of the IRQ_HPD series v8 [1], which stops the
> plug handler from taking extra references; only detect() is left here.
> Dmitry, feel free to fold this into that series if you prefer.
> 
> Tested on v7.3 with 6/9 of [1] and this patch on a Lenovo Y700 Gen 5
> (TB323FU) with a USB-C display: booting with the display connected,
> plug, unplug, quick replug and s2idle. The controller suspends after
> unplug.
> 
> Changes in v3:
> - Rebase on [1] and drop the plug handler part
> - Hold detect()'s own reference with PM_RUNTIME_ACQUIRE_IF_ENABLED()
>   and take or drop the plugged state's reference only when detect()
>   changes the plugged state [Val]
> - detect() now drops its last reference with pm_runtime_put() instead
>   of pm_runtime_put_sync()
> - Link to v2: https://lore.kernel.org/all/20261007155848.106-1-26rote@gmail.com/
> 
> [1] https://lore.kernel.org/all/20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com/
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

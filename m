Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FF150EC0F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784440; cv=none; b=KJDO8e06RMKRgmOLjuHs0wZlyCceOVEI7iSBYYwlvDyd/B7BV4T/x2Vx20TxDH8rVQmcGd8WgmA0L/wJyKjpmfqNWtTwfpNU9IlkU6YgiakVf82Q1HP9pFdZ59Q+CVoHY8ORrHmJtzh6PoTIai/1IzZv5O4lQwqeAZTGs7tQ2I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784440; c=relaxed/simple;
	bh=j8LORNlGinO+sLVzCgOaYtUFKiWkhzkzQX9KFW6r63M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmPfuA5eiC8OEAphSaDWBf5Kgm+jKLfOGx8GWs3mRflWe1ERnKC9MgfCBt522JekPiRgzTKchD2zK8Pk/BpsmIV7xqaIameBFFbyqYnGGUJJjqMRwZ4/EMs8gfroQ2Myy+TLNRPUYc3fY1ngI5QLS1wircpKC51BZFRwHY6kB8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ceg/Sbhc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GisJ07zZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ceg/Sbhc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GisJ07zZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxtkv2404723
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=59fvn6HNCxIB5d75o9AyYwbT
	6TRJJUb8uFgR5eg9RW0=; b=Ceg/SbhcGM1koch9h2BSx3RC0GoFx/hQKhQuktDZ
	lPBh6arfjeh/UObm74Ri1KTrpPCFZHKA525CHGg9fn8Q0RehXPxNCJhDZLok1sGc
	/3QIFqci9rQ7F/Brxd+mtc9QRfvianNIZvpaJi9eeEBh9nNJl0Wrbb+rjN9c10O7
	dIyuM5/K5ZJGzHrk1YiTSr21OW9Fbwwnyj/New3naAB6cy1ZFT07LIJi6YiyewOk
	L5sCXR6kVS5FOSclPkLHmu8pDHuY9GFVzAAij17eJts3mEEh2hgcLubIxXZEoyEa
	mzKmFDI7s48MK13Q2027bDDuBheXB6jCr1Zk5eBHs7ModA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c295c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:12 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf649b2ee5so40171137.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784432; x=1791389232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=59fvn6HNCxIB5d75o9AyYwbT6TRJJUb8uFgR5eg9RW0=;
        b=GisJ07zZC+N+ndB+KSn+j1Amvls0ihnH6wwKGlRtjlqQ6TqzU80AvCBMigvyS2WHSl
         oX/GCJ1PN14jT/jTY+A1IxpWdCtLEZxLS7kOGkH31kbyAXJ/AQBwIX2oryJqVDk7qEu2
         +qHV/tIDJktFChMoe6oT99xUUpDIobiSIFlj7i4YFlAifyll3xolMa93IiCtsqQlQA/k
         OYucNg7apaYtDVuiLBquqy3kHLT3Cb7elLGPzkzsgdiepL5e+5MODd0Ucwg+Wz2MVuhs
         RWt0sVdv9+e5+PlVHz1rR/hb8MuTVfkaOqhmwGRyqku2PjvT59oR/kxu0RuEkHroSuWB
         b7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784432; x=1791389232;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59fvn6HNCxIB5d75o9AyYwbT6TRJJUb8uFgR5eg9RW0=;
        b=EzBMZ82X1MV9yh57Md6AoIBsxlypvsFJw4P2MfJ3DjZRiA9CsND1ppK5KIdkFxA99M
         GWnCjCH6Gsyegz6Sh7Nk0l361Hjf2Rj/AzNchVBlse1nWkcjRK0ioSMgOdcbb2QNc74G
         4O7fKGh7bEq9MsRkWj0CXqb4jFYBbACGqRNLCemx2bAH7mj4qkRiqJXSbmSaD6VdEp5F
         PO+zcgzV8W7YXQuJJ/dgLqtTMfGzUa4OriqAkwkmUYK8hWe0IfNt79z7OUs/+xtq1NJL
         jNpq3VAVb32iq5S7mUNgPLucg+L+/KeGL/DcaCJuSUbMBQwbhrzYM5bgTMYHD4ZgUNoi
         m8Rw==
X-Forwarded-Encrypted: i=1; AKwUvBw4Bd7G1kE1CtlVoVdq0g9qD1LKUuQEJpdWOkRpIkpAMtrweeqNvR1RihPTDdi2rZufknTJLEES1OI/L8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYICvC7s9Oo+lLJUU7Rgxq4fM6ygODsRH1Yszbs8XdvRUFTaT+YX
	G34JozPKb8WsMsD0GC2yXlVdtF8r24oiXPghG1rfJYvTPTCDj2+kmyxBn28Vdndrl/9YEq97VV4
	Mu5KcSNd7DSCwWFG+WHZ7Y8ZuCOh2AdulG0BbEV0ziIHgwl2u9iXcrFb+DiiNP3t5bvA=
X-Gm-Gg: AYBFou2PKZsRLsdnPVEevf7PKKSTfofNTfHIVQe+UpgdjEacQFwhuw+DPaum4LzqNod
	AS5A1TV76H3qzwOY0VFamhN5k3yWMc0MUlypFhdmQsFNHDGVFKHbH+S4y/ISQVf4u4zBg/gUwXY
	oVZU5ajuiuH0K7K61oiT20W4zF2nAjWml7Cwzg/hzdt/VuUXIgGJ6GvTlbVxYuUy/GYSl1R4NB/
	dutq6ml6Hdi/RcpQnwaOxlYiTLL+HNDEyjHwT7QehitSbDrRiBCDaONJ82YIO51oy3F7w2hJ+cm
	jsRA6eqMnlPhUvfcowdPGmudODd9tmZ/PdWL1JE9aK2hAuoS/UD4pjVttiKinMoA6znb3Agtr3L
	qesIaN8efBPzRPWrrxJHegVSBdEq7NAXrPAobjAKbiVCJDSNLxPL7yAm3+WARQyVBgHBdQ2DaMA
	bgDsvnf0yufNuH
X-Received: by 2002:a05:6102:91d:b0:7a8:6ffc:1c25 with SMTP id ada2fe7eead31-7be72ca7984mr386847137.18.1790784431852;
        Wed, 30 Sep 2026 09:07:11 -0700 (PDT)
X-Received: by 2002:a05:6102:91d:b0:7a8:6ffc:1c25 with SMTP id ada2fe7eead31-7be72ca7984mr386837137.18.1790784431400;
        Wed, 30 Sep 2026 09:07:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42faa8cbsm82075e87.23.2026.09.30.09.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:07:10 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:07:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 04/13] drm/msm/dp: Serialize HPD state updates
Message-ID: <zzsqfw3ncrse7mtxrp5dmny6fd3grtulhxhpawo6gahugtu7ft@qqshhudt7jen>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-4-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-4-dbbf8b2b42bc@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX1TCgTVGYrDiI
 XZpcMlGv5Vx0LFN5VmIIIhQhpix1QWLpAAfkZssQpcFn/LSEcRTHtyl/hYnqWcMrYsl57ZfiM7y
 lp4AToBMDVx8G2TuxlMNmDWBApOauu8=
X-Proofpoint-ORIG-GUID: k4v_fbEvLehYEVVGwEymfb2Ftu1ndUHN
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd33b0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=zIYKY0NWTygHEUM1x6YA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=-aSRE8QhW-JAV6biHavz:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: k4v_fbEvLehYEVVGwEymfb2Ftu1ndUHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX8CsUHYFiI3HV
 wJQJkzEG9AASMDIwRpSeNcJwBqKoLJEl5jrAyj31dNv8HTK5zuFqwlEDtBNXg4qts49oPgjzHvS
 7vJ+ZvOwN92ut35PJQ46qoGifsWKqWiHO+qfPCvYwbb3l55/v/YbnQnFwxNcVh5D5bYJM1Rx0uK
 BH0cDkItm9SSoOXooghvWdyDZrc3R+dHZOthpx8RsgpSGsI1pXvqDaXKcMFB2SilaTx+XQfgT3p
 /1I84ER4KTWHWsxkoO6D9Uom6g1XzobAHqpjfGuer0LQKR1qnd2neaNyK6an34z5cEkH73/9ZQY
 STSg6Dhoxv4KOqXm7t8a0K+FYTJ296iSqYzeSMlVmhI9o8xy2Z9QuIGp8CMHsjNMTBL+/wBdFUq
 vMOeLEx2br9V6+bJN8sK4Y1NK7vOeH5ZQrgDk+glzTeFe8aA1AeIcWwp+8y3z8AuHD9dmzK7SiF
 oNPPHJqp9B1P99hN4tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

On Wed, Sep 30, 2026 at 08:41:48PM +0800, Xilin Wu wrote:
> The plug and detect paths hold plugged_lock while accessing the sink
> state, but IRQ-HPD processing updates the same state without that lock.
> Unplug also changes the video-test flag and AUX transfer gate before
> acquiring the lock.
> 
> Cover those updates with plugged_lock so that users of the connection
> lock cannot observe partially updated HPD state. This also lets stream
> failure cleanup decide whether to preserve AUX while excluding HPD
> processing.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

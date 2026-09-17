Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7955E372673
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631854; cv=none; b=jRIlDN4uA2iXhyMc1v5Z1hE35Um5BTiCo/5oICR0oA7VfqpPy8ri6yT/JGkQEScIHciTOUbM2MTBpkaGWTkaofUvq+daV5EtdHqn6kx0nPMThQ3mBUZMLLDiDjRaX8GT2VoZAUBTa1+cQ3sHAN7gdSz9zR+fVs1UkkRJSZ/0ZEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631854; c=relaxed/simple;
	bh=AInxw5BUNy+WMl8RQs6XmWSa2E/VdQdztujuI4c8Jkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Te9o1tqZ2H49fjyv1veftyU2z1QYc5/Cp8cGYRuM8UyVNPZE1w9bmau++1lYf09lbdfinCMT9PrWOs62MroK0UJwNBGn6sVejAfNKIhLxD4NwT1ga4JS9c9eM7fFBH/rT60AhA5s/EzpkFg988wpI5aJdlueNwFdo7uEZv5yeQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jo1+jnwD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTjlVfSi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jo1+jnwD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTjlVfSi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H61DL2267364
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X2X4St3guWcAoOB7DILepBAA
	o65atjpLeBGdoNEmPWA=; b=jo1+jnwD253Y9s/9j/kyAUTfZXO0R/GQC+5l83iZ
	ivLxqb+qPrfHT/1GQ6KyQKQ+UK2Lk45I6c7plEkXTQ7AhVGeE66mVWqgolDz8G/X
	kdZZPgXHIoSDAX8mwl5OacZN6n27lm4egfUjtcI1TprQmntg3rOeJkS3VsxeS2v3
	4sZ+UepXMfd95DfP1ZfWkUDsxV/303zQn0GcTBDod6avF4an1JVRo8bng6IKgpYR
	JQ0jpS0v4yNhrXmaoEBJHQbJjJJwGawkY81bXAlCz0SJq1u8bsjF79sae4MUIsFM
	mNqbLu5F3iKyf8AriJS97De10q69KEvJwRknLoYzjaB3ow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquwb48hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:57:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so149540485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789631852; x=1790236652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X2X4St3guWcAoOB7DILepBAAo65atjpLeBGdoNEmPWA=;
        b=QTjlVfSiBEicNjz75AunkKywnENVJ1UubsmPewztoEZt9rWrM4LupCfuGWkBGOgrnh
         VCkMyqf7GB0dvu7b+DbE++lbkdnlFEzDekPUQodUawbDh6Q3Hx6LVfeWYt/khBgbM1O+
         2tf2VWNTq8WNaS0Dcb/cjuwh5E7LyR5MqR5rafLjmSqtP2CEXB9/+4YgM/2X5rqeFg/T
         yDk53cv5Yp3bjo0hGeQd4Axh7f3uaIXyRxBzvUv6wS6Cq58aiaGs667vKfdwEHHSxZjz
         M+/anFyRNarRYKgVWPFfSF3Y4s0fFjo8C1JO+eZTW8PDFm3+27kHHtv9TfL15PSNNEwZ
         ys6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631852; x=1790236652;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2X4St3guWcAoOB7DILepBAAo65atjpLeBGdoNEmPWA=;
        b=xH8HbJF4md1dAFDFb7/UjGRhjmh4bTR5HUVfG9UezT/gmMvTHa0ckmp0FR3uvyNVwG
         dqq6nV5arSAxPqiA0N3MZeqm6ED+FNagzby7MNQP5mJwRAieaeKl0wxJ/66AAvNCBK/E
         wr0RAfylwahNYfnCCUM2deAj5bfzUMQi8MuVMkrKOIebXJK0JAuoXcPc32mOhdPx+Nov
         NtLtwvcVJKPy/rdUIdAeKmhKkxoepUU1qu0zzD3cXURAlIJPYO1CfJWnNOrYnqditrWc
         4sxSlMqUdVrsffFwGu7Vcr2g6LYQ1kne7CGtLbAsJTC435fiQ5RliEJVmoU74zhnl4hu
         LAjg==
X-Forwarded-Encrypted: i=1; AKwUvBxftLS49CLMQeNiYJXA4+aFZfLO+FqpZ3ivqk8TnSnmCwm8swTDR+JvjVgz/JrTRQuyhpMh7QEn3pm+rBo=@vger.kernel.org
X-Gm-Message-State: AFuF++lQrfOSCTBDVv57twgrHpJg4FyrUU9QPQoD0zSIlNauEK2G84M8
	rAzYAB8W0+0hwm6hPkHRZ8CAv99CnnWsEcXWiEgBWcmOLfIExjkM05TKJUguDSW5ePkkHm4b1Nf
	5VaCuSRsQ2HIF4NX/0VNu1wbJ8A4dC5x0hnloJk01l/K0nCIwGWyPgP0vN1yvTLp77q8=
X-Gm-Gg: AYBFou3FpwYbXP54k2hwNUdyJuUj+jbqgt+QiNCL0iTHatbFYTcj1FNWzGyXW7DpwfW
	aEhWcNLHYQhSQ2W/eDyQc5kerAZrnY9W5GzMXpOANDTL6RyFmIsOwdxtloMSfaw9nwG9BSyrWST
	/lWKY4uFW2Qy5nEpUfVX/67Fy8eOS8RFxuhTwuKqXEAHDPocQE6WnmcTlxROIUXeXu0xyP1S42/
	ulMv8S+tQf/4tuL6/L+ES7nosD9wDeE2yMowQ7udfrcaDrdR6fYmGCbW2dTLaP0MU+jHIBTYvck
	jShgm+9H++Gh7b//iB/uBllUB8gr0O3+V/jeZlWaveyDk3FmM9IBQpDzOETOBd/nsKxxSWNfUJm
	8m8JgDADBnaXwWDDUm21Dh89VzSJoix+E9g+H4zFh7HH/P2oneij9BS6G0DOI7MF6zvYeGqHGcJ
	/MinDYQ707vrsR
X-Received: by 2002:a05:620a:272a:b0:939:6de8:43dc with SMTP id af79cd13be357-93bb794e072mr928714785a.48.1789631851571;
        Thu, 17 Sep 2026 00:57:31 -0700 (PDT)
X-Received: by 2002:a05:620a:272a:b0:939:6de8:43dc with SMTP id af79cd13be357-93bb794e072mr928711985a.48.1789631851062;
        Thu, 17 Sep 2026 00:57:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c35f4sm1572038e87.15.2026.09.17.00.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:57:29 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:57:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/29] drm/msm/dp: drop redundant config_ctrl_link()
 from msm_dp_ctrl_on_stream()
Message-ID: <3iyvnipj7cxlhvcz7mo4i32qswhxcntqg6qmm2fpchb2i7tdaq@ykiwgyp7ezzc>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
 <20260831-msm-dp-mst-v6-3-c91d35d6fb9e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-msm-dp-mst-v6-3-c91d35d6fb9e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H4JOUOYi c=1 sm=1 tr=0 ts=6aab9d6c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=xvosr8ehAfmB6sJLDpoA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: pC-7uIYTdHoEdB7mTlPADMAeaArgJD67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwNiBTYWx0ZWRfX2AUlOrcp2cRP
 t048g/SIgOLYk/IIrypK/lnPRPBkZety8qwyBQdIMKO+Ck1ak22uRL+nGjKi97zj0ZfTvD4mkSj
 HW7UbK9+W85Dn4m+zcvZ3aAgb5qcEKv/1BDWQ5bxMASuptwso83a47XqOEDWxTKyxlcrN1gCxkA
 7NWxXI6uST9sdB/TWX4paNnrmVdoDD0j+DH/KduOfXBZ+iCV2hJy/kPWm7T2FImoW/Q17wkyH0f
 mw688aNs+W8I38DEAqvTYGHIbmxlXbEncCHW/nZh3WREo8AXLltWwcqmFy9VwzAD2+pN48hMbRy
 EGqgFsohUpdVC4Lo2jx7bNdbSZZo9RqJjvReYjhFISSeHM3v9HsxNMTc/+pkgFfxNe7l298RRGV
 CNMJwiOOb77oGPgOmFMSIJ/CISzvqveG0ZjSMEcHTDSr4iVK14tkXxl+5sLPsW7usLYKL03QUJJ
 GWYaxHW9SViKnmEgx6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwNiBTYWx0ZWRfX/AKD6wRPljeQ
 5YRUsxtzPLivhyMrkgrOGw9OVBCRuZBhgjCpkJizo/WKJKLyBByA79GLae/2MfNHhFxXnW0WcyY
 Hdr+NxrkowOow+y9cql2+jsLqQPHY7o=
X-Proofpoint-ORIG-GUID: pC-7uIYTdHoEdB7mTlPADMAeaArgJD67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170106

On Mon, Aug 31, 2026 at 04:17:20PM +0800, Yongxing Mou wrote:
> REG_DP_CONFIGURATION_CTRL contains link-wide state and is already
> programmed during link training.
> 
> Calling config_ctrl_link() from msm_dp_ctrl_on_stream() rewrites the
> same configuration and is unnecessary. Remove the redundant call.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

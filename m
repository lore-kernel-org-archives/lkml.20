Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C135471CE9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584155; cv=none; b=eYEYXRWhPm3rWOghyrDE6ssC06oecMwTzrb4yN+4P5b2uWIDwjVQB3QlApy4HZKmvofFQE56eQ9xCz0BHJtdype1+c6mZ+5QS3pF3NTI08IVyI97fZ9EjjUgTUWUJRUR7jXymdiKeSlX9PqpIEaOtbuY2r0WSxn1lh8h2JlUEJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584155; c=relaxed/simple;
	bh=Zw5zXhOLVqkbc+ncf2hBP8AcxwwgRaaxjEW5W6koMro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOm9G07kK3KRyjuZwV34/FJjZsJibb7X9rjOkb00fnGKyXsPHEtnjin2INYNhPl7kYJrzSEIR8sYl0BAU2DOG3Lh40w39E+y5nK9OjGkZbTGIHRvOZ+xa+u716U44pxUBzNjopGLHjvOJhV24jxGH9VRQTafiWaRUAh1QX5HrmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jBuhpJQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGcRBbbf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBuhpJQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGcRBbbf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xVgl1871040
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xndBd5gqizhYMvRqH0U4waQTYqgueSPfdyK8EMU99k=; b=jBuhpJQuH44rdrAq
	wvTI1RPbP/mnbkm35Ej7ZxBm6iMOc6gwmtEOdX9PWzdc3/Z/8R8LnQRfUSBiRO/p
	BPLmwXqNFqyRDlPG4+bQQJkPY0asEWsZ/Q/PZGIEEovI3Y4XpRCz0Yy3K+ldCrsh
	L++SiejYXDtKXYZNUAjNCBB4Q6iUoNfSzqOokC8WRub7Kk65U3Q00P+2TKEkp+GM
	37z1nGO3wBFt5Cvlm2fO2eaA4UpIIr+xBrOWIPpiRl5WX10fGenUrSreobh1/vL0
	NSLHkH6dO9mUdHFB7l0u1GvDyysJp8ibSJSzokOczQurYyUmwixaqoN1eAb0AdOf
	WXTSSA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubgmur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:29:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bf3eeb42cso43994685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790584152; x=1791188952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xndBd5gqizhYMvRqH0U4waQTYqgueSPfdyK8EMU99k=;
        b=cGcRBbbfKANOvQ3wXvxD7igTZ45JljGevRuQUMqQWko4XwKbJ4SwFzbpb9cxmLq3Zz
         tVateK0NVFLZa0KMBgefQ4n2tryruhaQwFt5rTGwYXrtFizfFfTgQWJnDceQnmHLEaJU
         AH3DERUFpmRFmcrLNLHhoIHi+zfRgjLFtfEPFh8xF8R09gUjwmv839Lw6Iw5USrOsaY0
         RPPQkZqfVUDyrWJD2fjsCvC3emBz/gTq5OKf4W6bD8DA+YN7HADpJDSq9Y7zis5w0L4h
         qVZWDxqkEvOIRqiMZImYyqo3HU99Q9GcRcPEnze569ZUFY/xb4rXWdsqXFgMXZlrlNYO
         extg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584152; x=1791188952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xndBd5gqizhYMvRqH0U4waQTYqgueSPfdyK8EMU99k=;
        b=K57JsI7o104LIv7ZEtqPNNxbSL8dOY6hvNN4ExzGnGJ8kXww3zjLg6SEuqvDYmYRFo
         2ZHMzLoSZxnQO5eu8Iq82/IJ3HumAqSb3tpGhlYlCJomvMIyeH7+giWduMWrpMJapAeZ
         W51prFmb0W/SxAQLeUStrZagPhUvZbtJ6EwkeIBkTJvLWepbHrO/iggdwWpr69dFGeKn
         gsvaCFzZm2uKRdGmF4/NY6Bfw6LryT2IxJ/X2DT5Qbot7vX/j1CpxZZBtsOladijDn8/
         A6JxNfK5P5G/o4+Igj0Rv+KUBa6aiIKqjAzBpSOH/kLmaZWV2CWVmVO2wDToU0qqKvVy
         /Lyw==
X-Forwarded-Encrypted: i=1; AKwUvBzPnfn7/Uhu9GAyW/vZslnb1h+SmOOinLRAGhR1Z68j8HYxLiJO3FC/EUuLA9HFoElq/0KiOoLNoukcJuU=@vger.kernel.org
X-Gm-Message-State: AFuF++kvrRrTDHa9FqN+N57mTzI0klen5oqAk8W6tbsqdGP4vZ03biKX
	kAduvqF8wQY8cN/Uy+bWDs1d4BWG6K3zBhnUo5su8M0+57NR7L6tcRWRFoaTu2ujZh4Y4mzWoXY
	mI4XfL/NL6LvUJuCgb6ICUpVLGWEQt4ydG39qkbsV8BSjPUN3sMZvg7Vy65pfL41SW5M=
X-Gm-Gg: AYBFou3yy938PmMtuJclzzh/R2KX4R2KJhW6hlFGb01tLZ9pOlvxzswHJ1AIC/uH2Rk
	6qYuARRfu5V1KOTXI7KBhIsqNmAA/YGCgI/iqFH9w840CqkUfmXtDOS1JPajSknmtG1XcUHT9Hl
	CL7R3s3+cWdvoHRhAse9aiyo17CODLUlneQ9ha/dso1TxDozrYDjlr2vJXMYRnqrnFBNuXEgkei
	gUJElQs2I6z0PXXQZHSgo6oCXRs5ggi+sbFQCSE5bPof6zXz4GjXIlQxNWocMYUiTOf5HClJorz
	N/zHHvv0Je7xYtH0aQtar9x1JfMsqEechk2CzDO1HS3fuFXS9dNghXVXFrlMZEMKbqMF7VI2/HJ
	sv3ojbXAd+aDosblrDHoNEg==
X-Received: by 2002:a05:620a:404c:b0:93b:ee2a:b67c with SMTP id af79cd13be357-93c43d78ef4mr1813620785a.4.1790584152254;
        Mon, 28 Sep 2026 01:29:12 -0700 (PDT)
X-Received: by 2002:a05:620a:404c:b0:93b:ee2a:b67c with SMTP id af79cd13be357-93c43d78ef4mr1813617885a.4.1790584151740;
        Mon, 28 Sep 2026 01:29:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dd69d4f65sm128311666b.22.2026.09.28.01.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:29:10 -0700 (PDT)
Message-ID: <89c68705-bac5-40d2-b53b-bfc818900487@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 10:29:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a3xx: fix VBIF halt mask for A306/A306A
To: me@samcday.com, Rob Clark <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexandre MINETTE <contact@alex-min.fr>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260926-a306-vbif-mask-v1-1-2bae5e81c05a@samcday.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-a306-vbif-mask-v1-1-2bae5e81c05a@samcday.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8LxZmX33QpNAzrzBKVwlB_f83YGbYOvc
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba2559 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Oh2cFVv5AAAA:8 a=lKQ-AihTAAAA:8 a=EUspDBNiAAAA:8 a=ZpghvvjZZmtfGsAZhOkA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=7KeoIwV6GZqOttXkcoxL:22
 a=K6G5NyU7usMl-irPePdK:22
X-Proofpoint-ORIG-GUID: 8LxZmX33QpNAzrzBKVwlB_f83YGbYOvc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX3WPa7VGLbPtP
 qCvi6NLbw19EyG210Bo5F5ao2ytHhO153a8S/SLWxAneJezBARaTr6GVpc3VugB26qyXrUh+z/I
 PN/GU0wNvDdUyniy4EbPKz1MHOyEiPwe0ew19ItdvwjGMopVJrq6fhLM1y0RFsJQZK4SKl20sHW
 TDxHwH4SVaXb9ALDKNlL0N4aCAne6xoTNazsDLWMrzXg9EO/cXgqBejfvvkbca/UbhjUgN0x62M
 Hk48tpP+PyhHlXKBoDpmAOB8UvYfxt7l0Kf0BSjHiCHaXw3J2pm4JtuNTdFpClbFHQyElbJKsgH
 9KO4g4pBi6GEqt+EyableOexh/KDFh9S9s2C1jVBGXFpPbbYgJmAlYT9IPTVIXeq4fxiI1RBeur
 uzzszkejyzguEp/c9HHpWO0trxjZ9gdIAkUcOmg17XZDfrM0UUM8B6oNEu64jGyq5kA04lMrZLo
 N1/TJ9Ekb+VB6LNQoRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX67DZyvcVxwjp
 WAW31V2jp30qYW8cVTFim/kfCVCTOa+c8zglt11zSiqdJ0fajQ4vxNaWDAtCp58TEMKu8/EJibJ
 rdbhYtirwkEOq+AFrZewHFqtIWHVKZs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280033

On 9/26/26 8:17 AM, Sam Day via B4 Relay wrote:
> From: Sam Day <me@samcday.com>
> 
> A306 and A306A implement only three VBIF XIN halt request bits.
> Consequently, waiting for the full 6-bit A3xx mask times out and
> prevents runtime suspend.
> 
> This issue was reproduced on a DragonBoard 410c: the request reads back
> as 0x7 and the acknowledgment as 0x00070007 - the poll eventually
> returns -ETIMEDOUT, and a3xx_pm_suspend fails with -EBUSY.
> 
> The downstream kgsl driver corroborates this (see link). Since the
> single-character difference between A3XX_VBIF_XIN_HALT_CTRL0_MASK and
> A30X_VBIF_XIN_HALT_CTRL0_MASK could be confusing to read, the narrowed
> GENMASK is instead defined inline in a3xx_vbif_halt().
> 
> Fixes: be0e82b8e0c9 ("drm/msm/a3xx: Drain VBIF before GPU suspend")
> Link: https://android.googlesource.com/kernel/msm/+/c90c7feeca2f5839ad6824f816c0bd207602a2f4/drivers/gpu/msm/adreno_a3xx.c#637
> Assisted-by: LLM
> Signed-off-by: Sam Day <me@samcday.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

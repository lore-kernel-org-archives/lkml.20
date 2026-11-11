Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408551;
	b=ohMQaZYPR2vAFDyzQNU178311QtlklACwbso7c9tw1FZ1nBDrDTGN0PtVHFR2xNP6Dbq
	 DivUpJgp1xPZqFSi+m8HwOZjZKPeZAn8b0LGd9iWUA76SPUThhur6xioh1m8UyWuJyqPo
	 2UZ+CNtkVMHDVVDTHxoKzVgyiYcZPhb1wkkzJJfyt+jIMAl1h5Yk5BjavhUMlVumcaT7p
	 mLfQ1ikVz959TTm4qVr9spNb7HYhnkBSIAbtmINF808tH1WYQLBj7YEanc3UKyA+z6Vks
	 24eTHwE0mrzgBGZixr3BJPzraIN9Yy6W/ga/8icPM24RiDT8Rz8Q/SVQgGjMPfG5dGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qhJ2whnh2ftT/2vZqPRp8bR6iMbwhkvUovT1Mfig/hw=;
	b=OZgXun2gLCcDwI1TIa+UG+58ghxsxlZymXW+dxC0hqOuw4od65SjOJH6EX8iA5azS680
	 TTnHsKNmlwcovivHTpW4+h0y+ZVWr7B/gjsEzdhkGyfajKXQx6ZFnyDLJD32e0Tm5n814
	 aelre9lwi/liMfHrVI45FTdXGCXz4ffKLa9g6OMaw/UxYL/hBRFbMcnGqiM6T0xUfuPT0
	 Hsj9zvJWiCX3gMwM7XzSzI6mwcqv8cYQpQOoLF31dgcmx0UxyQLJfSo1SBj9dckL6qJht
	 yQaTFmO8qsmERRav/k9lq96O+88pNsDIMd8twwWhF/F6fTTYD8Jc5fusSjvvH3tEA7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CjZeU5PZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ+2mZhX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B8E606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B8E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CjZeU5PZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ+2mZhX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHeg42501563
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qhJ2whnh2ftT/2vZqPRp8bR6
	iMbwhkvUovT1Mfig/hw=; b=CjZeU5PZOdIkO4DoAP9sLaaNn5bjwdbcNRvH79Yn
	ZD3XlMsXfX03NcJsfmpTFHvSQjkEell6uXR48rWaV5Iuo2QRhF166/xzlPbb4Nde
	YgN0B45RpF4wc32tTFVRW/4OY6aDsrKKxPT+FznCIc2MTO9p35ACu7sDkWVoUw94
	SRbLETysH/wOOk90LhNbBoxsboYRe0kwgZ+OSJjk+FV2kaFUlrwTyz7mUytQHkFy
	tZycqW5p6Br7KQgFSheKzHMK6f6VjAJPv9BNH+1z08Qi+2ZKOUJqkGJXL8mCYHVP
	sMpryz8JUB1d46w3xoouvooBPjgTXrKsz0R+7/sZbIwKmA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm9njm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:49:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ebb902eebso62555006d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408549; x=1795013349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qhJ2whnh2ftT/2vZqPRp8bR6iMbwhkvUovT1Mfig/hw=;
        b=iJ+2mZhXjcwvAG/lwAwLKJ45yKpJsJwXfNqIYNk5DalDsYSzrnKOx90NpdBA0iL/uI
         +djaiH/MTm0jcDgycLt/R4TmpXzmySuajuOI6WL2peIASlS/Qem5rSXu0Aezf41BcBuX
         fIX4dmiQHXtmCDHcrks9urIW7Owl5Cf5XMczY33oapbBMjKL/FPIKUPSoEWXhNKKMwPK
         V3/v+gMrhTFoKXcygoRqUQ0FZsv3HxowLtN1JFlN8WQ+XgaF7pRdQc3lsNRqFEE6mwuv
         nGaYkp5hry18dIEjMaRumkbWFSMQOZ2rS/90feUNxVa9x4YMu2k0fNArb2WcmZse+cjw
         zzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408549; x=1795013349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhJ2whnh2ftT/2vZqPRp8bR6iMbwhkvUovT1Mfig/hw=;
        b=W0r5tljzvZFluNJrlfVo9SA3nLqbPyQ1bpwkhmVZmUjT5JApTaceQLARFO6q/24nBi
         Cqc58g8ybdYVdjf/dA+u9gvUTlrXbeiMHr3ePKcFD2SDBjFgzw/85FCX0QD5QNfHsOo8
         tnEhhHhxqmsnWnrdXywxpRPggl76duJGY4p5eIyYTeJNQDzhaS009N8MG4wb4mLLJyU0
         CR6OrylonMwkb8BSGDtidLq1Kg8QjQteo62auoLCT0FcdkDZEVRFn3vzyzZMYSwRIrjw
         SiBxbYhUU3fRxMDKrP+17I1JP3BRuWzN3d1vfGI9yo9ulfPgOumgXqxh1hotHo50FSRZ
         o09w==
X-Forwarded-Encrypted: i=1; AL+hErHTuiV28BuAfaaysVZdklcVLh6o0rziD6oZ1bKB791fBa1KtJO1ejHlk0Ll21EnSOd+bFSsIqTb7PY0E24=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9sgL0xi1E5zdZ7BBGr5HgUk3qXhGTQFHKUjODFuaWv+pPTwwB
	NvGMBu2DRXMJYzYGYkJYTGiiqNYBM3BM8szAAN4aiJRlluu23il/HNMiD6V9E134mHEm7gfP4iB
	jyKhNmpuWnZD98M0wKt0Fi81UcT0yX4yqu2wUUBya957S4FR8aSBZ1E4QAor9YymrNBk=
X-Gm-Gg: AYBFou336QRE/PFM91+PCBn/BxTYs/xkfzyCFGMjREITUEzCffP6NRC1y23/rR5/dJp
	4H90YmztxrzrGyEdQ3it8aDgik4nAe9SOKWpKe4wikhPKlys21bk7koeb4Defbxv/K5NbqH1nJo
	fejs9Mhbs/PqJp4gcoBNwQsLaTrZ8XqJLLISq3t8umeK/jk1EixWrjmUg0q858eyYH8SPILki7i
	KJ4KlWhJXvH0N5BalwIhMXjzULCYy7TOp7zebP2TkE7GylwB96vDscEP3cRA6b8l/mFrF2oAVsB
	GMVLzGpexrdvssxqr2ZxEvrnmhJVlil8VSQyy/raAx2wPWJBozFxbiO1EcFPQdoRsUe5BNPcM8E
	kGH1SHfbgPeHW0bh1XclRHfB/9gUilp9jnrhzlNQWMLXj6iXGG1oP6gLU7HwjdH1XhnLR6zOktk
	my0CNGllyvbrwnUzGCij3qi/OwO/inH0XkJiOPi+ROfy++1ZvUPZ0cQWtjU+GXlA==
X-Received: by 2002:a05:6214:2028:b0:91c:65d0:1d85 with SMTP id 6a1803df08f44-91f0426ddcbmr48004196d6.53.1794408548893;
        Wed, 11 Nov 2026 06:49:08 -0800 (PST)
X-Received: by 2002:a05:6214:2028:b0:91c:65d0:1d85 with SMTP id 6a1803df08f44-91f0426ddcbmr48003236d6.53.1794408548137;
        Wed, 11 Nov 2026 06:49:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0923c164sm12141891fa.20.2026.11.11.06.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:49:07 -0800 (PST)
Date: Wed, 11 Nov 2026 16:49:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v8 10/29] drm/msm/dp: add link_ready to manage link-level
 operations
Message-ID: <xdahtkmsoxposnxuomytx2wcxthelxjpopecnxjellidqbjq6g@lgmcy4privcj>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
 <20261110-msm-dp-mst-v8-10-d040fb33db5f@oss.qualcomm.com>
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
In-Reply-To: <20261110-msm-dp-mst-v8-10-d040fb33db5f@oss.qualcomm.com>
X-Proofpoint-GUID: tfEVRO_cyFit1qfywi77HLfsXjjst9Od
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfXyjcCDvuPQGbu
 lCYUd4Svn41n+FEASAQ4t5hF+CF5hdegBrVXQnl1Unh8xJmD0OzlVoTabCGioAjAZl2NCnlNCBe
 QHox13UMzolX21jDFrgQtt8OCew3KOD/8wG/WtJdzVdtwmIPutj8H0OW6VFM6vzRkwKem8E+pcB
 jvl9ICHujBZKUrkCRuy8gxCfxkqTwGAoTjhQ+f8V53Kp3Vj0ajAIzDCrx/xnl63/0OaHOhuEH17
 qnVLSirsoGx7yLHvF1tCB13vFMWZHyiKj3Hm45CEaBApzEcASk4OUNZ7k716CObto6Ltt+x6L8W
 XVJ8IcwctiTKqpNrqBT0osRugQWRBGkvLrIUP+LyoUZy2EENoD+bpjp0FjvQahXBrzCzFBoxYHf
 t1X1TX7g02VsFhRdmGy691ij/LhdaIdYGZcVs8sBgRQAMZKtaC1QIxwxoetZI+54EfnTyLl91Ni
 stUMm9tPmHOwNTIEVIw==
X-Proofpoint-ORIG-GUID: tfEVRO_cyFit1qfywi77HLfsXjjst9Od
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af48066 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=9BbQWiF9P2Ean-TlPn4A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfXw0apJ07vSgc1
 3xTldVgRpyzRLVU780VDQ6tSPqOw4W9RP2jOpPVKgRcEYsQfJwoX5jGnBCRiLBIUKw6K9YFcJbq
 vaPvxG/zi80x5TxQG9dRpuy+pAZerbg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058

On Tue, Nov 10, 2026 at 12:54:31PM +0800, Yongxing Mou wrote:
> In MST mode, multiple streams share the same DP link. Track a link_ready
> state so msm_dp_display_prepare_link() runs only once per link and
> repeated calls are skipped.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++++++++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  2 files changed, 37 insertions(+), 12 deletions(-)
> 
> @@ -1570,6 +1587,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> +	if (!msm_dp_display->link_ready) {
> +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");

Link already disabled.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE3B48C402
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808428; cv=none; b=BZkrz54SL9nWtFsNEJj7ZncwTVBWCJio680JnteZ3xEwbwihScx4LDP8vEs/FaCjQMQKkUUz/w5QEQQ5lhCwMsc1XqrXV3KL4fsGjqzQ4d8X4DNugmYTh/d3AfqHljSmNMqyXsMnXpxrW7zBnCf+DZUesk/B+1ix+O8/Z/lOal8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808428; c=relaxed/simple;
	bh=WS9OC0fkUbobmsn7gzpTP5x9fAGQpJR6UbURn2RI6qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tor5Wz5DFOvB/TNv2IalJZDPtbFJXlCVwuxXaBIjtyWpepuiXR7YVcCV4ln2D7WQp5+2PIO23UVr4nrdY3XIUsVB/CnpV9rKci68BbWDeSXGLCU6RBLGhBTfaV30WEUD8mxuvrSYOr53B+dw7DPnFFQpxEUXY9BwlV9WRXGolcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDMJcHN/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyOY5i4E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDMJcHN/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyOY5i4E"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0PGD2088511
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bs2Jgzs7Tv+fLgxyw08H5RN1
	Ifr7kpK1dx9qY8mqF68=; b=lDMJcHN/OPzq1UlDCuCQ65E5z1RzyVIhBJCOh8QD
	AcYZMy5DsN7x6i0KGs2sryjcj3yWICTOYdljhsJZCHp5YNeHtNSrT1tC+Gh1QzoV
	avhztiEp2vcnh/FO8yDSAhCIK+mEKcD4BL79euU3FtK9eiE2JKGYcPw0HG5IUeFZ
	4507/+Uu3ClC+MovwFh7WB7arRHwVkk4y9zKPx01QYnbP3irlWzExK2sF6RK8RCQ
	cOhBWh4JVbPaxFCquDxV7wld/w/BRw3IEJOSwP/JLhUj0ZUgy0b/03/DnOnyTx1M
	NS0NaNSPm9B3kSNnbafdBJtd2Hh02DPZE4z/OYgKnhj96Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu1we2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:33:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so443918685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808425; x=1792413225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bs2Jgzs7Tv+fLgxyw08H5RN1Ifr7kpK1dx9qY8mqF68=;
        b=DyOY5i4ExZfoeDb4dtY9BWDRmLaQi1QJV6lwrnURWbkkkmgTCpka9/nfDR/od4W49B
         jKF8PaXmCqPSmCP4Aekzq37TGN3XMQBYYpt25/7ZM6XnQOxX6ghbNDfS5hAtFF3h41e4
         1C87x1/U8b8ZmuE4mJx0KSkDYfaKGDKhHWTMHmjIjRAAa7KfHskc3IPHDCKxpWPTd2xq
         BZ/btRkHNR/TeGNhTztorfUwft4mPYeVEiw8ZgMK72lXgNNOsEFUgn1aBXDsZYJS3/1+
         s2RbErTucIrKBuVG62G4TIfmbCqz8NnL25+xOtYKUAfvcU7vmVnKPOG8APz8Ajkkf8VK
         d1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808425; x=1792413225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bs2Jgzs7Tv+fLgxyw08H5RN1Ifr7kpK1dx9qY8mqF68=;
        b=j4XajrLyq69vosQ1F9VPYo+bfoA/hZsalXQyntvHpQdpFNDtkSQr8+Lu9KgnBxIZmr
         /I2Owk9Y9hy+OAgx4l/+Vpe6MILKhlXLjh3eiRkFtJ9RLMxJEdKsUNKYAV0jF4Yd/S6F
         /TZtxmB8LqenDaqGq9jaaH0jCdtj6a6mwM52laRNoIHtWv1OGn4x7oYVyeMLf8Yeesov
         XxkS3nW4mAmpiFrjmMLmOFn8I52JcdBWru7z/OPvPSlwEFRf+Xv/o0eNboVGWG/siYBl
         2SgddXEXsjKXAasBcr2gptRjqN7FpahDN3wgbnvLfw/ZFz2xS03P62d5XfXS5fJMSAmt
         aicQ==
X-Forwarded-Encrypted: i=1; AKwUvBww9MidH/Qlb/SmUKnkAV8q2qqHPmut9OAUhGJ52UyMkrbsy6nxtPkQFojGkMf0SWwZejczwDhI5GsFN6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzcmaWaV/AY59Y8Vg2Q20oYALN578VxwnaJGSX6eHS5Nk1h3lG
	ta3XqX9jDF9syUo2dIoV2DMLOzplLH7smne+dwfKNx+QmCosQa8R7XHd0UDM8qWNMOKmwedKg0P
	RSRiV8r84e9maXHBz4RRVJrJTcXxASoQaWdJMTMO7TMfRQI3BPpkcLR3VD9U203NlKes=
X-Gm-Gg: AYBFou0qVzQG3e5KlIxiNhDsZ1aOHXsWhIoM1U8MX05kwSZM0ZEDyu/ii4jIDjtyHEP
	93nP5omDJxm7XRvlltm1jcnq2M7w6936wRbUSmkpHGpTHo63SUJBZah8eV+PxGWhLhvFbt9wGUm
	zBIIxNJPeKkjefPv2rdiP7IzYGtlLyihjivv4oNBgi5xRSuYwBGlgcAf6s3bMBtnXC0en5cc2vq
	mvxV6t0UmrV8zRDKSUuRVb7vvYy3EMejPRlujRZ8hQuVVrTlEgYzKNzVK0YQpIJcdwm2kLAUuGg
	MC0D5wJf+H2dvpdXxyBs7ma6HTcrk2XMLJNBNAkjREcXVG1xv12qaWjdGI1GUlgg+j0PwR4d8T2
	JLZRGbQya3jPIz6kVkDzA/rS39ggXOTCJcQThhTibksCGqidFYhSNw0kvVs8ZVwq3YiuP0qjsDk
	/cdKNx5UpZ7/E/
X-Received: by 2002:a05:620a:6493:b0:93e:c12c:f12e with SMTP id af79cd13be357-93ec12d0591mr1359658185a.73.1791808425166;
        Mon, 12 Oct 2026 05:33:45 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:93e:c12c:f12e with SMTP id af79cd13be357-93ec12d0591mr1359651885a.73.1791808424602;
        Mon, 12 Oct 2026 05:33:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea81c7sm2819066e87.49.2026.10.12.05.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:33:43 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:33:41 +0300
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
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 01/20] drm/atomic: Handle max bpc properties before
 connector state allocation
Message-ID: <mkkc7pbeh3aiyhhnbkis7owqvvpt55lyminlcnu5gun6s76vit@5pmsxkrdey4f>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-1-1835d4966da3@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-1-1835d4966da3@radxa.com>
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accd3a9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=ksxQWNrZAAAA:8
 a=uu4xuC75hOI6q6cYBXkA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX9J477TtdOOrs
 xWaTkvhXELYnjt+TxpPOXq22pBNeQD9BK0OoiWBYIDZnL5mMzRTo8VPGivvLmJ9qPuZO7q4RDvz
 +d99Os/KE8mpXp6wdeH1PCxGVslJiZcVq+DXI+0cynnidIGDik3AEROncQcxzq8Bt9VCFmkmxMz
 HqHVjWqLZuryBtBUa/BBya1P7etdErFtORy//7RCRAqR0P5wlkYyT3XmHLA6MEqckQhShKx7/V9
 oQ4CICSofGvH/zHh8sr5rzagzGOy17Xm7DQTo6J7Ue4TWf45BVXfzKcLo10SyTypMlXiw2AD7hA
 dJvwNwMBH1vDL++MQTKmGGvdlfvCVJqOA6i4M1c+8Dn+veLQQ/qHvSV8ylLC8mWcMY7/1kpEnps
 mxHFJreFRvlypgwPhjwP6yoY4xFL5JrxVF//1W3vLAdNRDYGA26kApaX+8neYeMkYQQBPC7SnHh
 jcHyoZ68GDxmSahC8eA==
X-Proofpoint-ORIG-GUID: pV4E8RHAbGIuVPiVzjQ0cnTdxV_I9qUu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfXwWAVeFkWJKHz
 GqhEN9DYhZJV12F0jIiFyy4Ox2U3U8NTF4cq8cuadAioxaC4doXYUT6VZ1oJeTasrgpVL2vXF6q
 +roYJIkVOBGbosM/Au9czPYOpJad8Ko=
X-Proofpoint-GUID: pV4E8RHAbGIuVPiVzjQ0cnTdxV_I9qUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120049

On Fri, Oct 09, 2026 at 11:15:53AM +0800, Xilin Wu wrote:
> Allow drivers to attach the max bpc property before allocating connector
> state, as needed by the upcoming non-HDMI bridge connector support.
> Only update the current state when one exists.
> 
> Initialize max_requested_bpc and max_bpc from the attached property default
> when creating connector state. Use drm_object_property_get_default_value()
> rather than the range maximum so that state creation and subsequent resets
> restore the value chosen when attaching the property.
> 
> Cover deferred allocation, existing state and restoration of a default
> that differs from the range maximum in the connector KUnit tests.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c  |  8 +++++
>  drivers/gpu/drm/drm_connector.c            |  6 ++--
>  drivers/gpu/drm/tests/drm_connector_test.c | 53 ++++++++++++++++++++++++++++++
>  3 files changed, 65 insertions(+), 2 deletions(-)
> 

I'd very much prefer if instead non-HDMI bridge chains followed the HDMI
approach, making the state available.

-- 
With best wishes
Dmitry

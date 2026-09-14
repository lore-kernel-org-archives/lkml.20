Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28C3258EF9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346753; cv=none; b=g7oK+OXz8bV6FE/GbP5MD8soUcBpm/pHZB2g8sRL3TKU9kyY5byoWVZSkxgASLOUYy8lqq4ZTb8+co4BJIFB+7S6mMAmdnqgmqI6k0W1Cb0C071ccvyZYjxI+rgIq2L0tsuy+pk0iTXLvQkhepxNye0nHtRRXyssTWPb5vsVZHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346753; c=relaxed/simple;
	bh=11XAC7IHohnLExbynXhQgqZRwfRLEUClDfxcSWmZ3EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4uMpmVoURi6ur8OTQs2Oh+bcA6iNIKZEQxLCyMe7MIbuZkyJuv6zprQ3lfnDTvUOVAR96hoFpDwKKP5BICwHr4NauxrZ1K8xRyDrJYN39kX1CTH3oRxF2RTXtdYheR0lbojz7O9XgsC0NkWZIApU6JcdGDY63wmre1lO2p8CXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeyTfrQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLpxyiXb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeyTfrQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLpxyiXb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06OEu2660933
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QODTxX750UA4HDn/zUk4Bheg
	1ca4Dh3QMwnpyqlFlbw=; b=WeyTfrQWQtxC7P+0lvyYoIAo37ADFwFqHxG8VhED
	3p5Vkma8T5Sas1eGuUM0PzPhyhMpNBrXUcKhwgt0E1Dzho7Mspo0XsJW7/SkzqDE
	NeqvMIY4oHX9vaLwxqSMSBaHFa6PVAM95/aYhak4r2HaMlppf2dwDqUMM4d0rKkX
	S0omk2f0Rq+jRIbq1Lf8yzgZMafTff8B7+e/CBHn+LOgYI3z5K+p8un4C2+7Ia6a
	cmQyhItAqar78egyuUSQVKx0V9aqqGYQAQ0uElefmuDzAO9xxBFOsaDbt5mdUDjW
	m0r5ngygOLIRnzTV19TJ9hTp+eoqw2YR1vQWgUchujrM+Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd4g7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:45:51 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso1981610241.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789346750; x=1789951550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QODTxX750UA4HDn/zUk4Bheg1ca4Dh3QMwnpyqlFlbw=;
        b=QLpxyiXb389DgTZPqyACu2ROyG2PBr78/tmWDY8jqe3uxPqBBe3Cf16GHpRX32yUVr
         SC6ERndbH2AT1v/H6b9Gg3BZr7RTg5osmQPd2OfN04cGtC2KkzI+twqxodtZklO6rJa6
         nxPHyr1+GB89Adkqa/0rUJF7nAUBm7B6OaHhjy1ILv6Uw5ELAeZQI7uhmu3Wwy6/4E83
         szHOcu8tMxJa0H7Li23i4jg8V4Hh28rybMA4KDxdN8YTVPp0CM0Bc2BtDTmEcYIps6hY
         XnT30MwmbNRglVF8r2zUIp+NgkKnFxq1ACnssdKarbaARl/TvL1sPW31fPAfkOt+d0gY
         xaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346750; x=1789951550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QODTxX750UA4HDn/zUk4Bheg1ca4Dh3QMwnpyqlFlbw=;
        b=No5FDCRFLK/tvIHwP2/WnawSzvXTEGjoYLdVG3gngNWV6KedURB3K57lsg8e2Sx4NC
         Y+qUYY4t84Xi+Mqh3Hj84Y+iFl63hfPHt7Xww0UpVMPlU43FtxkXETeoiyevgRDKKRhj
         Eafe5iqk+m5FX4LR+SJMIKz/WfsvxZgtCGytt0xBsuigUvPx022ZXOafJhx6jSSHqkoj
         hllkqaakAP+j5gi2pNU5GGa5gaudHG/goweifFFwGNZiREl7BnHvzA4cwdAZpV0L6Xyu
         L6ZUG0ivjYKI0QIeQiSu0c/07tR3+982MhyDkL+3i5hjwG+DjefhUeZ04oYAoZ/Nvvp7
         O2ww==
X-Forwarded-Encrypted: i=1; AKwUvBwiTs4jaXt17bch3j1xwQA2ItFDC9fWpI46VpGCUNOghxJrohuSN6zxwAaHhJivHipYveLAbXM06ur1Cns=@vger.kernel.org
X-Gm-Message-State: AFuF++n/Q2OP9iA6u9ibxZi/b+03Ij/mfpoHcDMNhZs+n0Ousx9vm5LM
	QnIrWwHT2G3WKVILDPqRPr0K/KIGWmLpEcqz6UK0X8RRiPxrCY8Wt9OCTst74Hgv54yWeWv7Uzh
	aZfo5Mf1x/n7Sxspwj+x2H+j2eb6wvt/vrnytKpJWs3SErTkQaBJc99ZTTbTVnLhmo5I=
X-Gm-Gg: AYBFou1mNzzy9qcXf+TAswBywz9jx1erZnO/szWY41J8zaOMcoy2NZ4gk3W5NgUmM+z
	AW81QnhOA2m7/UAdTHzMrZKzS9lmglTNEnJ+pVyOPNxKyV/Dgv4DmB/2RvHfagCldDtXLyz45D9
	tQDFXHrVbmgDlLhm1vK2lPA+KrjmDrUkNNZddJqxYhEPln1naCSet1SU4ZSLIjpE5aeMenYHtx0
	5vg/oSSHLSwIt/Y8JDya42UZRuwLEVyO9t162HFDDow/3/m6N1Ouopfqe7OdCnYjg0U7IR+wulS
	AYvxQQDKtZbztgIDACE0lVdWpwWsll92eW4E41gU0pLArum0NFgTV0jbp+U/0i6tT3WdpOjm5ZI
	gogxMnlQ0ItMXGdR7tv8l7H9r1Vo2xLKxaP3zdCNfIGPLL8ypIl3BOZZICuLocEUfQ+g4lm5TwK
	PZD+fjfF+M0CYa
X-Received: by 2002:a05:6102:a4a:b0:77f:9278:af6e with SMTP id ada2fe7eead31-79b5b196caemr117951137.9.1789346745154;
        Sun, 13 Sep 2026 17:45:45 -0700 (PDT)
X-Received: by 2002:a05:6102:a4a:b0:77f:9278:af6e with SMTP id ada2fe7eead31-79b5b196caemr117928137.9.1789346744772;
        Sun, 13 Sep 2026 17:45:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a03a86f2sm2002489e87.4.2026.09.13.17.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:45:42 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:45:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/7] drm/msm/hdmi_bridge: Drop redundant
 initialization in msm_hdmi_bridge_init()
Message-ID: <vzr4mqf3opzusmbz42fwr4m5bbmpu7imrwzsuhhmxcz4klklme@anqfxjg2a55h>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-4-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-4-87bdb9f1987f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa743bf cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=P84uMFOcKlMy4IiKK0cA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwNyBTYWx0ZWRfX2wVfd+jqdroG
 G+xxjFiimxVIpxby6bCYN2JkBWTqvc558H451qMnBObLecfikw9/3ccpEMmK5SlOetRP1L8PLGA
 byxx2cGtmwEbUvXddh8d02EMvGcEZe+1Rnzgf/HDCEvLw34H3Xms5iA7E8oxLGqv4seEIZLzbig
 /71iLJzKX3Sp9mBdgPemmuUex+mxhz/+s7lSB+289BmPwzDP9w6PNNqPvwO2+xkeX1RJsQPUL7n
 axyhsv8wOSlGdUPirgw5fjYueXDLpnOj9QFWI9CsHPJMH7wLPO1hvNDmjc4XRUO4Ff0h+vNlbfs
 W5v1YB+CgLn4S0K3V8H93DJ/9ubI9bZkm4cyA2LImJddKWVzeDxrhEcmM2MtmdV9cGg7N1E6OF7
 G+RxJ6gYBY2e8i3WzMUl1S78T1OCbsn8G9VQ/XSY0sK2/FyAEi+/xA8O/+OXOg0W+hlJeyO3Lrk
 710571/tGiHIb8kAPTg==
X-Proofpoint-ORIG-GUID: M03q9f9flWfJM5nAE_67cz3lGarqWMZ6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwNyBTYWx0ZWRfX0gYmv7LNGxWx
 lVm+WjsfyVUNEVpGNETe2F0IKcy1BTGreGKbo0A/l7+B1t7qV/j1mIu6mGnWoyInQ51w/GqDdX4
 OFPXwTwoqHM2q9VAilNussPtcr1pg7E=
X-Proofpoint-GUID: M03q9f9flWfJM5nAE_67cz3lGarqWMZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140007

On Fri, Sep 11, 2026 at 12:29:37PM +0200, Krzysztof Kozlowski wrote:
> Local 'struct drm_bridge *bridge' variable is assigned in ~13th line of
> the function, before any first use, thus explicit NULL initialization is
> not necessary.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

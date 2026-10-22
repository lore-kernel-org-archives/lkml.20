Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663871;
	b=E7UJBjKJC+jFvj25HUHGxy8UwUYPqomdhiSKZvIIbqoCNrDh390VJsdL0jJKk1gU5fbB
	 6GEeKL+Glu0Pk7sBuOnEdQfk80D5VWfqqUY3BmVLLXIQl8UEn/aXhWKH8UvyptmITwXsj
	 UuR/4k0GlG8r4qQTKMqQaLhtQxW1zsDAswVq63YF6Xkn2I1fdynOf1mSRZOiFmWjGEoTd
	 1sH61uWt9GdUxj1+UFh1BqRr50q3QL1XHqtoEWl0NamybDJZ6EFIM5hmXDvLUCd9Cx+Ga
	 QlTdym/QYglEOo3sAo1wnVVkZj0tvmezffeRjUvs9wUpblJ7At3z41CnK8Oh8R51ujw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=c9B2KZJqk7yWavVCYYzwu+zA2gBsyHi3wZ3RoLDA4uc=;
	b=qFUaNgEv2ofadVpXztsesmKMMSsHEjotq5PEVr0dSUg2qeu4MA83tVO30G+0RZimook/
	 u5Ymq2qbkYRQJ1WOY5RyRxGsOP6hci5xGIvMkYX8pSFg+NCosNQYMT3jMvBGvn60C7Q3r
	 GtZDwrgNFQMuDkDVBXkeSshWKGICFVQYoMVz0rdLKB8rdXQ+oQvs6xwe48STwMWz7YTGs
	 cj3d0hv6Dk4Sv38G25V6rKjh/3HuwQWRRgNltrPwxVoRBwb3W1mYHTAIHbg49r+xwg4Mh
	 2rTg8CILCjEir4+4B+LBeGOhdKVV3bvmK93/t/WPTOxb83ONgibvyJkQB1RoI4rdSLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYujOQpX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bpM5udWg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F055B606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F055B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYujOQpX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bpM5udWg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA01JY3427009
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c9B2KZJqk7yWavVCYYzwu+zA
	2gBsyHi3wZ3RoLDA4uc=; b=EYujOQpXhcPwGx6szVYQ8PLBcWiS28DJul+ISrVy
	qRkwyx5acOfFAWNU6K1SExdLPLSHUn/iJyosKfM05T7TbgwW5ePvuB48nJ+CiWR0
	W7ASmhJhxWxOh/l8KlXO2Fdlp5A5+HEgMoXE4EoGt8or7fb3r4mWXtaJlYp6RjAH
	YKuNR8t1gg88vK9YjHmnFSJpX5FNm2UrhmMT4eA51I7zwuF9IH71SmnlNlKRJBva
	a3wZfxLcRNyp5/cBBERKjj05VcwSGy3ioBUqLPWMoNhgeBotgf/r6ylNvDS/1InA
	Xw6LQczcS9b69ypRVK9T4wkpbk1AQUhGr1jQwCPc67lmVw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93asu0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:11:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so312471385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792663869; x=1793268669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c9B2KZJqk7yWavVCYYzwu+zA2gBsyHi3wZ3RoLDA4uc=;
        b=bpM5udWgFBFhk3Uqu2R0w4RTvAcp666jjgc2hPVrd4sRye/z87hkJ/AlKuK5pkVLnI
         HlFEFUr1VjzmFCtTFlmCNhdJ8GZBgsWB3IYC5PhyqET5Ys3z+bdXoNBNEl8jN4G/oArg
         vCshPds+IEq8o7aUfLhui3e+xugO2ko7zWJTkShrnZYfI0H/HEyodWkzrrqXdAoXwV+q
         e2jdZ3u5TYN1CU8A1UMoSHT6wvOau16F6ixgVCiJ6FiSqFN9X0fikNOx1p7sjugg78g0
         Ql35CvdC7syquwAfR8RIBdWYfpV+qBB4vrqPSEOGN1E3gVwD/wZ6BtfoaLZx2sNKFSa2
         Z8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663869; x=1793268669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9B2KZJqk7yWavVCYYzwu+zA2gBsyHi3wZ3RoLDA4uc=;
        b=l2FmqnlJwBKfD8Ux/IgMKt98B12dcbsB23YrDfyoiSTLfriRdVpy327KA6Jxyqp+z+
         kcmziktgRCfGLmRN6jUDua7tFpMVaGc6FrDgI4j6m6ZxXhXTVTosfGrccZ1dbVSgdqu5
         +0zIAaHOcBSafWWSibp2QCUODodJt04jobHCstQTx5ZtGx9/UzdGi9SE+DelgsozzwA/
         34o+/lvzXXzUAIu079YFAEPva01NIPfaMHQsmDfxijzW7J00MnJZKucHK87A4kiy5qLL
         Qn//LzFJVIdN3VqMfwggy+UntkTGbQlDQd1QuMjGNL2TE7y22mx+n1bXEdcpuU/KVaHR
         MdzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwh2EHdeciZV1KOTeT+PSGIm0lw+mvxgdCUEi9Y6TJ57OsGYpoA6BEm02QcSN5wfTQPsZJuMNb66sre74=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg5r9k5st1wQg3SB5kmtZCI1DYjNlfwCGG53zl0lK9eih+1zU3
	ES08+JjdPXSnIL974aL3bapNNNjm6hQh0XHECmK/cjb7oymEDDf+CFaDGBwlLGvdlpgDgKTU8oE
	mqxLf6winXojKpvZAa0dDTPvbJRg0zq5Ht/NuaZaHB4aDpL8bkpXgqKkvgw1tvuz7lZc=
X-Gm-Gg: AYBFou37CQv+04qvlJgjE19tXuCgm3j+eY0mouWpy2pCZqM6F+O8DUPP0tsxdJOBO13
	IqvSguOhaaeisEPOjvEhfKu46o7A+qveWuDLlWG0fis8CyWu+kYdTYtLn6WUQ7fROm44Dx+2I+0
	nbF2v2SEfSuzg6OfLxfGL2FYbW54MMPvgXong4QT4s5vHys2y1EBrasDn5Ac/iGkjvrpnPtK+hf
	5LByLv7HRkW/mkh1wMlYo3pNHF4xoZ/dK5PmWGPWd6zvO/HJ5AjWTy81X+UHlp5KCbJVSE/QCI4
	eKhCgG9X7/jjlLj0uTI156FZ746B9lPQtWdl/3czYkWRMpw1/YswVkCuDMiB1KZhR3yZJm1vODq
	5X1v1xe4FS+E1IO6QK9ykRuOy8o6+zfywdLfa/qrFr15nnw5/OlBXknj4Wa9S+nGBiT9oofkCj8
	R6eWaikdeYbzeM
X-Received: by 2002:a05:620a:8909:b0:93f:1936:b20a with SMTP id af79cd13be357-93f57f777e6mr833149485a.76.1792663869301;
        Thu, 22 Oct 2026 03:11:09 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:93f:1936:b20a with SMTP id af79cd13be357-93f57f777e6mr833144685a.76.1792663868810;
        Thu, 22 Oct 2026 03:11:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f5541e4sm6578571fa.10.2026.10.22.03.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:11:07 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:11:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] drm/msm/dp: Add DisplayPort controller for
 Kaanapali
Message-ID: <7p6lfgpiav4hqsxafx552i5ck2evnczrpkpb3ggjszvwzsajvy@75h6d473f752>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-2-b5ae8e6083c3@oss.qualcomm.com>
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
In-Reply-To: <20261022-kaanapali_dp-v3-2-b5ae8e6083c3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfXw5CZy0LDWmJf
 vgkodjXmF93hdFdvrC2yErNPK2KdmdUvhuTeUWgT7VuSP6/AaXRdrcbLFOCZK1Ct3pK7p+c55Vg
 UONlRwt/hdTkx1TH2LO0JcOHmDBEJT3WK7cY3/JzKcxwRQdY8vAPPIUHV2RcFtqfLWitj6N9id+
 qKZqFUD5qv5vVsN0/EqlSrlQPnEN1hmcvSltwTCAE7GsMq6tswLSjtf3GIzp79V7Op+R/YfYhlW
 9SzITDdf+9unu8G+nDPteKXj2c2rH2yd4GylD7sVZsxMpfMDQi3zP2rGxh//IDH4yBVhdC6goCM
 BruaS5og5Ga+SkLZAX9dpXi4NYYE5x6wSdaPaTr9K535wInzdy2t/eAed+43GVUDSTA5NGYIvXk
 oJyn4WiQvpG9YrXzSrgrc1XjHrlAJl3h0N0uZnLVwmm2O8FLsb7wCrwUWxr0UFXPOz3P2hpZOUv
 p0/YPWm5R2TOijqIi9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX4n1fKFsOiTU+
 JZ95Sf+yHbCFp3vwGLXDkUDzsSJNgOZ0tw483jIYSo+L250lSo4l7so7TiNMUKRJW7mSHLvtZCA
 iJ3n1Zs5dk+0AaaMFm2fezRZga0nltg=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9e13d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=OHVtJ8ySOF6wsxM0GN0A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Aet3T-sHes5wnJQmgiWt_-gNL5clY-0k
X-Proofpoint-ORIG-GUID: Aet3T-sHes5wnJQmgiWt_-gNL5clY-0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220040

On Thu, Oct 22, 2026 at 03:19:43PM +0530, Balaji Kalkonda wrote:
> The Qualcomm Kaanapali platform comes with a DisplayPort controller
> with a different base offset than the previous SM8650 SoC, add support
> for this in the DisplayPort driver.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

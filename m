Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007733;
	b=Fu36Y602dGcQjWi/7V3QaOhnDicUdzU9popkmMDN0K7ruFghrwXqqcNw3UWln+dvWm1N
	 jjmoYKlwnKcqiVZB3/4x16Lxrs7+VQg+VffgvRhZfXbs/AST1S3m/ZtvUkwXcjuwrKjUK
	 wMW12/ypHF3993REEKCxd9aB+AgxaR9czuIWTsHOZ+qVFGUZvcyvn8bGCDW2jjpzBMP4m
	 aUV99GjJPV8GbLGKOl/MfrnFg9K+iFez26vpxu4S6QfQXx15mU4hOFJZK8dQ6ZqLHciJl
	 M4x13AFsQi0gxIQ4viT4OidCQF6q4ngyMcO3IOgz3OSRZcM+JAQFyRr6y8ALgtegIlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007733;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EPtH13VTn4R7Yb2sy+8OKOvdDZ5ZAvbReyMqod1w9Ds=;
	b=a5o72BZVlVGsdoZY9PitKb+3mGQlcdDDIARa1LMNgjx8SYWt2ZHfVj5tVXqxnB/KZZRz
	 9fRNGs8xyq/Ioybagr+2UTqaZbHam61v/8uhbrRcet7tL+s2K17iwh5++MoCwVMz2BnvI
	 fjsQDcfamZXMbsVQ696MHfcqVNw7jSk3KFn6Ik6a7XJjqs6yeyDwa/iFzIx2yoeNxvNAi
	 FVC1LP4eZvYF2KB3nnv846Xc5YEQOpfFsO1suaDmf+kM5n4SkKfUZErEMa9FezZqwgHlM
	 OQc7gWNIMGUwGVs/RTI9c8mIAm8PzZ87BlduWKquf3v/T6uOn0ZS41M2nwcE8k6YFzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HVKefm99;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L+xUAKHn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197E5606A328
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 197E5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HVKefm99;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L+xUAKHn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4apCH3301671
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EPtH13VTn4R7Yb2sy+8OKOvdDZ5ZAvbReyMqod1w9Ds=; b=HVKefm99672kmLwm
	g95SEjJpFBWotCATx/LSN0mCzjCoZ+VneujD1PYIVRclmxKqeCKxKxalyWNzviNw
	lp1b9NIRgsHsj4HoIVlZEh5oBwZ9gBLiGRBG7OfareMEZbODh8h0SM2BsqfJ78Ax
	T488IxfRurhRCt1xDtJgmiBgwUsFKvQSWoQ+w55OtCctFYmKSCkNwRICrS6PNDxR
	kdGV560SNtQazwYwYQk31E8ABO2bSLnWOVmYnz+HxlrWKbEY2AGmjsLP61yfJFh/
	01DzUwpIGrmE8RatdkGUFnUQEpTJDxnAxvy3Vt1vkz6ghbmjdBieg6qUX85HaL6v
	5cdEhQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpss5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:42:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536708d1a3eso11948871cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007726; x=1793612526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPtH13VTn4R7Yb2sy+8OKOvdDZ5ZAvbReyMqod1w9Ds=;
        b=L+xUAKHn3R/BL3TT5lE6i6COQBEGO8XFEhZ9K6ofM08qutO7MdmOK5DBArhUbHEO6w
         tNDFD/Xa9Ql16sN09k0ykb86+sobr0vn232nbvowiVJ4Kx000Mq7vdOCM2pHPTfSk2qK
         CExoV3S39H1Wzns7pqb0kTRBHC+/uZGJDdDDdn+pVR0WxXBxoeMrpqoMXclioumGJfYa
         bIwC41yQ3Rmr+SD/kS+3yk4n0ou3cEPNv1P2bnIH/cIV2x6nwdilP3LV5z/C1hEcUkkf
         lkQF1ncwGW5mv5Hx0AQBc3NkPlbx+pZ9rtY4NkeoAkRv/uhHF8STcsIKOOYIx5oi41rq
         dKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007726; x=1793612526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPtH13VTn4R7Yb2sy+8OKOvdDZ5ZAvbReyMqod1w9Ds=;
        b=RwkTWIMQjgeZOB608iAcBONhP7N14ltWdjXfLnJ5B89A7UNHAPYeOR0BIfQsYcHN90
         JqxpyMxGilPKbTh4EPzAJLjwRK1WY8y4M1wjSHpF2TsmVEMYlBaNKhb/avDek6Y+bRRx
         cXFG38Y0BLp2f1EvQeuhFV5JWbv/MhZ4uQXOeoWEmhSdP7B31li81j2HLjJT0rbtBVmM
         LS+RRJVsN+w45dZHb4DAaH2kv5tYXrAAFnsW8+unqSpc/rz4HoKoRtvwU4f27lrSAL0s
         m9uqkT4RkN9IprmRDp5yYytP1yij2v5tV7ncWZWA+dYrt9sFFrsRrNLUqDZx0Watgmhl
         HGVw==
X-Forwarded-Encrypted: i=1; AKwUvBxw5o8Vr+WGzZ6SFQ70wmIhQ64wxV+oFZwXOniRocO+eBNUFpXIsM0XF1j/b22JtfrPyqc4iWn8VIIjlkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcUvWj5g9VJQio/utlAR5MQDOFCzBfuQaLiiqm9MJN1Pgf3Rpk
	V3r6U3RZw/PkTTcFlc4kdClRF/F/tNFG7/aaI4tbKmt7nnEbpMck+aKej0aSDq8iaS2xprJpiga
	72BoGrMWm5QoE0TJSo8Iw3PLCQXSQ5vtBCa/kJTg2/61y55djrOEwmnFxf+7zGCw+org=
X-Gm-Gg: AYBFou1UsO5qql9q+2wp7d32OIDRuHhdcUS5Q11yHkuMWTADqvuzL6yRQAreXW+coj4
	jiJ7qhC/CmqF7bosapdjRy5DCR37rCG00LXe5EtIwltaDctXoH2DOZAdTr8Pgn31rSwh0VD/Xgc
	uEvcOO9wB2bUdmPqiUOLgQJqg7dnzS/flOsZmlH98wXUnhwOi9emWRvW3I6FL3mzEgLrDdJhOBh
	iiIoDG/NvHlAfyQNwVMM1GEPM+KcpnAH4QgJvcrf5mVNPJN+R+y/Aq9YXye5O8fEE6a6oqTIN/W
	jYdYGdviKcAggDlSjpB0EqeTi5FVqHyMyCnaJrZWJR+c6SZEwyYoc+KjrU7LnLSGydmI2CJRmuX
	qOYRUb/+yzmCTsE5Ym58haQ==
X-Received: by 2002:a05:620a:4918:b0:93f:1fc5:f07b with SMTP id af79cd13be357-940ef7e9992mr977928185a.2.1793007726358;
        Mon, 26 Oct 2026 02:42:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4918:b0:93f:1fc5:f07b with SMTP id af79cd13be357-940ef7e9992mr977924785a.2.1793007725804;
        Mon, 26 Oct 2026 02:42:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650890sm308924866b.51.2026.10.26.02.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:42:04 -0700 (PDT)
Message-ID: <8825300d-4ba5-4a42-a27f-1378132470d7@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:42:02 +0100
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
Subject: Re: [PATCH v3 11/14] drm/msm/dpu: clean up the self-refresh helpers
 on teardown
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-11-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-11-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX+dBzv0EZ4FOX
 d5GJRZ8hx1LoW8RBWdIR2915UVg4dvMu71XCSkvkH1752wi4BQoG5+Ltihuk1MzLio/OdT11znv
 4pyKl69Ilg8A5Kr46b0ZKjiORhKJOsQ=
X-Proofpoint-GUID: NMURnD2EzxesQ4l3dyAUFa_ZzZB2P0su
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfXykhap7NWL//2
 1NLdM7i902vu7T39dWyqGist7Rl3eSqgkFLjEi/joYDvoh+XaSaid0+4hePFU7GNk0i/JNwGXXx
 JBhA36/btSss/kts+Wo2Gp0cF6n9sYiai2hip4VtnLjRSICNIRGT3/Pe53VFL0HkX9OJHVnCA6F
 OZRVE5l9jFJVE8TAMCcChM/qAzCnpDORFDgs8IX4o2+fYav+o1wBRATZNea4fMT3+48BPvki13T
 9Xnwm4NGQXGMDVTgvjoQH2XZ7HDmJWuPJ+v96TZOCIMTEC4SNvy8IduPwkFYNeEXOPo/NtzqILP
 hBm3zsgEPw9eABx3HTqU4Ebfghs6nr2Ckvn3lr9mU9dNbg1eD+veCYtKhi6W42rbxGhHNyI+crG
 TIssQKewHMTDtc3IEIhvQZj5XEl2vJahsLinFbRohwXByZyjtRVZQWtZGnDJf9z+bS61fK9hlC/
 pieIDPExscyTJLnJ0Mg==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf206f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_fTQ-MXv4NwHnn4YafAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: NMURnD2EzxesQ4l3dyAUFa_ZzZB2P0su
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> Unbinding the display driver on MSM8996 with DPU oopses about a second
> later:
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000870
>   pc : drm_atomic_commit_alloc+0x10/0x9c
>   lr : drm_self_refresh_helper_entry_work+0x5c/0x1dc
> 
> dpu_crtc_init() sets up the self-refresh helper for each CRTC, but
> nothing ever calls drm_self_refresh_helper_cleanup(). Every modeset
> commit, including the one which shuts the display down on unbind, queues
> the delayed entry work of the helper, which then runs after the CRTC
> and the DRM device have been freed, and its data is leaked.
> 
> Clean the helpers up when tearing down the DPU hardware, which cancels
> the pending work while the KMS is still intact. Doing it from a managed
> action instead would not be enough: the DRM device, and its managed
> resources with it, outlives the unbind as long as userspace holds it
> open.
> 
> Fixes: 1122697810e5 ("drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

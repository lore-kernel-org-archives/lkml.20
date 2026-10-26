Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006797;
	b=K4tWqRBdgOtmdrF3M9mL/enGT5vCOVRg7Rbhytkwa0/UsV8wfEi1GFt+kz2BO8PuDl7M
	 ooeM7HJaN3ciZL6/39ugGTof93LMj//sIlkYt4PYDyn2bOj5RQibQQhSMSgmDEiuxoe92
	 pel1jBUHMOQMr8xlXG8E1t78yoW8ialT3g7p0WDNgCXTa0Xv9R4CUJFN+h1w1EWSpdI0j
	 l+UD38/a58Dr5qIQyC+dmeqKAA1bfEYMqAc/xUQZ/H1Wf2yhb6f63BcgHxlW4W68bTUBM
	 F+unRFmOjOmA6Sx94ndt9/sZK/ADdUyek+bHDTVve3Ew/FaEYQj0YxcalksYWK2lcSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jzEc9HqqeJ0Y72eXS6b2HTt5hh2dAgU7hXsaabSdUAc=;
	b=pc3BerWbryL+sQ0uFSS5KQGu9FJAPNPTsh6tkCSWmJ9E+oOqvxfplqdwTNbQyqZ8lhh1
	 1b49fB8akBTq0TFgcf3IW2zI8A9L0HHm90DYmB+uILOBbEYyjPJvBFo6JY+919aSESR1u
	 6jTKmyntjx9YRoXL+ORklJDw8yzbR/6MBUx6B9T4QL/GwK6KF7h6+GzSfA6nkw7T+hr9M
	 qJdDBilHTdeenTpRehYQcErW9lW8Oh5V7Mkl4vjbGeBXPlRkz9UEbOC5KdzQHXuMpHOxU
	 JhjroEmYiJqzJ6xch+68C8TDI7q3juO2mLdTzeT6kDO5f7sFzrxpRIH8YCGJFUlziSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eORX3JeG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erSFPzz+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD36F606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD36F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eORX3JeG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erSFPzz+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4arKn3303607
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jzEc9HqqeJ0Y72eXS6b2HTt5hh2dAgU7hXsaabSdUAc=; b=eORX3JeGKnCXHjc/
	T2mIhqF3pOOqpR9pZG3y4dGgQ8/I6cfuUi2jqYLVFdt7P8fHsYYDmOSi3Hl56c/m
	v2Q+hSmIUDrVD9SwcrBN9DBnVbkMAuBJ70+hbLY+sIOVq2B2xJk7kGKBXd0N0ueE
	1TFiWzxICwLe5XLq7gtz9/y63WNyAoq+gzJFqK3ixen49JSUAGsPEKV1YmBT4fiw
	v3lKL8O4hjjLrTBMNAM9mOpfl2CkYHnqNFoLgNXburCcLwa3Az2NicJw7LJKMEnf
	2YEhmjTw+bJ9TVASN8Y0lAD+qw0Nq2hYT+YoXKq11pyiiD9D5dLQkOSZhUoDz+cs
	NVCZ8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmsds0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:26:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5350173dc7aso9970491cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006795; x=1793611595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzEc9HqqeJ0Y72eXS6b2HTt5hh2dAgU7hXsaabSdUAc=;
        b=erSFPzz+01fPUmyK/Tk1mxP2+egdlw53sYF2QCbRRhnYKk3pz1kXcQH9pmgetiKNkG
         pFAgcNoVFtJnBXNzghKZGmoy1Wd2vcZBFl2hi3M40+WyY2wMKXKfLp1LqfGGsxZYRKxI
         9psDpM5ghq7b11YxZ/QXGsCJ/hHI57+F5dCohxsPjJujJv+oJ5CaAT2hLnrPacPe86s8
         hI0rFZjHPuFCgtOTSvFAhh2SAh54CBsaS066JJIBBfGyIWXRkQmZ7LkVs8WxucCeHoRJ
         F9leRvrDbCBbqEjQrzpFXqXsqVRQRAHdIH5ueA/0tbGToAo5iLvKFX/csRHHlO+tYGQL
         AkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006795; x=1793611595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzEc9HqqeJ0Y72eXS6b2HTt5hh2dAgU7hXsaabSdUAc=;
        b=t0QFeKJNa1Ewno/YoodvwFW6BrjK5FAz0gTo6gApDPw4mbYvbPo7H/lJCiF4vURlxo
         uiaURpDy0WQgS1FsZJKW4szx9e+G5wKPxIVsL4ZEALkFqQU482jQ3RVKHJMpqbQWgQQ1
         1IHer28V9Kpb3VJBkL507aI0B3xte1x4ocJnaSD6VrzY/Pqa4gtmJXm0XU4pQgwyl7rl
         vM2EvP2iei/l1K6Ui2BfQGeeV9EygrJCYEuxFAHU9iokS3ouEVUaopAwzAsYX6KQLzGl
         3kZ+wblruzE1GQVIB8e+qbnQo7T+dajH4Y0gL0VJmzxznzvQwz/6muaUnzXz8yf/CTX2
         zTGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzw2P/Zue5+gO8ndkA+k0FTFXQERQvjPtk22X/g/Y/gUDWHTJTx05WDPIymJVSt+K/njAC7/rGBp2vMok=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV6moZNAzrmYxkCJb/5ojmpkyMwlvWkUREVg/iXfV91nqJpvoj
	EtyI7SdC/y/hSAPRREOsJewlWNXAFWT+KymTZMia7JIDH4w8/IFME+g+e4Td8tvRABPRzLDVw6F
	GIV7CUYKzB28XjEYpWidQP63AFT2JVoA8cpPFxC7kYdOtNJglgYhgH3U61MI1FEfrkfntB7+gRY
	Y=
X-Gm-Gg: AYBFou1bY6nUtr6P7qMg5BO8304aW7i7dwySE8znQBKov4egdBOE+jwvRZspmfp4WCk
	xnOxvZkthEFB1zhvQ0n5LNRhR8zmj7vJghzpFL5ic0R7gz2YotoWTBkXgqujAyAEh+Q2q0XEb8O
	afyZkyvRhL7zD79aNXZUCj05Cg5rHwVS3wHoyHXHA6EZB5ZqizHzZfRGEX+61kP/fkfTWvruT6X
	OQj3BQLVmoK7JXmMrNBMApy2SqhvfjKRiNwo5KsdgaGbLE6MQVlaROyYov1yeBphP7qlfn2b1fK
	Gp4kpvPJveph4fo6f0IzdXX6FiGI+qiM+gTkSvodHdX0hKfiLRNhcBEb7yx2O6JKqXo2XpdYxtD
	4EwVo6dE3phWBcgzDTyY2lg==
X-Received: by 2002:a05:622a:e088:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5383b3c5463mr93658901cf.1.1793006794797;
        Mon, 26 Oct 2026 02:26:34 -0700 (PDT)
X-Received: by 2002:a05:622a:e088:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5383b3c5463mr93658671cf.1.1793006794302;
        Mon, 26 Oct 2026 02:26:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd5206dasm299771366b.33.2026.10.26.02.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:26:33 -0700 (PDT)
Message-ID: <19d36d36-cb90-444b-b3ac-d3247db852b3@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:26:30 +0100
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
Subject: Re: [PATCH v3 03/14] drm/msm: unwind msm_drm_kms_init() on failure
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
 <20261024-msm-kms-destroy-fixes-v3-3-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-3-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7BhwhWc-3vSMoX7XvjvKvnbVVIQNrU9P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX+YJo6z8SKQKs
 tfLFTcRINexUM9eLVqOWEo9WTrxX30hiMxwPZOlLgBm/a2voNCFypJ3jc1BSZ8WINj/VmOsoM2t
 uCSs3yeLDqpc5vIie5NSk3ZbPp51W14L3fsX0+R8mrnL3+O88IqT1DnP/v4I0v+L5KCxOM5rcMb
 aohrR3IPMpY0j78sTo+BCp+icuV4Np4oIAxt9lRrrQY66XLfPNGYrV2CuK709aYu1Rh97RXtKFR
 iy3v0B7qS4mzPlL2G7eXGqlaYwQMQpeLBDhoEFcpXutolgt0c3H4nLbMrkIhajgnKc0nUChkvdi
 w05gAoDBm2fHruLwcD5PmLOpKhsE2cy9ZpClpT6rpqgG2hktcIxDWYPFc06JNmudl6/PKUISgyt
 IYYZKLpVw5TinW23itGxCwxA6IYgyJ8Dyu/V76+bvUp01xjYSop4vB6lFn09WRLLb+5lcb7OYYF
 bJu9MjnSZZomTqMOeYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX9cBEU7TswqiQ
 GON+RCiNxPCKr23tceoDQhNW89q6XPaK757an1Qb/ml7ifogXvVv/gWnGoq37Ixvj8/yGEuTpGh
 3lue9hy10KPjkQt5NjswdkNoJcUrsiw=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adf1ccb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=86llG-C12mwX39I2B_IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 7BhwhWc-3vSMoX7XvjvKvnbVVIQNrU9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260037

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> msm_drm_kms_init() leaves behind whatever it has already set up when it
> fails and lets the caller sort it out: msm_drm_init() jumps to
> msm_drm_uninit(), which runs msm_drm_kms_uninit() for every device which
> has a kms.  That is the teardown of a fully initialised KMS -- it flushes
> kms->wq, calls ->irq_uninstall() and frees the IRQ, none of which exist
> yet when the failure happened early.
> 
> The kms driver's own init is the first step which can fail, and since
> commit a409b78fcdf7 ("drm/msm: move wq handling to KMS code") the
> workqueue is created by msm_kms_init() rather than by msm_drm_init(), so a
> failure there leaves a NULL kms->wq for flush_workqueue().
> 
> Undo the steps which have completed instead, and let msm_drm_init() unwind
> its own error paths rather than calling the full teardown.

I *really* want us to get `impl Drop` soon...

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664041;
	b=C/WjmXVzJR9luBWny9BLcXVnWApO2RskBu/yagPpwyXXfqu45H1BXdI52phiDRHXYF6C
	 ruNWjzTtDRR7Alt/3wLwBXvUD4FR+LSGZgTV0gFbjjEt3r4jUv86uKRCqNUT1rozUNbUl
	 utR23xCoRIK9rLjWMc0bVyiRbOPSP8vxWmdai3f1jh36CRwYiVx1QuvxjSAkarmC4YvuX
	 z0qO5kvtgItbiozlu7GfCaKDGfbPhQpynZQ/3GAPlKrP12guoi3HR9jHpqRb6o2BerPCj
	 tIjyX7ucaMqTz9dkC8stGp0Nt7T/F3V4UeZgXGvifkMpHfudk5HUw5krhI/paTsXk1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7yWfrvru/Q1OyZVwkw14d4BtxF9a07L9+eZitoLa27c=;
	b=iw9oQSPIQGlXVUAwnz+7+n5fMYvCWCjhBq02MfM4h/CCZ2Z5GL8RT1fxMZb/9My99TSZ
	 qEO6fzFK4kUnW395jImfcDpongNHwhXfzfmvfYVRSbziQxzxQM2LQc2CAKeiUVDciCUdL
	 4DzIMyscIGu+Oov9iUhz06sh2+52lhrgsbwDGQNh10os5tMsExsHZTVEsYyRRdAu+mKZe
	 tmXZl1Ku2dBCMUvJ3ILxgaYGfSVazUS4B2E2YD5Wh+7PhXaHNZ/CQBzEEJvJOZc9MpBSf
	 B4dZZCIkxaycWYp9RqSah3ZQX8P1Vsxl4IHIBsJzeRys/xoBHCP08tqghA+S2Z2vSTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoOfQDU3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0q4KltL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE01606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEE01606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoOfQDU3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0q4KltL
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA09ZW2918641
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7yWfrvru/Q1OyZVwkw14d4Bt
	xF9a07L9+eZitoLa27c=; b=eoOfQDU3bRY7mAVH3hmtcXkjrdH6IACjn+phqOdC
	tA2VafhU5tiJl4E1ugTgm8zVX/Lb/EUdy3ReAizStqNLvcpQC/FFTbZv166DoaDF
	VhIzJv3gDis0/ejzom7d0KDBQIRlYdbiA/ybY/fuKsZGNdI6KCcZI28eNyK70TDh
	wRqAnTRARMOtffz53zEmZVtNjIwR1jvPwpdmfADsIf0MnqGO0ojnRbe47YtE0eow
	XS9tQ8dtDz1M1nRIPmzt3TkRaveAOEHZBu6ng9TijkLuOh5HIOvUlQySei/HRUiP
	lS8vRuZqdzQbHPhbLNCOAzhOyom5uSivP3+lNl73roGr9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9wuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:13:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caa0ce0cdso228557785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792664039; x=1793268839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yWfrvru/Q1OyZVwkw14d4BtxF9a07L9+eZitoLa27c=;
        b=a0q4KltLx965qeQ6BcssIoLXt46Ay6E77xNE3KJkvhtlyHucHWQhCypsWCJzZ2RnUx
         oHRWGhzno5isCgxesev1MONXGyJ1CRoKS/yj8f3Mvnbd+laC0NilrmZg3ocVFaV45V0g
         8vbgV19B1oYD0XgE3+lNKMcSWTWtiEccHY+U88ToRr250F5sUcoynqsIYda6+1d77Pvc
         4cp6tITcb/96J+iInij8vXSejN2SdSF4ELOT2NI6/zdRL+eWG2U4C2akpK84f8JyeZcJ
         YGOEmg15vGQCmD/yxoQsq4z9nvCjagjCNOAcZCMh6qNX09m1RzpzRu7LRwSxyOCRDypU
         BH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664039; x=1793268839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yWfrvru/Q1OyZVwkw14d4BtxF9a07L9+eZitoLa27c=;
        b=ROitpvJCL0YAAiyaGuOiG8/VLdV1jKYJ4fpP3UE7qYvKqXOxVK8gme7XcQat/rOTlX
         UYWylMd/afjbprBpRFOgM5b0nMa/5za3I8R8Ep5BXb6ryec1KDlNVRbKTShe59kdSR8f
         RRnlC9N5TZeQXJiNeQC+fJngy+Cre3HyCGFi+yFLFMk4FpRr/5wMq6/R5GaPzlEd/omm
         wIHkGHGU7WBWv3Z7dOYFk3blWLtHxF/Yez0N6n5JmnGL4Yte1KCZDgostps56RHiu/B2
         dHd6mHNyqQLWcMfJ5GHkv9/guFOmhf7ShFFhrdlvgK+DFmsV2BTaSXOzwJGO+t09FwHE
         sg4g==
X-Forwarded-Encrypted: i=1; AKwUvBxDYA6DOdvUoOxpFbJFeT6yNPVq2rAgFb3NufcURpL8dWV2xdeg3S1XzjYnh6mCaZM+R92x+bXKyRJhb0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR8OUXeNqVLNrGouVYDQlXCR5H1ZypbAueb+VJX+bZrxfN8cks
	70Vu2RBwd03kYYmUhXaFKd+DxqkoPnLHO7DBVbKicr+WYM06LwExRxXw3pNm4DaIaLNoE5T+ufk
	0mW4BqQRbST99udJQDVTZ/212hYBaAw5hsI3NYwI6SkuwBZ2chpd70EPfYu73Haz84+0=
X-Gm-Gg: AYBFou2L50Gl6Tu8pDg3Qf3ItBz+ETsc4UU5gQZXwfe6qetFn5DY0S/U46PCNCFb76l
	97KjB14ZPosA+HAveHQjRsIUAIfXoqI40nXvR/Qu8Tib2//5wMuVnKpFoo55+L5dGfy4WeqRz4n
	KcDHJXOxAlupzz6Jdz7w3nNdIBPk188Mzj0h7vYFNUOJJPAf0zR4E5PgnPsg+qm2FU4NoPuRRi9
	J8SGymenKGn+ZQwZ9DbSCF3dazMsgqdNDaQSR6SlWCNfF4SaFIqBzPMLTBCXDMtZcBkE9oyBTPA
	g286+q7a5d360j/PuO81b/xg5QYDs0D6ayXiw0QhIqTOp/NjqyEVLY/YQJrIvSiQDRFfK3ZIO23
	t25GR3Stxt3YJ6LijQqt95c+aKVIqB77kWnrAwkYfrN4GjCWUmlsM2T8GIiXMbBhaB96MVeAmEu
	uvMxUCAWI7e8TC
X-Received: by 2002:a05:620a:45a1:b0:93f:32c5:69b0 with SMTP id af79cd13be357-93f57fa3df6mr758338085a.60.1792664038760;
        Thu, 22 Oct 2026 03:13:58 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:93f:32c5:69b0 with SMTP id af79cd13be357-93f57fa3df6mr758333385a.60.1792664038225;
        Thu, 22 Oct 2026 03:13:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfae6337dcsm16234e87.72.2026.10.22.03.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:13:57 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:13:55 +0300
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
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: kaanapali-mtp: Enable
 DisplayPort over USB
Message-ID: <ygtcipnjt7dxtkohaolkshopuvxigfx5gxpedjqdudazuk6qhi@t363kbfe3c2j>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
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
In-Reply-To: <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9e1e8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=tbCzt_ceUV_s8fUbo54A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: XYEx4EyS5eOdAw-2Y9xv6gsQSQ31qAn5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX07draqwmkXFY
 7hexfcTGITt9/Fh76jpMJLrxI39LtD5iDkmZhZDf31QdOwFkwYv0b6NLfBz1pQA64VxOpwBlE5j
 t9zYr1hNeU1w81SpgofNO8NJTH6V8yA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX1AuyiD6/Obii
 HxIuCpe1wI7ObSKDc0dJyBZhwy6nINdn7XcV+be+qJoGl+Z35WXCb+wu+E3yHBWLica5xzBV7WP
 atejOpxvEG2j5oqkW13DjJOGLPE/JMXTcDsCBitS2cuQebhu77NL8FY1JS8DvyNs2SVc9M8G35X
 Ob1xVY4/wP9DVadNhcjutPGtxHvlb6rPm8jPC2zVuQK0FsadW1kor/DsBTw1gqwGYlB3tPPA+zZ
 J2B1TUBgqmiF2tWDwJOvjn0ZF0QqUXJKZ4c/lwh/UCfpmBIEsbw3AUgRYffp+yRdfRoO8axLviB
 qv71/qQ/tsXd4Q7uINT59GfOTpIxXUpY6VRHAsaOVDW93TJDOzA4RU6jn7oR+PA/y2B8p4dWTrn
 la9CF7vYP1qgVpSqudE4GjnhD1sLm8JWucU1xI1/bXdx9bxWWgNQDo7BmwCkBlf35FtbGcSNEjG
 6eXm4c8I0ASBHiir3/A==
X-Proofpoint-GUID: XYEx4EyS5eOdAw-2Y9xv6gsQSQ31qAn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220040

On Thu, Oct 22, 2026 at 03:19:46PM +0530, Balaji Kalkonda wrote:
> Hook up DisplayPort parts over Type-C USB on MTP.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

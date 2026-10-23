Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751121;
	b=expkGwgZTyAEnV4EcuOidymYHG+VlPulzGF8Q5TFuaAFBrdMq4xVdlS+wKOqF/r+P7Dp
	 xCLhWR7ZxnFuZP6tSe1N2nHwlKr5YHIvr/OUgTYku/zqYoJ2G/asVHEg0yxBR4wlfjKB3
	 OwqhqLJSbpqeLmQSEUbivH1ADokTxTXyTMT2iGZ3I2EJBPzh0IHhKp5Jjki1Rdlt0tu3y
	 H7VCU9Uo0e4utKtW6cUwspdFb4C1sElYN+9sxWd8knDzNx3m7VVyxpNUVS1OCx+oacp3I
	 iDudKyFbvjqKSIdy60babNJ/jWbi/EKmBn0No9CtH2wZpwGrbG5iZkNQokW7NEnqaEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nDLTzLm93OhSUueXu94d2WDd6pOzTzbQpnpa7vqPALw=;
	b=mALLdd34jx+wfvwN/E7OwdE/JJbaScybdj18fUe/r0+xIpv8coRlXN6hJbGJoaV/TDbc
	 MItEH0t8HPHpdj8VYlcG+HwcONiFAAFf1j3eP/x8WN0hNZ9FPRimB9znzsvgv55OiyVbz
	 KJPD3pBin7b6GBObKAfZw4negZC1PY/E63dw+DrnAm6BDwWNq+DKUQhjZyo6vD9b71prG
	 xHGrHEibp7v9igWQR9oKBJCBEuhihB8ylbUOngKyTtWTgfzEV/jWrfnbyhYWDN8ecjH4K
	 A6gdC8r3MCg2EZO8+sE94QIqWPFO/MjX1Ov/eQYodSVXZbOPLgQeROuMF9ZJmOn5JfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpYHy6MC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TcULbrz1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9415E606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9415E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpYHy6MC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TcULbrz1
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZCc2509102
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nDLTzLm93OhSUueXu94d2WDd6pOzTzbQpnpa7vqPALw=; b=TpYHy6MCctn9gNuY
	VAkWRlMdiqbyn97oXIGrk0laU1sQQ6PjxLhpsNojq3+HaqLZNal7MyUye8mWWDB4
	qtqxlLEz14HFLBTK+VHf+UlopRyB8qW97mQnEZCcWM0B8HNGNQFJiOKEC+76Jvp4
	zSHPQBJVoIU8y0B2ojIFzoo9Vyrd6fttN8ARGPEMpR2OdquTd+coUfzQ2CIalykD
	S1JQ+vShGttxC7p9eWi225C8d6S/2PG6a423RsPLFpHg/AkOy8qCtgCsqimgPl4l
	yCE2my6jf+jSOHZ8XBu0HPxpwYqlZqsV6fqMSPpuqFJfhqhIae31I9l1j8L5M6sY
	v+ooyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykancn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:25:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac5877bso24125985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751119; x=1793355919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDLTzLm93OhSUueXu94d2WDd6pOzTzbQpnpa7vqPALw=;
        b=TcULbrz1Fqpt9APF5L7O4jqeb9NP3npZXU0XHPizUC+nqfQf0S/F+ZbksbMLTDcedH
         8TNQQHOI8RDtZLPQOtFeb22KO9isIUCGQETtQnAlFA0eMr8NnpCydIDNNGqIyURFAl0J
         tBi5MuP2VBDY3jGVVGL2q9/esOBUxszispxVMXR128NEm6uPuHCqWpdpNPnBsrAF+L+G
         JARDaP011AOBgMzZ9Bp9Yef0C9PbogZRGdel+hYt5Pxy1bIn8AyLBV/AZMrFvUwwAGWs
         brusRhDpVEa/z+p70ozt0WvNgPWiOCob8PIxyN+mKOniN7/Kgdgmx27SHoh8U18D3+LC
         sruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751119; x=1793355919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDLTzLm93OhSUueXu94d2WDd6pOzTzbQpnpa7vqPALw=;
        b=u+ELjLIE5gjK00/dpLbYb9j8CcIcdxvKed7QgwtmhlF8+UR8l8y6SM+F4P8T8HmY9E
         ldSxN8G1s+xw4Fxo/86igj209gTYrVu9mBsiaexiPo2/byOKrw30UlFlEjPv4EppiIFm
         XEuK0l/yRjFM+ZWQ6C9KyfBYjHSCUnrXWPR0pG3dcoVLQF6igdH+ubIqHvqoIIR41Dbl
         pxVdY79bMI8HVaM2M37QbYP1B/Bp+NfoX3Q1FNdlQS8rBrvQNtDRVk0n++//xTmOV8WP
         DnwQh+GR0FivqxdXQudtk4FeB5l1wTcVbMBTW0Dd0Fgz8cSPKD8gOOdyARSuZpe7Bn5/
         wf2A==
X-Forwarded-Encrypted: i=1; AKwUvBxqBT7uanRL4XOMvIQinpY/VTje1SMVKLpJxsNYH/jeWuNCq+/lusZqxmUqIwn6q+/6Tm+k8xsmCGRWJqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5g+z4jeROlRRtOToZSdMB79IsAa5j/Afw+IX5HWL4XlUo+6xZ
	esnWWmqEQrfbxd2IN7uqZF69t1O2VTf6x28eAA+1jonymonzrIE3cJAMhU6oyHfHtwmHVpft58H
	SrN7r1GY4oj6T2AixE4XU8mDP7H9btTw/1+CVm3Q3He7BcKGAfZkMD+hCjcn9opVOsEc=
X-Gm-Gg: AYBFou22FvV3p3d1u1FnGziafNVuJVwnRa0p/TgiKi475mVfuBpI9HCVbR+We3+3F6D
	amWVKuPCgtYKvToB3dYuP6lnx4SC+M6GPyl5fF2/G33AzL/pBIgit/Yp0hT4HFbK6OHRVE4+EeW
	CfnxAiJqQCMpYN+KadmJPV2bc69Huh6cR62w2VH9Wh/uIAVChYRIlu4q8X4D2my3/04JXl6iRpI
	XvQUAUlxb7FIejidAgCe6MHJKn3h9Lq2wK7VhwwALhFNeswySw1DHNHXmCmVWOj14fiAGp7oAWS
	xbF0pMIEDUUm2ub0th2JBAXMxnwZIcFb5QiVYEEHgO0PHl6wi4l0H0kfTbGOmYaHga/drK06FCT
	/WrmqpLPv1DEN5UWGbC/T/w==
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr340746985a.0.1792751118812;
        Fri, 23 Oct 2026 03:25:18 -0700 (PDT)
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr340742385a.0.1792751118280;
        Fri, 23 Oct 2026 03:25:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5d181a2sm85208466b.87.2026.10.23.03.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:25:17 -0700 (PDT)
Message-ID: <735b7f7c-b8ab-42c4-ae84-9172804496d5@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:25:10 +0200
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
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
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
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX9ojMVxa/bs+F
 NTv/5NGRaz0me3FZzKfSdi0zY2lp4dR/a/FCZQPM3uMlaXv09Dvvvc2QwDJETFfXBD2U81d5sgR
 t3XJQdldcHVrkwIKe26mcQ82QrFxmmdhsRTsVLrn/5pZgqsAIhpYQlO187e4/ydd7es0sApDy5P
 WLg2BS6XPSWjAewF0W3OSKBuKWZvvrB7IcQJYwb93y3vwUqV1pKoK+2MYmm2vlZZy2gXN74PHyk
 +sFuMVUvTbphjGDUvskWZLNqvywo7kGx+wbKXG1KXDeNYlxNi6rV6jyVIeymv1g4M0h3M5hSi+u
 SoS6H+Mrkd7j3TwU+wxAT9TPJU73Fa4VLOKzd6ZtVWTOKazWHUBf2e6aX+aNRrA4B28bSWQjWZu
 F63vUKAHdu1UvfdwZ1a7MPwD8LVj17ZItQeOvdEi49bBbDdZVLwlHiJN1wyXV+/TYo3WcmrBuus
 +UdXAKIw1RO+jOrXBZw==
X-Proofpoint-ORIG-GUID: QuDEZ53kcJLh_lZhrvyeTi8HbB5AAEKg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX+CVv2Zphh9fT
 0Ta1sy1Gko+jD6jsroVQVT+WzIZvsdehS8EILdRpUXMmzzaBRnueSIfb1DaGvkAXxR222VEVzLv
 o5vKq6FXORkRh30aP6bGbRbpTl4VWL8=
X-Proofpoint-GUID: QuDEZ53kcJLh_lZhrvyeTi8HbB5AAEKg
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb360f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=S65zN7q3fX_PurGuIfIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230040

On 10/22/26 11:49 AM, Balaji Kalkonda wrote:
> Add the DisplayPort controller node, including its OPP table,
> controller clocks and power domain.
> 
> Connect the controller to the DPU and USB/DP QMP PHY, and enable
> mode switching on the PHY for DisplayPort altmode.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

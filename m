Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572231;
	b=bBLcSkgx2sgN1TnLlanT0HT4R9YedIS+aH6UBmWywRll0tzx3Mf9mkLVeXF7GjFcm7fR
	 Pp6zwjjWAYP1ws6lOOCPr9zuEIYkhSyENMeWNQq2SJ9mWbRIcfP5iQ2MZXqXvVL3bm72H
	 N0p9COAoE92tBxanH0/l5h6X88oDvH6jy1G3fCAK/gqua+88/Xjwg7/UbtTQd3uw26t1P
	 J6PaoG21Hs8rVMypa3LEBlgi47xkwWoDRFcTglnuNIEK+iuQXNuxD6eU5Ym8iZ9C1abRa
	 2Ytg/WKlHHzIHBWJl0Ofgktc+0FtOpneFItgg7DuzCDeNiXSjWCfb00yZcKwH6XBQ6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sIzv+OVRF10962nsg6GhGljzRZ3rl013V2T6GKgjf4Y=;
	b=04QFhX9Gpqgp4Mbif/Q6cKJJkxQZ5CMf/d1tp1LVgXgin8KYePbnI3Jq9wM8r6XndlxU
	 h4NGXqK2bvJPmQdbtmL6t91IlIvzjgUSKJIZjSjAZ+Q2jQ1Bygq4qpsvLthKMizstfjXZ
	 fx/jMIqhPJIKLZquwZEPYxWVevnKWF5rpj97UFyak6fV4GDi/iIrKneWTLWXz3gVg/mPU
	 VWB0UkIkc390tNKf3G1/I6FpbMDcant5wkHui3GNvkvtPcc5GmYYS14+8bA7kdSdtvF3E
	 ULN2xQqyutGcd54QcWjZukw40uFF3pUoQM+YeNSrsUbJTEDN3czmm707+2zJBFvE8sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFeyapOX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JWryMSqz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ADC606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19ADC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFeyapOX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JWryMSqz
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j06v3355556
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIzv+OVRF10962nsg6GhGljzRZ3rl013V2T6GKgjf4Y=; b=YFeyapOXeANzacnB
	szxZleI6tSL08EA4Qqe6SA4H9Qdi9M3gPWiGhCerNVfs8RWmEBq6lbjmPxXbdgpG
	YSAHIYgWfJHpP36f6PsJ1rbbx6/5Ssjz0ms8xIoZXbau1+/wo42WyuoT3OjrjWP9
	9VpHnKbciMtFeGqM+2RACKtv4BO9jmVnVSdjhkFxcuaRf1QS0ZfTM2gjg+TNYI+Q
	SYFzOqqjZiLgMNMrTVj4GNLEDcnw+zD3fkJDnHTRuV4aAliTWXP8lcJEcZhTq7xJ
	yoBxyidb8SyRylC6Rv36g9SyrJyv6u+ja6894uQFNCT0djALRqrDzv9uzRq62aNx
	zjUxUA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0jys7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:43:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179ef12a03so2794046d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572228; x=1793177028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIzv+OVRF10962nsg6GhGljzRZ3rl013V2T6GKgjf4Y=;
        b=JWryMSqzkgixv0Ipbd3JjPKPiMv8sWC3/09FnP8yIj5KDxoUlfKSkzEEA4iiH3JJih
         nhgalPUa2g4Ixmq0RPSbBd7jd6r3afc4lcsMCjrATxMwnCUN4wKogVZJDwxbTElVkejQ
         e/ABBCuUZ+lB6H/ltIoj+K5xWeZ7tj6vuURthMCx5NCL58uR5n2yBDYNBnVbVXVqgcpW
         G5imxGMapYNbi7LZakAzc9y3zgijb6BcQmGLVK9JPv1mOlNxpgE8kT6Pe92FviJKl/lP
         s87PwNB5TxUMrSluhZ0kuVF0EDl7E/Ny5U4fvA4RHFBNoMAXJXU0PgV/lsoTNAjwccWb
         1MIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572228; x=1793177028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIzv+OVRF10962nsg6GhGljzRZ3rl013V2T6GKgjf4Y=;
        b=SGGcgkavGcC8b4OITHYqn4ofWslJ6a7OhAUabg8Q2j3uosW2PwOBsRETvLoxfdDtTP
         WE0maDURoztu6waHkH2lW5RVKaKPiAYxh3oEgUWhhUgZLeyJbce5l5RN9RXwY9LkqyDx
         upt3s2YmRYZMAcshSF/E+Holhy1Whsg4LVumP5GROhkCLLN0LC9LKQd5dBGKnD7yh/DL
         N0q/MVEDdhAgSaCa7ZGJxIR5IWty5TC1/E2fif9JMMXahQ4LUJe+yZzvpC+5elaSloIk
         HrZSLN0AOOTJL0eO3+KyleJxNwVehq9H2HORldUlVttCDi9V3SmWke+AVYeDrtpGEBQn
         bDBw==
X-Forwarded-Encrypted: i=1; AKwUvBwDFRsyRzj1rpBq/q5wenv3ozHawluiE0Uvm3al9TEEnD38Y4XvplyenifDfgUF08AV6Nq/Do10vFTj1WI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjweJYG7vxGAddMQmhYSnHuMHdgxg4vevwaFQTtEMrEO9YAPVE
	n945l4jksEMWr8SnqP1LCVfx1sQJrHQMawFPSEOZUDE2Yk9bSz/3Yuzu5f0SUACoXLUCSApHBfv
	8vxzaxipQnX4fQxj6KaqE2V/RvtHH1nCTfGWCckPTlJ1ULVmFHDwoAkMRIkwxpYK3b4s=
X-Gm-Gg: AYBFou0uEY3eahHZJU/M9adfYq6Zo33VBtDIo9wnDno2AIMGRv6WfE7jI67+GJDtfHE
	mhY+su0uhAgdCyQrrSYVPT0ntOfP1Wvl2zoFpTPOJSR0o0Ml7QOH+9r+b0QtAewqC2ayW5Lu2uH
	TKf5YT5i2CNNY4hUXIJXqP4KBaoqqvinw8YauKYGtvLH3Ia0mOFlaUKG/nyYfiTw/eDrb7c349F
	gqNKjLMW+S6LixtQddaq3JKwicVyUnKOUFa0eRqZ6CjibHxcMGNle0ugrtlCRCjY3LhYTwxMOFY
	ntOjx53YC6CyZT8oO128m67ofxnR/WXGUZeVKvVedC3LGM/xIAtei+iA6hwTcxC679JSuxvDmRV
	ygLFm0Rjl163ATi9+hxNNIg==
X-Received: by 2002:a05:622a:a884:b0:531:2663:2cd with SMTP id d75a77b69052e-536a75ce176mr415951cf.1.1792572228222;
        Wed, 21 Oct 2026 01:43:48 -0700 (PDT)
X-Received: by 2002:a05:622a:a884:b0:531:2663:2cd with SMTP id d75a77b69052e-536a75ce176mr415691cf.1.1792572227794;
        Wed, 21 Oct 2026 01:43:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c467900686dsm52393866b.74.2026.10.21.01.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:43:46 -0700 (PDT)
Message-ID: <72009e19-fe51-4340-9378-46eedd71f151@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:43:44 +0200
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
Subject: Re: [PATCH 10/12] drm/msm/a8xx: Switch to generated nonctx regs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
 <20261020204728.28844-11-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020204728.28844-11-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX1qC6iYse0cYQ
 fCJaDohwE1Mjw9fUr2bh7NAOr2sDAYvILqE90HHdE4QOVeeksMoARRmULz0t2JXVZoJgXiIDhqd
 GQYHtvsRF30IFtk9sPo9XPlgm/OJaIv2Zx4QJATKHn6yubVZeoTslUBjLp/c/HCqsVfQr4qzJKF
 EQvjsLlfpQ/ywecDohBLy0iDrRR8J0xlnX71NukIgGOjHtJgxeZNxQuZlrDo/I6PPwxhegnxC7G
 6dMKS5kP4MltDaorRAehvuyfd9aBZPEElPMxUlN+3DQdj3uSZtHlpjrbPZ2KS4LwD0qxpcZOHoE
 RuGNV71mz2aycanpLORs66009G8x6I2ZOYFbHZaNS6Dze0Y1vm0iGdgX5R1sxOI03CboTkdzx5V
 m2C1MohAS2IBit5g1eu3Y6agZxUFsTrtpiO72/SQGKW1yn7s8mbV4CvYy5D4TWWZhw4yjYpXAvo
 OVyuncORShH+dplDn2Q==
X-Proofpoint-ORIG-GUID: LDEd8bP2sb0edP7GrJq71FCo3Er7fprp
X-Proofpoint-GUID: LDEd8bP2sb0edP7GrJq71FCo3Er7fprp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX4068irNh17Y2
 HcSy1nGnaR+S2DRCh7EKNbPLOaM84jBNpTwTRfk8htepHJSWbyJ4mLQwpRIZ6TGyYjPaP4nozLG
 +5POOJXyzTTCMahtmfBca2t7DsW0fgw=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad87b45 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Uo0wf__DB8OGiezfqlwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210034

On 10/20/26 10:46 PM, Rob Clark wrote:
> The generated headers contain the current (at time of generation) hw
> recommended values.  Using these directly makes it easier to stay up
> to date.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

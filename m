Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269405;
	b=hoElfnFnfFUqvg2dbek7x4k6jq42e6pA1QkyI6LnygsjN35/JngK6moUv+1CLcnKOhDy
	 ZraSRSG7Z9CBYMMFdma+dWxlKpvjOE2T3kmC3KgTj10pisGOcRgH4Uo6S+TjcG2cgRcUA
	 /56MBiWVyKfAP5844A4ZHnnN8LfDmM+0AIHXvcvzeM1Eo36zNfjRweUYHmt+XaTdX1E3u
	 32WAOgNlwBIsMbbWGJpQLnMDhMAm2hDq02hcWwLXEZMHzK8EmQ60U7HuJTUCsI8oE83lk
	 a1XbuL44YG1cvM1nOKOe1icsC0n7tolafUNHf+FJ4j7SgE+ZPeTcb6sm6rkbDSvVUKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ha3fj/COMHQz5CNWaubKxJEoCG8ElfvHahMKU0w0GYA=;
	b=3V4WKJ71QB5gpeOCU25xaiomF9enT1VdkeQIAdvNhlUvR4dQK2rksJ9SRGhPzQGv9j2x
	 6u9k4ENMquk5mfbErB0HLSTs3qTJAaEKKyS/OdknVsP5Pumy6HQPYKy7Q8/UihN4eNej6
	 NkO1orqKLa2oyfOwt0PRNi7KOxB23MRQuuwb5RP4kthJgEJQj1JZ9Eid/XHYN/rReGHmc
	 H3iTe8yWF8UxK04bEkMEhkbmo+tpaAlAlmRDOdMxvzhYE6iZ0fkHe0b3ikT+hRZez8z/Z
	 1RzFrGZ1O4d22dnYjwfFgYSfXksyvJv3CBmWsCYyWNEfDwai2Ld2u9/EqSPR49bpk6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zm32Ublw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGMZJ8OU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9868606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9868606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zm32Ublw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGMZJ8OU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vsit3279688
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ha3fj/COMHQz5CNWaubKxJEo
	CG8ElfvHahMKU0w0GYA=; b=Zm32UblwrpFNdJzdB69DOZIKQdTau7hMM+lmAp8N
	cJqczZeK3MXWDjsMs/sjcArdqDErxtMVpFRxP+RvIb8k/EwuKejzg1JVOM66N0nj
	cbnGQqPEh6cTy3RutZq3HJdxyd+Z6MyB0+C5FirG89nUuSym1y8msLtvUFlKnr27
	kaVSncyxq4GMcY6K+Qyw4PXer81E7AMnLo5sMM2e4XYzGAbKm1TlYqCJbUr0v6MJ
	pIK48p5sEVR+Q67V2+qmy2uEC0m+JQwe9lHbm7E5AnReEJugdazjtXaUgkLyYtpE
	9E1oZWtf/KqWF6O30IIaDZyh4q0snx72PcIhxhE4IUbvzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3nahb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:23:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5383c05fb2fso23025391cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269403; x=1793874203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ha3fj/COMHQz5CNWaubKxJEoCG8ElfvHahMKU0w0GYA=;
        b=YGMZJ8OUFPxKCWqSPM0Oyxm9UjjArWy63XAPVkrOzX4bSG8GiVGSbw7ebueswqP0xG
         yHVUv4zlCrVaPZ7ke/uTcBzS6/5g3ww3Z4vbx4u4cdrV7dE2/fdDd3l6ZlT3l14gkfZi
         IZqAuo9Vmao1eN2zdiFJlO49qjV3G8szocpTzRqrmlhgZGvGhmpJ6yrABHLQbYWQpFPw
         BtHUV5GvWXhYe1JEvzH+obREWd9X9UD8b+D2VLK9PF3pIzieVDipY8DeCglLRWGVKOig
         tlBS851tPk4E76f9TyXbYNkOqtxGePGqmVqpPPq2uisBUM62F37ePQKQ9ueA8AA/IxRi
         lQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269403; x=1793874203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ha3fj/COMHQz5CNWaubKxJEoCG8ElfvHahMKU0w0GYA=;
        b=GTCECdIxgrNNUG6N3doIxdkluHIcbDRhJhxhOxldszNucqp3eQJhbi8LWYAymBRCgN
         1eX5H5xsNXKInrgPnt/3daPIROMGEz5qpzfb2j/swI3ugHuMDLgHgIZPWpT5fNT9O7/5
         tOhPc0uGxkUHvJpHVhyzek47ey8ICuvqEzsAkzbLpXuszuoM9Kz1AD4NHnaD8a/sX9Wv
         l4GouTBayRyvkvwuwMF2RJR0fY1G6EVeSJdwgR6jlKRdXQPQYOKpoY22GICnGWbXoAvu
         tgleANcsYob3VVlibGlfW9nXNMA7JFg2rPPQKuFhEdBmNiqYpSd+/n0tZEVJ/bZM8PnI
         RKzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAXlGwouO58sPwHIHU8lNX/v/vOoVN1T3RLBnyH69iImssaztk9SCXm/1nECfee00aGhh4PWEhQ9Z2SSY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWbSTR7mnV0K37kgNDwAuGqkugUg+dPOJZcyJaIXWs0z2S4OQT
	jlg0KPgbeqR+yE7p4+oGWRdufUX/y4b3C5pPAmBQbYyHOHiYie0iBQ52yGWS3Jdj6gI0stBIUhG
	HV0+0h6RceaEpw/yICfPDpbY/Od3/4VP42UG/SVrD/F6KHmo0CI8jw7238NSCwBF+rec=
X-Gm-Gg: AYBFou0MTWRSbGnuCpflIjfYKA205QM6MKk4Oo7Sk1YZxk7gRCu95Xr4yqQIHPSuvCI
	OXNeUPzaJUt0PK+jMW3go53MWNESGMAdSseaLeQdH9fWKJlBc1Bnk1bZji2gV3T/oyjZk1Jwq0F
	gVz9jPULSGfXefvc4SoDwOvdRUTlTg+TTVW1blIw1HkgE5JqCj7bvimPv6aNHH/PXli07Tecgtg
	QbGcNw0L0j+rKb74Iyb+pBJMl6wwc2z3ELLfPCCUKFcmfe12B/eoRDriNdWCQagl18A0yFLHXfx
	D0vW72FMOCpHW5SJF+xmimuu1MW0ol5b1KNyqq/BkYKZWqOXjJw23FVsa4K9ClBH2AcJ1N8zY7S
	4Mwdk1etjiGljcmZHGp2wfJZ/3GEgmysaNqiVpGvxTZPfQ0RPXeJ98drIty5Ht1O3
X-Received: by 2002:a05:620a:2616:b0:93f:23ef:d6ad with SMTP id af79cd13be357-94408899f84mr736629185a.0.1793269402877;
        Thu, 29 Oct 2026 03:23:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2616:b0:93f:23ef:d6ad with SMTP id af79cd13be357-94408899f84mr736624485a.0.1793269402246;
        Thu, 29 Oct 2026 03:23:22 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm33494130f8f.54.2026.10.29.03.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:23:21 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:23:18 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v27 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Message-ID: <sh3b7m43aw5wtrolooxsib3rus6br4rao6wtnc267rczqysyis@75voym3v7emf>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-7-fa4b3ff1359b@oss.qualcomm.com>
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
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-7-fa4b3ff1359b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: V10G1emlwkkHgyoDiaMpLGN20cMuY1tM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfXxKrPSDdahw/f
 w5tl37CZ9h5XzsT9xIZf2tmsjcxxbZadRIjvIivYntq9QGKiIIOWtOA3N+39MKhgsFiNPuMgW4Y
 kpJ5JYU//NZDPjjo6BCaPYV5hio1H1SQnOCQz1XEivok9mcjTiDNaKvYLKWMtFJFCN78gaZpFVK
 i6yCKrz4SvgJSlNhnwuYbzljFFvtPKuAfrV89hUhjVUV9QHas/tlmAwUD1bW5E+9xDkgMlY8vK0
 aj8/SuwZngAqAiAN+r7FJWwZJ2o7LXy7Hr3iwpfXUTmDtWMl9SGP5NPc4VO7yTswYK8fhiR2vR1
 GJ6DD8ShHXkf70ak/UvDOHAQNutLSAt7Y2DMwJMhMkNC2xA3MhdzYp+I7BSO19f/+dMvTomWhzC
 EJkBRXb2FSKh+Arg5gfGEU1+UQlUvbBUi2MM0KcZoOYx2Ggr6hX1HqgikNfp06Qi2jjeHTwfYnX
 VxK1A5R39xW64iXmqvw==
X-Proofpoint-GUID: V10G1emlwkkHgyoDiaMpLGN20cMuY1tM
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae31e9c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XpayGGiaTZdiRO3YngYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX5Ppq39yzByDu
 /rMyEp4I1ni++C+idKQfF4dV+AUjMNDQMqC1cBNVm6ciKf9ytfbArncoxpHvYgzZlGXlr2DuwUj
 RjrsH12OAltcSPoHuaEjfHz555m5gss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290040

On 26-10-29 14:31:01, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
> for use by the psci-reboot-mode driver.
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
> 
> Support for these modes is firmware dependent and not available across
> all kodiak based boards.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

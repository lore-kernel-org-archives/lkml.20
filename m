Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793911991;
	b=VDPFGKgk8u8qx2SDQ53WRJoO9fKMuWMi05HRTvpk9c3FmghtmvHcnaZgqPGf+r4K7Jvs
	 ANNLKLy1ZIsdW4EZWPyIr/N/Tb4nFChW3UiDwLX86UQ/YhtEzN4GIC0o8X76sBcsK6vf1
	 RVIpfGBaYt5KbQvZpSXHe49gjYnARBV4/FH6vQv3e+KQ6oYZ3pw5wsMiCihDGAON6crtD
	 3VK8BopzeMWF1PucA2HDqCxcS02pWhTPTkgqMt5bpKy796x0NTiRwk6xMLcL5by3gzKN+
	 A1XZGIrIsXCkZG+a2VjAs+/l7i68/JBEKOuXvEeriZXuvnrbQ2a+nhOyDBSwhVRLR4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=;
	b=mAVNUrQB58xE1GLt1Lu75LrEEK+e2XlPAYbsDvtavuhs9fda4n1Zbr5d4b9mCfIUlU4j
	 jxBqaOE6r08MVHZwJZ/Yo24JilZeCcbEkceVY6qZKWHtihLY9WJL5SM5YAemSIPPIwAo5
	 mSKRvdBiqt8wBXsH07ZaDgCfTMqWbTJSOvMcO/QEbirnU2fnCSvCdN3FHcPqHhkghUI4v
	 k9iRtr9xZO/nk/meFAZzjJao+/XQSBdJjgkoEinUShqKUWqr++MbtvOHvmuZqiG5graHe
	 tScqfzBfeCJ7lqeCJLRoj43jxLUHtgGADX4BMXJBh0bKIJ/PvhIarGSC7YX0500tOLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqO43WIr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AKK5KAJl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07B9606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B07B9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqO43WIr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AKK5KAJl
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeKTS1485072
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=; b=Oq
	O43WIr6igflvAIkd9ASejt2pm7/Vf9caX5Pk315Bc5ggbNfK9F2LpMRsevBqIwb4
	hPhmzZAYplsNr3OTmx0bYsmVnISLeK+458SAt6/W1bu4Jz3ROc2RmVBt8UUjiXCQ
	nZZBOgkiByaNQmV690shz+jF+TDJzxDb27WHOrSkeVYU20FfOPbqFYGYbera5F/5
	NHF/t/LinRDZ/dBI1uXdtTJ8n0TqT9UcD4ZQLFKVqPGiJ7wC6qhcV8yyDPgKpGqK
	i1l8ujZZSz8UlmrG/yE3H4ZQwpendLKunNHPd3xPOjL0W9EbmYiIoRz/+OJD0mNt
	BqMwb9IrwRKk8bdcmrHw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaak9fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:53:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f26e6abe9so723178eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793911989; cv=none;
        d=google.com; s=arc-20260327;
        b=IPM7jjHBAIqUfqIqsNUj4m7VTRsQ+0R4/Kd4NeFyTOqFLUuhlIN+0D/U+3fvK0diV+
         qN7JS1Eu7NpjLV1skSIHFm8LSRKga2aSLJSI1RGjeEp1Bg9ZmIfGnq4OVfj3dk/kx7LH
         +dqxeEViB/D6Rlvvnq1gfTeTWp5FfI5IQwqpk+HnAGtCZJHAQSuvMfTf5P1M0XVztZE8
         +8Dz9slkO+UkA78r9e+twVajSRLwzBcmw/9GTWkWqT56M1bZhChNBIRpSsMSL5MQcnPW
         swJxOjC3eFkhL4eKT0a9+26b93KAG+Gla/QeVetso6OxiQvZT4A3enstU+pND7vIneF0
         6OQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=;
        fh=YyYkxRvR91ZIUWTSQUtV3xXtQQtFOpXCGkxcEnvgMQg=;
        b=ZC/ceoUGdQcp8ir5hosFMOo5P2vYay9+O7GXckQnyqheQU1O6bkytTm2HhK2EbivK1
         H8VRRQZEFQmtiRiStT+ZA+vCn3Bo/XhB28VVg3w6xvEMBmUmnVneHPYlCNuStyAjOC2u
         u8Ys4nQQh+w7zP8mHykICj3G1L3nLPSLn6e0b5qJidTMMIyfeU6MWGWyOXVGfu2b7qUr
         kGLx14PJtMOuKIIF2mdR2bBtuJREDme9kIXTSfQoqnCn59J2TMp1c5FpzksMIR1vMLsW
         lUqumXXdCLawQGYgwJiYVNgMZu7VMKscEnsdsnAEyxUxB0/K6kYYumZwKyRGzM7VEboI
         e6Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911989; x=1794516789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=;
        b=AKK5KAJlJujwOl2CjfkzpGamexhN3ntnr04RPT4v65U28B+H6oM1GP2FSlSw2w6fNV
         oovQCDAQ5xS7dMq4YW/HsmtGm2FC3pmTK3wmxUA2AuaZ28XozIo3MGTn321kKA8yMSMO
         18nrxkoS3MPIxcHs4IVqMzme31u5IKIDZ8/j7Smb1Ax4nxIO2+xFif1XUxT7SmmAdOAY
         jezGv5STfk22Yb/Rg7LY/0V2VreG//WHWOzvbe5Vo3GOTFWJRW52T+6DJJzVB0z9cBvy
         4Cig+/IEI1nWN5LfrDBJTCr0KMrKpNSN8JG98smNTDJk653icMIwPzhLISg3D6saM3UL
         1e9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911989; x=1794516789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=;
        b=BOpDYhue0ru5RIMCe9x84H6ERxg3IN4PRi+HmJbzM0vvcsiyroTTrUf5KmKzI1US0Z
         8sCePouP1Aa6V+64ya/w77TaUxy7QZ8uxu2ZZnHKQ1eBK1LcH7dbuCzUCxZLvJBJWn97
         KJI8d2oAZGAyJuUfk7gurPu9llEFZtl6E6cxqHn61nBdKmEVbsG3vaRH4cqGlC4EGnJp
         mCifT4+BXEC7dVNaZA7KLQg2K+ufq3eqKOdbnuCipEc6BtfQddJcrQ9MtJYpjesjAs3X
         ct9AtBN2rjOpdK0VR3cfEV8JoTHQxGGOELKt6acEut4VftLLmsxYxYUd96byoEX0F0cX
         eXtw==
X-Forwarded-Encrypted: i=1; AKwUvByq1wx+VBk+gIACuHp+lMmp069MFkofwClhr+k/PKdY7zNs28IYigXxtX1AoM41WHFaqO9ZGShPFiaVVHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jnU/Gjy9vPelda+MxI/PBW0nLfHdmBFR2J9Ci/tWWptjncVIh
	PTpANk2L7D9BOP7L36x1snQ3SjccG95QlxGmNYzjoL/hkM0sOl4EJHPG5c51bar3CtCcXJEpP4H
	xrO66yv2P9fvm8y8dDyEzvrkT7IUx0v6Eevmifs+JiTQ5NA1j0NxRKY56X/aRZAzSKJ0oa7jGZe
	My6gfD6dXFMGC+BougfVO31HdjOfTcgiQD33OUwy7u6Q==
X-Gm-Gg: AYBFou05EjHt/MqD7Yi0PVCz5dNevukrPQzflfJ9jzThFy+nGudcmm3Q4pm05RVAROB
	2nikQzZS7odWyDz3uht1yDghWQhePqi5p3NEvrTQzpd+fEdyYBQJTw5IuI96aWrvRVeN0g/dtpt
	8fmBToP9WXOAsh2Y5+mi0zT0GN2j36PleT3fpIhzRbkynsHrAQZTyvQIiZ9N4BKKzn7PMkM1xar
	s2XdlNWdEPmz2+wd4G/qw==
X-Received: by 2002:a05:7023:a86:b0:156:6676:d0e2 with SMTP id a92af1059eb24-1b25d2fe849mr303336c88.10.1793911988336;
        Thu, 05 Nov 2026 12:53:08 -0800 (PST)
X-Received: by 2002:a05:7023:a86:b0:156:6676:d0e2 with SMTP id
 a92af1059eb24-1b25d2fe849mr303269c88.10.1793911987586; Thu, 05 Nov 2026
 12:53:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
 <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com>
 <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com> <CACSVV02t9=tm2qyG531f8Ne90ADAb1_ZDDGEg7PwDmoEvGxPrQ@mail.gmail.com>
 <7b4d3a85-6aea-4b96-a4d0-c2f16e488ad9@collabora.com> <7e8a6645f181c9e8d663eb97bb1f32e3e4fd8c67.camel@collabora.com>
In-Reply-To: <7e8a6645f181c9e8d663eb97bb1f32e3e4fd8c67.camel@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 12:52:56 -0800
X-Gm-Features: AclHuK_2VHyuNEs4DZc22sx9QJcK0ltaGhWBXQlToG9hpn9RflPMYR8eoL4qhGs
Message-ID: <CACSVV03Nz=das+fneMqx9UE1Vzps55=_An-DtmufRTxdhv2idw@mail.gmail.com>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Robert Mader <robert.mader@collabora.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfXzD6W5NyKICNI
 p9vtKa/M00f80JqdOwvt5EyKmCfg7v0Z/MdKbI/AIkRnx6pAAQFWYeQEmlGI3SNZF7gjlFYAhjs
 zEy5I5MT8oeyoDAcuf+ljcuOTYtuny780NRpO2sVEl1N44ymZQnm4zRGFu5PiiL4WePFenq1tYZ
 5Odepz88ZaPDRIHcFNnBZivH/QuS1jBA+x42CaHxiDczcLDzJakeb+3CmVIJKiORJPcXMrsx5U3
 lkCJ7zuh3SYkCpN3n3/7Ht9WCrJbsf9Rk9QfkE12eCnV83Rwr2X2Vy1yozWcgvXyvYSCKeWSdRC
 ROAPd49EDEXC1Ew6ffpF+QifD5UGJEA/igayEM/ZzB0IgH3KChIWp2oNbkr5OKxreMyE4Rcye0a
 SyWBwD8OP27pK0x/5tgzI4wUlB/IWYr0iUPQPxLuerB7BZ7fVrKkm0MlgFAmPuYHGlcEC/L3Fs+
 Dsx5iDI4dgKC/6I3ekA==
X-Proofpoint-GUID: 08rSgwH_ACms45OwA6Jwvq7I6pUKqcg6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX3i2KFCk0iKwO
 e4wwfo0ojz/I43hlI9xYV28RjmcQMe+Tqv0JDeCtg8xcIgjoOY+wg8RqwKTI2RNLKKzGbpJc2gp
 YBb7S83ZqiVLgCzOMW+U6ZArzPI8kRI=
X-Proofpoint-ORIG-GUID: 08rSgwH_ACms45OwA6Jwvq7I6pUKqcg6
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aececb5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=vmm0ZkxeQxYXhTVWvzMA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050083

On Thu, Nov 5, 2026 at 12:35=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le jeudi 05 novembre 2026 =C3=A0 13:35 +0100, Robert Mader a =C3=A9crit :
> > On 04.11.26 23:11, Rob Clark wrote:
> > > On Wed, Nov 4, 2026 at 11:00=E2=80=AFAM Robert Mader <robert.mader@co=
llabora.com> wrote:
> > > > Nice, very happy to see the series!
> > > >
> > > > On 04.11.26 17:36, Dmitry Baryshkov wrote:
> > > > > The comment describing the QC10C buffer layout calls it a compres=
sed
> > > > > P010. It is not:
> > > > If I'm not mistaken the display engine / the DRM side (including Me=
sa)
> > > > describes it as P010+QCOM_COMPRESSED as well, and so does my pendin=
g
> > > > Gstreamer MR [1] . So if we can't pretend that QC10C =3D=3D
> > > > P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, wire=
 that
> > > > up everywhere etc. OTOH if we want to keep the DRM side as is, then=
 the
> > > > comment should reflect that, IMO.
> > > IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and P010
> > > as distinct formats, both with and without UBWC.  I'm not sure if the
> > > same is true on video side but P010+UBWC was never exposed, or if it
> > > truely only supports linear P010 and UBWC TP10.
> >
> > Oh, do I understand you correctly that the P010+UBWC implementation is
> > not compatible with QC10C, meaning on the GPU side (Mesa and display) w=
e
> > don't yet have any support for QC10C exposed to userspace? If that's so
> > then we don't have a choice but to introduce DRM_FORMAT_TP10 I guess?
> >
> > On the plus side - this would allow us to make the format single plane,
> > matching what we get on the V4L2 side.
>
> Since its single plane, we should aim for a variation of
> DRM_FORMAT_YUV420_10BIT. Similar to YUV420_10BIT, there is no obvious lin=
ear
> single plane packing for that, it would only be there to support the
> compression. Or maybe this one is abstract enough to be used anyway?

Oh, sorry, maybe I was a bit misleading/unclear.   TP10 is still a
semi-planar format with a Y and UV plane.  But each of those planes
combines UBWC metadata and pixel data.

Within each plane, the pixel part of the data combines 3 samples in
32b (compared to P010 which is a single sample per 16b.  So not quite
the same thing as DRM_FORMAT_YUV420_10BIT.

BR,
-R

> Nicolas
>
> >
> > >
> > > BR,
> > > -R
> > >
> > > > Best regards,
> > > >
> > > > Robert
> > > >
> > > > 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_reque=
sts/8195
> > > >
> > > > > P010 stores each sample in 16 bits, QC10C packs three
> > > > > 10-bit samples in each 32-bit word, which is what the stride comp=
uted
> > > > > below (width * 4 / 3) assumes. Name the format correctly.
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.co=
m>
> > > > > ---
> > > > >    drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/dri=
vers/media/platform/qcom/iris/iris_buffer.c
> > > > > index eb8de60c1177..ec2bf2a2d953 100644
> > > > > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct =
iris_inst *inst)
> > > > >
> > > > >    /*
> > > > >     * QC10C:
> > > > > - * UBWC-compressed format for P010.
> > > > > + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples pac=
ked in 32 bits.
> > > > >     * Contains 4 planes in the following order -
> > > > >     * (A) Y_Meta_Plane
> > > > >     * (B) Y_UBWC_Plane
> > > > >

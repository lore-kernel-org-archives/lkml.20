Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C5B4D489E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603873; cv=pass; b=RM9acG+C/Uau5OyjJuVPe1dG6QvTdmM0wsUSHDI3yCul0Tvpalqfsk3TMWKEUEPZmMwaWKbjxDE0Ua4qTipl+wdu4iNwHtt8EdJrLwhjDIqdvAu6sp68cJyscMXlZpvbP1wM8GhlV1o5OnQbSZkUiLQVdKPuZKaEnQC4uQTWFds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603873; c=relaxed/simple;
	bh=N0apPBi5a5rdeR6XkE9u3uUSLlm4uI9nB9Kynheh+l0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G9dEDmZ2ijC8Zu5WfaKo2v0EUhIQh3TEnSS9H4WgXMFWWrn05lsIH7845QgYMaub9AAu5j2kqw503xVkoGrzt6Dq8QJYGANztDeKpvgdO2dvAqhIwVy/LkgYHMebjNave1DCdBnoLDkS4EcnEAXaFCrhjtySMSmUm/kUMblj5bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4tRZgHZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZm+5Tke; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4tRZgHZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZm+5Tke"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBA9tE1189333
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=; b=Z4tRZgHZskb8ptT5
	TWLgXlXd5ZEfOMXoSIMOXv3xiSCfmZPrN/BXEN2Jx/EI7xgxsl/mhtg23qiOqhBr
	lotZeIr931hrlSEd5cQ/+wfndIUB7MMIEPhy0N4qQaoL3vx0QDP3gKzGCBMkjA4K
	qZEViEARpzKBw/bZJdJ6k6fM60UXmpX36/eFY3dIVjAN/AFSwPSLBAOzinZyFOZG
	8mAxM8Svcg16uWsn2JDQlVfu7pS1jD7EKG1O73xL6IcpK9DHPvN80Fj2n8ZkDcIH
	gzgCPX/52m/fh2UgSttxIDJ4qB8q8S1LQf9euuiVEAdLjZcrqYl5RVZOicTCxXKu
	X1l8WA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc10ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:57:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86261e66700so2235426b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790603868; cv=none;
        d=google.com; s=arc-20260327;
        b=Lm73QaXNdo3UNcIgO+rVBPBH3oGtq3Ahcp/iMYvOJu4oXiZX3qiqMMs3vnTzCZ3T5x
         ElPVIiJA/eG+Q6BS7J9aOo+AqufBlHewBsEzGLt8BqBRxuIagOOtmPf8Dqriz16j5aQM
         fQ4Vr8z803n+vVwN6LWeaVweqeOqPt0YyhdFZgglMSb1iZ7Kpj58601lP728QWU8JU2e
         AGDZWacpWgxTPAY459/lTerk0BvpRnsjpc9uuCAyaLX8a7UWvXG0G2QEzlTM7Pa/QZ/b
         3blKVV/xtz49o3+leHqJCbyP7TFXVVoG2UXB6aTiBy1rG1vg7jLubvid3fJhiX9LwzJg
         FkCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        fh=o3unhng5fi1Mj0+s853Oq724HMDcP1+tUX6IP31uXSg=;
        b=bBPqgdIzoS9vUxRC6xSRFXrusIcwJxAcsDRZfJ36hQsqhntqQAm+D6uGQMX8a0aI4B
         X3ayK+6KszN1w83P26HPiaoZViwQbIg2wT9z8+IGY0C4yUrXvtJl4pqgvY/H3jyP8S17
         vQxeh5vkLJECPr7gTkB9TjH1hM4p5n7U9rK78mfQsQmWFW+bdGeeJWBN7fB1ciOgYkmG
         AfPJk2qb2fvxCDBYK+BBhMLa8dpF6GZJNUSUAXYa4v5RLOpCTog8sZonHLG5w86ksN+N
         Q5+6tHYHBUCgluvjigGu70XuVcCokUavPI2DT+VLkTWpt8REntV5XWGOoilBCAzJAUAm
         yCtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790603868; x=1791208668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        b=gZm+5TkeNiuNCWoMFmByiGuXPWyeZfYVqr2uIkJNz73oKjT5kMP3a1/PLCH20oeLe0
         xcvk9SuiHU33LZ55Fbzpfxo1NFE/GBDg/vuoWelGhue22jmQ8AZDU0QRjzBVyuk62/HK
         pohM2L7obX8b66ghXXB9PSYRPQlEfxawvn88RDeEYywCxhFFV4rkCqwxuRdiC8P5I24e
         wA+SBuii5pGi4MhJHWIoXYSph59G0Q0iayJbv5z+vVNVBDBVkY21N9yu1IDSzYOFOi1j
         XrXt2aO9RGNzSTW5/ek7Wg9xq+o+xZaDAI6G3NrmZIDngCZvK9zlDMcXh3IiziXH73n2
         ybxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603868; x=1791208668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        b=u8jivnU7PVwlmfBgAANfA7oya47XfHMO/UFzMpmF3auKVt9oMRN4wl1bIw7ffbTK7n
         /2r425nHsCK503LxWoODT2whoEsSylKGkY1WkMCKLsXW8o0rRhMfJUHtRRZdzQ6SWMo7
         R05w3wkf7obCBUi7cN7ifuKHNl2Swxj3YY5h/qASKHb1lqYBkVRFoNt061rc7PFABmch
         PEVi11cru0JjjVFNku8lMzLrbXhnhNlqQm8dYkr6J/aEgQtQ9fFPLVAXzdU9WoXSY/PV
         olHMq16I/RV6qmdJBHl1u8KQIRnpi/FPsIvav8xUSHELnrz2XaptctwB3AZ6JoEFJAV0
         zfFA==
X-Forwarded-Encrypted: i=1; AKwUvBw3PaSRaeoHIn2npUrpFKbg3zcfexohZiTRCxA7JpgMi+SxVaLy/sRL428jSiZxsc1ihIHxTcYFhVPAeuU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPbrsJYCgR68Rh37xNeIccU76Yfkzlsj4NNa6/Z8NL19xBLgcz
	4R+uo9HUVFWLxSW5KcygxJOhmIY24VGpcCiDE4afXqOIIzmxKHsdq8ksHLoq039C8FO3AtvxHil
	f7cvcr7R62NpNcdPPW2rgjJsGRBDDEipvVrlfJpoNve0JS2UlZVA7kIE+xVt+lIaZF5fnr/6nom
	2tScOuBdH+U4lI+ZM8+rBZ7vSkarlR8sCKzsJkdLIbvA==
X-Gm-Gg: AYBFou2nhwFoLjJOOVCCtmpNHZsknyT1PorJZydyhA53LmjuIkRmfCMZOph+TIU6+wK
	JGHJpahrNVglW2YF9Vr5NArLIS63XQ/PdZWj1eckAMTbhOQjb/vGfnk2jplkLWcgjy3TTJ68z++
	npOSx7xcd4glFIRtSIREozd2ou46eCHiyoohv0mGDz148FwJWf9j1oL7V08A==
X-Received: by 2002:a05:6a00:950f:b0:881:c881:96e8 with SMTP id d2e1a72fcca58-881c8819a45mr4006754b3a.23.1790603868160;
        Mon, 28 Sep 2026 06:57:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:950f:b0:881:c881:96e8 with SMTP id
 d2e1a72fcca58-881c8819a45mr4006707b3a.23.1790603867726; Mon, 28 Sep 2026
 06:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-4-b96fd3fe298b@mainlining.org>
In-Reply-To: <20260921-msm8952-initial-support-v3-4-b96fd3fe298b@mainlining.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:57:35 +0200
X-Gm-Features: AclHuK-nE9h16BssbY-0V-0Lcqrz78yNjoqqCVRnCD5BWpC1wzqbo2Hd-T05VXY
Message-ID: <CAPx+jO9Vj=42dHEwLzTHe1b+nrvip+ibVv4iPquxwJKbFAkm=A@mail.gmail.com>
Subject: Re: [PATCH v3 04/19] dt-bindings: power: rpmpd: Add MSM8952 power domains
To: muzafferkadir@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba725d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8
 a=xo1k5ONJVskqAlz3UKAA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: ZMiZTtl2G2OQSWDMGFDf_8K90Sfni0P2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfX/LdzEdjVHL8b
 Po4gPvIoagGPWwNQ0pTcJpnQODWTS6h6wxTpg2Z+l7DMcBFEvX2eKtf4+3RLOVrK95YjavhpnnQ
 IooqbFXT7sarF+TDzr0ZrDnHbStPYOlioOOZ9ywHdwZbhJ19Yc5vjCQ3Z55k/hER/s9wn3pYHdA
 hDMW4CiWbXR1tBEfSmtE6BBNejUi2Yjh68uw/6AH91eBeyyAR2ItPJ+Gm6YQLD27DPFwuIJVIuY
 scjUHLuwfHdoZyjyqcSNkwxc9fIrVx3s82bnU2BNJXZRVh+0dNAiMKDkdi/PIk8PGVZEFBhz6s1
 TqetCUqNOUGn2Y8iJu+VR21emJClUUa7TjpXGv8CfJydj6FSnPz5yibKC5s6v35xNXkpriG3txW
 9/ZYcC7J1t7aKuiURG0MSyYqxsmGtjllgwIu05oa/XBiQixnq4yLpGyecXSwuB64KRdwLDt9Nqt
 ROzRAau5A02ssrm5GAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfX5FC4aIgTRS1u
 FpaSG0eSp1RJuuz2LMKTPsvlWW69eYuKfrBUYsc0K3So1Gm035e5g/h830yqtRlB7P7ySZ4bota
 yyp5gmOTAHW0wCXxSIiSBOG9YYybcrM=
X-Proofpoint-ORIG-GUID: ZMiZTtl2G2OQSWDMGFDf_8K90Sfni0P2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280055

On Mon, Sep 21, 2026 at 8:19=E2=80=AFPM Muzaffer Kadir via B4 Relay
<devnull+muzafferkadir.mainlining.org@kernel.org> wrote:
>
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
>
> Document the compatible for the rpmpd found on MSM8952.
>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Do=
cumentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index a70bfacbc5d1..8ee1c25a7c9d 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -76,6 +76,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,msm8937-rpmpd
> +              - qcom,msm8952-rpmpd
>            - const: qcom,msm8917-rpmpd
>        - items:
>            - enum:
>
> --
> 2.55.0
>
>

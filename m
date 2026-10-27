Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793127315;
	b=oQMmd7hlV3566zlBC2EaSmw7ed/Y6FrTVNIscmzodLH+OIkBNplKNlTEw+wE6KsIGTUw
	 tKx6Z1vys8LwQYUU4R7FAjt9Ec+4dn44fKp/9/aljjXMOJdFf9VsIhEIDgfq01oFeZojB
	 6uq9Dp9tfccefFQD/PKVtM6dr173gxbF0T9wsukqHH+umidoA2W2hgPIXRhbwtdUK6n4U
	 OzIrQBr1yOAP4Jc/+JI9D3kUzNSH7sGgJOPoBFvvrAftAEAC25KyoGm/AoP0ihA29i0hl
	 IkxW8nDwItbz0ZqvG7U/f5MdzolmwAqwbWOVdifpEui4fAruOynFEp0IhFyHW7dEcGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793127315;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fqBmnY8T0CqGP0cX8wFwCoHFxWCAuxU3CcoqNGTy3Js=;
	b=QPUqGQiZHs2suRiB+E5uTV9DHHnIbHYiNEOl64t5R1GM2zCc7zK4DXuB4uLywKynaKmI
	 ITiAcRqlcUOQWdr7ibImpjDWsiuhy0Jwd5P6JJq/d3lIGW8n/Hwg06upB6hvSnCzJKKIe
	 0SanAsbwb9uEYwYdvhHT3FXqWY79HtJ0a5W/j7tte7hCgrb80MZ1Q2oQAzXTiWCQuMyK8
	 u4mit3M+m/na/Tl0ObkodhX3qWQ48SPUk3HKfiYP39+66g0oSuAr1JaKJR8OHNcSzea/O
	 FEB/NwomOfl0+FPk3sp8U3Ge+xw+aPY2VQWGZrdZJQ/T7ixgJk+n83i1OXfw895Zluw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vb57pl2t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MquLkyGm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E82606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2E82606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vb57pl2t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MquLkyGm
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHPkm2997795
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fqBmnY8T0CqGP0cX8wFwCoHF
	xWCAuxU3CcoqNGTy3Js=; b=Vb57pl2tMbv6ai+TSzye1rjbv9idcPtDHHdFNQpQ
	pZE/q4OMfAicpWV+ah2+wQabqYkuCVjJYeW+B/icdqgkBm/3zI7d5ozIXIde4oeD
	AcTbekr2Ky4CeOb6XU3tSKfVRyqYfU2Cm4pbsUa1pEE333URuBqxaJkLE1ZQYB+5
	gvcH3AAdrapWLPLFPBlj8iIFgFIxguwSeFN2knlUxfZ268DwZtclZ+db5Be4YS2h
	GxDHh5O+LruCzwzrb5KU3Mjty5BQOsxAWaJ85BABikYlzMI8dv521HCPfJ9xSWyL
	6RcC1sW5cVcbVhCUHr6mcu61e2Et4JCwS8+Davs7sVzySQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1j8qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:55:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34edae32c04so17239eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793127314; x=1793732114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fqBmnY8T0CqGP0cX8wFwCoHFxWCAuxU3CcoqNGTy3Js=;
        b=MquLkyGm5t+dhTH/rpfpD+uMRkkO1EV/qZhF8fEmT6wIOjmF2li16F8r9Ud6e38fIk
         30s8YJS/p3u6uW2BWIsvLqB5x3Zsaw+QCpJjvgAeDl83fQI+io2oR23Iq2uiSlaIPC0w
         +R6AxDJmIfXMwFnyDgrZcquluP13dgLlYeqUnkVyhTQtUotmowLRCE4fL5eigufSO7et
         xB5tnE9VZCQ3NvxsyJO77NTKlWWNh41XI4bTeWcHUagzk78pLaAgMV7AVww5zS+MSJvJ
         5s1e8XTXGOSY43lel6xbYJ5gPb2MWJd3an59OLQuQ+cdtegqwAAg5RGsDjHfj0rPIb7W
         KrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793127314; x=1793732114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqBmnY8T0CqGP0cX8wFwCoHFxWCAuxU3CcoqNGTy3Js=;
        b=NEcQOkIr2gWGaaIbQwmdPgJmx/kQGiaik+/40NCHNRDsxUkZqKZpRqEKuDUHYwn/M/
         X+ahfDRkm3viZj5vCuBJtWnSTw4xTp7U1uLDI+u1D8ArX5+0z5kvW9BNzCzc3CtcNVK2
         F/1rYOX4rAZE10MNIcuz196FPKDSfhEkY60OK51gG6KjAAWt0qEhXcn8rfx3xthD+PZ7
         iYhbFGv0dwdHqwcFDfjIx4m+nUDeBoOKlaLKjfFiQGKzG5OE/30Y2nSPGl3Lu+eDCAfL
         I1NqOYa2PuxJAjkHWVeAdfrKtzM9YIKG9qGRsGlHyo5Wht6HF6bR7YI/eEln+5hGuk/1
         TGoA==
X-Forwarded-Encrypted: i=1; AKwUvBzQRI6o2A/FssfPzmeLBuOy3ohSkqo1KcbECJ2N6UAHGtsanbM8TIA+x4eW90RuIW66gbWmvvszbvIFxEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI19KdBySCi/rDIJXHXBWw3yFovD//1NywHyWrkCImOlBgcGrRG
	jI2esPu72WBMju/LSySOmHeBpbHRxrBYF61n3CffUYmxsLG8BOy7aovUs3h3RqriIIPOkkPGcQ6
	TgBDPgSR92W91ZYQatDOGpVIxFaWxZlXhJ9d6chCA2lXGIWeesh0tC75lloXVUafvfvY=
X-Gm-Gg: AYBFou3Zr/lZilnTUZJbvyRgPHoMEiAwxuvj/Rg8O3DgHnkqnybn5zxhykxpXJ/WmK7
	4qpSUEIe/K0UsNWkNdjBOtLnkvWDvhcHssp2fvgyQNdg9GUhoBVfr3S5wsa8wCprtPqdtIDE6+d
	boIuFtALIyAGeZz5ibVqj4/2LUTfQ6U+3rcjEKDQ5yVZ4uhP/U0gbbi+xweA/V361BgUonEhI2a
	jebKvzyYvZj7kSTIKDv2DaRtE3NSFQtSLZ2rkQSRbJxfTwiHXKPjL/IFD+AuQYR24jXtMqlArPe
	ul/64ShVpN0cTHcj4neMEVH0zectySgroq8h27oNZghxTKECHXr2oFY4U8T2Rcz/InaH3CwIagN
	dBjHRJ07BQC1PUsuiA+zjcfR40UysyXUE43KHOgPu8cjJY0TcCVi7zQ8xAHRU+b9ZED1XfLXSMu
	8/ChHmHPEsW87i2OKZQ0kJyxEIDGwTSGiWLrboJEd1KkOMgQGZFIxi
X-Received: by 2002:a05:7300:148f:b0:368:5521:612f with SMTP id 5a478bee46e88-36a1ffb195fmr1204206eec.0.1793127312943;
        Tue, 27 Oct 2026 11:55:12 -0700 (PDT)
X-Received: by 2002:a05:7300:148f:b0:368:5521:612f with SMTP id 5a478bee46e88-36a1ffb195fmr1204066eec.0.1793127312021;
        Tue, 27 Oct 2026 11:55:12 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a005c0188sm23309209eec.9.2026.10.27.11.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:55:11 -0700 (PDT)
Date: Wed, 28 Oct 2026 00:25:04 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: display: panel: ilitek,ili7807s: Allow
 backlight property
Message-ID: <auDziHHv7Z7k4xyO@hu-vishsain-blr.qualcomm.com>
References: <20261025-dlc_backlight-v1-1-1d1c49c3e101@oss.qualcomm.com>
 <20261027-fantastic-benevolent-boobook-272a9a@quoll>
 <auCDgewe04WKbamD@hu-vishsain-blr.qualcomm.com>
 <c58c89cd-94a5-4776-b186-44c4b1b3c3ab@kernel.org>
 <auDrCTMk3oCLa91X@hu-vishsain-blr.qualcomm.com>
 <97ffe608-a69d-4f88-9e1c-fe991a36aa1d@kernel.org>
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
In-Reply-To: <97ffe608-a69d-4f88-9e1c-fe991a36aa1d@kernel.org>
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0f392 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=d80Fkh-WlB0DjQDMt3cA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Yzi4-IiQA_zHR1wSJDHDrCJZuETB0PFV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3NSBTYWx0ZWRfX6FanQ163HUPq
 eTCVlJ0Rp8S5sXvUGIQO3J1PZO7XH3mxXOY18Jvfpu+YmiI9fJyhmsEBWpOMFJE8PLMb0LbMxP6
 pbewTlLTNyncGuRKCCPGObeq3CJlueo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NSBTYWx0ZWRfXzHmWUDk8MaV/
 w5Vbxs8jbLB4aMFN8AyG/DDTfAsUORAWrBIVaEC/7v87fE2sZQhzCCk/ZiJVMUQr/mqxMke/50h
 m85eQjxA/D9HnfzeKeJhHaXakEME7F4BuwJ5q2FTB7MU89M6NtwFBzYTq7A19drXO4lsJ9oAEKt
 HRx/ZwzKpSPxRZrLG4sSvV0TUca41pThUDLqi9flHCx4cyogSSTroEkXJI1QE7VVdVBrQRsuvOU
 VRDUZiZi62L5p/F33XOE/lQHN3PHpdLHexwuGWkR9HySr3+DgJ5OkbT4UUoLZ4P/uLIs9F4wFAv
 //06JUALs46QKgFQzOg+DVSlVRbpKjPSFMtqcSIb/JaHA6FjxUKjMFoTQDffC8qzMfw+DhrvRsd
 jd+Rbl/HD+EJilIDo1snnmSrMbC7Q8jdWLXeVV8tiYolsTPcNk0JE0jPWjvRcZQl8gfNhOiqvAX
 ng83vOCiUzIp7zbFvug==
X-Proofpoint-GUID: Yzi4-IiQA_zHR1wSJDHDrCJZuETB0PFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270075

On Tue, Oct 27, 2026 at 07:24:08PM +0100, Krzysztof Kozlowski wrote:
> On 27/10/2026 19:18, Vishnu Saini wrote:
> >>>>> Declare 'backlight: true' so the property is explicitly allowed by the
> >>>>> schema.
> >>>>
> >>>> Why do you need to explicitly allow it? Since when?
> >>>>
> >>>> I see no benefit of this patch and commit msg does not explain me what
> >>>> that benefit would be.
> >>> It is required for below DLC panel, when enabling backlight using gpio-backlight driver,
> >>
> >> How is it required? You did not really answer, so again:
> >>
> >> Why do you need to explicitly allow it?
> >>
> >> Answer starts "because ... " and you provide technical arguments, not
> >> wishes.
> > Because the DLC panel node references an external gpio-backlight device through the
> > backlight property, but the current DLC binding does not allow this property.
> > As a result, adding the backlight phandle to the panel node causes a dtbs_check validation error.
> 
> Thanks, but that's confusing or we looked at different source code,
> because to my eyes it clearly lists backlight already. Can you show me
> how can I reproduce the dtbs_check error?
You are right. I was looking at an older version of the binding which used additionalProperties: false.
The current binding uses unevaluatedProperties: false and references panel-common.yaml,
where the backlight property is already defined.
Therefore, I cannot reproduce the dtbs_check error with the current binding.
Thanks for pointing this out. This patch is redundent.
 
> 
> Best regards,
> Krzysztof

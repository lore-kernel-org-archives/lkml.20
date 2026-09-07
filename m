Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155F147ECF9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781259; cv=none; b=pBeV2nPcOtUKDUNx9oJ+Dy3Ao+m/kaicpPGUkiDAsZgy4OdaYapZsgVIbFj+EYmoqW8jNkeiwPlRcYlXkG6Xm2n3jVg2VBMPCFFL0oySM4kQfn2+wORa48dFypm930tLh2OLetpoc+UDWoUFRBbfdeUp0O3jNkIKyrOrWi+vwag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781259; c=relaxed/simple;
	bh=fdHTcHFkbJ5jxLznF9bAM747zUqA0oCwTcK0pWtvFlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7AIzl8Pd83YS7q8qXXzNeoNzYz7St8NTpKwioLexQIdNVKMZOldEF46jLCl6GzpBR7RVwpKdaej5ezB3xinajG2BRaqeMTI+ZKpzwkrz9JVr96kikbAr9O+og6LE2afNLJQDFqYaWo+3Xz1K724mhy30lXk7jx6ZBvCz7XRwh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GITAcLOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OqbPNwfv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GITAcLOc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OqbPNwfv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An7EO810629
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 11:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQkUEFUR5IsK0eDvmjHysqviR4MQrvWzK43LhDINc1M=; b=GITAcLOcSjuoxtCE
	it6fCl6cQAx9CGk/j/mr7mu3ef65jM3VJuu8TTAZWTtej8Kj3eNDpAYKFIomIBfY
	ab+K++/0/RUEJLXVqVQripSznJkvtFF7kYpiasRd+t6Z0MUIuJIu1cyFXRnYNMaz
	tpicpzDCewioXft8CUyiMCM7bfLXWEbYHaigYjTGqBF51D8OhqTbPe80XAyDA+Ez
	v0Vzy3C39q44vxym1CHmCF/d5qZfsMqI4g6OfNLerXJuxVv4wt9OJTpbThGAZIkk
	ejxVMfxfuT+uv/UdaJNZZerIjJMdkSZ4LnubEvJ4/m8DpkZQVqPwBJJgfdRYfSKq
	/5hs9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua9764-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:40:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so63514785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788781256; x=1789386056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQkUEFUR5IsK0eDvmjHysqviR4MQrvWzK43LhDINc1M=;
        b=OqbPNwfvhI6C2qLIBhhtYg0WenNet0BnFQtVKebn/J2WEJi7/JU9SlJMHEqZmwqMBQ
         2+RMYnNyoKazIJdx6xvgpfS94B52LhztT/aBIG+ieCiZmlMetbpHQgoztDu/aQKvVrW7
         CRD6CqKc/sd/alupNXfl76nENj3sGKHGUxVfw1QWRgPNWlpRl3SwRoLQdY7AaRsxh/Vu
         kuvZ1KAerrCcXQJGKSrGGmqRlRzoXuGeoGvJGV5oYLbIq4PjfYPCvIJ+SOqC+DLKK1LN
         TXw7V3xeK51VU3luVKQVDOrUAvOuH4AAkhroY6hbk1AbQMcb+ds4Gp6oHJOUkBoazOVx
         0Y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781256; x=1789386056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQkUEFUR5IsK0eDvmjHysqviR4MQrvWzK43LhDINc1M=;
        b=egkKUOKwRzDpmQ9gfO/7dsh2JiFP448v/2FK0Kni5ewtJ7vt6YHBOxuzcJG+KXb3Pj
         LhjT4thVn3ugBdIAwb594Ltj+Th5WAhhVpfaNh5bYEc5L1FVwnta4mjS379MCR1GQ4I1
         ro6jQk38Iwg1j9RoYfkBYccfafrH68fMZP1JzA7TPCj5W99u36Bcyvr1hyzT4beRhE5W
         Mh+aUIDrdc3c+0KBaaCaYbg57VTqTr+6QtwAZbxR4YGyzHnvJdnA6jJYe9R9a+jzZlLl
         87op3IiZ4czAYkGfrF7XlwZVWmK1B/ZKa2TGUE0UpeJQkWvq2c+qe2C/fveGL6z5eg17
         aEnQ==
X-Forwarded-Encrypted: i=1; AKwUvByjROAYG0QFmp0vCGBQyL+15a4IqK+89MBEpWv0F09Wm37MGMwRzdDBIB2nIdcttuEfNqRATtYi99MqRWs=@vger.kernel.org
X-Gm-Message-State: AFuF++nDp6+x3Yi4QFg3alG+fUw0aSix1Mn6zRGUfWCHRlLoPTsF7rY7
	F/Nn/Tn9Vn3OJJMiob4G/ftEJpc7VPCAw6XsxxriB0qewvE24Zq1/YX4H2CMfTUJlE+brVIx1+K
	RxddSAdoil/GBKUf/WCu93eR3ZuCbVTOG3PtZJQPPMTTF0UKG48ER2RsY6Ow2TojcEz4=
X-Gm-Gg: AYBFou3nG0SOdiXRH+TDyJILpbEU48qsMD0oJ2xBqf5dlV7bsCIUfZ4RBfvHCUhzHFk
	Fyq2qixFeisO4a8xi+UOQsk/nD3AmXRPjaNhp2GZv7iRbWo6akP747tvurU9l8rkbLufVuC0haX
	0X2RKAe74fYzh6UW/k7QLqF7ogcwsqgpxMPn5+aZlMEEXtSSD1wwzvvUPUffNuRucgQVKthxYZ8
	Lk2maJeqpb8V3HJfZ8hAAFEfNX68Pde4Z1BH+I0LwXlw902u8YRPbiAv85PF4jQ3iaa48AUfyM0
	XwYBomPsHq+B3+HPc74yyfLdfsEP+ZV3V++F9SFLru2VrCBIE0gZ1ukutv+YX9C2kaz90MsiBg4
	bckwTfgUEJ5ZD9rkBlOByeA==
X-Received: by 2002:a05:620a:9c4:b0:939:9205:4d78 with SMTP id af79cd13be357-93992054effmr848930685a.3.1788781256087;
        Mon, 07 Sep 2026 04:40:56 -0700 (PDT)
X-Received: by 2002:a05:620a:9c4:b0:939:9205:4d78 with SMTP id af79cd13be357-93992054effmr848927285a.3.1788781255580;
        Mon, 07 Sep 2026 04:40:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d503f96sm452876766b.26.2026.09.07.04.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:40:54 -0700 (PDT)
Message-ID: <5954fbc2-08c2-4509-8703-ab20d57be309@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 13:40:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
 <20260905-lvds-support-v3-1-b40a1b03f63c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-lvds-support-v3-1-b40a1b03f63c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GfW1lmaU5NpZC3TDwxIrVrD0cWgaITKD
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9ea2c9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=hb4hLJ562k5UIXpG1yUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: GfW1lmaU5NpZC3TDwxIrVrD0cWgaITKD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyOCBTYWx0ZWRfX6tZgSa2TXXZN
 KdJgyokq2ckfIK+MP6kvTRDvmBe3nJoM6dCP7TAlm1GFF7JHAM0YeeUQzrVNC5YJ+Dv+vAWhhAt
 klS4Bv+imfn3rd3R+kq89CuWSXsO6vE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyOCBTYWx0ZWRfXxzLbZJobxzlb
 07i7R0QBHWlG+2E61H0kuAfsQ4rO7KNcoawoqLEaNihHw0r7JyhjIz2DuSrUEP9olMPn7/SKr3h
 U0j6qC59suyMxu3AAGib4q4bd4yBjsoBdpJdpPibRYXpmzN8js+OdpDPcvq5j28QU2cwiQMMU37
 8hpi6eRjFk6XyWgnpNIFbUfJBLAvmzdKa3s0C92uW+y86wK+MV+fZCInvWkFlHZ0eiqMtnpFWbZ
 7LVF4BmVh5U/MO7zKoOkBOnqbQ+GDtWXBiSEZ8fpxGjU7lHw0FElMO74n7nhu+tYtIc+3+tN1Zw
 2iD9+cbnTDNhcH0Fsf5MrGiEie8F/7QyxnfWcynyjepUKQuxZH12LeUWnPO7kYQ+ExvvBRH+/HX
 82UkgwrG7VRu/XdXKxA/jEdlE5lEXCCbrPfYEnPDtfTTgutcPlFwp2AVwmAgRNW0B7GTuoMjbyy
 QQQ6qm/RY/9WURHWHBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070128

On 9/5/26 3:30 AM, Vishnu Saini wrote:
> The Lemans EVK IFP mezzanine supports LVDS display output using the
> Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
> DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
> VESA-24 mapping.
> 
> Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
> up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
> a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
> panel-simple-lvds-dual-ports binding, which supplies the panel's size
> and timing internally), and an LCD display bias regulator supplied
> through the GPIO expander. DSI power is provided by vreg_s4a.

[...]

> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -58,6 +58,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>  lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
> +
> +lemans-evk-lvds-boe,dv215fhm-r01-dtbs := lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo lemans-evk-lvds-boe,dv215fhm-r01.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-lvds-boe,dv215fhm-r01.dtb

I have very mixed feelings regarding putting a comma in the
filename..


> +
>  dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
> new file mode 100644
> index 000000000000..bd3e13c46a1e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	model = "Qualcomm Technologies, Inc. Lemans EVK LVDS";
> +
> +	panel_lvds: panel-lvds {

nit: this label is unused

Konrad


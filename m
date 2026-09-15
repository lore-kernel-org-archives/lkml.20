Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EF741B8F6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467437; cv=pass; b=M0h4RVO0ovPNS1auPCGIO8ALiTO1UEmpgJZDW+zAEHzH5G3d62c52uLJ4NsyYSR1WRPIaIrdBb1dzJhB7Q0X2BHcXm7Hf+12rxRJ2c62QZ9vRTUJ9WF0VkrHc8xmC0sdCGomJEN8H90y94CGjU+ykH1UVq8mH1kOx+AmtIU0qF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467437; c=relaxed/simple;
	bh=MSWHoWGIFn+iwFs4suHXdlxtL4JfLcvYlTQxB2Sr6m8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6BymUVVYFPIgWTH/QmJsqf7EFRSCX9bsSohwobHdUvo6Pza367DbpOSVo1XBZ3+UnL7tBjGEfoItiwhwfawwWiEuETNJOiZQZn5ZVjmhLGNXOQ42XIif8SOnSyLjzmmnuPRNdwK6BxrPCUpoQM0LgVNYCcG7tq4hZTjdAIngC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwlEfJCk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIotmcRt; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwlEfJCk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIotmcRt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hCS03415896
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4oAyrq2KtQXNsE5MFIxXDu1u6My17cNb8DrQ/MjMRk=; b=NwlEfJCkHhcoeSOK
	bmZITvB9u6oxNjBQ7h8OqvduG6KCTuaHaqtd6r7UtHxSq9vvGuJoYmXWue24/YWs
	MB609WXQEURRd/LJndkTYQ6tbZ9N3xKbp9j4xqrmYqudZRmUR23aOjb1wiSMl9x2
	WraC9KiG18nhXL5+RWojUvSULL38a1AVIuq5wq4oC2SIwPK/yiuq7QxjLvhDS92V
	TtLI4pKdvjibQRzT//j2jYyCCunekiY9BJgaAkPJB8tYYO6yH9LJwaixx9l6rHzQ
	CyuIomy4EwIApyYEM55fZcqdQ+/gbGyH5NI4FWon/jf2iN0qItqpwrYceAbbhvzX
	5kbpMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc06xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:17:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso199756185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789467434; cv=none;
        d=google.com; s=arc-20260327;
        b=qSNkA1TrAoY7EJEVWZfB/inpD17Edy8qwPHARanpnFDcddJsxcYN2c140DvhK+fnBH
         ar5fzvq93/PkxWMiMZ8hXRGiQw39w8d2Huir0DL0D/umFCHA0QNFkcskRafpHDGjuuKy
         1dtoL+YgLE7T4SXEev6iTn+tayUNZ/tYfEnMVKYo3Ry5eF/i5lzaFoP/acKesyeC7RFh
         vuMOrSFw+uQgMxpSUbIHPeGe+AVrXCrGED43He8peCmyUZNXHorsg9Pl0hE/nBszX+qh
         EX4Mlhq1HdLUqxiEupiWYmSKzIkZAePbXzrlfEiYgz+5+1A5oLbY4aNNGxwgjoKObumQ
         xjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y4oAyrq2KtQXNsE5MFIxXDu1u6My17cNb8DrQ/MjMRk=;
        fh=CZ6cw4IYGOP9yfktE2N7gLAoL5bXhfi6apoMs4QBZH8=;
        b=mgcXrDAgHi7UD16I5gvfpY8nZTSJNLdZ4u/weWKbNqwafmekRq9HCJ738ObCQEPBO8
         YdmLn0DKkuCaQW0p4uYDKyROT1acV/p2IkdURnppq/RQhlzeXXpvdOieBjN4T3b0PF3Q
         wAEg/9jxttbQrholqY6xu0b6Gl2Nniy2tWpE4ErJAA12g/PUOOVKGeJiV+eZLZkTcA6G
         /UvWmbQgvGxM9q4qSgtSu05WTGysyfWTmiNdoBCxKZpRuLFsZYOEptTAsujhFcVNXgbh
         ZceVYVRj1FrvJpde8O63/rcwJZkVY+wtJtoNo7KXjy9olkVSbQjFPxBXHSJ+nBZU0Ben
         C/5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467434; x=1790072234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4oAyrq2KtQXNsE5MFIxXDu1u6My17cNb8DrQ/MjMRk=;
        b=iIotmcRtyn1xIbAtbmxhTEQRAoJoosWUu0KAYqxr/NxrGJkg6D3MhXjsph0RIau96P
         /tOgmCWz90wqB3gQ4p6cGVvjPJav561jWBBQkQW3ckW3CXKdILncJ7qkSCFHJEDEJKQ3
         aiO80i49ocuGPjnjua9Ma1rqjTq/S49Kwb/xwxs1kX8bcS2ZcSBMDNj6AZi4x5LZjAxa
         twQ1eV931iGz1L/PCF/6zBUUa34UtIDCYX9CU+lso5AbEY4DJNLzp3su3LpATV0XJoXj
         uYxEvfT3zqF6mUDG9JUwkSGmdNytlF11PDSv+8Vxj277k5t2uSozvgcU96zCf90r43om
         xx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467434; x=1790072234;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4oAyrq2KtQXNsE5MFIxXDu1u6My17cNb8DrQ/MjMRk=;
        b=X+KUUYgiHwt3Yugsg0+t03yMd3o2Z7qBTeMNmRvElG89Aintv/tlIOpUBrDe23Fln5
         jzS+yIeltqZEqdmCgfhesdgxLYWfERrmBWOL2mS7WKO91U3XGtZjTrjwBErjYjiUnSRy
         zdLHbO80qMJxTMug7Mn+TTPjhlC2OP+JZNEHSwPJNFmKTL4kDD6pK+x2nYUG/x13Z7Fh
         Grz8RAaZnrVKoXlxzc9ERCPWpene60zeurtc43Hi8rCCIjqsdv1LbXFMoAmoylUZzG9t
         ERPfp8ECImyxf9hL6QaWDdds5jqmEBXRaU53PFy8LVOb7D9agMdYxVdlrZjUhyXj713R
         mccA==
X-Forwarded-Encrypted: i=1; AKwUvByj0o4PV1DsXggrliXdTQMFGAcDk2p6nLOyran1WvV5GX5gcvIXATnGKVM60wJuQd4/5Fvb67HB+31Qve0=@vger.kernel.org
X-Gm-Message-State: AFuF++nzixPOTxEpYeAvv3EiT7hl+E7nrEPFuqeQLT0SAMYUvxjergs2
	5FJfoLYYr2DE6ZfHIcXy9AHYpWY7R40zFmofn1+CdvDVZoH2P6PNNxsL59LuO4tXlMfd4jznRRl
	B8Ld3xQG4vKnJFq0+IusIBxZF/Auj0fMo9QSVuygmQUW3/0tjQG2lMN9nKlxO1A8MwF7TrEYPKA
	nR5wZ1nkA1+Lucq0JZa2kExX8L7+8RTf3iKYiSSnPWnA==
X-Gm-Gg: AYBFou3jPgayua4ma3UYt1MooesQI3nwKbEJMJKFUudFCWSLeDKCBx9eKYPdZIlvgiM
	y0ArlsWAMpWQ8Jk0Wb1W5Htd8r6jEAYaP3ODL16rdUVYfLSRdRznAK03xT2qAdS+JGhyvgEp8xc
	aMqvdBh3xVfzyBXp1gDS4h0Zy0Qtov5XxBFEkBmIfsHYWMF/eK3Y0ZZCPDs6PG7jl4/r5eXzeXD
	c/AC5fvGaQgtKi+xCyanYtRHjC8oRwqezG2cCd2kUY2G+4Vg6bOlvQFdE3jkpySeHEuuFxK8bmr
	emtC7bI+gv4fmAUjktl5pvbFnDza
X-Received: by 2002:a05:620a:2b8f:b0:936:d00a:4947 with SMTP id af79cd13be357-93a345745demr388744485a.2.1789467433586;
        Tue, 15 Sep 2026 03:17:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8f:b0:936:d00a:4947 with SMTP id
 af79cd13be357-93a345745demr388741685a.2.1789467433112; Tue, 15 Sep 2026
 03:17:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
 <20260915-camss-isp-ope-v7-4-77b13d131d3d@oss.qualcomm.com> <4b8f4fd6-53e0-4efd-953a-cd8ebad7d479@linaro.org>
In-Reply-To: <4b8f4fd6-53e0-4efd-953a-cd8ebad7d479@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 12:17:00 +0200
X-Gm-Features: AcwNN1Xege-7rQu-hUK_GBF3L260MNhym32h4wKC90S0C1_dNyEg6Nm0Y0W-5zQ
Message-ID: <CAFEp6-3bvRtjDhmRy+G3AzP9vL=TrnGpOf1gU-=aQKNcdyzn_w@mail.gmail.com>
Subject: Re: [PATCH v7 4/9] media: uapi: Add CAMSS ISP configuration definition
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: lGXgxss3ckN6VaovEFJ4PcgDUOFQra0A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NyBTYWx0ZWRfX0mSbCGD3q5kd
 uSVPU+HxdxmnqiiUshd1GBPxjsmBBog/d8+nr75PmSS0jL80bIlkyDgiVldfBuWA6WpdwJgmDse
 6QFnm7Bulvq7pVkJMeMz3s9nqE9QOC8=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa91b2a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=xq3W2uTSAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_-fwvmfW1z61RZSq5NcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=P5L7wpMTXyg1GfFA3Gwx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NyBTYWx0ZWRfX2SQBgq0vB61u
 pnq1xmempk1w0rg9UwZ8lTFGPqbcXNWtEINMhkyig1sAN1CehbBd40+yMbVfat5sZeBjE6BfLRf
 VOsL3zJjkM6+8dzEJDKiish8BlafjMvyRpWns55hykNW39wAe/uMmize60dk4Cgtbo3/EcYxjzX
 /N2vmuoPJFu+zok9sMON5iHGvjUpDL685D0JytzYFC+JWUQFM8HO6a/qb7zFQSmyCfrCJbVniQY
 zRrFRsW9onFqCyoJRBKwi7VNXKKp33MdDgu13H/K4eRYUiLwb37BIy6MaU6qqK/mGo5FNSthCaX
 jx2/u55CQKYKiFtoZY5lZw4zLGOnZpzedwroXVy1+ftQrr6oCFenRqNwf51gA0IFYU2boqdsVQ8
 AwVMFMRXRSgjYvQmGpH8NSMIr+lNKvv+MjQxDwoE1fwlkDUP8VV2i75wg/SQ3hgsgVzhWSQEW2y
 mx5MhXebPXWkU5Bumvw==
X-Proofpoint-GUID: lGXgxss3ckN6VaovEFJ4PcgDUOFQra0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150147

Hi Bryan,

On Tue, Sep 15, 2026 at 11:11=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 15/09/2026 09:11, Loic Poulain wrote:
> > Add the uapi header qcom-camss-config.h defining the ISP parameter
> > structures used by the CAMSS Offline Processing Engine (OPE) driver.
> > This includes structures for white balance, chroma enhancement and
> > color correction configuration.
> >
> > The block type enum is shared across CAMSS ISPs so that userspace only
> > has to deal with a single set of block identifiers.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   include/uapi/linux/qcom-camss-config.h | 212 ++++++++++++++++++++++++=
+++++++++
> >   1 file changed, 212 insertions(+)
> >
> > diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linu=
x/qcom-camss-config.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e3d6cc4df7de00345e8142c=
81392dd42338c6ead
> > --- /dev/null
> > +++ b/include/uapi/linux/qcom-camss-config.h
> > @@ -0,0 +1,212 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > +/*
> > + * Qualcomm CAMSS ISP Driver - Userspace API
> > + *
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> > +#define _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> > +
> > +#include <linux/types.h>
> > +#include <linux/media/v4l2-isp.h>
> > +
> > +/**
> > + * enum camss_params_block_type - CAMSS ISP parameter block identifier=
s
> > + *
> > + * Each value identifies one ISP processing block.  The value is place=
d in
> > + * the @type field of &struct v4l2_isp_params_block_header.
> > + *
> > + * @CAMSS_PARAMS_OPE_WB_GAIN: white balance gains and offsets (CLC_WB)=
,
> > + *   &struct camss_params_ope_wb_gain
> > + * @CAMSS_PARAMS_OPE_CHROMA_ENHAN: RGB to YUV colour transfer matrix
> > + *   (CLC_CHROMA_ENHAN), &struct camss_params_ope_chroma_enhan
> > + * @CAMSS_PARAMS_OPE_COLOR_CORRECT: colour correction matrix (CLC_CC),
> > + *   &struct camss_params_ope_color_correct
> > + * @CAMSS_PARAMS_OPE_GAMMA: per-channel gamma correction curves (CLC_G=
LUT),
> > + *   &struct camss_params_ope_gamma
> > + */
> > +enum camss_params_block_type {
> > +     CAMSS_PARAMS_OPE_WB_GAIN =3D 1,
> > +     CAMSS_PARAMS_OPE_CHROMA_ENHAN =3D 2,
> > +     CAMSS_PARAMS_OPE_COLOR_CORRECT =3D 3,
> > +     CAMSS_PARAMS_OPE_GAMMA =3D 4,
> > +};
>
> Most of the OPE specific naming can be dropped, I shared the ICP
> data-structure analysis already:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20260426000346.11=
58633-1-bryan.odonoghue@linaro.org/

Ok, I thought we agreed on having OPE specific structures, that is why
I recently moved everything to OPE specific name.

>
> i.e.
> > +struct camss_params_ope_color_correct {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u16 a[3];
> > +     __u16 b[3];
> > +     __u16 c[3];
> > +     __u16 k[3];
> > +     __u16 qfactor;
> > +     __u16 _pad[3];
> > +} __attribute__((aligned(8)));
>
> For ICP I have:
>
> +struct camss_params_color_correct {
> +       struct v4l2_isp_params_block_header header;
> +       __u16 a[3];
> +       __u16 b[3];
> +       __u16 c[3];
> +       __u16 k[3];
> +       __u16 qfactor;
> +       __u16 _pad[3];
> +} __attribute__((aligned(8)));
>
> So this data-structure is shared camss_params_ope_color_correct ->
> camss_params_color_correct

Ack.

Also, I will remove the _ope_ suffix from the wb_gain and
color_correct structures. These structures may differ or even be
absent in the ICP case, but they should remain aligned with the IFE
implementation since both use the same underlying blocks.

>
> > +/**
> > + * struct camss_params_ope_gamma - per-channel gamma correction curves
> > + *
> > + * Implements the CLC_GLUT pipeline module, applied in the RGB domain.=
  It
> > + * holds one independent lookup table per colour channel. Each table i=
s a
> > + * direct (not segmented) map of input level to output level.
> > + *
> > + * Each table has @CAMSS_OPE_GAMMA_LUT_SIZE (256) entries of 16-bit un=
signed
> > + * output. Each entry holds an X-bit output value depending on interna=
l bus,
> > + * the upper bits are ignored by the hardware.
> > + *
> > + * On Agatti OPE, The module maps a 12-bit input to an 8-bit output, t=
he top
> > + * 8 input bits index the table and the low 4 bits are used to linearl=
y
> > + * interpolate between adjacent entries. Entry i therefore represents =
the
> > + * output for input level i/255 of full scale.
> > + * Output range: 0x00 =3D black, 0xFF =3D white.
>
> That's not specific to Agatti, its hwo the Qcom gamma silicon works right=
 ?

Yes, as far as I know. However, we may observe some variation if the
internal bus width changes.
Considering the hardware platforms we currently support with OPE, as
well as the upcoming platforms, I think we can treat this as a generic
assumption for now.

> Same RTL synthesised in OPE, IPE and IFE. So you don't need to make this
> OPE specific commentary.

Ack.

>
> > + *
> > + * How to fill a curve (same on all three channels for pure luminance
> > + * gamma; different curves per channel additionally shift colour balan=
ce):
> > + *
> > + *   Identity (pass-through, gamma 1.0):
> > + *     lut[i] =3D i;                                // i =3D 0..255
> > + *
> > + *   Encode with gamma g (e.g. sRGB-like, g =3D 2.2):
> > + *     lut[i] =3D round(pow(i / 255.0, 1.0 / g) * 255.0);
> > + *
> > + * @header:  block header; @header.type =3D CAMSS_PARAMS_OPE_GAMMA
> > + * @glut:    green channel gamma curve
> > + * @blut:    blue  channel gamma curve
> > + * @rlut:    red   channel gamma curve
> > + */
> > +struct camss_params_ope_gamma {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u16 glut[CAMSS_OPE_GAMMA_LUT_SIZE];
> > +     __u16 blut[CAMSS_OPE_GAMMA_LUT_SIZE];
> > +     __u16 rlut[CAMSS_OPE_GAMMA_LUT_SIZE];
> > +} __attribute__((aligned(8)));
>
> For the ICP I have
>
> +struct camss_params_glut {
> +       struct v4l2_isp_params_block_header header;
> +       __u8  instance;
> +       __u8  _pad[7];
> +       __u16 r[CAMSS_GLUT_LUT_SIZE];
> +       __u16 g[CAMSS_GLUT_LUT_SIZE];
> +       __u16 b[CAMSS_GLUT_LUT_SIZE];
> +} __attribute__((aligned(8)));
>
> So it makes more sense to differentiate the firmware type to the
> register-mapping type. i.e. the above becomes camss_params_icp_gamma {}
> whereas your subumitted change would be just camss_params_gamma {}

ok!



>
> > +#define CAMSS_PARAMS_OPE_MAX_PAYLOAD         \
> > +     (sizeof(struct camss_params_ope_wb_gain)        +\
> > +      sizeof(struct camss_params_ope_chroma_enhan)   +\
> > +      sizeof(struct camss_params_ope_color_correct)  +\
> > +      sizeof(struct camss_params_ope_gamma))
> > +
> > +#endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */
> >
>

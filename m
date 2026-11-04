Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793822431;
	b=zNbdC3/WNKw2OUrC0H6qQxCBLVj6tNx4tODKegnDVFbve9ARZ7pZ8a3PQGmk6DXvHcF5
	 s6BAvT7oPo4OgExdIU5jqP0q4IHaiEP85rlikmi7VQwcN5wTVvNct5uXI2lpRDagO1H6J
	 20tE1caAPWw8PN2mfkqJEMPmDhGJ2vi8rhcaSUdjsmjFmwDtEgQXeFEWVyrnclUrZORMh
	 iB1pyR/dndKyzkIb7uoPKwZPmbFmeWB0lXFjiGBxFAukN6yw6MHoFtJXE4trs76lOvDNq
	 appPwMmknlHiFoQj9KNcIqUCNPgj9+qjooeM9RqgCq7q6WdSiTElTW7b12se9jqZvUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=;
	b=qbiZVYnR3txX3jjrea8DQUHEuNyWmK11rcbshhnXWQxoPNMtC4b8yPfqnRyqHfm3GmL8
	 Ze6siBGjpql+0clV0/pQFTqbMkCnYCpjGzU3FO4UdMecSwUM31ASny3hf9hnJbOQx4L3U
	 5TrCHPEq333OX2W2/5y/ekbpOwDYPEH+Se176CMHSTUDSTDWBgsOF6Pk1ciuzB4ObyT+I
	 HSLcZqn1jWpVmm4F8xLq6jGdntuj+zPGeFsgg6rgeqiGJcSsbXnKo4wHTptu1hvGpBvTj
	 BzsdwynSyg22ffwIWB681naIP4vPD0SwBHSB+9eoip6Sj5JZnYFqX6TjgqoaXpb29yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS6L0nCV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ROR1pZAN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14723606D833
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14723606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS6L0nCV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ROR1pZAN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fiw8h2250930
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 20:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=; b=iS6L0nCVeV1D+aJw
	3qBT1y6cbxTEKXlvzCaWTv0EXABqsQeU8uIJPgQyUTx5G1rjJE5FjpV/6r67W+YJ
	rG8tih0dXx2e8dDa38nx9+6TEkbV1ITN+xIBBhJElVj5rjvz6I5plV2tL0u65qtU
	rFWvV5fBkNENIX7uyj2xUu2FlCOMoT72yUOcAWmNorLtPJm6rIAnJ4TOajEoxjk9
	ztd+hd5HGb8mzWXk4eM0RrUMsBe7Rt/TG+/8ZzhMbVnnJh/tVD8LwHxmi0rq6fS9
	E3iVRCctZNV0gwz9KrCalZWk8LmWqDu6gj80RcgKc4+Q1xO2lNa9jPWK2CwRTlHZ
	78QNsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn21aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:00:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso206898685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:00:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793822429; cv=none;
        d=google.com; s=arc-20260327;
        b=cpQO+5O6eQYbzHEoNRVspVUAuWmv7V/D2MYwUzZQeumMZT5B9gU98xSxHp9lAZUp+u
         B0SLwCgq3y7PwINYG4KG8z+ZIBZwJNbB1ykDWQRrn93eK/cwO1BXxdV1PkLPiDwaij/A
         vkqmcplKWKO3VZ5SWXOLqtfIzEqqaOOJEJk/24QQWXpodTf6us6M+/+y2KYWQAN4xRgq
         UQ+W9JHoX9ZNKCD1ycuFiRRXC0BRGTn8VyFQqDVNOIyzT4A3dUYc5f/sghKB9n1CmStn
         8Nj601CCbSs1Z30QkulCS2RCOk4sleHuwHur7qnhhaPYPPzYQcPURZEePxpWpuWQNMe2
         YdOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=;
        fh=OgSfCXjYTM37CrSbkNRsMK+Ya0yKyKOdHBuiwykhJt4=;
        b=fOmhmUKNh3H97ocYfBo6virMliIF0Hm2BWwqxrUA5pWW0GKBHejd8ssdZrBOtfphyH
         udpoFZETuT3UAESDyx75MGT4b2qWVOQggpkXLgdBk8nRJeJGJudZOilKsAgfhZS4aLtS
         rco9UEWlFg6Gz7sKI/wLRdmMNOb/+Fi3+mitfQTCTWM/YAiWFziXhpvC/WnQK/rvC0uk
         QSuj1ftQnDHGDmyYF9IKvVNE3mk+CdzBA4awvaewC9D8UxCMOdby3hvItUwaaeqdihTx
         g3HM4K8qxalTbWjMNdTNiwgRvpEiaC2h/HbdqyLUUzxUsgDkdUtipFmzHomZ1OlLmGbS
         +Xag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793822429; x=1794427229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=;
        b=ROR1pZAN3U28paNr99llR2FQOu4iWyXYH28N8PHd1zcNMtzt7K7CdjmeacyR1lcO5l
         1k8k/80Sf67i6ChVjrWrsGGlobxshKEf/zWcTBwca0gle0zFqwfB4azVDDZYKaSWwepE
         mRX1/21pRdfhNiboVODgexpPd1yff5JJnbjNr9BE3HGwwfnaqhmzwb+PmGmYm/268qu0
         vwcuCGVopJBdy6mefYturPhFzsQHgkLZihKjsCnf5B/rl9aNzw68pH/PynZazhtsoGgp
         F5dZyctZjIZ0U/6GEnnS4RXMe+G4iOuJ9oDHfLQlq8XRPMoT3vcIX42fABRve1HMyA43
         BZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822429; x=1794427229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=;
        b=wql+Fd4Skmze7smsc9mgGt4oxZcmiNtba9AwWitUkx0kCTtJ//FtB31W7Jk3jtNHvq
         RAisfIqR6ONIuA3fgQHRMGQ5/06J1oGPElhYbp8xSPpNejwGdgrLB9hCS90umU+VJIVl
         GZKaHLAJIixIQFTPELQHOfWTF6kaVAj+dc4AE320+KtpA4HzjiwhyszgUJ1Bef05CL+E
         kQ6xDFNtyy2HULR/e1dDiJbHi5DBtydzVaxLe+4dTIOyI9XuoVOJHdRedVgpUqHOzz6Z
         4n8mNmT9KVYW61AQkRsj99yVF2MFkmRA+DS2vjEHlemfSoEsVqHfbkMWDzyjhrRCzJmw
         LW2w==
X-Forwarded-Encrypted: i=1; AKwUvBzpxmyhcCZkt97TLDjpMAiC8CX/Z1xIxBKhYBEwcej/amasYM/rDmwc6PZ7Yr3MzBkXnBS//yII8RWFvYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zc112yHy5Cd/ayas7UCU9cT90j6K4dO9aC6LZB/UT9czc2UAB
	MGGxzyLmtBhIyDyjj7wBzqaldd6v89vJFYbGUdXyBSRHnTbJOREh4J5TqMNI4uLtdyH8EPzlNwa
	u3wSWAWoevDT9ZN9xzRwGubACOVcT2cZf/l5zKaDklCb7/CJnDJ2+8LOXECrM8epwSqLTdr2TSm
	zf1Zn7otwn30bl6XpNAVKQ6Yc0rmd0sHlSjWdn8DMWUA==
X-Gm-Gg: AYBFou3mHrjn3qcjXKy7KY5moCTGELXrYpmZR8zEmf2E2RofWLn5Y8lxUqBePurofYf
	MWIDvk3S+8JvMc+VgCEjc1BbcKcuYt8Spe/43kdAqFUdZa2mYPJVtdAmOn4vOoHDNnv/SG5K/Ks
	fYvNpunEWmSpMI/vv9Nl3js3FNvTXqnsqEVC9a97NF9KHJrd3l1Ub9MTuw6kg3U0IGbLOTg6wMu
	A9axkFIyHOfE0hsW6md3Ow0RkC9/rOdk+ypGHtpC5vg8HBBmK9CQMxKv5k8xC093iwelSReOiw=
X-Received: by 2002:a05:620a:472b:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9442171a086mr2894453685a.17.1793822429114;
        Wed, 04 Nov 2026 12:00:29 -0800 (PST)
X-Received: by 2002:a05:620a:472b:b0:93f:1ed3:a9cc with SMTP id
 af79cd13be357-9442171a086mr2894440885a.17.1793822428459; Wed, 04 Nov 2026
 12:00:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
 <20261103-camss-isp-ope-v13-4-c2cbf15a39b1@oss.qualcomm.com> <autlc2AfB8AZfb2H@zed>
In-Reply-To: <autlc2AfB8AZfb2H@zed>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 21:00:16 +0100
X-Gm-Features: AclHuK9N33CIyZcbZ2UGvyj25S6IIKINlhYmXcHoaT0FNmanaG6JsRfW5JzTXZ4
Message-ID: <CAFEp6-1qs-HmxYWcombWxyuPRACg5cQVrJs47rwrP8AL6xDrEQ@mail.gmail.com>
Subject: Re: [PATCH v13 4/9] media: uapi: Add CAMSS ISP configuration definition
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3OSBTYWx0ZWRfX3Gu3oEPjXLsr
 t2CMsiRzjeu7lfJ5/YotofowOxW8Aqtjbpgp+kfAf/XG9muvKUhb+SunAJ1+pFv0N8GeBoxemxX
 /xDmZAD6uChoNai9p/XW+qrIGHtjL+PRPZpIjIkTk+rOxxKDYYmQfRcsdKPMWOGUtWeRY8ZZYsz
 Yx8Bfvin22xA7j6+RYVfhqHwLVhG5gtq41rMMqxH1CQ4JAl8M7PIqKpiX4AmDwo97+WMAdfHIzu
 RCL2ElKaXikMaA7Ac5BzMtGt9wmYaCtMEyd7R7x6aozRUoc1hlms6ef2oaGv+CYkmaYfvkcDEVY
 wiM0tt2L3PGpFsFRY3n17pPKsEoY2lHfJTqRIAJsrK6MTrKlCIW9/lW0L59IbYmcHvCxMcaK8dW
 HuS41UXNKqwAg/EdBtzTGx3VhZoHoGiFldMbP/tGzbVEW84uScBxFKpT9o2JFa7gSQroRO3Wfzz
 7FORrJCqBiSyOfeuLBQ==
X-Proofpoint-GUID: vpozC2Yhaz8NESO3Hq57Co7phmIKMaid
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aeb8edd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=IEpJfH1-mEoR4trvuzYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3OSBTYWx0ZWRfX7uutbwNWZSTp
 IHIYdJdbPTlpbxAp1qYtigv7zmVFd4mvZdkvRmZxa4hVYPOihMvgwhXpDu8lKQSOENIhMIFCzKV
 oJcuWoqBY4KcIjqu7bIkNmsA0+7vaIo=
X-Proofpoint-ORIG-GUID: vpozC2Yhaz8NESO3Hq57Co7phmIKMaid
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040079

Hi Jacopo,

On Wed, Nov 4, 2026 at 6:05=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Loic
>
> On Tue, Nov 03, 2026 at 09:05:48PM +0100, Loic Poulain wrote:
> > Add the uapi header qcom-camss-config.h defining the ISP parameter
> > structures used by the CAMSS Offline Processing Engine (OPE) driver.
> > This includes structures for white balance, chroma enhancement and
> > color correction configuration.
> >
> > The block type enum is shared across CAMSS ISPs so that userspace only
> > has to deal with a single set of block identifiers.
> >
> > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  include/uapi/linux/qcom-camss-config.h | 217 +++++++++++++++++++++++++=
++++++++
> >  1 file changed, 217 insertions(+)
> >
> > diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linu=
x/qcom-camss-config.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..543c1682f8aed3b07d7085f=
54a24eb632ea190a8
> > --- /dev/null
> > +++ b/include/uapi/linux/qcom-camss-config.h
>
> We have (kind of) recently introduced include/uapi/linux/media
>
> This file should probably be:
> include/uapi/linux/media/qcom/camss-config.h

Thanks for pointing this out. I'll move it according to your suggestion.

Regards,
Loic

>
> > @@ -0,0 +1,217 @@
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
> > + * the @type field of &struct v4l2_isp_block_header.
> > + *
> > + * @CAMSS_PARAMS_WB_GAIN: white balance gains and offsets (CLC_WB),
> > + *   &struct camss_params_wb_gain
> > + * @CAMSS_PARAMS_CHROMA_ENHAN: RGB to YUV colour transfer matrix
> > + *   (CLC_CHROMA_ENHAN), &struct camss_params_chroma_enhan
> > + * @CAMSS_PARAMS_COLOR_CORRECT: colour correction matrix (CLC_CC),
> > + *   &struct camss_params_color_correct
> > + * @CAMSS_PARAMS_GAMMA: per-channel gamma correction curves (CLC_GLUT)=
,
> > + *   &struct camss_params_gamma
> > + */
> > +enum camss_params_block_type {
> > +     CAMSS_PARAMS_WB_GAIN =3D 1,
> > +     CAMSS_PARAMS_CHROMA_ENHAN =3D 2,
> > +     CAMSS_PARAMS_COLOR_CORRECT =3D 3,
> > +     CAMSS_PARAMS_GAMMA =3D 4,
> > +};
> > +
> > +/* Number of entries in each gamma channel LUT. */
> > +#define CAMSS_GAMMA_LUT_SIZE 256
> > +
> > +/**
> > + * struct camss_params_wb_gain - White Balance gains
> > + *
> > + * Implements the CLC_WB pipeline module.  The pipeline applies three
> > + * sequential operations per channel::
> > + *
> > + *   1. Subtract sub-offset (black-level subtraction)
> > + *   2. Multiply by gain    (colour balance)
> > + *   3. Add add-offset      (output pedestal)
> > + *
> > + * Gains are 15uQ10 (15-bit unsigned, 10 fractional bits). Offsets
> > + * are 16-bit unsigned, normalised to full input scale (65535 =3D 1.0)
> > + *
> > + * @header:   block header; @header.type =3D CAMSS_PARAMS_WB_GAIN
> > + * @g_gain:   green channel gain (15uQ10, 1024 =3D 1.0)
> > + * @b_gain:   blue  channel gain (15uQ10, 1024 =3D 1.0)
> > + * @r_gain:   red   channel gain (15uQ10, 1024 =3D 1.0)
> > + * @g_sub:    green sub-offset, subtracted before gain (16u)
> > + * @b_sub:    blue  sub-offset, subtracted before gain (16u)
> > + * @r_sub:    red   sub-offset, subtracted before gain (16u)
> > + * @g_add:    green add-offset, added after gain (16u)
> > + * @b_add:    blue  add-offset, added after gain (16u)
> > + * @r_add:    red   add-offset, added after gain (16u)
> > + * @_pad:     padding for 64-bit alignment, must be zero
> > + */
> > +struct camss_params_wb_gain {
> > +     struct v4l2_isp_block_header header;
> > +     __u16 g_gain;
> > +     __u16 b_gain;
> > +     __u16 r_gain;
> > +     __u16 g_sub;
> > +     __u16 b_sub;
> > +     __u16 r_sub;
> > +     __u16 g_add;
> > +     __u16 b_add;
> > +     __u16 r_add;
> > +     __u16 _pad[3];
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct camss_params_chroma_enhan - RGB to YUV colour transfer matri=
x
> > + *
> > + * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients a=
re
> > + * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
> > + *
> > + * RGB2Y - Luma (Y) coefficients::
> > + *
> > + *   Y =3D v0 * R + v1 * G + v2 * B
> > + *
> > + * RGB2Cb - Chroma (Cb) coefficients::
> > + *
> > + *   Cb =3D a x ((B - G) + b(R - G)) + KCb
> > + *   with:
> > + *     a =3D ap, when (B-G) + b(R-G) > 0; a =3D am, when (B-G) + b(R-G=
) =E2=89=A4 0;
> > + *     b =3D bp when (R-G) > 0; b =3D bm when (R-G) =E2=89=A4 0
> > + *
> > + * RGB2Cr - Chroma (Cr) coefficients::
> > + *
> > + *   Cr =3D c x ((R - G) + d(B - G)) + KCr
> > + *   with:
> > + *     c =3D cp, when (R-G) + d(B-G) > 0; c =3D cm, when (R-G) + d(B-G=
) =E2=89=A4 0
> > + *     d =3D dp when (B-G) > 0; d =3D dm when (B-G) =E2=89=A4 0
> > + *
> > + * @header:   generic block header; @header.type =3D CAMSS_PARAMS_CHRO=
MA_ENHAN
> > + * @luma_v0:  R-to-Y coefficient (12sQ8)
> > + * @luma_v1:  G-to-Y coefficient (12sQ8)
> > + * @luma_v2:  B-to-Y coefficient (12sQ8)
> > + * @luma_k:   Y output offset    (9s,  0 =3D no offset)
> > + * @coeff_ap: Cb positive coefficient (12sQ8)
> > + * @coeff_am: Cb negative coefficient (12sQ8)
> > + * @coeff_bp: Cb positive coefficient (12sQ8)
> > + * @coeff_bm: Cb negative coefficient (12sQ8)
> > + * @coeff_cp: Cr positive coefficient (12sQ8)
> > + * @coeff_cm: Cr negative coefficient (12sQ8)
> > + * @coeff_dp: Cr positive coefficient (12sQ8)
> > + * @coeff_dm: Cr negative coefficient (12sQ8)
> > + * @kcb:      Cb output offset        (11s)
> > + * @kcr:      Cr output offset        (11s)
> > + * @_pad:     padding for 64-bit alignment, must be zero
> > + */
> > +struct camss_params_chroma_enhan {
> > +     struct v4l2_isp_block_header header;
> > +     __s16 luma_v0;
> > +     __s16 luma_v1;
> > +     __s16 luma_v2;
> > +     __s16 luma_k;
> > +     __s16 coeff_ap;
> > +     __s16 coeff_am;
> > +     __s16 coeff_bp;
> > +     __s16 coeff_bm;
> > +     __s16 coeff_cp;
> > +     __s16 coeff_cm;
> > +     __s16 coeff_dp;
> > +     __s16 coeff_dm;
> > +     __s16 kcb;
> > +     __s16 kcr;
> > +     __u16 _pad[2];
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct camss_params_color_correct - colour correction matrix
> > + *
> > + * Implements the CLC_CC pipeline module.  The matrix computes::
> > + *
> > + *   Out_ch0 (G) =3D a0*G + b0*B + c0*R + k0
> > + *   Out_ch1 (B) =3D a1*G + b1*B + c1*R + k1
> > + *   Out_ch2 (R) =3D a2*G + b2*B + c2*R + k2
> > + *
> > + * The @qfactor member selects the fixed-point format of all coefficie=
nts::
> > + *
> > + *   0 =3D 12sQ7  (range ~-16.0 .. +15.992)
> > + *   1 =3D 12sQ8  (range  ~-8.0 ..  +7.996)
> > + *   2 =3D 12sQ9  (range  ~-4.0 ..  +3.998)
> > + *   3 =3D 12sQ10 (range  ~-2.0 ..  +1.999)
> > + *
> > + * @header:  block header; @header.type =3D CAMSS_PARAMS_COLOR_CORRECT
> > + * @a:       G-input coefficients per output channel (12s;
> > + *           a[0]=3DOut_G, a[1]=3DOut_B, a[2]=3DOut_R)
> > + * @b:       B-input coefficients (12s)
> > + * @c:       R-input coefficients (12s)
> > + * @k:       per-output-channel offsets (typically 9s effective)
> > + * @qfactor: Q-format selector (2u), see above
> > + * @_pad:    padding for 64-bit alignment, must be zero
> > + */
> > +struct camss_params_color_correct {
> > +     struct v4l2_isp_block_header header;
> > +     __s16 a[3];
> > +     __s16 b[3];
> > +     __s16 c[3];
> > +     __s16 k[3];
> > +     __u16 qfactor;
> > +     __u16 _pad[3];
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct camss_params_gamma - per-channel gamma correction curves
> > + *
> > + * Implements the CLC_GLUT pipeline module, applied in the RGB domain.=
  It
> > + * holds one independent lookup table per colour channel. Each table i=
s a
> > + * direct (not segmented) map of input level to output level.
> > + *
> > + * Each table has @CAMSS_GAMMA_LUT_SIZE (256) entries of 16-bit unsign=
ed
> > + * output. The number of significant output bits follows the width of =
the
> > + * engine's internal bus; the upper bits are ignored by the hardware.
> > + *
> > + * The module maps a 12-bit input to an 8-bit output: the top 8 input =
bits
> > + * index the table and the low 4 bits are used to linearly interpolate
> > + * between adjacent entries. Entry i therefore represents the output f=
or
> > + * input level i/255 of full scale.
> > + * Output range: 0x00 =3D black, 0xFF =3D white.
> > + *
> > + * How to fill a curve (same on all three channels for pure luminance
> > + * gamma; different curves per channel additionally shift colour balan=
ce)::
> > + *
> > + *   Identity (pass-through, gamma 1.0):
> > + *     lut[i] =3D i;                                // i =3D 0..255
> > + *
> > + *   Encode with gamma g (e.g. sRGB-like, g =3D 2.2):
> > + *     lut[i] =3D round(pow(i / 255.0, 1.0 / g) * 255.0);
> > + *
> > + * @header:  block header; @header.type =3D CAMSS_PARAMS_GAMMA
> > + * @glut:    green channel gamma curve
> > + * @blut:    blue  channel gamma curve
> > + * @rlut:    red   channel gamma curve
> > + */
> > +struct camss_params_gamma {
> > +     struct v4l2_isp_block_header header;
> > +     __u16 glut[CAMSS_GAMMA_LUT_SIZE];
> > +     __u16 blut[CAMSS_GAMMA_LUT_SIZE];
> > +     __u16 rlut[CAMSS_GAMMA_LUT_SIZE];
> > +} __attribute__((aligned(8)));
> > +
> > +#define CAMSS_PARAMS_OPE_MAX_PAYLOAD         \
> > +     (sizeof(struct camss_params_wb_gain)    +\
> > +      sizeof(struct camss_params_chroma_enhan)       +\
> > +      sizeof(struct camss_params_color_correct)      +\
> > +      sizeof(struct camss_params_gamma))
> > +
> > +#endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */
> >
> > --
> > 2.34.1
> >
> >

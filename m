Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793460514;
	b=FWd8vrDO4oK7aL9Yc2LQiN5fZAjf8jQEVMmtaZRX6x0gkXb17yPZ8aRNgcu8froiEoYB
	 yDjkT6YjSEMWru9xuOQ2WnTxEyUGuIv11FH0jdk6H5smNPtJ6HuhHK4xmlTQqmP+t9K7u
	 I+wZgJZ9ouetOsWDidqYaEVRhUSPud6VDNrLqwOOE1MVP/6l4P7Xx7ARFKpCXc1z66jk5
	 9ZJeSUzW+bQf4omhenQ6RljKQojKeRjiTP31qtrDVF++Bf7LwzooenudceMZtdpiJAIcx
	 cZFSP9Z6Ql7WtoyO+SETPbSOJouJFwYZ7Ct0UEl0UXwiVRzVB+gnZogUi7ioYZ8gwXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460514;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=;
	b=YBSUsZbkAjw5vWVB/21JPXzZNIhpk3LhTYdXgGzeM7EYMfCt0Wd030MXS3OC9xBW7NaD
	 EGaB0FmvAzAKWfJpURbzZRcHSYvsDUa9Xbg8qNQKJwwVjNJ2RstdnRZxTVDhhKcD30S/B
	 G3XCUlWxSwMM8eWE+LEXMhKiwFM2Yr0lrkTvk4VZlNmY94QHLoZpfdYdjfc2n64CEMLln
	 vL5nrjFufRDjNhdHly5ATvxZIFx3FwWMm8AxPC7ptZLOFycP0ExdDppTPYo1R3QIHPcqu
	 qxPFr2hV5HZQs92ANzPR6fy1cuy5AMfyQrbC5PyVZ/3VASus6z4Wx4Y1XCwX6uMzbCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XZLNe5kD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=azSBqzNm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A13606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88A13606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XZLNe5kD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=azSBqzNm
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0I0p3208789
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=; b=XZ
	LNe5kDRdCTsgzIsQk5zfpO5sEiFbxO2CNTuFoTP5VJyXH+UhBnzsk/MNA39YdJ1W
	QWDX8I5aZ8fw3NeZvo5gYtySWiHmi/mp7rqFFMtfL0WC5IIzT21BwzompCqdxGzW
	bPk6UZtW5PCoFs4ThsuKIrPwSOxyZesizOuxU49DEVM4M/mEtXR0t2jlUnH4s8BW
	5ZfJowD+Tbo4WHJyxAZG2cFJH5ZsIjgRRKK5w94RL2VF0yaX8Q2C8YpbGWgeT1WR
	uVGY65/XjDF9At0kG9kt54DU2kBU90fSzqf2X4iBFy9YF/A3VbG1BIk1NtNcdio3
	abjjvJbQ/pqbgXP0F7xA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rshv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:28:32 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-702f2edafaaso2288823eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793460512; cv=none;
        d=google.com; s=arc-20260327;
        b=bwUIEs1zm6UzbvCp2JN2rCovbKdhx2CuhXPtAbLz7A+Bte5UUwJjHJoI2kw4AQSQ+T
         gMEjNaYQQTOXcUEja3BVBRhlwg2X3pT7vwbaskhdmezQI+BbKGL+mC6v1vhojCa55aOL
         M8KVgQRyxN7bqzsFU8jyHqya4tjl4d30kHMTThfijoCV4v/cvWMXKNFjGzSIwB2XabDf
         wAN6Mqc6Axw2gxMsVWpSLvFp0feO9aAqPceRv8hBbkBhJTV4EB/3fzTQY2nNbpLHYDO3
         3BySzpHGvLGSEVlI2sqMU1OIrYTFouu8MSwdi1yiowWHF73VxdtoCQfTpRKdQ0BdUCgV
         7E8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=;
        fh=vkgNnl4Za/btYj6KpX5/5UGimK1Bhw/OX+VZ1+xqrUI=;
        b=sWXHMFHCUab3ifM3clZ5xSbSQW559cfhTunOABupykYLxlsMUxuvF0TPxKrfMeHdvP
         RjsewFsjDHaBcPio90jv5YvBuY9jh6ECzGd/em0CxPT6q6Ou47oWdJI5FSViQs+EkXjB
         QNEO3BPgh09idMWTt1ViOuBOpu+pOynV2+2zTAzIWCCMthNrRxXYMje6x7QAYhPGkoaP
         f9MWPXH+Y/IdTaKRSpWbZAYAzSn9Q0Q06bRtzC14lje2FDVt8VPngJ/xE84CRFEMPzLt
         EHjbwXS2yWwQQh4nAvMickAGvzWwUr5ye1iiT5U2vpsZnICxVMPfOBw1lQ5s9dQrXA/Q
         7KaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793460512; x=1794065312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=;
        b=azSBqzNmpY1n7I119xAFY7GtU0a8fOPOyMwHLkRHs4l4nnxw8i/wW80tX+VzWkAQe+
         OGpShbZhKqZSeR49uhWwlJaxKNd4UWrOj22LujDcgmV18N+3quKDPOCTv64SUWL8QOQj
         9Wre5RWpIoU8VB/ndRhvfI482SEsoakwjmvV5yVZkk7L0a02IqwqDTTJ0KebBIRHwlm/
         ezrI5Vx1NhLqS1cs6ts0Fnsrtm4WHwpvZWXS3nMEMcRKNrfUGJzr9VFMwALgxKw0hQw3
         kXC/Z4LZ5pbzIiIIUSTftRaRLAMj4vYT9rtJqqLLKp2bJ3nNiUH9YEDJfn0Fdmilq/jx
         gr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460512; x=1794065312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=;
        b=vk6hdvpEft0BSrtcP8JbAUsHo/w//Z/AdvN2bg3kSjjKfQJBD3GtA4ZHUfCQoYHMUU
         fdWncquF7/+ddybdkm6rOE6zpVDTioKCHMGuZ1MspKYnSIK8t4uodNOICWSsCSS1A+Nt
         G90PdrQuzscdItMJwfoWykXsAJlAD5XmNHHkGqM5gZYHQX1cqGB+RjArCoYFlXxp34G9
         bxvGe2gwpI3NXj4O7uob+eML+G5RXEHzk09zUEe8GJ4ASzwDBXwSb+SLcJUywtKaKIHS
         WLsaNLreEEW8hetsbH6Cqp73kBqN/ZGnWNJpjZ+0SBwOL8gX9Toj5maEfMFeOW9iaozI
         1nfw==
X-Forwarded-Encrypted: i=1; AKwUvBzEgVHlJZB3LdkpZfaag6VL0OX1pYiPY2dyJYbrwKyy25QmbV2fsvtl9R4kjdcWi2yhYQHOEOuwJqGKbjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAbzOyH0x4LaXcRfL47r0YBDTAKOR3e0DXXliRKlqBfuvN9oZu
	ABxQl0O2zo2N/IqU52K3+sS/uptXue+aKF0BPL3tkOtQpIxRYg/co3olPFgUrJNCDAsuiUMwCXF
	G26TCOgF/mTXU0TxnQiFPEgVCrO8srheAltp7Cs/1uTT3io/zl0sj6EYvwJipnMtfTOK+bcM6vR
	lfaQaogpKqTe00e30fFlfJUvBG0Xy2Pett7fR8p05IAu1HxswMGGNC
X-Gm-Gg: AYBFou0ki3Xf0f8RGzJTGeopA5YrpBjVvV8yDatpL9Z5vxI4KszzTDSis/hvoUbj45w
	+2+farP/x7VdVGcpuVvoijB/H3Deddt8UqrV6YeGzWwsec01kJRNUOPcuSJF+fILZjOa4Tibnt5
	NfNkw66kS72GzIcgDFyzHaDAAVg3BtNG7ojdLc2KTYcjnRgGBFqSr1bZFsIQ==
X-Received: by 2002:a05:6820:5616:b0:702:a3b3:810a with SMTP id 006d021491bc7-714f241202cmr2221793eaf.22.1793460511701;
        Sat, 31 Oct 2026 08:28:31 -0700 (PDT)
X-Received: by 2002:a05:6820:5616:b0:702:a3b3:810a with SMTP id
 006d021491bc7-714f241202cmr2221784eaf.22.1793460511233; Sat, 31 Oct 2026
 08:28:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com> <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 08:28:20 -0700
X-Gm-Features: AclHuK9eauWalhgtTBC2J8Fwe5Mi3Jn1yWHBYz9zSLaNIZfyReKOdimAawUMQ1k
Message-ID: <CACSVV033K2=PUfZPHfZnUq7ACmU0wz8iw7Mev6YOWJ7s+h7iPQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] iommu/qcom: Use identity default domains for the MSM
 GPU and display
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: wzLQFAa4BAyDMDt9hig_FLB_wyxENG-U
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae60920 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=Yhi7VFIheabn5aZjDpkA:9
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX8UqBcl39wX5t
 2lR2wHWyEOmKRQ5f8NG1FgHJnfKEUoIezv/wEUuLPg/XyKya5qIFTG/UMoCd7i225iWZ2FgaWKU
 3vX9FzENzYnxHIREtvTyeN2Xem4dfWo=
X-Proofpoint-GUID: wzLQFAa4BAyDMDt9hig_FLB_wyxENG-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX1rvw2b5VOUjh
 hg6g+PotEEEzj3lECigXJM6MehVqBBLR9+IeGq++pKgXSaWj2Ajsu+uxLMBZfMpzWPVtI4ZNm9j
 FlFlLlvAX5yM1RqkjvnF45Zbllm/WLJ8SBqc9GQ3BrDqTp5BzP6jhFkaDu0TqFoUb1rO590z0Np
 inVdPxndXoQRi+3Ua+Av1EsRLEDJEDW5evY6rSqp0PzHFgs3R4OFAJegebZ3tNyDNsniZmRtROB
 xKkf+/isj3aKvZR+GFYcI2dlQ+lU1xs8XlQC94rpcZ+bYCHYpTUMgycDvf0aEtjBDt2qfjxoDFI
 OwpNemNaIjz5T6WZX9a3Fwo56vgEKPuCQ9d9Rb3rj5wASCm9TAwBCH0toeUQOCsWxbh13v10NYu
 4ln6smtQPrs29iw5bopaPKNLukkQXlSGReDz8QjrQrDuhGQSQsx9IAe7dU6eMcon+SbJezMbb4Q
 ty2AmjaOtIKI1qGzT/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310061

On Fri, Oct 30, 2026 at 3:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> drm/msm writes the addresses dma_map_sgtable() returns for the DRM
> device into its own page tables, so they have to be physical addresses,
> i.e. the device must not use iommu-dma. qcom_iommu has no
> def_domain_type, so the MDP5 and Adreno devices do get iommu-dma, the
> buffers end up mapped at IOVAs of the unused default domain and the
> db410c GPU fails to start.
>
> Use identity default domains for these devices, as arm-smmu-qcom does.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index 54130c32056a..4a9c4cf63724 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -22,6 +22,7 @@
>  #include <linux/init.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
> @@ -531,6 +532,18 @@ static bool qcom_iommu_capable(struct device *dev, e=
num iommu_cap cap)
>         }
>  }
>
> +static const struct of_device_id qcom_iommu_client_of_match[] =3D {
> +       { .compatible =3D "qcom,adreno" },
> +       { .compatible =3D "qcom,mdp5" },
> +       { }
> +};
> +
> +static int qcom_iommu_def_domain_type(struct device *dev)
> +{
> +       return of_match_device(qcom_iommu_client_of_match, dev) ?
> +               IOMMU_DOMAIN_IDENTITY : 0;
> +}
> +
>  static struct iommu_device *qcom_iommu_probe_device(struct device *dev)
>  {
>         struct qcom_iommu_dev *qcom_iommu =3D dev_iommu_priv_get(dev);
> @@ -602,6 +615,7 @@ static const struct iommu_ops qcom_iommu_ops =3D {
>         .capable        =3D qcom_iommu_capable,
>         .domain_alloc_paging =3D qcom_iommu_domain_alloc_paging,
>         .probe_device   =3D qcom_iommu_probe_device,
> +       .def_domain_type =3D qcom_iommu_def_domain_type,
>         .device_group   =3D generic_device_group,
>         .of_xlate       =3D qcom_iommu_of_xlate,
>         .default_domain_ops =3D &(const struct iommu_domain_ops) {
>
> --
> 2.47.3
>

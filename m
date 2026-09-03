Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0445338332F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788410733; cv=pass; b=mWtYsWQCWVbhk64p7ufIGP9i1tUfopDct69iWr/jOdJ19kjchRhtkEJHSea/G+uOTtOCVdCNZ+FJS9qD4MFz/XxwFZUZANrZmgAH4dG7GhzQq6WWw4E/nIHaF9WDfSWGCxHKLxK1aMQxYJMekMMi4PEozQOE28PscP/Qk/h+GOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788410733; c=relaxed/simple;
	bh=zI+ifEyxByjM6Y9TrkSsIST3zFDRCsE93qCLJwvC3Hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEbhKCBqAkQvxDHOM1W24vVHaGKcytqmOaugQgcsiwP+VLlSoHo5bk7kiXsVaU28pW2aTe5sTqeXgIb0iTK1Y63Hgh96MrHAfgICRKDtxGvCvB01gSSK1+ZcEDWNnllQnUtiBFxSlx9vPGrFyzQVqMw5VLWh0EQU8LJmOrkryTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GT6WQFDv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQ+jA1hy; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GT6WQFDv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQ+jA1hy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xwBj2751676
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 04:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Sc3WkFAgGyNV3trhZQm/9QMD1pz+GBXUg/MNSusqdCk=; b=GT
	6WQFDv9pLArywxCmT3lPlnoXr2OAUvu7mqcefxYUUQuUunKAa5VlMOYVhi1XHofF
	wNp7i1KmIYwmZiVe735eI4cQHXKDmCFkr6yMJdPFaUc/NwzdHYyHYzUClpEYYgie
	yvQv0yMi4H5DAe8jPsq4Xb1aXKV4a4AH592GoLt4RMYMq86gHdsyJ2gaU4UQGByS
	b0gSWRpCIJPxNqaNqfgiDWP0Df9bwLAp4TI28lcvgSpD55UJxpE/3ynVVsLXxaJv
	k02kp6hfeHLbzushzd7gKW96sI6q7AiOPsWX1ak+MOq2YWPSgXTkCDWH4aKaFCvG
	hVD2/xRAwJBROlTjq2IQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjramh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:45:31 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7f5b54da461so32753697b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788410730; cv=none;
        d=google.com; s=arc-20260327;
        b=W6lRQ286ohPKBb73v3C3o79wwLkINT8USvIzW5C7RUD5AgtLumrgGBPag8dvgeW+x9
         +CZ38rOUd2BFg6QqUwXrWq8ectvX9rqBS+uG1OPNwDcp527ee6D5LCIOuSrwnGx1GQAQ
         dx92G66iUo+SwZnaFsDceO8WFYbWBAmWEIzpsk6rawpxFDAItP3vlq79ctwjG3umCXw1
         GQWBG9wmba3ZsaiwFrKSGO3KOOPOEubzKCCctwtXFgzmarwrNA+uGi5RU/WZB3O3gvjZ
         P7RncD+BmvpOouPmrF7V/9/zRW5+RulSvqLVbpnv2C6UAjyLI8jgv5DioFqdrLnXazYA
         n95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Sc3WkFAgGyNV3trhZQm/9QMD1pz+GBXUg/MNSusqdCk=;
        fh=+ppsHBRXrrAUs8mrUmknXI/KpYa7MeFDMM3uyQtqUho=;
        b=fsxdCaBseDkRpoc9nUJtNSvVAUdY3Yk7kLOI+Zw/58iFth8dNxWc+HoFkuihICzC3E
         Fijm8CRlFMTYUVXg2asJWKITCXA3NjfY5R8hGJyKjGuobWINM3WzleDovMbRda9yfprc
         UvyFVD7T2HDI4qJtiZ42pUDuZ2U3tzlB3+WGnh+SYdM5iPBihkRXrAd4s2HPf2CuW19N
         nlSGgWD0qGzPNkP0oHox7rYJ2P7m9JFqVKUOBRPgcTauPMHFKTD/QYKMxzUFyP6XCEhn
         287j7MZqIXmCeLc+bUoCdMkiiFC0+HCTQe4+bVS4zqTt/uQwAqVl9lOeW+0AzZVf5rKU
         kDsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788410730; x=1789015530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sc3WkFAgGyNV3trhZQm/9QMD1pz+GBXUg/MNSusqdCk=;
        b=MQ+jA1hyaEbvKWipdi9ZoxVrVootKLkGlwXwikdGWvv84ML6DOAUR3Boqaz6JZCitW
         F/KLSIgSImg5jmnD+5CmhY6ZkFyqETGkAi7YNB4lNTA7bdW/bS5tkuU6VTP9KHVg7Q30
         tD8YoM/ewXlypHYfzR/2hrw5bnMIaFWdYw+8XU8vhAwQ0kSopKMgUl5gKaalxxjnbIQK
         gHlfOIx5DHQ+X2mmoNscFFOAnD9eb1M6NVrNEs/UnesZN4luJLKcbFCEchk4q2fZMn1f
         qt3aPQuW7xcoBqS+kU5cFuUZFX8z9ODeIZwZoQkqAIZmmTjZgiAy4OZHaYqcM7OJtQ42
         w68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788410730; x=1789015530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sc3WkFAgGyNV3trhZQm/9QMD1pz+GBXUg/MNSusqdCk=;
        b=RmLqGHc+DG2achgcYbprv2OtZ9LC56A+tX0wDVT1yKWAwMuuq+qVyifR2iUsInxLl3
         97UydzK+dNCm3+BsRe2k+oKyVPPhvWpKZYo7Rkf/KOE0pQUCUb8jR+WVUE3n0fjPEHm1
         J6C+tkSSgUZ+f2NK/p5CLmu47XWcMWnOUp1T6knV9Kk4tTZzqM3jBCIZs4mp/BXUa92T
         2yi32SvHy0tBzOlZ7SAyMo7NUV9V3FUohv9Obzd9WIgeMjQ+Y+HvWVW4gaGI5v3UAqQl
         E3VRnJC9xy7d+lB9aaeF4NLu7yQTbR6N0tTGsAemi7mTU4626II61bsWulE9zvx6SgXi
         JGhg==
X-Forwarded-Encrypted: i=1; AKwUvBwnyycA8lkS2oJC1xkn2D+wBhAFFz9bpY7H63It77/qvHF/vj0E5+nqjKlcv1orzb0K53v4cQ4h3e88OVo=@vger.kernel.org
X-Gm-Message-State: AFuF++khyW3E/1zIsDnY4ujFTs7qAcT38WwS/j62y3UEOQr8VB4jy5J+
	Y0zN4jE1fk/4kHrBXOAJDFRHwl5oxqRO/0UWMY7++0LrK0YkhxhS180yYy61Vi/lpqz6hnKdDCn
	3DVfLDJXpvUJ6Mow17mVVHXvdKEAYJjLKW42T1foP419jLXMZi3iwelgUIV3PKiUnL6usyVWPCb
	VK24NQzLGrnIaBuFhoSIjTua44HvSMOa5Az/LOy/eH3JJQisouUzr9
X-Gm-Gg: AYBFou0PGbxjQmexSbW442B0sTNX7tlbDDZAAv3lSsmub9VHh3LJYqsTE9Tw22WaUOy
	17xkgPwPEpY44BHu2FL5d+VW2219vbDNu7JgfeWbjCmVJn0u9ynLMGzRj4ezcb+cflMjNItQ3eK
	Z4ko91htFHJ9jXJ63Dm65Io8GmLPuAZDYDV2w/em5BXO2ub7UfQU49tFYa6A==
X-Received: by 2002:a53:ac93:0:b0:66c:85e3:7f28 with SMTP id 956f58d0204a3-66f9be6b625mr3646102d50.48.1788410730227;
        Wed, 02 Sep 2026 21:45:30 -0700 (PDT)
X-Received: by 2002:a53:ac93:0:b0:66c:85e3:7f28 with SMTP id
 956f58d0204a3-66f9be6b625mr3646094d50.48.1788410729854; Wed, 02 Sep 2026
 21:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902140145.42094-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260902140145.42094-1-fangyu.yu@linux.alibaba.com>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:15:18 +0530
X-Gm-Features: AcwNN1UQoEUyCiHFoU50MMSvS7TZQc6s0bZHcLqzyxXDTbBAI2PWHTUKR2JHNJY
Message-ID: <CAB19ukHwcDnApuWcn4MWm=bJZS2=UqbLT2=MnpfsJePG=qA_wA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: RIMT: Enable PCI ACS for root complexes mapped to
 an IOMMU
To: fangyu.yu@linux.alibaba.com
Cc: sunilvl@ventanamicro.com, rafael@kernel.org, lenb@kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, guoren@kernel.org, linux-acpi@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAzOSBTYWx0ZWRfX50b0VNt54mAZ
 UantEnvn2hbO0NJYAvre4IpvExshaOY/3+ozo1lOHq7xkbMFokGsvIsrQ2acxTv1CbFpPGCyhN6
 ckKLReBxckBfM74Jv2ThQja3D4K4k55yjT/xecS1+pV3y2wM+XG5JIq5xPtMGNOsHZG8vg2Cgkv
 zuw2anHod3YA2l31T6GAND7GpRG5wSszddfVklG3lAuzGSaIXW1c680tMMky8hma6LFtcHUSLUS
 xjPktz2OEFmv6cSX8a6j39v9bba2/B5UM69n9p3MNF2s9JVLXkUp/OkA99p2Ya/aIIfMp94VmKJ
 6GbGcYsY+2fHc7M4PQVpV2lVe9z6lgyGh44kfaoz0LH/Yq42QcQbK5nFvaEVA0GS3MLomlUdNQl
 s2UvD1E4RXg9wk6oXEC+t5NXhb5q7hykM2yrGlbyVvuKjufaxizz2V9iW/AU9FBhsZooFeY5PHi
 LzGw5jKciO/y50T8UjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAzOSBTYWx0ZWRfX8ripoxshzWSZ
 P361kyiklhFB70vJglCSdIBwEG4Qe1SVI0+hayG+meGvKb5zBBpjYpINMtXBVYWBHD2xoP1sgir
 opmvsR7uMzPHpWCQs313qPTljIh5xM4=
X-Proofpoint-GUID: bx49Ijj1S-k1tVbssenVqPPtsI_FV39-
X-Proofpoint-ORIG-GUID: bx49Ijj1S-k1tVbssenVqPPtsI_FV39-
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a98fb6b cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=wQ6y6Ln1IUvFgne-YVsA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030039

On Wed, Sep 2, 2026 at 7:31=E2=80=AFPM <fangyu.yu@linux.alibaba.com> wrote:
>
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Mirror the ACPI IORT solution used on arm64 (see iort_enable_acs())
> by scanning the RIMT table for PCIe root complex nodes during
> riscv_acpi_rimt_init(), which runs before ACPI PCI enumeration. If a
> root complex node's ID mapping points at an IOMMU node, call
> pci_request_acs() immediately, so pci_acs_enable is already set by
> the time any PCI device is scanned and pci_enable_acs() runs.
>
> Only one call to pci_request_acs() is needed regardless of how many
> root complexes are found, so track that with a static acs_enabled
> flag, same as iort_enable_acs() does.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/acpi/riscv/rimt.c | 56 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/drivers/acpi/riscv/rimt.c b/drivers/acpi/riscv/rimt.c
> index e4538fa6c2c8..f22e28c8211e 100644
> --- a/drivers/acpi/riscv/rimt.c
> +++ b/drivers/acpi/riscv/rimt.c
> @@ -179,6 +179,42 @@ static struct acpi_rimt_node *rimt_scan_node(enum ac=
pi_rimt_node_type type,
>         return NULL;
>  }
>
> +#ifdef CONFIG_PCI
> +static void __init rimt_enable_acs(struct acpi_rimt_node *rimt_node)
> +{
> +       static bool acs_enabled __initdata;
> +       struct acpi_rimt_pcie_rc *pci_rc;
> +       struct acpi_rimt_id_mapping *map;
> +       struct acpi_rimt_node *parent;
> +       int i;
> +
> +       if (acs_enabled || rimt_node->type !=3D ACPI_RIMT_NODE_TYPE_PCIE_=
ROOT_COMPLEX)
> +               return;
> +
> +       pci_rc =3D (struct acpi_rimt_pcie_rc *)rimt_node->node_data;
> +       if (!pci_rc->id_mapping_offset || !pci_rc->num_id_mappings)
> +               return;
> +
> +       map =3D ACPI_ADD_PTR(struct acpi_rimt_id_mapping, rimt_node,
> +                          pci_rc->id_mapping_offset);
> +
> +       for (i =3D 0; i < pci_rc->num_id_mappings; i++, map++) {
> +               if (!map->dest_offset)
> +                       continue;
> +
> +               parent =3D ACPI_ADD_PTR(struct acpi_rimt_node, rimt_table=
,
> +                                     map->dest_offset);
> +               if (parent->type =3D=3D ACPI_RIMT_NODE_TYPE_IOMMU) {
> +                       pci_request_acs();
> +                       acs_enabled =3D true;
> +                       return;
> +               }
> +       }
> +}
> +#else
> +static inline void rimt_enable_acs(struct acpi_rimt_node *rimt_node) { }
> +#endif
> +
>  /*
>   * RISC-V supports IOMMU as a PCI device or a platform device.
>   * When it is a platform device, there should be a namespace device as
> @@ -509,7 +545,10 @@ int rimt_iommu_configure_id(struct device *dev, cons=
t u32 *id_in)
>
>  void __init riscv_acpi_rimt_init(void)
>  {
> +       struct acpi_rimt_node *rimt_node, *rimt_end;
> +       struct acpi_table_rimt *rimt;
>         acpi_status status;
> +       int i;
>
>         /* rimt_table will be used at runtime after the rimt init,
>          * so we don't need to call acpi_put_table() to release
> @@ -525,4 +564,21 @@ void __init riscv_acpi_rimt_init(void)
>
>                 return;
>         }
> +
> +       rimt =3D (struct acpi_table_rimt *)rimt_table;
> +       rimt_node =3D ACPI_ADD_PTR(struct acpi_rimt_node, rimt,
> +                                rimt->node_offset);
> +       rimt_end =3D ACPI_ADD_PTR(struct acpi_rimt_node, rimt_table,
> +                               rimt_table->length);
> +
> +       for (i =3D 0; i < rimt->num_nodes; i++) {
> +               if (rimt_node >=3D rimt_end) {
> +                       pr_err("RIMT node pointer overflows, bad table\n"=
);
> +                       return;
> +               }
> +
> +               rimt_enable_acs(rimt_node);
>
NIT: Can we check here itself if it is a PCI RC node and then only
call enable_acs()?

> +               rimt_node =3D ACPI_ADD_PTR(struct acpi_rimt_node, rimt_no=
de,
> +                                        rimt_node->length);
> +       }
>  }
> --
> 2.50.1
>
Otherwise, LGTM.

Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>

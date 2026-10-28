Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207782;
	b=snXkAue+E5vXOzVbSJTYBQg8aTybu+BfW7RnjNSfo7Xi2kh1lh+sGo913in81MOMoEBo
	 YmG/o856cU1h082L4GtMPbmYbmmY3/6C7itavbPaZTQm/Ndx/7gObhzJV0wlx37xoW2tR
	 EB1HMyZmmptQJkAaYMdxlcg8RTFQryriA3NJEjsIBqIiJYMzizGI26M7w0NlWCRNPOwd4
	 BumJK/WtnPP/UfPzabiykf1Xl/oe9NJdr5to4WcTXwrmkeW+UsFzVe3MoTz4bSV0hlp+H
	 Ok6rR9rA6n1sFYH5d7WkFLdUEohT0VGLtJfUtTdZliGCrP5Lc9ZIqaTD3hhzI3TI1wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207782;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RvdKRTa71zGBb4REkTJXLVVYnsNBImkhzu+/0ATTfes=;
	b=edYw24DVq75cc3pgNsoorqRypxPD7dxaQXL/hCkDUmpulDnGEMbab/rcPDbEaNg6QX+n
	 MA2TrDhCUlBJd+pO24HFfQezmazEeu+JiHd1kMnhBlTdOeVWZA8jpsOnwsyHx56Qc6PUw
	 xINZ3e/PlozmVg1VWZeEzBoMe7xluNllZpFFTHnMlYTe8ARDJEAHruPyuXGoKThEcu+MS
	 03k632pr+hOqxkdu8joiC+hbTiHgo2U5SEzN2S7ZOfMVULP6uXcU9v9bXaZNIdv5iikJG
	 SwNqLV5opYckwVWuxSBIv+tPZ3gq9/CQbY8maZyNYsrRujjTrcy8okLTcG7E0KDhkRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hf1AoZ1+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7B3cPx0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7323C606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7323C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hf1AoZ1+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7B3cPx0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAXJn1153211
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RvdKRTa71zGBb4REkTJXLVVYnsNBImkhzu+/0ATTfes=; b=Hf1AoZ1+GDgRnMJt
	4Q3unm7eZ2r4YHQEr2bRWT7MNtJMIXzg1cvD20v1VVvoKGGXpUWUXOa5YxJajsDy
	E8VTjy3oHhDyhBQLlXMHJhXhEMQVUD+77QbmptNhKTsUDCmc5/0PLj1nPfaAecD7
	aD+OXdLOrZKoEVOtgfZDuAH+AZu9aA989VuPVv2BPKsOxeMJtcbWLVQPyPdmjWcm
	y++fEmqehy5v7PH2LdLZeXL4qJAAH0cVqqa6jjRw50cBdZhCBaodJciBmqbH67If
	Qkx9GFDgp6cfXTOW7gJw7Z45JWoqqwCvfz+obk9pAckBEO3Ilt36zJVva4X+Dxzq
	QfHPdg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be3pu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:16:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea71803effso12411675ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:16:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207780; cv=none;
        d=google.com; s=arc-20260327;
        b=kwqLz1j5EoquLcUB+maambt2UgeyizI9agMNTJKsXAMS2nrHU5NNMELEsOnK07lQ7b
         AxEkMXPDZfowL1kGPBbBL0DozW61rywdvhHBf8zNTA3mIogE2kyX4xCHrApJGkZVXH2r
         8HxgpYV2U4je5GJmco1zCY1Qox/Cm3bJVAC1gIQU+5NzzMqLeyJuh1EBMxbbeOP3TQ8M
         7Z93GsgY72nBFLPYrINnK3RzdrW34xBLlOSblRFsFKYRtPS6R5erep8/ILyRoQkxIlck
         jY8JauT/o+gYkMYd0aef/rhQXYi1xpaaH7kFNdFZmZBUDlvZIJxnj4FGi6/vrgfXBhix
         fFCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RvdKRTa71zGBb4REkTJXLVVYnsNBImkhzu+/0ATTfes=;
        fh=DIT0/yvWeTkv03ZNRTQ8GK+ZRGh8cBtTobbtZAM6e3w=;
        b=TeL4FRw6hv6ifX8BFj7tW6rOMMcQl8QW/G3ESQuW1LILnkWNs6j4UGIh4epiGPGOMn
         pVsn9VcjFVFlj8wkJpTQCAvozvc04KrNNN5QOTN/LL4nGWb/QPy7+6ygGePNRxtiwYDj
         YeA1+DgZMoRbXvj5pM0HSjFmgCSHqKDAfy+1S3R9UuBlqofIEel3iLSErN8TctWI4Nc0
         2KzctUtKQbKd0vo6h4hK89RmJUXxueTCI9iMaSX9wBeQbB642DMUeZRHYNqAUzZqYG9Z
         C8+H3lvMswLmNntdv6fraGEADCwau49/8/UpVwURrXtfcRDy/oHSp4P4SKe2YaEMPRJG
         +1Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793207780; x=1793812580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RvdKRTa71zGBb4REkTJXLVVYnsNBImkhzu+/0ATTfes=;
        b=c7B3cPx0Ve8xe3s49Lp68zXsVROrY6oc+vlGpqTzpDSfOdKcLHJFRtrVnA0UTpq8Ba
         MDg1Je0WIDzx7nQoofmnWriTEsGxsWtY6YAW1/G8WUtGem6Hitbjh0sciIqsGzs94m3o
         +ltBLML/s2bqJ9eu32TOxHR3X4UIphnUYtTomaC7ER0MH2amjuHsrg4zatW83/p9s30G
         9HBH/F79GUXbsFd1up+geYrFmbNmFik8NssyBOR7rW1d6yd8pWpD7uMZf/vveImj9VFz
         Rqe3N6jVrBkf1UwATIKSKAOD6F4oc5RTPfBh0CPUwYqkCFw6iOQ5EW4WnfeMeDoPYzuJ
         WPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207780; x=1793812580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvdKRTa71zGBb4REkTJXLVVYnsNBImkhzu+/0ATTfes=;
        b=uw/fTk7VsLPMPziK7fj+jUXW/aCvm0MI0nzrSN4Rk1g5xD2+hBokriG2Km2h+gg9u/
         VOXSHXNWKdZmLePX2K+o6PMGA6LUW3PgdDoYTnBRQoo5/f6VSWbTXK8+Vz8NykW6QLfq
         rYU8NUM/2MqrftuXj8SzC2Nv77YDP8h41Pv6wePgLxVnv3QCKQIrfiALHGnpqb0YrT7x
         rGQXtlvQsnid9CgJ/drvfvDKDCxhq5vq9lkbNWt8ZYhvPzlZBtN8A6PgC1R7Nm1OwOYE
         GNpQPw8bcXbxlAhgx2xvJWF6DIitvlZK8kIo/tLzoTo1JAQKTxBZhFsDinT1TafF0v5d
         XoaA==
X-Forwarded-Encrypted: i=1; AKwUvBzAFJTvVfRmhYk7W0EoUrI4sxSOXMhqw5ctQZfiBa4I+/zH9lUj5PVm7viBxIquhYE04+EA/o1V4rIrHxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJInr6FVlaXlWSAlp/7YFjNRaRKH2juAaKNm+Vs03o0zd3tJ9KC
	BquuH2jzJO0/O75ZLWKxi9Uj0mkclRJ01uFyDJ4w/jyfG/nWF4LrjfKjjhf3ZEfmVzTrqkwkYgA
	TudFRuZziSeX944kHQm6E0Cgtyh1ZANCbpZMUI7Xi4BaWcx8suAAxRIiOKGeqJh4/XaGdZ4bRGS
	6JR65/MQuxGcH5S2WGmW6z9bmmG94O3+WScEiOB6ZMQA==
X-Gm-Gg: AYBFou0lOCDtVagYKL3Cb/0n6DvGhmH65nIzhkR17ACNpDDVXtcrQty6mMVGVuVjC5q
	SEoVy9PeLRaCL527OPO6Y985EjeIJBB8ujN+zpQuqtSWBj4I7Xe5wBWcUJOoihjYvpcRHgQR4Zm
	vwpqD7dZ1sHtlhmyKCUTosVdYkYWsAO61jU5Haf0qNlC4XvM+o4UPYukB+OA==
X-Received: by 2002:a17:902:e94c:b0:2e9:9524:b004 with SMTP id d9443c01a7336-2eb0052c6bcmr23727475ad.59.1793207780408;
        Wed, 28 Oct 2026 10:16:20 -0700 (PDT)
X-Received: by 2002:a17:902:e94c:b0:2e9:9524:b004 with SMTP id
 d9443c01a7336-2eb0052c6bcmr23727325ad.59.1793207779945; Wed, 28 Oct 2026
 10:16:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1791722984-123689-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1791722984-123689-1-git-send-email-shawn.lin@rock-chips.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:15:50 +0100
X-Gm-Features: AclHuK8Lf70SdY5DFZSw3EQaOeBBl_QiZ3i-ZXevSvTPJeE55HTbxUKaxs41DMg
Message-ID: <CAPx+jO_pCiU9qG5swLz6CExPUE55=wp0+pQ62j8wAhrvvaXAYA@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: fix wrong comments in mmc_ops.c
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: dLBzajw5ZpwhQO716nB6mhx50xQNwSvK
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae22de5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=s8YR1HE3AAAA:8 a=ZTRnR9ALD0t5UWsEksAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX/hebOo3WKm6o
 FqYBcfkEH2ld+fUiwCfvC4GFY2SS4YeXPRYz/bW4LrFHq5GRaGysqLPFHoKxyl6Rk7c7+5/Tlu3
 Hr4zzajJqJiQevKy0IgjLXCzvNFklIc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX4qJ0M2zdF2EK
 IN9aSPgpZXY8xSLGULaxr6mmPlC9qEMAvlMgTaHB5RQTjVYvj79NiZjid5hxvHhbCP/hXRywdkK
 +iveYe1WoAYuCvxe5oaNtncjWKjAVknPMbnDS8lz65E402YlRT61/fJh8lUjXcs7NVsizX46yla
 Bw6xWAxYIDfLnlpipPz3lYVFlJgrJTYmgntT2gaDBaCdg3CCHhGJBPIjuv1O7ogCXz00Og6EwpT
 PZhetjoF+lnGAz/XxK7mC5M70t4Zu/UxlNtWEkDMBjatr3cR8ag6I31OQyoSGfiuq23kggtZdxm
 yUNMaO0AQEdiugHDcZb9WQOBZJfSPq6/CdDz5zgEbl1WRe2zK8GaD68dtVMpMJriruQw2L4xtxH
 yca07LU8MainX/BkB3Z6L31D5GTmqHDZLboPASmPA9fj8rP+eDrcHEv8tjmeYOpUnSsXJFtTDEJ
 GSZph7jaWOY81iyoA5A==
X-Proofpoint-GUID: dLBzajw5ZpwhQO716nB6mhx50xQNwSvK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280068

On Sun, Oct 11, 2026 at 2:50=E2=80=AFPM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
>
> From: Shawn Lin <shawn.lin@linux.dev>
>
> When seeking to use mmc_send_bus_test for eMMC HS mode tuning
> to workaround a vendor product, issues were found with these comments:
>
> 1. In mmc_send_adtc_data(), the comment refers to "CSR and CID",
>    but the branch handles MMC_SEND_CSD/MMC_SEND_CID, so it should say
>    "CSD and CID".
>
> 2. In mmc_send_bus_test(), the NOTE HACK comment about reading CSD or
>    CID with the R2 response type was copied from mmc_send_adtc_data()
>    and is irrelevant here: the bus test commands do not read CSD/CID and
>    use the R1 response correctly. Drop it.
>
> Signed-off-by: Shawn Lin <shawn.lin@linux.dev>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
>  drivers/mmc/core/mmc_ops.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/core/mmc_ops.c b/drivers/mmc/core/mmc_ops.c
> index d59ff82f..fda728d 100644
> --- a/drivers/mmc/core/mmc_ops.c
> +++ b/drivers/mmc/core/mmc_ops.c
> @@ -319,7 +319,7 @@ int mmc_send_adtc_data(struct mmc_card *card, struct =
mmc_host *host, u32 opcode,
>
>         if (opcode =3D=3D MMC_SEND_CSD || opcode =3D=3D MMC_SEND_CID) {
>                 /*
> -                * The spec states that CSR and CID accesses have a timeo=
ut
> +                * The spec states that CSD and CID accesses have a timeo=
ut
>                  * of 64 clock cycles.
>                  */
>                 data.timeout_ns =3D 0;
> @@ -815,11 +815,6 @@ mmc_send_bus_test(struct mmc_card *card, struct mmc_=
host *host, u8 opcode,
>         cmd.opcode =3D opcode;
>         cmd.arg =3D 0;
>
> -       /* NOTE HACK:  the MMC_RSP_SPI_R1 is always correct here, but we
> -        * rely on callers to never use this with "native" calls for read=
ing
> -        * CSD or CID.  Native versions of those commands use the R2 type=
,
> -        * not R1 plus a data block.
> -        */
>         cmd.flags =3D MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_ADTC;
>
>         data.blksz =3D len;
> --
> 2.7.4
>

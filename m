Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7652740B373
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277573; cv=pass; b=A8Q/+9K18FSJyQbH+zti4++DSJlZla0Du14Xfqm4/pjgmWFq6dWXD0uEB1gGBuqOjPirspInOG1usb3Kaq04E7HptAzETBUc6FyZrixMS5hTUGB9BPpb/bOFlgVY4xh0lLraDw9H4hf0RhTgU7MKgzs88AEVPC0DyG4yX8/Ti+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277573; c=relaxed/simple;
	bh=XLo1O6Y/6Eo3OAdKCdgs0D45eVegKXe63+OLb+kXWng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpZGw3Xcd5FdjBINcwdh1FfB0pBad7aElrLUqt3FpA+xW56jF2u2w6BvUz3WQeB8+2aAe8Mwx39ZAbDPztLRT9VvKtOQ/HsNZj5DzM6I5uqEFl055QE7rVnQS000B84bbhPNIIi0dBLcYTNpBJfuiRsk2O3fCAn6hvX3eBzc18w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feYTI9+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zmalf/Cp; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="feYTI9+A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zmalf/Cp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8evM2270419
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZesAiea/HD1vlRsrFj0Au2AyHXRN8QeZN3AWkJ1tr+4=; b=feYTI9+AXed/U2aQ
	urR4ihwgtlD6ItpFSuAQtQEVdpvW/fhqqnRBzvM8xzz9hcvZK3m3gA19/Y8/s6co
	STQk+LdhxM8bCRTz5CeG1xf4+1Bd0Osr3fH50gOkQlcSbZpzi/0FVSDyG9RFqoRU
	QUw1PuLsqUbMfpGZeJk/ZLXRdguuyBWlBZBv8zcKoazxEe8k7zD58ccU4eAl7dWl
	yHxtugvSRYVgOOAe2HecNQDneJIXfyWjML+QoJCW7tqM4OGxoiPEg5KoeZnhHu4Q
	/6rGV/R30g4y9ExEGzEwmxUS+9DNxqYesPbcPBJmpIFk1ud+YEDSKJQqXAG4FDsl
	Lp1Bzw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx443a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:46:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so8376720a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277570; cv=none;
        d=google.com; s=arc-20260327;
        b=AeOSMa/tCWqLfNJaF5G3lG8swzi1qZZf2oMKXcYocC2yc9f0/iLO+153+en+pDAdAI
         bfJws7VztAePrQawSZGfr/1h426r/JtfqJ1cVrKts38IGC21eyWb7cva7nvmwYBZdai0
         2qtDDwb3C5Wq5G63ALzpgp7oFfH2G3MAId+JNhyvJjDfcojryjvHSyR1mz64H5JIaoBu
         EslV3Hv3JuwXoEagBAVOk2geoe6oDYHz6F+99t3zSHoBa81NpvjC9QgcM5f8nLFNOi7i
         mzI+C850zpCNw6HZeT3JkMU0+sqTGyY5KMDKxV+meUxHoNqsCJSLY/i4fCDVQOQ8t152
         4tyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZesAiea/HD1vlRsrFj0Au2AyHXRN8QeZN3AWkJ1tr+4=;
        fh=cTDyPLuU9Qb4SrEHdHc67DhMvpfYRHXV1nFz/5b/Nyw=;
        b=fCOXLsMKV4rkJ4dKfRu1dAZ+KGzpYh0QWhFDsM6ogysQ/6pANk6+CXc6Je4rNrnbZs
         jvSUq5mEllj59vsA9/wiF5oPPUpI/VqNJjdLG1hfy6sJR13C8XQsw39rktnOwlMJMqAs
         2Mgx9gtK7Qp06+JSQj8PEf6/v1T5RyudUmx3YlZuAxG9ReOFtNQVk5VYzVqYODMC2zOT
         l3pjZDrOv//G8Jnr2RVEn4TDekwUe9+A+wK1MMc4BT5smyhDxr0wPbeuLaNBVuE3qzrK
         oEH9aQCnQXaDpZ2IEJ7ZAF1NeJ/+XFYc9U1dxv0e54V6YCgmdo/ry1jI3V4KPnG8Sh4z
         37iA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277570; x=1788882370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZesAiea/HD1vlRsrFj0Au2AyHXRN8QeZN3AWkJ1tr+4=;
        b=Zmalf/CpZqZ90n6GiN/drfFuPtW6C3zLI7PxjwV4tjDMIUGqe7t9NmsU1JSUwGkXLB
         CJEwDCKywBSB3VH0MVY92OhMmezz98siPKY6Kngj5fL6ORV/Mfq5QzuvBrbcQYeT+cgI
         pngsqpQGD5dz4+FMovzbP9SqJTdY3YdkrOShCgYpQ6UB8gEDFCgr4IfFBJJPAIgjBLWc
         JWEojhrB5WIbLIAO2uVklaSufuBNPst28xSBCeOnpSKZUd9NKYIeIz0fqLJCk5u3cJ0C
         VqFJOYuRRzFTPF1F5DN2DEQNVmp77HTDDvgAL1MJBeXvCdjGOnWLtj6N95aezmmJXVIA
         0WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277570; x=1788882370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZesAiea/HD1vlRsrFj0Au2AyHXRN8QeZN3AWkJ1tr+4=;
        b=fkE3HzAD+MNnqb2Il4We2ML+0AeXViUidcqHkAHKwIkeF9X+Y0eo1hzcJWHnIqSRRv
         Oo/Ux1uDp5hHZLRTUikdea95c1yYsrjy5duc44IYTivxorHH+tX56hvBqO+ylT1RpgcG
         MA9cerEqRex5wkrZoFgS2D1HujEiL1PzztaPDGet7/oHqpTJEqI9a4bX+wwtNg3dcM80
         5VGlRN0E9n575PTOZkmDJNc52CSPcDp3Sj/GGnFJMgsomu70idyaHlmvr2TAGNV8VDSr
         j/4uJ+GSXKOx/+Qq6eYOOOjau8Fd2Wu34VqYjZJzSuXeW5eI083os5MZa3TSzoGkcLW7
         dhbQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOXR5A1P7dqhKuX6XE4qDmwhEEbCzBlN6qdi3biLCoUcvui7wIv/dwmoTcmKnyYuh9JDp0we67xPMha2A=@vger.kernel.org
X-Gm-Message-State: AFuF++lsowfMvRa+nyxaJ45M9zFB5E9UdTzORm0EJ7lHaamTR4DpiaCs
	NlEUHpJWA/fqjJJqQWaz2xmM8xdhGgcY4Tc8GptgLyJAkxAJXozoAOztH6Yzq53zl3P+ojrqRmO
	Xjtr8FKX4pSsgOoeQs3i1v3+Ed65rENWvdHBjbdFhllhqFf8AOf4yIk+ymo1mo94R2+eMHQkmYY
	pvPaEXqdlgLRlcU5ke+BK1/EN++DZn+GbcNwjX9lGYug==
X-Gm-Gg: AR+sD128MGX/PmgpTedGYpfHkJ68T4rGR22mTzABzqZ5tb45ZEmfbpcpgRT9TTrpnFK
	Y2WHvC94ArOZ7TBmFpMBUayDRzjAqNzS0AM64sMCPPgD4xd8ssDFc7oANfu+xvZPLR3EA5s6Fem
	H0kg7Phf+dg+Gb5Ri1VzTdkkVZUb2r4Wr4WjOcxBUk/eLY7VMDtENokhD9Ug==
X-Received: by 2002:a05:6a20:2d24:b0:3d3:af66:9f61 with SMTP id adf61e73a8af0-3d7b0858c0dmr13796011637.27.1788277569837;
        Tue, 01 Sep 2026 08:46:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d24:b0:3d3:af66:9f61 with SMTP id
 adf61e73a8af0-3d7b0858c0dmr13795922637.27.1788277569390; Tue, 01 Sep 2026
 08:46:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821085222.140633-1-ansuelsmth@gmail.com>
In-Reply-To: <20260821085222.140633-1-ansuelsmth@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:45:57 +0200
X-Gm-Features: AcwNN1X-ZkG58Ju7YGsTebESlLv7OBivRQr4LICy-o3mSGUv_1-w5G-mpWoo6R8
Message-ID: <CAPx+jO_T3qLTYh3VORuPB7_caWXXOXy4XYfwXhT4THEjTghj4g@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: airoha: fix unselectable AIROHA_CPU_PM_DOMAIN kconfig
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96f342 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=95gA0qMHRU8tCJvgjbwA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX29M6egR5pVeG
 K3q1wvQnZD0kUDduTEOC2WuzSLkzG7LZURC4h+uhybRU6KZmnMXMQnAfoy6Gcx8OWgsISSInSeS
 hkiVe9K8Kau8vwhxnUk8jIIODmHd3UE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX+WugucebmUcc
 CatL85bXgf5aGSlVrewF2RYY89JNzdaPuLF+2Z3YmKHfZ+eg0TMd63/FctLHXP28pOyOiKeDw5U
 i12SbbtnGbx4pt3DnKSGouvQFKXZNrhquT/KZJb4hImG2zmMzlksH5m50u14zT2iero/zKIcAJW
 fDP76lk7TBwO1TCqptiO8T52b5DuSRnpuTzEsLB9zAiq7CvQLnTvJMhlWztc71wFFKELIDgx7IR
 FxwKDODHQSB2gOPmCv6kHrhkdDa08BXiquVxVVkLsBlMO+ykCcd4PO4Xibyi1WcR/G4fwLSRBMt
 Te1IjVKOLhRHNykwjbr/V0oFDhfq3oYGmBc7+b4Kp+cxLnlgnazuBoLWnm8Axc9M6LpCGbW/NEG
 uy1wXR1l1ejQF4FI4mHEhMO08yBd1IFJrA+YkVaWYrNbhLfwabMO12fbLmvUNKjYuJgfrTiYrXf
 n1/SDPvoDycLEpb9nqg==
X-Proofpoint-GUID: RZY2z5P-WOrCFUyLp9hj9FX3Ty19Bh9p
X-Proofpoint-ORIG-GUID: RZY2z5P-WOrCFUyLp9hj9FX3Ty19Bh9p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010139

On Fri, Aug 21, 2026 at 10:52=E2=80=AFAM Christian Marangi <ansuelsmth@gmai=
l.com> wrote:
>
> The AIROHA_CPU_PM_DOMAIN config was wrongly guarded under the Mediatek PM
> Domains menu and was unselectable.
>
> Move it outside the menu so it's now visible and correctly selectable by
> default on Airoha SoC.
>
> Cc: stable@vger.kernel.org
> Fixes: 82e703dd438b ("pmdomain: airoha: Add Airoha CPU PM Domain support"=
)
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediate=
k/Kconfig
> index 8923e6516441..a2eb704a773c 100644
> --- a/drivers/pmdomain/mediatek/Kconfig
> +++ b/drivers/pmdomain/mediatek/Kconfig
> @@ -43,9 +43,12 @@ config MTK_MFG_PM_DOMAIN
>           This driver is required for the Mali GPU to work at all on MT81=
96 and
>           MT6991.
>
> +endmenu
> +
>  config AIROHA_CPU_PM_DOMAIN
>         tristate "Airoha CPU power domain"
>         default ARCH_AIROHA
> +       depends on ARCH_AIROHA || COMPILE_TEST
>         depends on HAVE_ARM_SMCCC
>         depends on PM
>         select PM_GENERIC_DOMAINS
> @@ -54,5 +57,3 @@ config AIROHA_CPU_PM_DOMAIN
>
>           CPU frequency and power is controlled by ATF with SMC command t=
o
>           set performance states.
> -
> -endmenu
> --
> 2.53.0
>

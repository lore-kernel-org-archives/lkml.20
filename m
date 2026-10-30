Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793358021;
	b=sqs3ao6En9+OdjNRsM7FSEYoi/VO8xDsjAU4OZPtZ4X6WURt15VbKh9JZS6YF84e+SPy
	 HmHslUcmsfRlPP7DccTHF25wMSIc51V342yaKH6Tbpjex28W9Hnh/paAPd/eD87Vmgm6J
	 cG/ZOR9W0Iu+CcAnDNHUdNKgWWYnuob1uYbCpvZU5J4teRpc32pNljui35YG2X7667P9y
	 nq5Iv8IcvzjkxztiaAl0LwaDwzsbE2wObPo4jEyOUhwkAiacRB46Vk1SjFE+jMjAlIW42
	 YiJoB/lycx7UvkANEytwnaa+PibJw6K0XrBr+xtCSvu89l15Z9G1Xs1XHc6YnwYTVTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358021;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CyfAywKW8UFtdxCVIp+3c95BjC5zRnv6HCszmSTNZ4g=;
	b=IuZFDppvR2Oo/o+V8ADUv0UP+tS2iKxIub0/RTcl/tw5xgPaG8oK2JHd6/iI7fcvOy/X
	 U/fK0b9NkQI6eP4IqIQEYlSo31ZhU0jvqPaU3HqATBDd29tTaLpPsxy6FyC2VAEGJucqx
	 zVzunhJRrjMxSHbIIp4dAlYIDVsAWywJwqkc6aZxXUXWLI+GFSccUNugS23AFPdZfOwGC
	 KlkeRZYyiV/VLPurNewou1dOMF1NmHme2DAblpCbMHUIchxKVMIRJapJRmYnFUDHIcRJE
	 sWZ+QHZBgXx7wMmoIkQR0gYM1S/3Oic0YW7VkUVGKqB3j9tuEnyFr1fb5BD6aaRov7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iT9GH6t2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HjaslKfs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE461606B960
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE461606B960
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iT9GH6t2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HjaslKfs
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F2A41120522
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CyfAywKW8UFtdxCVIp+3c95BjC5zRnv6HCszmSTNZ4g=; b=iT9GH6t2v0i9PcWF
	CJlDAVLbfKdKEi3/QnFSRm0PSO9LcxkaHhJTT5rypqTnxrNOXR9AWp+cuFKLdPB4
	8wI55bZr4tfojwUSs8zNedSc4/S1T8V+f1PfvesdZvjMYGKPzYLbs1Vj1JYuGGdi
	41dWcT/TtT2R2J0/67zEV2/dYccou9w0Cw5BF20t3Tjn8YSisCkU8ags52XU0gLb
	hRnx02yP/WGN7egj54XThGqQyinmhd3zvp478+7R7bvHAxCZy1cPwY81faX/JX2J
	oppcLkTeal45+2hwJjwER40tdSmzvyRGT+G/plpsm3sWK6Oj09RgA+BsDwp2Ve4R
	nzrVdA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pjjra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea0fe07201so4347915ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358019; cv=none;
        d=google.com; s=arc-20260327;
        b=nXAtqqsfJoqA4xMNh8KST3RTORt2Rz6ILfhsUYEYlUQG6KLRg6YXsWFy1fjVa+q6NX
         XcXkOLWzR+Fe45mNXb3JSm2Z4ktyxapd6/pp/jvOLQ1lnWE/ftmTiZrJQocIHmTEhtF9
         cwHpoirYZsA01iqwm+9YRgL0u1Mh4wYaaUbp49gz1RyXJ7MDs5EfJ5WVtHFqyPAGy0zN
         8yl55pOPGX5rZvigf9Z4b/jmMzFX9hBEtvqNYsBsIuyRiqtdgO1XVb0i10SvOwzka8Ng
         3EeiRH3aEAlZ4HHIc85+5++q3B5llIxCuUy+R0D+1gnfpDvCP4BI6ZyCIg+dkv5Wt9st
         Q62g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CyfAywKW8UFtdxCVIp+3c95BjC5zRnv6HCszmSTNZ4g=;
        fh=tnhb+5NVbdzEw/hQr3UMlAMfGN3ZV/O+n5XyrmC6avA=;
        b=ZoKE7lNObQ6T7PCtdxx8I7jeE50kzbuxiLmDi7FPCBc+xZHExLGYbqo80DS62YDO/8
         LlonvqaRCfr7utwTdeidOySbx30FMI7zPR/5/Lm3vL0+5iw4mB93riSTdV/nPasrZD1M
         9JNnuUnnzogdYNfRcUR3Y7fqOtMTJ9VoUGkuaQyVNi1tfMyD6+KbjK7gQ01I+5mINoTU
         x+d8WS7Y201PZeZxcqg6l336ZZtfyKuO3QhIOdcK6kmeKwrPtIArwdGnNA2BCPq1UgLj
         HoByQNebgAmCFVDsTrvGwnLIsx7P+meBMH6LftjVk7nwGI2eQhkm5kXM70xdyfx5BxJQ
         GXnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793358019; x=1793962819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CyfAywKW8UFtdxCVIp+3c95BjC5zRnv6HCszmSTNZ4g=;
        b=HjaslKfsPkk77IdR9jJmipA6axVmHZRGzxkYvOjBDhARC4O7CfWJMmIvktXfJpRfki
         joHV9s5Oqh4jkPV2/8K4tB4rPTgHlG2zukoT3d3P2vIfW8r49IUVRljk6J6UqKNadPqi
         XXBY8up4jju3yequd9KrG3C9DV6sBE7w6DaJTuYIU+/wKXCFf1y2KY3vlqWx6yA20jgJ
         QBFJBG5c8Z5aXmeZxlpk25hGZ2Sb+3DDKVgjrWndIie0/kfXhRN8Vg34b+K0LxyDDcAQ
         SjPvH0WbgkmFTHeafV/1vIA06KZEZt+nph/9ha2hVbHDjvweJZ9g/F3a9ykXEzq5Gh/u
         2KwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358019; x=1793962819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyfAywKW8UFtdxCVIp+3c95BjC5zRnv6HCszmSTNZ4g=;
        b=XWkEdh00mZk5dPYGyn0PS/rTCLOHylVBK+k0i6T5lnrdggVJeYyhH1pSzxauBqsCrL
         umj9DqMZvZVrrfV15C0bcG/5SPHvsLG9eGwVwcNq51eZlnJNvFlZ3d2O+jIQqx3oU2Pe
         1YrFRVDI8UEn3AOvfYfZpEp4/2KbkWguhuPWltSowjhAoez4uJw7OcCRRr7ysMGmG5cZ
         oCXXswuooNLFUUze32yZch0HGrXqfGu5lDIY/6LMTiCSDFBatk0GQxIXQNlpzRxd+tTu
         fQa6J9NeeolHFW81O05hE5pMqcx89Jw5pkTvv/wvXP5xKWgua1StFMf0+hXSgIlAXP6l
         f+pw==
X-Forwarded-Encrypted: i=1; AKwUvBzh5nHMfX2UTK7OHHDvDXP0i1xBrdsm2ZInh2cD712/epysunPZWGdLHxcLDm0+5+x1LDj99nkRD5d2JpQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeFPYOBon8fAtLZC9BVpwC7NIFx5msyv6e214TzJsEQ4+wEjAy
	1vqwxwyk+H+4E8iWz/BXakqI0HlJKXZNbHQnmCJXfsEw1EZRb2J68EuUyJzJMMnCIbftWj3WJ1+
	0avg/L/PcmV3aZ8q3Lsez92bi1xuBRjE0SAre8fMtE2nGLFZHay9qAu9ImvRLsM/nMg2xufjCGp
	eDnEH4v1n3xRZGKJA0p/BF4x8IdKuAWMsMIFReD9V8yNHiF4p+Yw==
X-Gm-Gg: AYBFou3ghB5NV06V9YcTxLTj4WXBs7IWxFDtInoG/n1QTsLe9XNc6zgUadHBgUfK6MJ
	w6+eLekIfo0CzerFj2K47Kss2WbRvz8S/Izp61Bxcz4+BvQHbmab1p+5MJb49qN2IJNuYmVFHa8
	CW3NyjHaHXYfyjju1ihQz9XZ5RAqd8hZUYjrHWGFUNEQxoV1ZdbbvQUvRF7g==
X-Received: by 2002:a05:6a21:730c:b0:3e2:3392:541e with SMTP id adf61e73a8af0-3e928d46c4cmr1721205637.22.1793358019220;
        Fri, 30 Oct 2026 04:00:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:730c:b0:3e2:3392:541e with SMTP id
 adf61e73a8af0-3e928d46c4cmr1721166637.22.1793358018589; Fri, 30 Oct 2026
 04:00:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018225548.18373-1-rosenp@gmail.com>
In-Reply-To: <20261018225548.18373-1-rosenp@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:00:06 +0100
X-Gm-Features: AclHuK-Qo7qPzQ5rBiIzv6RMaxFNUGA2cohtCiyoKqrDepOH3gKYgUGni91Sbl4
Message-ID: <CAPx+jO_di9H5g+En_=ROdnbM0XNxFWHmjRSg7VV_WH3j2dvhuA@mail.gmail.com>
Subject: Re: [PATCH v4] mmc: sdhci-pxav3: use managed clock enablement
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX8/Qj0bf53286
 18ro93S+mcIRpe+Zls7L1VB2DYeWKVrS5nekPVtLz5oyEvbNflG/jtwovflbxBBvlUHCT2V+Kho
 gsPf4se1eBLR6FzDGpyPoeVsJscx6jGho/tIzjRWP507Fljvo2+6iESO43NNmSMBgx4U5gDgFj2
 ztiIYmbsHI3sL8RxYuh5VcXVKjZ2xKunM1x192NDaGIVDpKIKWKmRme2Tvd7NNNKiaozMLjPBlj
 CRpLVbckU3giAtLeRU76UK79oDFqaZQUMjm9BtXOQ+6s8EPtuuIedS5qJxsWh17vYGALEmQ7kLY
 /jxdgyetG6hYggfnRVJFmtoyjd2yEZRJnVG13IyhX73LJXi/8NYBMVcwsF+BPACi7VuS/y+mKwP
 tiYdAW1aBYKa+2rShyFzhM7hafTUGEOGvsu++AWUIncoVGc8Awq2Zx/L7ctc6+VtorujpSOT9+9
 Qi/Tj7PkSFsMACcobkQ==
X-Proofpoint-ORIG-GUID: Po_et7lVJk0B8SDjaIwnQEwdZn7-LL3G
X-Proofpoint-GUID: Po_et7lVJk0B8SDjaIwnQEwdZn7-LL3G
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae478c4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=y-31ryzzJUqZrzzw7VMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX+1rF8+TnK8BA
 U7W+L0BNoOO00ogXI/EoL7Cf4jb8meptjzBjbB7dkQJhA8xk8CSaLQNk3Hs6qYgHDpPHbtgK3IR
 HEpBlB/QG3ELmCb3Dfjl2mhlk/pYiR8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300043

On Mon, Oct 19, 2026 at 12:55=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> Replace devm_clk_get() plus clk_prepare_enable() with the managed
> variants devm_clk_get_enabled() and devm_clk_get_optional_enabled(),
> using the same io clock lookup as sdhci-pxav2: the "io" clock if
> present, otherwise the unnamed clock. Clock lookup errors, including
> -EPROBE_DEFER, are now propagated instead of being ignored.
>
> The core clock becomes optional, which removes the IS_ERR() guards in
> runtime suspend/resume, as clk_prepare_enable() and friends are NULL
> safe. devm now unwinds the clocks, so the manual clk_disable_unprepare()
> calls in the probe error paths and remove() are dropped.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  v4: v1 + sdhci-pxav2-style io clock lookup
>  v3: fix sashiko errors.
>  v2: fix resume paths.
>  drivers/mmc/host/sdhci-pxav3.c | 38 +++++++++++-----------------------
>  1 file changed, 12 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-pxav3.c b/drivers/mmc/host/sdhci-pxav=
3.c
> index f39764ffd4a0..0bbf782fc235 100644
> --- a/drivers/mmc/host/sdhci-pxav3.c
> +++ b/drivers/mmc/host/sdhci-pxav3.c
> @@ -413,19 +413,16 @@ static int sdhci_pxav3_probe(struct platform_device=
 *pdev)
>         pltfm_host =3D sdhci_priv(host);
>         pxa =3D sdhci_pltfm_priv(pltfm_host);
>
> -       pxa->clk_io =3D devm_clk_get(dev, "io");
> +       pxa->clk_io =3D devm_clk_get_optional_enabled(dev, "io");
> +       if (!pxa->clk_io)
> +               pxa->clk_io =3D devm_clk_get_enabled(dev, NULL);
>         if (IS_ERR(pxa->clk_io))
> -               pxa->clk_io =3D devm_clk_get(dev, NULL);
> -       if (IS_ERR(pxa->clk_io)) {
> -               dev_err(dev, "failed to get io clock\n");
> -               return PTR_ERR(pxa->clk_io);
> -       }
> +               return dev_err_probe(dev, PTR_ERR(pxa->clk_io), "failed t=
o get io clock\n");
>         pltfm_host->clk =3D pxa->clk_io;
> -       clk_prepare_enable(pxa->clk_io);
>
> -       pxa->clk_core =3D devm_clk_get(dev, "core");
> -       if (!IS_ERR(pxa->clk_core))
> -               clk_prepare_enable(pxa->clk_core);
> +       pxa->clk_core =3D devm_clk_get_optional_enabled(dev, "core");
> +       if (IS_ERR(pxa->clk_core))
> +               return PTR_ERR(pxa->clk_core);
>
>         host->mmc->caps |=3D MMC_CAP_NEED_RSP_BUSY;
>         /* enable 1/8V DDR capable */
> @@ -434,17 +431,17 @@ static int sdhci_pxav3_probe(struct platform_device=
 *pdev)
>         if (device_is_compatible(dev, "marvell,armada-380-sdhci")) {
>                 ret =3D armada_38x_quirks(pdev, host);
>                 if (ret < 0)
> -                       goto err_mbus_win;
> +                       return ret;
>                 ret =3D mv_conf_mbus_windows(pdev, mv_mbus_dram_info());
>                 if (ret < 0)
> -                       goto err_mbus_win;
> +                       return ret;
>         }
>
>         match =3D of_match_device(of_match_ptr(sdhci_pxav3_of_match), &pd=
ev->dev);
>         if (match) {
>                 ret =3D mmc_of_parse(host->mmc);
>                 if (ret)
> -                       goto err_of_parse;
> +                       return ret;
>                 sdhci_get_of_property(pdev);
>                 pdata =3D pxav3_get_mmc_pdata(dev);
>                 pdev->dev.platform_data =3D pdata;
> @@ -499,27 +496,18 @@ static int sdhci_pxav3_probe(struct platform_device=
 *pdev)
>  err_add_host:
>         pm_runtime_disable(&pdev->dev);
>         pm_runtime_put_noidle(&pdev->dev);
> -err_of_parse:
> -err_mbus_win:
> -       clk_disable_unprepare(pxa->clk_io);
> -       clk_disable_unprepare(pxa->clk_core);
>         return ret;
>  }
>
>  static void sdhci_pxav3_remove(struct platform_device *pdev)
>  {
>         struct sdhci_host *host =3D platform_get_drvdata(pdev);
> -       struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> -       struct sdhci_pxa *pxa =3D sdhci_pltfm_priv(pltfm_host);
>
>         pm_runtime_get_sync(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);
>         pm_runtime_put_noidle(&pdev->dev);
>
>         sdhci_remove_host(host, 1);
> -
> -       clk_disable_unprepare(pxa->clk_io);
> -       clk_disable_unprepare(pxa->clk_core);
>  }
>
>  static int sdhci_pxav3_suspend(struct device *dev)
> @@ -560,8 +548,7 @@ static int sdhci_pxav3_runtime_suspend(struct device =
*dev)
>                 mmc_retune_needed(host->mmc);
>
>         clk_disable_unprepare(pxa->clk_io);
> -       if (!IS_ERR(pxa->clk_core))
> -               clk_disable_unprepare(pxa->clk_core);
> +       clk_disable_unprepare(pxa->clk_core);
>
>         return 0;
>  }
> @@ -573,8 +560,7 @@ static int sdhci_pxav3_runtime_resume(struct device *=
dev)
>         struct sdhci_pxa *pxa =3D sdhci_pltfm_priv(pltfm_host);
>
>         clk_prepare_enable(pxa->clk_io);
> -       if (!IS_ERR(pxa->clk_core))
> -               clk_prepare_enable(pxa->clk_core);
> +       clk_prepare_enable(pxa->clk_core);
>
>         sdhci_runtime_resume_host(host, 0);
>         return 0;
> --
> 2.56.0
>

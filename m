Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357965;
	b=pl/OBpBCPYsOByvAXFjSTn0W+EiyD+qTZ8Uq869Gzh8DOK4xGYDJunivHrzcXQUoOu6m
	 E/JLmzUNC5qotL8elghI5R93B/53zPp/sVh9Yt79Ff2r2dqsQMpddhyrIZpiQgWKDn3bt
	 yalsuGb6DGj7JMjf0VawEDSqYX7zHnTuTC+JpFZYfhiB/zLiAusTR3DkSqaKUbi8V0ia7
	 AiscYCygND2SbCLlZAZHrLsACUAx9I0krXcu8j3ZcpBbFPFRE7nmp3oE3SyyA7B5/BZ9U
	 VcP1qJzHT02UmqRsS1OfmOwpcfPcKoHDSe909pbDooAaVhJWoXw/mjLbN5Ak+jzE/Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DU0BmoKanDFLwT8UEH8ag18x/Sshh1zOZeafnoOkRQA=;
	b=RA+3hP+As7PDaR/XFbs0q1CYODhFpQY10wa9iQGrG/1Y5Or2iIN/wKsu0VKOhNtr7Zck
	 NKnLTR+AAC6Lajg2mtU7GKpvQwYk6/PcOAA9OVoPh46Rb3smCxm2HSpyvyAgqwPODIgBy
	 jrdPYmw/3aV5U5e+eAKzDad6ZQ9EDpRwikMum6Cuq6uifhZVTthdTH8qmi3eEPJIx/XnB
	 pQQ3qzwMdWfNnWBFTc/eKIpg6LtQ5paSvfpB+2elh10SUgs38ceQgsqngZoWTKDZDRi9c
	 k3/VzZtkGjkuoVIZGS1DJ8oTqDdKzsb7AVphxHjY5bssw8J2zxT2p/X10kthRv+38hQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXGMf4Rk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgNrEVtK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16890606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16890606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXGMf4Rk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgNrEVtK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8EvRE1761692
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DU0BmoKanDFLwT8UEH8ag18x/Sshh1zOZeafnoOkRQA=; b=NXGMf4Rkgi+HUugH
	hZlJfzDe7dKqvdrJ9ndyLIUXPxXB+FBT2cMtVXbRPPSHhhNp/+dcLdaSsUMFNrsy
	UQTYRWiw9WKPSQrFixI3g4jSyq2LwIR57b6pu6JNMy+WcA9BDowddjSrFY7HC8Pl
	sEWH8tCZd2gzsE9wtQGZIuZbtMtt7vAowzhh9ngzEBG+wMUbBf+mMdxrsbm8jo52
	csGuBlMuZ3/V7amzAe6fUSTO92Vavg4M31qQCN6gd/1+xgnpWzS86EtQBnpsNP8z
	sooCTjkeJRAFCaJ0+rzl037EDbfAiWDDBJKRw+St3+gaIfja8hepZ7cledu8B2ip
	y0eWZg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6paj5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:59:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e942b1cc86so7090295ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793357963; cv=none;
        d=google.com; s=arc-20260327;
        b=LhbASGLF5vL3KIYt7FtlhHjizhCwGarbih6EhLmpUiaev6kqY5MxWMnUQCOdyisAqy
         NskshmSuz/iPLTbPJD6vagktoD8Y0PTkSEdtj3q0MSp8mCX/oGksFfqnQXD023X6gxYM
         YujPhWPRC5CUnuINlJJ5hFP0gq0fBEE2vXEZMV0a4WL1qKvnM+h8FtYHpBhQ9U7Tr5ci
         x1DUgeikygJyhplaz/1V4TnsgqDl6s26x5Bp4mBco2eTp8zEsrZZrw+3K3bqcY7N8ghb
         v2bBqBNKS6p0RqVUMcyK4LrdYdu7R/Tga6uSSNjJi41y9qSL6cTd5o3LiyRJxxNNHu30
         qtdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DU0BmoKanDFLwT8UEH8ag18x/Sshh1zOZeafnoOkRQA=;
        fh=bE+gPsdZx+AIAqcAduLYKA0u/LpBARydw7bjsHEmsbw=;
        b=BQz0aAVYNJLWSY3Y8i0MBg8mEwAdchC4cgeKf09WFWHRnCxG8j/dXN78ji4k6sQvKa
         gQ+Yv69ryFYOyxwnwfk1uUKuAESx7H7O6sffTIDgfLJ6xSVmiIaEBI2wGm41GoJqnq5V
         mm5oyN/w3q2sioGzfrnIJzlx4xJI6emP2WylaO/eATuxJa5/omtS9BQoe6MUPY5oOPkr
         xG/OtndmTSd9g51NO2OSEgOl+HecLGzkuc40nJSbNsMOi4yPXPsXmM9vWg3I6mMUAM/y
         we//b16u4hcj2TvDOxWJdE9ZEAWZYqOCn/ytvEAbO6tve5K9slItSLd1GfUyo1G+kStB
         AEFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357963; x=1793962763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DU0BmoKanDFLwT8UEH8ag18x/Sshh1zOZeafnoOkRQA=;
        b=OgNrEVtKgI7wFtxX8I5xxNiuce/RfdPPtDcPEU4s1O/HzYhfekU//wS61GPYQO8QIq
         u7dSi2+DTmio9wDXsscVKzpEENm1YgHd/+O2AjZaO/t5NZcxI8EfZV1SYyF4b+IOE9ND
         2bVpkL3na/T6wJwl9C9mnHMPBOoujzoJyKWIbzFbFmcKpXgNG3dXSwhXAEQC51HPawJ6
         Njf2UPJI/OoKJlZXEnaLQzkCS8tGBv0puAYt0qpJvEsjVnCFWOOxATKqDiLlDtnRpBQM
         NdQz6u/VDFlda9Tc/2U1yK1w5buFzUT0ia30PFXSKxWyWRVkCVJQSA6RB4kJS8AACq8a
         UuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357963; x=1793962763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DU0BmoKanDFLwT8UEH8ag18x/Sshh1zOZeafnoOkRQA=;
        b=LHX2miPXMZ3CCeN+M+ESlRQDWHCvxmWls/ulvcQ64xiCtJvPjhCYgIwDZiLQppXw9J
         cWLbbCbV2Q+rBtSK7fmKX08LmlqBPdUA90ewbZujBzpD2ZkzOGZWDt6bXqXLztW6ok1n
         /Nm0Zgjlu2kMVrqnjj7ZoIN8/XeTD2b3Eh76mNkLKDs51ig0nKYr4Oz0A0JLD2Q8FFU6
         9TKOu3StA+FPwQ+M2lYHkL9fqV3+t8+Hw9quzon/mXBPIcZugcvhcLv5VYN8ygr0Ia7m
         oz4A7MwnZlyDKU07A9r2t/0LF52M4i2R3LCmfJONkJN8cF5b0one1Caog/Iatp1lC+Fi
         s/Hg==
X-Forwarded-Encrypted: i=1; AKwUvBw/cO1/LZm0GFct1Yp6MJ1QcQdSAIzQhv81wzUKYHb63RH+QVFxXC38lKq/b9e2b0HWxdDqCqqvolyt+GY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQE/18+bI/TvoeZyKQBOxlPL5zIk8/+KlZ5pu8haRam3lE1jWA
	Ux5EociYzq6d54eWDs0uauMNxkSdRLG8TE14yIbJyyHR8vgSFzkUKllsbyq7ilkX/2R2uHFxGN6
	mZdF+qEZmEz0Rjf5TFU1/baXAbz1wJ28sHrmw8X73QQ4Cbc+rEhAztN13cwkSs776JzyCXwOPvW
	FEQyD76r6/Ex2LlMrKoVv9JeOX9aoGMHs6zadv+J12LQ==
X-Gm-Gg: AYBFou02XxhGlqPwj9T7QPd+OFq3jECAYrOhTuaFklC/LMp9kdw6pg9xuxAOc8UmbBS
	3E6mUqnIrFkGjGJDDMDwzc8tEWA2YmKeEs7foLhGOiKbKrURBfkKcTyAsNBOMnnU94Hq4gpuP4w
	zJTlmzcv9Rg3JkhJMM1uUk8lpw+1ojZteO7vTk+rPjmb4Dl6ETtD048+CrVQ==
X-Received: by 2002:a17:902:ce05:b0:2dd:ad73:5b6f with SMTP id d9443c01a7336-2eb364b55camr20159665ad.31.1793357963437;
        Fri, 30 Oct 2026 03:59:23 -0700 (PDT)
X-Received: by 2002:a17:902:ce05:b0:2dd:ad73:5b6f with SMTP id
 d9443c01a7336-2eb364b55camr20159505ad.31.1793357963024; Fri, 30 Oct 2026
 03:59:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009003201.68288-1-kmehltretter@gmail.com>
In-Reply-To: <20261009003201.68288-1-kmehltretter@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:59:10 +0100
X-Gm-Features: AclHuK-BIpE4fV2IeH76KyHZZ83cOZXmUKrwETbmZLgjmf4hb_uw76VEZ66rz3I
Message-ID: <CAPx+jO8xc_OiSJ2b6BV=yPZV2DU8Bq4AyA7HkUYMkB6=8w85xg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-brcmstb: don't log an error for missing BOOT registers
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX1+8nMyOdgFb8
 ohwl3KhZLi+724XmNGL1RF/DwWK5xanYUzCd32OgN+eWTjrlAitcuE+ZB1Az6M29m98da3a5lYm
 T+Xf2gJdfloWbxo9OI4rD/GYBKWJriz5WHQiBZf2tU69OrZhJeljnzOd7MWakqALMTcpWgn7PrF
 BvOa81NxgD9aNJETbyyNfy2RKDepmLqsIC0Fm8HA6RnJVmyUt22R3dM1zZm84eDZJvfx1g8F/6E
 jSlst2uK/1N7pYepP4VDAtHpgcVxpMkPvejoClLRhQ4URIxEWWpvBZY/tY/E6VsrNVI13ZkLF9G
 rqEzzlQY/1MUPKo83NqFspMzSrejfOpErBMdTo3smqMOhjWOQWznqPwQJkAhMPJLEjQK6qC8HAw
 H6+c/SdZCJfJGv8eJYVWE7x+gOyMBqkHHApYQ1n82uDEnKgV+r3Mp+kGLGQ76rcJCAgqUxjRkEf
 NTxUHK6OczWbPxIfyKw==
X-Proofpoint-GUID: fyaVMGSYioH7kiZlemksVx1zQEOtH2Ke
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae4788c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=AFOK113v-V9XLpTQ-4oA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: fyaVMGSYioH7kiZlemksVx1zQEOtH2Ke
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX7fYXdfSZIFII
 zZkEP5z4qBEC+lMhRNq+dR7IO6d6HntuyvE1Br93wPyq9uS4k7EQy+yat6f3884s0fDDKrlG8ry
 zPXIT6FvBaz8Ti9fbE+8Ba7h6JHJCNU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300043

On Fri, Oct 9, 2026 at 2:32=E2=80=AFAM Karl Mehltretter <kmehltretter@gmail=
.com> wrote:
>
> The BOOT register range is optional: the probe function ignores a
> failure to map it and the suspend/resume code checks for NULL. It is
> mapped with devm_platform_get_and_ioremap_resource(), though, which
> calls dev_err_probe() when the resource does not exist. Every
> non-removable host without a third reg entry therefore logs an error
> at probe time and then works normally.
>
> The binding only describes the "host" and "cfg" ranges, so this is the
> case for the in-tree users. On the Raspberry Pi 5 family (BCM2712),
> where the SDIO host of the Wi-Fi module is non-removable, each boot
> prints:
>
>   sdhci-brcmstb 1001100000.mmc: error -EINVAL: invalid resource (null)
>
> Look the resource up with platform_get_resource() first and map it only
> when it is present. Hosts that do have the range are mapped by the same
> two calls as before.
>
> Fixes: b7e614802e3f ("mmc: sdhci-brcmstb: save and restore registers duri=
ng PM")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> Tested on a Raspberry Pi 500+ with v7.3-rc4: the message is gone, the
> SDIO card is detected as before and Wi-Fi works. Suspend/resume, the
> only user of these registers, was not tested.
>
>  drivers/mmc/host/sdhci-brcmstb.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-br=
cmstb.c
> index 1de2f05..7c17a3c 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -491,6 +491,7 @@ static int sdhci_brcmstb_probe(struct platform_device=
 *pdev)
>         struct sdhci_brcmstb_priv *priv;
>         u32 actual_clock_mhz;
>         struct sdhci_host *host;
> +       struct resource *boot_res;
>         struct clk *clk;
>         struct clk *base_clk =3D NULL;
>         int res;
> @@ -534,9 +535,13 @@ static int sdhci_brcmstb_probe(struct platform_devic=
e *pdev)
>
>         /* map non-standard BOOT registers if present */
>         if (host->mmc->caps & MMC_CAP_NONREMOVABLE) {
> -               priv->boot_regs =3D devm_platform_get_and_ioremap_resourc=
e(pdev, 2, NULL);
> -               if (IS_ERR(priv->boot_regs))
> -                       priv->boot_regs =3D NULL;
> +               boot_res =3D platform_get_resource(pdev, IORESOURCE_MEM, =
2);
> +               if (boot_res) {
> +                       priv->boot_regs =3D devm_ioremap_resource(&pdev->=
dev,
> +                                                               boot_res)=
;
> +                       if (IS_ERR(priv->boot_regs))
> +                               priv->boot_regs =3D NULL;
> +               }
>         }
>
>         /*
>
> base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898

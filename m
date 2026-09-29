Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C023514751
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688861; cv=pass; b=OffyzdK2ZM1P5laW0C0bCpNPUj+HlDSMzfIjjEefK4uE/cjf1Xy/L7VIMAJgipYGy2gWlMAcdbY25TZHI5+eIZDhtGsjxQY3yya5TzctU3OqioUmsktWJDSqTJAd72QT6TmbvLXatv43OP8mVkeNA47DYGZKcSnzEhLSXXf47BE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688861; c=relaxed/simple;
	bh=2OGmFXG3DYZMwvydYyaIZVCI+BOxnZH5aX8XIP2ecRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knqDFZVJO961nwRJJkQ6NRhp6HQFJNpLahTVsF7KtBdGnqq+TGGfB55KEfEsebLHJuNof/z3QE/HXbnm5pJXvnZhzc2Aok1mzv+n9+M3eOCuycRVSku6YuQqF5hL8RqSWdptIt31m3L9AZma6rTNmgoV7He5ZdlaLGXeVeKLt5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ox6yFBmt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkZ+M+Tu; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ox6yFBmt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkZ+M+Tu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqdrE1576994
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VpweFa/y4KpsyGFUqUTnYjBFWiL1204+HXtmP/jH5gA=; b=Ox6yFBmto9tA1+LL
	zMpN6oxaVCVDUr2Bfe3jGL+LhjwkEkg/nrhb+LElc0F3EPJtCoaimGO+6DS5VGdL
	S4wkl4cpPIOrao5d4XrCzj62xQvN64cQaH3r1HRsjP+pI6HTusemtCqw0/P2ok6p
	AZpoNTaRJbPANh81SCKkqX7iPlUdugAUUhNnbxrlK4XxqCda3D01/dNSMbFgSzaO
	KmUVjtzpqA4LSjXvK0XuiEvI/6dbP7iEAPOCSFZMMh1KFyHSCVQlKHalHXNH2Grf
	Lc8fVmY9gkdqCX8jgfoRml9xn0lyVipI5Z2ewS/Z5BAk/EQrN7NzVaaEADg8hxWN
	vECdhg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4s88q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:34:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so3026248a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790688859; cv=none;
        d=google.com; s=arc-20260327;
        b=sY7XoJ8VE5LBmGj/d6U29aN2y8TxNoT8WxDUi0IjramDAnq5Kt++daZxRBUzEVjCH3
         qF37nR93T23EiWuPY7Rlxrr6OQIsu14AcPUEwaGO7fvS0kkoqOPwsKTKkACT43HxKakY
         jEXkoT18LqlwJItPgS8eltNrzNa4VKjREXgLDqAzG/u+O1+U0q1AAIIy4KPhuG00AhFr
         AhCxsFUmoeo+kQ7Alr3f4+4xqhByoyfc9yUlVMkQUrnPEqgi2YfxSll6m1C3emHKOUPb
         kT+h+1gg8K+EEUrmH6jeuy/TCCQI4o25iHZVGF0BrBVklr2psX4Ku6PXSt8LtgQXVRpK
         TNpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VpweFa/y4KpsyGFUqUTnYjBFWiL1204+HXtmP/jH5gA=;
        fh=0IyMnfmfIkAb+S0dt3rgzxTaFb/vB9OgEOtz+IunK00=;
        b=rJK3XRpCJ+sJi56y3bT+sxp8BlOxNMxUvh5FfR344B2M/dO9GVdLCPzB8JfF4z4Fe8
         XpW2A/VJqv0/xbmQX39iCLvQeCOW6jM2dLm/WtK/mWsKPKiUpKqATnbVn3SfNLiIh2nb
         M/vN+FUQQjt3QkNJMPyXWeOE8xuCn2JEllWN02XNNCCVgDdF8K2yUjqWGhpm3M64amUg
         ovBoL9jz2VrGjC9WqNoHBZUqqXp/ZIMr6G2Z8RkiJjrsqPm3FrGTa7nvIQnCTA3itT5T
         o8j5FQe3htLa/lbbvnmXE/Xgh5PrWKkO8P+xbm+uwdPk3My23wjdTWgCeZAwXbJLDAQg
         L32w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688859; x=1791293659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VpweFa/y4KpsyGFUqUTnYjBFWiL1204+HXtmP/jH5gA=;
        b=jkZ+M+TubF1iuZfbGtgVqKW/yN5VUTAQm1wyoCzy1DoJUTCc9Y0EnHj2c0g0dHm9Uo
         Axqcw+9GLofC2f5q3Szijb6y8RTQ6d6WQfBnw6y9AxNy6r6Bc8l4xyqNsVuPfQK6MkPH
         L3Oj9H/aFQEc9QtsiKJiw/Fqz/op6hjj52E+lIlOSvtBRICbc/QRy2AcmKHhZdpF0ySC
         pQayUIZmXe7AYlqA1K+gtXEacHlBjUNTn938Nzu7HTI20hrkujfbjIIN5lZhaXynb+b0
         JygtYImSIkjz6vX8GsCXqYvp/7V5C+SfsyAeo6J0BFsqifMxQ3c9Zvh3pY3xXQNGmXr+
         45rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688859; x=1791293659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpweFa/y4KpsyGFUqUTnYjBFWiL1204+HXtmP/jH5gA=;
        b=aMhTvtqJyujwcgdi/pfoN07LfplnkosWbGsaUxjRr1TUE3aDZ9DiiTndu7EqlX/7fQ
         kmoAtgIiDKkdiR16XYplks/CeICut/0h5pvbx570nYud4vAs0qY7NzNmxKzRlo05ZcZz
         Z3FZWxc+b/A1hg7M42F4O5YNORSg41tVDnyr72OlXkR0cKFQzUwbUPN9PRjJEZvuLc2J
         1tOUwfZ63UFiNszqjuTrVQpsZzLb8qGKCoSZeop0kueO72iIS3xmnugGQIrEZetXPHO/
         HHPCY8aMiQZ7ZUqNSDjSuOU/n1oZY23xZykix2OIFHROqh75Bz3vO9r/Evxi6P1czBz5
         nR9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxf1IAYJYK4yMo6R0QENr8x32GGuNJdyFRjYJ1vwh4s/Ld3pSt1GPnSrqkSZl+6uK8o3XKTrBwhIVfi7BI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN53r3aAh2ANc7lXxL3FZO0ccKtqV1brdUJWT3uSIfNBUz3jpY
	3xTJRCuKOtFGvE1WPGNehuRFZ7SOGzYK0ym7Cio5G04f4u6DKuhKp0umxWzV5rgetVvmtsMzB7v
	BhhQWTWtc8LMSUQbavPculHjgmozBygKpHOeH0hVn1jovF/EJwSSctnY5KpHZmoxjyl2h8rc6Bn
	AvZoHpLMBIlQwwu9t8RuNcQtHCoXkwLooFs0kZe/bq6vX8kcWdMg==
X-Gm-Gg: AYBFou0cPZoNezB+tUXTfHOQsXShzS/m/9z+JeEmFEbFv4d8kB+c9W5hGEpzBnCfuhF
	jAmZy1gYiMA2IijHKZ1shUAz+YZRc956qPLNrpGg4Pl6Jnhe3wLUcfANz+ylB4qSGV+G/HuvOG2
	g/cPOkbQhp3t2SFz0LU8vEuEUbkPS9IIK3CWvLU/3hskHwahJnXWVVO6bSxg==
X-Received: by 2002:a17:90b:28cc:b0:3a0:d440:7950 with SMTP id 98e67ed59e1d1-3a0d440b3f7mr9299652a91.4.1790688858952;
        Tue, 29 Sep 2026 06:34:18 -0700 (PDT)
X-Received: by 2002:a17:90b:28cc:b0:3a0:d440:7950 with SMTP id
 98e67ed59e1d1-3a0d440b3f7mr9299622a91.4.1790688858468; Tue, 29 Sep 2026
 06:34:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917111336.1102829-1-alperyasinak1@gmail.com>
In-Reply-To: <20260917111336.1102829-1-alperyasinak1@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:34:06 +0200
X-Gm-Features: AclHuK8eT5S6imaBC1PAf2Y5yvpSSam3RXN2sFQd-suCh7u0vJNhiizYX9a4FNE
Message-ID: <CAPx+jO8UePACt0+s-Kv_zWVJh-jRLX_uNH7XYRDhJoRaS52U6A@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-pci: Replace deprecated PCI functions
To: Alper Ak <alperyasinak1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfX3vh0fkfUEHUg
 S8wbQnOv4nyw5BP+mxTQiH+d/i8tgqi9duQa8ca+sooq/O5/I3btLAq+ofzv8srp24OGT1lpdMU
 pxHgFt4zQQhj+sOV4oG17xbpSdLzI3k=
X-Proofpoint-GUID: O2oks5VhDl8CJ4jmcNp-lT9wbdIAzVEq
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbbe5b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8 a=M4mkxfSRnu0DQSwdiYgA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: O2oks5VhDl8CJ4jmcNp-lT9wbdIAzVEq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfX7v1G0TWSNe9N
 D5Vehl9p2w4y4qcotsXVZjI+EeSHcPAc831HD+E8p6qgvg7Fw91sqpqPBLVGclVoDTePoDvp0Yn
 sUMKWZeVKQEPaO8sKGlbnkeo0+MDEuuENta8F5FCyX+YDbqxcZUVWwoxWR+xbzbTUJcEgbfG/oU
 YTHM7vACuct4mAu1roK9Xk0Q3Kk2bo2UAHvVjpdO9TQL+SjbsOeFoBUWh99rgyJPv9OuGdwg0DO
 CcgSfRWkcEUFG5/EU63nh+EaOhOK1zVkeD3fGA0N/KfSa7FU17CB6eWzaT9b4qZHgjEWo048nSj
 eOYnwD3qhozY/hf87EmLV5I/Hp4PSGop/EXH5YuC0mwSTZw/WcFrn9s9dulQc8ZSEGve79mlxBc
 tXxVxXFPE4RYZATH1n2k9MD/ZVpxUNUh/YJvenD9wCPkkW8R11y890XxHdWB+TTSc5I6AxX1tfS
 GznKzH6+Rggdgtyw/Zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290054

On Thu, Sep 17, 2026 at 1:13=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com> =
wrote:
>
> pcim_iomap_regions() and pcim_iomap_table() have been deprecated.
> Replace them with pcim_iomap_region(), which requests and maps a single
> BAR and returns the mapping directly.
>
> pcim_iomap_region() returns an IOMEM_ERR_PTR() on failure, so check the
> result with IS_ERR() and propagate the error with ERR_CAST().
>
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-pci-core.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-p=
ci-core.c
> index b121d896a804..a9000f3bd419 100644
> --- a/drivers/mmc/host/sdhci-pci-core.c
> +++ b/drivers/mmc/host/sdhci-pci-core.c
> @@ -2170,14 +2170,12 @@ static struct sdhci_pci_slot *sdhci_pci_probe_slo=
t(
>
>         host->irq =3D pdev->irq;
>
> -       ret =3D pcim_iomap_regions(pdev, BIT(bar), mmc_hostname(host->mmc=
));
> -       if (ret) {
> +       host->ioaddr =3D pcim_iomap_region(pdev, bar, mmc_hostname(host->=
mmc));
> +       if (IS_ERR(host->ioaddr)) {
>                 dev_err(&pdev->dev, "cannot request region\n");
> -               return ERR_PTR(ret);
> +               return ERR_CAST(host->ioaddr);
>         }
>
> -       host->ioaddr =3D pcim_iomap_table(pdev)[bar];
> -
>         if (chip->fixes && chip->fixes->probe_slot) {
>                 ret =3D chip->fixes->probe_slot(slot);
>                 if (ret)
> --
> 2.43.0
>

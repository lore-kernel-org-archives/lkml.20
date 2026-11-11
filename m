Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794400688;
	b=i51bBEe8ZIdvx0ThCum3rDloRLjWIfRvH+5Obo+LrU5SQd8gX27myoCq42jvHKNTR/NU
	 svqt7d2EPVehx1SUeZ/iTGsJkTLMEMReikfvLiiOTNXeaeUHcgv7nqWRSH3Z9bqYJKRHT
	 bcClsuTb2Z3Ed1s//CSV4T1vQFg83a4VNsQQj1rV8Ui5MRx6KICajqL6j9yuhYrcE0TK0
	 jIGCi0T5jaO7Bw5UojKkgkzyACCyX/6bI6RSLFT0ttKK418Q7pzf0vUfSMlJoXRvipruM
	 85/9wWTkWNjMc/bEchRbXbKDkoqvBrls5Ytc+Nng5a+Zpt3b/pOh38kkrJRewO0kuAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400688;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OIaaQt//nzIPwn+uOg6pI3Fun/12DBLYeKqfKTTvAPY=;
	b=iq7lN4fsz4FezRYzPFtiL1NPy/qA+jbVuAF9ZB/zxAJapj3/h74jx4Myw3QYUjOMFJIU
	 ZFx/L60rl4PJwrOLw8/uPRHfZ0cqPv13SZhIXNQpip+leJ7ciwyjCjvfrkKy+03Fb6BZg
	 Is4Dwk27Fh64bo9VnOhEhNCH2CjocVgG4mBXp5gORhDOT+i7N6W6fILutlFD4NXK0zs3f
	 olubdKxkf7feXTSxdk1Sq6E3lCHbHO4L1kaYzfxHhDiAljiSC+im8pBnDkFLC3I97LGE9
	 PzPRMJQZnvxy7EcCtf8MdyGEOAMwuMl0aj2yjWMVLDPKMS3YKLEQ5tmt6ouzJnvzhrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoyWfbND;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MGpdJjvI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19481606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19481606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoyWfbND;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MGpdJjvI
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZPaT1250774
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIaaQt//nzIPwn+uOg6pI3Fun/12DBLYeKqfKTTvAPY=; b=AoyWfbNDwRALdbLT
	TZq1wnqLj9BihmFW2jTTc3d3Wuzn56HIeR4f/8nKIbHMfyUoM3G05CDGlsHGgE+Y
	9x8J4DeW+BBHAG+irF5HEYS/e+eQPcGoOLibrUsByYlrnVEmX1I/mvFnRA1Dhgik
	vPHfCgjoDf8e2YurRPkJVSogCWMDdHDlK5/5bDkqehzQY89wOW9Uo7+HlIULfKcL
	ko5Ts8WvfRrntpXGcoqf23FNNVn1oSgCQ8IQY1TU0uaBCJWQP2dhD1FTJ5LbBlZg
	qsfrzx0VOZU6ap/7sXocwDrsMR7QSxDR7/V7WYQu7xBS3xzNE20qpQW/4uceMPe4
	uV+VOg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5ma41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:38:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so3283000a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:38:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794400685; cv=none;
        d=google.com; s=arc-20260327;
        b=bTnVsWrR/xZfAVrvW2E+qqF1zhaM2J/rsNRnobnMcLWENg78GDjcdOLLEnykut4nT5
         9ntBmXY007grOAVfY1an7MyesFXRShRes5vKEtGMEcHKDF/Z+X21g1bsnTtpdHgQCVZt
         D9nGgjqCRdHpoFUqTsReyoXGdO8bdJiCeETgsLO9uq/7W+C5goOAqpkE7U4eSVHOaDKl
         2dh0tyrYBzCOVhr4eaDrFFdkSDuFXokQyFgzyGz0HBSXY+kE81A/0m7onFTz2oGeot7B
         RM/O7MS6PE+ghcnN9zNJwe/e/5Egw7Z5ZOVfebfZwX1XFFKvXj0l6N9X+j8xyy6jBex7
         /JAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OIaaQt//nzIPwn+uOg6pI3Fun/12DBLYeKqfKTTvAPY=;
        fh=fep9HpSs4oiBgRbObX4jKXXofBE9DBGS6+ZjG/k1D6A=;
        b=IVs4IhZbeB5vKX8rUwUt5wVo3Xgzcf2OEiuQQSA4WgpXTxZxLIVJRfPYf9i3xHCMjd
         jn2YPNpZFHPU+wIC0NP3A/DnKmXfmaqbL8vwqUwv4cyzo05am95JwYEaGWq2fgCeTehy
         6Qekuua8TkWMlCkGbjvB1Ob9o362LPDlHVHd4EOr00fcyc4pkfYb5EBWCXgQq2uC86jC
         XGPQdezx4NFL9K0d4ZUBDcpWbza6eDRnknAryHCweMO3Ian04K+k62riDzLiiBLhrPJJ
         SEGTU5pz1BGQaqXPi1R1MUH4D0laZfU2D+/d0v5sz+Thz/wDtuklDudl1jWwGzwxg3OR
         QFBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400685; x=1795005485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OIaaQt//nzIPwn+uOg6pI3Fun/12DBLYeKqfKTTvAPY=;
        b=MGpdJjvI6+iL5XNpgB12m0biUKG8V+5dvBTriN7JTnMyLcNoSxYvXWJuzZpFzhWD/8
         jibjjKPnCqzpgfYI82n3IOBT+qBnz8v/Mxh4x3HxiNPMTC6V1uCGJxTfq6M0dkoudxzY
         rpRUriEjJ3cb39L3fnRIqpFBTgP/mCQRqUsVi+wacZomWLe6bb9NCgqHMVSPTAcUSdYm
         T0VT2CME4XbRkaviuuySVlYPyVPNz0ef1siEUfjsuKfyVu9ZNh8UFkb4kEDVYdHnwW7Y
         hAsBS+kAJo2QEKKQaqsfibI+AqTGDlLviHsoHYsyEUbpN/z5CwPYztozWJ+urNLFBoPK
         t5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400685; x=1795005485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OIaaQt//nzIPwn+uOg6pI3Fun/12DBLYeKqfKTTvAPY=;
        b=kDj58tIzs8ShcfZFIXM79nS6Lu5oY0HIIbjQ0IIwni/SEmUvTY685xNMkQKezKfPA6
         RE9TKRwBAz0x96YgCRMYBMM7/AfRFsDhyW38rJSksMVgdceT5OEKM07jDSbhNZIX3IQD
         nVKE9IegLasIsUukCTwFg55c0QwM4Glx/V4ttjyp6UvAyjkbaH7EvEjXhnsKZzShZSh5
         92Qvx36Fktu9EG5HUpUhJk7MPGf2VXKF/54WH6i3a/LujUSLvxaozhA+f0UVq/0yYDeY
         YKt7SiBqTKn9UE4AC9JgZUFA4D0p2mXt3XSFYDgGgwBwKW2stsPMQRbz477Sm0Jfh1Sj
         bhag==
X-Forwarded-Encrypted: i=1; AL+hErF+7fiS3hipLQQ+vszySpwugKBrPqmolSvpNeubJcbwq1EeFM/Cy6BRj1eMF36zwo5xofztKzoT/kJ0Whw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L1fU9sr5BSz6ZHnFw41JG18JoVNt1ECYBRZKuz1j/yM9YMPDY
	MVEOEw86e/CIGgKgYWXOdMDk6o0GxIQ/8DlVUGf4HhyvrOkdlo6J2y0YsWb6w/3hPdTXHEI2bXq
	S/gJCGoSmnpMXw2LXHfRiupgeZRUDSEHUrGRrwXcCD5Hj8LjjMCOti612zMNquGKQijS4qzuKos
	/EYI5BDdIij0sBYbPDg8qM2SdbvX3Lp9ONChmncSVo4g==
X-Gm-Gg: AYBFou1D3C4t/h/AVBwnHsHWKH9wyN6o7ZhwH3cgCaM7oabxeHk4eJw6aqiUyOB/fbW
	JR9d1uF/FqhoLGjtOXh7YCQdkwQBWePGnxbqISdkuHLTild5U+qWo/A1Zj4cxXT2HXM+6RyX44u
	R6vzinOf+f7mipV8etvIPn0A8GN0Ek4KHNz8EzftCA/WbFSMUG2ahX6Au4Rg==
X-Received: by 2002:a17:90a:c2ce:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3b182f5a137mr2516573a91.57.1794400684890;
        Wed, 11 Nov 2026 04:38:04 -0800 (PST)
X-Received: by 2002:a17:90a:c2ce:b0:3ac:a139:1b14 with SMTP id
 98e67ed59e1d1-3b182f5a137mr2516535a91.57.1794400684292; Wed, 11 Nov 2026
 04:38:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103093501.218232-1-paul.cercueil@bootlin.com>
In-Reply-To: <20261103093501.218232-1-paul.cercueil@bootlin.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:37:51 +0100
X-Gm-Features: AclHuK-dIsJ_Qoz2l3yI0jjzv4ubhU03owxy-3ZfjQUln--SJ7ACo_U1YirpRGQ
Message-ID: <CAPx+jO8xjpMAv_YQVJWPsBFBM5V-B715vGL40JXGVPWOJ-J5HA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-cadence: enable probing from ACPI
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Tanmay Kathpalia <tanmay.kathpalia@altera.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX+LBSv2sqGK7L
 WTRJsktw22ophHFRiVfxQTkDT10dzAfgz+r+e5pswnHRlPHcv/JV2ABagiV1ylO9h4UpVw/ewBH
 jn/q5qOF+RE+2v65IvTP5Yt+0GDgdTUuLJ9GQmg0vlTJaIytUyM20kr86bskOMCNq66o+W/yK+H
 hr/ZOhdJcoCDDaN+swULERTQc0niMT6ZOctW7K86lgmVVi5LzAFXhNaZLWn5NM4w4UiBESCydmR
 +fKnNsTXA3mXBEjJkZC4jmQnNJ00B6fAUIMVtrxQL6Aobk3USDl0rMYjvquNSx4zNC8b9ZyHONt
 AokJ7na+y9GkPGtmdIiWc7tKk0nj5d8Vxc68pvryv9SP6/0tROEwy29eWIguOi2OWewt7OXmBM6
 wA+NLCjFrm/Qxm3Hn7GSqnZgSIDUNxvrZdtfaHbi6GIi7dBMz/U1R76WbVYjWIXxHvKas6UkgBk
 7F2yRNL+6fQwKwBzHew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX77WKJ3cHbsWt
 pIE3YIQS++9v8ic002/PpbPaX4VyCrLgaVQrFgcMoBYugm3HTbIqLUpQkl9WItxjNlzI5R4V4V/
 QKtHjzHZp2CkjPIPKD7H9mf+PzgFMPM=
X-Proofpoint-ORIG-GUID: BNP6hHOuh2h6RSUAhSZj5HT71lst2Wf7
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af461ae cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=P-IC7800AAAA:8 a=YmKbF_H_a6i2MY2qjS4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: BNP6hHOuh2h6RSUAhSZj5HT71lst2Wf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050

On Tue, Nov 3, 2026 at 10:35=E2=80=AFAM Paul Cercueil <paul.cercueil@bootli=
n.com> wrote:
>
> Use the device property API instead of the OF-specific property API.
> This way, the driver will also probe from ACPI.
>
> Note the change in the core's probe function for SD6HC. We can't have
> named clocks in ACPI.
>
> Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-cadence-core.c   | 22 ++++++++++++----------
>  drivers/mmc/host/sdhci-cadence-phy-v6.c | 10 +++++-----
>  2 files changed, 17 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-cadence-core.c b/drivers/mmc/host/sdh=
ci-cadence-core.c
> index 745455743b01..c5a4fa8e2fc6 100644
> --- a/drivers/mmc/host/sdhci-cadence-core.c
> +++ b/drivers/mmc/host/sdhci-cadence-core.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2026 Altera Corporation
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/dma-mapping.h>
> @@ -145,26 +146,26 @@ static int sdhci_cdns4_write_phy_reg(struct sdhci_c=
dns_priv *priv, u8 addr, u8 d
>         return ret;
>  }
>
> -static unsigned int sdhci_cdns4_phy_param_count(struct device_node *np)
> +static unsigned int sdhci_cdns4_phy_param_count(struct device *dev)
>  {
>         unsigned int count =3D 0;
>         int i;
>
>         for (i =3D 0; i < ARRAY_SIZE(sdhci_cdns4_phy_cfgs); i++)
> -               if (of_property_present(np, sdhci_cdns4_phy_cfgs[i].prope=
rty))
> +               if (device_property_present(dev, sdhci_cdns4_phy_cfgs[i].=
property))
>                         count++;
>
>         return count;
>  }
>
> -static void sdhci_cdns4_phy_param_parse(struct device_node *np, struct s=
dhci_cdns4_phy *phy)
> +static void sdhci_cdns4_phy_param_parse(struct device *dev, struct sdhci=
_cdns4_phy *phy)
>  {
>         struct sdhci_cdns4_phy_param *p =3D phy->phy_params;
>         u32 val;
>         int ret, i;
>
>         for (i =3D 0; i < ARRAY_SIZE(sdhci_cdns4_phy_cfgs); i++) {
> -               ret =3D of_property_read_u32(np, sdhci_cdns4_phy_cfgs[i].=
property, &val);
> +               ret =3D device_property_read_u32(dev, sdhci_cdns4_phy_cfg=
s[i].property, &val);
>                 if (ret)
>                         continue;
>
> @@ -204,7 +205,7 @@ static int sdhci_cdns_set_dma_mask(struct sdhci_host =
*host)
>         struct device *dev =3D mmc_dev(host->mmc);
>         int ret;
>
> -       data =3D of_device_get_match_data(dev);
> +       data =3D device_get_match_data(dev);
>         if (!data || !data->dma_mask)
>                 return 0;
>
> @@ -649,13 +650,13 @@ static int sdhci_cdns4_phy_probe(struct platform_de=
vice *pdev, struct sdhci_cdns
>         struct sdhci_cdns4_phy *phy;
>         unsigned int nr_phy_params;
>
> -       nr_phy_params =3D sdhci_cdns4_phy_param_count(dev->of_node);
> +       nr_phy_params =3D sdhci_cdns4_phy_param_count(dev);
>         phy =3D devm_kzalloc(dev, struct_size(phy, phy_params, nr_phy_par=
ams), GFP_KERNEL);
>         if (!phy)
>                 return -ENOMEM;
>
>         phy->nr_phy_params =3D nr_phy_params;
> -       sdhci_cdns4_phy_param_parse(dev->of_node, phy);
> +       sdhci_cdns4_phy_param_parse(dev, phy);
>         priv->phy =3D phy;
>
>         return sdhci_cdns4_phy_init(priv);
> @@ -673,7 +674,8 @@ static int sdhci_cdns_probe(struct platform_device *p=
dev)
>         struct device *dev =3D &pdev->dev;
>         static const u16 version =3D SDHCI_SPEC_400 << SDHCI_SPEC_VER_SHI=
FT;
>
> -       if (of_device_is_compatible(dev->of_node, "cdns,sd6hc")) {
> +       /* Note: ACPI only provides one unnamed clock */
> +       if (!has_acpi_companion(dev) && device_is_compatible(dev, "cdns,s=
d6hc")) {
>                 clk =3D devm_clk_get_enabled(dev, "ciu");
>                 if (IS_ERR(clk))
>                         return dev_err_probe(dev, PTR_ERR(clk), "failed t=
o enable ciu clock\n");
> @@ -687,7 +689,7 @@ static int sdhci_cdns_probe(struct platform_device *p=
dev)
>                         return PTR_ERR(clk);
>         }
>
> -       data =3D of_device_get_match_data(dev);
> +       data =3D device_get_match_data(dev);
>         if (!data)
>                 return dev_err_probe(dev, -EINVAL, "missing platform driv=
er data\n");
>
> @@ -723,7 +725,7 @@ static int sdhci_cdns_probe(struct platform_device *p=
dev)
>          * For SD6HC, sdhci_add_host() will automatically read capabiliti=
es
>          * and version from the host controller registers.
>          */
> -       if (of_device_is_compatible(dev->of_node, "cdns,sd4hc")) {
> +       if (device_is_compatible(dev, "cdns,sd4hc")) {
>                 __sdhci_read_caps(host, &version, NULL, NULL);
>                 ret =3D sdhci_cdns4_phy_probe(pdev, priv);
>                 if (ret)
> diff --git a/drivers/mmc/host/sdhci-cadence-phy-v6.c b/drivers/mmc/host/s=
dhci-cadence-phy-v6.c
> index 22d56bb46d75..551a0e3b58ad 100644
> --- a/drivers/mmc/host/sdhci-cadence-phy-v6.c
> +++ b/drivers/mmc/host/sdhci-cadence-phy-v6.c
> @@ -880,17 +880,17 @@ int sdhci_cdns6_phy_probe(struct platform_device *p=
dev, struct sdhci_cdns_priv *
>          * Cadence-recommended defaults (2500 ps IO-cell delays, 24 ps DL=
L
>          * delay element) that are valid for typical SoC packaging.
>          */
> -       ret =3D of_property_read_u32(dev->of_node, "cdns,iocell-input-del=
ay-ps",
> -                                  &phy->iocell_input_delay);
> +       ret =3D device_property_read_u32(dev, "cdns,iocell-input-delay-ps=
",
> +                                      &phy->iocell_input_delay);
>         if (ret)
>                 phy->iocell_input_delay =3D SDHCI_CDNS6_PHY_DEFAULT_IOCEL=
L_DELAY;
>
> -       ret =3D of_property_read_u32(dev->of_node, "cdns,iocell-output-de=
lay-ps",
> -                                  &phy->iocell_output_delay);
> +       ret =3D device_property_read_u32(dev, "cdns,iocell-output-delay-p=
s",
> +                                      &phy->iocell_output_delay);
>         if (ret)
>                 phy->iocell_output_delay =3D SDHCI_CDNS6_PHY_DEFAULT_IOCE=
LL_DELAY;
>
> -       ret =3D of_property_read_u32(dev->of_node, "cdns,delay-element-ps=
", &phy->delay_element);
> +       ret =3D device_property_read_u32(dev, "cdns,delay-element-ps", &p=
hy->delay_element);
>         if (ret) {
>                 phy->delay_element =3D SDHCI_CDNS6_PHY_DEFAULT_DELAY_ELEM=
ENT;
>         } else if (!phy->delay_element) {
> --
> 2.47.3
>

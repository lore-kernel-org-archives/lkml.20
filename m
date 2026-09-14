Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D339141D239
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380588; cv=pass; b=fKqGd1/+O5YCUA+q1tdixpUrO5fuWQExYZxi1bgnimj1ityTaLx7uoOYc3Bt4T5bQOMqnBB1b9C//AkurM1QG+EC404tRi5WXNkDgKWHg8zLCDXJTAm6G2KEpuu1KapzkgcrF7Kn1ehstZUHGCsv9kkwxI7DJ8nph0saF9NAVMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380588; c=relaxed/simple;
	bh=rjEOE9sUHwclD2RnLO14aHO4Dd+e75AyPGzbfxHtzyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sfr8BSyWfLJUwp+dzo1kafEr4pETbksSVO+uZDkpx8wWjOOhtD2x2vBVQZ18c9mi/U3ix6/CIEIIz3of/dtCwEf+7cUtsZHMpkTyrdo8BE0cjfOKoh9pZ8YkOl/HvuZM74e8nCUWTtvhh2VM0Zkd8kdAVCg1j46416Y573Yqj4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ted10X4b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBO4KsJJ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ted10X4b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBO4KsJJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9no3p085578
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aI4PMHQwnMxJwwbf4y7Z8JLgo/8t7cwYMVkRcFaFXPE=; b=Ted10X4bk4RDDiro
	T9D/RaxdjCAQs5pUQ75PCQ5lvk4Y89C//Yt/KZJqktahm0pC7j+vMqZsBXwGHEa7
	0Al9tu9qzlCiMwArZracL0jFx8by/DRoIL8sJ4qQmhqzXitlBRodkmdvMv/N6s8l
	dNjIL4+dpHxJ0dsUckYPev31kqLICXSXkObjocSQxrFFBzIVaLSdVZG1LbLLwUtY
	GXo1OA8avaDWpPbV9CPHI2S6p95B6YAjKxx7rtVi5CukZZHTrOSjEl/WrYcF4Hac
	NoBU9w4Oof8dGR4l5l1+QEtXmwaAY/AKbF6aL/N/J+ES7pY0k7wWkFnD8MC8P3JR
	kC0I4Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9de30r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:09:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so40525225ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789380584; cv=none;
        d=google.com; s=arc-20260327;
        b=dmQTOEjgUmtQ00bjNF7/gOA3a1QoJNseS0lfiIp49Fa8YG5ql90OBSQZBq+8lZNzRo
         8ZT6T/NPar0FY+5uZLbi8IRLHCyd4AT+NdDj6J6Ad/yp/R0mtrulFiULdQnz86pfCl2d
         zYB3v+9N6gu8H4hJpeDUCnkBi9wKPYfZWKWbQPVBdnHsr2pfs6ThRH3SQBMQaLnI8rsQ
         392ZgrNv0GqoTeZx6J2gjcA/ZtG2///xFgyFfMO0JPUIHc0F7epmFf7qQHDO5nS/Xmda
         /hsYmglba7TqUmNj7kLaf6lIo2J72DzU5eVRez9u6XJ8uamPCk2rdxQrGy1gyDJAFRVj
         wYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aI4PMHQwnMxJwwbf4y7Z8JLgo/8t7cwYMVkRcFaFXPE=;
        fh=r5NafCWvZL6KY6J7tzsMLxajqq9yNuWqKRnkk5BRqWY=;
        b=Q8JH8p+KvxkipOhC1IYqEDXi62hsVs/n1iuArsolMo41XVXeqoR+EhLJyB3Uia2E7k
         BkfoN93Kg7st50JUndtD10qu9VJf7QcX6g14VLCH9lA6gk/JWQwEJsifxeWM4GimCMe/
         jnTIMWiBRNligE+SU4dTSj6Lp5+0cZXKcq3qATVWeD3owLFFeTko/NGeQPLrHNlpv1xs
         +scWl73ptehYUDZSi1nAMz+EkfKYm14PrLT1tdEql2GmBniXvGv59F/JGCFurxMcGnSZ
         Q+jGaPyK69HAoqbWm2vdbSANx+jf9LmK4qy7tADQgYXNxA6s/JcpPAFwq6FJgaumQ9Lu
         0g8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789380584; x=1789985384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aI4PMHQwnMxJwwbf4y7Z8JLgo/8t7cwYMVkRcFaFXPE=;
        b=YBO4KsJJzQh30LW0d+AVtYnaXTQOLcq31N5XI0Rtr3rztbJeHNme/2BVxBiVcsMk7B
         6EReaHTKAXglBqKEnMwKwS3oDHblZKhGYgmw0AaocdT0BTeF+8WPEDbFBfkGRyCdAFZh
         VoqlydtqMUFYPD6D0V4ypXHZmqC6apIl7DRAZWoJ9Z+LEwwzxsgfml0oGNGHqUTOaaKt
         2Pdi9njCZNIBjmq2a7siaVVjtQrZqN4kIahQz98J6zSI8aqWNdAesmprU5ajYyxDZ7HU
         Mq0iixXfauVtO/fYWTDcPdyV1gn9LBZ46s9QwQr0beAseH1K49qQ+EcA7gXvu1LIEg8E
         VnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380584; x=1789985384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aI4PMHQwnMxJwwbf4y7Z8JLgo/8t7cwYMVkRcFaFXPE=;
        b=hbtChNoDywchjbAv5S7jHvJQ92UBYVdTlDwHolDpNvPeHj4+B0BcntUUFf0Ve5IDo8
         lAfr6G6DgV/kkv3Z0nAhWdyuuv9m42NIMyubElT/bIVk+tzzADWxEzL31Z7foN6uksrG
         yEA/ubDdpiSAbrMIqudOSk7DQh2ucdI51fD/LdaBajSY5cgmj3kE5eB0hlu/E9walU9j
         eBlAARQjGhG/AODXlbvuxYWfevtzXGeiAx4eP+iFChd+bI03MybBFzTYPmwmi+cVWshX
         r/P9RghNrGBAcNrRyi63sNscsCGfXf/5YSNoSVdPhb8Z+2OfzWsmaPJClb7kIvhXdsUH
         JSlg==
X-Forwarded-Encrypted: i=1; AKwUvBzlLG2v2e3GlZmXskaSDxwI6P9SNlECq7U2SSDHi/odpJsben+fsHOyvCTckzFyHQpUzwSHTk+IPVSM61I=@vger.kernel.org
X-Gm-Message-State: AFuF++kP9ObuJSONR16rxqf5dTDMJwNUU+ahFd+T2K1W7wfmOFlG9SDH
	6q8j1jjaaqGOeMBf9CLxTCSjHOccgXJ11mtJYDzW8jpCVJ5D2UQJt6kUjQb/QA4Lv8TcisgQt8T
	zUjtSRjpK5Qfe3ChSQLejbTMJh4yUvWXXxEJNnz0jhwYFjHDpSl4yVck/2MZgd5Drmvl9w/sP36
	drfdb4+IXsp/DYErv3Gie5FIsXzX1RHay8/UqeRyY1uF1ElchYAg==
X-Gm-Gg: AYBFou3/FJHabx74fL+1B4J5c0SI6gCo35DCOiSuLvMY6p0sGJ7fLh825OKLds77Axc
	aaU7GZKfjsToDrwAYcFNcVagcSHi/GHA3JC2x4kcpKvz/2U9298+2ewMN15ghGOMLN6RNe4Dgj1
	7nzbN4+IaxOUGWIo7x1Zv4dsnKCFUuY98c/Uw/GwX02MJDBUeFKGS5ZTDujg==
X-Received: by 2002:a17:903:1b6d:b0:2dd:5363:3219 with SMTP id d9443c01a7336-2dd6c757186mr43992895ad.20.1789380584389;
        Mon, 14 Sep 2026 03:09:44 -0700 (PDT)
X-Received: by 2002:a17:903:1b6d:b0:2dd:5363:3219 with SMTP id
 d9443c01a7336-2dd6c757186mr43992395ad.20.1789380583981; Mon, 14 Sep 2026
 03:09:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909222432.62847-1-rosenp@gmail.com>
In-Reply-To: <20260909222432.62847-1-rosenp@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:09:33 +0200
X-Gm-Features: AcwNN1U5GXLHTiZb9rdmoFd6O3EjdjtICQOfMAX4hVsEWVlfxHEDcRmxUYeTP0E
Message-ID: <CAPx+jO8C7hz5qctbpOVJZN_PRTTrb_Q_di6VnsdJd3Q+DsCOtw@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-pxav3: avoid of_node
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfX5Wl4JWt7Tr11
 0boDG9iHBLQiJyB5XiT0BpdNUd335gQxL5aUxf/CJgulN12rK7jOuq6xFu5OvMzpwTHvuJo1JT2
 J3J/W9d/4vwEftGu/ChpWVKPEXH5S61wH2ek+IgoOAWvShslkhsd0SuWTESKVuITvnyAan3JWrL
 Wh4p2ngtXv/aAN0PIX/Jdqx92zPtO281PRxNkIG1l97AMp2TGR7PRidjNzH+7gtYbg3lgUMABB2
 RP71WUcAPYDT+WJ80eAgDDuiTUYtAU5EIkeBHSXEzlZAcgbpI7j5KDIV8jUH9uEO+liPdczNYtR
 gJ+pHTsJavrpruxOGuPVcdf5JvWKJsjIECQW3SQnO20QcXYXsngyeV6QLde9yISgpwFu5CEE4OV
 JVNRxu8aBr69DjlZsyCApLWnGevT5dw19ldSCZC/xOsly3gAJqnArfl7Uz9uCyYA/yAP2VP1CO2
 wfFPg2iHk5IQBDLFxXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfXz6y0BdQjMBLj
 nAWrxpQpD98/W7jWMcdyJBflPzX2WvOnch5eafd7zq2hWic/kYirshd/4Itp5kXgpy7aCAV3ZZZ
 9e0AcFlJ81BN1+eCeEgxEs3tW66cZgI=
X-Proofpoint-GUID: GCDfT-gY_gSJi_qK_-NxwHAhGqjycRri
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7c7e9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=DDOL9g8ZTEjboH5SDGIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: GCDfT-gY_gSJi_qK_-NxwHAhGqjycRri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140145

On Thu, Sep 10, 2026 at 12:24=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> Use device handlers instead of of_node ones for simplicity.
>
> As this driver is effectively OF only, it ends up behaving the same.
>
> Change is_bool to present as no-1-8-v is not specified as a bool in dts,
> but as either present or not.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-pxav3.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-pxav3.c b/drivers/mmc/host/sdhci-pxav=
3.c
> index 181b4989c74d..f39764ffd4a0 100644
> --- a/drivers/mmc/host/sdhci-pxav3.c
> +++ b/drivers/mmc/host/sdhci-pxav3.c
> @@ -123,7 +123,7 @@ static int mv_conf_mbus_windows(struct platform_devic=
e *pdev,
>  static int armada_38x_quirks(struct platform_device *pdev,
>                              struct sdhci_host *host)
>  {
> -       struct device_node *np =3D pdev->dev.of_node;
> +       struct device *dev =3D &pdev->dev;
>         struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
>         struct sdhci_pxa *pxa =3D sdhci_pltfm_priv(pltfm_host);
>         struct resource *res;
> @@ -155,7 +155,7 @@ static int armada_38x_quirks(struct platform_device *=
pdev,
>          * controller has different capabilities than the ones shown
>          * in its registers
>          */
> -       if (of_property_read_bool(np, "no-1-8-v")) {
> +       if (device_property_present(dev, "no-1-8-v")) {
>                 host->caps &=3D ~SDHCI_CAN_VDD_180;
>                 host->mmc->caps &=3D ~MMC_CAP_1_8V_DDR;
>         } else {
> @@ -364,14 +364,13 @@ MODULE_DEVICE_TABLE(of, sdhci_pxav3_of_match);
>  static struct sdhci_pxa_platdata *pxav3_get_mmc_pdata(struct device *dev=
)
>  {
>         struct sdhci_pxa_platdata *pdata;
> -       struct device_node *np =3D dev->of_node;
>         u32 clk_delay_cycles;
>
>         pdata =3D devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>         if (!pdata)
>                 return NULL;
>
> -       if (!of_property_read_u32(np, "mrvl,clk-delay-cycles",
> +       if (!device_property_read_u32(dev, "mrvl,clk-delay-cycles",
>                                   &clk_delay_cycles))
>                 pdata->clk_delay_cycles =3D clk_delay_cycles;
>
> @@ -402,7 +401,6 @@ static int sdhci_pxav3_probe(struct platform_device *=
pdev)
>         struct sdhci_pltfm_host *pltfm_host;
>         struct sdhci_pxa_platdata *pdata =3D pdev->dev.platform_data;
>         struct device *dev =3D &pdev->dev;
> -       struct device_node *np =3D pdev->dev.of_node;
>         struct sdhci_host *host =3D NULL;
>         struct sdhci_pxa *pxa =3D NULL;
>         const struct of_device_id *match;
> @@ -433,7 +431,7 @@ static int sdhci_pxav3_probe(struct platform_device *=
pdev)
>         /* enable 1/8V DDR capable */
>         host->mmc->caps |=3D MMC_CAP_1_8V_DDR;
>
> -       if (of_device_is_compatible(np, "marvell,armada-380-sdhci")) {
> +       if (device_is_compatible(dev, "marvell,armada-380-sdhci")) {
>                 ret =3D armada_38x_quirks(pdev, host);
>                 if (ret < 0)
>                         goto err_mbus_win;
> --
> 2.55.0
>

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38AE43304B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132334; cv=pass; b=LVE7bgGsqg1JQArlGED611prZvILnqOMIB/zlwcd/xwFzBHU69f6j8nG9Ummsq6+HpBjHe2PooowoD5dSqW7gEfJAfSUJdinrA01LEGxnM1yfqj0Ml7/r9cMcW4yb4lWqu7KuUm/OARYAjSISMd5L1KC/z7l4rSOioJc9BShFMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132334; c=relaxed/simple;
	bh=R0G41gFSO5bHR6LY6xwXakPLyw++NfcFAAdJVhWjJiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZfT7djBN/LiuHJ8sx3TOIbOa1vilXt8YU4K3r8NzdRO3kVj7dLL0qH6vYmXgyTlaoTlwD4s8t/BIas9XaJFhVK2o4WtUbaN9tZ/yyu81uaH/73s2UCgZqwS0BHjHrspHeQOSqkhVpskQUGaheh9IrZ31m2Nccz6XM4YzrVpTGSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aygt6tov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/x2KXPx; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aygt6tov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/x2KXPx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiXGg3505465
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HKTp/IY773F08+8E7J5pPWPMUyIPEHKU71ocxCPr7kk=; b=Aygt6tov0zoV4PFB
	FAbT8kqQ/RutqTQC0/lfRLFw+v8RdgLqZC8/63EymNz6hn8FlE3bR6yFILsbc8EJ
	FWoL+sVcsprZcqbpWqI9PPtpMvAtUwaY3RvBp36Huws/dtZPT2F1B6qS3MzDlyTX
	C7QzN34cBF9DwSwUC3NCDGD330JWcCm8V8Pl6yQBqbMiZ1JE8tUUj5znVhZGtRyc
	ZKweO0WKA0tsHNGRsHtIpns7i7BV02yIHGVOtMA9Eh4Bre+a4+4tmEDdQtBUotah
	7YZviFK9J4PVkgDyXko5PUKSNxICkp6RizRgCr/XTef86zeMfrZI1QagWJBYJC1y
	54igwQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfhkuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:12:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1288994a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789132330; cv=none;
        d=google.com; s=arc-20260327;
        b=rw++znC8XwCVE72Pw4uhbevgMaj94E3+J/hOBce5rI0hU1u3m8BXWMKgbsmRn4Ozrj
         BvVZ6pwec3TTaZ2AUMPrvw9HaxHrkWT1ATu/3x0FxX0Gdy4oBH+tnB27nU12D+XHWtrf
         +0hKCQYKHeLQKoKaF92arpJiOcmdR42T9EeUqPCcoodnrYxV4zVTt6PTyqcxZMK5LAcG
         C8EfWFkFeuJlbvhfMrvkQeUsYwVj3Uuv2AizFTUk7FdD2+X65W9qdw+ycCvXhF9o+7+j
         y1iBxQC4I3scb83AvikDg563eeLq41KXKKaRTu+e2y6CbJvfUe0AHfURPY/BT8wRn4wo
         gJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HKTp/IY773F08+8E7J5pPWPMUyIPEHKU71ocxCPr7kk=;
        fh=toD3O0vHPq3ZRZJr5UKBdxWRvFJxKa3CIFzuWsS/S7Q=;
        b=lG3uyH8YrZe+LRg+dVa0UD/BQkqpC55dBV/2Y3OCejUhzHe3hasFBpJPJlA5/XBMGm
         SXYw+F8sqPoHYlfpBW834RjgQ6+MEmtbWCZgtm2wa1fp/2HY/YP47nRg/uY6nltkUIws
         6/Vrp3UlMm5LsBeDSbi3XzpGG5tdV4GJzeR0PhMdpqkb4b5LOQOhHaLr4sF/ISG5TxrU
         /5+leUM6c4XwDWXVPaSQLZYAnMSNtF1UZVp+Bh9KYFhJph6yDPhVLUBRwRwXtKtsmwec
         +ML026QilRCgC7RUNwFg/Uq66tsmLcqQc5sp6GLbEMcDJ03QRtea/F3Rci1LV3htm38F
         h/Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789132330; x=1789737130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKTp/IY773F08+8E7J5pPWPMUyIPEHKU71ocxCPr7kk=;
        b=R/x2KXPxHMVtXYX9LO7IlgJuWsv5SxaqhL15uEzQ8AArlkNM7IWB+EuA//uZl9zjry
         Jxmiabir1/vLfDV2cUyYoSDrM22Ck0+T7CHp6p7bg7xC68zUbGU6VdvLB/gwLCVsNSCp
         yYzEr3BIuV3i1vpq2nW2rOfXv6338LpT0grco8M7jZyXFaCw8HZQvX+i2RnlfV+2nvVG
         3s+Lh/TV1V2MomG+tDmwaJG6qER+PDWhRLfLi1eUCmCKKcVBEw/mA5evvyCcyCKzPcrm
         7AAn7BYxQlSmKKq0hASAn+Geylir6D2HPoNBQZqsHLSDbo2gh9mIpoND9bYeM1XymMX0
         qSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132330; x=1789737130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKTp/IY773F08+8E7J5pPWPMUyIPEHKU71ocxCPr7kk=;
        b=j16jk52UKnlNo6ECGBik8GRTA1v4o8PhaM31yPU3iQqWl6d2tlS/LEI3LiEB6zqTje
         pRtsa8g5r5n0Qs4z6MOEiEeCAlG1m4jw8QnELRdfP7XDZXPuoff14lJT9cKPhI8Gk/rn
         rj4aQEo/zyRjjSKIRHi37i+vZzHp+nK7KJmOBUmHU8gonuUJktKyHI3BQ2W5J1cA/Eep
         84f47S8Nji4gD7xNFmhWDtu49/0eMrj9kZnduBQYZ+2CVrkjokSXVySvhjYZZrc+cEBh
         YkihZA0nku3jn6To7a+8wYHsJI5ZDCZS89RJ/pTk8LGNonmAhxqyahjH8uQXquPSMTV1
         EzuQ==
X-Forwarded-Encrypted: i=1; AKwUvBx11zmvNyp/S2l3HWGruIyz/YlW7v+SmLgfMDJO5nEzDwa2XqlhG9qGAKu6Bndx1n/fzSCcClEHCz21vqg=@vger.kernel.org
X-Gm-Message-State: AFuF++lFdV+QNxU9uQI/JCk8nBcOp0OmNFELjAURiqqvPgX9X/tzNO2P
	SzOIkPnxalmfk4TlJTPaiBDqrd7GWDkavIMEL4qxziDEzekYwx4mKVfXp3E+4gFOVz4fyVsVp3V
	DF/ZfMjnprTr+3ONqvCDE3I83gWWGiYmoO3fXCNc96/7kIteO/rDH3TezLViQ1CdFjq1U7kz9Ip
	mi1b0zFTaMs+LixKcFRY24vic3E5l/ZmVHNENpZ/Y82Q==
X-Gm-Gg: AYBFou32MiHRCSYqhlAJrayQM9qHdEGDHJwQpf7ZgUCBFmv1iOwjhZCFh9SH7Vu+vZl
	jwKA37dRqn8LlGmDKrDUFCYj7vaP3DWpPeqJw02XQwmPKrrpVZSFOwECgq/ZGRr5AWKcr+2TTDG
	Z5dVzh4Yt5nBxs+7N8vz1LXvXNQsuRnf5V7D3WiOOGm5yugRMIVteSYFR7aw==
X-Received: by 2002:a05:6a21:a96:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-3daed3f8e55mr8023533637.25.1789132329926;
        Fri, 11 Sep 2026 06:12:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:a96:b0:3d3:aec2:4dcd with SMTP id
 adf61e73a8af0-3daed3f8e55mr8023476637.25.1789132329455; Fri, 11 Sep 2026
 06:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com>
In-Reply-To: <20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 15:11:57 +0200
X-Gm-Features: AcwNN1UZPZAmOQ3htDsLJexxGkB7aiDXDXlLaVZbjwo9vpFFVATaLlk8aAB5hoE
Message-ID: <CAPx+jO8D4jHwGpPrGng2dL6Ng8pU2qqRMRzxX0gh_SPLfDKWog@mail.gmail.com>
Subject: Re: [PATCH] coresight: handle runtime PM resume failures
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4NCBTYWx0ZWRfXwlgEhuGrFcJc
 HER9GNvPSvwXuxZHtee+b254Gf/eqUsdPwgc7/L+pOhztN1QMgo4e5wAUSEKNLgv01OCawWsu5M
 OMCCeqTSr+z3bDFZtOrNFGHKExlzC1a+64wiOQ2XO9LTrA8FUchOTh0kiTBDWRhLLAf/WlXHgYP
 yUz7c/KqLQIWx8+nLe9aAUX+OCc1TKJ9BhQaObWtas0UjEy3JzjTWljz5nfJZ+DPgwhA1Cfqb8R
 0ZWDnZX35a4AmRzdq3+95Lb/lad9b+0zLMjlt4VifKE63+7gTze/JW55zVafsIf30go9MzNbQoH
 S3oFK2uw4Yw3cXPwcMvdX/EEFRdJLQOLymjnpvvkumMuub9vJCRhsDG1GdCtnTt87qp/vkTFipv
 Gp+yIWvfhxR7CAuPHmeUfpJwzVW5B/rNua0xmTfsBJAWVFv75+sOwmgWVUdP8fMD8SptwODXVAj
 vaaZrn7XfQJLB3Hbwfw==
X-Proofpoint-GUID: gqENy24v7dJbb8LXDWhRbLgL5PH-NsNm
X-Proofpoint-ORIG-GUID: gqENy24v7dJbb8LXDWhRbLgL5PH-NsNm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4NCBTYWx0ZWRfXx7ha82CnT0vg
 0CdsArZLRbIF6QbXFdUGTE/7dKxub+41j5atqmAs0YDF3tgEHXu/SOh0P1chX3OieXyJF+Gj4eo
 mADLr7DGvHINdW3frv224StbJE6xoFo=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa3fe2b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=gBcF6orTRoxn-YdRBJsA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110184

On Fri, Sep 11, 2026 at 12:29=E2=80=AFPM Yuanfang Zhang
<yuanfang.zhang@oss.qualcomm.com> wrote:
>
> When a CoreSight component's parent power domain, such as a CPU cluster
> genpd, fails to power on, runtime resume returns a negative error. Severa=
l
> call sites ignored that error and continued to access registers on an
> unpowered device, risking an external abort.
>
> Replace the remaining pm_runtime_get_sync() calls with
> pm_runtime_resume_and_get(), which restores the runtime PM usage count
> when resume fails. Abort before accessing hardware and propagate the
> error to the caller.
>
> In coresight_get_ref(), unwind the module and device references. In
> debug_enable_func(), roll back the CPUs that resumed successfully before
> the failure. Finally, release the mode acquired by stm_enable() if its
> runtime resume fails.
>
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>

Feel free to add:

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
> This patch converts the remaining CoreSight pm_runtime_get_sync() users
> to pm_runtime_resume_and_get(), propagates resume failures before
> hardware access, and completes the related module, device, CPU and mode
> unwind paths.
> ---
>  drivers/hwtracing/coresight/coresight-core.c        | 13 ++++++++++---
>  drivers/hwtracing/coresight/coresight-cpu-debug.c   | 10 +++++-----
>  drivers/hwtracing/coresight/coresight-cti-sysfs.c   | 10 ++++++++--
>  drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 10 ++++++++--
>  drivers/hwtracing/coresight/coresight-etm4x-sysfs.c |  5 ++++-
>  drivers/hwtracing/coresight/coresight-funnel.c      |  5 ++++-
>  drivers/hwtracing/coresight/coresight-stm.c         |  7 ++++++-
>  drivers/hwtracing/coresight/coresight-sysfs.c       | 11 +++++++++--
>  8 files changed, 54 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtra=
cing/coresight/coresight-core.c
> index 928488a216d4eafa3cdb5f882ae5f44ddaff0448..ff93a017dbe22b01236ac2e50=
21da9b82890e72c 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -822,14 +822,16 @@ struct coresight_device *coresight_get_sink_by_id(u=
32 id)
>   *
>   * @csdev: The coresight device to get a reference on.
>   *
> - * Return true in successful case and power up the device.
> - * Return false when failed to get reference of module.
> + * Return true on success and power up the device.
> + * Return false if a reference cannot be obtained or the device cannot b=
e
> + * powered up.
>   */
>  static bool coresight_get_ref(struct coresight_device *csdev)
>  {
>         struct device *dev =3D &csdev->dev;
>         struct device *parent =3D csdev->dev.parent;
>         struct device_driver *drv;
> +       int ret;
>
>         /* Make sure csdev can't go away */
>         get_device(dev);
> @@ -843,9 +845,14 @@ static bool coresight_get_ref(struct coresight_devic=
e *csdev)
>                 goto err_module;
>
>         /* Make sure the device is powered on */
> -       pm_runtime_get_sync(parent);
> +       ret =3D pm_runtime_resume_and_get(parent);
> +       if (ret < 0)
> +               goto err_pm;
> +
>         return true;
>
> +err_pm:
> +       module_put(drv->owner);
>  err_module:
>         put_device(parent);
>         put_device(dev);
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/=
hwtracing/coresight/coresight-cpu-debug.c
> index 3a806c1d50eafb4249ab516ef846e437831b9681..39602d610e5b22ec4f165dbb1=
26a7c06aea08eb0 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -429,19 +429,19 @@ static int debug_enable_func(void)
>                 if (!drvdata)
>                         continue;
>
> -               ret =3D pm_runtime_get_sync(drvdata->dev);
> +               ret =3D pm_runtime_resume_and_get(drvdata->dev);
>                 if (ret < 0)
>                         goto err;
> -               else
> -                       cpumask_set_cpu(cpu, &mask);
> +
> +               cpumask_set_cpu(cpu, &mask);
>         }
>
>         return 0;
>
>  err:
>         /*
> -        * If pm_runtime_get_sync() has failed, need rollback on
> -        * all the other CPUs that have been enabled before that.
> +        * If runtime resume has failed, roll back all the other CPUs
> +        * that have been enabled before that.
>          */
>         for_each_cpu(cpu, &mask) {
>                 drvdata =3D per_cpu(debug_drvdata, cpu);
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/=
hwtracing/coresight/coresight-cti-sysfs.c
> index 3fe2c916d228808233ef19e9213a0cc0ce3cf297..6886b8713368058b9cf33ab7f=
afb5f87e23c1ec9 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -167,8 +167,11 @@ static ssize_t coresight_cti_reg_show(struct device =
*dev,
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
>         u32 val =3D 0;
> +       int ret;
>
> -       pm_runtime_get_sync(dev->parent);
> +       ret =3D pm_runtime_resume_and_get(dev->parent);
> +       if (ret < 0)
> +               return ret;
>
>         scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
>                 val =3D cti_read_single_reg(drvdata, cti_attr->off);
> @@ -185,11 +188,14 @@ static __maybe_unused ssize_t coresight_cti_reg_sto=
re(struct device *dev,
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
>         unsigned long val =3D 0;
> +       int ret;
>
>         if (kstrtoul(buf, 0, &val))
>                 return -EINVAL;
>
> -       pm_runtime_get_sync(dev->parent);
> +       ret =3D pm_runtime_resume_and_get(dev->parent);
> +       if (ret < 0)
> +               return ret;
>
>         scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
>                 cti_write_single_reg(drvdata, cti_attr->off, val);
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/driver=
s/hwtracing/coresight/coresight-etm3x-sysfs.c
> index b3c67e96a82a4995515457d1ac0a5b183b162f0f..b34e282ec4a5f37f7de1d2ff1=
18042b47368acd7 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -47,8 +47,11 @@ static ssize_t etmsr_show(struct device *dev,
>  {
>         unsigned long flags, val;
>         struct etm_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> +       int ret;
>
> -       pm_runtime_get_sync(dev->parent);
> +       ret =3D pm_runtime_resume_and_get(dev->parent);
> +       if (ret < 0)
> +               return ret;
>         spin_lock_irqsave(&drvdata->spinlock, flags);
>         CS_UNLOCK(drvdata->csa.base);
>
> @@ -933,13 +936,16 @@ static ssize_t seq_curr_state_show(struct device *d=
ev,
>         unsigned long val, flags;
>         struct etm_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct etm_config *config =3D &drvdata->config;
> +       int ret;
>
>         if (!coresight_get_mode(drvdata->csdev)) {
>                 val =3D config->seq_curr_state;
>                 goto out;
>         }
>
> -       pm_runtime_get_sync(dev->parent);
> +       ret =3D pm_runtime_resume_and_get(dev->parent);
> +       if (ret < 0)
> +               return ret;
>         spin_lock_irqsave(&drvdata->spinlock, flags);
>
>         CS_UNLOCK(drvdata->csa.base);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/driver=
s/hwtracing/coresight/coresight-etm4x-sysfs.c
> index cc6cdd3ae29d502a2e67f07400de957b6dc71af6..55e05c20b302d4bf55c4df30c=
9ee6d6a1b5f1031 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -2457,10 +2457,13 @@ static ssize_t coresight_etm4x_reg_show(struct de=
vice *dev,
>  {
>         u32 val, offset;
>         struct etmv4_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> +       int ret;
>
>         offset =3D coresight_etm4x_attr_to_offset(d_attr);
>
> -       pm_runtime_get_sync(dev->parent);
> +       ret =3D pm_runtime_resume_and_get(dev->parent);
> +       if (ret < 0)
> +               return ret;
>         val =3D etmv4_cross_read(drvdata, offset);
>         pm_runtime_put_sync(dev->parent);
>
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwt=
racing/coresight/coresight-funnel.c
> index 0abc11f0690c5272ebd55df9e98544e3b401cfe6..5824a1e4d046a3caf5b32ed1d=
8526b8bd7e9ca76 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -190,9 +190,12 @@ static ssize_t funnel_ctrl_show(struct device *dev,
>                              struct device_attribute *attr, char *buf)
>  {
>         u32 val;
> +       int ret;
>         struct funnel_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>
> -       pm_runtime_get_sync(dev->parent);
> +       ret =3D pm_runtime_resume_and_get(dev->parent);
> +       if (ret < 0)
> +               return ret;
>
>         val =3D get_funnel_ctrl_hw(drvdata);
>
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtrac=
ing/coresight/coresight-stm.c
> index 4e860519a73f6fff640090cf58298b89a31e6359..b9f15990ed994ea827c8e237d=
764e74d8d231ddd 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -196,6 +196,7 @@ static int stm_enable(struct coresight_device *csdev,=
 struct perf_event *event,
>                       __maybe_unused struct coresight_path *path)
>  {
>         struct stm_drvdata *drvdata =3D dev_get_drvdata(csdev->dev.parent=
);
> +       int ret;
>
>         if (mode !=3D CS_MODE_SYSFS)
>                 return -EINVAL;
> @@ -205,7 +206,11 @@ static int stm_enable(struct coresight_device *csdev=
, struct perf_event *event,
>                 return -EBUSY;
>         }
>
> -       pm_runtime_get_sync(csdev->dev.parent);
> +       ret =3D pm_runtime_resume_and_get(csdev->dev.parent);
> +       if (ret < 0) {
> +               coresight_set_mode(csdev, CS_MODE_DISABLED);
> +               return ret;
> +       }
>
>         spin_lock(&drvdata->spinlock);
>         stm_enable_hw(drvdata);
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtr=
acing/coresight/coresight-sysfs.c
> index 4b010f8bc4c08da31b3d295be6c37b6d941629d2..5849dfbd9d0bd3ad10734919f=
78bc39cc968539c 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -17,8 +17,12 @@ ssize_t coresight_simple_show_pair(struct device *_dev=
,
>         struct coresight_device *csdev =3D container_of(_dev, struct core=
sight_device, dev);
>         struct cs_pair_attribute *cs_attr =3D container_of(attr, struct c=
s_pair_attribute, attr);
>         u64 val;
> +       int ret;
> +
> +       ret =3D pm_runtime_resume_and_get(_dev->parent);
> +       if (ret < 0)
> +               return ret;
>
> -       pm_runtime_get_sync(_dev->parent);
>         val =3D csdev_access_relaxed_read_pair(&csdev->access, cs_attr->l=
o_off, cs_attr->hi_off);
>         pm_runtime_put_sync(_dev->parent);
>         return sysfs_emit(buf, "0x%llx\n", val);
> @@ -31,8 +35,11 @@ ssize_t coresight_simple_show32(struct device *_dev,
>         struct coresight_device *csdev =3D container_of(_dev, struct core=
sight_device, dev);
>         struct cs_off_attribute *cs_attr =3D container_of(attr, struct cs=
_off_attribute, attr);
>         u64 val;
> +       int ret;
>
> -       pm_runtime_get_sync(_dev->parent);
> +       ret =3D pm_runtime_resume_and_get(_dev->parent);
> +       if (ret < 0)
> +               return ret;
>         val =3D csdev_access_relaxed_read32(&csdev->access, cs_attr->off)=
;
>         pm_runtime_put_sync(_dev->parent);
>         return sysfs_emit(buf, "0x%llx\n", val);
>
> ---
> base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
> change-id: 20260911-b4-coresight-runtime-pm-failures-70f250927aeb
>
> Best regards,
> --
> Yuanfang Zhang <yuanfang@qti.qualcomm.com>
>
>

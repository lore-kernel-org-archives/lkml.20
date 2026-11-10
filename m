Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794317393;
	b=tmtUwqP21os9QAs4x3ZGmKltNE1QzDZTH7bXuWj94rNkEBS2ldEDBFZSTZY5hm9Po+4T
	 rQb5+3Uj8L3u4HmVI5gzmm2jYlFkQg+B8xVQKnN9PkNgmLXutwwrsFa8C80NIs/fTKT3/
	 g/OKI9ZYGUf5gCFdYjzP/wiYqK+YL5+ntKTtDXfqxn8NJNWFrBd/808Q9GVAO0/70qTyc
	 NXbYL25JXMABm/4BiyBSEKreKLNjEcXCgLplKuAGuyH9OTQCSyTxt7lvbM6F3skL8OM5B
	 sV5RKXh7AtnHdvHUXqkvYNOORdnXJk0KG+qFWfIthetciKHaatKkfH45US3yMHxMa9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317393;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AIF/t+4UqjFofmLj1BZ9vB8ifjYA8eqgYZooCvzGCeU=;
	b=UklRko0GIZyDWo000XOn1t4LEyQEaYWIqqTpqBnk0Vzvh6Wyp6luE9h4ecrw7ps03LLt
	 8Rc5h18gpQgHZc6X+psSmcfSBbpIEBH7cn3dmmozM/FnTiHfx6B7p8Lwx0xGVdPiYX1yL
	 b2jI+iOk8NJPIXTCtq5bzx4plQqzyl5Ho19fcdsmB5qp3R2VkwQ/NZZ+xJhlvA5pS7bti
	 kwSLjH/bo/jOTUt0y39lVWGzgAgWh45lmbRI9iEPxFGxsLDLpjnY3gvLAQJQOBI0XHIzZ
	 bXoJY0mm8swHXQim6xJGtlWL8ZNoxezW6ZqoRPr5nLgOw6BEZ7gcqd7Hafpd4yzug1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zou0AjyL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oc8Czzsl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A346606AF3E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A346606AF3E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zou0AjyL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oc8Czzsl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAFHt3196354
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AIF/t+4UqjFofmLj1BZ9vB8ifjYA8eqgYZooCvzGCeU=; b=Zou0AjyLKM6j0VA7
	3q3Fx7d/Y/X52cT+Yom70BG5w9ahW75aYvEA9SlXbi3bTXz0VUxgIaa57gs6ANWB
	jYibZnaf9jkb85Pilil+zmcE3fCq9lt1eAYg0Zg7FdoxtX0EWffysrU6IhuDMRMN
	LW5rhZgjQ8C+Fu7rOHqbh/Oaweq3Q902njRvmkc21XBIrhT35XT18qoUPFkD0IoW
	MPVvHlPkLYdtt2J/teuox7eI+qRgIpozA7s5eZaph3cHCYeOEj54VeTOIM6IoL6r
	3kOdiWBtNDfR5QLTF4CseZjhumoNuIEw1Dmg9OkNYo3oIpyrKzNzwTLb8PLpymW7
	8duNGg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03crx5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:29:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdacb64970bso1036714a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:29:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794317391; cv=none;
        d=google.com; s=arc-20260327;
        b=dj0O7coGaZ2+nt+QHn0uGuRzAv8q2ImJgGeCrv44jkgwBJqVSU4BT0AyLeUUyHVejH
         Up3Dmmp1V6PjVqewPfAo3aH8soTh58O8JwxlaNA+IcM5NDkrg8yxUxVgEkNW61LsemGB
         6tji0pqTNupqKDwE+OpHkWmcQaEzKc77wL+wIv9+Q53/BBMenNB5fI9sHknBBAbiqCnM
         krBiOmcYTywZt2HDshpEEayFWIOoFPFK0I3v+Jv92p1vNQLSLRephzWh/LvjPaJUbe6Y
         AqOUVVFlv+mxcqVsO7M5IdHNjCR/ovTrNDX5HZ5yqL44MRsf/X+t3K8VTuDrF0XZM2Vo
         5OQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AIF/t+4UqjFofmLj1BZ9vB8ifjYA8eqgYZooCvzGCeU=;
        fh=0uAy69kOUFoc2XiOGbQD7kuluCHexpbw0ZWmA5yn0fU=;
        b=PL8NCvB4Ku08UlnCceQxgPZzI1hN52pJ3a1Bx5H8ONPibNQjx8E0oLJzWFXOAPyvS+
         w72vwdmEeBA/sMJCluEAllNUSWe5eYLRqIcHYJfoZsGcjVkEKpOPtuJbJRJOOIRmE9Ve
         2mraMgxyxpvqo0XIBDoZeL2u+JfBtm8te/khm6BEuIu7H8pb4nYYSuHYM1bmyiIAEnJI
         XaXt+bxlABtdGTxo9t8H3hCFMxvjnlALFxNMu8DSvSHlw79+ovARANIwE8cyqJAs4WLB
         38enP3WmDZc31TT8NuNvB1sjnIJRvS98Y0atxFYXgmKueIsbqdQEyWnjNZfM+snIiknI
         1F8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794317391; x=1794922191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AIF/t+4UqjFofmLj1BZ9vB8ifjYA8eqgYZooCvzGCeU=;
        b=Oc8Czzslzen5ABFHz8tMhkjkteQJHH+mfzzGICUl4UMLrDyfH3FmCFqrgWEkKGg+H2
         dWv5bMyjlqzWiofCGomk/vk/4zjSCpsQgkvL0cdxG2JnHQwSUa8TOt6qTOraHp+Au08F
         4JieM7GBk9FJxcZ1m73+F7NnTWn8y+uBjswHr6lUPy+kEkPlKHzoJaf+w8btQuTlKiRF
         C/VuIN80PONUN12sAXhVjZN/imHuuhKrwtgvXOHWF80Mmr7DiO8BZAubOUZN34lL7oC7
         +x0+uB0fGFY7ntvfU0Mc2x+xQ5sLUMAL5JwTXpG7wv6BiJBWHrsGL9AdDR2wswXwI49f
         s/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317391; x=1794922191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIF/t+4UqjFofmLj1BZ9vB8ifjYA8eqgYZooCvzGCeU=;
        b=mj5RKdzVQQF2X1l9BznC1rjpAiEXzvf2xzou2Z+lwLVDsQZPH8URdvt69Itg/43Uft
         R9DZMoKY40XNjRmQTogwI4DZuzO4Ag6E5lbNWwFLBzXuT3ODQxeHuYEjkDrY2bFsPLrr
         0N5Ixv+d8rEvjHUlQFGYFOPpfoym1g+QFKfoBi5zPvpidFAaE1XPVvVpGznUP1fx3XEO
         RJJZ0foY+j72MGFZmnWHeXdMGm7ekPi31iEVAdyQyyIwWEKOqLpq7klh76Y0ykn3O1LU
         ZaYHylbajEnPruz6MwMi2s2/cKED7PD0fCDK7tvo7Wn7vrzhUM5mjDd8p4b7Doubcv2n
         2dWQ==
X-Forwarded-Encrypted: i=1; AL+hErGAL3QaDEVGQhx917odZ7G/i8N4J9g0cqZniGb3qtda5KafSGcxSz6yV1RbGLjUjVV/eyZaeumdsrWo2XQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Od4Qyl9ee+avMptwo4WEtO+x66Z7t/BRensmXxhGmRCLxukDv
	KY5vo5DjzlQVnjPUyZ5SXhfeNg80fOIvPute0J1R+XYgKHoXAIhPxolGufHOLo3Cm+mMYG9ml5M
	ovfZiqUREype+uAO/L76aGI5XB8khcrLmUISKqJ2ZirnMAnZpBHPdFNfjafUQRYwk22ANhtWbLC
	EHA3dEVaXaGc8aHnCUwiQ+3kEHWtywQ3D0RQb9ndC5ew==
X-Gm-Gg: AYBFou1S6M48IDq2/9b0ltQS2UbFn+3dQcu2CLJsY00UEwyH2poZe0LcBiCsfMbBjVT
	RtNaNxUnp/wNQF6JsqDYmg200H7qPDYADkhtcpYKgMCr9/qf+w4zKzSZ48HDpwelI8HVppqPwOB
	9UY/lHiKNw9S0+ypNQIcibW/ym3cRtXNwANUhxSk4XuOdGVeJ6B2ZV44KeMw==
X-Received: by 2002:a17:90b:528e:b0:3ad:a270:a623 with SMTP id 98e67ed59e1d1-3b166b21a8cmr2713585a91.4.1794317390757;
        Tue, 10 Nov 2026 05:29:50 -0800 (PST)
X-Received: by 2002:a17:90b:528e:b0:3ad:a270:a623 with SMTP id
 98e67ed59e1d1-3b166b21a8cmr2713562a91.4.1794317390295; Tue, 10 Nov 2026
 05:29:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030181034.3811225-1-kamal.dasu@broadcom.com> <20261030181034.3811225-7-kamal.dasu@broadcom.com>
In-Reply-To: <20261030181034.3811225-7-kamal.dasu@broadcom.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:29:38 +0100
X-Gm-Features: AclHuK_HjDsyd8tlf_08vb3pvnJpIN3zYs0fNqhRxdLWOAH8eHC-07qNxNc-I78
Message-ID: <CAPx+jO85dr81bBi7e4jSW=MNOFZhsenhGy2+Rev65SpxsWgrYw@mail.gmail.com>
Subject: Re: [PATCH v11 6/6] mmc: core: Add support for resetting an eMMC at
 system resume
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Lin <shawn.lin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: etcx4fy2DZwsVN-7T3Ssrc5P8tg4kQ65
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MyBTYWx0ZWRfX/YVfhe1ALo40
 lgES8gILF3bxEDK23CnnMu0tMi5CyA+ELFCMkSeXGOcwVsNVXQyfJaUZrb4srRTnKSr1kovcIgI
 TUeR4IKAG+ZFJjBFBB5WbI9Z8sIl8S0=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af31c50 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8
 a=Zw0LzOU_KxO_ngT4RC0A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: etcx4fy2DZwsVN-7T3Ssrc5P8tg4kQ65
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MyBTYWx0ZWRfX1xzpB6ahnJ4N
 T3GB3CJ+5jx4lyc/oLExFbHpbxiVmfdQsttHdwdY+fykEAtN32NkZaEZdb1vY+0+lVnB2RZqdRZ
 m3tx22cfPBhYR+5TAmhiWcmEa4ZzQ8SKqH6060A9M9fLKOlT7AEGqF2hGkYQrZeEJ09tJTTZuIq
 njR9rv1/uIJ7qN+DqzjrP7ssX/WV21dJT14imgb9PfRU8oJvWCc1hIU3MVVT0tw+pDfATsbS+92
 tzkUREtijCL18Vob1gA3+l3KN+KMC1+75qBG62dsywywLVZzDvKYi0LbcMRcDXOyj6A6Ms4paKM
 9zqZg1SEkbOtxa/e2giPQqh2Vlp04LkDgNoFVr1lPlQbJ/LMW4bUKvJYqc0gZqirskcKf6BwW37
 Q23mNnJYAOcXa5iPGdw9xy4MNoImrX3VkyiGzVn6WfLT2iRxjfLsu/Ma8PoJLKsM9YbdFUthF/5
 jQqppBMWXY5KnDE1xfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100053

On Fri, Oct 30, 2026 at 7:11=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
>
> The DT property reset-card-at-resume specifies that we need to make a res=
et
> of an eMMC card at system resume, assuming it also has stayed powered on
> during system suspend.
>
> To implement support for this, let's start by parsing for the new DT
> property and set the new bit MMC_CAP2_RESET_AT_RESUME if it's found. Base=
d
> on the property, we must also set MMC_PM_KEEP_POWER in the pm_flags for t=
he
> host, to keep the eMMC powered on during system suspend.
>
> Finally, to manage the actual reset during system resume, let's extend
> mmc_resume() to support the needed behaviour.
>
> The property only makes sense together with keep-power-in-suspend, as the
> card would otherwise be powered off and system suspend is refused. Warn
> about that while parsing the DT properties, to flag the misconfiguration
> upfront. While at it, claim the host around the reset in mmc_resume(), as
> it sends commands to the card.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> Co-developed-by: Kamal Dasu <kamal.dasu@broadcom.com>
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>  drivers/mmc/core/host.c  | 13 +++++++++++++
>  drivers/mmc/core/mmc.c   |  8 ++++++++
>  include/linux/mmc/host.h |  1 +
>  3 files changed, 22 insertions(+)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 8e9e61839198..8b38ff45d20f 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -48,6 +48,14 @@ static int mmc_host_class_prepare(struct device *dev)
>         if (host->bus_ops->pre_suspend)
>                 return host->bus_ops->pre_suspend(host);
>
> +       /*
> +        * If it's required to make a reset of the card at system resume,=
 this
> +        * indirectly also means that we must keep the card powered on du=
ring
> +        * system suspend.
> +        */
> +       if (host->caps2 & MMC_CAP2_RESET_AT_RESUME)
> +               return mmc_set_host_pm_flags(host, MMC_PM_KEEP_POWER);
> +
>         return 0;
>  }
>
> @@ -375,6 +383,11 @@ int mmc_of_parse(struct mmc_host *host)
>                 host->pm_caps |=3D MMC_PM_KEEP_POWER;
>         if (device_property_read_bool(dev, "wakeup-source"))
>                 host->pm_caps |=3D MMC_PM_WAKE_SDIO_IRQ;
> +       if (device_property_read_bool(dev, "reset-card-at-resume")) {
> +               host->caps2 |=3D MMC_CAP2_RESET_AT_RESUME;
> +               if (!(host->pm_caps & MMC_PM_KEEP_POWER))
> +                       dev_warn(dev, "reset-card-at-resume without keep-=
power-in-suspend, system suspend will fail\n");

I think it's better to check this in mmc_validate_host_caps(). In this
way, we will make the host driver probe to fail if there is
misconfiguration.

> +       }
>         if (device_property_read_bool(dev, "mmc-ddr-3_3v"))
>                 host->caps |=3D MMC_CAP_3_3V_DDR;
>         if (device_property_read_bool(dev, "mmc-ddr-1_8v"))
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 026003ba507d..a9e3cf7ae039 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -2320,6 +2320,14 @@ static int mmc_resume(struct mmc_host *host)
>         }
>
>         pm_runtime_enable(&host->card->dev);
> +
> +       if (mmc_card_keep_power(host) &&
> +           host->caps2 & MMC_CAP2_RESET_AT_RESUME) {
> +               mmc_claim_host(host);
> +               _mmc_hw_reset(host);
> +               mmc_release_host(host);
> +       }
> +
>         host->pm_flags &=3D ~MMC_PM_KEEP_POWER;
>         return 0;
>  }
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 032c018650e0..3c0ea74e3e35 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -430,6 +430,7 @@ struct mmc_host {
>         u32                     caps2;          /* More host capabilities=
 */
>
>  #define MMC_CAP2_BOOTPART_NOACC        (1 << 0)        /* Boot partition=
 no access */
> +#define MMC_CAP2_RESET_AT_RESUME BIT(1)        /* Reset the card at syst=
em resume */
>  #define MMC_CAP2_FULL_PWR_CYCLE        (1 << 2)        /* Can do full po=
wer cycle */
>  #define MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND (1 << 3) /* Can do full power=
 cycle in suspend */
>  #define MMC_CAP2_HS200_1_8V_SDR        (1 << 5)        /* can support */
> --
> 2.34.1
>

Other than the above, this looks good to me!

Kind regards
Uffe

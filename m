Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792675622;
	b=WDVgEXpVIpBDu4kd7aHFGNbVVQweuyHWURhqp10xj3/LAyde62Zb5QzWcYcW+7hdRwO7
	 w1BhfRmFQ9JWOTLbZb8sSLX5U9a6zBjgswTnHRmShZiSFy727FHhlveQoiHUJxIRjPSW2
	 TxejopuTChkvrxZuAEFnaTfMhFelfcuAdCr2H0wkn4hKVrMUaLT3hmjlkOLxnUUYq+gK1
	 i//qs8NviHGM8i5ojLXwdU+wy0PXYL4rYIJiaXHj6rU7cAa9ezQyKJAhV5gAzWD6PES0A
	 6aPWBtRW7K3ARUt4eINrvGyseTdIgmHAHcq+DZwwL7KJTu0fB9SqMalxoFDEWYOY5YQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675622;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=;
	b=M+CA5BwfFlOwexVFhhysB4rE7fYzk1J+GAyOqQDCfwR1KTtysJBJqJznNzTz2dr/F55W
	 YXWp+/bAUep0fzSdzv/peniL1CzORVQT8RZBjBcKVThfQPWVs+o/FvJJGrrULGqDqDEhV
	 7u6jrsSaQLiXf6tDkugaI6ivJic6srbMeARvVJRl4YXpbzW6adnp00FXk/CC9oLDW7iKk
	 rLY0nTxyoiGXigo2arAqn5gKBbiftNgaAKIGy9tavq5DNlLWAGFEuR2EN08NuFipASck3
	 WLzO62T10xs7zaOydUn8u5JDVjliNVfZ0Aq8PDDmkl0wsjksTj16ka9NrJc29AL5iww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e0XK+CzR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cd8Bs7kp;
	arc=fail smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90C5606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D90C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e0XK+CzR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cd8Bs7kp
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA00ra1962218
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=; b=e0XK+CzR+w5dGiD+
	JLK5GhSH9gEEMnUrcdYTBve4Su/QQG6SCAN8Jug2OIxpNqE3iRM6fH0RDnlM+ZRt
	Oggc1GiRGXO/lxF4SDGO7WTxKcAmqxwEBgKJKD7drycDGuvjqeBnjUF4nq4vfbae
	LnDMUqX0Nuw2BnoXaB4p5tbP385AYmPmiXDFTssc/OnJO4iMLsQtue+W1SQoPTSP
	W03UBc1G62vkqlb0RjlmZ6UISZNXKwlTyzo0rJ2a8MfXhtT/7ZJMYWHgClwY8WnJ
	MAeMd1og4dJYQJ6GLwmzQ04BDpRA6AkLCtCcay740UFOClG3kI+BfbADg/BbjetC
	wSnyRQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aknne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:27:01 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cc89e86e4dso2649422b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792675620; cv=none;
        d=google.com; s=arc-20260327;
        b=Wm9sTC3UMUChzALcIDAeL+jtCfV0lI9wl4dCBnNAv0I6wFj09pTYSRJrKfwWwdenbl
         BWdrf2YRfrBluBUtPldgrcq2Ux75Fj0t/ePFFEt/zBP/WhWLF4b0QvxTfkyyZ0CkomtD
         LSj5Hw+iBmiW5iWU4vXabyzDrsY/7BzrFGMT49eoI8WzI33j+ZNRaAof6omItTDSCieR
         2doqerEIS4Rc5t+vm5a3a5Q5i+X/544TMWb5o6R8dzfpgjTH0IW4SmJ7u95Fo83qOAIB
         G0AVfvrKyDP43/pfSw00fI9oqEMQW8tKDwrLOhvp258Pl3fAz90i9wGuN4B4yjSA0Vyb
         k5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=;
        fh=GktD5Qx/yrKPWxlzEOlYvJNfmjdc66GW4CSihkYbBQc=;
        b=OAW4PjmaIzJwhXgUvokLuApy3G80jQcBwo66IbgctL025SpBse6BUl6W/ln0s9GJNG
         j0VVGIkzWoX2MlQwALyDj3KZHtbdY8I4NsO7CZkQww3vWJZMAbxNeVjHgVVYqakwUyqq
         7zFkT6WfE3ifdNrgMgXH9t4dsIukdeejdi6OH/Wu/+jjRVE30sBcjzRPV9LXY9qCbiJN
         OCjcpuE4kO254ILSwZVESyiAMvPXaTzilbVQo7h+cSyv9FKn6X1TbxLxklzOnTm9usIk
         hxyJtbhGpU9rphJJUQtErOAKhMPXamixjsPTHTqxSzmkWIoNZqqztVEO0dVmtUgPhvCP
         zVfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675620; x=1793280420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=;
        b=cd8Bs7kptfEBPAeSdhJnCBWKk+TgqNJP0L+9BZojSBPsREJKht+YOFgpo6bWDtCH0K
         46GakeEAeeieY8GHoMH9E/ms32opi2OOl7bJkAyIMwxHpGVKeHqnxie2pT5yoR+itXQn
         xwxchSqJ4H5kjq0Tr/8MNIbZndqNlJBIyPTqKxU1okQlJY9PXvvwJVS1dUg3DRc1vzLS
         9qR2zwordUjpan4aQJ37KJ7ingMY/xW6odj8at2zbnFhxDRuJIoXPGKcNHL8cr613uWa
         4Azhtzka+6IwFuKB5sAcFtihTzZIoeLM9jYb+R8WE2+pugfm/Tpyp4p4YYeoqbc0/NdH
         ZU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675620; x=1793280420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=;
        b=kaZHAWl70laL4nnAtXvCzDZA2j9KW0BF9RZHl+wZY9DEpmhL+J+OaOGnxgPoWFe+/J
         qHD3EkJTrmAv3cjNY5tnMOOUaBcm5EFulD4W20zQ8e/5xqmqFUE+M3EFHY84liQy6Bts
         Ce0qzYNufrzHMPofFVre4aeJxAPHmP/rwGcJ5k6kGpJfDgrJNi1rSqF7wtdCMwKXaeo8
         tCQy4dSAuT6gtZirTIFkoPyggZQEhIU2e7KcIie6B2O77icixzx2hQjd2sFsB+d9bg2U
         UdlKd8o4MtB0Ik+4C7ci1JjsOLwOP23qAdAHQERDflNeYvC9jcSwvIFq9SgOo/BXTbIn
         xgMg==
X-Forwarded-Encrypted: i=1; AKwUvBwykLjxo9GyQsCgs3Jjh21ORtG/bcnwKlFRtMvohO2IXhq98P/Mdnex/TDsn8fiP/e4yL/6K4rN2ltrAYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrdIkI9EzUOWPNmfbzDL5jomTTO3jSNR1DC/b63K3Jt3w5D0de
	tw+2qmOVvPC0pzohOWqGiVtX/zc34W9HO7Wu/1YXW8RAvQ1Am3u+D6Bt03zraLR2im1J5speNQ2
	ycvD8Bk54EidGJHqGpEQHf2j1jzwhZgqDhJhSnuu9oK/AcNu16ljKp4QEsMa60SejHWKH/xeKyw
	kNYBLiodqmwYsufwItS9y64VsvRWQAzLVA60p+gkQGhg==
X-Gm-Gg: AYBFou2W0vc+8SQOSrUSm/JveP6DnW48zkC/kWjBa9yJo4h+8JgT3FbM1jkaFZ8f7UC
	uKiqaa5gmrQKloW+PxYODUkXlV6i3siYAext6b8iXVEzLWMP0LlhPfQVesNG9wrb2yS/wI69UOM
	hONAxFLMwcZQgExII2w7066WzMlpk93twaruPh5/RDlJ9MNio2fsUuOUaAf14IvsWAmeH9+PYV/
	mqoLv+HOWs+X2j2M4YmhuJX/aFdnMw9nJ6Iqn0gfviNCeMBcpE5VAp7tz0mlF+kEO1Iv6bgEXY=
X-Received: by 2002:a05:6808:508b:b0:53e:42e4:47c with SMTP id 5614622812f47-5535a28a8ebmr3850179b6e.34.1792675620243;
        Thu, 22 Oct 2026 06:27:00 -0700 (PDT)
X-Received: by 2002:a05:6808:508b:b0:53e:42e4:47c with SMTP id
 5614622812f47-5535a28a8ebmr3850158b6e.34.1792675619795; Thu, 22 Oct 2026
 06:26:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022071418.26895-1-bjsaikiran@gmail.com> <20261022071418.26895-2-bjsaikiran@gmail.com>
In-Reply-To: <20261022071418.26895-2-bjsaikiran@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:26:46 +0200
X-Gm-Features: AclHuK8flPST7fFs4KH2917QipXg6lzf73ICNib5r7yG-3sF-q7lhsX38NFcO_w
Message-ID: <CAFEp6-3iqL_a1c0u0tXhtZBZ+k__=KjQX7y2-0djf9qbBzS+Mw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] i2c: qcom-cci: Select pinctrl states during
 runtime PM
To: Saikiran <bjsaikiran@gmail.com>
Cc: rfoss@kernel.org, andi.shyti@kernel.org, sakari.ailus@linux.intel.com,
        hansg@kernel.org, bod@kernel.org, mchehab@kernel.org,
        vladimir.zapolskiy@linaro.org, jishnu.prakash@oss.qualcomm.com,
        birk.skyum@pm.me, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX/T2r6xP8Xc7z
 Bk90JSqEincqRSINKRsFOvdTWE31DGTvuBGlfrIKCLbIssokLQfqcMumlkY5fkR5ZdA05tZ5xEz
 3yjWspRi4cL+TusFNe0MnTxJS7PPVsjg34ZqScQ10Fi4da8mh5V7cMspA5MnRtgoYSeW5Es3/mP
 UjpJ7M2mQQ2FxywFZTKlTdnooG09/2wCst64upJC9SwQQaGdfxvPHQ/EKidqM47jrk8e0YR2OvP
 lQfgUsP+26QLzoIboxfZ6gH4vp2KJ0UrwHS8rW2y/0cWbiLi6f5qVqWxluJ7AMliX5UFm8ZyITV
 4gSWGM5ao5q/vC3CUJiljtsXDXvTsTv0SUq1ffbdZBTmOSNfeFASDTddO4q5PE9ZKOWk76S1A5V
 mnSIrp2DJs3fCG++KsRVaxZppZjuJ0HXsBsOO3RSUTCv68JES8r7alt8i0ZSC7e6WKw6jrNyQP4
 x0jAi49rsOLViwyxz1Q==
X-Proofpoint-GUID: 7_QjAlOYwwrYtiu9ooH1a2_aY2a4OldC
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ada0f25 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=i_vyvEnQizJGaKJi4PUA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: 7_QjAlOYwwrYtiu9ooH1a2_aY2a4OldC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXwcuRZEJUBBM4
 +rrHQzMP5D794XekM535iqSWqflQ5N2Tp/X7kV2A7OfTdeKtU1dNGnURPBgQR0tEgTwtumSvGDd
 ST8j3po54zQd+9uj0gJl8Jxnn5IeZcs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220053

On Thu, Oct 22, 2026 at 9:14=E2=80=AFAM Saikiran <bjsaikiran@gmail.com> wro=
te:
>
> The CCI runtime PM callbacks only gate the controller clocks, leaving the
> bus pins in their default state while the controller is suspended. On the
> Lenovo Yoga Slim 7x, this can back-power the camera sensor through SDA an=
d
> SCL after its supplies have been disabled, contributing to brownouts on
> subsequent power cycles.
>
> Select the sleep pinctrl state before disabling the clocks so that the
> configured pull-downs can take effect. Restore the default state before
> enabling the clocks on resume, and return to the sleep state if enabling
> the clocks fails.
>
> Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 873e901a23d7..fba5f664eeaa 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/pm_runtime.h>
>
>  #define CCI_HW_VERSION                         0x0
> @@ -474,6 +475,11 @@ static void cci_disable_clocks(struct cci *cci)
>  static int __maybe_unused cci_suspend_runtime(struct device *dev)
>  {
>         struct cci *cci =3D dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret =3D pinctrl_pm_select_sleep_state(dev);
> +       if (ret)
> +               return ret;

You should perform the do/undo symmetrically in suspend/resume, so it
would probably be better to move the pinctrl handling to the end of
the suspend function after clock disabling.

>
>         cci_disable_clocks(cci);
>         return 0;
> @@ -484,10 +490,16 @@ static int __maybe_unused cci_resume_runtime(struct=
 device *dev)
>         struct cci *cci =3D dev_get_drvdata(dev);
>         int ret;
>
> -       ret =3D cci_enable_clocks(cci);
> +       ret =3D pinctrl_pm_select_default_state(dev);
>         if (ret)
>                 return ret;
>
> +       ret =3D cci_enable_clocks(cci);
> +       if (ret) {
> +               pinctrl_pm_select_sleep_state(dev);
> +               return ret;
> +       }
> +
>         cci_init(cci);
>         return 0;
>  }
> --
> 2.56.0
>

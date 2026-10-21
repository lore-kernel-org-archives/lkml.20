Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792587118;
	b=aXzI9G7oOy2w+Q+ivcT5An4fS8jDMknUgy2cP5Jtp1uHxx4Jodf7HXuBxxRlugFiVqvc
	 LRI5QFpaxcTAVcbYJIKfLxMY4mCKUkiP69KiUc5YgZpc4o0MNCGR6rk/4Qpg3kM3gPtZ0
	 IMkN5Ue9OxVeLgM6Gt84opHcavzE+jdhNta8xecwTAh1xsQAjZrgSd3HQnhm0Z6Ifs2rN
	 EiZLXq/Xv+D874hKbb/7EySMNmHtVQ4Wv9qKK7zaDZDABHF6hr3AnN4EqQ2V/SMCh0cbs
	 Fc/DBdy8Ebg+Z7kdB5Yh5KSkLTPILQmJs0TzZ9iPfCbWVCsld1gxhhdij70vzjthvEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587118;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=;
	b=tAIm8pQQS7fUMBhU8X9N0pOPQMie6qvZv+pOm5n5jjZnJ+vVJEFOBpD3kOUGz38R4jDt
	 2FQkBaoy6jlbCfN1pY0uqMwy1JNlcgV4U6z7oEpmJfUbW0majoWMgG0QpQbd92s0glCuw
	 IjVK6zOHgVxKkcZ88uOqcZ7PJXlw9jQFsMctGphqzOynxNLkmlwiyxsT3AODE5XhbVwJV
	 pdpRdOZZ3q7mu0XNCzmVVOnksRnvXDnUR1Mh8cMm5j8zgc6fwvfIenkQs4NickWbIFU5E
	 q5ePlN/daGUapWST3zu4hUSvvlOgt/z1k+g358Ced2vuAftIV2EzYDBW4atnWz3y6HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gketJED3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRcycZQK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247D8606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 247D8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gketJED3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRcycZQK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg5mg325104
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=; b=gketJED3Gng6Tm+J
	KacvTNyCZfwMvS3Lp28mWyYLX9yosEkoYK3b9HIQfhAJMRNTgT7q9bE+QQQl9nWT
	NV12o9+UP9p18OSgcaYdd/VC7zrlj5hOsG/rq9rT0lDWPbb8xv4V+/tlNycOa5Z0
	UXriXCV0p/+MICmDwUES6u+qHrne7Jvx2kKmnHz7SXM+BfPxko1JE3y6Y5U3dJkg
	4gLNCFrZtcwHJkcaLNRAJP1ei2oXuo4+LjK46kkeRbM/6gVPliQ/McaqutAey1BO
	Wy0L1UAE5aQjoi7r0lLlA+I09JT7RUxnkQVdqFnptbepx3tXn0tv5v/KeVtr8uXH
	pumlVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v40aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:51:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so146250085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792587115; cv=none;
        d=google.com; s=arc-20260327;
        b=KWqoFoTKc1hwPYC3ZdDFKRMPsrXRW6J/cK9WAVDpph52pL5MGO1/9O0YIH+uTaPMNz
         rbCl6t776HApU9C45P80+eYJLqzfJQngXRApsiRKJLMDK2E1f3ALYTlVgqOAiZ+bF9gs
         SagWinGAsbLIMYrmUikpvsYYhu/IJ+Gacn8MlaSLMyXFIm/0ERj8s0j7PLncm5Ihxfmd
         ixkX51vZH1H49apbqRXXF7nGWtbcY1ztuVDTHwv0lh7YpYAg/VstisUnZu70pGQAAPhp
         iJYEe8wpAY8xEt1n2SfGO5Jf5pczEpZMteF+tHPBN2JPd/4fassIRzC008SQmEwyL3+d
         Hi8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=;
        fh=+q05jFoYhN6aEoqN+5efhUh7HCGXHQIz1FYZREYBdSo=;
        b=VFHA0Y9SVheIG9cIeLa7eoiwAewXB1Ifnlpno0Y/Tstv6UwMVIa/nMnwKOL0O+bHyN
         ZcpyvB5SJUu0B2gqXmoN89bAyMcx5h5ffPRJUi3VU6QM7mFS62O28nMDG+Qp+4MQYNhi
         387KzsyaWq2PQUdszL5jjRJBkmaLza6UJKSamZ8cFLETdi/kHdSzmJ/XFw7tHjVU1R7N
         VXhLGeVbgcxIhGLycemE289hHnWyvwrTieARUQ+AUHPQp5dnUjucgUJBCpoauno1hPuS
         VPI8ZtgDZd+sa6zfCyoNDkith/4nY5quaboQsfHdjAZLVJD+So5R6bGiXArBYtH79l6q
         NkaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792587115; x=1793191915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=;
        b=dRcycZQK5Y5F/pJC4zlLVfeRxLQMwvYMncEuyHcsU80MC1Gg0+fDL9r1mFb0azva8N
         7w+ui5TuCWff+ypxgbNwF6pAc2KMLQZd7BSF7WVe2in5217+PMgijV4sOTWgW2iULyyP
         k0Qw5lxoRHFBwonHW3lTbky+/4PDMvsBFPFhLaUtMq6gusBR09ruQLzg68UoMudmlw1M
         xi9kpAIdbsFM86DKAQk4zkt6+GFTePJMGEtvh6IYgkJ0dqKUEoY1rGOvF9F84ha3zOmc
         7kcqJIQ3ta8ApvhVexILuIG1PrAs0PBGtpsZ6DDvzMZaKEVPakfcX/FeDePqa1czXb2a
         PD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587115; x=1793191915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=;
        b=Y3BZeIhJZSErgAcCv6jN8JfoYkU2UmMXgCbx3Xm07gYn1rz3f+7faYsA7VKjtd3Uth
         Fc/asuuafiEdGqtrnxIm5jE4gEmhvRgGLK8aaAt2MzPgH7Fua2M888+hrQr2mtCF1+O7
         q8egt2mKHYPQRkY40xqyO8eJv3ies6WYYfxwIlvc3RvYVmKH9wtymAgArrYtqVegiwrh
         k5LFp9F5EAgCUv/iOlJq6+yWbibw0awpnXpQ0zhLl6MA1R71Ac1B1skW2CwHhBL6Atqh
         Ywu1dpgwQbVbPBKb9dcZCZD4eHqXmxfO4jFQgbf+xXCn5eJAze+IWp/bnKOEPWOUmaXF
         qMEw==
X-Forwarded-Encrypted: i=1; AKwUvBwRsmhQGh6u2diu6J6iSDXh8NgM99Cc78cm4pAjuyqNa2roxlhpezx6iZK2KtD7X12vpLdqg7XkK5nRimA=@vger.kernel.org
X-Gm-Message-State: AFq9FYICgFsfGJQUUYRFrAdFPaRxeTGSybfY+TeI8Pysf/tFob1qG3GI
	9wosrs55cr4BDNN5LI4r9P9sJwVwTaqBfhBEnkwN50ZvHVpcvpneBCaQngBEuBAFde6ozhzEwhw
	gZL/E63qUAGQuUVkKTeSllgWvDuaPfU3dfLmDrxo8vLG1yq9eZ544RPx1+XP3PLIhSQwWTcxxF8
	rkhmSn9g83wrDOxPA8Eu7ax5WEs21bykhXbPkVVVSeSg==
X-Gm-Gg: AYBFou3QNCi0t/JCryeZ5p0QiXm225CtlvrBzs7BdROaGaEbjtTkzJ/BymyNFle1xGM
	GTHit/b6VCVuEJjQ/dCVIwoHbqYji7IQu5bX33iNLmgbbUuKTA6uNVdN17BYezqKm9NwL5paFTO
	2jASFFzU0SqOQie4zTF4RkRBlAvp76K6ncv3V+jNztw0N5wha1T82t5ZZzv/S/Ict0YSSqT4jjR
	3lG17+POQGXsdDUu1WWJdjw1UHru12vPGdLWItSPZm21So5VJSrUa7lYteR+47m9n+6AVmG2eY=
X-Received: by 2002:a05:620a:28c8:b0:93f:2aa8:c550 with SMTP id af79cd13be357-93f57fa151emr385796485a.26.1792587115060;
        Wed, 21 Oct 2026 05:51:55 -0700 (PDT)
X-Received: by 2002:a05:620a:28c8:b0:93f:2aa8:c550 with SMTP id
 af79cd13be357-93f57fa151emr385791985a.26.1792587114427; Wed, 21 Oct 2026
 05:51:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021105434.29897-1-slark_xiao@163.com>
In-Reply-To: <20261021105434.29897-1-slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:51:43 +0200
X-Gm-Features: AclHuK-yPVVb7PzvbUMTFtaNy5JD5TXtzFZ7YNTeyh98oaWvr44i4RUl_uqSzOU
Message-ID: <CAFEp6-3F=fZ+kTsyZJTDk1Qfw_kPY-2u0G-PDHs7XyBs8tyOWQ@mail.gmail.com>
Subject: Re: [PATCH v3] bus: mhi: host: pci_generic: Update the default
 autosuspend_delay_ms as 5000ms
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, val@packett.cool,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfXzcJ6vKh9blR+
 IRvDH16BDZAH3kHyi5pTDDyFR+3/cGBbGFn7TUt6BCXSL9eAbcoxbpuzKcrTfemvkYjgiXs21S5
 MXN/UnYMVSiCSLTcu5lmZrp+zcjlAMU=
X-Proofpoint-ORIG-GUID: bMkqHz8yZ0-RQb706zrOZtYnUkPHidFg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfX5ca+F9735hTc
 Yv+JDa/wHDmptjezhbGJhBUkgiP/5our1E4+iEehAWYlKYo15pfkDbCBqxg6oiAOAWpQKtivDxJ
 +NHJHP0HVS4en2oJVWbN02T1FKaa8kpg442MpwNFupgk/ll9uTc/YMDy3Jp6h5S0TDeetz6H1o3
 Gsunabq1556ZcqQxqqp0ph2IEVyBgHQarzCzfXFwwUxn251eZ0WUQGSGEpiflU/3pJavY+n/Xr+
 Lxe5GNjz84LFLAuIi7XOu9md5dV9E5nMzW7LZFr3sAM6RMoexz8fJ1M6pdCfoYBh5H1I9IAcXSe
 vJk/qlUuIjL3WwR1CKdD7lccFpi0iBXDbmpVv3UV+rbuQLCrlpUPKDgPZ6+3N1fP/A3UTOJtgft
 EFrHZGI8NlW1B3O6oJd8qMiNtdRvY/9RhPbi8Hb3nzyhBRzpaT7UGzitVhKVsTVdvZJXKVP9hVQ
 JEacYWZlgHgLTOfnW1g==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8b56b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=Byx-y9mGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cfVVBkdRkn7iCyj4mtkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: bMkqHz8yZ0-RQb706zrOZtYnUkPHidFg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210051

On Wed, Oct 21, 2026 at 12:55=E2=80=AFPM Slark Xiao <slark_xiao@163.com> wr=
ote:
>
> For some MHI devices in some specific scenarios, the default value
> of autosuspend_delay_ms may not be enough to handle the last wake
> event, potentially leading to device timeout or link drop issues.
> This can lead to a runtime resume failure and a subsequent system
> error:
>
>   [ 8749.089545] mhi mhi0: Resuming from non M3 state (SYS ERROR)
>   [ 8749.089573] mhi-pci-generic 0000:73:00.0: failed to resume device: -=
22
>   [ 8749.090218] mhi-pci-generic 0000:73:00.0: device recovery started
>   ...
>   [ 8752.940324] mhi-pci-generic 0000:73:00.0: reset failed
>
> Following Qualcomm's recommended settings from Windows and their
> suggestion during case discussions, update the default autosuspend
> delay to 5000ms for MHI devices.
>
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> v3: update the commit message and the comment of the define
> v2: define a autosuspend delay timeout and explain the reason
> ---
>  drivers/bus/mhi/host/pci_generic.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 7193a384cca4..17d51964b55f 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -21,6 +21,9 @@
>
>  #define MHI_POST_RESET_DELAY_MS 2000
>
> +/* Timeout to accommodate a potential 'late wake-event' issue */
> +#define MHI_AUTOSUSPEND_DELAY_MS 5000
> +
>  #define HEALTH_CHECK_PERIOD (HZ * 2)
>
>  /* PCI VID definitions */
> @@ -1483,7 +1486,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *id)
>
>         /* Allow runtime suspend only if both PME from D3Hot and M3 are s=
upported */
>         if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
> -               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> +               pm_runtime_set_autosuspend_delay(&pdev->dev, MHI_AUTOSUSP=
END_DELAY_MS);
>                 pm_runtime_use_autosuspend(&pdev->dev);
>                 pm_runtime_mark_last_busy(&pdev->dev);
>                 pm_runtime_put_noidle(&pdev->dev);
> --
> 2.53.0
>

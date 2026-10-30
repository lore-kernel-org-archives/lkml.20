Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793358060;
	b=yHukyMolzSuCyc3l6Ub81gueUns0DYJycYZ8sNySYV+5gZPemt/Q1evRFSR5eAJilSzN
	 m98smvqFSGBSrxL5GXRMl4eV0+KNWDJ+1nCFH83cm3hhpt8maSngG8MVYHLQMH0XO/Bp3
	 KtFCqxnMzz/ocHabKVHjh+fcseZnKm5tVT/D0CN5PQ56WpyzkFdsazOt2v43+/+eQutzH
	 cLEF3P9BNMoR//+W7sna5Tniyq4A7+wuSYZCMnGu5krbXIXRULd2x5VuqaRl8RIQ1Cbwk
	 zR+EfUPyNSXZu09AyaGYMnOonBOIFv/3kMGJP0Mz/Cl4kGPlmWh8T0kp5OUdhkiCELw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358060;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dAJ/hdUbWhcFTxamLR0wIqhORt4vEbGpFTQmQv3h7+g=;
	b=yU8tcNyvHpLIlAImvnt52IEuz0U/QJEaWWOfxILb6otM8srmqe7G/4ZG7T4g+Wj+WJIs
	 GLro65HBL0VG75aukadq83f84tvS+5Vj/ojCs+MKxalnPjWqq5JjI4Zfk5FFfFIxpmPXJ
	 0RKEQWAtKCcJTbqoB3HFe/4MlS9XXzcY3XXJh8xNAq5fHOozy1c9KNhp8YGoumwgl3ybh
	 NKqc3L9wQV8HAvf5Fmyg3i5htKDZLzattt1abUPWJgQWJP8dH8ApmvqA1SB8ONc4Jm6eE
	 zz/6RrsDyyfcjbwwbbCjKArUSiHwQobzIBdJwQsALM/dF938NCYud6PcWGGkpEnp5YA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SRSz+U2n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FI7QLv6B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018D2606AC01
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 018D2606AC01
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SRSz+U2n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FI7QLv6B
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U9JfCv2881664
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dAJ/hdUbWhcFTxamLR0wIqhORt4vEbGpFTQmQv3h7+g=; b=SRSz+U2nRlJjrKpd
	Q6yg7Bis+ATQdENbDuC3boFhFxQXruNNjF5GKAiOHMK1ZUkeGa4oqcl2AyzInRiF
	VNCXoz5L6+6oBpNwKard8J79jfQNHTRU0sI01CQtej2l9OgXwHgJxOvUTU1BXQ8Z
	SG8jfDxeMq76H/ituJS90fLE0lzYD6AxWMxJFOjUAJyQ/H+TmlVEn+vZoJM2WAXa
	dPtZQK2eftP1JhV9QYnMD19qhDhvEUj+vV1N8WchYs8SwxmO3qW5ea3Hh5CVY+Cz
	p9hfWCQGVPPtA+HY5cEqo1yoQlSZ3fHYxWA87/oUD521A8wMEs5tiBK0HVTsG6Ym
	hN9rTg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjk2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc36b97a77so132007137.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358058; cv=none;
        d=google.com; s=arc-20260327;
        b=axXbQVRX0TyL0hPpXonWm2IyMTzCU0T9xn530x8Zcqgl4enJLk2Vt/lbFFLRTFHxWH
         /dPjad3sbigFmqw67zc/vxLjRXSmIp1mJzZjPgyQa1Tn3YcZaawTY1zN5Yp6TGwOJ+Kv
         CLn/kB4aP+JPU/ax/0UKE9ms/LGIWywXcp+jWAC0i40CZSxMcKHit9RSie94FXn0Zl3n
         Y1ZVTzbaCBR9HJpHH6Sk7e8kSaeM+lOrQBJQ6D06alyvFMstTW2nMA82QimxSUS+q/Mq
         bRBTyn1I+ZHomrXSUVi96HFkxHnwMyXboF/6kn/G+fSIGJ3TkcILX9O7mA7yYCWGtxzp
         TFkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dAJ/hdUbWhcFTxamLR0wIqhORt4vEbGpFTQmQv3h7+g=;
        fh=olLBLNrdGPbqDtHjw3QQY+F6Yf3MvDw1mNNjiTrHbXU=;
        b=mdroDRi1cUtjglYbSC4k3n1ZyuiLWR9N8cn1Ut1gjst/csud0zgCh+miQ4WSY5DjXv
         Njw8triO6GaTSwpe7gJUKdzBuWNFtRGu4V2dqST615Iqf80HPJIoGK5xfM4Qc4e2VVrv
         AHb2L2Gz7uWSbZeJGWuuVv67ArNDCvrO7zUOV1odKHFA7SZ0urbhy4wawvwXyqrr0UAi
         9/v/S7OTvZd8a2KQYL955kc9AytDlEGH37GeHQZr8cC7bZgwzMcvYpqcP0i06kcgfhmL
         AM9biw7mPkF41AQqPIm13kkuYJG32b+nE5B7f2dMSjKv5SEZaNN/Qc8Z53T+SDyTJOaT
         vklg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793358058; x=1793962858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dAJ/hdUbWhcFTxamLR0wIqhORt4vEbGpFTQmQv3h7+g=;
        b=FI7QLv6BE1G2fQvhlC+AOZ/OSC7c63qEEjRaA2KtyShM0uhc38YdUeDxEUky99oGXa
         V2dIMQ5caqR+YYt8jxtsnCdp7X9F3lVPcOX2B3cymNdfiXhIkQhpmzMpvHnydZhwiqUG
         jsHYpVvlord+lrqLX/Vw3ZVTFGbl3MKNAQx9kYJHzq6BA82ucmHYjbjf5YBSjva0vPi0
         4gcZmzrgpZqEHKOHmX9Nb0kqcr46dzDivh1NRHh2sYOHKjydS6ep7lRGY5Yj/qKPpzF+
         TnVYDZb7ohuQQQwtU8xAw9H2ODkpSdFSWKinTLwnNGiNe4u+lfS+GSQIocWQYSuH7p+/
         0xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358058; x=1793962858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dAJ/hdUbWhcFTxamLR0wIqhORt4vEbGpFTQmQv3h7+g=;
        b=nT59eEu3qTqQxdmw1jiFkwYXqdKN6V+rsrn1c/Ebzh4hpNFEacSlRuIblo3AaDL0a3
         R8SajztNizFaXUCvzZX+cWI7GoOaRwHSh05DrLT6AnYj1Fd9qZcsGwBFi63bXYg7CEol
         Nm2OLCEaxWeQ2fqJq/ST7JYiWYBpDzMUQdVvMyUznbYN87WBbeq5EVZOM0pUH8S1123I
         QeTdxluyqtRCOTdkJ3tNqLcHr3ELNK7nY7uZ3m6T2coXQre95V2ttIMJYoVUIThyUggA
         eIQ73fpqN9gF0BqNBs8QiE1VUoF+zQuW8ueGJyppDIoq++SEEV35e1IyZNHGI/6Rjavb
         EHlg==
X-Forwarded-Encrypted: i=1; AKwUvBw7POZWr0ra8+zCt7TX1sDzLqZNRGt9o+2v29ODfMJY3X544+OgUIjZhoQamTajxEC90uGszwIyQbqHZLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLegJQSNxZeTXiCPF4Y9e86BRdlZx75VpGeDBSP/VzCIUeAQ91D
	MsYXfyd15+xzkSJ1Fajxuyu4ByOzdnjCPx0Czyu4dnVHXh6hdX5HDleyg9uHxt2mDX9khG06jgf
	Hw7HyZK9LvCwU/Ta6N91VZdNYQthUsRXMwgbIGgVYAcdw6gp3AxO1y0/rGSP5sztW6YnNQGCLsE
	/NlnLWJ/iLWBbdZ8XHGvLz6zHd0fOE8hB1anonPFRfXw==
X-Gm-Gg: AYBFou0EZZcfbmjyqUmMDAXtJ0SwCBxyiLljE2Tjcjz55bGqxFUQ/PupgzMfxJNrbtL
	pLP33Oj70nSm4649LG1GgzOkS/UBbNJWquiqYjlGo1qEvcUpZ4NyUxFWowuf/th7E4s6TAyh0An
	CPfstaUeaZM8AVc+uTL1xSdWzs4pS37QeWy6qOxVpt7/E8zmCwZnyG8ymAig==
X-Received: by 2002:a05:6102:f86:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7d072baa420mr807239137.11.1793358057285;
        Fri, 30 Oct 2026 04:00:57 -0700 (PDT)
X-Received: by 2002:a05:6102:f86:b0:7c1:8aa5:36d6 with SMTP id
 ada2fe7eead31-7d072baa420mr807207137.11.1793358056590; Fri, 30 Oct 2026
 04:00:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026083323.12301-1-olivier@mgcrea.io>
In-Reply-To: <20261026083323.12301-1-olivier@mgcrea.io>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:00:43 +0100
X-Gm-Features: AclHuK-AAb62Ju0lDchg6Zmy0m7PPdxFmDlZjEld1Ivf9CvuOqz-27SR1i_D8JE
Message-ID: <CAPx+jO_ZxVn3kRiWpQEZ+RcbMG-wKznXo+F-2v2Yc4WpHQzqFw@mail.gmail.com>
Subject: Re: [PATCH] mmc: jz4740: Remove the host before resetting the controller
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Ulf Hansson <ulfh@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Matt Fleming <matt@console-pimps.org>, linux-mmc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 7a_0hT_fcFg2WgTvhInvrmce0-TbmD7m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX1lLU00mQbinC
 7A++iH4Fws2IKwP9F4nmdL27QyjBrXrPT0wEYfvn3z4ysmzd7HHQ4K0UE1zXjFgVJDd22wlvn64
 hJqb9UQdSZ601tlUFYqFo4uMmfAkNwE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX8jOe79vA8Zqt
 Ps1hegMlgRUyIHzj1X3OIw8/kBvjBANDOrYkMjmpNMujSDvEW05w/PSF5DPS3+et78TRKsSYTlo
 fwYyt5/drzQAOslwl1Kkhi7qBoRCN+Pjaj2CoJ9ECMykbsv8a8Tu1CVSKne6x3bHfnQVBgewUPy
 gEEG7lQ5AebAlLxa8xpB5j57KyhKv6p1aEf3pabfVp4sdzV397VdKBl1m8O7ucisWoqs50PIgsV
 eoQzTrHddBhkC8DmxxG3mQfbj+uFv/aktsPoC6ilC7M7R9cT83omea8yERPMvVhQSYkgnqlmWpg
 gaYUDLy9JF2OmxTOqQNwX3plItaPYxu+2t4H2w0rxRNP0Fx+0bX19Kd01p8Xu699vhpu5AZylLR
 xmBBbfIxjoc/LMC6lGQfNHHS7FmVWgj+N0qFw1IGUf3tvGj77OqIAmyIaEAgl+F5/gVRDU3JY1o
 zXBw37oh8Bqlw6loLxA==
X-Proofpoint-ORIG-GUID: 7a_0hT_fcFg2WgTvhInvrmce0-TbmD7m
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae478eb cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=2DRyhdssraMOevLgf_oA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300043

On Mon, Oct 26, 2026 at 9:34=E2=80=AFAM Olivier Louvignes <olivier@mgcrea.i=
o> wrote:
>
> jz4740_mmc_remove() masks every interrupt and resets the controller
> before mmc_remove_host(), which removes the card and lets the card's
> driver send its last commands. Those commands then run on a controller
> that was just reset, and can wait out the driver's 5 s request timeout.
>
> With an SDIO card that cost 5 s on every unbind: on a HiBy R1 (Ingenic
> X1600, a BCM43430A1 driven by brcmfmac), the CMD52 that
> sdio_release_irq() sends from brcmfmac's remove waited 5.1 s. The
> command had finished (END_CMD_RES set in MSC_STAT), but MSC_IMASK read
> 0xffffffff although the request had unmasked END_CMD_RES. MSC_STAT can
> still show IS_RESETTING after jz4740_mmc_reset() returns, so the reset
> most likely completed after that write and undid it.
>
> Remove the host first, then quiesce the controller, as other host
> drivers do. On the R1, unbinding the Wi-Fi's MSC now takes 0.65 s.
>
> Fixes: 61bfbdb85687 ("MMC: Add support for the controller on JZ4740 SoCs.=
")
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/jz4740_mmc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.=
c
> index 6a3c26b7c82d..923cf1450de5 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -1151,12 +1151,13 @@ static void jz4740_mmc_remove(struct platform_dev=
ice *pdev)
>  {
>         struct jz4740_mmc_host *host =3D platform_get_drvdata(pdev);
>
> +       /* The card's driver may still send commands as it goes */
> +       mmc_remove_host(host->mmc);
> +
>         timer_delete_sync(&host->timeout_timer);
>         jz4740_mmc_set_irq_enabled(host, 0xff, false);
>         jz4740_mmc_reset(host);
>
> -       mmc_remove_host(host->mmc);
> -
>         free_irq(host->irq, host);
>
>         if (host->use_dma)
>
> base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
> --
> 2.39.5
>

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207694;
	b=j81oPmiMRMo43ZJFnR4iJD1dH499nOvmPfaV385owdaW+GDV8DgNJ+GSBb4Na3RBBYMM
	 +UzRx+uDJo/o2CvDPrzwvWXLiAGK4oJz5X+EbccADSXdh2QkpN/2qQjmJZj403MH/niAL
	 4rPnguwDwE+ZD52IXPLpPjeZ4mjBWM7r2nV5TSXHsRsM+jREtXdQuwW6mjYStdqIPYjkB
	 igBFQy0HfuK6fdk9ngc2N3hQOvH7WU7gcrdCw98W5smcSMrZw+SqLsi9dA8XiezdAavM3
	 lJub3tbzpqFmQFB8+xNZtQZTtzSnQ2dOBvELtsIwf7+lr2dBmGA36EH47xSSZkb6zNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yS6+yqmCO/Z+9Hwxo+UG43eJfa5XgYXkK/nQJzs6W+o=;
	b=TcNG4HO0rk7KvwQT9jmKNr+AJ09ymZ3X2JvgF54QevG2z4p9Y8FQweimZ2CJVgmIuLnj
	 A3IZ6sntTni3GRr7wwSddsH9aZrz5wuTHFtacsiF8s439LraqHii+qJPgvBeKFq6+frl7
	 94cw/+S/lWKv7qAa63mFAvaslrgx4YeFvpfkDNQvGl9KD6NVpx6CkED5AWzuHgGJu33Jp
	 C6Hr2ncoUySoJIek3gaKYD+6QZAHNGnj+D8jhWTs5saCizAHjNNhpVqfY3nXxmIdPh2Rx
	 Nzm1RDxEHlTFR4Rm94tjYgnFleJn8AHlncbKqJk4IOI8PFA6DuJB9hoZLRM/2UuC1jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iRx/cHJz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NarLSL3f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC78D606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC78D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iRx/cHJz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NarLSL3f
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAYks1153386
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yS6+yqmCO/Z+9Hwxo+UG43eJfa5XgYXkK/nQJzs6W+o=; b=iRx/cHJzTqSXbnd1
	EW3bP32/wrfXEOSOuU77enf5hCUcTggU6ya/hrvzNSMUgjsuC6lXdTTgyhqlHwz2
	FWkwmhdMjw8VVKcjIEbzYxbPy8oanDTRhKZ2EGuSlvEHXm2Sev6VDKwfEcFiU0PQ
	7Yf/Jj+GOjTb26gUfTRKcg5bJ3iV7J9qkgE+X15PswAU5aSMqiqCPR3I77Zt0Gb/
	A4RTIe3B1dyoeNLI38LPq5QkwzYLzeQ8DMbZNwEYBnVjlWDsYSHtOhCDPg2MmO5J
	pixrbkq45iRF/3qnKtySL2l03ZHCv3QXtl80Je9mG/g2uwATw3lPF+BtbiKiy7rd
	nuHwGQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be3pk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:14:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso772150a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207692; cv=none;
        d=google.com; s=arc-20260327;
        b=lo7WxgG+VCuMYn9nllqy39C8x99ZyZVriLh2lXRC1vNYPt1U2Kuo6MOWZAoJs65rQG
         Y01Fchv3iEZrJ4b+YxvA7QbfWuv4oC/ZfhCC+xgAVFhutTdDlMUxuILosYAJJFY0QEhF
         AM21ksS4hFFLaa+FDC4mvtI6eO+oh/biPlW/kuVQSKCUxANVtdC/CgFVAqtrCbSTIRDm
         3RQzZXbED/UvDgrz49QD0/9UlxZQGMPck2DUV6Y96Evaeh5RZOAjNsLnagzbXKQEN2/d
         gd2uqjZU5i3TjFJ8FeLx4HZdXxx9CFjjPWZO0HQyHK8/7YQpq3PeB9IoeBBO2ta50vLp
         Qigg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yS6+yqmCO/Z+9Hwxo+UG43eJfa5XgYXkK/nQJzs6W+o=;
        fh=BfYgeYPVW6l/A6lyC1mb8uB1PVOwu0fUAs+s5QqPkmQ=;
        b=iFpSf1rkyJ3FKNbXndEe/OHjUPBgIlleZFkM+jVYei9jBdJLKoPaOhXLsbF/ySctd1
         wU43voL1NMO0U+RYx1pg+H8kA/4Sj8IKRKEJWqRkKOMZfdQrdeH/og6XLXdwOq9koSOG
         IXoGp8sJ1mTtTGWR33mcgc8wosMy/5BbWb0f6lfAS3ItMxWNfkllII8smTsCxJyVXy9T
         ltjBzO9TY2hWkyXGBOeCSC1/I4iKnONhDI/gqJ/uk8NR4vdc4DPXdOXK6ZZlf6DCR2U+
         bEtxY8gn5VaxRf56M8Zf1rzks88ahynfQPVC8/wVjAVJPwib+57pzAVXNK3XMJ0vm9yP
         FX2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793207692; x=1793812492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yS6+yqmCO/Z+9Hwxo+UG43eJfa5XgYXkK/nQJzs6W+o=;
        b=NarLSL3fQSwvAx099tbHHoxIxEBj2QGMim9VohsnJNYB6ULicVUZxBD18+xAk70wY7
         +W4f54noecwrkJhWzeoVeC24EQcJNnwLYMlTyXOPyzTLSWQ9yCx/ur+VlC45E3K4JhBh
         bLbA83a5c+nTMfmFoPkF+WNy0bJte42r+iO94eIt55JcbUxzN4Ns9FFyurSQql1rHBBr
         0ogbdvqumyWsNUK64zGv6bcX+eyUMx6kwcpVDuLtWQ/F10yTatXj4LdMXoYLzvA5LbXz
         TOSsoo7sQQRbYrlG1H68l5Z8BbZqupsyujqrSen/7aYZd2pJeI7Qn/E/ztqSVX53pxeU
         qrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207692; x=1793812492;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yS6+yqmCO/Z+9Hwxo+UG43eJfa5XgYXkK/nQJzs6W+o=;
        b=yayv47w2UQaW1meQUx9DixvFpjL8K0/H2Yi2mEiGfECciy7xrLBMaFThE1iFbvY1zg
         hVrLTs3GB3nBT90JdvPvVx+I9cYJAcQEzujJjO2JJweMgU1eubGfL5UVp5N+HnFZ2rpt
         8nlOjJzOnNmDV3gmrlscdJ5ztfJXQ8lwe87wudB36MUfHxRHar9fkAlX/jtfSssPP3hl
         NickOC/UfscGXzfX5Of3tzgIIoBngsPTT0+09eYFBT5G3bFH6UZqe+0gLkCjqXm72a48
         BUZ912yIUPp9dMnfOae+rjnb0EXXl9WKCFFmxFCU76KPDI6OjbraF0aTkVp8c6qjRmTz
         ftlw==
X-Forwarded-Encrypted: i=1; AKwUvByzOVjN9G5SdJUxtWoOXOYumsnCuwDSpxlQhW+nYfzaffYpF7uu4HWw4DjwfZuxv5UEcsM+qPHIxDyeeE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS+1Wtwv3ZzoonZ5QMlKuMri5Eum/B8nu6SD8hBU1eAN0/g9dg
	4HL2ZfomkWl0lfJcy/cqBe6XjQhjFnNJLH11dsQAWRKDuThUD+GWh/HFq8WC/CusPCEZ+a/mn0i
	CSEFaYtHafT8SD8MMLUmDSY6J9IRIItBW11PJtDB8upc1CUXTgtWIVe6h/ZGn2e7PAQcEvrs1Sc
	ibv1fVo5ihEFXl/6j02IhKfkFTd5pFr92UkYn7Eu1WWQ==
X-Gm-Gg: AYBFou2sG0ABFy/gIZ7GDjaAK4MbnQVd4n4rUcutigmWUG48mi3mU3chH5XxVbyzLXM
	fTqekvvUJ0LXU6QgCIo68tK63e+MGlwkXqnb5ay5lRYXQFL7TG9NJlAiXYCQ60zXYpwBqNRwexn
	UCVj9H4rN1aXAL7lwk9S1un7hjIi4SpIRdJ6Sz8PavAs3ImqCR1xIuYL2o+w==
X-Received: by 2002:a05:6a21:4995:b0:3e1:a4ac:2d5b with SMTP id adf61e73a8af0-3e9023a615emr1998172637.41.1793207691818;
        Wed, 28 Oct 2026 10:14:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:4995:b0:3e1:a4ac:2d5b with SMTP id
 adf61e73a8af0-3e9023a615emr1998158637.41.1793207691380; Wed, 28 Oct 2026
 10:14:51 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929124522.2141124-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260929124522.2141124-1-runyu.xiao@seu.edu.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:14:36 +0100
X-Gm-Features: AclHuK_ZWeAQi2Xa-B21F76suzhqXwNnsAdO0BsvOyeyMH6jBWqA5XunpZY6OxY
Message-ID: <CAPx+jO-9DXrH+b5Y_TMmiyydLTkCQcNZKrHEy39OK8iYkZ3JOQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: omap: synchronize clock timer before disabling fclk
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Ulf Hansson <ulfh@kernel.org>,
        linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jianhao Xu <jianhao.xu@seu.edu.cn>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 2IDE2oovYraK7ymr_EE5xyBFecGHbLMS
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae22d8c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=ywtp7fW4YtRplKC3Ii8A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX2hFKBfBLOrhG
 OIpsr+HNhQa2mE9NWcAYAnDF25UNmCHPjwPfuBg+hUyQjNDCqtjB43buWS3vbYXCwszpS3WILLl
 BQRZHtSqgnB4MqN0L5NdwwcRiXMfzV4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfXx4gPVu2VtNqp
 OEExqaZXPhzEr3gvZtPj4sEMWUhENCwlvVR45PZd+dT1V7WkX9Qra4RMQiLDopTl3PrEpQpFyBc
 P19m1eh0CK7ep3YgGHuawqoYNiF1T5x5DKzQjIPxrBI6cQxVcAIKioGUMUE9qWXuzfjOEAZ4yNt
 OP5uoVm9dwnNMBOUQsP1g8iqkUbTL2RkJAgkrsFziy33Do7ndWkOk1uosfVWwF7NFe8SrpMvaPN
 nVedHAKk80aoFYUjovv+IfiFpSnBTnCmS3XbcYhtn15eDvRRoBWbRgtOgtu9g6TQVR21Z7/jW5c
 DSdCX77VAL9s8/OWv3dkAWMLhkn6ndArJU7e6XsL8uSmIa2OssuyTK4aUP9krn4uCZtulmngoGk
 vKZ/Bioi5pTChrh3Cl4Tz2gbaTvIPVDiImUv7F/a0TphmldRMdzSJcfmbIz9O5Lus1fwNp/LSKn
 ovTVl28crPSVrfwMSiw==
X-Proofpoint-GUID: 2IDE2oovYraK7ymr_EE5xyBFecGHbLMS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280068

On Tue, Sep 29, 2026 at 2:45=E2=80=AFPM Runyu Xiao <runyu.xiao@seu.edu.cn> =
wrote:
>
> mmc_omap_select_slot() removes clk_timer with timer_delete() before
> switching slots and changing the functional clock state.  timer_delete()
> only removes a pending timer and does not wait for a callback that is
> already running.
>
> If mmc_omap_clk_timer() is already running, it can therefore call
> mmc_omap_fclk_enable() while the request or slot-switch path changes the
> same clock state.  During host removal, the same window can overlap the
> final clock shutdown.
>
> Use timer_delete_sync() so the callback has completed before slot switchi=
ng
> or changing the functional clock state.  Keep the timer restartable for
> normal request handling.
>
> Fixes: 0807a9b5739a ("MMC: OMAP: Lazy clock shutdown")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/omap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
> index 527b89a5e..02d288e4e 100644
> --- a/drivers/mmc/host/omap.c
> +++ b/drivers/mmc/host/omap.c
> @@ -214,7 +214,7 @@ static void mmc_omap_select_slot(struct mmc_omap_slot=
 *slot, int claimed)
>         host->mmc =3D slot->mmc;
>         spin_unlock_irqrestore(&host->slot_lock, flags);
>  no_claim:
> -       timer_delete(&host->clk_timer);
> +       timer_delete_sync(&host->clk_timer);
>         if (host->current_slot !=3D slot || !claimed)
>                 mmc_omap_fclk_offdelay(host->current_slot);
>
> @@ -273,7 +273,7 @@ static void mmc_omap_release_slot(struct mmc_omap_slo=
t *slot, int clk_enabled)
>                 /* Keeps clock running for at least 8 cycles on valid fre=
q */
>                 mod_timer(&host->clk_timer, jiffies  + HZ/10);
>         else {
> -               timer_delete(&host->clk_timer);
> +               timer_delete_sync(&host->clk_timer);
>                 mmc_omap_fclk_offdelay(slot);
>                 mmc_omap_fclk_enable(host, 0);
>         }
> --
> 2.34.1

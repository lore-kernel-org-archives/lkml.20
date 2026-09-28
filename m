Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E62A4E7808
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612012; cv=pass; b=daVx6GU/upwzAljo8KmQhV8sD1ExBOlwyEX9qofWmk3TDVa4v4HURQr88UZ03JzZz8C2hP7KQCMVXjadD35egO/faNPya1LmNN1bpR3vyDDt/wNiJF4/gCpN7WjsY5rxVl/RM3VdUE8r4IjsaESQGpMaUH4Tdz61i6WwoHfZYqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612012; c=relaxed/simple;
	bh=QPETLdbCrl3h1O+VwfJJEjyhW34Bht3gyiJe8xZehKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThDkRhLFwIvviQQ6CWQu9t0hjzyYC1+qfFhQ6lMAZcFc7EJT5cGp7xpUjiT2TgdXZ/qRV4Sch9hlynJTXHTIGRGoKIMMl8aJSjyd3OuK+qS5bA6qMU73SjjcpQjJYnsLBK/b4/rLEgmMrXMhKH54WaeMKN+rhVnHlbARm5PUUcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=keXaKdig; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XD49Ff/i; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="keXaKdig";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XD49Ff/i"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdwpW2143002
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZl7fl9vC43HoFXuRfxhax8c0echx+kxviVprOtNlhs=; b=keXaKdigOgfFZf+M
	GHW1mJShGW56EgQN5rLWHIkx+OGqQWKrHhf7wPBvOSmrGhME618Q+805FNgwbWvp
	iVAti+d4NJO340odNGieKmnT+hu3eM2w+dfSr7N75HsbwJly+zjzVkUP17sav3oC
	tQHaqamaPiZtPy+stjVqLxokIEOIUOrY0mdXnm9K6+arQPHqHCiVBvNRM/141XsB
	q7Z1/X4TbcdlgCVTf8paPcUhPu4N7gWDHdvzsxAzFJ4PWQRU06roWVaB4IWmRlz0
	8j/9FmE30bQhRJ4LApIFmq8ZSOJRMDtH9+NynoEj08Qiqf2VPEkzszeBUqwGMDgZ
	MVJ37A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfksm1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee1ec30f2so31012795ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612008; cv=none;
        d=google.com; s=arc-20260327;
        b=H1rTdfaRYN8vs3qwJyCXNG63bDeDPAhiA85VsKk+vaeeySXDRL8NrkKO7EdOeyWVv7
         f0YB+SMhWT4pslhintFZ7IF9bf8HvsX50ziESJ9N1Bx2UfOpw6t18iWfAEaf6kgerHeE
         6K2b6/eQVFz5ls+QwQhELTSFLT/hesXOrOFl4mnByOky91nC5khgLbWzQEdQD7UFdmxt
         giwoO1U2rmgaZ9AztYkbkj7umtNo2Vea1AKMRDabfRBKM2OdRyktXexqEYiUdiwWd64U
         mK4S1IKGimsRQxqs9D5xjHLI1nq9NYgXSnzJZQQe5DWvGU291SFMVaMIA5ZjvXhOmmVF
         Z1VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IZl7fl9vC43HoFXuRfxhax8c0echx+kxviVprOtNlhs=;
        fh=8YhYYOyoP60JXRgsEKym8wI10L8QGVP9PwPn2DWpVm8=;
        b=MBvItIVJ6hm/WNI4DZoLxKSbl/bkqowzMKBJV1y8k+cPx0OFZOpVs28pUkUlCI4u17
         NPj7POEg8u9b+HOxHmmklgDJV/JniFLBg28YeGsYX1trCGxqcYLYgZ1Jow+lbfHqfBBW
         0hOSrt5SuxTq6Bpzvla9lTxG0uLbv+09h8L79TxxJBCCECOVQermUTFM0Ci+VWuttcdZ
         +k+4aOEiaJbm2HUoxwJIs11GDejazUC1pUHYuw+fV/HadjBl7+gDIMC1PMIpVDpuwOVQ
         vG+CKXvSW472/Mj5pKTUruTsuldKgsE87FfZ17+d/nC+OQB8V4QBgRbA4/jIvjXi3eTu
         TbPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790612008; x=1791216808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IZl7fl9vC43HoFXuRfxhax8c0echx+kxviVprOtNlhs=;
        b=XD49Ff/iKlX++AbFVeHvR3pHfv7iS1Ek4q0A18KsYdDp5yI8wdR8gyviPeHqqwTBK0
         n8SiJLhGwWwnfyQ1tGFqQApJMsiYWdsxA4opLeWC4oDObrCYxkDUTHpFnIJIyYSYTonu
         cBDcMBZsY5hGPURRg9Q9V/vttwvqilxNrdEuYJSRhVVRZ+duZEbSfktlCHQ2beodhnTS
         pqHNgLNYyG5V2Elruh4HnjAtE3jWOucDNUtGL6TLMDwjxeO84yFT5RRC72R9vdAEjSuD
         09f4Yx/+/REelSa9sLAXwn+DXUu6vtt/4gfswMq6crPEKS9Yb74S2YHN2UhJ1i1s1xNN
         /BrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612008; x=1791216808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZl7fl9vC43HoFXuRfxhax8c0echx+kxviVprOtNlhs=;
        b=VAJagf9u9ICc6/E+a4Gdlk4X2EuvmVY9wdzN2y5Pfmo6tZxDzkxg4jWNOfpH7uZkJW
         GIbQB0djT4OqXo4WCpdatYetDRiLMohCSBhrJ8mBHJlrEqMTueltzGIEzt0fcsnxYYU3
         jrHzxP6fVOug7M6e2ooZ4Lvomq/dX8TpFi73xffl34GWwY9shJW3XOmygGs7MYv/8WkX
         VcoTmLpkBAwx18nDs071ABiItt4HQ5hhMaVPrv8POSfHv5Q3s6L7fCyhRuuyLKiU4C2m
         oNSBaunFpwDaFX5TNwHKlQWlc1vCeYeX9EH1kfLTy/+QdB6VnrXT9A5xtw03g2xD1CmR
         aDtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmrbtfB2rZVJf1sLGjChenevz8KtPbqTnD7E+l5elcNITTg9HFY7yIPEkp6kCnrBuiFX8BXgsbEJzWggs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYkCOtXLi2vEQm8VKiHE7Pe/+eYkwSdmiqhGUZhNekOd0CEVDd
	NjvDfSqztubKAy8J4r8tARshC9Gs/QFgcoRYALOjDFudhLqTvF28QNqc4FDQo9/qbNDgdu/aCVm
	G7giLnBcm6zdO56OXkt5l0rfLkJftlht1lKBFgU+VCVWDsmeZLhbHe9XGPkltlfxy+/+Ojw0clu
	mU8oSN6/oHQ4jiCdeZESA5XqCx8xP7Gz97fqbgVvV5Dg==
X-Gm-Gg: AYBFou0aanIsIgDqZiF8KVwIVlk2mL7Uolqfzom2chjkf3vQGw/hqUEacKeHXo/fiFq
	hDGIVAdTyebzw5n8aIR6hOgDEwj3Qc52qmP7nl+UjiQJSveXWe3lFU8sptTy1q/sE1hDKnvtdNH
	e+SPjqC/vh26NHkLVVAWKIWqEnY3HkqnhyBkFAYIGiMrozbUU04/BpYp4FEg==
X-Received: by 2002:a17:903:2f50:b0:2dd:c053:ec75 with SMTP id d9443c01a7336-2df7e11acf9mr102165535ad.40.1790612007974;
        Mon, 28 Sep 2026 09:13:27 -0700 (PDT)
X-Received: by 2002:a17:903:2f50:b0:2dd:c053:ec75 with SMTP id
 d9443c01a7336-2df7e11acf9mr102165345ad.40.1790612007511; Mon, 28 Sep 2026
 09:13:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915144457.3463325-1-lhfff@tju.edu.cn>
In-Reply-To: <20260915144457.3463325-1-lhfff@tju.edu.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:13:15 +0200
X-Gm-Features: AclHuK9WzP7c_-qm5LpEcfgT6OqFJRgRH9WwCFERWptgUVAizTg-xTRVM_DTSCI
Message-ID: <CAPx+jO9q0x=mvwZhr=orFO+n==2g3rx97GcCNgGCM-BbJJ-LEA@mail.gmail.com>
Subject: Re: [PATCH v1] mmc: mtk-sd: Cancel request timeout work on remove
To: Yibo Tan <lhfff@tju.edu.cn>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX+mbUt1L7KRes
 icLpqGb/hYkcpizJYHCG6VLYytagH3gE1KqNK5PjYYf7I7nMWnX1IJ5v453BzSOYnNedaKCWCax
 jkhSTG+t5216NxogI3wlj6k6o0cMTXQdJzBrCyEGvjJELnPhxFlIfWjACBJjDy90lXulo67lSK3
 5MZsyatwHHWMJLzYkGyJR/ugiqGFU/hpGli6MFncLbxVeIG2w3YBwRrXnxA4r+sk4Mv7oLwAax7
 CwRikYe1BZjRg4UzC1kTZs/On+ki/hpjbcjqoM/UZOU2CRe+HTJ5X/pK7Pohi+jZzv3jEz6jBtN
 zA+E3k8IyvM8JvWb2jdjRHCakzDoj87TkG5ZAI8WSUvZvdbNWFDY1II4OZNK26b0ih1oenV7I62
 81QzAzDyAKKD9Rhdnz+rR/Sgny2z4PUdRW7nkPYwb3KVP6GPMgeKoZw1phw93N5uHBOElhg+0v/
 6AV7EPKawsb62738eCQ==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba9229 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=mIaQsNjA2lESkmv-XRIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ORy0C5M32EpMm06YMd9lOYmpMIxC4rkK
X-Proofpoint-ORIG-GUID: ORy0C5M32EpMm06YMd9lOYmpMIxC4rkK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX3csYnGmabFj7
 tfYBIijeM54a6WXe83/yAGp7Ef3Son6MK5moJDVbHpxTgzS6biNEWUZ1KzX2d69SeqRX3PEjbRX
 2SzbF6awH9ZV93ZzESf6PZZIJoOSHgE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280064

On Tue, Sep 15, 2026 at 4:45=E2=80=AFPM Yibo Tan <lhfff@tju.edu.cn> wrote:
>
> The driver queues req_timeout while a request is active.
> msdc_request_done() uses cancel_delayed_work(), which does not wait for
> a timeout callback that has already started.
>
> The timeout callback calls mmc_request_done(), which wakes the request
> waiter, and then continues to use host->dev_comp and check the SDIO IRQ.
> During unbind, msdc_drv_remove() can return and the managed mmc_host can
> be freed before the callback finishes.
>
> KASAN reported use-after-free accesses in msdc_request_done() and
> msdc_recheck_sdio_irq() in each of three unbind tests.  The same tests
> completed without a kernel diagnostic after this change.
>
> Call cancel_delayed_work_sync() after mmc_remove_host() has stopped new
> requests and before the driver releases the host resources.
>
> Fixes: 208489032bdd ("mmc: mediatek: Add Mediatek MMC driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 01ea3adbdf3b..5b160fdad3f0 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -3216,6 +3216,7 @@ static void msdc_drv_remove(struct platform_device =
*pdev)
>
>         platform_set_drvdata(pdev, NULL);
>         mmc_remove_host(mmc);
> +       cancel_delayed_work_sync(&host->req_timeout);
>         msdc_deinit_hw(host);
>         msdc_gate_clock(host);
>
> --
> 2.39.5
>

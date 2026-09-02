Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DD336A008
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365260; cv=pass; b=qUxTWRWjGTneBIv9R7ZhiGrumfzUJa0a51KSMO/tdHs1EvLqK5jl0+HLxaHNuu/eoMiGwRYURAv+ZpWJ1ADX2AxNA1Jua7096O1OnzPyeWf/TaTuEoQxHzh7NfQoKiK6IvQN22lzd9q34QrWuGm9Qwqte7Zu34m0rrekYqE8Ayk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365260; c=relaxed/simple;
	bh=aFaxytIBIB1Ve5kiF/Sc2vEjb2OUXD8sz8lmuf0g5Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eabsRBRlT1ukTBxlWUT+1wk8pZt3EExI60VgTmbQeooQZ+QNkzq4TnndthkiD7S+8W0SWZdTBHh3l4ZLX61MsgJ5o4CV27YDCB24jEcai7S73Nn0tyVq7BkZ6Tu6Qei6fR02pLPt5I6FTGSgsW7Hb+zteqmiEozoYzBndYErjDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsipzOKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKRbx1K6; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsipzOKZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKRbx1K6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZ1P63071156
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 16:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DAPmwpOVMYBIF2IijOmIRShxJK4mqn3MwoKwfXdUyaE=; b=YsipzOKZ4KL8slmv
	7lfUIOmUegtvaHe9Q6n5DfrEnbHMetttDM8JsiMptpyFqCWJV5piU+VqF0TpWPGB
	5aJOWc+CF+houMN3k8AD3259qR5ufX2Sj22hlEhnK5029+0Fipr2pbVM5CDfc+JT
	nqa/5zGIjLRLEKYM70juFAX9H2/WHygWQNXie65vVEINziPvR602/ktfEG3b1MIH
	zgniwmAEpQZG7TnGNlJLJ7eQTX7NHKXC26cFpbLMGl3v0NDPsk5OpsZHYrRIueBF
	+vpUf2iu7tNG9aPCRMduPxXedUwuHUcDu0bHXJmlJj6MCxMOjt134Hp50/yoH7qd
	TkF4bg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrngbbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:07:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1426687a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:07:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788365257; cv=none;
        d=google.com; s=arc-20260327;
        b=T0m76g4tAJztWMYKUBM7AKKZ8LbdLK3fM+XkehJkb8mGs/7V6QJUecZIPKyf1g+zHI
         lOIzEEnFBzuIckPfNcT/vvFLxX31uTQdy9AGY3F9t86Mczb6dkYn95BUtTf+Q1BaODdp
         Js/qXIMD4uAgiZsFF9MGiPhp6U8Zg28zW8xMcRT14t8DXMAm487Uo6FrcKRLNXHMrKGa
         zQ5TQojViKKkm1OShOZryY0gsKNfRhC6zMlrx07Q/lRUj7eHaiUTRrltKaXWLaBOqfbz
         QsVCCAJnPJ/AKNFWTigfs/4o6NEsT7UHdDCzNjq0wpPkp4H1awz5fM7MVaI9fPs1liHY
         0YPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DAPmwpOVMYBIF2IijOmIRShxJK4mqn3MwoKwfXdUyaE=;
        fh=2V99hmnJ2fd4dX8YGljA9xPQeiTEAhTk6cG6oiL8+7U=;
        b=o/5tpFjSuqjgZfVvBW4vvwP43vS1FClbPaAkf4EnN9JaWK3ae3sgW7LsX98FYa7mTz
         pFwrb4FeTAgaEsNvewmRB2+kNZnZhq8ZnjV8F3/asXqOuAdSnRp1KwN0Ei/VXAgZV/On
         NtuT8FfN9QjuH9N6gxPkBIDsyA8ss328hRkrGkw4Au0fk1TZITpGIvMMMoGwRbDSRW/q
         teEhpJCVq+hidyCo97O2ojzN1ro/O9FcpBZEf43hWA7ARSYRDSOk6OYYFafF3rW3rgpu
         gJ7VJT48l7h2zZaUfAjakyW0eztMvV2c8yCIuWhu4gfNL/6ZEUTcS6WIsIJwxDpS4lwJ
         aqAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788365257; x=1788970057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DAPmwpOVMYBIF2IijOmIRShxJK4mqn3MwoKwfXdUyaE=;
        b=HKRbx1K6nPCPx66SSA6oN+Jh8jaE8UoViUO/6XR7ny6Gt3XwZbWjgYe2yO7hljFdLB
         CYgNDFUoyf87Sjwc3TUZl7tR6NkbkN88qDQBSTuEBcCDGUMM3NoTdfLj46KoB0mVQzd7
         Q2LRTXIWlHMArbP/m+EbYZJO1zYjEOrkC8p14IY67UU3b6IpMvBp2scgNnrcp1eOYr9t
         WotPwd//RL5HWfhO7rbLN5PBdD8y2IJws+vh6s8+xfpZfNj8m12FTBWyBqy6904Yw/+p
         GRz+smv8kOsuqeIqso5mV/g3oI4OdxVyU3D0GWgaYeUjElrVY3Scpd1kV4FbAkPidedV
         t/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365257; x=1788970057;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAPmwpOVMYBIF2IijOmIRShxJK4mqn3MwoKwfXdUyaE=;
        b=dNtXO2f2WrUYsU+zyEeKimilY/Ui8N15iDOkdP4vA7d7IZTXEMWLysmRebDmQfj1G0
         A7H/H4Ht1Sl6NdSRNy1S8JA9lTtWX9OVDpIhAbk9geGcONn/QR+QiJzJ0MQ6TSsBlZ8s
         i+7asvByI34ZwG3FmnPrlHtfLLc3QK8QQ20L3mqLYaahWHHPuUpWmFb4Gymso93BoTED
         sNsaCdK8951NFSIoRzBUcMcR4aLAAiuAtIeFEt4335jFDRZo8lrcFmwqtsmd0oPsFUZQ
         nh9Vb1y6/OSxlG7LMH+7kBTpaEzibIukpWCZWnng9/Q3LvNfXND0ld0od6Pkl4DkOJVN
         bqQw==
X-Forwarded-Encrypted: i=1; AKwUvBzIHXYNQyvvQMMVcU2f87KIrSUoF97Ko1DFcMTNVm7US2ortj6XGMKrTPygplDhf52SBxjPCuOohj0javU=@vger.kernel.org
X-Gm-Message-State: AFuF++nGU7eXw0rutO39jHmW5PQe0IHEtwxRXfdwD2enMppb6mEvm5gg
	qJJpC+1vxWI0GejPTa2ONMuj5jQjEKqhgj9t7a3GfGG+RoQbH95C2quudjtyiSghbvc/drLR4eV
	f4GsUC8CerZ7/kkQbWiK8+z54jiAb1eFV76CmOCVYbmvLLNqfy3jvYEdkI8uLGLpsZwKXLypB8j
	YGYJ607mkw6QwWiggILSCpDfFTKUp/28YMHQOYlRPebg==
X-Gm-Gg: AYBFou2l3xU7t1C2NOhwBzVQ11DFHw8fMWsdagH/f6O+4l5ylxpAJwUSlaVmp+yQZBZ
	5TbqSGXrY4aaTkljvTOxUdgrJTKclROPRCbSz4V3El+r4e/V+Q9+6iirzJtz2ZdpeTZmM5uGGOK
	SW1y4MvoroXAbRMJ1/8bYFb4514CkQnh6lfFzPHGRRYA1N9gjRpewCFU05lA==
X-Received: by 2002:a17:90b:2e50:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39aee1a9994mr9843021a91.22.1788365257025;
        Wed, 02 Sep 2026 09:07:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2e50:b0:398:b426:ca4b with SMTP id
 98e67ed59e1d1-39aee1a9994mr9842890a91.22.1788365256476; Wed, 02 Sep 2026
 09:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625003525.22594-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260625003525.22594-1-pengpeng@iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:07:23 +0200
X-Gm-Features: AcwNN1Um-bxia3REdAXf8m-38tcHtMIEpV7_v--sQ-7-GTkWwOc4grrEf97NRUI
Message-ID: <CAPx+jO_6jWt2YAjzHnD56_LX5mAFkxwOiUy4Ka+BRG9WX2M0PQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: report DMA stop timeouts as data errors
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: BtGHGcd216I6Up9NpboZ-ntE5Q_JQO_F
X-Proofpoint-ORIG-GUID: BtGHGcd216I6Up9NpboZ-ntE5Q_JQO_F
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a9849c9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=CBFGLoz9tPvRy0Ij70wA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MiBTYWx0ZWRfX5jgPJ2OIoofn
 3T2PHuyerJ7XiYwZ7Swsk5OPuKRweS1a+hfYiStL0ot1zbFe7bUO9swggUqJnXN1EwIY72cIMca
 9DBguWk8sxccKlsgl8Xm7v8mFskJw5qgrk7FyE0ZPbkNUJ2zPsj2OIrl/YAgNLQbqLPr5L9LvOf
 GGKjjF0l0FBrBIURKsznfyj6U3f81j/a9OALTnB61V6K3F8tUAAT24KFtk2yxABo9ElMlu6YpdT
 hBDBo6KGG+MzbT66G2PAE6lJ39cQDClQZDrghJZ7ShHx0m2knNEar6nO6LwuOn+qS40cfjBiUQS
 70yTCPqa/amqQ5ioOXm7EKuDMOx+4+pkJQGkUUUccJONiKKkikfci4lMH7i8bFMBW3AEQTSq+pp
 uEDn2hxnE44PPcV11NjVtpA8Myq10QmqjiTZyzjp9tFRAvuzhmHfifso4MOfu4N0U+nY7EnFrWY
 rr34+sBudiFCwbmAyuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MiBTYWx0ZWRfX57XfbFuF8d3K
 5uDTMkNRaPkrfshxhgk+GL/jVbTFE7k2Hig/4zFFyfZxs2hcuxMxVWLGupl2ltvnRYGxFqGWnrB
 hoqWXEqcYIaa+ZviDGvCUg3LJ96Gr1U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020142

On Thu, Jun 25, 2026 at 2:35=E2=80=AFAM Pengpeng Hou <pengpeng@iscas.ac.cn>=
 wrote:
>
> msdc_data_xfer_done() stops the DMA engine before completing a data
> request, but it only logs failures from the DMA stop and DMA-inactive
> polls.
>
> When the interrupt status also carries MSDC_INT_XFER_COMPL, the function
> can still report the full data length as transferred even though the DMA
> engine did not confirm that it stopped or became inactive.
>
> Treat DMA stop/inactive timeouts as data errors.  This reuses the existin=
g
> reset/error path and prevents a timed out DMA stop from being reported as=
 a
> successful full-length transfer.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Hi Pengpeng,

Did you verify this on HW? If not, I am leaving this to the mediatek
folkz to confirm before applying.

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b2680cc05..e3caa9c32 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1583,7 +1583,7 @@ static void msdc_data_xfer_done(struct msdc_host *h=
ost, u32 events,
>              | MSDC_INT_DMA_BDCSERR | MSDC_INT_DMA_GPDCSERR
>              | MSDC_INT_DMA_PROTECT);
>         u32 val;
> -       int ret;
> +       int dma_err =3D 0, ret;
>
>         spin_lock_irqsave(&host->lock, flags);
>         done =3D !host->data;
> @@ -1603,18 +1603,23 @@ static void msdc_data_xfer_done(struct msdc_host =
*host, u32 events,
>
>                 ret =3D readl_poll_timeout_atomic(host->base + MSDC_DMA_C=
TRL, val,
>                                                 !(val & MSDC_DMA_CTRL_STO=
P), 1, 20000);
> -               if (ret)
> +               if (ret) {
>                         dev_dbg(host->dev, "DMA stop timed out\n");
> +                       dma_err =3D ret;
> +               }
>
>                 ret =3D readl_poll_timeout_atomic(host->base + MSDC_DMA_C=
FG, val,
>                                                 !(val & MSDC_DMA_CFG_STS)=
, 1, 20000);
> -               if (ret)
> +               if (ret) {
>                         dev_dbg(host->dev, "DMA inactive timed out\n");
> +                       dma_err =3D ret;
> +               }
>
>                 sdr_clr_bits(host->base + MSDC_INTEN, data_ints_mask);
>                 dev_dbg(host->dev, "DMA stop\n");
>
> -               if ((events & MSDC_INT_XFER_COMPL) && (!stop || !stop->er=
ror)) {
> +               if (!dma_err && (events & MSDC_INT_XFER_COMPL) &&
> +                   (!stop || !stop->error)) {
>                         data->bytes_xfered =3D data->blocks * data->blksz=
;
>                 } else {
>                         dev_dbg(host->dev, "interrupt events: %x\n", even=
ts);
> @@ -1622,7 +1627,9 @@ static void msdc_data_xfer_done(struct msdc_host *h=
ost, u32 events,
>                         host->error |=3D REQ_DAT_ERR;
>                         data->bytes_xfered =3D 0;
>
> -                       if (events & MSDC_INT_DATTMO)
> +                       if (dma_err)
> +                               data->error =3D -ETIMEDOUT;
> +                       else if (events & MSDC_INT_DATTMO)
>                                 data->error =3D -ETIMEDOUT;
>                         else if (events & MSDC_INT_DATCRCERR)
>                                 data->error =3D -EILSEQ;
> --
> 2.50.1 (Apple Git-155)
>

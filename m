Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794319418;
	b=iMSIHHt6ohqsFD7G6PZ6L2JxhyHTLL/otZjN2O67QJug9tMSYfaWttOqdFMsW+30zpHi
	 ksaKFX7vYDqPlGXCPXjueRXtkQRQ9jAErP+wu5dsYfqjTGOEd2d0ETIncfE6L8dAziL7b
	 EAkymiBUbK+5DMOtjqLkORTZvCcIP1oaLbkMVlyOeDIKxHk6HyzeM7B18P+Wol7y2rLkb
	 Q0J3KNizQkKtGmjggIUC6XhB0/diMeyL4ps/N3K49iWoix49qW8sXimNyXzwvtGxevIqS
	 vuIkUkUQJocxk/7qVY1NYjeif0pnWeO5+8SAMuAdtX3WQkA6JT0OLLXbRzjFyYYlwuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319418;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ek5NNY/Kina5esSdV1eh8PHtvhY8sTVXt0HaMhKb/+M=;
	b=2FW4fy8zBvzGed8PLq4tBNGEh+y8spg9mDN5h1zmJMKs1Zbu9QYcz/7j4dTnfz5jx8ff
	 RZgah0qavrDOAhnRALwWGAKi8yAEJOACubcJex+golRScNHvKZxEP2WNEXWI1MLI3i56Y
	 m1H+GSyKEjSDNHBMcDNmVhi9yAQVKZ4bi3v/c+loOlNbHTaoBwSNyqiHFWid0ChK1IK1X
	 /c+z4YfEO16y4Bcxxo6EOw5hVYuZ7l4OZCdluyyil7UWC4ptiUE61/hAhUBa/tc4ME5TD
	 VELsybTVEulirK70g5+YqIq+mn+le+eKV09z1ui/9u+Vq3Br5ASsYS8tKtZv6ZJc6wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duCEkvbl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZZUliZfK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E730F60A2607
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E730F60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duCEkvbl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZZUliZfK
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAE3bQR028749
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ek5NNY/Kina5esSdV1eh8PHtvhY8sTVXt0HaMhKb/+M=; b=duCEkvblviFFNHrQ
	BFI3/JtAG3aSmw8heuXx6P5iVUOg/m5xN7jPov5yWeqyfAR0SOlV6YFMLu5I957x
	PNqsz+xC4i9iFpyP+aOH/6USXcwJQ04TM114LyKWkyToExiWrD2+FolaA/obNvhj
	jeiST/GFCv1T4h22OAtMko1mTykkLi8BH5rUt7mmIs6a9PSal7svLt/yZFCt+1dd
	UTsqWiBYBxyhwIgNernFyDck5yF6z2MYquYjLzpaqErlJLawSNYgjZEqhPeXeIql
	TR6/k06/k2IF83JUmQ8k/59gYxEEw2MiolPq2JOSjVHJtIGiVZCyunmNs9Iu/EZ/
	zgzGZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pv8016-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:03:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb5375cd68so18402895ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794319416; cv=none;
        d=google.com; s=arc-20260327;
        b=rLdb5VJqHLCSlwSpAg2w0t9lEx6UzXCheCIaZCuTveh3p8c9AgF+Boh9FoU6t8pj9F
         /oPrMD3npsA0YlyHFvkDv9o/YUjd1Njhnowi6i5a9HNMJkKhePH9/mitvWUObfaNJVv+
         +M1laa8BFG4WuAshMyq4lrwG7aRG0zrb1Ngq+cVIq8L9p4Zrp4rjco+a36mAdS74hLDO
         ZOP4GVNsTKxwx7QcDe+gET7p2K/9kjQ+SozNY7zmy0kWrjXz/TqDzGGynktX2ig/olAK
         nMc9xz75rJP8Eze3F2fXlGddZcBIShBsxQdK51DgT9r6eUh5kkEl9hc7oogPTBM2lQ4l
         /0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ek5NNY/Kina5esSdV1eh8PHtvhY8sTVXt0HaMhKb/+M=;
        fh=kVaYUNaYjp+vBfhjRKwGAE8tBGJkwVdhjftx96yqwKQ=;
        b=r9Rm6IY3OqZKDLNmELsEH1dDFa5cU52xdgSeNCC4pUpU+yV/6/N8uY1wmqlOJSZx1m
         zIvn8hFqjxjnm+cONY/2tkr859+h4coXtGkxfJF/6XBxjaYJA0NXtpZg2HEeolymHrce
         Fd3fsjqXFpIpc71oAGbaF1ELZZZ/rvzprXNs/ZG4P71Hl+ebCDQ+W0kF+dUjxnPoVwBS
         ZPkiS1pGiEPnvVegcZdIYdsmNVq7e5EQpCqX6MyXYBoVo+p2e4QGSr6wCAjI4wk1CeOD
         /eAjF7Md3nsrpW+b9EIPGJLBAjgo4Is/62u763IBoILOql48+OcxN9SGDg5iW4eqP1kc
         TsJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319416; x=1794924216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ek5NNY/Kina5esSdV1eh8PHtvhY8sTVXt0HaMhKb/+M=;
        b=ZZUliZfKiBmVwSXUrjbgWNZkQb0ZQLoCpVS0JYUF/2wNL5Q8VihSAFCMHkc58exuR0
         j9MmHsFHrnXYePaPrMdIEw1CKLcM14lwwSiUkU4ItAA2FsChIGjKbl9AfKLpeNHtzy7v
         GU/C6HRL23F9pOT8r8/3HC/kHBG6hv+nW1+yaTNyhdtKa4uYZtcY/9XGRE1Sqf2fwKTw
         2OnMu9lFn3Sbee0AEsvGrXXN7VSalX5MajV/7icl5wgzIoIB97Xe//yxFUr8nyRED4D6
         Mw+WjgLzoFY+VcEwgvhvq0Ann0hqkjHRxRqBlpiYKrPdWBXgrk5syfpc6nX0WVPx8Q7l
         8pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319416; x=1794924216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ek5NNY/Kina5esSdV1eh8PHtvhY8sTVXt0HaMhKb/+M=;
        b=PZwqWmLTL5UXxje/Gmhq8gOBpdMdORo2rvgN70ZtsspEUfK1t5BRUPCiWCQHccVun3
         jMc7VdRiauUJz6wkuQEllhjHDln0QNWVuf0wxDK+qiUeuLleFpXrr9xyoYmw5/cpJop7
         Ux0Hdo6rKo/P4dwmbt9lUrY6XsPsQrG0eAspdV0tQOhWV4iQW/h0yYRVSEPSuDYyzgKd
         mf83js7XNy0QXrFW9mI0WVaCvwSkG22bUogKuhlOFmHCaNopIQFxWxaXFqWDkTi7Hm7G
         ql9/pRyTz9riTHuV9s26BpFuVp72w4xx1eVMrMrlTq0TPl+17VjyeBrWcgrA6M6NH5Cs
         kkIg==
X-Forwarded-Encrypted: i=1; AL+hErEXkQ7+F3La69RKU9BpwF36XDCHbjgevOrba7thjLg4nzF0GpLzoOuPXHnhGokaXMrpqN4p8jqsiQfdyXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z++oloQZ1ss8OFDUblm3GGMyBL4CA34GAawYGpCQ/0AjUX4P70N
	O4E6fUqghNxBvPIXSlwpCFRyREXpDsiE0b5DeVd0vRUdD1qJcXt0rwawOD0mQV04o+5bsxFZQbo
	Up1xnp6T7PlTYZTgVsijHvndjOd+qsoETAEx703crSx9v7/umLRvLn1BHu67lAOCjcQcN9zYLGc
	SaHhVvO3MZXQZHk/joCVWs/p3R9Yx4djqS8nienkpwNA==
X-Gm-Gg: AYBFou2pQsZ72gm9DOB3Lj/KMS3UylL+f56E93/ap+f4ztV188O7M3u1LNAK6l4SLjH
	3AyJ2SjDOAzUzbfA06PhkwqhtS0M5P8Qq7UZWgRE9xz26n0g64fveU4/IsgCOy132lZGDlqMOFL
	T27U0/tM6HH6I4wmTW74jsoI0FOBfdBEwNMtznhLCqlOLVrY0dQS4FjU5xuw==
X-Received: by 2002:a17:903:4586:b0:2ed:1b26:2bf5 with SMTP id d9443c01a7336-2edb929234bmr24126725ad.44.1794319415835;
        Tue, 10 Nov 2026 06:03:35 -0800 (PST)
X-Received: by 2002:a17:903:4586:b0:2ed:1b26:2bf5 with SMTP id
 d9443c01a7336-2edb929234bmr24126515ad.44.1794319415317; Tue, 10 Nov 2026
 06:03:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030143151.2916788-1-codex@local.invalid>
In-Reply-To: <20261030143151.2916788-1-codex@local.invalid>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:03:23 +0100
X-Gm-Features: AclHuK9c-6I-YAHtE9dTnl7aHjWrrxjIwBDk_O287mNrvM9-nmP2rQsZ5uVzYFA
Message-ID: <CAPx+jO-jo=1rZJ5ps127D0xoHnWmqZFmn-Nq+OkECVGvTQzZew@mail.gmail.com>
Subject: Re: [PATCH] mmc: sh_mmcif: unmap DMA buffers only after the transfer
 has stopped
To: Codex <samarth.colleges@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af32438 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8 a=e049Jz8NGw_-8GbDANAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 6JYh9PinncOy7zDpSwxAgbwFnGM3SYBN
X-Proofpoint-GUID: 6JYh9PinncOy7zDpSwxAgbwFnGM3SYBN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfXzR1+5LzNv41G
 RtBppA2UepWA7VVzhlncmZIM1QbYhE8hmWg56MQAPYe/WLTIBJ4H0xkiNzbu4q53ZHA+Sc5urnr
 SDYSKzNFTKfBsc1pXIaL1PjVdfMIk8Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfX4JUa8xi3GwbM
 DF/Yx4lQdYkEUDsGgBuHZ9o4308tmtucD0ttz3Ab0m0ciV0aJ0CoxB+xjn8Nit3h7kgu1ntnb+Q
 S1426IE8NcePdIAV0hve/12kwr8GU6mCDQLAbBY3NC4ZrgPSTbFRn5LkawRIcGtvu+tUIhUP3BX
 +x7FGMS8OHNYL3xfoerC0fCMZNpZI8cMWYj1en03f5/aG0DptzBkbuZ1Oat30K6Gbb3wAafcVDR
 q7RASeQPL9Ke4D9UjIJSJfxkvw3FE3YDZDGn9yskHsM8nBooYLxcTnPr9kkdyhhABYc/bL8P5ET
 YbOZHdtoRSyeWwtB8UVNvs2VGf4WoGVwN1L5CX+UOlTJXg0HGvXosRktYegWbb8yGPQqLS+Eg7G
 VhX8SaTWRe6pgWeeMD6NAtfpMzVaajsnpFrgCpuOApERsqOoOJOUFmBXEhB865GdKCGYIVu0pIU
 CmMPh4TEzuKzwlWPvWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100055

On Fri, Oct 30, 2026 at 3:32=E2=80=AFPM Codex <samarth.colleges@gmail.com> =
wrote:
>
> From: Samarth Narang <samarth.colleges@gmail.com>
>
> When sh_mmcif_end_cmd() is woken by a data error interrupt or a DMA
> timeout, the DMA descriptor may still be active. However, the function
> unmaps data->sg before clearing BUF_ACC_DMAREN/DMAWEN and calling
> dmaengine_terminate_sync(), potentially releasing the mapping while the
> controller is still accessing it.
>
> Since data errors can be triggered by the card, a faulty or malicious
> card may cause DMA accesses to continue after unmapping, potentially
> affecting reused IOVA or SWIOTLB mappings or causing premature cache
> maintenance on non-coherent systems.
>
> Move the unmap after DMA termination so that the mapping remains valid
> until the transfer has either completed normally or been terminated
> synchronously.
>
> Fixes: eae309836509 ("mmc: sh_mmcif: Terminate DMA transactions when dete=
cting timeout or error")
> Assisted-by: LLM
> Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> This issue was identified through static analysis of DMA lifecycle
> ordering and has not been validated on hardware.
>
> Since the request pages are not released until mmc_request_done() is
> called after DMA termination, direct-mapped pages remain owned by the
> request. The potential exposure is therefore limited to the DMA mapping
> layer, including IOVA or SWIOTLB slot reuse and premature cache
> maintenance on non-coherent systems.
>
> The fix also relies on dmaengine_terminate_sync() stopping the channel
> correctly on both MMCIF DMA providers. However, shdma clears CHCR.DE
> without confirming that the channel has stopped, while rcar-dmac polls
> the bit for approximately 1 ms but only logs a timeout if it remains
> set.
>
>  drivers/mmc/host/sh_mmcif.c |   23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
> index 8bd9cdeda..7b33f832b 100644
> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -1173,15 +1173,6 @@ static bool sh_mmcif_end_cmd(struct sh_mmcif_host =
*host)
>         time =3D wait_for_completion_interruptible_timeout(&host->dma_com=
plete,
>                                                          host->timeout);
>
> -       if (data->flags & MMC_DATA_READ)
> -               dma_unmap_sg(host->chan_rx->device->dev,
> -                            data->sg, data->sg_len,
> -                            DMA_FROM_DEVICE);
> -       else
> -               dma_unmap_sg(host->chan_tx->device->dev,
> -                            data->sg, data->sg_len,
> -                            DMA_TO_DEVICE);
> -
>         if (host->sd_error) {
>                 dev_err(host->mmc->parent,
>                         "Error IRQ while waiting for DMA completion!\n");
> @@ -1208,6 +1199,20 @@ static bool sh_mmcif_end_cmd(struct sh_mmcif_host =
*host)
>                         dmaengine_terminate_sync(host->chan_tx);
>         }
>
> +       /*
> +        * An error IRQ or a timeout wakes us up while the DMA transfer m=
ay
> +        * still be running: only unmap once it has completed or been
> +        * terminated above.
> +        */
> +       if (data->flags & MMC_DATA_READ)
> +               dma_unmap_sg(host->chan_rx->device->dev,
> +                            data->sg, data->sg_len,
> +                            DMA_FROM_DEVICE);
> +       else
> +               dma_unmap_sg(host->chan_tx->device->dev,
> +                            data->sg, data->sg_len,
> +                            DMA_TO_DEVICE);
> +
>         return false;
>  }
>
>
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907

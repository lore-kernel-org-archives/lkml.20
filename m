Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610B54DEC0C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612029; cv=pass; b=JtiTPP8IoBM9ccobz8MvMET49OF9d6ptAe+9iRoPuouZrKN7YNPy1gIlRULnoFGHimwg42z/yeEpNI2c6u/wM+bSMRStCIFwJ4A06RJURDBlkCbmLbee5FTz2eaJynVEaIB1inLwvLoVlhBFCHIli+LLm7ixBpSJu0EsNQgJ02s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612029; c=relaxed/simple;
	bh=C2R1jzLyRMLNPTcwZKMSBnFNoKFMwMYrYL44Nwq9JSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnVQ87hGovB0UknhoDXBNj5QA4cWdZBVKsqkxmcqufWfOoBPI/ybwIMTmt1y+2L6Pgpr5xBBEeeGW70GnKFVmzgpkdLoEtcx7ovnyeTSVrH5MMcLUXASAju9FZ0nn3QHR7c8Qs7yjzV4lKYzuzU3B3Lf1WbsH1A/yXncBq9TN7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrMxEnQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gm772tgt; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrMxEnQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gm772tgt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEeUGZ941418
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KC/lCZJ7qlaSJwHrLxlOH5edVvtPTLCFOdsNX7ze6Ac=; b=RrMxEnQZYFTlNz0D
	bc+sNQNzBMjkfgEjq3T7iOJr9bGHBXN70z/6LPSW51N5yVqX7WVSPDQbT1dByWPQ
	MqVBIcSqpsrTG3In+0+Z7xTvj/RxEFfK9W30ETjPTvshMESN3m4YnIcCVhVI/La1
	FgJn1umNj0XxpJFJt8gWnNUWgkWOCCf5VadtjWwkOtHtMwGLBwRgLsLq01KLsTSp
	LD488CC0M3Mf5LEpCbKyzaEmsxFpLSb/1+/aao9iBb9g6HsC32Q7ciBsvCqmenJ9
	XzqjkmqhvSOfPXewETDcctg55dhDh/5dR15dPiBmGNP3cCVhFR0UHVUmWEkcnX9c
	NwviwA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt12bce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so3321210a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:13:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612024; cv=none;
        d=google.com; s=arc-20260327;
        b=FmQJI18MjN5UBq8k4Csjj4fzVhwLuNIPpYvDsu9qfaf3Ftl0jCAIXrwrKMz7xVIL4f
         XSpvQoOwmHBMHH6V8+KjZW37K1qlCaDZjRaA8przQo+UHphHBE5DicQQdvsza2H+aPMM
         DOCAZSVJAlLnKv5qdPbqqgaKMV7pwMaAYDSDNAz+TH8hlwEtP+ittM71tDRVk3ENE+hU
         PjCQ+/aL6wGTnIp4apr76AbVwWyiKAb45fFx9aob6qkLtF9yvgWFAv7ragCLLjiRSwCv
         I3lnkLouu8EcYROrcP/hK1F/n0jvtzvDvW4cxfbkrVpMi8mFHf62BeYfCJwSpmdo69JN
         NgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KC/lCZJ7qlaSJwHrLxlOH5edVvtPTLCFOdsNX7ze6Ac=;
        fh=Y8RkezjdVfw7ltADqR2XAgQ4NZef3Qe6dT/e7QC7gY0=;
        b=QfA0grUYcTNtLQoKK1TsvO+3IbLOanqInoPHZSBiESaNLaeK/Kw/NtOg1SKXVnqXSq
         2Ii6yA+e7VlrTIrTIcJkHnozJZ+DK601/DY8IGLjeEsvP/8NQUH+jlFTyqqQpc4iwvec
         4CtYWROxlODe5CMcX6PRxKMG8dfbQwB90sWuu2gv76j58mP1dfWq+LKOFrNaA1KJXRlg
         s9O4Vdym2x1FZzxfWtAZ9sw8hK1BSryS/LRiVtHGklSEyqrLS19jbfAs5UTGfxXmchaU
         tow/xT8qNgcW7AwweE8SWcW7v8vzIR6KMxGclEf3wBgMpChlV3MutGgzWHvdjM8TOsOo
         0/jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790612024; x=1791216824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KC/lCZJ7qlaSJwHrLxlOH5edVvtPTLCFOdsNX7ze6Ac=;
        b=Gm772tgtPTlEGsbHoFf1v3dN71CN9hgGIlxArfmoIyiGOd0ibPOaxKIzLMs0hbCQCS
         CEqtiUg0IL1Rbuz/vcB0PrQMYZ4qcRZRe/MXk2qYYkZO5aaq/2k1Vq6SW0psx/kdXVoR
         TLpLdShg62NXa0jG7TMP1sepoblbxQ4tPMpzp5HWlbS2tXkU8WdDGCD1axw30y+APtup
         RmsX09Pk3LNUSt6HOTuiNdRZbflLno2Zd10vwbZCmqV/n+GJUzxHj4VX4Gyt8VmNfexa
         I3e0VTQrh9wWo5pMi3wZJpC+nUu2yttkPqp334LoNmuGiicXrXIJCEawT4pGozvdt6+F
         B0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612024; x=1791216824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KC/lCZJ7qlaSJwHrLxlOH5edVvtPTLCFOdsNX7ze6Ac=;
        b=ljRA2X3iwudhbmbeKJ9ePV7nMC3h/zCZ9d3n194qADEcWDrNyKe0jILgOQQhmIRI30
         O+v1pqUOkk9OCgC9ffr24faQHEGOYlNDy4ewIBRBnMgY5cNSMCivnNZKIPE3L8zH92hv
         tdieb842fDT7npoaMTyogJy1YKHprXakxue/klkhbtcrNkZ3BMTlI+QqD1+uruRf6+gr
         FehYBwd62m7BL/2K2Zo6In93EIY/20r+Wp+DHVOOowiAbfEVb9OQ7fnQYoe2Kvb4wvB8
         HWkgpHYp+mMphZtAQzvC915f+1B8bReQtwHbUUYtQg+/x++5WXS6nwhmz/wPr8zKF9/3
         I3XA==
X-Forwarded-Encrypted: i=1; AKwUvBx5bHq4lh8CL85GOC5b8lcxja0NbwRFeR9YJ6MFHBenIT2/9um8pxFptkYevC4Qu3OpIOq70NzBY4vmaBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6NW0yrGN6kGUaCS+9Ro7W1AB6NV5WbL3+vzGl6dXZaPXL0Df+
	lqhyUh0ehqhN7iFmR8NmqND9+qn6n1UpceSmqTohatjJU3CibPd4439CwYw5HRr0UAy1yUjoU7Q
	VnRQtpEqst+8Tuk5nophrKSYpbNZBGpQibo3C99TkOGR8FW1Riy2qOSbZ8piwZTs+InQdAQ1x82
	w7ScTPhmtYTuqQPxCXxXHZyEJhHxVl07RzkZQc8SRSMA==
X-Gm-Gg: AYBFou2Ma688k6Y8f19nErS9ryy4H8MyTyCsAcioZl/VEqprj7ct3E1BzZaU799s4Up
	gUyUXBP7ILfqnzXyHxKO/8QKX3Jbs0X77ZWVXOtR9LZ4wo7u7Uz5N+V0LbnCzGTrBObJcLnQGmw
	u+G1+/4sniGi3BPoQPZ6uYvgsC/lBSMLr+qGrhiDjR6gFuSi06nUilfHkmkw==
X-Received: by 2002:a17:90b:540b:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a09855cfa2mr10341112a91.0.1790612023313;
        Mon, 28 Sep 2026 09:13:43 -0700 (PDT)
X-Received: by 2002:a17:90b:540b:b0:3a0:4384:adf6 with SMTP id
 98e67ed59e1d1-3a09855cfa2mr10341096a91.0.1790612022801; Mon, 28 Sep 2026
 09:13:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915150317.2444609-1-lgs201920130244@gmail.com>
In-Reply-To: <20260915150317.2444609-1-lgs201920130244@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:13:30 +0200
X-Gm-Features: AclHuK-X-BDgOMZUiT1godE1FfZ_R9GlZELj2HSpr6Kis3LC70X210-2yVnsAno
Message-ID: <CAPx+jO_ikSq=QFwuu20J2ryBigmmk_5QsUzNbp75RUddG0fH8A@mail.gmail.com>
Subject: Re: [PATCH] memstick: ms_block: destroy io_queue workqueue on removal
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
        Ulf Hansson <ulfh@kernel.org>, Kees Cook <kees@kernel.org>,
        Maoyi Xie <maoyixie.tju@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX9B5JuD0vrtZ1
 LGkD004J904YJNt6gLkfOgdg7mwsJL322WUXFkQs45wdzhJvjvHg5D/JBBAThhkd57wZ3+nqefW
 hy4YIBZc6cu8EkYV6RiLxSBzK/TSkiQyUF0rUdRNRVk47ktN0s8ESvWrH+OHgbs9FPirIbysyBw
 xdVn8b6OBlEMyLQAqWrS2GkuQ2Yo1HzP/dYD/hpCxs7o0GKI+1r8qrToZ4UUrNprKJcxFQs/XIj
 cH9kcuFaol+uKL1dou77Cr7QTDkpRan624uALKZyZZeZay7WHHKLduqjTvi9js1f8tUXki+1UhO
 yJqAApTql/8Mx5iw52O2VAO4zyTbz9xYAPcDI15ZiGXwk3+9gMxlwPgR/IVs87PkI9wGixyIlP+
 fGGAXXygc89i+VDMzNwr0TCdItydpHSvj6FjcK7l/YFM/3lRa+rEanv0Wc2FJWnCQq9EC0Zqy9o
 RKBAxKgYCkTq9pvhqaQ==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba9239 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=Plh-MFd_Tk850DHwDTYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: FCT2WUwnU100aVQTfvO2q2wIvLUGQfk4
X-Proofpoint-GUID: FCT2WUwnU100aVQTfvO2q2wIvLUGQfk4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX7tUnuuyBDlO8
 H+RpM6+G/kTiyMJeaRtXrraD1sZUGLSD2JLMnMPU2yPs/SkRVJogCbeEn8OWZkcQ7TaaBBHc96s
 uH//A2P8O2UFeeKrAbiYGHsuWya0B9A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280064

On Tue, Sep 15, 2026 at 5:19=E2=80=AFPM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:
>
> msb_init_disk() allocates msb->io_queue with alloc_ordered_workqueue(),
> while msb_remove() does not destroy the workqueue.
>
> The probe failure path releases the workqueue with destroy_workqueue(),
> but the normal removal path only flushes it through msb_stop(). Flushing
> a workqueue does not release the workqueue itself, so each card
> insert/remove cycle leaks the workqueue and its worker.
>
> Destroy io_queue during removal after the outstanding work has been
> drained.
>
> Fixes: 0ab30494bc4f ("memstick: add support for legacy memorysticks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

I have already queued another fix for this, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/core/ms_block.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_=
block.c
> index ce33907bfc24..65154e569a9e 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -2204,6 +2204,8 @@ static void msb_remove(struct memstick_dev *card)
>         msb_data_clear(msb);
>         mutex_unlock(&msb_disk_lock);
>
> +       destroy_workqueue(msb->io_queue);
> +
>         put_disk(msb->disk);
>         memstick_set_drvdata(card, NULL);
>  }
> --
> 2.43.0
>

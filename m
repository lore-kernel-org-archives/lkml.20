Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793370982;
	b=eoirdiUyaOqtb3/LIuCAb3Zo/Gmr1Ai/ayEzwKTtEe6IOVMvJOXFZ3ucLGCTt/3cFPwK
	 xsvxEfvQUVdp28LeTryJI/uXzhRXs4FoSLKKzbwReEN+N0o1w8Y0wzL3AfhJCDvaIxuFD
	 NCsExUA37Q1PSY+6O3+frmOpcflhwBASv8cvj6ZG50lEPIktKxIiQJg2QYOYaci+jgP2q
	 3Lag2DQki+uGudsYw2/PeO3alRaFX2jGkX3CE9lrK+R9WKdV87gS7bxg4HISOE/ox0kop
	 ERP3LrThyGWD9kGDdvDXEy+JmUCIlPqSH6deXUy+oC/9y9xqZbrUl+vBwr9kKRr3bTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J4apMJBTp7WdrBg4suFHTn5q3Lrcb7dvdWPvcbdMeiQ=;
	b=v+Nw9Gr1A94x+tvmMppiOikPfMpJCKRgmTVd1XAO1uFafjhRKNSPBVX3SRPP1+PSQ4xE
	 c+Evumz+6E4S+M1o2CA2XCKeg0tCp1sivAjwrOJY1SDnhQvoe7pHUUv5sYOOM9weVAd4L
	 Tec4IloxHvykNCUCbo6O/iR/8Q2QMPvefvswy4RetVcWk1fcv3+dV348XTUZdmh6gNgc/
	 NJB5HOiMG5WfD0H/5zXp/MjpkZ6bpoWMCzWamj6fOyvAbcmsdX08i+wMwZfipMGrdWg8a
	 ST7KR+f2S48G8QV+Sp4cjp0dcm3WIE8ZMjiibzYOMn9Fr/EVT0vEexLUjhOLPvMRghQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ndvex3Bl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB3D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB3D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ndvex3Bl
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso862868a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793370980; cv=none;
        d=google.com; s=arc-20260327;
        b=T49ZCU1u8yPv6w8gb+G/qDAgS1shZ9sVBpz2aZIElspqGzC4gicLFxq5wPtUB4nQ+w
         57NgdPIEvPyPKCS4Ty563N9SLD1IPHfNgK1Ax8vONmr2rhOEhGcA6Sg/XguFjx0et7qY
         a5pqETQJcVOTl0bUzz9Ca21OLSipjJ1PLjpq5Beb9sX8kAQ8PEyoRtPTXthveoE52y1k
         7Gd9vw3Q2zDoFVgyiLZeNaMtPU7Cfcnz9AnuzImfxM18H0hJ2+4c9FAbizoVP/UsiFng
         S95a9CG/oPTiaPtEl7jw+WjDCDDd/4pwY/jRbfK5vu7mGAusM85XH3kG65pLC7QslD5B
         XyDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J4apMJBTp7WdrBg4suFHTn5q3Lrcb7dvdWPvcbdMeiQ=;
        fh=KDYRKZs/pz+qAg1+zqkOYKGHLZdC+Uhjdrq+IJ/KTTU=;
        b=KSfjrziN1TpUAd3SXRzQpP5Xm+vh8hqTGgJzvhemTI7AFP8ii5mmEV/BuyQngx6x5U
         o9gVI9x77NJfs7qj1k74HtCPoQOQUv3ZbO23RpvndtbHF3jr61YjobHblmoLacE60dgz
         hSGcOn9rH5BZeMT3bNgQwnZtgXQ9iT/J4FvpKCKBPSk/AosiAdY7XG4w0IyPN2Kv4OP+
         FzElOy/ZFytKgMA436K0tEE9sY8KmJgQ82SM6jO0A+7By3F2MmoBnJk7t+ccU6oTrKAN
         9WtJvkBAJOpGy4YsY5XXd0ZtpRo9sToiMTUJ0icLy9/ttzp+IUJP0ZZNwhNmyeye5pU2
         Ie8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793370980; x=1793975780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J4apMJBTp7WdrBg4suFHTn5q3Lrcb7dvdWPvcbdMeiQ=;
        b=Ndvex3BltjFehYl2G/oYONTnTGU07HrztEr9qfUelrnSpHWiZOSm0EfDP5jwqYFkt5
         WzdoGX794XnJj3asgrPtaZeHxeEYaFG7iKK/dQbS9224lVfcGRHhOGY6fgDCZei6XLtW
         GjPUulLx5r07+pyU6XXso4uGPi8GYTy8P+iZm6pwYEFdYBfgTFmqMqwd/y25Ml5dbGUb
         /rkPGKDj0iXaFvS179wVOXovmjIgWMK8sv0lR5cCY3ni1dF5b1q2+drGoFqhLHqt2gle
         Pf/fUBH6Jow5RC5NnGvfDBhk9F0TWkJqdNmGgbSFAOgfB5oJIHvLRgRqY7b9zEHfRkZW
         AYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370980; x=1793975780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4apMJBTp7WdrBg4suFHTn5q3Lrcb7dvdWPvcbdMeiQ=;
        b=LqXwSi9cC+5syJ2xOw023DIIsKHbh3FY4rtisU0PaSkKigfmIrXOnMDaKhE++AsVZI
         69eQI9PvoD2TrWEQfNywAwvbX/5R/ApqXiTKOmonw83WcAxzOG7eylR7NujJG0Xy/n5j
         +S0C2i8eby4O2Opjmf63GsXBCgZZtEirqThKsndoSU93RIN6TBjWH6orGGKTrZy6j4DQ
         Gt+xmBOtjYuCTJYZhV8ciKB81Wbd3FAYvo4zKFE0XarfIdKhFUtPabaK3tg4l5c+zNvX
         EvJGoY700mX/tMu7PXudEIs+leqF5Ebv27HdOHgmBF7VY1x9lZwh+Iymn2xjkT0hWD1M
         DPpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxSyCZO7jJd06RyQMHcycP8pxn7xGhGg+7QIuf4KA/uRB8JyD4H6thyziANqkiM4qhPjTVVf1+oDMqzUI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxY7te2VcUcUdyy698/EC4+qI3oPxrPIKp2belCbaHhiXMe3+R
	p4oQQJQUtVWt3ZLcJeNbXPx3Qw01iV0mwT+yG5uR7+RMoOy+K/h6OZ9g0iaxqm7jVjrHBw9u0II
	UJAwwhbb6IiP3geW/D1GUaol7CnX4U8I93arIfso=
X-Gm-Gg: AYBFou1ulOig6z61OV+nxx9KmcA4xtLDp+sGCt734mHw4fxpeYqS815GnnwnQW9V4U9
	lnFVx/gs9al1cScejiyuuqv8BHcatJvIMxXBFmcVPqkDwDhMgepVvHw25AtkfadlHLTKpOsI4Uo
	rNxrTTU+z42lXjVaBh9erConqhaNoVUocPiUsYxXMkeO2n79RUaM9B5LLQ80C9szirHGGWQ7l9x
	9he5nXcjJYifOzVmkbWomE2lCrGCNKriELQsRB6xHQNbOyO6vV9hpkfxANrIwDHgiUY302ds2sj
	WN+H6EIcwHLJ1ndb7Hu0WSfJEABdcp3riE5eABO83kbO89sG6VHXiLc4Tb0sqpB0topSfuLX6T4
	jHUE7DnGNUsQFVDhxZZZqtCyitYreMNjCkqWqZiSBGMJJ5FgdBhwzd6Lj3fq4RPWegOGgRFc=
X-Received: by 2002:a05:6402:322:b0:6b3:b7bf:ac53 with SMTP id
 4fb4d7f45d1cf-6b4d33c6adamr1283454a12.4.1793370980086; Fri, 30 Oct 2026
 07:36:20 -0700 (PDT)
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
From: Samarth Narang <samarth.colleges@gmail.com>
Date: Fri, 30 Oct 2026 10:36:08 -0400
X-Gm-Features: AclHuK_uFaRH3rHXTBPe7XlybWVryPD5O6NwDMdPcOAxOE20GZyoJyLrqAWMhsc
Message-ID: <CAAbz3fQReXcfPVHnTo6DkjUdMxYcjQVU2iOoZVFYzuv56FoKCQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sh_mmcif: unmap DMA buffers only after the transfer
 has stopped
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, the sender header on this mail came from a misconfigured local
git identity. I can do a patch resend if required.

Best,
Samarth


On Fri, Oct 30, 2026 at 10:31=E2=80=AFAM Codex <samarth.colleges@gmail.com>=
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

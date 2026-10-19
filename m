Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2DE4DCB0C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420191; cv=pass; b=rd3SMLPGP82nbkJtgBmcpkm/tgflwI23aSa294ItvsNYasTQfVprT8pUMfnsK15OTI1i5BPm2XF2RDuJNOSKrKovqJoJmQz585pE3ikgduNXq/ElTLE84Sega86l/kDcGw7K7zfhV+4LoZFXfctJn6PxS6iAjgk8/WBadrC6L2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420191; c=relaxed/simple;
	bh=1815ZKD8D0Cw6LnUL4cFghBinoHsDcTyW6YJxteqQLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWLOxyV7QuZ3ffZjSFGpYXf3APZVXkIzJOht/spXP0Sv6nD4MK6n5vu2uQFJdrK0Hc6UkO34XjKM7DY83ThtQUkByyPajEn9E7KSjlwoLkpfDG3oqIvEMzizfjMFdFDu9NtvlVlNecb/h/UAgkAXJYgiBKySXJ2zvKdOMII+kMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yo5M6yyv; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yo5M6yyv"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f1cf92c9eso228530285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792420189; cv=none;
        d=google.com; s=arc-20260327;
        b=O0cg9wzNN8FzenxyAHs4fpz1DK39ENFj1X5htHyibojLvpW8UN5qtKv8XzEX54gEVc
         /qYgz6rlEMVb/yw8elEBOSPCPMdD7mFWT6MPBlGSgvULQ1AgUkUETomKfWM3cCe6FaFn
         fm8V6oQh+qzNA7dW81gK3G0tMsGhltYEiBpFkBRdEUOS61RAnjryxuCKxSsA7aWfsBZ3
         WfzNHdmFg8Q/CzRjURourgJ1AB8TkFgRx3nktwM65ixXUxIqHAY/KwQg0qXoWXmEqus1
         WuQle85pBHKYW+FYlCWmHaWpxQ+U8SqZjJNYj757gu5yl+5lH/2Xz2+SFvQROvAYDTft
         4S/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G0dMN6vSXcfuXrHsY+C/X/nR9uDe+9XWJ3CV7QZbaZk=;
        fh=f3Xrs01k3PtreWax47djVgJQBtNWrfzqbjKfsYlOQ4A=;
        b=OclClsR3VT708TWtxI2Xi1XHaZGGnI4ZXHpoe1/YyRcJnK2YsU4bhEiBq+honaFNzQ
         7yflIh3L7cHIw5toC+mcjRJ0OjhCOsR07VfsxwyaAdocLCUJ8lZAZS/Qsb0hGcOEiK6u
         y3AIcdQcegqgWw5Qb0POufnWbrXklPgv98VIoAl+YRnQrLQMB9KRM/iv2TweLTC9BE8w
         tK+8Z4KQirqENZVC1AQroWOdQwayug5wgh86ZuOUO222IRdyqWd6hu9hQohV9QR/EO62
         CZPgbLkif3Xi0vdn31evEYw+J52PJ6GKLrBb1UkWARzSw0AUTuBDKZRubg4mf2T0WcWv
         Ljkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792420189; x=1793024989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G0dMN6vSXcfuXrHsY+C/X/nR9uDe+9XWJ3CV7QZbaZk=;
        b=Yo5M6yyvHjhJgBBk9/3+cZeYfCGs9gWgqFXTDtzLSKQ6bJbWDcLAG5cKsnKgEkHCML
         oBPGqsqWTlyC1LRO0kAwI6WSPMiqDpouBk2VysUpqMrN8sxojVjjL44stj0PHvKCQB88
         rwGKiHX+86r/AS8BrUB5JOgL3wVn9JElWr4qVB8KCPJ5puw+IzJpVrKrpkY4bqIe87hb
         eShcKku/GZVA5xWsj4DIvRkbfmEC5SBw70Rz5J9t6cnBn6bE0gW/1jCKSX00/MYDPNbF
         zZhghVWaOtvGrICp1o5Vih5YcRoW+jtd7Ij3FOSLlcgkDLqrIlMtFvC3aRetHT4WUf/M
         5EiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420189; x=1793024989;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0dMN6vSXcfuXrHsY+C/X/nR9uDe+9XWJ3CV7QZbaZk=;
        b=kEWgtiJHg8JwJEGayBGDqUBCZo+Tc09SdcsvJyQ+wEFt3VpJxO7g0SFhIcusZrbYoi
         u2nNnfKp10qb1EpOcgrX//xOiQHDt476GjSxC7fvLMMELa/2Atlceg20TdKHoSkRadIy
         P14omOr8431bBTAqLBmcdkcGz8R77yyvZNK3KY6c0UdKFPqblS9FXd73AJoQGf3IX6AW
         OfD7N6Dy7Mrpa2aD45pWZy+K6V92YV30hDx534dKN/PDA+/83S1bTQKsAyqms7/11UAc
         nXSXNDQjYIDfYcV0i5TzOUl+r0LXkq9YUlS/viBfeJfiUTxPfFXz8JZ+pvmF22NOmPPD
         AomA==
X-Forwarded-Encrypted: i=1; AKwUvBwGbQlkcI3tdf+rfBpUl2eP2Z7pewswLObmcCSao4vvMdq8PyO885moViexqbhZPr7MEVELu0qeUpctHeU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJis0FdVe3SVofwGaTBCqNQdZhWouh3mGnwHb3MxMcyJ0JKUoGb
	Z1kkfGXmaRAyPt/XM6ym7zhGLlRoQfKXANsCCvolRZ6wBBhVSbAfADgYAVbBz7PCpCeVY81tUrG
	xqPvZAK6EhArkO9M68YPFOzicWie5YQI=
X-Gm-Gg: AYBFou0zXqb0rZtvIjEAXUG+NRoXgnqDhBF1DoSX9OztNVuFBY2nLQ+BJocdINysCzY
	N1+y/Iqpk2yYEvy+nl7AB8Z5hM/UDq4IBH3zp01QoQvD/mXv6+kAjE4IdswefkdaJCQ8RqdX7S9
	ajG7rErdtS4A08iKVHlBdcqtVnZqugc5uCytMzL21U9GwzIpfwOARHu/IRNO17iSciZSGvfND9g
	F9pgyQ4j/zzQ4hHejjAd0ayls0b9U6I+S6r34wOl+zie6XzEVZYlPIJ5uztT60R9jgZhlgbuc8p
	gbKgdVy7UltW2cSPjUCHYf2Unfv5x7BRJyftze/Ze9AEVipkVnqB01yJfCWJDFxJGilb7MSrtk6
	x8QV2SNk+dXM8
X-Received: by 2002:a05:620a:8808:b0:93e:c12c:f12e with SMTP id
 af79cd13be357-93f29df8430mr1133759085a.73.1792420188341; Mon, 19 Oct 2026
 07:29:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261019135307.2074577-1-bruceli20040604@gmail.com>
In-Reply-To: <20261019135307.2074577-1-bruceli20040604@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 19 Oct 2026 18:29:37 +0400
X-Gm-Features: AclHuK9cnl2EsfcrhGGH-sXis-mAncR2ezLY-0k25GrZdO9W1GU6GuzZn-sH_E4
Message-ID: <CABjd4YzjRAJ8+U+fmSNjbx7AbD8Caiit5MpE=NEL=SsmSc5SQQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: wmt-sdmmc: release DMA descriptors after stopping
 the host
To: Guanxin Li <bruceli20040604@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:53=E2=80=AFPM Guanxin Li <bruceli20040604@gmail.c=
om> wrote:
>
> wmt_mci_remove() currently frees the DMA descriptor buffer before calling
> mmc_remove_host() and freeing the controller IRQs. The controller may sti=
ll
> be using the descriptors, and an interrupt handler may still access them
> during this window.
>
> Stop the MMC host and free both IRQs before releasing the DMA buffer to
> prevent DMA or interrupt accesses to the freed memory during device remov=
al.
>
> Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>
> ---
>  drivers/mmc/host/wmt-sdmmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/wmt-sdmmc.c b/drivers/mmc/host/wmt-sdmmc.c
> index 489daee4f4fc..c44befabc909 100644
> --- a/drivers/mmc/host/wmt-sdmmc.c
> +++ b/drivers/mmc/host/wmt-sdmmc.c
> @@ -896,14 +896,14 @@ static void wmt_mci_remove(struct platform_device *=
pdev)
>         writeb(0xFF, priv->sdmmc_base + SDMMC_STS1);
>
>         /* release the dma buffers */
> -       dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
> -                         priv->dma_desc_buffer, priv->dma_desc_device_ad=
dr);
> +

If you are moving the function call, please move the comment too (or
better yet delete it altogether, as it doesn't add much information).
And no double blank lines please.

>         mmc_remove_host(mmc);
>
>         free_irq(priv->irq_regular, priv);
>         free_irq(priv->irq_dma, priv);
> -
> +       dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
> +                         priv->dma_desc_buffer, priv->dma_desc_device_ad=
dr);
>         iounmap(priv->sdmmc_base);
>
>         clk_disable_unprepare(priv->clk_sdmmc);

Other than the above,

Reviewed-by: Alexey Charkov <alchark@gmail.com>

Best regards,
Alexey

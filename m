Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DAC2D9ECB
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791761075; cv=pass; b=UXpO7RM6Arzu31xtfOVE9kO8JOMzJGt+UbPaUhu97c06tbJaGw+7w1XHokoZcxTPtMLvtafbnnTh8Lwu00btbV6zifcheansoU1oGMr0jCYv1BdNmmXoETf5i9ppyO3ik46c4d4l6kY435OqqSxricHF+R5MLGvi30pnM9/+7q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791761075; c=relaxed/simple;
	bh=GktAgKUL/yFktjDP9OAV+uRWevoTtopqQ5u7akr+55k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FdwBigJ/guDOupwrq2prJzu1PYR+D2oghejhzh/BlGyxzeNNz+BP1ufZbreXW61wU0Xidwf18ubct04ZW8AzXINaXRbYMSGZ1ncMCUFdnv2zK5E0PiOYbh5a+i3eBYXXw+G5ZHH5ulZTnutJJAawm3Cc8MmpHwOZRpW10ot08Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcotFU3X; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcotFU3X"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a2757826b9so620336fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791761073; cv=none;
        d=google.com; s=arc-20260327;
        b=eqe0mrBSmtmGf8AD7ViYIGnKG1LsvHSJEdhKhu6wOXXLhGSn4Jn16E7NCDKfzHHz4c
         gXHVvFymoqfjpi2gJl3EBYxnoAo5DxlcPt7i0P/qt635OAdt9xswJRjNencBGd7Xy6gS
         su2mDF+CxcMXJl7fg/rX59hjGfxZpvPZedvGA1MjJw1VkY5Il+3fXs5U0HKUtJkaFyww
         1tN6KihzO0E2jU7Z//LcfSCgfBz6Wuj7UFJTP9gQoR9rjyUUS/GGndzL+Aii/ZbSVih8
         SYNch2RlO6ZADXcnI/K+Zt/MyApmhA0kVFONbu9+WT9+AJEKqSd0XN/9AcGOrrgyOelQ
         zzSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Eg47cBecXpRbZQlFdWngr6AF33NBsP1BXGUbvCKwbOE=;
        fh=iR7E80yU6fO96uvywu5OsMig+KpHtLw0KvYRrewzTRQ=;
        b=o+6b9H+YBmBfFzI66VDKa889oGl7INrWkknQN18wvlKgGWvAyvffyCPCvFFr+KORfT
         1PJGgz1tmNtXmKVU8iLLENZyxKs+q5neFfFbhXsp5uylaEpk6+N9q/qCDlH2daipeh/U
         Xti3SVQzoOo/Xq89sfNUk396aW//2MgvyXVVaRBXxtP8A94zl3+iuEEMU8x30rBudZtT
         g44yjNMLTQ7byDo87tFm2eiL3peQPZYk7GPpQwb5u6nKa0XwUVv5jjF8nn154DcDlkqW
         BAW7dXF0iK5GJbf8OvTQswHgamnpD0HJ0STxdh4zj7h3pUHygCsDEw+XRpaYd1DdSnu0
         maQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791761073; x=1792365873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eg47cBecXpRbZQlFdWngr6AF33NBsP1BXGUbvCKwbOE=;
        b=CcotFU3XplIWiMX3MlrB51bPMsLbtPcnGJeEmQbRFFM7quTZLAYUI8ZSCPGgMBYEBC
         tNmoO7xnxxihpljH/pL7bLdMU13rd1J7xNpBfjxICG0y8U+9m2a+642Pp8XAFSjLwJpn
         cfBCv/pR7H3R+3+XrVCWfd7puQdjj0WGIqLvAP0veK4YiWMYyHlX52Ty9FYAULBiACvf
         oBnryPWp9MrjVNiSBh0vUm7wyuhHyTF+Npi7ZwgkWrNxd8yUunQ92zSjlaR21rQ1y48a
         HFz6XIojWmgeVmT5gngBeY+ElA6xXnYRtQVHiAL3mZCAVgzrOP/8yW+L/4HWXCqxOWnQ
         E/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791761073; x=1792365873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eg47cBecXpRbZQlFdWngr6AF33NBsP1BXGUbvCKwbOE=;
        b=RXW/jha249Ol5bx5kdRKSR64BcBs0gVDGvqjMhr53gg+GFfzRkfjf1ew/QJq3UPXxJ
         TGO1IFejKV/8k0n7sz5Z718svNxkZVDF6+TI/QMj5ez9Wog63eJ5AvVZqMbqUmExss/H
         EQR+cQnj++WJ0ypJnbPtO76j6Pjbmhw7fYn4vIF/n6RE7Bl6Du0PMaukomOHb/AqNwXN
         2gQg/yNDnITsbRHnXYRx4cydXISUt87ord/tgJ3Y/wfn9otbh+yNPhq0gasn9RhUkffv
         zaIJ/XoBBJdRPpgJrqghioii+kCfVoJ8YbNb9gHTql8IwKipeuFGOOKBgVXp7bSEvm3b
         ZziQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6lEc8aHhuPa3H3DXtwgirG9rITpLpIK5Ij2d5oBYKmRSAXqPoAzivhVC66uBXKJfdI45yxnjIU2Mz4nY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAz/e+X5ubHpwSICVUoc070G6GyYSPfllPZcdLy0FgzJ3trHyP
	AuEnoC5x5fXAvYYlTNJ1+8/1jEyNkxTXfYDzwWygMW3D7WiLE2rfroP/HcQl6izEL9bS/N9CfbJ
	8HmOKSNNvJOogfjT5CyhOJ76bmI7u1to=
X-Gm-Gg: AYBFou2s9yiMGA8NY13Zubiu4q9kFa56L2B0rgKn86FdeKH3f4nlQN3oVH5mjqdH/bl
	zcY4JKPct2RjUg+15QWKuhIVBqzp29CMrrBGqGhB6Yxlc5qWLGffrBjeE8f0abVXZwZMAtmFEfm
	xyzF1uIyWA9CVMjS1K1eRmTDeYnFEcjle3BBR4PXf5JyFM87zPlp0q72g3R9CWlYNCgAWRpZzkB
	jrTV6DnTJD0stdOOgNYFsvKqbcxermF3U05iQW4mfpggwj0/6XXyI0o9J1cpT+CV53fLZLTxaOS
	wp6LMezxC+/0ZuDvbk95A/465+yGSVg2l3XmGbd+h4qkXYcokTrT0lg=
X-Received: by 2002:a05:6870:1793:b0:494:878a:39b8 with SMTP id
 586e51a60fabf-4a2a8b3708bmr6291393fac.52.1791761073316; Sun, 11 Oct 2026
 16:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915144538.3465774-1-lhfff@tju.edu.cn>
In-Reply-To: <20260915144538.3465774-1-lhfff@tju.edu.cn>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 18:24:22 -0500
X-Gm-Features: AclHuK9DNL57Jsmx5AKGNxO-DRbZ2zgqU32OE2fsplIIq7lTBL6Mg74oNldR52M
Message-ID: <CABb+yY121-o1DaoBG4Vm27zWT0CDUjTaZLBUSPMLAvyQZ+4K3w@mail.gmail.com>
Subject: Re: [PATCH v1] mailbox: bcm-pdc: Free the IRQ before cancelling
 receive work
To: Yibo Tan <lhfff@tju.edu.cn>
Cc: Andy Gospodarek <gospo@broadcom.com>, Rob Rice <rob.rice@broadcom.com>, 
	linux-kernel@vger.kernel.org, u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 9:45=E2=80=AFAM Yibo Tan <lhfff@tju.edu.cn> wrote:
>
> pdc_irq_handler() queues rx_work to process received data.  Because the
> driver requests a managed IRQ, the handler remains registered until
> after probe or remove returns unless the driver frees it explicitly.
>
> The pdc_mb_init() error path and pdc_remove() currently cancel the work
> while the IRQ handler is still registered.  A later interrupt can queue
> the work again.  Cleanup then destroys the DMA pools and frees struct
> pdc_state, so pdc_work_cb() can access freed memory and registers.
>
> KASAN reported an invalid access in pdc_work_cb() when an interrupt
> queued the work during removal.  After this change, removal waited for
> the work to finish and the same test completed without a kernel
> diagnostic.
>
> Add pdc_stop() to disable the hardware, free the managed IRQ and wait for
> rx_work.  Call it in both paths before destroying either DMA pool.
>
> Fixes: 8aef00f090bc ("mailbox: bcm-pdc: Convert from threaded IRQ to task=
let")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
> ---
>  drivers/mailbox/bcm-pdc-mailbox.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mailbox/bcm-pdc-mailbox.c b/drivers/mailbox/bcm-pdc-=
mailbox.c
> index 6fcc4002ad4f..aea2e5273bf0 100644
> --- a/drivers/mailbox/bcm-pdc-mailbox.c
> +++ b/drivers/mailbox/bcm-pdc-mailbox.c
> @@ -1335,6 +1335,15 @@ static void pdc_hw_disable(struct pdc_state *pdcs)
>                   &dma_reg->dmarcv.control);
>  }
>
> +static void pdc_stop(struct pdc_state *pdcs)
> +{
> +       struct device *dev =3D &pdcs->pdev->dev;
> +
> +       pdc_hw_disable(pdcs);
> +       devm_free_irq(dev, pdcs->pdc_irq, dev);
> +       cancel_work_sync(&pdcs->rx_work);
> +}
> +
>  /**
>   * pdc_rx_buf_pool_create() - Pool of receive buffers used to catch the =
metadata
>   * header returned with each response message.
> @@ -1581,15 +1590,16 @@ static int pdc_probe(struct platform_device *pdev=
)
>         /* Initialize mailbox controller */
>         err =3D pdc_mb_init(pdcs);
>         if (err)
> -               goto cleanup_buf_pool;
> +               goto cleanup_irq;
>
>         pdc_setup_debugfs(pdcs);
>
>         dev_dbg(dev, "pdc_probe() successful");
>         return PDC_SUCCESS;
>
> +cleanup_irq:
> +       pdc_stop(pdcs);
>  cleanup_buf_pool:
> -       cancel_work_sync(&pdcs->rx_work);
>         dma_pool_destroy(pdcs->rx_buf_pool);
>
>  cleanup_ring_pool:
> @@ -1605,9 +1615,7 @@ static void pdc_remove(struct platform_device *pdev=
)
>
>         pdc_free_debugfs();
>
> -       cancel_work_sync(&pdcs->rx_work);
> -
> -       pdc_hw_disable(pdcs);
> +       pdc_stop(pdcs);
>
>         dma_pool_destroy(pdcs->rx_buf_pool);
>         dma_pool_destroy(pdcs->ring_pool);
>
I am not comfortable picking this patch without ack from someone from
BCM, especially since it seems found and fixed by AI and it changes
the order of teardown.

Regards,
Jasis

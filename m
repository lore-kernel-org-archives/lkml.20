Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288594052A7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428604; cv=none; b=Hb2svGKCBQ2Y11bMIZMAXNxr4jbFyXIVMNewVtkIwCivhNoH9Xxpfp78FV3MJBK3KMYOi3lUodO29hOVBKdRhQtO0crIqkB3h+l9Pt+RZeXCnXg97RjV7E7n2Aa+/cuOzuvcP1fB3isAge0sKedObeWPmaskXL72Cq6ZAiVyQxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428604; c=relaxed/simple;
	bh=QlpCUlv+E6wRy2NB52jPmYtg/gL7xxiavKZ+fWvKSsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0ZWB8Tx+D0b2yZjsRdJoHHhPBXmjB/yKSdJ0ZrgNwHpQRfVechw1UzfuaWr2IAjtKGBiMjqyy4psG4QdJxH6HaSBnB816YM6iEYXzmDFlyYt5Lp/L+f6zcsBq8GfPmUrDnXRGtn/Uvx6GspsiL615izT0kLzppMnqPoX+Ndp8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso1761994e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428602; x=1789033402;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/8aSggrTq+PN9vIOxwXLgYslllD/sPjeAKVtCCSsPVQ=;
        b=ZcXhRL5x2sIbNiV8/sHbRateaxo3F/iHK/8gIwYuQS/tCmfuP8Q76U3XpS9dyfbrzO
         LFrvC4xXXgfunXX6hBJVxoaUX2Mh2r8LHT/5p5ldzYh/OR3ja3Uwa4AattQGFyict/Nb
         F9htg0p9P4EELA9F392PJmM2xZSYXdvzPXqPDiHwaveHu8BDh8vect9NeeCgz/f9FWo4
         ZVIFR6pbrW6gLXWK36TBolaRshJ/1pWY9Q1w4HAVitTGgFGv0J2qBulI6uNUvvhBUysd
         A9JvWyaKqEHpPfRE0f4PqfaVDmPAOXHB+h+pYsC01EFjV6/2QjO8AA4DM2n0uvluRDUp
         rCYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDwqTLxaGzU0gPS0iYojQRVziAlch9MPa1S3F17y/FLLVU6k9QUEow1ivBpL70juWGb4Y+HBws/ndg0PQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mjsrU5XloyMsrmV9VI6gQrfHcGLltxd/Nj4RadZ6QMCKEuzXEF
	oOzA6/w3KlnUQ035H/ynl63Gg1e2NwpZh+t+Fac7xjbnbvGDRr2h155HD+VKud9Hm6w=
X-Gm-Gg: AYBFou0x0RfADCt6Y/TdjcPX3Eg/Ku+QESCyyjU7C+WpP6dY8x0K1k6semYk3+7vkAA
	y6eOoOd+tz4CNB2DF2lWcs+Ep07LKyOBsHMMVBCbyhS/zBycqw53OdLElIXBj3Z+2kxaXrro+CQ
	uUi9Om5hFtr/0wlFpWupxlwtzxU2eVMZKuQXqd9Vngoykw61Ljs/Dj+0/nTBIFq66liQmgkhvM/
	yig/zlqMtjhrG1cvnQJIIMEf+3ZT+sHdcFm3qXdnV9GkU1k2TqSEMAhaWphA2dualyx9R1bmlG2
	JAhMe3HMdrtMrbO3s/6pJR4+Gwmeprr5EfMBJHBdih/4VfWoMYEb1swSLk3Sfw+KlqLSLOyYHDj
	A0cY0lSEVjkXzL2FC45rzbL6hEcF2gBqQxBQusyBpzdpbpZ755JKgVBvyn2i3j2PKInCPSZ78UG
	6dZkNM0h+OnPf+fmASiA6ikUSHa4Y3S0Uvr2VrUm5aIW0qGaqCr3ll2tn0GLlveBdPSC7wL8TJQ
	/YqDmYOMzUOmoncESYSbPYVuQ==
X-Received: by 2002:a05:6122:551:b0:5c7:d204:db7b with SMTP id 71dfb90a1353d-5c7d27e4191mr4338364e0c.3.1788428597019;
        Thu, 03 Sep 2026 02:43:17 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd5da30asm4071998e0c.0.2026.09.03.02.43.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:43:16 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-97c940ef65cso1124297241.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:43:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhPrIofL3HBaEC8hNi4zpdajb+uLjBqDJNkoi4nhB6HWjZNXEM2SfKC4jFQVFOZ5S1DdIepvsILYV3f0w=@vger.kernel.org
X-Received: by 2002:a05:6102:2997:b0:784:a169:194a with SMTP id
 ada2fe7eead31-78a1f437b62mr4757188137.10.1788428595977; Thu, 03 Sep 2026
 02:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903084339.870562-1-zhouruizhe@resnics.com> <20260903084339.870562-14-zhouruizhe@resnics.com>
In-Reply-To: <20260903084339.870562-14-zhouruizhe@resnics.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 11:43:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV871ZLtrCzXFmhUeThkc8eFAhcFo2=Cos9iJru3bxvqQ@mail.gmail.com>
X-Gm-Features: AcwNN1VNMZwSAyY54Zj_XBQDARj9cOjn3MGAVS5vnzomKXlBjnTLo99feqtQTjY
Message-ID: <CAMuHMdV871ZLtrCzXFmhUeThkc8eFAhcFo2=Cos9iJru3bxvqQ@mail.gmail.com>
Subject: Re: [PATCH net-next 13/14] net: renesas: rswitch: Remove obsolete
 32-bit DMA mask fallback
To: Ruizhe Zhou <zhouruizhe@resnics.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ruizhe,

Thanks for your patch!

On Thu, 3 Sept 2026 at 11:27, Ruizhe Zhou <zhouruizhe@resnics.com> wrote:
> The DMA API guarantees support for masks of 32 bits or wider and

Really?

> explicitly identifies retrying a 32-bit mask after a wider request as
> incorrect:
> https://docs.kernel.org/core-api/dma-api-howto.html#dma-addressing-capabilities

AFAIUI, that is only true iff the wider request is DMA_BIT_MASK(64).

> Remove the obsolete fallback while retaining the error check so that a
> genuine DMA setup failure still aborts initialization.

Have you tested this on actual hardware, with/without IOMMU support?

> Signed-off-by: Ruizhe Zhou <zhouruizhe@resnics.com>
> ---
>  drivers/net/ethernet/renesas/rswitch_main.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
> index 755232994fcc..64b821ca02f8 100644
> --- a/drivers/net/ethernet/renesas/rswitch_main.c
> +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> @@ -2162,11 +2162,8 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
> -       if (ret < 0) {
> -               ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> -               if (ret < 0)
> -                       return ret;
> -       }
> +       if (ret)
> +               return ret;
>
>         priv->gwca.index = AGENT_INDEX_GWCA;
>         priv->gwca.num_queues = min(RSWITCH_NUM_PORTS * NUM_QUEUES_PER_NDEV,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

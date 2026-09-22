Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F753955D6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088425; cv=none; b=eEKbFKdcz8p35RWpscc1wJoRXBE5D8npZssquSbX3kCxHjsqH6Z6n1NUgl9I+AiyvCyGwl5tSEtMFZuOPNmqgXZMR6Lft2uCVjfPO6OcgkIPUHpbnCU9J82/RZbX9rD0XJbLmh/amzH/38RKHuIHk1A9OEJF61N/YrCk7LJWY8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088425; c=relaxed/simple;
	bh=TbMap+l+wNqfvepdi7vbGTkwx8Z99cmqTQcYec/WyyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMKFJn2rCGUPcSZKVKRrOD8rz4DkdkKW2DKfgO+Rld9WoS1LHsVru/OAMtjjiGpQ6OLLErhZ0eudcuap2yamPlnUhgPvEsPvi9UhxYG0yZ+j3UUnfI76ovLo6399wlCWvo/cXEUfatJSGCqWK0cPDQwxLFWot5oAHxmJs4mIqso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e518329so1086568e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790088423; x=1790693223;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ORXCKUXvqBYFLFFEeuhhJimDvmfdPp/J+FHZ+N9LIhQ=;
        b=hcV7ceme9B22j8gvLHLxcXOVoRcJeDTzIKGcZIrMjHCEp+YB4XLmgj4KrGcVym2c/b
         r3VQHBo3OHE/hat9Ut3mMDskAQ7WQ18bSsgQrmtukcCV9YHXYaMg7HYRAKNbBPS1Km6w
         3tJ7dtAFpVqenLghFq2hnKDHnIDneiUgVcqzdGEK3AJxSMJGXmwRVWeRpCe4CDAJxeQw
         IXxe9xpUTkWWtP7velBHYNehrIrwRMaXuOZbjMyNeSGRHcOTUisZ2g8EasDUmpS2HGhN
         JORpHbmeRhfoJL83Fqs1T1ENSbUJSvBMO/naom+THciwEUxf3udl2ROVltjr/DoHM/Xi
         XjPg==
X-Forwarded-Encrypted: i=1; AKwUvBzd32eJ7MJ7Bp8GfbNClj5hs3gVjmGa6h1MNaYXsc8i66MrHVutm7AbsRwAeNkGspa9vCxtZzAQlrcehEU=@vger.kernel.org
X-Gm-Message-State: AFuF++kYZtUUtQ2arAJ8/6u258L8LonKFcGX79y7Qx0NjSkorHqwhy4Y
	0GG0Hb8nHfh7ur+famoXW9tIIQ3ao6fuYJVWfXuOEZZjGmQXSvR7hruu37cOBNQE
X-Gm-Gg: AYBFou2adtjsDn8xFeavqldJXmGGkaAcAocxLwlRrC8QJAr+5l5x2Mvyn+sYTk2Xwrk
	gMqvfCUeK6Sh9oZnm+bewkmpiHDy6d0QJFg7RteRsfsUy4aRnRjXySCxmddwwPn9msbOlUKjw7o
	u3dWWLZI5ZZIz8/lyISiarOvCgo9jf4zRg1aDIEFh0DZpQ6sVEx2vAy3YYz1rXd6nSQvo68GwQD
	D6Z515VBNSyx7aidIWC/U5liuEOWUQKIToxh0HV+11YP+zKFHHqH64mj/fhzmDA2ZwPMFPP7eBC
	s/7wCrL+rU14osti57IdNqLhgrZ85B68Y9EKt6thXwCCM9dWnFx4TxZphuWCnaMGkHbOSvZKnaR
	PoLsehKzLq/peATHV8VWthPg2ga0QhN7F2p+nGQEApLDqhEJakRvrfekTNx9hEVZTH3zzQOdmLJ
	qMNDmTgMJr4JOTUXnHe4pZAs3LJy/12mf8jCHkIUD0vXKZeX2ktF/9dwSSzunz+yyrjuPQgWO4+
	7Fz9Q1sT4Z3wAHtMpyrOlxyalu+qGGkUJFM
X-Received: by 2002:a05:6122:1b10:b0:5c9:a830:44cb with SMTP id 71dfb90a1353d-5c9e35c5dd0mr3072879e0c.8.1790088422806;
        Tue, 22 Sep 2026 07:47:02 -0700 (PDT)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com. [74.125.227.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9850db87356sm1874046241.13.2026.09.22.07.47.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 07:47:02 -0700 (PDT)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e518329so1086555e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:47:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy6gJh2jykW6Bc43ahX7yd4dWsLSnd962/zik61JyVjYEuGj8XN+SKorvSdMMe4i+FkYwME5t9zEUtYyIo=@vger.kernel.org
X-Received: by 2002:a05:6122:401b:b0:5c9:a5be:7b52 with SMTP id
 71dfb90a1353d-5c9e35f60cbmr3362802e0c.9.1790088421919; Tue, 22 Sep 2026
 07:47:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921195943.107247-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260921195943.107247-1-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 16:46:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGwQXvtLeQZ3KfO0giAhyEBgWSLqmxqx=7yqGqMr+hDw@mail.gmail.com>
X-Gm-Features: AclHuK_aPQ1jP2rNsXJ9Dmp5IiCiZiuxKDlIrtLLHY5NeT02sngfHtGGckkuD78
Message-ID: <CAMuHMdUGwQXvtLeQZ3KfO0giAhyEBgWSLqmxqx=7yqGqMr+hDw@mail.gmail.com>
Subject: Re: [PATCH] spi: rspi: Fix DMA mode when the DMA controller is built
 as a module
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: broonie@kernel.org, geert+renesas@glider.be, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

On Mon, 21 Sept 2026 at 22:00, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> On the Renesas RZ/G2L platform, the RSPI driver falls back to PIO mode
> instead of using DMA when the DMA controller driver is built as a module
> (CONFIG_RZ_DMAC=m):
>
>     renesas_spi 1004b000.spi: dma_request_slave_channel_compat failed
>     renesas_spi 1004b000.spi: DMA not available, using PIO
>
> The driver requests DMA channels through dma_request_slave_channel_compat()
> which returns either a valid pointer or NULL and cannot handle
> -EPROBE_DEFER. If the DMA controller has not probed yet, the driver falls
> back to PIO directly.
>
> Fix this by replacing the dma_request_slave_channel_compat() call with a
> regular dma_request_chan() call. dma_request_slave_channel_compat() is
> always passed a NULL fn_param in all code paths, so it actually behaves
> like a plain dma_request_chan() call.
>
> Fixes: e825b8dd2b36 ("spi: rspi: Add DT support to DMA setup")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Thanks for your patch!

> --- a/drivers/spi/spi-rspi.c
> +++ b/drivers/spi/spi-rspi.c
> @@ -1355,6 +1339,11 @@ static int rspi_probe(struct platform_device *pdev)
>         }
>
>         ret = rspi_request_dma(&pdev->dev, ctlr, res);
> +       if (ret == -EPROBE_DEFER) {
> +               dev_err_probe(&pdev->dev, ret,
> +                             "failed to request DMA channels\n");
> +               goto error2;

Doesn't this make the probe fail if the DMA driver is not available
at all?

> +       }
>         if (ret < 0)
>                 dev_warn(&pdev->dev, "DMA not available, using PIO\n");

The driver still falls back to PIO in case of a missing "dmas"
property, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

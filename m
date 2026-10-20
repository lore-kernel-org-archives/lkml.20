Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499167;
	b=1l8OIH0tVvHGQy+O8ln7CXNXmytWER3ayXhZbAUESfpcqCK0W4Tg3anrOprnba5EL2yH
	 D6LzOA5vDoS5wVxFk4HzWPQP1geYqLChqVx0iwzhWSsIyJWftEZDRgFgP1bzd6Bi3+KHY
	 YYOT/FudfB6CnYnaeuBYYEuRYpgf06qUuVXAM5Ke4HJzDVZAmtv3+x1s4MY1egAPeP2AU
	 pdwILnh82o0yJUMULkc8x4fHKygJXnE/I7HG7ILTt7dhrii2GgFjVDdGxlKtXloIiOZvU
	 2SazkSx0VV0yFv66ogehYeCcRNqycUq7G76UdSsjBwWY+XNWzDutV/6x25by1iHQWtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499167;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=w8ekeggAdWyBqH97gBi+p9TPg4z/iYMBplVI65cJ2lQ=;
	b=mC/YIl8pb25+k6/qMsHtJqXOrFi//gzjnKJWn68l4CKmO4wJ/ynaBgXZOCal4Zeybha4
	 xeof4ABbMPi1UQ13hwgSIO0PTWa6wLeiByS3RKcl9VYVnPG7d+bgiSZp6A2/Mrd1ZL8FC
	 7e1yitKROgP0zxZHr/H6+au/X9QaR542cJn2oUtiUKnDBCv2vDxFIJcv8iaQHTF8FjjCf
	 C3yAnKkayfOWqplxuyuGsaOvuZlVzCkJaAMXuilKs1QizHJyUgq6rYC2osxP1wayqgJEq
	 g8LE4Yxk/lGhCRu/+3NBhN6GaDwv16Vs8g+cJ1e23UlC1PRRh8qOSeO5/dGaoF49kwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263A3606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 263A3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so1171603a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499166; x=1793103966;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w8ekeggAdWyBqH97gBi+p9TPg4z/iYMBplVI65cJ2lQ=;
        b=N4RhOOQlsnsVTtQQdmLchw1bvmRmbL1gSgToscwXZHk3esFuEmv5F60AF/Gfz+x+HZ
         meRF6feRuI7vFCPl8OxJNyfdOu4bYahbwZlE3JFO+QciMDMQhxdAVGEwmcqO5lU6U9TW
         FoY1vqQ+cosVDHwoZn8AuEBCTI98oeu2tFO+waFIejSgDK7hbaEmKPxdK5y2jLJIeXkw
         yW+lCzD3hsygYw+mxPlUEFLI+7bFgrUgy2QErawzjCDC7VekUWS+F5RF+zto9lhLqcKq
         kP7/ZTP96ayQFDpWzo6+Iqt0DHD0NhKF467u7TnS1CkeHTy4sVq0WwhloHxwInYZii3Q
         f0qQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwUh5Y7ViGEbPXw+ogD2gZZtMK8sijTBoez5NFVbUmDZb1bENBDzgY8g1z+SGJXpz7e6KcAh4QvT3/25s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxE5Wekogvy5hnqU95S85SdR7tzvfQ70wCdIoTLRFRbQ6CSPRs
	4qoKKJAZbufAEWo8+IojUTggu0l2U0IoFli00VZR3kl8HlRBBnWV4CwARd/37XQHCtg=
X-Gm-Gg: AYBFou2Tv2eBu/kpopquBKjas4iQYgV/e5MKDgpShUrgRYFT9G6hj7Lt4U0bPMzRnF0
	nwah7TLxWjls+8LOXrRGg7fwdriZqn1pV7MVpxOYagfcTfld6OEH3hBkwjVabARQfFrjBf9ErIv
	ktxM21ADWuN2AhxykyvsNv8SXvhrTe+mFioYT3ChyyzFbjXXvqDirG4ZexynEXNebnm26tpOK86
	P2ezoQURlKDkiAxWsumMtt01shFw7nsvtoLS2FnoNFwKwtCGwl4eB84/LNHiYBCziDgc7Yd1opw
	l9TTErG5ofJKzBmWocbtWoPGVpXdmTAWKQBXokJHkiSd54Un2EycWtZQNylHzG6kTk+qkmwuMVP
	jUd8UpZh3fnlxeA1WsHFBzvi8/Rfcv6tf9vDLi8FjIoXB/G6u8plkYNtk6tzv9qMRDt9iaGJ0oE
	mKdO6PLs8tRIG4+JNagybjqNEYw4c2a72Qn5WVd6FV5FPYpQyJo7Ygr/juoPRDFVr4JPt2yFv2g
	dGuLsOdejBB6hrovuyZ9jwpH4nDJKWOyrRMzRA=
X-Received: by 2002:a17:90b:5112:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3acef58e42cmr8990268a91.64.1792499166206;
        Tue, 20 Oct 2026 05:26:06 -0700 (PDT)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com. [74.125.82.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60ec450asm3196470a91.3.2026.10.20.05.26.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:26:05 -0700 (PDT)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso859949eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:26:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAwO8ndFtgrJNAk5nSoVYqjGFmaHut06Seymw5SYlkU7byAtquo37HIwlSZte7eFNf5rYSwh2/2jr42wQ=@vger.kernel.org
X-Received: by 2002:a05:6102:509f:b0:7b8:1a1b:8e79 with SMTP id
 ada2fe7eead31-7cc36495eeamr2517275137.0.1792498854605; Tue, 20 Oct 2026
 05:20:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-0-e052903a3832@ideasonboard.com>
 <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
In-Reply-To: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 14:20:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLC7Zw9x6=iz2WMeuPr=rhqKMVPpRdVqFcHJxmAYC79w@mail.gmail.com>
X-Gm-Features: AclHuK8ponr4NJ0lS94fhAlbo48BEUWSxi4Wc_0ZZ5rhhDlLA3L5w0smnHDD8jQ
Message-ID: <CAMuHMdXLC7Zw9x6=iz2WMeuPr=rhqKMVPpRdVqFcHJxmAYC79w@mail.gmail.com>
Subject: Re: [PATCH DNI v3 15/15] media: rcar-fcp: Check device revision at
 probe time
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Thu, 15 Oct 2026 at 09:53, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Verify that the device revision register reports a valid value,
> otherwise reject the device.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c

> +
> +static const struct of_device_id rcar_fcp_of_match[] = {
> +       { .compatible = "renesas,fcpf", .data = (void *)RCAR_FCPF },
> +       { .compatible = "renesas,fcpv", .data = (void *)RCAR_FCPV },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);

I don't see a good reason for moving this around?

> +
>  static int rcar_fcp_probe(struct platform_device *pdev)
>  {
>         struct rcar_fcp_device *fcp;
> +       int ret;
>
>         fcp = devm_kzalloc(&pdev->dev, sizeof(*fcp), GFP_KERNEL);
>         if (fcp == NULL)
>                 return -ENOMEM;
>
>         fcp->dev = &pdev->dev;
> +       fcp->type = (enum rcar_fcp_type)device_get_match_data(&pdev->dev);

s/rcar_fcp_type/uintptr_t/, although this no longer seems to trigger
a conversion between pointer and integer of different sizes warning?

>
>         platform_set_drvdata(pdev, fcp);
>

> @@ -215,13 +332,6 @@ static const struct dev_pm_ops fcp_pm_ops = {
>         RUNTIME_PM_OPS(fcp_pm_runtime_suspend, fcp_pm_runtime_resume, NULL)
>  };
>
> -static const struct of_device_id rcar_fcp_of_match[] = {
> -       { .compatible = "renesas,fcpf" },
> -       { .compatible = "renesas,fcpv" },
> -       { },
> -};
> -MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);
> -
>  static struct platform_driver rcar_fcp_platform_driver = {
>         .probe          = rcar_fcp_probe,
>         .remove         = rcar_fcp_remove,
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

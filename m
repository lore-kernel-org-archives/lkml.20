Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476021;
	b=M3fbrIHvlqrRk3Hwbn9rB6CWNCeq23FcWJDKCMCDRLzgZfMIUPZIJW1MqK+PJjZsCRNr
	 iIJB1V2qGxbwG8BxGQHR5TZL5W4mqH7ArZG3y0l804lrpaz5VQFbbvUD9La84VAdFHGnp
	 s2f8f3m9wjBlvDtsdkKke2nexVOso9UtMu2cvKFRDo1Ou46ooqp9mu8bJGdnMcCs/M+5q
	 AUJKADbCx5Lkwav5+ywRrD+1Ya+EKyUZUpuz+Njo6wgItyXbhuspS8by07pNPEM2G0pPu
	 10Qng9Ou58n5U6k6GtNxNoFTmtZZGXOWtFgwT4mYjnLh8iEva4v0JraZSDIzpnu0+LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476021;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PvpQNatVTOT2KajcSrAsH8RPa9CV8xCGN1VjSKKPUwY=;
	b=x9F6cmZfQLjdzshIYY2BhxxwoTvl3FItA4Fbm+B24wdCAvQyQsOftIOcHqNlBm1WL5jC
	 b9mYinbcSDGKeCmDVCRsXYnllmFS8YMJTezJqFhh8znmps6/5ieXovSIp+gltCp1+jriH
	 cONmDlpA6eQQnXAATrAA8TLhTWmwFhP0Kyi8LucwnvMRoInq0U5fYyTcJwEvB77iyLFVw
	 IjMygWCRfZLTzWxElM3rurLRF+NGQtLk3mNDlMqDBn7gfbzEK3GejAA1unPe7br7CoHfq
	 2/8Iwn/VldYE97Car8qZtdSPOplsCSGovt4N7QnuL200Y457vacphNVxEuop/ZSbo+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D06606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08D06606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc53938a8fso2673077137.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476020; x=1795080820;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PvpQNatVTOT2KajcSrAsH8RPa9CV8xCGN1VjSKKPUwY=;
        b=2VIA/T0PzJ2T2vP8rACRosPX7g1XYhddcGUFjnqeWzwd5Dvns6m+OzCdySTYhxp91W
         ox4MZ6UJj7VaEJMQO49yQnHQn9Ol/rT4+lb1pKZb1NRuTjwUf+azFdluXEW7lsVDmu9b
         qW88OWNaAquevJfbWVOlVqo7f9eh7MJC7lcfoNUadHbtHZGaIFBLLcc5lW1uihoCiHPA
         bBUTHcPyegHPfL3cE0W/INLS2sQbz1ZjilvxjqAgT5racN6rFp3RiP6H2Pdy2pMtE0Ei
         WXnPRZRxQvjToCINgEKPEHjeGqDRv4/l/fAvfXv2/NMbStSWx2BEm94Aj3ST1wRPlrYs
         H58w==
X-Forwarded-Encrypted: i=1; AL+hErE+nL1TmNy04jGLvCRsUx6wsDFfQj/EuEeZw9sOlfkqTXmGhWrrR5LTUd6mK1gB2YiPMYsGb0nuGNxlLoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TIBwmEfe6EPowSaaAxLIZEZdz2Ul2uet40nEHPWnPPUjY0ct4
	gU3ZE95k1hxP0kXbWJLEYY8jLol5bJNfeAFZUckK/FPk8I5rsmj7qwkSuiA641gG
X-Gm-Gg: AYBFou1jy/K7hsDfUDp2i+YR+skOrGJNLpGpvh4+LCjYiiWhUMF6D2VIWVRwJ+ftSlh
	QchMIOvrc605yGGjbyTKihDpkOD0Wi2PvcAczfZA0QkU1KEJPX5p4Tr70iKBMFZ3BIaynhgTR62
	EWQgcNzxI+vmS9QjHO9p+BErchoXFPRUrOHdWwuE7q0ZCcCbQSgSPX4GIPiCDDC3k+bvuKZk3UH
	2ZTEDsXAtvZofEZQS1aQKgpea7D6msWM1BWp9PO5r7PA4+t1nhlpnABR5DhPVp8CfSEM1zgTw3j
	1nP6QjwfIR+0EaDkPr/8udZP6aWGjIfwnx5ljaI4jd550PAm+GEGorA2hL7jD6tLUmcnzKkA5oL
	mC4UTFvoWjolGoAZVLFS1AzXWfzzn2blhlHGS/LQYoT805Effivh469gZh8fNsTBN4n/rk0GPns
	Bptbz5qZ0ciIA9TTBqsC0TNaOxWqb0AlUVIcGUY9mcdVS/wnSP9NcDUNRZrOCqNdH4+e63pYWoV
	cqL7/gBuduDpwoAPyZ+4PKlOxvAXWN4DZBHHY089KMg1tmOIvEnEIPWV2+YJDa8khtPljDXR1EI
	PAm/gYjx6wq7wgRf86pHhHEq/OG03xzUYl167QLWT84kv4LEbVraxkC75N/5e4+vUao=
X-Received: by 2002:a05:6102:e14:b0:7c3:7286:c291 with SMTP id ada2fe7eead31-7d4fb2b95acmr2044244137.19.1794476019868;
        Thu, 12 Nov 2026 01:33:39 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c58ed55sm5275898e0c.5.2026.11.12.01.33.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:33:39 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc53938a8fso2673066137.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:33:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHdskDd7ReIvEk9LoxDqnHR+2U05gAaV0tboHvRu1Do1ShT0v5hxuoulwxhLaw30PPPrplEQFRARx2ylmc=@vger.kernel.org
X-Received: by 2002:a67:e7c6:0:b0:7b2:f3ff:6b34 with SMTP id
 ada2fe7eead31-7d4eed5b7damr2202052137.1.1794476019144; Thu, 12 Nov 2026
 01:33:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112021818.1819-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261112021818.1819-1-laixiangwu@cmss.chinamobile.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 10:33:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4YdVWBLKozBVKsk-cqnBjHY-4H=2hZP7g1H_3p2O8cA@mail.gmail.com>
X-Gm-Features: AclHuK9HKr87_qOdqG_vlcwyWmSNoZdZ0yGoPTgdymMg3LMPadA1Yy3iSiEgPYs
Message-ID: <CAMuHMdX4YdVWBLKozBVKsk-cqnBjHY-4H=2hZP7g1H_3p2O8cA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rza1: Put fwnode after parsing gpio-ranges
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"

Hi Xiangwu,

Thanks for your patch!

You forgot to Cc Andy (and Jacopo, for the original bug).

On Thu, 12 Nov 2026 at 03:18, Xiangwu Lai
<laixiangwu@cmss.chinamobile.com> wrote:
>
> rza1_parse_gpiochip() parses the "gpio-ranges" property with
> fwnode_property_get_reference_args(), which takes a reference on the
> returned fwnode.  The function only consumes the argument cells and
> never uses the fwnode itself, but neither the function nor its caller
> drops the reference, so one reference is leaked for every GPIO port.
>
> Release the reference right after the property has been parsed.
>
> Fixes: 5e455dd93397 ("pinctrl: renesas: rza1: Switch to use for_each_gpiochip_node() helper")

I will add
Fixes: 5a49b644b3075f88 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
as the of_node_put() call was missing before the conversion to fwnode,
too.

> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.5.

> --- a/drivers/pinctrl/renesas/pinctrl-rza1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
> @@ -1183,6 +1183,7 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
>                         list_name);
>                 return ret;
>         }
> +       fwnode_handle_put(args.fwnode);
>
>         /*
>          * Find out on which port this gpio-chip maps to by inspecting the
> --
> 2.50.1.windows.1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

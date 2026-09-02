Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7470B38E8DC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332738; cv=none; b=t9vHHMywGuDy5IZ6cRixix5B28CwcAUR/L+8AbGkFoSVdtvYvdgH/6+LWk++U9eDO61WnaILS5PgwBm2HpKeXpWT44cTZK6M4rY/bbN7PAW2LxUDQBTyxX84BX4W2cw+x60jentO3rbd1IsxHQSRcG7CRtt84cvUuGEui3akjlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332738; c=relaxed/simple;
	bh=fzDpYNuECOcmrly29xrZFaME995vWnsllDCrIFhx8dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XE8Ye/0zidFPysdOARYSszzQmLw7mQs2pCaKiHa7BYbedXp35JAn5bac96IUkq+nwrPQt3qMnL2sm7kXeLRmeOvC1Bf0ZrXUK9VZHTFdY3YRYDWmF6thZIFN+qhFGFMHJ4dv/JCoZLLeKJSGWSQlu04/dLAZnTQktLhmRQBgIOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97bf91b2e6eso167678241.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332735; x=1788937535;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=34YhfY3hqkRc1EY3EtPWnzhtL96VmHVIc4hAuYVzERo=;
        b=NuVsQc278nZ0GNqcYceRd68PIKtwH/cCCvkVLMUrclgMS0z46nukJHsXhQZrKlrrqY
         +0JDV9i0MJSEzyQWujKt+d3A93tNIQkMykUiY21QYOd8mApJAvqtnEbguoBhiubuirIB
         gkWOehftyri2Rx1nSgZrYKD1dDUJkkupPo/X5hjfTclWevRptqBN/CWUvrL/bC2stdfp
         mWE7b2Bwr2H/eaYewAp6nyva5PiRRWQ1KDQNDNNoiFGupcKYmqO8ny7Sjou41J7ke/QO
         5IvXw8MGioxeVWSWhIwnrvbYWtme0DmRuY42Oqu8a2vZEosQ6ONXe/xhzuvlymGabMTo
         GRAw==
X-Forwarded-Encrypted: i=1; AKwUvBy3Z/s4P006M+Zn3cAxbyjUyD5kNGJ5zPKZBNueryAGlJKrcUAhd3/u/tNRuak6sS3UiZXSeW3zPX3EKhc=@vger.kernel.org
X-Gm-Message-State: AFuF++kRVy1kCZgxvUhv3rS4aXlVm+w7arbAEtBYW6XVCo8QAurqydWK
	QsOY4N1T/GUUtw8DwXdRUhj2TqXzvaYFrpcUII4xuBQPFcyNvD/7E18cXtg8HBmw
X-Gm-Gg: AYBFou3o1zmG/fFCYpVuFWpRJlSoPkzetJzmba5RRGQdjHR+XL9BgEgyzeUFRto/sY0
	Bb9Hd0ePgnblMsJo5izehPTaa2Ny7WN2viGUVumFnY5Bmvy+52b54oZ48Fox1CtK3TUJcGeXVlo
	RANyFDmaaOC5MMamZjq84RVV1a6izoJE4dAlPGf3I19l1rLRBEmR5zze5EAqWA2ROWiwqj5DSOR
	Oa1fqzYZFkcWPeHMM5Rp3a9QpJQWrhb0ObnKKWGn+RhNhmnEMzNiRI3UM2GONixIqB88W63Tn34
	Sl3X1ou1cXET7XLbcIS22DmKmI347CQzkjqAkJARFIZCV3WSlMmj5TZVc9as7ivjAeNEYkVnh6n
	e77Rv0a2oQbrN0K7qegCUPfq6e07dVXbcSgtrMRj2GdyrUzR1ZiEomWNOiBsNm185OD86KVwUVS
	2Bs21IUTElL0RhrJxkbeEctvs4XynSR8rxfkqWq3ZpOa0+bM1wtWS1agjKZG3Q6USpTjLBJ9DU9
	jw4DTCmwnaVVXtrPTbzPlGZBQ==
X-Received: by 2002:a05:6102:3e10:b0:789:1216:bb8d with SMTP id ada2fe7eead31-78a1f24783emr774423137.6.1788332735359;
        Wed, 02 Sep 2026 00:05:35 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a1fea5fsm1489362137.3.2026.09.02.00.05.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 00:05:35 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso281893137.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:05:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwqk2Vw5TeQPe8v5TrlTZ2w2cAABt8cPm22Kv+HFf0UKTudqU/PlidEsPFCSHx3QzU/XfR/moy3M1T7bLk=@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:789:5f54:2367 with SMTP id
 ada2fe7eead31-78a1f1f13e9mr820442137.4.1788332734870; Wed, 02 Sep 2026
 00:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-rzn1-miic-fix-array-v2-0-3e907049e770@reliablecontrols.com>
 <20260901-rzn1-miic-fix-array-v2-1-3e907049e770@reliablecontrols.com>
In-Reply-To: <20260901-rzn1-miic-fix-array-v2-1-3e907049e770@reliablecontrols.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 09:05:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVs4Y+=_Q72QwdHbO=V_Y_-wS2vMzX=Qw5RYoZeXYT94w@mail.gmail.com>
X-Gm-Features: AcwNN1VbxvsNj-N5m50LAojrEK604jhD7foSU4OSV3X2c4XmawrkeMppBtuO5-Q
Message-ID: <CAMuHMdVs4Y+=_Q72QwdHbO=V_Y_-wS2vMzX=Qw5RYoZeXYT94w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net: pcs: rzn1-miic: Fix config array initialization
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Kyle,

CC Prabhakar

On Tue, 1 Sept 2026 at 17:53, Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
>
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> Fix memset parameters to initialize the entire DT value array
>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

Thanks for your patch!

You forgot to add
Fixes: f39e968dc168a7bd ("net: pcs: rzn1-miic: Move configuration data
to SoC-specific struct")
as requested in my review of v1.

> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -683,7 +683,7 @@ static int miic_parse_dt(struct miic *miic, u32 *mode_cfg)
>         if (!dt_val)
>                 return -ENOMEM;
>
> -       memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val));
> +       memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val) * miic->of_data->conf_conv_count);
>
>         if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf) == 0)
>                 dt_val[0] = conf;
>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

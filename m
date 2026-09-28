Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3E14BC00B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601606; cv=none; b=gCHw+319/MgOi7UBeOTKkvVD35TOQz+Whc3UvRb8PdeTc1p2mdaU1pX2/D7tCkefAdy3icl/Mss/au7C5N2jb9u/pa/iou+t2X3gM1wK3xNdWXTaOy8j/vT6UMRLa3i/pdBa2LEdsXjKOckBXqfXUyPxkRejX/JxQl7swTTTQuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601606; c=relaxed/simple;
	bh=hjcSuw2cqnvjI5NI1/o5uMksKX3PcnQ52Y/4elq2HKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+rcY2Q/AuOQ+fS+e36Onc41xW7lnNcWTSWE1NQfvsz1Jpdncr981vBs5wcTQuNBBNYEs9uJ96CwSXVdd4nTMSJiG7hF4cstsdIU2a3dNmXt9KGDf/dVaQfB5jXq+CIPp/9TODF9rfFswdO2fWrsOFYcXS+S894yive1GAERGmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9851d513a70so2343504241.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601604; x=1791206404;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+2hurtBCerXJa7Ue1vT5vjNfpc9Jv9KHDeVjKG0g9dQ=;
        b=UkP+YCwEYQFXDvBg1ZmaputUW9Bam+xkplWwP8dX/qMhe5OHHfhlzCQ6KHa2vLHzfb
         9LQG3sKzdDPRxszXHaYgMVcCZp5sdkRkb1Xn2JEFVWCX8JXASU/C/0HDRCeT9nbqCYLq
         YpC7zHnScuXr0TebWK2WCQaPMvV7btCQAARlGAiwi8/6xOg9qyo9Ul3ghSf91yI+Xk72
         oCicHuBlY15sX2BFRsi8eAZB+ODdLyySlXuU8EtznObYWyx8YhliVvXwqJqp///sUgYI
         eW9N0H1mpzovHSwAXmqnvzvs+hr/vt4xzaES2FuIH7suWjHwaAcMrQvUYmNgzZh/l67c
         1aHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAqk1+wy6BJU3IFbAiaZxsG9SlaGuZmYxiP07v3GbxXWtrPwq92a9FnKDmviIppyVTilC/LSQVMZlXt1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE+fCsFXrGFDdb40BPnGkPaB5Lhd0Qje2faq7Sp7sOEk8LzcOM
	sf4m7B+roJWSfUNcxjTHWrKyYe47dSalC2JN/lPZJ3LU+9UON4UFEbBCAaaZAPc4
X-Gm-Gg: AYBFou0mrbkqDgZaA+o4/NLQGQfCUow2fZY/xEx/U1fbdMVIH6toZSCC3fy7bugaaqj
	EI5PE6XIT1kSpymdBz+cNh5MRAIklWEof5GLEdgzA+hWSP0wUmc8D0uCltBL2xZzEWW9D4ADdJA
	PAmDSPjENEq3+PcSHcG47HbWTguQ9t4LgoBHadzZtwzCBwh8YYUN35xAJWj6Vi89vwpPexsTzA9
	0Hss7XR0iFnY3OWjA2PMfGlIvBE8QRDfFoQkoecWKbNuPc6poM4dkkYQJOkFb9dhZLV9AZqanpk
	vWofKIE48wgeRZe9Dk1tTwiKVKJ9POStDtdD3ODVNjUqEewUq7ShBHkvFRsK4305j/Ib+VVJzZG
	Tgh4JNlwzu2WtdMksxGUSXEp76s6dd9GvBchtreOv3U2JWfgVScqX9XWm4LPpdr8N/VbvqpvLbQ
	IUf4+eo6HkkRH4yQc1ru9nDURbhWAJNrEyT51pbfSziZLL3HKRJ929B9LujA64kjRpi45gDEmyz
	23ukmtHp9K2C3x/ixUmRKz/ISp5zOvi+F5RJA==
X-Received: by 2002:a05:6102:5346:b0:7a8:46fb:eb3e with SMTP id ada2fe7eead31-7af1f40b55cmr4222104137.36.1790601603751;
        Mon, 28 Sep 2026 06:20:03 -0700 (PDT)
Received: from mail-ua2-f30.google.com (mail-ua2-f30.google.com. [74.125.226.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde02784b7sm8781997e0c.0.2026.09.28.06.20.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:20:00 -0700 (PDT)
Received: by mail-ua2-f30.google.com with SMTP id a1e0cc1a2514c-97e7c7b4ed1so1801726241.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:20:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFFPieFI4yfk7E3hUT0P5eCpMesLwwS4u6Q8of2MtFVPcuubAic+ckJuZ2YYPSP6h3hU9bR+LtJXa5c1w=@vger.kernel.org
X-Received: by 2002:a05:6102:32c3:b0:7b5:b51:63ae with SMTP id
 ada2fe7eead31-7b50b51701fmr1113412137.26.1790601600212; Mon, 28 Sep 2026
 06:20:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924111856.622898-1-yaojiale02@163.com> <20260924111856.622898-3-yaojiale02@163.com>
In-Reply-To: <20260924111856.622898-3-yaojiale02@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 15:19:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUaPuhy==YAKxUsBTCddCu9pEixPckkYYgoy=LXprnYog@mail.gmail.com>
X-Gm-Features: AclHuK8pd1CvWEg6B7NRMA57BAKjQ57ly0DPVmCMPxitEFLoUXEoVyNz-CP3Fng
Message-ID: <CAMuHMdUaPuhy==YAKxUsBTCddCu9pEixPckkYYgoy=LXprnYog@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: renesas: rzn1: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Linus Walleij <linusw@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jiale,

On Thu, 24 Sept 2026 at 13:19, Jiale Yao <yaojiale02@163.com> wrote:
> rzn1_dt_node_to_map_one() appends mappings for each DT node.  If a
> node fails after map storage has been reserved, the top-level callback
> returns without releasing mappings built for the current and previous
> nodes.
>
> Free the accumulated map and clear the output parameters on every error
> path.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
> @@ -411,15 +411,21 @@ static int rzn1_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>         ret = rzn1_dt_node_to_map_one(pctldev, np, map, num_maps);
>         if (ret < 0)
> -               return ret;
> +               goto err_free_map;
>
>         for_each_child_of_node_scoped(np, child) {
>                 ret = rzn1_dt_node_to_map_one(pctldev, child, map, num_maps);
>                 if (ret < 0)
> -                       return ret;
> +                       goto err_free_map;
>         }
>
>         return 0;
> +
> +err_free_map:
> +       pinctrl_utils_free_map(pctldev, *map, *num_maps);

Nice catch!

> +       *map = NULL;
> +       *num_maps = 0;

Is the resetting actually needed?
Only pinctrl-generic.c, pinctrl-sprd.c, and pinctrl-tegra-xusb.c seem
to do that.

> +       return ret;
>  }
>
>  static const struct pinctrl_ops rzn1_pctrl_ops = {

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC2C2D6E72
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527050; cv=none; b=QPxOq+iD9fjTLjOJosumXbRbPpnlGvCg6BwDeXGsJe15fDbm9DVuXyBzLrlX43YxilatCKgHn4EQCF66E4WjtsgopKdjuY8V0TwrspVPvUBecY6kcpEQcCCwX/ZZC6LdBl65FtbuulnYTOeVwJb08Iy0GHgeyWyjt5mgx6te1DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527050; c=relaxed/simple;
	bh=vJr1h7hsBUyy3vHTeoyngtmQwphQ3WIBheDjPnoTJn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOfEPWyrRo3uM1lVJ0Odw4xtneLx5pNlEAVIa03xqwN+/gZ0LJvJyL8SY7lR4sP7fQPqaDVm7t4CjbAwnSEksy3qjCd8WWmjBO1I9bjP1sAGa35YScCw2eQIA9fc0gNJcRmcncHjcPUMx701U99N6DHRfkt2Hp3TbwHmvOEI9M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-74ab99038afso677483137.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527048; x=1789131848;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n1FFew0xvwxDBPdHzvarflCtGZCHXcWoG7HxiLXHltg=;
        b=dSZh3BiHJx2VwtWsKsvaSruHI/nYPI9UDIPLINOQvTBl15Mzmti3ZNpL7pq4AsSV1x
         ra9FJm1MgOV/lWyOcuvTr+AcXIzUxVOJv6M5tO1Rz7XQ5qjW8TcxWoE+SU5ls8Oyp6lY
         Fwagp8GZCm3rbHu7owzyY5NJW8Fv4m+v6LVb4UXrpCNYLlvSp/75o5u49fFirAPhyomD
         C3dZAIfmeFfQ6MwqsX+ScOWELAaYDbozNI0w2HKu69zUJ3JyeQ+FV/oM6kD3P/eO3aFZ
         gZUcEWwsiAPlwEtrHvH9gSgk88hg6JZVqAgpVCXdJWHPrKCEZqBvCX3PjPZwgrakGWfE
         9Fjw==
X-Forwarded-Encrypted: i=1; AKwUvBzzbKllzQNHfHtu8uWjFyllpBYeR6NwhoufTHSoSO5VcFisHOas0IwMy+yLNbL0ua41XSXle/i8wLm6oNU=@vger.kernel.org
X-Gm-Message-State: AFuF++k7M+G4EKtze9pxH10mQqA1txqoSHM+lMLWlaxTrKVCZAYv+1Zk
	ira8wabTXWO52MoSbreXIUxjRPEArcCLZsPxR0wpIH+PmSXgdWTGiYGhuJuCHu/fIzE=
X-Gm-Gg: AYBFou1nDriOgKM1PCDslvktcaLggu/KRhbk3v0bA/gr+WFvUYDOtfmpoaNgLu7fLlx
	PZjBhUB5V0vO+JcP9BTpqoDyMqA+BSZLP12dL6zgGBiMHVzfDwxDrBxm2LuBlE45EUioIzYoZp/
	mXlHn4H2DaZEFW9A3wnf5KpntON2XP8s4DCObxvsgmmDNRAOTIaI5K+zMEBa39yd8ewdpsJqK2d
	lU/gGnS1Qz43Z0snuVIS/CNVRpPXOFnIKl1Eb/whQP6vBUTzoywa4dLomw83gAd/1Gobmto2cKJ
	otZaMumXqxl7uAIqW+BKK5l6Qu5WuRij8HYJtOlyjeZI1WZ6KmgZoasF8ogI2eIWLmUn35Jth+C
	GiKrTqkO4POX0Z4c+QUvWs7FqH2456gjHgGodtdv7BbO8ZQT9FoAWc3HCDrFJtT8pqpoP6Kup5R
	NVR+TiCm7OhwyQQoYyOfdMc1oYM4hykcXPVBI5l7U07+XPBjT2173THNvk9z4K+qZ3854rMaqDx
	nXEyfjAk+5sdVGGCxLh22YiBan33w==
X-Received: by 2002:a05:6102:1484:b0:785:1d9c:633c with SMTP id ada2fe7eead31-78a4a8436b7mr2132863137.7.1788527047549;
        Fri, 04 Sep 2026 06:04:07 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ae8dd2sm1735854137.8.2026.09.04.06.04.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:04:06 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c652293bcdso1193156e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:04:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxHiF23eQKFIilKmoPpyJNzsy0d1FdHXYs/0Laex+4EJJyMschNCafrfOTBQojdJyUTxrOEtN1WCQ0ubFo=@vger.kernel.org
X-Received: by 2002:a05:6102:644a:b0:785:d308:cc2e with SMTP id
 ada2fe7eead31-78a4a91b269mr2076023137.9.1788527046144; Fri, 04 Sep 2026
 06:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:03:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX83jRBFjArNajU6Mq8NhUV4e0gN3Bn1K7WxHoRQUVb5g@mail.gmail.com>
X-Gm-Features: AcwNN1WMbKpO1qteekuyL9lk6vgBhGsq_Kk0QAeK938uUXzN8wBaXb1U6d7AMAM
Message-ID: <CAMuHMdX83jRBFjArNajU6Mq8NhUV4e0gN3Bn1K7WxHoRQUVb5g@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] pinctrl: renesas: rzg2l: Generalize the power
 source code
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The current functions used to get/set the pin power source check the
> OTHER_POC register, which is specific to the RZ/G3L SoC only. To allow the
> code to be extended for other power source functionalities (e.g. I3C on
> RZ/G3S), generalize the functions used to get/set the pin power source.
>
> For this, introduce the struct rzg2l_register_masks data structure whose
> purpose is to store SoC specific register bit masks. The members of this
> structure are then used in rzg2l_caps_to_pwr_reg() to retrieve the bitmask
> corresponding to a SoC specific power source capability.
>
> The conversion between HW specific power source values and SW specific
> power source values is now handled through rzg2l_pwr_reg_val_to_ps() and
> rzg2l_ps_to_pwr_reg_val().
>
> Finally, to keep the code generic, the register update in
> rzg2l_set_power_source() was changed to a read-modify-write approach to
> cover all cases.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

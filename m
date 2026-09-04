Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55051632DD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527156; cv=none; b=SzbtREGwK9H6xXDQshL9+/oSsiRXJj2aEJqVZ4/Rqcf3vikkKmJPotZMHpBv7EwnvZZo8qSECslsFUktOJXKl+LydFoqf8eH/Ge9XadbfkUe823LUPUNWGVtHNzdDewrfEBNGqXTfPvE/D8on3QExixvZ7n+GrfqQu+J66vUUjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527156; c=relaxed/simple;
	bh=/ypz6zJjPNKfNpTn4drsgfOEfmGR4cl9pbI1Kxi8oLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9JQKAWQ0zzht2CIlnUyS/qXFVaztYb/vVGEfh1gqbhg+Duck/3/+lobIyQxcjscBZ5+9lpVrA8Kd1gja6HRNAYU9QQzJplKUIaWDuaCmj8NhqYFWVPmpRrBC1g3p0F4KF7Gd6FDs3N31XBXTU9PA/CKYdNWTvWfCAnJIYTVqaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-777c2d69446so693778137.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527154; x=1789131954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8NOF30mvWowB029u1n+aELPP6OhCTftCoi3R2I9gbMk=;
        b=XzVRwM/v1+1lgQo7lmKUjOcF4u87sySgtB+XS2ZxZQmnmCnEyw3BMY5T6rr/P2ExOo
         Rh3nXDNgBpvsk/tc31C7luy4BGRjuqvZ+gPdc3+Jc5MggPtGLYqwgAoPYAkGM4QC9m7x
         MLMydFU0yHfWqR/BWG+BvJVC7EDlmHdtDqRZ2bRlpL3kBbfR+4SeptX7Zys2ji1RGvLt
         btJfYwIrniGhZpHyw9Jn9gSBYPcrO1aWwpq+Ch4Xp6Svr8xmhSLTAa6w2WQY1LAkfvnz
         oXsL5NbeSJ0uffK+z034B0gBRf44lnMs1rrLrUmADQdev7IVbN3iVnrxN3ORUYpwWX/K
         3QXA==
X-Forwarded-Encrypted: i=1; AKwUvBzBVxX8yrDTBsvphke4htVe728oKx2Vw5AAHI7uUKVqZWkYciXk/YlYGZScr4Ic/eAUv1WBDhLNaRh0eyo=@vger.kernel.org
X-Gm-Message-State: AFuF++k4wMbKzocb1OoEls9f1+gT5uEMUI+tIAwv4ZscnfM1Ct7rc4m1
	PIklZ8ypls5Aknvx/3p9N1QLvLeuSPKwUSfOTwyXwgbt1KA2maYdCd7v1W0Xd4Zgc0Y=
X-Gm-Gg: AYBFou2Ex3rrtc5Bhg7ejWTnXF2JePhv7/rARZ1YKikec1svSn1HWOVwrMzRVEGNkx9
	MLlOiPwgIagnTJBisN5EvHcFNa6UueiAu/lE8xaQPi0Wgp05YyscfjQ21fgF35Ez9MhG68NHZas
	mrN1B2t4B2tPhvOIr/hql4N8LSQWdo0dje/kc/lYtXqJVBx4sU2tWmbavsvQkoHtN8tBd4nmjYS
	sDgLZmyCv8Dn8ASpJ6ATgM4ZqY7DOUwc71/OLZgWTExt7yg1XHNH5oExcG5Hq/JoOyLbuKTIJvT
	uXWTcfgIqREh6sH3vPLfB1qP6bC88Ol9EnUINOE/bqljOxCwuj0q7HbFq0tk+uZec3LgWjp3KTr
	Wpx9YNdvE24bm6+q3K70ViC7CYxbVxvLjJN81c3tmkHqX4fSta5SRoFgxBUbyD7IFA+Vfhmp6sW
	bTXAvKnK3ljrEtmjCxbpwpr/EkTN3uLUP6QugrZ2SfWP9V4llgmBPfP8XAaWQVU2EONTGYUQ/rC
	KXdeP9lyhZpNQBJrXh8oS+V7g==
X-Received: by 2002:a05:6102:50aa:b0:77f:9278:af6e with SMTP id ada2fe7eead31-78a4aabb472mr1823654137.9.1788527153566;
        Fri, 04 Sep 2026 06:05:53 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808e98a9b3sm1540545241.0.2026.09.04.06.05.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:05:52 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-783047c8464so728091137.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:05:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlNcEZCccKH/AKKG5sI3PQLn6jvBug9zfqwRn94EL1S5f7+qNjJDM5vkAogYHNOo4+9kwEAsPieroH7uE=@vger.kernel.org
X-Received: by 2002:a05:6102:290a:b0:785:f288:c23 with SMTP id
 ada2fe7eead31-78a4a918bdfmr1975845137.3.1788527151892; Fri, 04 Sep 2026
 06:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:05:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2NavSY5K3Em4jTKuiWCZCc+XOWW4nH4HHh76aoiuWEA@mail.gmail.com>
X-Gm-Features: AcwNN1VET22qEnErTI_Nd7aROS6yUTveXM7jVaLpauOVguTdNaHuyqM0FX-8ExU
Message-ID: <CAMuHMdV2NavSY5K3Em4jTKuiWCZCc+XOWW4nH4HHh76aoiuWEA@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
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
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

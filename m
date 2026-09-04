Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AEF2DB795
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527130; cv=none; b=faOumLdfqtWX/aPzrH5ubsVHCwr7IkN2TsC09nSnMK+1AM8gJET0bVuG4ND9dTCriixBRFNsbObka1maFpebNbN/8vMKsKb/dU2OvweZ9MgHJgwN1QabmydgzO1879pg5BNaPSSAtupPcFnUvXviOVH5URBl6UmoRcuFQoJ9dCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527130; c=relaxed/simple;
	bh=2pDxHO8wpZZL1aVsWi+EAA7ecsGJLacrfFeBli+WCFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZkVagUSUXNt2jPG68OLj0Dzilsf2FqhlEI4R8VBzG89E1Yo1UoDpzdQxhGKL7h+weUsfzKbFxbz9qtVh/CrdM6Nq9+MB26qjn7eDJ/SGO35Uz+uayN83Yuej6pDYZ3ovL7+wRnWEOBR65ZXvQ4UBbq/EG/GbThoS2mlkCK/bPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso429948e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527128; x=1789131928;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CgqnNAj6IteboRwdvP7GVLALXi8ReI521PLZ9Y7Kkfw=;
        b=R6qIQCdbDi6EHKv7xWiuExbeLP/y0JJnEynXNbaiwpJemGNinA9f/Voxxrj8H4+whm
         cdPJscKCajtBZIdM47+7963GqyVXO1kJ2AM5tX2fSlcwMuPOasjUyxaMyBMZTejVktN3
         BtsQW4n0rTjfo/kwWSBFCf40dyiFggqiP2leGMYaKoxunPIoCOj8JncXOUgL65p0LrSj
         1m44O195dFFk1Ygfh/jN24glGCdcEcFGPcKcqXubFtoepGjVxulZeCKXB+zj2PlkkecW
         KoLuVRs5IuXWj+xun1ttaketJNIVyYTNlc83Htlo4EmnPfyE8jioMOSJolIqiPPZcbeM
         UINQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWpkAnR0Kpa9IaAlfFfea+pXSIUl1uvb0G/LoyxUkl/BAs+TVH/vyFBKlv2AiojcZFiZVa+sQYaTxC1wI=@vger.kernel.org
X-Gm-Message-State: AFuF++nUzT0A52ufNTzCjINxwJFlE0raLwUT79wuhCaOWBz6txCtv24E
	eg1Sf1Qy0zZ4XH1zCJAOYW094kqPiT6iEd5577HDTxr3N+arPO6z5XL1LmNctD/JZaY=
X-Gm-Gg: AYBFou3fGSO8+XsvJwFwCV0M172NRzy7aHet4sOx47rGLBCT8MLm4bM9yBLE5Mlg7/c
	fYfWE6C7xwLfzLdPcB2QckVco1yZt2NBhkE9mnlrYP5oqTnBLtHpmW/G9MmiHW96D1VnvED3scD
	078kgEo8MnSF0SOLdUZk+TRLP22Uji/X4jlc3ErOG2PLTIsDpuLNAu9vMn8vkrZG0kIBJnaOdoV
	6xbjsVXWBfhNiQbwuO1qFLrN3aq+69X7xQMQzEkC92SeFOF3DXVfDNj6oD7b9iqKOstUjW73Y+3
	hMIXUVjG9SjWaGQgKpu+C5VQqQ3/AgQSHQ9xzZKU3fNiqosJe8f5zptevtBnspyptRWdG7HAxN0
	LOowt2wb8a2BmIWJD9lqozI9Pv4gu0hDJMeQgIA7JOKACaiWbXgW890f6oORIUlJJXOUdmjHVIl
	lBLiKWPAOtYn68LMufhJfT8cRl4F4YbMRdJAZE17FMHROdELbpdiQ2oxcspJ6z8vcM1jH8RHg8w
	tbf0a3Zl9DVezMaymFlxHMpR6l2zw==
X-Received: by 2002:a05:6122:179b:b0:5c7:b165:7057 with SMTP id 71dfb90a1353d-5c7ed3cf5eamr2394418e0c.5.1788527128092;
        Fri, 04 Sep 2026 06:05:28 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee8039csm1492809241.11.2026.09.04.06.05.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:05:27 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso429924e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:05:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzDHXsmuXpncHDMkCrc5+kwQmCFNsEe2SakpY6L4s8onCqwM91oGD6xmLFnIO/0ZpfL4yR/upUDZqyOzx0=@vger.kernel.org
X-Received: by 2002:a05:6123:67:b0:5bf:b500:c4f4 with SMTP id
 71dfb90a1353d-5c7ed285aefmr2496181e0c.2.1788527126515; Fri, 04 Sep 2026
 06:05:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-5-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-5-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:05:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWPd16C-AazzCHJ+Rz2_qMrTwOp1e=u793LimvW99b8Mw@mail.gmail.com>
X-Gm-Features: AcwNN1WKYIgtG8pquOg-3QDCj5oIF82tVACq3CFfADEbuvkkdmux6vPLdOD-FKA
Message-ID: <CAMuHMdWPd16C-AazzCHJ+Rz2_qMrTwOp1e=u793LimvW99b8Mw@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Document the missing I3C power source option
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The I3C pins on the Renesas RZ/G3S SoC can be powered at either 1.2V or
> 1.8V. Document the missing 1.2V power source option.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
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

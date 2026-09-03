Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC8B4A49B9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440859; cv=none; b=W1/w4FZzSA5O/ZyBWWGDtzH1x1+xiEQzyPwgNsMbBkZA0qeoks6RPHbRVSyz7qyfjv1247df574OSQ+U/OoeJc7JVg/Gnvv196Y+XnLQ5+/ibISv4IgywGW+HvGipNQysuL/6cwfrbWteTbdzXjLLhMHGNyiYj30C758ufDcA4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440859; c=relaxed/simple;
	bh=/hmoURmIl/bUQbh8UOa2R0+uRCpVJKU0vq8AlikjsbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uuq8n5My/kEgSEVf/VaAK8Xc9eHbal/PdJVNvvu4D1tFfu8PSVMJYwkc17MGJl0cQ+AfHj8LsOXb6MQV9pXPkFuWw1rdv32DSw8pKnkPi8co7sgk57mpY8CyZ4VxwiZx6gl2VULi6RjwiHP+5xEhAGCz5XKo2kpVoQJryRSRQLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c7bf03c4d0so1903361e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440850; x=1789045650;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=neL+IFdaoh4oslsqt6WgBGKpzShvTB78/gz0eSfjqO0=;
        b=CeINlsKb5g9tRR/SqXxuKdx59HAYQ8TtVBFvsbjvM3b9shI3ZVbhuvby8hWV3fn3Ti
         6125qTUP0z/Uu5Bya3Jk97R0K4f7p0xiMMUSyE0ANoT41UdXrn7d2T+V6uHd/mwAa3M2
         zVeZRyRwePn/StswBaisvxBMgLG9OfvDq6VuIhRAqXwrVar2um5N7AigKCVUmzUNx/A8
         Nh23BPCsuWMlLECplP1k6UXZdGBYjaAHTiNAYp16VMbh0SsYeb29mihtYYlhNlX8Qy1m
         Gw19Ow9l4/zSdMFh1K9R7Fo4YwV+QeJ0dNeDR8Ku5SGFJhqH0VyvEmGkJ0gwGJAu640/
         KI9g==
X-Forwarded-Encrypted: i=1; AKwUvBwm1sgt5V1UdWx7UpCfJC/RRJv/p64uR2xRQaUMx/BFO+QTSyBKSgG/+rOjf+A6qQHg4CZMLsq57cbr5P4=@vger.kernel.org
X-Gm-Message-State: AFuF++mFpLe/w5g8ABZOy1MwuYW3f9OH0jNBCINZeGMxF6Rli+i9k4Qa
	t6VOCEuJ/rmCq3spkmryt6dC7PJHgB2i0OHWCWJ5lEWdCcT2ZA3W3o2b65bT8SYo4Dc=
X-Gm-Gg: AYBFou1qoxSuHJjGteV1j8kGnL3y4WkRT/hpfEg3MTH++UHzxF7Y+aGn+1WwoKlEaGQ
	Tx373vxq/RqC5PYksmqaqqwKG8qHnFB6eRM9tpXrld+UqG21BWuhTTD8pOj8y4HsysRLs1VBKxk
	HZbe0rNKvTjPDJ9vkTU53V+AKExIu5cw+JONO75K5YVX8Zw7EgFoWqeds4eCYp4Qk0irJS5W78k
	zsj6Cz1BiW+iKieduSfl9FRjDT2/1+TNtJkP+cZga9trr39XXiADdE22lTDGgJkQWPWMITFS5fp
	Vy0Xh8STBrLDJwAg39zIQoOQ8x5VUDpGh1fNmtcM/8vYvSxiTzQJr7rH0SQ1BvyvYtXV9prLUbS
	esz3Y0pVEZy9IkvrILES0wzCRvn3IJ7uueeSoxoNjdieNR8w6PMa/MOig/qLD/f090jFIx8rq0v
	ZFZFk7+KxUqDIl5/scESsgtE7zsXLLXLe0xtbJodFaqtcD/bHaDwt+qFSD+PUZEobMsLC/NuFje
	k7hNEg7prQ06TKCOS2cegByYg==
X-Received: by 2002:a05:6122:e44a:b0:5c6:6189:c756 with SMTP id 71dfb90a1353d-5c7d2489826mr5581145e0c.2.1788440850177;
        Thu, 03 Sep 2026 06:07:30 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd8ce9c1sm4199423e0c.10.2026.09.03.06.07.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:07:29 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so1437771241.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:07:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6k++DrwnfhEf+/ZfQFqGHTTDFpx9IdXh9XpjVVTTwRWzgG4a2ihDRIED0cpyPoulL/VQIv/HPVF0BJkc=@vger.kernel.org
X-Received: by 2002:a05:6102:3fa8:b0:785:d308:cc2e with SMTP id
 ada2fe7eead31-78a1f363e2cmr4316460137.9.1788440848450; Thu, 03 Sep 2026
 06:07:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902104939.25522-1-ovidiu.panait.rb@renesas.com> <20260902104939.25522-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260902104939.25522-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 15:07:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUR59_-_HB8JcVi77B-Pa4UxPf64QO-cDn1ogQ8shFR7Q@mail.gmail.com>
X-Gm-Features: AcwNN1U_nOCF9hyFbscO2alVpr_m0LN2_JeCdjkgGXp8PKg9yAEFa13OLTkKydA
Message-ID: <CAMuHMdUR59_-_HB8JcVi77B-Pa4UxPf64QO-cDn1ogQ8shFR7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: rzv2h: Drop duplicated parent lookup in fixed_mod_status_clk_register()
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, John Madieu <john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 12:50, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> From: John Madieu <john.madieu.xa@bp.renesas.com>
>
> rzv2h_cpg_fixed_mod_status_clk_register() looks up priv->clks[core->parent]
> twice, with an IS_ERR() check after each lookup. The second lookup is a
> leftover from an earlier refactor: the value cannot have changed between
> the two reads, so the second IS_ERR() check is dead code.
>
> Drop the duplicated lookup and check.
>
> No functional change intended.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

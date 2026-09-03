Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D96D4DF4D5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449641; cv=none; b=lkEnFjrN4se65g8iBL72TyHMutCFTXdTnNNJaeRFbbAJlXPDxIaaD7FcsX/ynU2pBR1YtTG0R9rGFY7OOCwUcjEx9Nsk8JqfWLW7OyYMbyT1CO+H7K8aZCbbDtRdmtTOrfr38BW/VlQBIOwP0j/+VpMuRejR66UFCHRZhhGlH2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449641; c=relaxed/simple;
	bh=4ISs0p4OZ8p6JtAb2NqQCn3Ms3bwI1uZBinFoY6Hif8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9ZgV0o4Hy5QCv/DKmDTHi+Mmo/eUgCNxeXK0ooydXO+JjwzjnhehKpb3p0Kr5Dpeobgppe0lHrWne7obpw8lvfV6Y58Vukd3+Q/pBui5/ZTW25Zl0MtA1npq2ZuViXGaRb2fp+Ir82iyadMjlrLfdP1Y1iPcOmxKw7oxZ/Dv/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-78a338fe106so738778137.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449638; x=1789054438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q4co215V8cCcryKl+ePptL3AZAP9ssa33MB98SUpHXE=;
        b=tT4KlhH7CpOA4rIpjy9PTVj7u+vXK0a883m4H27s9vUaxYiYlO8J1e/1Mbvcyujc7B
         BcVdjRTCWKoAQ3hm8DnvHE7gjnASArRd7V6y3U5YnzBRNtNndPbB+NrkdHJ3DVvCjsDR
         NYcwOTilDc4gkMZrls/cu8GuTdgsW4VRvA1RMcYuv3vD8rIYdPb50YYUMgCi5WDm94sp
         82GEwho8qxm+UKj/MyRIk3oxGTdnT1wH+BggerAdzpR5K9pfS0R9RXs01oCBYAAz5DG/
         sYtEP6vZzhvCLIh44OUC3PYUlAasE5mT8LFW+EH9IQnZQq24iWPQs9dIEQH3HCsx+ra6
         h/mw==
X-Forwarded-Encrypted: i=1; AKwUvBzjXYCcGeUm/9DcON4hA9Gq/KHn8HeKmJLOhUnt7e0RbWO9dDlug6mKfrcM0USh41HbCyPellhUPD43uiM=@vger.kernel.org
X-Gm-Message-State: AFuF++nm+5oMZpwequhzFxETtCKGuDPa7w3TmO8ECX0l5VyBbEBYTx3i
	Qa33OMUbaLaIfLta2koMQeR8y7e2ELZBM2+mKSLJ3ABmOIL825AXWIWVxYPdHa8wrGI=
X-Gm-Gg: AYBFou2V7mdTHw5iewTyZkyeU5o0SbPRPZ5OZR2FzaivGKCYFHgHRHAlOrWRBXmwynt
	c8evznfikiLNPGd276pYRpJbR56AwThasfspZYcWVUklUC0NsvPQFGlw/ffxTY1igZQBimS/Hua
	dilyuRv9hQtRy256ZiWwBV4okCPS1J3wjscFn+sLcGNFE6tbrZfJwr7sRssPZN0lmawKZvxf6IH
	h1EW88c49Y81TB68e4keotQn6FwLFVGY00m4AoOtNtLixVWlkDkcHYgWqoSnyjs4NXnF2cKfiYc
	3Mz5+50oWB/ZQ0e4GiojFUANaZ0X4afvsS94jlHitjORS7Or2817aEpADo9b/3oOG/FM1M3SReM
	t60FFw1vAyy6qCRYknJ5heclffpYJ9WUuPAmWsoQ7ksNQsyWQyoJZ1oEp/P03jub14kLpt6EZEf
	sXHHZdOCkJanUp65u0fiB3tzTZmJb2KGyH6aKHVWrojDQEAuKCO3Ytg0w5qJchQU/mAqL2PGPHA
	EhQdjT5/RnA3h4YMo7kOO46jGG5p9IrWbJzRQ==
X-Received: by 2002:a05:6102:2388:b0:784:ffbe:64bd with SMTP id ada2fe7eead31-78a2ed7c976mr1389100137.5.1788449637653;
        Thu, 03 Sep 2026 08:33:57 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ac0326dsm411763241.4.2026.09.03.08.33.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:33:56 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-78a220b5778so1099174137.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:33:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx33ys7+8852ueawYhn2bJzbyCmmpqq7Ap1CmN2hu8EyaIcEKX3gEfNsat9VPKk7HFaGqGPR6WnHQ88JjY=@vger.kernel.org
X-Received: by 2002:a05:6102:8345:20b0:777:2e1b:1e2e with SMTP id
 ada2fe7eead31-78a2ed7ca4fmr1596359137.3.1788449635039; Thu, 03 Sep 2026
 08:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903113327.1217457-1-claudiu.beznea+renesas@tuxon.dev> <20260903113327.1217457-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260903113327.1217457-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 17:33:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGCdFH4-+-0Cws402jvHO7YBAELUeobp1BbDpeAZguZw@mail.gmail.com>
X-Gm-Features: AcwNN1VsYZsO5o2pygHZnaCq-bQizs6Zsc1Hfv4_iBmyRo69jsaq1nCLJ4t6av0
Message-ID: <CAMuHMdWGCdFH4-+-0Cws402jvHO7YBAELUeobp1BbDpeAZguZw@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 13:41, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v6:
> - used bit 23 to define PIN_CFG_IO_VMC_I3C
> - described the I3C power sources according to the new method; due
>   to this didn't collect the Wolfram's Tb tag.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

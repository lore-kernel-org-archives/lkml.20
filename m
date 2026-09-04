Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17FB2F7F1C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527074; cv=none; b=DmB6a2NmakMvZLF9TmOWL8OzMifmZDqQ+CXOW5Fu+NZCtB1sHCGcHv4Hahk82efFJRVIjr91cc/sa2IHspGcqi5P/UHqUqUAsDk9KeXbnfvvJC4EM87b8tnZ4z3CCxW0iQgVVIpAO1t4C5dF48Q89O5fbZl+9u2g+kAtP86y5zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527074; c=relaxed/simple;
	bh=9mJVt4xvBv9yC09DSm77QIgsToCU4Uam8KTiXBNT49E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KODIhNxfs7rORk7gzQlrXdI30NZPstSRao92tAtnL0NLzBlkY6fTPaBWaMQW2c8B4QneSanINySa51fB7NrIRXJQd/T1Y+sAjM+YRdtXdbxGSygm/UldbVpZ6AKPL8yz9H8Sy/Y6a0MOB9OlqP7uBIEpM4Hyj+KZTQC/IzpfDKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-777c2d69446so692460137.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527071; x=1789131871;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xbgZlApvTu/xPQjUHtGMt43abYTF4MBtnYGRCX+MfE0=;
        b=SZ6eRWvU2/RLPFwov9t2cXWYmel9AjOabnhtb5fuKvb7N0tYTGKEwAV9/NPaS9ZkCJ
         8zcDbkH37hhKKCqQiO7TwWnGcLQG6eUxveiB5Rj60GS9dCm0k616CrGEHM90F/67XUtV
         GEP67oKqUhEDSdrri33Td49NToPPQ6qI9TEK44N/vxxbb0mlWDTWqK0cpYiUskdKbdjT
         /QUGYtv5zBN87WePhLh3/g4UgvFwb73n7T1DVHolCZ0ouUaNW59BKEGmiYJckioCCqas
         4jc8zmdtH0QKLNBiOBTXp+Fo3TcR0/DPksQyDiD9GqHIh49PDoLLABuAE0kd1qfC2EXg
         8jyw==
X-Forwarded-Encrypted: i=1; AKwUvBy/iGPQAjAbNkGqsT6nIs/I1ExDFiQpav9SNTlGuwQLdffrtR698LPE2GnXj5B58aD88k2Agm2ADegXD3M=@vger.kernel.org
X-Gm-Message-State: AFuF++lsrJnjtff68GNssxDlEWO5Z8WzIhxVQ9X3p84ij5BCHEIBMBAk
	+Vl68Fzaf+wnveKXFyYco1J9v6wt3vk9MnsvJrExGz6uKWcu5myRet5Y8Wpg7cw9QW4=
X-Gm-Gg: AYBFou14Jx5nRSsfb749trxuSunX9Q+QrnbW8EpWijp0lwu93nhqJz7XcT9hKdpAGE2
	Tx9PTo7Zi4QaXNjX4JKDfM8PYcqlLfLhN4QRSiZO/Pfr33/6qMXV5ZkScW5+mlG4ZNGeSly/ATv
	VZOJRQEZSU+L4yO4Cfg9u2PSU9XUazLAnmuNqcTfPscTUiV5mjUSyDeTG6gkLThpEwHLWTW1d7y
	hSDiH1gr1zPA0Gl2wvBgvRspp5HOznzzWxHoI5fBHgLfxlZwkEIWYRdjHdTmufIR3Bzo2jxXsbf
	l3R50NcZYgGJfUfRvg7KZiwc26OSSvZTnMiut6oFI7kXQoj3PWhbN7D/h34bZI/g5yMffm5+j2u
	AFI4HkWzTOlvNG83QQeIvcAGMob1DzeUwHHiuuop8tI7kPy0e1Mrp8/Gw8KaIcCKuhesYsukSPU
	7cL5UqcLU5+5qgEHH4XQ/7FwUuh+2ybAkQXUfPTcHYb1nRCXoSHvQDgWTaBIn4R6pukFUa8Mhbn
	+dGtwheXNU7Slt1foQtx5fTV4VaaQ==
X-Received: by 2002:a05:6102:290a:b0:785:f288:c23 with SMTP id ada2fe7eead31-78a4a918bdfmr1971025137.3.1788527070290;
        Fri, 04 Sep 2026 06:04:30 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ae8dd2sm1736790137.8.2026.09.04.06.04.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:04:29 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so993819e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:04:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9/jtFeuU9qyDjlDs6LiB8RL+YxyNZlNfcb+jB4tMTVqyNEs8s6NiZoj2x9XNdw5hFm9VsvHWkWgugalA=@vger.kernel.org
X-Received: by 2002:a05:6122:c8f:b0:5c6:4bab:4cb2 with SMTP id
 71dfb90a1353d-5c7ed80403dmr2539951e0c.6.1788527068555; Fri, 04 Sep 2026
 06:04:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-3-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-3-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:04:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtXaOxC2Ttw4EBtTY9JqUxjL9X6M4WhCOc8C69qw21aA@mail.gmail.com>
X-Gm-Features: AcwNN1UNaplc4sWg2bdo_z4KydBn92WTMZ--tFNfKKtuA-7QPoR1X6zMCgLV3PY
Message-ID: <CAMuHMdUtXaOxC2Ttw4EBtTY9JqUxjL9X6M4WhCOc8C69qw21aA@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
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
> Drop the QSPI and OTHER_POC register defines, which are SoC specific and
> accessible through struct rzg2l_hwcfg::{qspi, other_poc}. While at it
> move the assignement of rzg2l_hwcfg->regs->qspi upper to have the
> initializations as sorted (by offsets) as possible.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
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

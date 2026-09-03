Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1097D48D899
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439361; cv=none; b=JABl3DmR4gpVeiyg52SOip5LPiH9BvYGF9T0rhJQlyJrrB/2MY9J3qMmCfhiqf7fUN6AfBcQPz8/gZVo7dDSkAY937H0ehbxp3eQDR4LEu9g7suVYn+Ba6gF54ElBVgvQkl7koIsaLq7gslLPdn3XrF0Usohl0FTKiFV/cmmzL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439361; c=relaxed/simple;
	bh=qBY/ZVj6ldHQ7SGOT/ev/wk35ZQLrgQzNtpOY5WeOOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcmFnp1Ezj+QQhA2BUPe0YCfGM5o4+aZOhVSsPMSRlOxOya0Zzt5KyNnIuz5Bv0qa0Qxvd5IhVdn6DQF6NEubXttWyE9Itv5UoAKa4MH/zX9sGv/mU9x2Roc6si7at5I2IXC8K8Dq41OPMzoTLwzwuIgv6svNSll2uCIGEZYKDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c7d65c83feso1669395e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439359; x=1789044159;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EaPjeR7aztkudYOj6lZEtq7c15pwwZNcBINmpVVqLi4=;
        b=VizJra8JMXPoNNvCYUWGwuxphI4lI+VDvEDLtR6KB5twxokQRvfL4Lxt+XyGqoEZOa
         t5GwJMVCxjJ3oagJBR7ZbSTTQP4LC0ROaja/dhY2WaXX1L5yLs23TFOlF3IwHXvbusJI
         94NyIgSpAA6NL1VIBO3LkG1ZgTFUupdDnftKWkGXEwcFOxky/TpJACgOLg51TwHYqKP4
         UxlBD+c5Snr/+/e3biMjThuJz+RwUH272xsVzfva064gzM86pxyP4KN56Ua+Z81A2c78
         1XuAaDDzlqYD0toSf79DiD4/w5L/ny4sfNMsMEMPXleZ+A3KL2SyL9dXlcdCRFYTJWAl
         nGXg==
X-Forwarded-Encrypted: i=1; AKwUvBzZxDW/y14znamOO5fgtwjntHX3RNr57khBiHH6gt+zbI0G0HtXO0u24VgulNrZYJSU4Oo9ZuItLTmdfyA=@vger.kernel.org
X-Gm-Message-State: AFuF++nwoVcCygC9tik9U+JBFHNRd2i1xf0aa5qB7jf06VeDrFHoFjJ+
	M1KjAkr8zTKBovkKJE5mSMQAZHAaGHJIbEKsjnMw39cHZ/DfD6JjaCrnjNcWr9f0MiA=
X-Gm-Gg: AYBFou00hmtHkunz239jt4i98lI/K1q+MshudxXABz35ylsfs12a0pXvNwzg8yQpQ3T
	xZ7ZDzAzRzY0ydRyWpnLGYPPEtARoM/bL5lARDhaF7+dX5abuRdBUDtscYlBjSo4CdVJ4ExTGMl
	Voa+vOTxgMAsA5XMVgNXRSF3dAgU06XcNkJ08luGkfD7DeRvrFzQBFX65Q3gk1Tz81vduQJQv2q
	Tudga5ljWZMIkJ2vunIGlrxjrNdXG64l+jno/9qYD1u7IanVRPD2gFUwUV/shlqgev9CZRqBSru
	xdeTDeuwAng0OHl6JqB4UAQOU7t5fvVjww8QhvKL432nCXIAVkqi4fkeu2Hj6FltuKNca0ghByg
	o2MfvGdENe3cLpKh/wEda5FZNrDGlA1D3pJShfGaBdhLlEK/G1ZS43GhKC3jwFNvY4yoNHltdsS
	WoJeql8+4rwoEx917BhTL086qsZiWSB5gROmsdJ7Ff6I/+p5hZmIV+f5RszGPcM0+aj96rx4VCf
	4ttsi/SQ75oKU5iPBI2A/3tLQ==
X-Received: by 2002:a05:6122:1da9:b0:5bb:d233:70bd with SMTP id 71dfb90a1353d-5c7d2463112mr4897336e0c.2.1788439358781;
        Thu, 03 Sep 2026 05:42:38 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7d4c89f6esm3188998e0c.7.2026.09.03.05.42.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:42:38 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-783d429d0cfso1733457137.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:42:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz9ycDXzmEKF0VEL8Usm49rPGOMmeBv2/ec3evlookS7O8atjeOcdrURUcG9wdzvucqPUq1eRLcRnPs/zA=@vger.kernel.org
X-Received: by 2002:a05:6102:f86:b0:786:dfc0:2ece with SMTP id
 ada2fe7eead31-78a1f3b9b05mr5106487137.11.1788439357897; Thu, 03 Sep 2026
 05:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com> <20260825095047.9971-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260825095047.9971-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 14:42:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXH8ouMnu6Ey=GfMKFwbU2N_nWFSNM-AcYv2ngAcJK_pg@mail.gmail.com>
X-Gm-Features: AcwNN1UULql7__dDtfLgJSgkoosulVVoZxCW8pWB1eO0ZbqrsKHQCSZJ81CuyNM
Message-ID: <CAMuHMdXH8ouMnu6Ey=GfMKFwbU2N_nWFSNM-AcYv2ngAcJK_pg@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r9a08g046: Add PCIe clocks and reset
To: Biju <biju.das.au@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 11:50, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the PCIe module clocks (ACLK, CLKL1PM, CLK_PMU) and the PCIe
> reset signal for the RZ/G3L (R9A08G046) SoC, along with the P8
> fixed clock required as the parent for CLKL1PM.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

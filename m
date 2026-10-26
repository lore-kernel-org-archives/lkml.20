Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003827;
	b=QzvdRjUDyNb/vwP3HUxI7QkaeKR+1dfn0TbayAk+j4qYts3xZ9WADP9ie6vrvKWctbPP
	 UXNaO4b+vUhykH8RgY+q//HLlgsYgafaGsV74wQLW4LFiAzl4ts28DxmqvVYnhXQM7TJd
	 R/Hzs/Jq2D8/Eoepy1m94cjoKGrlmr941cf2abUCofOschTNxOdwPIqaUXRSqGchV1IqC
	 8q5m9rvj9fsjkArnhRIWgCG2sxhXjh2WdA253h0vo0zUniXezlHBSTYzRbxcDqCFibhcA
	 uMUDmPsmcBIp/U+R/2a4xU02ck+nzqR70FzK0a2FoIIjFArOFWVB2rYwsTWy6JKHZ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003827;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=RUA86guEgQwbbO7ByDKrdW1/1LPSMKM8UU2NIH1n7P8=;
	b=b5CiuSxQSVb7hN9WO0MmIQ47JU0vnOjxXWdOCR3BkrZATmOXuw5ET+F0RrMel26yCnGT
	 Ae3f88VXHFvNbWWbKTM6w1zaOGLPX/dv7CDbVzek5Z8nhPwWnbHcdOiqj/s4ceiHsLPsz
	 erCsf84AAOr8S8ajBdxtEqHh9YwEEKhLra4+XexmiysevWvsg5ofORhDAeevUCSe9DIDp
	 sDpDzIVCJVHAUWI90pp+iXRGq2ierwp5+SWqNRwmzDkCO6oC6u1HRWH06MTkmY1w3nx46
	 YrAnBpjob/jKrIhn06KbXaUK9yQbRdqz4Wc/mrNp+cHRMIy+fKMbz3K+2V47csrNocA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F62F606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F62F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so2358925241.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003825; x=1793608625;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RUA86guEgQwbbO7ByDKrdW1/1LPSMKM8UU2NIH1n7P8=;
        b=mZSQt8qbRxTS+Z1E0fRnlg4I7XAnFNnInu6Bj3Dz6MF4E3oD4XQ8yzkT5HlJycu6rP
         RWvwlk9pDRKtwSnkKcJHbeVBdsWkICPSOutu2d7CdeN/b73eOQ9YPyoMrsHER8zMXilf
         4KG5BqtzCVUgP6Pb6So2h0GWRZro+mj5sYjCiNDv5pjJbQ95UyH1G/8LuE7JPeKjZlWm
         vpM9Yj/5fRuRIX+ExSPzD4V5L4ymHpRqzAHW2EhrPKQ0Cz48edyoQxlw7QSB4DqprTat
         Or9TQHQMoAWl3BBa8U6l9WaGcXzS6EeRLukIuJqIIzJ6BG2jtXmRQu7irOsiDaLEhYPm
         7IFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAKiKJd2I94dGgB9hLC/zTy1HDnp38JXW3C6TxRTnmnx1xrkTOLkTEm/sQiy//XtQSs2Ib2OQxR/4h3dU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrsfAHlA8oGElhWP5j7ki1ceV+QfcKDvoPGXOhCcjS2dgmGhoM
	3HWpBUCmSE/YE36orQwFFbovdF/K+vtz4sQ/H3X4YNpPxnJ5SmcS7IA2UaVhllFU
X-Gm-Gg: AYBFou2u/nTyJRIYr3VBm9YmIsVWqUQzYnKuPHDIcHM5g2xzM5mEhYDS1OaJOKtwCd8
	yMc3aqZjEWxCjNKM5PsGAlDxxjNmyXEKeWgZzQjEdZhRlRUUtMSYSNG7IGlpG12mJswoMzlO0Py
	QVCu13z/flFLXpwQg507zDamglF0W0W29j72j70fk/FCIDRP1ZneuuoQCoCAGFlFRfGok61v/4I
	MMnltmBAWV/AC0UKlfjloKvyyA0BxEEKdQB+oLgN1406yv5aJI5Xl529lgyIqhL/hg+5aUEEh24
	zOwck/G2dp7aJGAq7nicPUhHFR0+ZDVKfCZpl/mXXAm7YCvfi8z5zkswy/0lZ91cBkspqauZI9T
	Whu+8Im2qzY7htGNqb6oJUVvWKCpFUKpqm6M3B1QKXbjlexDl98h0goZcnHStTYseb/NcIzR/NM
	a+DbelY9TO+YdEFs60WaDodtr1nIP5qnIcxV/RL3Oqs0WrMdGZ4/f0kR3dGOTZDybW3VApB0rfs
	CrGni5dyYhzON4rNjdR/nPsUltvbv2hoWpn8jyeV4objM6xO0YRXi7jMxBQENjwpK434cfUUG4X
	edHX3+d9TQ6XWnwI5UuKC8SdU0tZEXh8C+YeTzMJTh8=
X-Received: by 2002:a05:6102:955:b0:7a4:e550:eeb9 with SMTP id ada2fe7eead31-7ce5cd3fae3mr1708220137.22.1793003825459;
        Mon, 26 Oct 2026 01:37:05 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e80701bsm7545234241.11.2026.10.26.01.37.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 01:37:04 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so2520014e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:37:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy4WCv/HqQHCbbAUvTguYrvmD98YualkIaHl+i2hpFAIuXHomIgthc4peNBVohIxOGInFS6IIbcawIIEHA=@vger.kernel.org
X-Received: by 2002:a05:6102:3308:b0:7c3:2168:d603 with SMTP id
 ada2fe7eead31-7ce5c6ba6ffmr2185044137.0.1793003823918; Mon, 26 Oct 2026
 01:37:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-dev-mctp-static-assert-fix-v1-1-ceef9913e891@codeconstruct.com.au>
In-Reply-To: <20261026-dev-mctp-static-assert-fix-v1-1-ceef9913e891@codeconstruct.com.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Oct 2026 09:36:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU0-3iyRFCvau7OmjZDmxqbLhTr3Bv8OmymS5yb2p2nMQ@mail.gmail.com>
X-Gm-Features: AclHuK_Mqm-AEJnYW3-6a7k7aCpVsfjR36Ni_iSj735r1ypyEyzR93mPV5Px40A
Message-ID: <CAMuHMdU0-3iyRFCvau7OmjZDmxqbLhTr3Bv8OmymS5yb2p2nMQ@mail.gmail.com>
Subject: Re: [PATCH net] net: mctp: usblib: Fix broken assertion
To: James Lee <james@codeconstruct.com.au>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 04:33, James Lee <james@codeconstruct.com.au> wrote:
> The expression in a static assertion in the kunit tests was not
> considered constant by gcc, causing an error. Replace the static assert
> with a runtime kunit equivalent.
>
> Fixes: 1e12f734afc1 ("net: mctp: usblib: Add initial kunit tx tests")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/netdev/CAMuHMdXTGGdGWZ9sKz5_sQF1237gV844cEhkXr6v_TUHPOb78Q@mail.gmail.com/
> Signed-off-by: James Lee <james@codeconstruct.com.au>

Thanks, this fixes the build for me.
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

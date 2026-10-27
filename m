Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090688;
	b=JlsN9SEAjcPgJO5OfOdHgOMfckxdahf95Z4tPg6c8pw/yxd2xeATr963vxvidvRn6mZH
	 M3RfHxrhyIAN5s0FUtHkD/R11vQAmtMuCFxjBzQABVhWCuF+05U+k6OPkFUarZ0g/LEHv
	 KMCXx8rdxokL9oO4iTcVmPIaIW/yVyQHd2PRrSarVFGth5Vutg7iy3RK43e8E/fv7k9KG
	 Hdkw/oqA1TdMitcaJ3GLTaLOvYwfEizCzFmbsUB4+DVe/eY9epwu+U+WWhJBE8q65BzTg
	 Knx0pADtm+vO+vCrA3pXLxKO+aybRPDrto+NggI1ikc4aczGl6p/vSEJjvkj8W0zSAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090688;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=uinof9MHd9+NHXHAsUKAXp0227Bki2gAq3CWgiYMyVk=;
	b=ZY2ArX7GVBfVn6b0dCLR8yDpAv3tqh9qBvs9N7Cdb8ZsBJdCuvRmvWxiPUHjgnQtTNL4
	 Ncbj0FenwxtzeiQfjIrp6xZZqtC8l6QpD5ekRrX47SCGIyNag2Gz8zwPLASsWtnVr2WXS
	 dZYvmBhP5Tan34323U47KjDR7xDFUKwCvWa87CUvOvvwlpOCFLJKcA+Lhrf16cAK72onk
	 kEK36/pj8b2F2Pef2ERwN6QCTx1uLSFMFO/h3yffn29n/wX6ijq/cVxCA2Oe49RvG2wtQ
	 b2XD8gPhaQwrzbrOS0r+sBpELTpGjbHnf8tC3Uyu1AHrZRMaCAXZbxImNzZja7/wE6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E95606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E95606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so3251721241.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090687; x=1793695487;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uinof9MHd9+NHXHAsUKAXp0227Bki2gAq3CWgiYMyVk=;
        b=bzHjPmSUwkQUvNqO5SdtyqSsNIz4rhAUS5FICZ3fecFTvveAID5vk/pD3cJMls6Jz+
         Z34ux0elcLbyWoLiGvJZFR9XUSuMsPjhZEq6RmEQe0c/OITQp5iHj6Tj+oZNeWAdgRYK
         1lh+FJ/lA6fI58b2WUB1It/XwDq1UvnC7viEjpX2vMkF+79NqqSlHDi0jSM1iMi5czhJ
         Ac6uKvmONCc2ZJNJ+V1Gn90lSmoYj4IF3vqXV69JlhV0gAW0q8qJtLqw82FIS70cNpMy
         9N0Pvc9WMfklE571EGpHfyPt8ejCyLZeqHWMDp2d5KEcOTbw+e75edw8P28VtjCiD0c6
         7kGg==
X-Forwarded-Encrypted: i=1; AKwUvBx2Fjp28hX6wB0/AOjFi+n9rjD6Dh+i4Xe/lxn06oQfUghCqkRdS037ZwTAp+ZEFr33eThPfUGdCcReFik=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmEmfp7T+JMoAKWBq2pmLE0PYQ4/Muqy80tiE5CKC5aYaKYpXp
	pn/Oh1ZcSmbK6+Wq+UONQYyN+9LYgkv/jVhPhzk4RAGV6DjUeZl8vWY6omUfZBZw4i0=
X-Gm-Gg: AYBFou2WUkYJJfklLJ71uuTgL80emjqoxgllBmsSRyN/UDNTduOGeYchReknS+wbE8X
	3C+cFHOYENfgPHMailgFP2lbU4ABvYzFahBre/iDQngdmUFBL/U2lidMPonKGXacwyx5D9zJm26
	gOHhwCB3uOKQEqQcgJsnbEbmI7ViYhn8xUjAxk6VekFczz6V9sugswq3OSuntgj69/STC7mEyjU
	uwJfgKHAtKqMddwGq4nVtstm7D+ngmpD7/Y0YMdsDXbLB76jg6AiiSac1Kg4eBTWmJogL8rCx6+
	4tUQ4Hh7CboTS6uKKuUEY7Y0ZC6FhRScbkaU0NKrY5AH7SsH9Ja6GxNVEr4+a/QZYftQoVFJmgP
	FZ5sXZoPjXe5WhE9k6m4fsUM1VMt4fRwBnerDeAD6rhNbp9V8KQmp7GVcQtDltXmynhF9rm/pd7
	+JX01hJ+vzRBWElyLsqZYy3HhWZO+Xg+/EbZ9xrtdKAj69iqY1IP266eHJbKKvS856QAdn4Hoke
	2drXP4r/ZXPtJC1+b9oz43w9szPqUmEMACQ8Javmf7ZLZKy9yXQZzgK9yzdEvivk5gxDaOJGhgK
	FpIW1+K6HIpIUBKEow==
X-Received: by 2002:a05:6102:4423:b0:7c3:f07c:f49c with SMTP id ada2fe7eead31-7ce5cc795admr3463373137.11.1793090687061;
        Tue, 27 Oct 2026 01:44:47 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991259fbcbfsm1841825241.10.2026.10.27.01.44.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:44:46 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so2781765241.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:44:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzKCHocGdy3ydi22BFwo5cBknXjHElfj5X0i6zrasoTNacqexCLwkjS4yRxjt/HZ7nweUVUngMs2Lzkx10=@vger.kernel.org
X-Received: by 2002:a67:e710:0:b0:7ce:6289:314 with SMTP id
 ada2fe7eead31-7ce7361b5afmr2707979137.14.1793090685340; Tue, 27 Oct 2026
 01:44:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-b4-8139cp-napi-v1-1-c9b683d9564b@gmail.com>
In-Reply-To: <20261021-b4-8139cp-napi-v1-1-c9b683d9564b@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Oct 2026 09:44:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU=oPJtRtY0M1h0dZCSn08wy-fRScPTqBsD_v6_9nGRdQ@mail.gmail.com>
X-Gm-Features: AclHuK-k9wF0--ZIaZw3cFzqUuCfXGPGVeH6MyiasstbSlNgodm_f_jKHqi0gMY
Message-ID: <CAMuHMdU=oPJtRtY0M1h0dZCSn08wy-fRScPTqBsD_v6_9nGRdQ@mail.gmail.com>
Subject: Re: [PATCH net] net: 8139cp: close race between NAPI completion and
 Rx unmask
To: colton.pawielski@gmail.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Palmer <daniel@0x0f.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 01:12, Colton Pawielski via B4 Relay
<devnull+colton.pawielski.gmail.com@kernel.org> wrote:
> From: Colton Pawielski <colton.pawielski@gmail.com>
>
> cp_rx_poll() calls napi_complete_done() and only then takes cp->lock
> with interrupts disabled to unmask the Rx interrupts.  An interrupt
> that is not masked while polling (TxOK, TxErr, ...) can arrive in
> between.  cp_interrupt() then sees the Rx status bits, which are still
> set, finds NAPI no longer scheduled, masks Rx and schedules NAPI again.
> cp_rx_poll() then carries on and unmasks Rx anyway.
>
> From that point Rx interrupts are enabled while NAPI is scheduled:
> cp_interrupt() leaves the Rx bits for the poll routine, does not mask
> them because napi_schedule_prep() fails, and the level-triggered
> interrupt fires again as soon as it returns.  On an SH7751 LANDISK
> under combined Tx/Rx load this interrupt storm was captured with a RAM
> trace right before the board locked up hard.
>
> Do the completion and the unmask under the lock, as 8139too does.
>
> Fixes: ab1e7e1d2666 ("8139cp: use napi_complete_done()")
> Signed-off-by: Colton Pawielski <colton.pawielski@gmail.com>

Seems to improve nfsroot on Landisk/USL-5P: no lock-ups seen anymore.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

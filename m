Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792820198;
	b=efJJ6J5qQ22T1KWy2fKjc7aH+D3O3TwrP793tbMDFF463aTVYzKAqcU0zafMUxFicvQJ
	 DGMI26dZc1kFxzxV7GKmEF9EjsAoVz4H0snfTS6Fziw8ubmzzJWfWaQrEbZ3PCRvYTs/s
	 066o0kTcRBu9MmEgG5myN0K6fCmLr1qd4cLEpewlQaYmLsNhGEt5gD+HBNfaU5qo/RAMM
	 16GXoLPcSsu9BIIQyDVVwpwTGdUIqZWcJ97y66PQjX+/Yy+K9oLktuw0WRYMmuDeiBYVq
	 oxTAbbllUVam1qr7jTq9CMh/2yJgPW9RgfJfym1dtgU8Wz4l5fwyZY8EPksdANl7nWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792820198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uOhtVlIsXaCqD9aysCR6LbQn+NNrDAK283YUAw1IIn4=;
	b=aSqZZM8qzrU0MgcHS0n9niNoxIpeyRp3D14eb3DS0v3HD6EUte2oq5yC5g/ao0s8+joo
	 opDmzn05/2Tn71vWbPYMlElqlfU2Ykw1SI2zpYL+bKyB1iqYGoTeDUMRUknYrfiWk+oYU
	 JouGhqphPGXArKpFOl2N2SY/Dk2GtsjB76U/HnRLGkXdCNUlgwZQSOPEqfvf6MKWKU7VW
	 3T++weFQvKlwM6tq/GlXKKomDZJrctsWToaNhYe93oulcazYoRTWiYhtDb1f1KRLAjqoE
	 bw4oFT5hW4LbfFviozGXUPaanKm0B55Cl5AkXn+VKPuS4VovljTS0KH9VVMtQD6LecA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b="c/iqOkGk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0560D606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0560D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=c/iqOkGk
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2431020eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792820197; cv=none;
        d=google.com; s=arc-20260327;
        b=FpxCg4Ckuv1r39HOSz+Hi4cIrBwqWZaoZZ3FUeD/mNlIhQ+iGrNl47yqEyQYb/fou4
         qXj983zpkGZUD0V55fZLZfzf61YsGx9zaDilpqUQycBCL9nf47cdNXoJGojj75tuypbo
         wXmMnVwgP1QlmYtRz6MxyYfOpj+wMDxRn+R5cGwHhbYvvQLx37kvtAPaU1IHb0imw5UP
         D+TKHOvOJgDWUplWwAYALiBR8X/7jlSTnlizjeITnTjfCKDPygyxr8/MuKgLtOXD7s01
         ySthsSqz/IGbBz79N0l7j1x+JwSk0Yxde2Orfh2uikIkgCzAEZOpmDp2v7alPoeHPLHh
         A8qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uOhtVlIsXaCqD9aysCR6LbQn+NNrDAK283YUAw1IIn4=;
        fh=WF4GVWeMoVMAsSUXswxr5bgt4JxJcbVsDvUj77BeHwU=;
        b=NDeOOhNqpiuWnr1EZFg3dnqPrWNU5ZSR8XYKDYW0+20dHZHrdHaiz8WQoRScW0LOVC
         NM4wKD7M8aoTLFnt70J7cwU2OGV6rT79VKtVC0JdElg03HEM5PcglFIPKw1vCRHoSdSF
         FuesvssTUUHmy9dT1D4u9R8SJdrkjka+U9vFI1zcsOn41nZnY/sfkaYP65WGe7XmTVGW
         KpLglrcYbMWAob2JDDcfPjr+NKYWFR5nEy3FVg017fP3gXnADQv8TAT32RJRfp/NnF8F
         UAFzoiYhfbI1Abyf53Xp2M34rVjGfr3wCXbFc/hsctvBCn6NdqQ7fKnx1V2kaaHc+CY3
         PSkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792820197; x=1793424997; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOhtVlIsXaCqD9aysCR6LbQn+NNrDAK283YUAw1IIn4=;
        b=c/iqOkGkTS9Qs47aOf6e892MeASztmFycAAzTnCLVisWPaHWWZvg/n0D4eDUtYR9QM
         nyCV5ZVjdppsaxOiOqsScF3o0rKgXgWYqpsxMqFAKHAhgVDhIHyHkyMmnJRC0jmwalZJ
         E21vuNbtmvPfVolSDaqVdknrFCUd3MmIh9Jlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792820197; x=1793424997;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uOhtVlIsXaCqD9aysCR6LbQn+NNrDAK283YUAw1IIn4=;
        b=GFUnEfciC7z48s6gxPb6Bd72jgVhowOkHpGtxsMVSpFJSjtQjQFuMkFX8Cmo2IbQzV
         a8gnu0Gm+MR0dQC21c7ilyVTi44ExgtuhKQ+gZFPH3sFRRpR2UlHK5UxiIXoTzn3vQ6W
         4EuTpiZeJgm/XFxCx3zWE5ZjEvCrbtnyl2dIi24RuUxEcJQFcDXBNgXWjh2662xp+kXc
         NhuyRPP25AW0ZqNwIusJ2OaGSeRxkZZWVSKnGjJmwW11U3E5MP/5B7FGgGgiJTb4edJU
         PrpO1MbNScpkuNjvsEGYvSu7uPey8dtZ2nsNXiPBvtEMrGGyJgm+VBIBzsRxVqBJzYLq
         W1dA==
X-Forwarded-Encrypted: i=1; AKwUvBxVIX6ytarZivZlFF+NiZBv4932gQfHid2h4XVrGSrDvHKTISkhXRg4oojTFNv4oaraOwSOCpk7lbnsSFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK88OsS8kfwSvvBazMAfeu33gOdTGqkCIBmFnvDOSsSdZrrp++p
	AoYd26erll4BjrRE3L1aWu7Mfmp77NnDuWllOCWWFP3Q/82HVh40gFuhwjyxkjZ0aD1XjFgqICv
	1fJ4sVTToSi4c7Wk/XtM34l+CW7TFqfS18G9lywBC1Q==
X-Gm-Gg: AYBFou3cljM8Z7qqVEI6mKPJabIHKQ35aprIsZh9bfFZJE04bQRZ1L+v8qbWtiKebrj
	PrBQkkILRZVNwpTbsH9gQgKpzEUm7cVgh/aUQ6AEJqu2GTLKlsz+a+5qrxABRdkAHuHt8r5Clx0
	kbjUxEK4mx8K3YpxCm/iJI/KGhNC44rurhxd+SBHcXHVrXlA4b/GIPDPZMOAh/6G2ogngLSMDs6
	ig677V+BGoXJaDT1K/pU7dCyQ6+5XvgRDCIHIoIZLG4GrakoHJelG/rO8SWkdtTpHIyfYsYczm9
	c+VC+zdmdJcd0XOWZVGg3fZ4+BqBvzomtPTWEBlLLPj09NBNqSZZpWd3Z8qhmSM36zgJPQln6bo
	Ohr+jqrRmZTjMIzUgAmPAtiFxJtnkpirqNiuXpRT3z9XeG7/KodwHnWAoC28E
X-Received: by 2002:a05:701b:4502:10b0:185:b157:f271 with SMTP id
 a92af1059eb24-19935fc552bmr1439575c88.23.1792820196846; Fri, 23 Oct 2026
 22:36:36 -0700 (PDT)
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
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 24 Oct 2026 14:36:25 +0900
X-Gm-Features: AclHuK--U4y5WwbG_OvCFvKm5ZdggLi6MEGxzSrvBZK47svhkInkttu0YdkNR6A
Message-ID: <CAFr9PX=KVQpPmh076AXFaYu9dgqA-uFpRXCBVZsoJkna9ph2Pg@mail.gmail.com>
Subject: Re: [PATCH net] net: 8139cp: close race between NAPI completion and
 Rx unmask
To: colton.pawielski@gmail.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Colton,

On Thu, 22 Oct 2026 at 08:12, Colton Pawielski via B4 Relay
<devnull+colton.pawielski.gmail.com@kernel.org> wrote:
>
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

I tried this out on my landisks and it seems to be fine.
So for as far as "I put this on my hardware and it didn't break my
ethernet or make it explode":

Tested-by: Daniel Palmer <daniel@thingy.jp>

I don't know enough about the APIs involved to review this properly
but for FWIW I had my clanker try to reproduce this in QEMU with an
emulation of the landisk and it said it could get into the state
described in the patch so it seems valid.

Cheers,

Daniel

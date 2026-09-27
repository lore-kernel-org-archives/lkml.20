Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06213C9895
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512001; cv=none; b=VIfj1/h+Ty+0+LTNvfunoRz17HnPo5dn03AKIemhoolRWk7yXLTYV1qxbsBOA//Pi8CPp4vEtNBsmvFomJ9oTzhYC8rMRhOJ4A6KslLOX3saZtH5UW1Xcsrmt/5Yr+zmvBhUy7ekC7GJ3ZLpmBEp1UPpXkQPAoyKmt/6B1CFzgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512001; c=relaxed/simple;
	bh=oNop5lBDeiAxiJltt4clkQ90VfgPeUptu2EMaN8H1Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jd0albFYumgVq7QYLh9X+B2XdEgW1fne8CFmlmNGIfHFsUiHjcHnnCHk0Ee8WTX0wjjTm1sROAaPK0OraTcLBnFzVnoDYVylhY63zGltnPE5HsglhgjabjU/0OUNOKHkMSePeyyz8QcRGuRxJ0thqxXmV9NJQBhAY6HnslCUGgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982dd15d169so1377636241.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790511998; x=1791116798;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rItpLa2n9MiIOqmyRK+ap1Hs0buU9Shrp4pBeop1lGE=;
        b=zlnV9J9mVevy6QRwy8+i6lSZADTa6yQ1ZfkWh8ipUnyJ4ts8NN2xACjmENZ6Uns7d5
         SDK247I1A48R9xuJaJm36SDgUekGY7lDseNMB6fhilQqt/v+GHy/1aJ0fMOwV8Mk7h+1
         QkSEohRqdrYA4WhUziEC9lskpz2ihiboVcaSjYfbKAmft2BHuaPGfmfEeg7VoVS45Ce9
         rSxPlrBUXvYp+vH9WIDLN7PSJBmf1S+QQ0kdqjMLkccqqd0HKhKVo2gz3WSQPNFLokfk
         D9vstDPkPB/xVJEEFIjDMsx/exVE8QV84wl+GiVqVX3wD816RkosKKZ9zU/9qre/zBYd
         parw==
X-Forwarded-Encrypted: i=1; AKwUvBzBEqpQtkMEQAgdwZSAVXriQ9xl8epeIYnSGyYXm3onpkHVVXjUxTF0/csvJaKx+VPaVlCoX5vQ0KhYh9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFJVEeaNzo8VSL/a17juQwJjIHEt2+ENDVRrqsLPJAxlAlb3t7
	7EHXjNvnoAy2zfH6Yy994GjYRrUgELuIlJp5ulvy83JnF+4niPmkp6HJ3yYF9k2U
X-Gm-Gg: AYBFou3GXGIIc/kpZoDcmTTMfEkn208CAvvz1SFDEEqaRvLCNA/MIxVIxzTTWGWHMUG
	baCgStxjyHGD7xcOF0jvvGqz1RHX9tSTrq7bOl1L9lK7nefzRjkscrGo763IjdVMvT/Nq/hR93A
	DOyDkoAQVcKyTaxwlLCqqJwi6qKsruWpp3IBrLhvzBFmAVRw5Aqds7uv5Kaxth5CNwfJCxfpr9/
	EKuU5KRe37qHPbrFwrifJ5gB4TmSSzvxgBZ6CMRn1MT0rCE897a5iDbx8EvrODzIjTkqCTpzewR
	FkB8YR0IaNf0nKGHJFJj0K0qX7K2veH5K1OzCYLLEWo3Hj1Yp5kIhJIOQ25C+BCvYXpIiXRp0vZ
	j36Hij4cF8cLmCuwOYQxit1b0v8PMHjHokIF4IQCNFyyUvj7+mxNV5ZLv1xbJ5O5TDLmEliiMMM
	ZLVdUv2l8pNhdiHuem8Co4lUJAtEy/aBdbMeHNYbllKE71WTx4KH73q2b4v3QA6hBxdeor8Y8Ae
	mBIiY4Zyz1P8rClEFZav5sHgH9rDAHNvXKIdwI9jxLGtMTd
X-Received: by 2002:a05:6102:162b:b0:7a4:fb71:25d1 with SMTP id ada2fe7eead31-7af1b96d484mr4562941137.7.1790511998578;
        Sun, 27 Sep 2026 05:26:38 -0700 (PDT)
Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com. [74.125.226.234])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b0b8e62sm2538155241.8.2026.09.27.05.26.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 05:26:37 -0700 (PDT)
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-988a071feabso122480241.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:26:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzeN8s/LkLdXEpx+Dxpuv2iMHXNyN+EZzhOBz52QWJUpB8QikUncatnimqp3lw2NaqG99r54WgCLWvxi0s=@vger.kernel.org
X-Received: by 2002:a05:6102:534a:b0:7a0:f7cc:5045 with SMTP id
 ada2fe7eead31-7af1be75fa3mr4441712137.9.1790511996983; Sun, 27 Sep 2026
 05:26:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731094402.741645-3-thorsten.blum@linux.dev>
In-Reply-To: <20260731094402.741645-3-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 14:26:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfst6urDAoSKQgbjB0j0vU7c0v=WM-gOe93iBEb0Li=w@mail.gmail.com>
X-Gm-Features: AclHuK-UFiGOvR6vAhEVwRBFXl5YC0sr-Pa_dOlgtOwpSCPiLeaSpNnlvcyuv28
Message-ID: <CAMuHMdXfst6urDAoSKQgbjB0j0vU7c0v=WM-gOe93iBEb0Li=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] m68k/serial: Use generic BASE_BAUD in asm/serial.h
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jul 2026 at 11:44, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> Include asm-generic/serial.h and use the generic BASE_BAUD definition
> instead of redefining it.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/m68k/include/asm/serial.h
> +++ b/arch/m68k/include/asm/serial.h
> @@ -7,15 +7,7 @@
>   *
>   */
>
> -
> -/*
> - * This assumes you have a 1.8432 MHz clock for your UART.
> - *
> - * It'd be nice if someone built a serial card with a 24.576 MHz
> - * clock, since the 16550A is capable of handling a top speed of 1.5
> - * megabits/second; but this requires the faster clock.
> - */
> -#define BASE_BAUD ( 1843200 / 16 )
> +#include <asm-generic/serial.h>
>
>  /* Standard COM flags (except for COM4, because of the 8514 problem) */
>  #ifdef CONFIG_SERIAL_8250_DETECT_IRQ

It would be good if this BASE_BAUD 8250-ism could be removed from
drivers/tty/serial/earlycon.c.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

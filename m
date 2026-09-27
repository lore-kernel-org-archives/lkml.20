Received: from mail-ua2-f19.google.com (mail-ua2-f19.google.com [74.125.226.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F633F4827
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517290; cv=none; b=fvOkcdkqcNI0O7ApU386PJhEw1vyCGHeAOAwHfLlJAyiokB0gZN5ei/rH4XOutpKra68nVw94BR9ENxh9hRPFtJRn5nZSX6oUPLf8CQON+9ekSEvIkZwU5vbhJ6QA3C53pv/drsjAoikxZFZidFJGHOwIyTAKbGQ+sl4GozQ5Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517290; c=relaxed/simple;
	bh=aJ/3u2TDk1FwrMLTOiGsBvCmKGy0HVamF0zMgDHiRbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KiDKPPj3CczTiSWNBJXSB5hxqQ1z6bN4PQ9ZFxBVp8h2OuXeaCt5H+skB6tEsdTON4zJvixR35oK/9C6b3wZf/ZVmKGLQBasGYSXRxmk79BkbQSV5g0Bx5gNnJ/pkB7lvzmXHH7JU9rU2tlnsEB1kGelfw4Lq8PrJ0J8mzGnr34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f19.google.com with SMTP id a1e0cc1a2514c-98531196e20so1351112241.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790517286; x=1791122086;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L2OFp95iHCfRROl31Y+sf6zuVagn/RbGEuuvvri1wN8=;
        b=tdxa+tfh9WMFOqx8JIBQ7uTyxVZpKLTTwOVmFkCW2LQU7Ce4luTpaGNEJOb9i8oADw
         hR+zcoXoCv5sm+UFsMQm7eWiStbPDqV0mSECKLB9jFErFg652yQrhBNV/wW8PsAbj6he
         Me8CdlQRPiD6PPclxf+kowwN3/u2E+ck32w+zjn0wtbB22hS2fRd4CMXWE5p/CaaMvG/
         LxVl3fMOFoHHURy8KrM5W5kfYVs1dhstpOSR7LNuLNM6N8joZQeRBGpx/x7fZcZpjM/u
         6oE29+T+s9zAV6hHk3bvrXakZADE651thIwP99mzOhXc/Efn3kTYg0TjDLBlnWEz7OwP
         vVDg==
X-Forwarded-Encrypted: i=1; AKwUvBzAjzUU5oBcqXwHYrPde/H3yaWkhHKJeTbsqkeebQRSHRNtHKsrpZDMGzQVX3iCGEDeHUZvOMv9wcZw5F4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJum7Q0RwEHkH5wz8QvRh++V/XVNPxulIr9VU7Jr0Q+BchUdG6S
	F3nqWyarbwsl7VNaWPPJ76zTKg7shIv7RamcfESNlgyyLLfvFALBOmSyo3DxH332
X-Gm-Gg: AYBFou0XPU2G1kY0ww+/gxQ4EdCbbfK9ipvpstbQw2e7uVmn4lsr+tqM6w7aOChzp3k
	fuSkx0FcfJk5jEb8X6PQTGJiaLzOLNb5eYXshosjufVS6KnAQ4zNbrllnkwdX2mPOUCz42quNcN
	97qfJVrFnYsvkGs7/A+hlmNOaW61wm1aHIKVF5OMn6M0wBgbM40o7DFh/ch4kVBOkXjXd8fZGL1
	a1bJiBiG7X+dZUOSnMtHAFyBcz2eI9LsyWh3QGenvNFeg2wUAQ2cidQv3NVHqneTt4dadTEG7yo
	NQycRPfEO8ROz6wnwanWJZpcFG6+SmzK+oTIiyZL3yKVyP8YpbB20efMJ8btr7SEbGTU7Cq8OzQ
	4Av131l4eM/0yPjVCerqLsRqcRJD5om6iLq5jUyqCfAzV2uyoz7XbtfbfidiEnAq0EUVGymP+wu
	bVqlvRKfI8elGNSW2hFkTqLn0kDF1QbFrhODsAr4hLPhAQFq8BJ6HF7RGyR+CqBjTHFpJZrHG91
	6uPiFDsNsfMXmIqrVXatUuTKLsdma20cKgiwNBazlNyAJE=
X-Received: by 2002:a05:6102:f0b:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7af1b96d38cmr4595687137.1.1790517286402;
        Sun, 27 Sep 2026 06:54:46 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde645680asm5293308e0c.15.2026.09.27.06.54.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 06:54:45 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7ac5b4011a4so1428338137.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:54:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBziKt2xbY/TZB9LS05YGmcpsOibG6DBfYTaWcq4nNa17pdtWrf6AE3JdAl6rFgfx8bU8JtlGvMHISjYWsA=@vger.kernel.org
X-Received: by 2002:a67:e703:0:b0:7a1:f7c3:3a42 with SMTP id
 ada2fe7eead31-7af1c17fd4amr4317636137.15.1790517284989; Sun, 27 Sep 2026
 06:54:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828094940.3882602-1-daniel@0x0f.com>
In-Reply-To: <20260828094940.3882602-1-daniel@0x0f.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 15:54:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXL34_aMC5pnTyX8BpiTrRNptNbqUkLj3VEX8UFaXp0jg@mail.gmail.com>
X-Gm-Features: AclHuK-W_2pkk78COKUsEJzd_bQ8Exi416vXDhPKEtXTioHarx1YejHcEFLpsas
Message-ID: <CAMuHMdXL34_aMC5pnTyX8BpiTrRNptNbqUkLj3VEX8UFaXp0jg@mail.gmail.com>
Subject: Re: [PATCH] m68k: apollo: Fix interrupt setup
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Fri, 28 Aug 2026 at 11:49, Daniel Palmer <daniel@0x0f.com> wrote:
> The user interrupt vector needs to be installed before the interrupts
> are unmasked otherwise the timer tick isn't handled and boot up gets
> stuck in calibrate_delay().
>
> Assisted-by: Claude:claude-fable-5 # Wrote Apollo DN3000 emulator using QEMU
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Thanks for your patch!

Fixes: 0aa78106c661cf6c ("[PATCH] m68k: convert apollo irq code")

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.4.

> Backstory: I have Claude creating a version of QEMU that can emulate
> every supported m68k machine. Its still working on getting Domain/OS
> booting but it found that Linux locked up on boot and I used gdb to
> find the cause.

IIRC, you need several of them. A single DN machine feels lonely,
and requires caretaking by the domain controller ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

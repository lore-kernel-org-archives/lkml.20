Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792567934;
	b=TwL6i+G3TmWygUIVq3+T16TUKEodBNP86Rzqmrr68m+ywcV+ljQnUxrHQ0yy4e+qV6qO
	 rbYcFdyWE14qYVYS0/pcoFvKljQOEAI247jtfuA3j+sKChJC9DjsSZJXmRuP5pMHCTidR
	 H5JYS+0QfU7AUCN+YGRrERjSX1FFsOfoFnYdRBihfQ+kW5I2FrdmXqln9qPmBk2C3aSiq
	 79ft6ZquUnWGw/AbR1mGEK7wASpKwpxhPz0Pd+MpKBWXdGQ3PhJodnnBI12TTQTR3YM/a
	 pC3zR2LgJnYtS4xWiDdQ2z2BepM1yRc32NHqxKGHNK2Clo8OF0xqevs82qTWHk7eRBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792567934;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=6QAiK2mo/o5kQv4IXUx/z21UDEdea17cHOw3H4USIDI=;
	b=NY98Biglx6PhDCP4zzDDmcjEnQmoQIsrcXn4JwQ2ODagVO/azqFcPoTOHdK+L7oS6Us4
	 zbrRq+4Xkhc9FyVww8/pJhk+m3O3nQT7QLlPICC1lt3uHLjSyvtJ+zwYJ1kM5mRlXgA9y
	 mFt3vJo09x7dNAWEZpE+UwkNxP+Ofh1eobctxSWykkiM2fDza73mZOqhtuCQQ+FbqI5aU
	 UVosLEq+To/ZQhmWCceHe3Y4W86ghe6IPe4mXuaf4q/zkeUIninIvwuZvhx/FEwh9puVo
	 hQsGBn4GLOPf8JzLDkEpHVG9pWzUCYTAwx/huDm5VeYtjG9VvGpm7jD6Pp+E5F9X+8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2733606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2733606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc013095d4so116992137.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792567933; x=1793172733;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6QAiK2mo/o5kQv4IXUx/z21UDEdea17cHOw3H4USIDI=;
        b=WRFLxprgyPmJ3BwkvXpCHXnmyukS1dmg5M7EhXrQy3UiLyf3Gx+7VY9qqoRX7nFtMB
         NADFMny2etQtt8eRBLd+1LTgiTMLOYp+PREPScdbr7gkYwGmKL2euNMw8uMnQ17Oe0xK
         dyh4LTiKf88X+J84M9xP++mO4KNYaf+VGG3r/ZmYlX+fLZ3TdsEXLiNMtZrFQdBuPgtG
         Ei0PxfzBuxEmJuFTYEYzBnMuaHA+tsTPz23MyYxukUl1pAvei7bFlUcq4ZEJLrMaJ5Dh
         Er66nXfRuTWfHhdiyInzqhQ9Uey3EdxPy10pr04spw9cgLWpJ/Ln+TuKNg/2s0jx+g1d
         HPOg==
X-Forwarded-Encrypted: i=1; AKwUvByhby3oBRq5x5mFLTp8eTJT1m4pH9RwSOcwi7WNYi0FMEiJyFPARlRQH0oFljXTtH+tDlKdi5HF7LF/DzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVcmLzX1THuQ8ZzcsVcsxitr6ioN/SCmJcaex6WYKuwX2Nl/5q
	eAtCBArJmO8BICj3s75Jt2ut9MdYWow2jEnlP/G59+QOF2xN5M0YHEUMnGD4i9Bqtkw=
X-Gm-Gg: AYBFou0jGIV7t/onP304CglTHpmcTXOHhCgt6uXMD0BLnKhc3M23BBwsYqltTBnALWj
	MUjDNR7ecqF68Pqsgi64f4vvYLnz4MS4/xxn6+WfuPMjtMEnJa5jj4HC5vNR3/DqKPqfg1tv3sC
	4jnEfdOie6aGIDFbxfZppyexCmXl8fBrWL365LHEsmAldggFYx/k2rdW+tmeow7kdoqxo5XEsmy
	ToEk0/GqXy7qHuOslL2DUriIePQ/jwuZrQBaAdxK3vEuFGehrc/WwdK+eGHBWBB/JiKGGogxWqI
	aEhjmB14GlU9kHdmIqsB9BDVzrDE5Mi9PidXjpNuhF/CTeM94TghCJ5A3sOnSCZHFvcE7P0wVUe
	++uyKxpnNwNjjqzoPMQaXmCVGDorpm7TcmYXe63O5jv/WCFBna5yTRO7xo4xemgFDWrx32WoyFh
	5P2yr0K+M83qJh9ZpqYjnCpNDx15DM5LmUbNeyNyeJFGQnoUXN12O35ruJ3NHtW6WOIzkjhCtHY
	9EbN4uC9qvJQDYLIcY2PkHh5IrPQlw7fj+ou2qapVCMtvLNAEHZk6KB8YZOxbGEASDncPCSWW72
	/GTKSrsd+JrTkkaNYj8Nph24HLuiCeK0N1kkg98=
X-Received: by 2002:a05:6102:6cf:b0:7cb:bc5e:7dad with SMTP id ada2fe7eead31-7cc925e3ab8mr426814137.10.1792567932708;
        Wed, 21 Oct 2026 00:32:12 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d118d522sm2245953241.10.2026.10.21.00.32.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:32:12 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-98c8cbdb9daso110614241.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:32:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxz1PX/dveBqd9YVc8diHEraN47Enty70V/UXA1OpbCgQOrfDSECqW6dUdPGXGOKz68gAfbObhOnNaW+mI=@vger.kernel.org
X-Received: by 2002:a05:6102:2c8d:b0:7cc:2152:4f95 with SMTP id
 ada2fe7eead31-7cc9246d45amr430597137.3.1792567932012; Wed, 21 Oct 2026
 00:32:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021000338.2160223-1-miro.kropacek@gmail.com>
 <20261021022336.2232886-1-miro.kropacek@gmail.com> <c77944ee-f170-ce57-9065-d7d49fcfed6e@gmail.com>
In-Reply-To: <c77944ee-f170-ce57-9065-d7d49fcfed6e@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Oct 2026 09:32:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWHXjbCNojoukGq4OWvLSibk-goJo4quLdbOj01neOew@mail.gmail.com>
X-Gm-Features: AclHuK-O5R44UqsZeHR5r5kV3Sh9TQiIGd4qHB-xb-ZK5hAF_St4Y5l-i_lJpFI
Message-ID: <CAMuHMdXWHXjbCNojoukGq4OWvLSibk-goJo4quLdbOj01neOew@mail.gmail.com>
Subject: Re: [PATCH v5] m68k: Fix atari mouse movement
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Miro Kropacek <miro.kropacek@gmail.com>, dmitry.torokhov@gmail.com, 
	linux-m68k@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 at 04:51, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 21.10.2026 um 15:23 schrieb Miro Kropacek:
> > Kernels are built with -funsigned-char since version 6.2, resulting in
> > the signed 8-bit position deltas reported by the IKBD being
> > misinterpreted as unsigned.
> >
> > The hook is handed a raw IKBD packet, so take it as a byte stream and
> > apply the sign to the two displacement values alone.
> >
> > Fixes: 3bc753c06dd02a35 ("kbuild: treat char as always unsigned")
> > Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
> > Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
> > Cc: linux-input <linux-input@vger.kernel.org>
> > ---
> >
> > Changes in v5:
> >
> > - take the packet as u8 * and cast only the two displacement values,
> >   as suggested; this drops the call-site cast v4 needed, and with it
> >   the -Wpointer-sign warning
> > - add the types include atarikb.h now relies on
> >
> > The same cast of the two displacement values was tested on an Atari
> > Falcon030 with CT60 in v1 of this patch; v5 differs from it only in the
> > type of the hook argument.
> >
> > Michael's Reviewed-by from v3 is dropped, as the approach has changed
> > twice since.
>
> Dmitry's reasoning makes sense to me, so we're back on v1 with no change
> in functionality.

If it's just a byte stream, one might not bother doing s/char/u8/, as both
are the same type anyway... and then we're really back at v1.

> Looks good to me, feel free to add my Reviewed-by if it helps get this
> merged.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
for the arch/m68k files:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

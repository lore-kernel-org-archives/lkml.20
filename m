Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A4D2F8E8F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893351; cv=none; b=WgPJbUDWZRe1YJqFF3XFhYvLVFi5arxmRQwKbavBxPvdZv+TUVbyYCPvhHjPEeJCi4fLtN8aHH6Av2ZxtZgQD+gc2R5M+a8znWqdFMzuBjEX33hfConUlUCMWIcLOOesKGxZxO/GW2S4D2M9gJQxmf4NZiAzqo/GLsyEUGjep50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893351; c=relaxed/simple;
	bh=dx3WX3ly26TB+IVMsTuW1diHve6oJdc1gwi/6inCROk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ga60011/UphaJcRgRzRfNTCUBkUg5FWXpkg2oOtxAruYbENul5QGJIL2lGlknLaKa16h0c6Vr0Nbrz3VXVI3k2v1YPMipJcpxIIJXzJNb+lYjfd7PbB8Vr4GQXVnDVX9kmIOW/RNTrnt1UsYukAoS3XTHggToYsj15rLJWARFX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9832c759198so1014223241.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789893348; x=1790498148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TEJzUh++qaTyfpGpEoIgKAxq2zJ9FKW7Nr4Jmr8hT+s=;
        b=nHMW+UKFtfLwN7yLRhb3EVezPujr1e+YsF5Yoe0Ji4Jy+a6zRuykxceoiMD1kz0wPb
         PUtAOepVRUPtwMvgjqtlK1+pY+cdkjx/MY8GUQRRW3izwoqEtQqGBv7CiPnQvEW76KsP
         9l/hjlOKublDPNfsTpL5JEEC/2mQT5ZbripwUHEV5k0SXrfB8sQ8MfnLkBq/0vllc3T3
         hjgJjgqvhccq0hFay7qyF9G7dNpji7laXdz1aAUH+oRtoOwKsCdb2JI5EwwgEEK+GIUT
         Q7VZxAtL0rFJseNeb7pn5yZaCWG62/a5JfCyl6cvQ9CVoZcN2LGzX37+oACzMk0Wl7o3
         ORoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+0JBzbLgUovx/G/ysZ+SMFBAZ77jQuwFdDpystktJeLT0Y6lfLAObPBtLSnDONzs+xeWL3CPufqdHDg0=@vger.kernel.org
X-Gm-Message-State: AFuF++mmvJhOwtwDQ+CKPweqmM6t8jyhNC719RLzAJp76xdVWiAZCY1v
	u1OOvGYsDRii9k69w/0Fhl7GY3TlnysQpZ3xC6dNhJpMBG4bLLScz7+i5ATBgJLa
X-Gm-Gg: AYBFou19SStF8M1+dTrOM7nqG6nCmuoMed9QfVFkHFvyYXjvyxPo43O3bP2kg6ZA7Su
	C+g+81NmQiSiZubOmfvJHGeJBujCV3sD7WHqem2p9qbQu9zXa8hAveEgLoOgyr9cq93P7ftl17V
	DKbN+xH3vYf1wy1BykTgtlUKhZ2GZIYdgm8JNTjSn+XOwzdFc4w0GxeEGilRjv0PLHtXkcWePf5
	JBEZgZFXltM1XWZLaLeWxd2daVI96xauFdNU7iOluyEmem/2OPT/W/uBjkK0Wl+metifAjriKQi
	CcDAoPx548LXQFhX9ypag+GwLPyf/yOt7dJsCZ11su3bpPInxI4/zkBS9mYWEaMgOS7wxqry5HM
	42MbKoANXeuo4smzk0gKhr1UiFzCdyhF4aKShJ8+JeGGqfRw7pQu97eS0RvvOvv5ZlxRaUKSwWQ
	6NL+MpcZwC4wm12qdABNAqzLVLvWw+mlc2GLziIzW3HeGQEcN36nEphzWy6N3UFQBEGdf0MJhR2
	qcREGqf9ljCgGTOov4xwfDNgEO1XlXSr6P9
X-Received: by 2002:a05:6102:e10:b0:7a8:1817:276f with SMTP id ada2fe7eead31-7a8181729a3mr314640137.37.1789893347997;
        Sun, 20 Sep 2026 01:35:47 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a6ad0fbc7asm4617724137.12.2026.09.20.01.35.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 01:35:47 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-7856441f7dcso800439137.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:35:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzhSErylvodH0/aL9bhA34fmgAuzFYKqC4Cmv+3Gm3sJjt7pJtZVHFWIoQgiaVwZwgfCq0Fbs2DzNElQRw=@vger.kernel.org
X-Received: by 2002:a05:6102:c46:b0:7a8:10eb:9775 with SMTP id
 ada2fe7eead31-7a810fb1ca6mr288811137.4.1789893347663; Sun, 20 Sep 2026
 01:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aqj-ylAvjuHZeOan@monoceros>
In-Reply-To: <aqj-ylAvjuHZeOan@monoceros>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 20 Sep 2026 10:35:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXXVabVQq9Y_H3NKWTHciBuqZmkzrr78wGMi76DBZoVoQ@mail.gmail.com>
X-Gm-Features: AcwNN1XjraSEZJZtINvzMz0mr9iwzq8ZR8B6AP7ok_PPf5uaTv-Tvmie2LMUewg
Message-ID: <CAMuHMdXXVabVQq9Y_H3NKWTHciBuqZmkzrr78wGMi76DBZoVoQ@mail.gmail.com>
Subject: Re: PGP keysigning at LPC/OSSE 2026 (Reminder for registration)
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: users@linux.kernel.org, linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, lpcosse-keysigning@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Tue, 15 Sept 2026 at 10:25, Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org> =
wrote:
> this is a reminder for the PGP keysigning event held during Linux
> Plumbers and Open Source Summit Europe in Prague this October.

Thanks for organizing!

> While it's not mandatory, it will speed up and simplify the processes if
> you register with your certificate for the event. Please do so by
> sending your public key to lpcosse-keysigning@baylibre.com until
> 2026-09-27 08:00 UTC. If you saw the initial announcement[1] and thought
> it was still to early and I'm on vacation, please hit reply now and
> attach (or include inline) your certificate which can probably be
> generated using:
>
>         gpg --export --armor your-email-address@example.com

Note that this would include all your expired/revokes keys (if any),
so you may want to specify the key ID instead.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

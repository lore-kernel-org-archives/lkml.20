Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862C73672A0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788474954; cv=pass; b=iYYdTAegzugzMzPeu4J5AktK1vz8/kiH267/vSefE+OwWqoaejRVYe7soISnIi+oGiQ7Gg+4adxF3ns/YER7Tn+QBjsne9U0bBfIYhYxunyddbYAz68EphZxagNBurE+DKf0OhMRuVT1zzXewGSeNJBA0SHkWt2BlzbMVamA8nY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788474954; c=relaxed/simple;
	bh=BYrXSNtCBzi65h/Hlol13R14BAGVRzqQ0p7bwOhEWfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIeszmPgnEP5Lo4/yWtoDlG0zakqm5nAASSx87zuWz09c7OtA3QmnQpDyD7q7pOleP9ucrNaceoZY/Nq4oqDSI+ENsRWF/5dFcNNfW89t3wQwHpHMYwxCdq9Za/0FF0c1C8ym6LCzN/hDSL6zqDBVekqgNLz0g0jcQWmKBFT9+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuGvqp8q; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuGvqp8q"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso379313a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788474949; cv=none;
        d=google.com; s=arc-20260327;
        b=MAuPx7Pi0eBPrf+VcmiUNafgLF+QgY8L5YIj4CpfFkXJGs3GLoP73+aY8WyA7YLrtT
         Kg+HlybeAdWc67XxZk6NSsKtWNG2n++DW2lkHQt9zKWYimaSPai10xqAJ+GIF5OWSSAr
         +yRhz1CvTauxq9TzAZtCRfU/fBGqBZrkD+fCNdmxsBjkR2soZAZeq4I/YujwLX/mbsEK
         iYZyV/gYclbR7j2Tf5dEbhVFYC4+hXXuj27ynySWzb0wpnM22QocUqyqjVPLtFL9+gax
         VIOjZb5lzv8LwVvQ67NSEQ+u3Dv+VNTkgm/I/Bk+T8uv/QaFWbKHXYwZ9sezcBg96dUm
         JlLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qEtNs3um3+kM6/cXbt6+nwO2g/oyh2psZWCJcuPwPHY=;
        fh=/PTP11AnCWb4bB4ZMJma8b9nhXlaoUabnbwU8eqphco=;
        b=obSw2Zu9uxSAnqDa9TC3dFGcJ72j23NKcUKiMzQLJoBdfDy3pv8HkplbhYhL0Ch48q
         5qvoVOiisf/tubdkZu2m3hjClZHe5vJIKTUvEHXSY1AU49jsV/fs9zhrDndQcFpDzKDn
         /JiMWTIWOrbdVpYRDIHRRJ+DnXFu/kOrMAIXG3rUSKAUa9BdVHT5xR0dtN0JE4MSFTyA
         DQbPrgS6n5LL/jCNnvhM82hnV80aaaXeWn8wcaOUmcLlHY/VdBvQ5DEssh9CubuiFMR+
         teO7gukdmGTvcEeuQMvYpZgQAsOHzEwFi+MixB4RdTnar9h+ZpqG5PSz77EcZU4oMEKL
         rJGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788474949; x=1789079749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qEtNs3um3+kM6/cXbt6+nwO2g/oyh2psZWCJcuPwPHY=;
        b=OuGvqp8qk2fC9ZxGkf8usQsZSsx2HFdx7pUqBzxijirtiMi9gZV+ok5VkBZo9lqXpy
         4XH7t6JhyZEmhw7CRNJn7rDMENcjTu61PkiFYyBTIGTF+8bJNYwStb9tgi/9tPZNO/H2
         5kw5h9io4ldydq/mnpXBaGOTOo7aMX71xwCuAp2x2kGBv7aAoAeDiaq/4N9lM9z2wKbD
         mRiMvYGAEv2pS39wUomlqYpmF5JerHJ8z+RWHpiss8Ypm5kr35HEEuTgm5K2eHig92DO
         6AQOjtL7USWmdmYhfQbvJ6QUTqvJjhJUmr1orce9FJeaEOaVTDVnjLeLBO16BkBtYHgM
         1N3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788474949; x=1789079749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEtNs3um3+kM6/cXbt6+nwO2g/oyh2psZWCJcuPwPHY=;
        b=E2dep6TDbzH16LweKRIdc1/Ksg0XVJw5t0LO0z9Pn+1TGLeecbBSUEo9NtxELZmQbk
         Yf7X9MITqf8ODrzhrpMWoqJthpncDoaI/5Dy+Lx606XPfHZ1yMtjAvOi0xppyIMNVpdS
         hjSLT/2PTZnOuu+sh+lrljUcHW2MPcFDqVeyfxPNqq2eqC9WFJClgLOFPCDfY6/rqELF
         qQPM1LooTZtc+1mXbgAPJM2q1ZoWE5MGaesPlqCGRKaU58urHNYOXIUkXqmkT31oifNl
         0Kw3gN1y5pPnsaevsi527SeYS/TeN32RYE3J3rd5Df7yyCa3LBk/gkbPgSsTK/bHaiUG
         dkZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmSNwED+A+QfS9bsBopMsaIe41Ilm3YERPcSd4KENKXolA8ulFnywseOCszYsQE1LpMtn+vawP/uu3dJI=@vger.kernel.org
X-Gm-Message-State: AFuF++mYXTkzxQgHYYwrQ4sGvhqsI6okaBnjfR9Gjoo8E3w9MC5HvUu+
	IFjK6ttkfO052uNciMjY3rRrbYVdGdHqhGHkMfsuvvZ2tezct4US86WjTBkMSlD9jZ8qIb+5ecy
	mpOWdaiJ4YvHF2u/UgJbArTgn005orSI=
X-Gm-Gg: AYBFou1YcUHL/01tLyCnUgoqs9m5kxdKdZx3j4+ig8j3w3OT5rAphHjd7mAxQh4HDlt
	PJ8Fxbk7X4SPFsRcPkiOOjZv5g36HCZeCk7mF6737VMJrulTmktc3wTBSqbAZZDbnxs4pSfzrTm
	NJVQUsZ3I7smZ1hJq69VSUGKjULKa6fJyfj0b3RoliQpYd79CnFeKw8DGwx/XK0FVnTw93eznA5
	N/O1DK/PlmBnwsahsbi4t9XFhl0Lx5i8c/OUaYIohnl7NpzhfMwVfiiGghd/q0rpL0CGb3RdU+4
	kIgpI0zcmHbn0lxGoSV2jwWpKfQDIXDcwXACDZc5fvRcpAi0tJWr6BMkJ2xG7G8gkjd3mlfDpsI
	sXZ89L1yiGYAGsoYudVue1j4smLg50GI=
X-Received: by 2002:a05:6402:e94:b0:6a1:fd14:8832 with SMTP id
 4fb4d7f45d1cf-6a7e8e93138mr546350a12.12.1788474949469; Thu, 03 Sep 2026
 15:35:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <6d3dc767a7fe52b5e9fac3d1e4e82944d23a7ebd.1788277742.git.mattst88@gmail.com>
In-Reply-To: <6d3dc767a7fe52b5e9fac3d1e4e82944d23a7ebd.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 4 Sep 2026 00:35:37 +0200
X-Gm-Features: AcwNN1VUg3dUQ_M3pm8zKcjhEf3g_FjtCDl393r2_pQIDvCKcPQOHhmHxMy0Srw
Message-ID: <CA+=Fv5TtyA_CdL_Kg97V7ACsAgkKmEM1U=TJw4L7y5DKUd8h-g@mail.gmail.com>
Subject: Re: [PATCH 04/24] alpha: select ARCH_HAS_GCOV_PROFILE_ALL
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> GCC's gcov instrumentation (-fprofile-arcs -ftest-coverage) has no
> architecture-specific runtime requirements. Enable GCOV_PROFILE_ALL
> support for Alpha to allow whole-kernel code coverage analysis.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index 1aa76a2d9750..a6024590ea6e 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -5,6 +5,7 @@ config ALPHA
>         select ARCH_32BIT_USTAT_F_TINODE
>         select ARCH_HAS_CURRENT_STACK_POINTER
>         select ARCH_HAS_DMA_OPS if PCI
> +       select ARCH_HAS_GCOV_PROFILE_ALL
>         select ARCH_HAS_UBSAN
>         select ARCH_MIGHT_HAVE_PC_PARPORT
>         select ARCH_MIGHT_HAVE_PC_SERIO
> --
> 2.54.0
>
I built and booted this on a two-CPU UP2000 with GCOV_KERNEL and
GCOV_PROFILE_ALL enabled. Debugfs exposed 1226 .gcda files, including
the expected arch/alpha objects. I observed no GCOV-related errors or
kernel warnings.

This also appears to warrant changing Alpha from "TODO" to "ok" in
Documentation/features/debug/gcov-profile-all/arch-support.txt.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus

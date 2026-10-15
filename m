Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EDF3B2FFD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074762; cv=pass; b=MfMF9yYQWGFYpPsQYTsYeuG6pqlXZ5Q40epVfFaCianTVYVikOiJm0Smzw3L84G+KtXXzoz5cOL2LL1knmw5gH4riRhDg9wlJ0b5+hb2Tf1LsWmUVrDVAYM15/OHa3L5aB4VsDC2sjoY4JMyMIqkzVUVNmCv/L7XX47LCKcZJJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074762; c=relaxed/simple;
	bh=ofBd06lRo+XzhftsfggDsplL1oublpBngPmxR5uXE08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/ctUUW6fSwpHSZY9hPRotU22ZA52z1teGd+0Tl0Cg4N0JGMVT2/egZC3wpSII1sw0TzqYSZqSbaYQTE87GXGKoxESMCZn8Op54fS1nSTC0CAeuy+LphFIJUVxrzN+ovF/t9RlCv2Y0fNwCWapWvtuZ2CAOIuCcRoek/+gnsCT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3ZIS44g; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3ZIS44g"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso780542366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792074759; cv=none;
        d=google.com; s=arc-20260327;
        b=ijmLpGECk3JFXV5ZDNp3YrBPhCkdNpKT0IUmpGZ4/WHvAbblU9Bjj4E4xgHnIJAuo3
         x0bBUVv0CUSGObwtZuL97BR+l/B6sGM1abeI6uHqgBGOOdYdnwqTvUo/zeqmDyLumg9E
         bTwP5x81sB039TJlCotg2IdWA2pgpp0D8WenRfPtKD6AuqtFzjAo+tq/Fu/fWpYfqfjU
         OwNVya+ZPQJnHZqxq+S40Iqtgayt5fwRpmxWyoZHoGJOY/0/nX1YwFjFjpW/lhpB1uUx
         VJs5+ZyOe035xIGB93sSjOv0kcuCh9XaNnYh2Kz0TkiaYxdxXNFq7KmHT6zQUMC/hUju
         i91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wRqyIPckjjj0g7xkzxWkuaV4wuNTZ6zOy7JXpcrFLBE=;
        fh=SWtYHs1UKjzMrfMJnjRWUoGMPshhgqrTOxm3gq5R8iM=;
        b=qEe8CH2cQcFzUJ3Cp3wX3gp5RAHe9SC2gx71AemJ9SgIXwmIuhUgatNxzHIpKADCuk
         xY8fdlBKoTibbd4D08Qtq6JxePXqfnKtk7h2q6PhzQ+VrEuENW4qUc46lmGXrzuvOzJ8
         5ZFdtWRvGjIo4tKmOqTbGAMJa9nInnn7DYdm4Ek929Li66QOszH1EnuzDS3nJthEb5+a
         LdufqHflNCHnHJTkKiPfsknYu2r4UmYdjynmQGoco4+0+uCZGfI86Ocb2QxjNH7l+mCM
         BvxLlmMhHKX3CJs6944awwAsVM4mEc7MSYQYAXiYkp2Qgsng22kOqI8kDTOVWb7/Nxuy
         2xIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792074759; x=1792679559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wRqyIPckjjj0g7xkzxWkuaV4wuNTZ6zOy7JXpcrFLBE=;
        b=n3ZIS44gSGAkQBYGkCeuEdmMZa2eLFe0o5GP/PVSPvWxu/CITE66oAztoogQaU448F
         VMg97B3HEbx0E4KQ+D7GrkSV1fCFVka+31dQ+v8AnfzTtul0JuK5zkVGMjXPy2urDHbN
         YGJXjs0WitzQV8v+UHt2Hz1+IpwWH35VJ3fb2ZaJQXz9K6tUWuAA3dkqvrq+hvxI2H3n
         frOYL04TraJstYd3g77vNvnDfjC2OjqeX5y//Z8DaXGy3O1tMaeQ05QRlu5yZeLLZNrt
         JbadyTwnSxJFZmxvlohFZR9R4s1Fk6IqDDUwsHFpGrJ6WFM/WHmF0tWd0nsCIxyGCQTU
         pZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074759; x=1792679559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRqyIPckjjj0g7xkzxWkuaV4wuNTZ6zOy7JXpcrFLBE=;
        b=l5HqmvcOrC1oeXfMZdmBiVoevCm+c0KQ9EpwPALEUOBt8rJkE5WoC+e2As0KW6qb6p
         ukXCdnI1TZkJAg7fEosk8TEjJS+xS9IaRVEOY13+tuPdLrEP3wFeHOp7BdSC9HXnhqd8
         87Tp0DY9zHq2hOhyJqajBjnuJLaMeM7My9JkgSH3+KFlOr7lQ3OOnQH9cc6ynfqRVFlm
         fmMvfzT3kSXb+CpFOFRIw1KVnHU+ujMGEdNaY0lhl7ESbmzQSK3QCyaSCHFiCqSeb/KQ
         /GVOsC6IpWRnZKGbPgLLwGGP2eGJ+NOy0kPBCVaHZjSfzTuXlAGPsMlZdarO2bsE9Qql
         E1iw==
X-Forwarded-Encrypted: i=1; AKwUvBwPL5vzBfEw5HUS7ikpTYz25Ov/wUKE3jPfiIJdwEsBoWzbgi48AOlrvhA7jhTcWpfPkn5afOrLNfVZld0=@vger.kernel.org
X-Gm-Message-State: AFq9FYItM9RZyZVryHMThOMK4EJZYhGHQs9YkP/U8/saL0KfklrcdedP
	3ZORWtLni3LjhIy8Ri8QZFpDcH0sCfhkcJDXDV2LgUu0y41jzpLUdFXasao69NZZ0CddZekxuTT
	pmK4Y+XygLhasf8VebNhfyDLoeA4glVI=
X-Gm-Gg: AYBFou2S+yCX6SxOHI5RPjbTtsaThOmZDO84g9cOlbbPS0t5qxzod8qwT2P7Ce0iqTo
	RL7pW6B2LFNMXIn8135uBnYJ+b7Jged3l47uTDzQd3zRqI5/0FK5LVL0S+EAzJkt25j00U6fi10
	IuFi4qqTN0jDnNLmKrdn3+/q8A/GyRRbbXJ5Y4n4dtQK+VXdnEpT8Kq4ljn44N1YB26/Zw6fCYZ
	qvpKpVZE9aNl0dJGNUqFVZNzD9fU85yIVT91rsZWSms8P1hgV5t033M/hkmIWX4VwkzD3Cz0GH5
	yjb5wY1oo3d6ZzW0rLn0toJaxbdLaZcvE/8YFljznUAS7lOzHxUFfwbkxw2ydVtL+tyBkwIInvE
	Vmd4Br9VMP66o
X-Received: by 2002:a17:907:3f10:b0:c2d:c6e7:9e9f with SMTP id
 a640c23a62f3a-c31aa081161mr1927055066b.27.1792074759295; Thu, 15 Oct 2026
 07:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927005821.8369-3-kaloz@kernel.org> <20261015141508.3335785-1-ramin.moussavi@yacoub.de>
In-Reply-To: <20261015141508.3335785-1-ramin.moussavi@yacoub.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 15 Oct 2026 16:32:27 +0200
X-Gm-Features: AclHuK-bauEgyWck2g6rl7VlsT25zTvm0S-ajtBUtf9UOJHmSrypf8ZcxQeda3U
Message-ID: <CA+=Fv5SbeHqvF3vOdb34W9h84BMa3UnhikqVt+5hU7NGd=weUA@mail.gmail.com>
Subject: Re: [PATCH 2/3] sparc32: emulate casa on V8 CPUs
To: Ramin Moussavi <ramin.moussavi@yacoub.de>
Cc: Imre Kaloz <kaloz@kernel.org>, Andreas Larsson <andreas@gaisler.com>, 
	"David S . Miller" <davem@davemloft.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Arnd Bergmann <arnd@arndb.de>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ramin,

On Thu, Oct 15, 2026 at 4:15=E2=80=AFPM Ramin Moussavi <ramin.moussavi@yaco=
ub.de> wrote:
>
> Hi Imre,
>
> On Sun, Sep 27, 2026 at 02:58 AM Imre Kaloz wrote:
> > so a C library can use one casa for its 32-bit atomics on any V8 part.
>
> I sent a series covering part of the same ground, Magnus and Adrian
> pointed me here -- I had not seen yours, so we worked on the same
> problem in parallel:
> https://lore.kernel.org/sparclinux/20261015085545.3246951-1-ramin.moussav=
i@yacoub.de/
>
> Your casa emulation looks like a good approach to me. What I would
> still need is a way for a C library to find out whether the kernel
> has it: a library built for v8 needs to keep its own fallback for
> older kernels, and there casa is SIGILL. I see three ways a library
> could tell:
>
> - an AT_HWCAP bit, like HWCAP_SPARC_CASTRAP in Magnus' RFC but meaning
>   "casa works, in hardware or emulated",
> - a system call it can probe for ENOSYS, like patch 4 of my series,
> - or trying casa once under a SIGILL handler at startup.
>
> I know glibc does not want arch-specific atomics: on v8 the compiler
> turns the atomic builtins into calls, and glibc would rather have
> libgcc implement those with casa. But libgcc then faces the same
> question, unless it simply requires a kernel with the emulation; and
> uClibc-ng in my case keeps a fallback for older kernels. So from the
> kernel side the question how a library can tell remains.
>

I've put together a small patch series that lets me build glibc and install=
 a
gentoo-based userland on my sparcstation. The glibc fix is based on
Imres kernel fix. Not sure if glibc ever wants to carry those patches.
or if I'm even on the right track, but at least it works. I think Imre
also has some *libc project for sparc32 user land?


Regards

Magnus

Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BB243B4BB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247165; cv=pass; b=bHbjuv0Y9PHcrulYo1tPmQNcVKvJBsEQw2itHv3Ev93vXE3/xENz/DoA9bDsEGdOSccIOcX+fsf5JH37M9GsyyD7oCqfPfPDvcKEiefokYTRK7gTzdMDTcUK9DYUPR/jmZzLJD7JmpKvXe2IPv82MIBPHCalWzpJgc79xBEJOZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247165; c=relaxed/simple;
	bh=vyhs5y/YTTnUYcNk+ozWnq1dRu3YOv6jhE9CVtEaClw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tosCPKbF5mO7Bj1a5tbAnBtyTei0TpqdxHvgBfdfja86hsF6YqXIqteaXjkWvqO4IOoO7NpTjtbtKFgHxq1+4zbQlO38FaG5oORIZmD7IrMmYoBQIb4d7KHnt47UIQ3C6b6RPLc4Ies3m1qHBJ4pHIotomaXqhQE+VwN2AKcr+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ftm7dwuI; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ftm7dwuI"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a985e8fcddso2619456a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790247161; cv=none;
        d=google.com; s=arc-20260327;
        b=V5f7DYD4N+kzh2aFl277d52o9XKmbkVQS9j+/F8kTPygJZccSZaU0u0W5gSAS6R0aq
         Q+L5g0pGihJQbHnZJH/VPszIpaOjs8ZXJATTRQ90pfAJZnYunKWmvchlr8F8Lg3NLfAm
         Fv/ufZxDOkA+TNcB7LFa6SjoqEDA0/CIkxapsh3oV0AirA9nCx1X49tYxprvMNkFQZoL
         RyEoxTgMNqCGOmfOTzmVOBUfO6T7/D+8MAjk6ZrnxTpbGMByATuQKGICeQ2mPk9pZ2e4
         pI7cns/ylZT1b0OCeYSXyggZhlzwyFeLKQGx1qChe0JNOS0JLNQ+BiX/ol4Iim2PSkFp
         nAOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vyhs5y/YTTnUYcNk+ozWnq1dRu3YOv6jhE9CVtEaClw=;
        fh=R/AxZKzO003oEH1Pl61JxjjmeGYQ9mSvlGU05lyDa4c=;
        b=GKmp0XOsfFQ99g7YYIqIIwUtThf1EdiPw2Jww9LmbKM2M4LuG4YbD7eKDVaAMibfEO
         eG3x3Qc3fM6O/QxUZDu0AA2ctfgwCUbKsmgvg5gGSifUcFGOzbp7lmu0O92D+ay16Ihb
         gerI1FlyXFrlqwUgpBG06EvL4tg9esaZ3zhs8fTyHf7vNXaB0w7IE0YzzQQVD3VPJ7PA
         C5UmV8o8ZOtoaLxv+pV6xcfc1oIODfFp9JnxAPin0gflWry55I+j2EEscbMmuw+3yzkC
         ahKFUnbLZysN3hhvnMEIyefN3QcZR0phgdojCZdidtEprmmr1qbtyqpKHsqbIrHoj0Qt
         5RdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790247161; x=1790851961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vyhs5y/YTTnUYcNk+ozWnq1dRu3YOv6jhE9CVtEaClw=;
        b=Ftm7dwuIs1bTdmlQt+g/ydyxOBj08ijDzKK/FgTC5ZRuZi8CzIZLeF4jmGLR6YdDws
         HEWm2t+iva6/QlmVjF1zMj3nXA/g1ausZUOkpYEfMXhp5WqwJOG0Uw++WlGkdrwvvW6/
         N+6XqS5mAVHSaquywptqpWt7P8P0NrehXbFdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247161; x=1790851961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vyhs5y/YTTnUYcNk+ozWnq1dRu3YOv6jhE9CVtEaClw=;
        b=v891/DLx2+1ptBjuDrhU1Z86xH7nRcB/9KfuDuBek8K9DWMnAQft7DnXXQ/z7K1wI9
         V+D3xdoisiDqZUYe49m+rFEn1iyuh6rFJ8CWKv5rY2T4KB5sZhy7oaejFbNqtju1fgY7
         N9KeOBoJz8cg38CPqAL7Ax9J/ljJSseeNBXqUD3XxCPr3rylLH6I2gqdCMOFZYqkD5zu
         TvwBCQ9DdCFYdDjP7H6DUR7YYhdVCx6PaG4FfAHg3Cem8t2WZvjtiG7vgCZnklsYKieb
         EqtRwfmpUEFvWolWJp5lr97/Veuq5Ld9kYwb5hwLn9BmlgRmEPRLaewU6b+f7x9TYt4q
         Tz+Q==
X-Gm-Message-State: AFuF++nvAh3hLa5mkm5gYvqJfrfP1zZsFkWQK2qrhsB7QHHfusG6g1zo
	615ddm3O77+fB7PR0v4UeOnbItjVGC6r+AfocuNEfEZGQkNAixBNlo/FYcKtd7MhodLH9M9gplk
	Y8kI/2pEtecyl8UWPGs/qUazwpK/BXj15AuXnApDS
X-Gm-Gg: AYBFou2Z3IsThrOOGv04n7EveV7NcuFXqSXr+sZPZIyRn2ceUs9Y/WHLBim7nG2+hs/
	8oLFcOjqzSxaAo91I/sPaYsJj1ajInLrz9+nzaWaLjAB3CRryUrtmJZa47pGu1a2cjMBhlkW8uA
	9ziVRM0ZTvpPpXHbyz5AQbIpDuiVCJBwgOjfcbCX4lz6TlXZjlEjrGf7/u7HpgjAXeBr4iRqxiD
	SO+Ig3xV3jvZOdj0O9L6Sg1WGvjP1035r4wEZnKMjoiPyGcGbEoQYDWZes9MOl6sE3LePa8ImNA
	Tkt7rHl5IR1cFeL6C/FW1XnH3d8lqV0VhwlInb790gw2tr/DAMHh91X9EPfDpdfo0jHmG0lvRF7
	GK0d+A9+ZpaObZ2fBaMq0
X-Received: by 2002:a05:6402:4605:b0:6aa:9788:d22e with SMTP id
 4fb4d7f45d1cf-6aac8f40c51mr1431271a12.1.1790247161046; Thu, 24 Sep 2026
 03:52:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910090512.1197517-1-jaszczyk@chromium.org>
 <875x0cymr5.ffs@fw13> <CAGptq8F7MgYt94QuCFF0hRGDAw851sK_xByBJc_cnUpYAF2yMQ@mail.gmail.com>
 <87qzis7v22.ffs@fw13>
In-Reply-To: <87qzis7v22.ffs@fw13>
From: Grzegorz Jaszczyk <jaszczyk@chromium.org>
Date: Thu, 24 Sep 2026 12:52:29 +0200
X-Gm-Features: AclHuK8zbxyV9kQQ0v6Y7sn8suvktLvZjWcQOWX3J9AxKFXnUHzvWIw6npUZhJQ
Message-ID: <CAGptq8GnhBVAFNhPETsfVYY6YCO4FXvuKi5Ex7hee9Z_o9KkNQ@mail.gmail.com>
Subject: Re: [PATCH] x86/apic: Switch to x2apic driver early if x2apic is enabled
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, dmaluka@chromium.org, vineethrp@chromium.org, 
	chuanxiao.dong@intel.com, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, Melody Wang <huibo.wang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:20=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> =
wrote:
>
> On Fri, Sep 11 2026 at 17:17, Grzegorz Jaszczyk wrote:
> > On Fri, Sep 11, 2026 at 2:51=E2=80=AFPM Thomas Gleixner <tglx@kernel.or=
g> wrote:
> >>
> >> On Thu, Sep 10 2026 at 09:04, Grzegorz Jaszczyk wrote:
> >> > To prevent this, check if x2apic is enabled in hardware during early=
 APIC
> >> > call setup in apic_setup_apic_calls() and switch the default APIC dr=
iver
> >> > from apic_physflat to apic_x2apic_phys immediately. This ensures tha=
t any
> >> > early EOI writes use safe MSR-based accesses. The driver can still b=
e
> >> > upgraded later during the normal APIC probe phase.
> >>
> >> That's really the wrong place. Initializing those calls has absolutely
> >> nothing to do with the driver probing.
> >>
> >> There is quite some historical ballast in this whole APIC driver
> >> probing, which I never came around to clean up.
> >>
> >> I'll have a look how this can be done sanely without replicating half =
of
> >> the existing code just to paper over the real issue.
> >>
> > Ok, understood. Thank you. Let me know when you have something to look
> > at or test.
>
> It actually needs a larger overhaul because when the x2apic_phys driver
> is installed early on then its probe function will prevent installing
> the cluster driver.
>
> So your claim that any other driver can still be selected is only true
> when ACPI invokes the MADT check function, but not via the probe
> mechanism.
>
> I'm not really happy about the untested below, but something like that
> should solve your problem and still keep all options open. That patch
> needs to be split up in more digestable pieces.
>
> FYI, I'm on vacation and only sporadically at the keyboard. So if you
> get it working feel free to polish it up and submit the whole pile with
> a "Suggested-by: tglx..." tag. It definitely needs some eyeballs and
> testing time in tip.

Thank you. I've just sent v2:
https://lore.kernel.org/all/20260924104102.3534474-1-jaszczyk@chromium.org/
based on the above with some modifications described in the cover
letter.

Thank you,
Grzegorz

Grzegorz

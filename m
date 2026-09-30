Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6B2502D4A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785645; cv=pass; b=Lmpsua54p8wJioLDW8w00hguvcx000w729gKzex2n5JSBnAmBtRXhdvl6FrJGsLI+OUPYz3R6l5cvf7YOzQP7RR0szuUrx8seWPNKXzjRQoYybfhX/i4AIBdm5yTRFD76e+CKTDdLwoYq37Mq55XOqx6t0MY5n4txeaQcHPELb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785645; c=relaxed/simple;
	bh=wNXYSE+BizmuyxUThnUdjTsMAxh7gdhvWAllvmS1uH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQeWikWgBEfKbQqKS8imTMqa3x/ZJicER3TmpqFWEuvC0kMAvtAI5/7Rn7vSVYNvlGe4GDg1snFLZQTEpP7wourxOVaHYxh7TUeFGtlN8hqPEkbYIDB6TKBhWEFKZw2ETpFIk9Gpq7DqDCBaBceQ9emjjgobkJK2G9Dli4ZTuGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCRnRObt; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCRnRObt"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acc708a766so245491a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790785639; cv=none;
        d=google.com; s=arc-20260327;
        b=H2SYV2lBSnH4nu1QlFu/PRLXzs6P4c82qFmQzLZ+RQgsDKyWCipsXQQAlzyrCY+zZP
         9521fDNfvLjlvJLHL50O+INlWa7bFRP50dZ8s+RMGuuV1ob7xF/v6QBSyQbeLhm80LAt
         YCDTul1EVHwNBWUerMgvJ1HuNhGiCxh6FEoXHjLcBAegA09h4qOqMT6b8NloXIPYpQZA
         mwc+hYOQSa2QVUkzunvHjr2HGw0cfbsUNYJBcoBE+ESgozAISy9esmajpilSV8WKEhdh
         wQgFzbYwqRSzoM2zlFicL75NEWxxDS8mqo/yGZOkoXhvMm4USktKbPH6PS+aDi3mmuUB
         CRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OjQa1xcY55UbS6TWLrXPiY91xlqpQ/9/JSfN7qtQQBw=;
        fh=VOf6Wp7YiWwoV+JSkx2YrTgq735cfzaOFrPVeC7fMNM=;
        b=Afgtdr1HnQ4KBMcgO/HyATm1KtzwNWqx9BvJDBTCk1SmhHkMj/vhUBlPDYfUk2hnKk
         8a1hQxwrLxjwRRM1GAkUGgDWWv2v6I44EKeDPrs+VsT+P76zgP//sQ8SJTvvwkOAtx8p
         ADuMH7l0gJXG/AW1M2qB92N+Fibq8xVYE7oSXdocyY43TZsv47lIa9gwxCY1VF+xkDkh
         /Q3chUkdS50oDkaHhnGLB29z8DHV0OAcxtUqM/1zSuHEhcHRn3VagSHCOdxFzAWPEN+3
         PE7ThC8H7bm5I+sttAcjxpxOJ4MOcATbxJcN194eqJZs5movwgK3U9aqLSYhRCraSCd2
         Smpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790785639; x=1791390439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OjQa1xcY55UbS6TWLrXPiY91xlqpQ/9/JSfN7qtQQBw=;
        b=eCRnRObt+X44KIPVjho4/LwPoyBMKjaIoOI3zyPae8q5trpBDO3MlICdfEVCsAt1EK
         yJMdSXgoHF64NSm7k7rYm6QMY9C3toMewwYlGdY+Kd2bkkobpzJb/a4RAlcMKITIugTv
         ZT/Mou38QDS7UPsN41OddrJAT5dbWqt5J3wDDEyPnHYArMGn6OSluSFxbR1YaoC2dX/q
         VKRyE8FQT9MgwXwtuJCo+1n4gXIg1YCp7geF9guTRpL7njJXXtKOOXfkYAIfnj7zEuQj
         D0uxCT39Q8Sk0/PNIaEO6TW4p2YhXxsLQ+esmvAWoYrdd6CvigsrMAXUE82SWEdLmAJW
         64og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785639; x=1791390439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OjQa1xcY55UbS6TWLrXPiY91xlqpQ/9/JSfN7qtQQBw=;
        b=EtTZjJidkbS2grKfa1NiGjN4ZPfG+EgBGs9aDHyUcOn2jlOmufSijPJy5q73cTkMdf
         7WkhMJCYoZFHVmyDMuifHI2luz17LZnSfx867Yx5PIr3Odr7dMxrAnP4XUsKtBmy+Je7
         28wBoTpK+DW9Q077I/BC++Jc61g3787uHBdulhDGax96OlAsuunqC8o+Uz6/vkjmSiRy
         2/+uDsFpTWyoKajUXOvuR1CpI9az+UbfF+Jvq+7IFWa+P+Xa2TERbZ1igG96OSYewnQ/
         BP8A3n+RkW1LM767po2ZmRBS8wEqRmKrK7nfQOPxQfPsF3D8iJFaHKxJhfNMVfjv2m6k
         q2lw==
X-Forwarded-Encrypted: i=1; AKwUvBzkMemgbIeovDXgpIjo5QYWxu4kAwP79SsMDFwLz1hEURc+Wu53CRXW6NNfOT/8d2PAW9LcJqYkx1pZoLQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXoYMn3waPIvUKhZWA0OTwu5MzEd9h7O9uNPidzpcBjj6AiITa
	I6BpNqO7amMvdL8yYSTO+exA3C9U0OKj0TSrNTJ5uzNsTurXmW4sBJBI1hCwpWvBaWxanp3fTY7
	2WkZKciibp7gP/92BM94Fyewv2oBMdlA=
X-Gm-Gg: AYBFou3QIbMuV0UUpmRAmCQvZ8mLlDfl/LOJwmS6/7E6Bpb8snGH7nZS7x1wFRQsH8N
	ZLXMiEp63bdd2Bfa8DGSIr19Yoh7EweCxMnYr1PwnngAqHqdTd6SkXcQFWrQrShgR3Ljri9AuCR
	LqvDDHS78eJlQbTdOzR5U2wk2jqQQfKw+HcqtYVSL8b4cxnlW3GPttn7Lx/LLSAwXLF2PjyVWZ6
	tzVTzcYE8nToTRDCRQF/GQHX6+hvi+uNedY2938Osjx+VVQ5pTJvktjuqtffryMpxvjkkCo0WDc
	mqUNHVfZeV4E+wQL+PImcy6mlReLihNf4jfQTVTM5raDtr4Q9k2vXCDvTXxtEa8J+b3ikSlpsrx
	s1+h+XP9mlpE=
X-Received: by 2002:a05:6402:538b:b0:6aa:ab56:aa93 with SMTP id
 4fb4d7f45d1cf-6ae199450c0mr1576865a12.3.1790785638560; Wed, 30 Sep 2026
 09:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926184154.3017929-1-nicoyip.dev@gmail.com> <arzUadtDI86btAMj@hovoldconsulting.com>
In-Reply-To: <arzUadtDI86btAMj@hovoldconsulting.com>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Thu, 1 Oct 2026 00:27:06 +0800
X-Gm-Features: AclHuK-2olRzMYoDYcjB0InIT-BBwwmXaknCmT4Wi79CIumBAaiqda3Jqn9g6oE
Message-ID: <CAAo+4rXdFLRgLcY5WZ12yc3RyyX-JRnmvXo2Zm7oJ4pC540iGg@mail.gmail.com>
Subject: Re: [PATCH] tty: Serialize saved termios access with device registration
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

On Wed, Sep 30, 2026 at 5:20=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Sun, Sep 27, 2026 at 02:41:54AM +0800, Chengfeng Ye wrote:
> > tty_register_device_attr() frees saved termios data when reusing a mino=
r
> > number without serializing with tty_init_termios() or tty_save_termios(=
).
> > The tty_mutex held by the open and close paths does not protect against
> > this registration-side free.
> >
> > For example, an n_gsm mux reconfiguration can register a device while i=
ts
> > previous tty is being released. tty_save_termios() loads the saved poin=
ter,
> > registration clears the array entry and frees the object, and
> > tty_save_termios() then writes through its stale pointer.
>
> Thanks for reporting this. The intention here was that the TTY drivers
> would not be reusing a minor number while it is still in use, but that
> is clearly not adhered to everywhere.
>
> > The saved-termios
> > copy in tty_init_termios() is vulnerable to the same lifetime race.
>
> How could this happen? TTY drivers should hang up their ports during
> deregistration so this shouldn't be an issue unless we have a driver bug
> (which we do in n_gsm apparently).

Right, I did not reproduce or otherwise establish a valid interleaving
involving tty_init_termios(), and the KASAN report only demonstrates
the use-after-free in tty_save_termios(). That statement came from an
LLM-generated draft, sorry for the confusion.

> > KASAN reported:
> >
> >   BUG: KASAN: slab-use-after-free in tty_save_termios+0x39a/0x3d0
> >   Write of size 44 at addr ffff8881012e8180 by task poc/114
> >
> >   Call Trace:
> >    tty_save_termios+0x39a/0x3d0
> >    release_tty+0xb3/0x7a0
> >    tty_release_struct+0xa0/0xd0
> >    tty_release+0xc1b/0x11b0
> >    __fput+0x2f8/0x9e0
> >    fput_close_sync+0xe2/0x190
> >    __x64_sys_close+0x78/0xd0
> >
> >   Allocated by task 110:
> >    tty_save_termios+0x2c1/0x3d0
> >    release_tty+0xb3/0x7a0
> >    tty_release_struct+0xa0/0xd0
> >    tty_release+0xc1b/0x11b0
> >
> >   Freed by task 113:
> >    kfree+0x131/0x3c0
> >    tty_register_device_attr+0x498/0x8b0
> >    gsm_activate_mux+0xfb/0x210
> >    gsmld_ioctl+0x92f/0x14d0
> >    tty_ioctl+0x915/0x1240
> >    __x64_sys_ioctl+0x134/0x1c0
> >
> > Serialize the saved-termios copies and reset with a private mutex. Taki=
ng
> > tty_mutex during registration would invert existing driver lock orderin=
g:
> > UART registration holds port->mutex, while tty_find_polling_driver() ho=
lds
> > tty_mutex when calling uart_poll_init(), which takes port->mutex. Keep =
the
> > new lock confined to the saved-termios operations, with no driver callb=
acks
> > inside the critical sections.
>
> I'm a bit torn about this, but I think we should avoid adding another
> mutex in favouring of making the saved termios reset opt-in.
>
> Clearing the saved termios state on device registration doesn't make
> much sense if a minor number may still be in use as an open TTY would
> prevent the termios from being reset.
>
> I've just posted a patch for this here:
>
>         https://lore.kernel.org/r/20260930091938.1715754-1-johan@kernel.o=
rg
>
> Johan

Thank you for preparing the fix. Making the saved-termios reset opt-in
is a much cleaner way to address the demonstrated issue.

Best regards,
Chengfeng

Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E633B9922
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242721; cv=none; b=rDZFjEFmKbtTycH1W0c8Prmk6iBvfhg6y6qFEtJ9foKF9eQVv97uIfMVZM0inqLP3tpuRyqoOKbPCgNDyT1VIb6Z14SNlt+v2g7A78TMEOH0B6GWWOYJybMngxwuK8Qz2AF+La7eh9TDqY8PSvVDT5EF0/MADYl0FNR1jkcRSoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242721; c=relaxed/simple;
	bh=gU+WI2i7LDEKT6RINnzIXgb5K5O4tS+U3cDvjUwa9t0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFBBqeTyAQ2pA9Sn6jidZk7klsA9daHYS2PdWw3NlXL+goMEqPou49evP0Fhcupp2tmHk2FSEpcsnVWBb8zQFml9HnsOtDzb6OvepmKhYHNkr7UN/rKjF3I+ttQUfl7IdigmLPhg7HsCsV0wZW5C1SbaHrcY3JeSddkJSrTo6Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a03fe69236so677770137.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242719; x=1790847519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpeffu0mh4OhtQGcEkTfxWhGK7BSRsx5zqS/No2TWCY=;
        b=tEoph/C3eQk4J/ZKbBBQuJVR82OlKmy+dPi1dTuHs/c3vVmDgYgvMjWKJZtEQj+eSu
         1oCAvXZIvOiQIaHuFY9UVT9sdTqGa6DNfmp7XX8wmp2CVkCyCmUrL7kz96/9IlBq/iz2
         LhyUdVBtrD3XmWmrCMOac6iuHh1qbl9+ejphe2WmbmfNG8EVERyVEjazNCSMfEkgyDz5
         GzkdUifcClg8QYtZexey8y0P1xPDK06LdwF/dBVkOYANfFvFyyOAbkj/lCNx/jcSpr/O
         wGIn0PIXipt6T/2oN3P1qndFMB+BU7M3hHWR8aLji1hqSmNPLRxC9dQ6oj06ohOXsehi
         j5Og==
X-Forwarded-Encrypted: i=1; AKwUvBzMO2GaWYDgE681W4fTc2b/F2Q+H/U2YKBt8Ht5sa+mhtE4ryUnhLq6CbqsIhd8OkdcqP9cYsMON0gvyL0=@vger.kernel.org
X-Gm-Message-State: AFuF++nak46b5YkwrXA2EPRVdyrxlsg6WN3fnes73lbl02g58uFhV/7V
	F/LvxWvOQqHxKi0iR3wchBwneajjNNMvyXoQeuCui39ay32LiditYoFz0s8mjpHZw3A=
X-Gm-Gg: AYBFou0JznrCh8IaskcS2j5CjWGXvkjbRXCB7a6mwQe0RRPVr8YIGTgAJ6+zt6167Jz
	+3DSEzn03+s3zRKNx+bwYC/OH42hACtoetY9y4bI00nvkuxeZhwmV25D8KcAuySjXn0sqlqysQp
	HJCM2+k8/9EIipBrlW1sOstn4yxFvVuWyGe5p3xC46nBXVGPAioJ7PDU8O799z5nqM+1utEMoUx
	9bu14neF8/J9L/czpM9fFlWgxkzZiiSDUKwlCCB5S7k08QuZKDUaQXD8JdZudoz3JNeTuZf3qkJ
	l5AvCV8sQ6pC7bdhBcwFLMjlW1kL3vQctyooIbShOaSiNiHAyDXB0VHo3HfpOUzhVR0KzZbKbVA
	Hjq4h/7FGblY/a43UqTJGM6OUDnuiH5BLt1kCDberW133nECvZEg2QjgzBjUUKlgDE8Qh80iO99
	+DhPuOLbpg2r67C71XSykuK4RXWvNiry/hABbZEtizZIQXit+2bc6ms6Q9y/ejkPvfZE/tivDCh
	qdcDVf2Mr7+M5acPgaLdVLtPwV6AQSd4PRSDw==
X-Received: by 2002:a05:6102:869c:20b0:7af:858a:7bc0 with SMTP id ada2fe7eead31-7af858a8051mr210230137.30.1790242718769;
        Thu, 24 Sep 2026 02:38:38 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9851a07144dsm5712381241.9.2026.09.24.02.38.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 02:38:38 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c72bfe7so649121241.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:38:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwNScUqr208JL9n6iiP6TFu2q8yqQwYtgDpnzO0eanYN41F3wMNm5OupCbz4Tm2Wt1EUSSEzoMlkJxhkBc=@vger.kernel.org
X-Received: by 2002:a05:6102:524a:b0:7a7:12c0:f061 with SMTP id
 ada2fe7eead31-7af1cb979b6mr924094137.12.1790242717699; Thu, 24 Sep 2026
 02:38:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921232551.3129244-1-robh@kernel.org> <CAMuHMdV7D4RZ6zA_0jBqnCz8gee2=9bbNAXETbbNQxANhJ5pZg@mail.gmail.com>
 <CAD++jLmvZAen+p_Z-aVSqUnXMChAa7qbNvgv=mEQr9tFMiJFwQ@mail.gmail.com>
In-Reply-To: <CAD++jLmvZAen+p_Z-aVSqUnXMChAa7qbNvgv=mEQr9tFMiJFwQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Sep 2026 11:38:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe0vGnyT9E1abK5cFTJgA8=U4mMsaMJAFJsXCAcJf9qw@mail.gmail.com>
X-Gm-Features: AclHuK-4KFW8W7QHV9HlBHDtlVrNb0OLmBx3KedI1dCvkL0eI5l2kFSSP5LQI3w
Message-ID: <CAMuHMdWe0vGnyT9E1abK5cFTJgA8=U4mMsaMJAFJsXCAcJf9qw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas: Allow power-source
To: Linus Walleij <linusw@kernel.org>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, 24 Sept 2026 at 09:25, Linus Walleij <linusw@kernel.org> wrote:
> On Tue, Sep 22, 2026 at 3:19=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
>
> > > +        power-source:
> > > +          description: I/O voltage in millivolts.
> > > +          enum: [ 1800, 3300 ]
> (...)
> > drivers/pinctrl/renesas/pinctrl-rzv2m.c does not implement support
> > for PIN_CONFIG_POWER_SOURCE yet.  So I'd rather not advertise the
> > power-source property in the DT bindings until the driver is fixed.
>
> The DT bindings are used by U-Boot and BSD too, what if
> their drivers use it?

As this property controls voltage, I am mostly worried that having
a user without implementation may cause ill-effects (damage?) on the hardwa=
re.
With the property missing in the DT bindings, we at least get a
warning with dtbs_check.

Fabrizio: do you have access to the hardware?
Does it work? Perhaps the SDHI driver fails to probe due to the
unhandled property?

> It's a bit confusing but we're essentially maintaining the bindings
> for those other projects as well, and it's why, for a good reason,
> DT maintainers originally wanted to split out the bindings to a
> separate repo. (This didn't happen because nobody wants the
> job of driving and maintaining that, binding maintainers have
> enough trouble as it is.)

Sure.

> I'd say just apply the patch.

I can't seem to find registers to implement the voltage switching,
so perhaps it's purely controlled externally, and the property should
not be described at all?

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

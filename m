Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C019495ACD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601271; cv=pass; b=QaX7nY/1PpyTv0zAov8rn4Sjx9AYg75Q+xKcwjKt9UEI57HK+g5gYf7x8S1PS2HfH+qMFCq9Fp0LFFatJVhgzU5Cbyy8+VfzEstrNjltfWZa7Bb5QAH7kQflaGvj9Sk8BG2rj7uwIUTUBiSmByE9mzBF6cjDO0Eciu4IO3kVF8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601271; c=relaxed/simple;
	bh=7FMXwn6+GHUh4aNYqqrblQkMwpNa3JC+tTZQDMGtYtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHN927YcNMCUZGBFqEh93CPcJuHR8alU2DeEicUimhUmoU59WG0vODcOwNA/hJfctufUDlKHvM1onMNU4W/8TgRZjZKn+v65gCGDHg2WqNAMaKbibMrEAo3x8qDFnYJLYkHA23I7uKBJZ8BKFzxcvq9krIbCqNc++lUmbuGjqqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oenhC3Gf; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oenhC3Gf"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aaeeacce15so4217797a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601268; cv=none;
        d=google.com; s=arc-20260327;
        b=lkrYf3xMfyEso+D9rCvbZtax0rPD7hhnaHh6xr0PWM+Sui4ceL1skj9CmHIXLF4Ood
         qou5kdK1JG8Ye91ioL+ZbCPa/WONn2UuJlfO1ZFr6/hDKDs5lHpAsqO1HMz5lbqZlPDG
         snbBd7ewl3PYSSRqZ4e1/Iz7WyR8ajTRBDh1z4+8Eq2wzpLCO+gzlV12TOgXz0dPmFRr
         JI0EYidH7l1A4HGQctPaVAGqRHfOODYG2HbUOHh6rqTIpj6bHHI35Dv0CJIcdL2X+8ob
         nhoG4DkchfEZ9/p9XdlXOhao8pHkHI35X4gSBmlhi1M0CUdBNOa4kYWrLDiA0pAdC6g6
         fEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FhsZECsOB6gnXC6gOibbQkmy4eQeDXFt2prA07YbYQI=;
        fh=rhrkFp1gM8p20bO5dy1+eJD/YhAo28VjBn4zJ0+XqXM=;
        b=FzbhzZPE2AATmjsI97CxmjmJdE/dCPqRfcU7jFqrGR8tjwksd1Umjp2IF3loL2WT3a
         OWhcymYpFazs3mh4snPdxRlrvJlptD2c3RVlzxZQ9k14hyQHXMlzimuVq7eKbYy50WSC
         2gQJI1KJ1ZiTX0HIT5pYnAoXRxQZ55/e05MKWvfvpcAo21ZP702zTnDvDRYl2abby6mU
         BOI4X9fzo1dqjxxj793NPrLMHeXZCZUQi35h4CyAxajqJkE3zvQ98cARPJPMULaQh5hI
         XcVzsKAhPYD0qz2wWkJCAbVi8Y9aTyC10w+E3jrFDR20kwbkbVpVjjeKyts7FhZugLqy
         J3Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790601268; x=1791206068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FhsZECsOB6gnXC6gOibbQkmy4eQeDXFt2prA07YbYQI=;
        b=oenhC3GfofzeeGFTLIHtLq/IwCBUdsm7TKQCqAb8Ky0IGJc+B4rSMevqgq4sBh/hSH
         ACWLPlchPXG3EPgMCHETdKPTETxrkpDNXBPGu6at1uHPAf7Bs3H1/4l4rUO6C562cSAm
         P2zNaTDJqSCmTUOOJlLY1y1QcmtK4HokMD93701XwFP3Dwqx6g1UmsgpWayAwH139xPM
         Ln68e33cbL5FeRLkn3m/OD8Dv1SX/3MD8KUai5twDf8IoIEoiSfqO8E6XttctHe+IRId
         Vtu8rLoIPEQjr0vhsTnSEk0EiEAdfimrydaF/qCyWDy35bEgRmYP6PhdrPMIZZhDg8YT
         KXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601268; x=1791206068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhsZECsOB6gnXC6gOibbQkmy4eQeDXFt2prA07YbYQI=;
        b=2HzLt5dwIgAWGGtYURO65/REG67T+r+n3ZXftRGUYivpXpvku8NlTNZ6Fih4xLaVD8
         YbvVooH2HCPpZVojSXipbiHKOTgIgw/Xt5DzeSD4NTMmHieOWhCmi8rgT2+/290iHHnv
         e8BuNovoQEFHTkhI2gNxxg33yN8KfLy6Li5wUIoiqat+6pJ6I5sEv2SEMDnfnoJBalpg
         RoU9uMuwTII/q7xF3WKD3e2B2h4/+j2lRMiQKOhFSCFuUcXB0lPBW1YTxXDRF7Oimi83
         TJ28YnJW8wmfDQ/ikYaGOAtViFbIb4HSfF6eBEHVSen3cIQFBdRFP0lVn6BwYKj5DsZg
         3Aow==
X-Forwarded-Encrypted: i=1; AKwUvBw66GTN8Do9Ed4FuYe46PydVIzYMIlm3F3v4W4Vxwcn66bJ2+Oi9mNC6jklGMnXReqA31pZTSV3EKyIkEU=@vger.kernel.org
X-Gm-Message-State: AFuF++moHQPENNZQm/MhcFp8vttHU6+NoUoODOIV7a9s77UwsrllKhLV
	mTScS0R6A0ufvzmrKuhe1UUuwpnF/M19JROz5hCJNHhTizlnP8uWUubERTrsbnIWPIaE3PnQOY7
	gDRH6UGipVWlLzFhha7vwNgIhmlAncA0=
X-Gm-Gg: AYBFou0DV0Z91XoFbXEhS7bfpgENC8nkGxiOiU1ZkKvP+IcJGMEdIv8xn3YgwuqWglR
	nj3FqypxH1/54oVO9a2Wgt01bwHcJrENHUk5UuT9TD7EiKtn8UUAMUPZNnyfgmmmRR3iqEyYnAz
	3F98jf7vDMKnHrK+/9xpDLO7SHusooJgyYgXropl6HDo/ATh8xq64wuygvsSzaNAbXdqKN5qaLM
	XEdUMKflDPOPoPiwCsgpGZp37D0KAqloNguIPKxC0IEIFhjdeEfYcE+C1SjdJgnC2j+BgTSoORJ
	Qlu2YT/RvNYsWyMRtvhwgCyuTbjBHyupq1L9qVaXow4XDiv9IIOQiV9tSvrPqxYlbAqg3N+mRaG
	cTptUA4Pe36U3UfZ0R+tSKeX1Uhw78dCmF06KDdZbVBh8rRLvZk+JEA+p87D/fhGzVVL1k3tmDN
	Ng0WQgvdU2ZWUCdxZ0iQ6Bgnbo5Kp4PrKH9Pl1EePg
X-Received: by 2002:a17:907:e1c1:20b0:c2d:bd95:874a with SMTP id
 a640c23a62f3a-c2dbd958b3cmr281456466b.17.1790601268525; Mon, 28 Sep 2026
 06:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local> <20260926100727.GB106095@black.igk.intel.com>
 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com> <20260928123446.GH106095@black.igk.intel.com>
In-Reply-To: <20260928123446.GH106095@black.igk.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 16:13:50 +0300
X-Gm-Features: AclHuK--Ilfy_nPKbrnV7apmqqwQGd71tXmOohH_PP2JNPHku9hQX5r2VX8JdS0
Message-ID: <CAHp75VfxMwLMPDQr9f=3ea8Z+5zja=kT01o-fhkyrc-V1rh3Hg@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 3:34=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Sep 28, 2026 at 02:34:44PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> > > On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> > > <mika.westerberg@linux.intel.com> said:
> > > > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
> > > >> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
> > > >> > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
> > > >> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski =
wrote:

...

> > > >> > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
> > > >> > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
> > > >> > >
> > > >> > > These are interesting drivers, not sure where to put them
> > > >> >
> > > >> > IMHO they should be there too. We are maintaining them both.
> > > >>
> > > >> Do you send PRs to Bart or you just rely on him to take the patche=
s?
> > > >
> > > > I don't expect these two drives to get too much attention, and they=
 could
> > > > be contained nicely inside intel folder and that would help Bart to
> > > > identify that these are Intel drivers. So your bandwidth would not =
suffer
> > > > even if these two are added there. Your call.
> > >
> > > I'd like to avoid a situation where we have Andy's Intel drivers unde=
r
> > > drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I'd =
prefer
> > > to move all of intel GPIO drivers into drivers/gpio/intel/ and have A=
ndy
> > > gather changes to them if he agrees.
> >
> > Okay, we have two parts missing:
> > - Nova Lake driver (I would need Alan or Mika to step in as at least a
> > designated reviewer for that)
>
> I suggest Alan to be the reviewer if that's okay for him :)

If he agrees, he can provide a patch on top of my series to move Nova
Lake and add himself to the MAINTAINERS at the same time.

--=20
With Best Regards,
Andy Shevchenko

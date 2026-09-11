Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405063AAF6B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144668; cv=none; b=gotNJqe7vOEsdYuxXmSWPILm14+WsLc+9ZXAtNgeAJzjWuKViJEcg3e+wIeQQ4fkkEQIp1OXI/IvzQzU3tc/U7SL9PcclVaPKiCBbFRacSCxuDEnpH1/jhvJ4tPHlGbmYGJoUUQNsqfNhz6AWJDQKnxG5yr4lE8r2DpgL11femI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144668; c=relaxed/simple;
	bh=+lCReAupk64gpiSe08ls12n1ChqHpulbb8/AvO34BAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=odDCVUoYG3mQ3Gk+HzhbdenlHM6/ZZ9XyxAXJXiJ9r+PNdPax9oQjnUhagKP6oQBqFN+1QY2hrzpLOfAH8WTP+Qln/01rmsGB+Mj/h75AbuDv6FTZc8sGJFN0ZkBZvbS3IUGfyIuBEBYjKr97Eqh2t68VYLqX5Gelm+WuDW2Vok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9c8atDJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9c8atDJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7E61F000FF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789144665;
	bh=76wiPJRZNmxzN9bJyuSQ6Y894yEiZOjODjZ9CGS2wUI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=b9c8atDJp6WErWuAC+PPlBJdw6sozmOniQXN7wexK760S5Ogtwn+JEbjDb2HUD5F4
	 hSccTLiLj+jX7WTHQv1cPgB28XkSGtIV7ZM2Q5nTbaFIs9nWeMmS8AFpDwn9Hit6sn
	 TQvWGBehP/oaA7Ud3gTzfP4I7SReoQs2psgAxVGVysacqaMcXvSgFK2fdmWNALNuMm
	 smvTxCBSeneupvIxDQS+63+01OyUIPZzTnI+CcK1+1/ZVnhJRQoXxpv5ZzQbmkAZhL
	 920D3822cHMJmWL58Fbi6WmodneKgwk8oov6YRgXqzbROeElbDekyLcjcGKnrxIzgv
	 WzD5FczmCY/UQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a302c23fb2so570011fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:37:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLBYFaPY1XSvEIBMXretr7nalhCnxocnAB8OdEEZaW/vMLYnyidzJQlsLyHJQxpm52LP/j89vgsmMl9P4=@vger.kernel.org
X-Gm-Message-State: AFuF++lxhQBIzuA8T7XavoP/T1O8MXt1RIRd3eqenQVLRexPMeYeZwsO
	3IP4E5OciBiVHkFpFQao5vWKCq+0lt9CcQoYfpaLsww4/PpcgQQlXFL2PebwxhPG0Qsi9S58rSy
	9WiYtoYE5VdevkRRF0aBNzOqcWWx7n+I=
X-Received: by 2002:a05:651c:31c6:b0:3a4:8913:a259 with SMTP id
 38308e7fff4ca-3a5a52919e6mr5885751fa.29.1789144663441; Fri, 11 Sep 2026
 09:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1965933.tdWV9SEqCh@rafael.j.wysocki> <2362345.iZASKD2KPV@rafael.j.wysocki>
 <aqQtIMm-gdJoZAsq@ashevche-desk.local>
In-Reply-To: <aqQtIMm-gdJoZAsq@ashevche-desk.local>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 11 Sep 2026 18:36:28 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j5B4LFbrhSuw0j=fLcY+cFFTEMvyt_ED-+9j1dvQEqLw@mail.gmail.com>
X-Gm-Features: AcwNN1XwkLeDpYq1RpMmMI8qhb_p4hoakRby90KH9iWy3HgsTfIekcu5H-JCDAI
Message-ID: <CAJZ5v0j5B4LFbrhSuw0j=fLcY+cFFTEMvyt_ED-+9j1dvQEqLw@mail.gmail.com>
Subject: Re: [PATCH v1 04/10] ACPI: processor: thermal: Use thermal_cooling_device_create()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, Armin Wolf <w_armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 6:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 11, 2026 at 03:02:53PM +0200, Rafael J. Wysocki wrote:
>
> > Instead of using thermal_cooling_device_register() for registering
> > a cooling device in the ACPI processor driver, make it use
> > thermal_cooling_device_create() and pass a pointer to the processor
> > device representing the given CPU to that function as the cooling
> > device's parent.  That will cause the cooling device's sysfs directory
> > to be created under the parent's sysfs directory (among other things).
> >
> > Since creating a class device under a parent causes a "device" symbolic
> > link from the sysfs directory of the class device to the sysfs director=
y
> > of the parent to appear automatically, remove the code creating the
> > "device" symbolic link from the sysfs directory of the cooling device
> > in question to the sysfs directory of the parent's companion ACPI
> > device.  That ACPI device is reachable through the "firmware_node"
> > symbolic link in the parent's sysfs directory regardless.
> >
> > Moreover, since the cooling device is now located in sysfs under its
> > parent and it can be easily identified as a cooling device, there is
> > no need to create a "thermal_cooling" symbolic link from its parent's
> > ACPI companion to it.  Accordingly, also remove the code creating that
> > symbolic link.
> >
> > While at it, check for error pointer values in addition to checking
> > for NULL in acpi_processor_thermal_exit() to avoid dereferncing them
>
> Typo: dereferencing

Noted, thanks!

> > mistakenly.
>
> ...
>
> Is any user space ABI breakage expected as an outcome of this change?

Not really.

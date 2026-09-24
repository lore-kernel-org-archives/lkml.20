Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A713CB91C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260215; cv=pass; b=p0Vo5sCSIAyEAzDJh4/KFlAr25XX1b3Vxe0XffxneHgFmkQtGP5QWovBxxWGO8S8cAfuQqTGPEdP7VijWw9qA4QEViFbA4KQhFOA/xkRqGhudqla3Aneo/J95l/LsbYZGYAgtByz/ZPFbr4ppb1s8FKQ1fRvcGXEVU1YqUMWwxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260215; c=relaxed/simple;
	bh=DEXzrGZJZ5pZsu6Nmf3KfFvACPsKM8vrFc+DWmGfen0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m9PDXRGAoO+m9L8wRZkVb8nNTEqxoDZ155yVLm8AppkWYGJ/O+bYpBvoEwxP0AtfPJNpot0b7GM3II6BxRka6OCEAc9wG/t7W83urG3KbhaCWv+8VncLDneA53UgdckEHvvK9y5o11XLWxLkboyhVxgttvUBWvfkxMeTf00AQ5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO4TcCJb; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AO4TcCJb"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729ca45e37so2510436d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790260213; cv=none;
        d=google.com; s=arc-20260327;
        b=FBproZSHZcBbySQKqJjSXX/lGyjXAO9Q36BRlekxNYoXa0uXr9SKx23eM7I2jXunmc
         tCn4lA95zf7jcBwLfnx+9T3PV8SRmyEQwFzPUKEFcETBG2vdnLUbNYbfX1mTkqAGd134
         /aFF69kzn5q7fkYPjwDNhYN7wrVJnD8qBNkcgykCRHRNuYWAvSDtJ1WZa6zn+AjVxtQt
         R//GUa8eIh5FOKU2daDGkk+QFGljUzd0cKt6Mbq1qfMt/K6KvEa1KPw6ZGfQOyEcHAU8
         y7SyiMw8scVs/oAuljXZnRlcJRDN7lbQMyAdfgxlPGs7NQR7zsXuMX9OMYqa8l+oPAjj
         pLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2ReSij4eDlvfzvHmFOZbgb/VaJC2TPYANknXs7Tc10Y=;
        fh=sE07c7urTEOYxw567tWW4DPceTyWWbseB4aMqDatxQk=;
        b=HysvDh6aw7Sk0G5kCJfcByyheMrNit05udNq4flYIDISNFm77J95pfw5hj3SEIBMHE
         RhuMVj+AuzPXoxgKB3pmPWcgITXH+ubMB5BOYOdkmPTEluuk0JMwLG0L6alQVbY/DmZR
         WyvrrRQczXdVf9/DlRd7d1tnwUWxVAD/XUVKuvj64Ob3TtTNfa00sD1QM0j4/p5goV1b
         BWZ3KFfD//Izis6Nzgkx3AQqPYPFOdVkAB+2uh3HembdRlPiGIhZzWskVtos1VfH7kJb
         JqodAOtMr1qeVa/x+v1bawM6ePQ61NaXs3vpyjNUnnDZtgqy13MEggaa4VopHv3YnjSD
         d5GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790260213; x=1790865013; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ReSij4eDlvfzvHmFOZbgb/VaJC2TPYANknXs7Tc10Y=;
        b=AO4TcCJbZg8hMZNtETUCWwUWcvv7glRN9BicfzcgHkVUl0JWv4BOS0NDubJwnEJK1/
         qprLOvxxHqlyAEM/ku7aOunA/9Vblmk1dExTEc1iFIyE3VWQQVHxKtHiOVjPD5pZnLXK
         fd5hJLjLIGZH49q01/1m12meVNcskpkVSd+1ZHtWFvEP05FM+bL/22IsSpGzLS9x09Gc
         J5Tm6Adhhrsurly6YyC7TLoGp9HTKRtHnKGsKiRMRh3YMJv/PlhDwLwz4JQaPyWUeBT2
         27QxQGPg1JZVKyMpR9VYRwJxh5bqMXC2V8nLbPJBXENF6pIin7nAZYBtuS6Q7i7oK1dN
         KGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790260213; x=1790865013;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2ReSij4eDlvfzvHmFOZbgb/VaJC2TPYANknXs7Tc10Y=;
        b=CJZ2g0Ghn5BVieGFNSDdbHP/S87KlIUZRE0EEiC56UCY6tTuLZ0RWkV9+Cy6kbW99W
         o1B4PrMbH/LrL/VTtVIHY/5bhczrHERJu2ytgv4vgvpptzw3JSzoV2ZiyhaQkKIGU7ut
         Hnrpuq4SeYN9qMInXm8sjrxLXuF95yFCcUZIJp85UMsVC/7aMXwibTfRLG2Qw+i6hoNw
         XTRCCGOWFxs0ieFpXuTyyenLfPVF62xjn4nS154kkauN8G0yotYDSmQcrjbcSvnRIQCQ
         FOikpnl/f5hLLxV6F53vDgJNNotxeky3+rRpsg21GCf5gX5cx6g/Zzi31nJxB9VVcD8a
         guhQ==
X-Forwarded-Encrypted: i=1; AKwUvByTlZCK4dk+5487qgnbTv+Fmc7H0qEl1s2B/InTFytBuug2HkVkag8QhFNH7cWQjj+KyKWo7KGkFQvxCl4=@vger.kernel.org
X-Gm-Message-State: AFuF++lBgBu9OOsKFZcYuJUVCFsNQjCVuWCjmA3dgjjJwK+Hf5AJtcIf
	k8Ibm31+qGP6gDhfZf5Uc3Wz6/m9jzTqY8FKTeDO2qkA1rA3uqEPIxMjSzQEa2d2L4xp5mJOIVO
	HSchoHMdTdRdIcf5OLyUgNQe1F0xrJQc=
X-Gm-Gg: AYBFou2z4UdjRbIiQ9Na4eLJi1mufWPnrYgKftS766zd4aX+WzIsIM6urVUE1e/DhK5
	6oIaRDlsWdaPmU1wmMCRBJSM6nvwkObn8siVvx76lF215gqnxr/s5RT2/WGnPkn8JpdrHhWxkje
	c6YHojdaKfuqqfXzZtSdd77xcDogiuKi4+3bnEo+tKh4iWmNMvziVU0ZZpi3N5ZEl9r0Dx2UQzW
	L0zR4lCwYiLSwqPvnR65YnkM81eu6DY2s24tBI2dkcjeUcgBgyg0CJ2YB/YQjM2Dkn0wSfO8Sp0
	TQ+YjZHtqYJSK+Hnu45yH9NnP8XixJyxEAj4ZN1zKE+9hhDZP2fUYW7+6XknDzUwzt4HHQ==
X-Received: by 2002:a05:690e:c45:b0:66f:d093:c206 with SMTP id
 956f58d0204a3-672ed204704mr1327519d50.17.1790260212896; Thu, 24 Sep 2026
 07:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921110909.370945-1-lgs201920130244@gmail.com>
 <20260922074137.GG2348773@google.com> <CANUHTR9B84LoCjOtS5N5qGO0KXSXUbZkrKZ3_GFTwXmVoPQ0SA@mail.gmail.com>
 <20260922150642.GH3277918@google.com>
In-Reply-To: <20260922150642.GH3277918@google.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 24 Sep 2026 22:30:02 +0800
X-Gm-Features: AclHuK860EhogXR6CM7Mg1y8PIyfTwBtwpDGRzp_GvIpNMBtaMogNwOv8vHFZoQ
Message-ID: <CANUHTR-iuuGMTWT4_C5TMjtTBE4sYAWcD_N8Jwf8WnJs84b43g@mail.gmail.com>
Subject: Re: [PATCH] mfd: ab8500: fix child device leaks on probe failure
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, 
	Mattias Wallin <mattias.wallin@stericsson.com>, 
	Ludovic Barre <ludovic.barre@stericsson.com>, Alexandre Torgue <alexandre.torgue@st.com>, 
	Julien Delacou <julien.delacou@stericsson.com>, linux-arm-kernel@lists.infradead.org, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks, Lee.

On Tue, 22 Sept 2026 at 23:06, Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 22 Sep 2026, Guangshuo Li wrote:
>
> > Hi Lee,
> >
> > Thanks.
> >
> > On Tue, 22 Sept 2026 at 15:41, Lee Jones <lee@kernel.org> wrote:
> > >
> > > On Mon, 21 Sep 2026, Guangshuo Li wrote:
> > >
> > > > ab8500_probe() registers MFD child devices before completing the
> > > > remaining device initialization.
> > > >
> > > > On AB8540, the main MFD device batch may be registered successfully
> > > > before registration of the cut-specific batch fails. In that case,
> > > > the probe returns without removing the child devices registered by
> > > > the earlier mfd_add_devices() call.
> > > >
> > > > The same issue occurs when sysfs group creation fails after the MFD
> > > > children have been registered. Since the probe returns an error, there
> > > > is no later teardown path to unregister those devices.
> > > >
> > > > Call mfd_remove_devices() on these error paths so that MFD child
> > > > devices successfully registered earlier in the probe are properly
> > > > unregistered and released.
> > > >
> > > > The issue was identified by a static analysis tool I developed and
> > > > confirmed by manual review.
> > > >
> > > > Fixes: cca69b67b3ba ("mfd: Export ab8500 chip id to sysfs")
> > > > Fixes: 9c717cf3fa16 ("mfd: ab8500-core: Add device for new RTC version for AB8540 cut2")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > > > ---
> > > >  drivers/mfd/ab8500-core.c | 8 ++++++--
> > > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
> > > > index f0bc0b5a6f4a..e675223b6023 100644
> > > > --- a/drivers/mfd/ab8500-core.c
> > > > +++ b/drivers/mfd/ab8500-core.c
> > > > @@ -1220,8 +1220,10 @@ static int ab8500_probe(struct platform_device *pdev)
> > > >               ret = mfd_add_devices(ab8500->dev, 0, ab8500_devs,
> > > >                               ARRAY_SIZE(ab8500_devs), NULL,
> > > >                               0, ab8500->domain);
> > > > -     if (ret)
> > > > +     if (ret) {
> > > > +             mfd_remove_devices(ab8500->dev);
> > >
> > > What about switching to devm_*() a.k.a. managed resources?
> > >
> > > >               return ret;
> > > > +     }
> > > >
> > > >       /* Add battery management devices */
> > > >       ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
> > > > @@ -1243,8 +1245,10 @@ static int ab8500_probe(struct platform_device *pdev)
> > > >               ret = sysfs_create_group(&ab8500->dev->kobj,
> > > >                                        &ab8505_attr_group);
> > > >
> > > > -     if (ret)
> > > > +     if (ret) {
> > > >               dev_err(ab8500->dev, "error creating sysfs entries\n");
> > > > +             mfd_remove_devices(ab8500->dev);
> > > > +     }
> > > >
> > > >       return ret;
> > > >  }
> > > > --
> > > > 2.43.0
> > > >
> > >
> > > --
> > > Lee Jones
> >
> > Do you mean converting the MFD registrations in ab8500_probe() to
> > devm_mfd_add_devices(), so the children are cleaned up automatically on
> > probe failure, e.g.:
> >
> > -       ret = mfd_add_devices(ab8500->dev, 0, ab8540_devs,
> > +       ret = devm_mfd_add_devices(ab8500->dev, 0, ab8540_devs,
> >                               ARRAY_SIZE(ab8540_devs), NULL,
> >                               0, ab8500->domain);
> >
> >         ...
> >
> > -       ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
> > +       ret = devm_mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
> >                               ARRAY_SIZE(ab8500_bm_devs), NULL,
> >                               0, ab8500->domain);
> >
> > and likewise for the other MFD batches?
> >
> > If so, I'll rework the patch that way for v2.
>
> Yes.
>
> --
> Lee Jones

I'll convert all the MFD registrations to devm_mfd_add_devices() and
send a v2.

Thanks,
Guangshuo

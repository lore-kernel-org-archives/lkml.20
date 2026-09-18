Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2684A204F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736652; cv=pass; b=HwRiSJil6Y3t8qPaDMXhVSukN+5ND8bKuVMyllegGpLUtm+zn2ar+M5Y5NXd2SjnODvwlX/65060rb1ir33TKug6Q/Uuoil/Sl+6MshX5NLehnugsjCFYHsCc2KPTnkkq/TqA0GDGgIRlrYyPbdvY8u5Hfdx6Zcb7kU6tzShWCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736652; c=relaxed/simple;
	bh=6cZQ88YvMyKDlbojOOX0uUwsznnXAQW99G7QctL7sho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMFJFrqPafj/iG/L/8MyV2A5ijj2XTDWI2nrDWHm3CtTne/chU4DNqm7/YesCn57Fz+m0KmyitwlcOhzbzB1ttsNYtSAR605VH2o+hJaGe+yL/BugH7rDth5WcZ/rwBwcnUpFRw/tBDgx7XqE06gzANpgM66eow4kBl2XrIl5QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=redhHN05; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="redhHN05"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97cb5cb0af3so12999241.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789736648; cv=none;
        d=google.com; s=arc-20260327;
        b=OC5LlxioPBqq9i9AzALql8r0+FCytSX8O/4oarvUJrlO9kZkiPTlUK3uRxEsUAviTL
         PiBBdfknMv4BqQ3632gQOoCtKmqslMJH8J7+Sk5HOUTa3tXgavzcQjPzilk7nWZXKsuQ
         61vbvz3Eb1cnF20Umaf+WW1ohZTVFMnCylEYutKnh2jZVV2fxXi444rUC8BSHzgFL4Dg
         sxuAB1ivgXjwEPMIa7Q0+yyZtiw2ekX73NQwJPBp9LKajsWUABg+gndGhE9OovRrFh81
         bPT482lv+LaC5n8Zo+Y7p5FEoAcRNWNvKvxL77oFB1aur7I/v9HGjoEl2B8sUg2/O3c7
         gWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yCLjcMw1rcuu9wX+kCk+ppzWj5O7P6M4vBYFfJC61a8=;
        fh=Z1ni0X4EalVeqRkHwsZ+TTdr4O2A2A3OLCuQQwb9S2M=;
        b=W1+ycpS751r9g2z+yVn1MM8Z/tqtndb7ugWYgBjqJJcAL3GucoGHqHvKz6VQtZDXpK
         vSyT5vcIxgHGOUBXiTuAAhcETHalBBn7i0WZP8tdtkEAdrMjYA2C5E97ITG4k7O/O51+
         arPaPbGqP/uTcfE330WnV1HbMSGu3jbrV+PUVZLPiBbgxA4yMIj56OHuiJbEcIFjKcLx
         8QE23mCOffhwuiH+6GOSWNubz/25m0THkiouNfYpZ7+/KlSyZiZbSreHvaxFFSNTngdv
         bHSrk/0LhJ6WxvyeFjrIWaWbmiItQ6LyQ/4BcpNWebxorkMDdEJzKmWj8by3Cy5z3z3G
         IkUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789736648; x=1790341448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yCLjcMw1rcuu9wX+kCk+ppzWj5O7P6M4vBYFfJC61a8=;
        b=redhHN0537THjErWIWHtqY0+u9ia3AjlOVAum3WKBMcMF1K+RAtSjeYzdgN/dv+d6C
         XqJcf1T4UhR2nowa5mJ58Vnfraghvk+5Ph71GGBFxY4scJG4wW4Og0cdQ7PNjPzv3F81
         bLrPxffqM0hXVGl9Kfu8vmyNfJsNrCa3xqmmAbACNfJj1Weg0JaCyRuyGKM+YnYtMZ5r
         ktl9tOZ/jGJTdLiQlDSSiEBlmnpJxpKbLpTlsKvxchprs5LYFfXiAdV0Tm0QVYlLlHxh
         aynAD6TttgpZIef/Z4/t1O05Rxkp80ijWzt5pvl0RJlVy+Ub1aM34MdTcJOTWWIhDl30
         U6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736648; x=1790341448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCLjcMw1rcuu9wX+kCk+ppzWj5O7P6M4vBYFfJC61a8=;
        b=qqBQkOfgZUUCcZuX1YRYHFbAQouDgyjBtVLHmdwdasvx4xcbUB1TtXyIzLvL/B9qlJ
         lSJLhlz9kVPMy6rHa337qsv/R6cnau9AEZlbCh3x+u9yD+R/J0vFechK7iWcegadt3CF
         R0jHsNl7eHW0rM5haHQMUpEOfCO+lsK1K0lFGBEVfUEpd117PB7bTE+YjRgS40MxHEeF
         12pRtclAlMnVPVigLVaaCYN34+LwvT5jpslv+HowF78+PhuMGeai+NLrPGPZm72uN1o+
         RB2ip2g3vs+kBmERFEqeUReSED0NOYkJu6uFbTpH205PvGmnRco3AG1n/hFXvDiO7Aed
         xfMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqJh7v2nkbb2Tq3FE7SroWKQQWe0dxvY8XxQ8HGaT15rMpFYkvX2AvgFO8ZLleLE5HZRB1KRE2EytiZBI=@vger.kernel.org
X-Gm-Message-State: AFuF++mEeT/8G8Lt+PHzHmN2aTTKmpM5NnRXh8CH6iJGU3SUSU61jx0N
	mnu3vJ1udNUJwkgsWi0C1g5p94PhJT5CxCv2QmAOJ23jjkSkxQf9g2qIOWb0bHl7s4d2gV7HK24
	DlsFUn+DewUOtLuT0ZmYNlGEfTl807wY=
X-Gm-Gg: AYBFou2MTxdz8UDNNzLPydyV5JvHaZBlUJ65iA8rlADszV5d0DZQIE22k0tQ13f0Eu0
	DwnbGb3Gge6J+bOSd/dvMpR0E6Pahw0MNUSgziclH4ynK71n4B+E2sggN8SZR9MaG6dmeXzkTOZ
	xg8QxzpDrUu7eo+5gc2OYt7r2h82Vfq6SU/jAajCzMvUIpEWyRiPIiTjt+2wN4bqp3gy8v5T0Zg
	EQNo4CdPl6o04E128Bdf3m008VNVs8YIuaq0kZQDzk5IZr/RT58WSs6IP75ydlF//8O8F/CkPLs
	/FlUDwcXOPzINcUpS5ah8vTluoc778GukbsR1kSgPaEanyaeWGbUlprgHaHWpL+/Y2wxBBvU8GY
	p7H6qomuKNTKF4q40j3NcPkYepbGNT+CVI39+F3QvlB8=
X-Received: by 2002:a05:6102:5e8b:b0:7a3:2e52:114b with SMTP id
 ada2fe7eead31-7a59dd5f437mr474902137.2.1789736648001; Fri, 18 Sep 2026
 06:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724025959.142826-1-W_Armin@gmx.de> <20260724025959.142826-3-W_Armin@gmx.de>
 <BN9PR12MB514668975E87D570F50B2D91F7A82@BN9PR12MB5146.namprd12.prod.outlook.com>
 <86d0e015-a8f4-4e10-a9b6-a9714d3e0f07@gmx.de> <80c4bb47-936b-976b-6ba8-b366f7a455cf@linux.intel.com>
 <11976ed3784675ad241646287a909286a42675a8@intel.com> <3ef68773-e07e-437a-98fb-a3c5fc08539c@gmx.de>
 <62d7da838e7042df8456e76190db792093065b57@intel.com> <06550473-63c2-4a3e-a5ad-7e23d7b6b050@kernel.org>
 <d696d85c44930d2124054ce11a06d3096c0db04a@intel.com>
In-Reply-To: <d696d85c44930d2124054ce11a06d3096c0db04a@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Sep 2026 09:03:54 -0400
X-Gm-Features: AcwNN1XHNFQcATzjGyaYhKX2aDW9koV5gKbX6KpcatyNovdS0W4jwqBJ2n5fxn8
Message-ID: <CADnq5_PT7s6ixTqDSwe9ai9tUQa04z7UnwhMn7bo7CcsH5Qf0w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ACPI: video: Remove CONFIG_X86 handling from nvidia_wmi_ec_supported()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux@weissschuh.net" <linux@weissschuh.net>, "rafael@kernel.org" <rafael@kernel.org>, 
	"lenb@kernel.org" <lenb@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@gmail.com" <airlied@gmail.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, 
	"rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>, "tursulin@ursulin.net" <tursulin@ursulin.net>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"matthew.brost@intel.com" <matthew.brost@intel.com>, 
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, 
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 7:01=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Fri, 18 Sep 2026, Hans de Goede <hansg@kernel.org> wrote:
> > Hi,
> >
> > On 16-Sep-26 09:16, Jani Nikula wrote:
> >> On Wed, 16 Sep 2026, Armin Wolf <W_Armin@gmx.de> wrote:
> >>> Am 15.09.26 um 14:31 schrieb Jani Nikula:
> >>>
> >>>> On Tue, 15 Sep 2026, Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.c=
om> wrote:
> >>>>> GPU people heads up!!
> >>>>>
> >>>>> On Wed, 2 Sep 2026, Armin Wolf wrote:
> >>>>>
> >>>>>> Am 01.09.26 um 23:30 schrieb Deucher, Alexander:
> >>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> b/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> index 12e4a41bf1f0..50305630f533 100644
> >>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> @@ -30,9 +30,7 @@ config DRM_AMDGPU
> >>>>>>>>         # ACPI_VIDEO's dependencies must also be selected.
> >>>>>>>>         select INPUT if ACPI
> >>>>>>>>         select ACPI_VIDEO if ACPI
> >>>>>>>> -     # On x86 ACPI_VIDEO also needs ACPI_WMI
> >>>>>>>> -     select X86_PLATFORM_DEVICES if ACPI && X86
> >>>>>>> The change below makes sense, but this one looks like it should r=
emain
> >>>>>>> unless X86_PLATFORM_DEVICES is handled some other way?
> >>>>>>>
> >>>>>>> Alex
> >>>>>> AFAIK the dependency on X86_PLATFORM_DEVICES was only necessary be=
cause
> >>>>>> ACPI-WMI depended on it in the past.
> >>>>>> By now ACPI-WMI neither depends on X86_PLATFORM_DEVICES or X86 any=
more.
> >>>>> Hi all,
> >>>>>
> >>>>> Could more GPU people besides Alex take a look on this. I'd want to=
 make
> >>>>> progress with this series within this cycle but would prefer to hav=
e Acks
> >>>>> from GPU side.
> >>>> I share the same concern with Alex. It seems to me we could now end =
up
> >>>> with x86 configurations without X86_PLATFORM_DEVICES, which handle
> >>>> e.g. backlight on a lot of platforms.
> >>>>
> >>>> I think the safer option might be to go for:
> >>>>
> >>>>    depends on X86_PLATFORM_DEVICES || !X86
> >>>>
> >>>> in all of the cases that select/depend on X86_PLATFORM_DEVICES in dr=
m.
> >>>>
> >>>> The alternative is to find out, and handle the fallout, if any.
> >>>>
> >>>>
> >>>> BR,
> >>>> Jani.
> >>>
> >>> Alright, should i leave the original "select X86_PLATFORM_DEVICES if =
..." statements
> >>> as-is or should is change them to "depends on X86_PLATFORM_DEVICES ||=
 !X86" everywhere?
> >>
> >> There are some places that depends on X86_PLATFORM_DEVICES. I think it=
's
> >> almost always a mistake to have some places select and some places
> >> depends on, and select should anyway be used with care. I'd go for
> >> depends on.
> >
> > I'm a bit late to the party here, sorry.
> >
> > Note that X86_PLATFORM_DEVICES is an option which enables / disables
> > a menu and does nothing more.
> >
> > Enabling it or depending on it by itself does nothing.
> >
> > The select used to be there since it must be selected to be able
> > to select ACPI_WMI (which is no longer the case after this series).
> >
> > To depends on in XE was probably copy pasted from the existing
> > select-s and then changed to a depends and already was a completely
> > no-op since depending on ACPI_WMI was enough as that itself
> > dependend on ACPI_WMI.
> >
> > As for X86_PLATFORM_DEVICES being needed for some backlight
> > interfaces, depending on it by itself does not result in those
> > interfaces being there. That requires enabling the actual drivers
> > providing those interfaces.
> >
> > And I don't think that the GPU drivers should start depending
> > on those since that will become very unyielding.
> >
> > TL;DR: I believe Armin's original patch is fine and this is
> > a welcome cleanup / simplification of the DRM drivers Kconfig
> > bits.
>
> Your explanation makes sense, thanks.

Yeah, sounds good.  Thanks!

Alex

>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel

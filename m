Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.27.248.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148126;
	b=gy2SujTlxtVN8P04UxkQAeKcN9B3MRqqsOjB1iEu5ol2B4zXEcBi9cmpUipAqUhpTUOe
	 IpxbhnoS+bXvHdlmr+HlCvFeHKoixKfL1fYQkNrYjoVF1ox1MhAHMvzt8sqcd/A7Hk7Q/
	 ADLhY3H8biBJUP4EUGJY2C9bXBeJNdD3GEK4Ai/AcUpK/YCBOWponF1Ij80mc+H+ZiXe+
	 E8ZavV68whdFKbr1Mcs4kYEIC0LNXO5XfEW3ZKvRVTMtGGBWi9qF1h3BhB0HzZ4iMb0o1
	 A4ROJXdZuKq8k/f1zuljZTIKSUBBS3du0B/O3neYzzrju7LK6QDARghXw7Jzn8ky8AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148126;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=+Y9xIcW79wCsOIJSrbxLrdNmDEfycOIMuPxVKpVjvIM=;
	b=c/cL8IRda6t0LHLroAZuNY8OVVmFg+ZVK1snYUYxjZSSqpVvCaYPu70aNmDH6hK6RmSp
	 GfmciQXn1GlUdsHYET0DtnF8zjXT6wvDeWnvWc2Tyz0RD3594KEREdFFVzQRHHMgciTp1
	 otmZXoOeNAu0zhXqZ4plkUgRvHkbuSZhofrQSIMWmhBTyFwTWliMSGarCxlhboiPfyAU0
	 b8NhPFMwwXPacRMRrCqAMLZpVNu8WXaYrkgc6DjNC4XvitcbMRMxlQcIJcdjqlqmh6GtJ
	 PQDmkXVwjMaVlmV1lOLzikPS3UpevK1EJ9dNcn/KLvKRGTwG4oQUM37RV36l/ZNB75A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=Vhr1X2u0;
	arc=none smtp.remote-ip=37.27.248.198
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB76B606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB76B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=Vhr1X2u0
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 1380142FA2
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:28:44 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 82B5142F69
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:28:43 +0200 (EET)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 987571FF251
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:28:42 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1794148123;
	bh=+Y9xIcW79wCsOIJSrbxLrdNmDEfycOIMuPxVKpVjvIM=;
	h=Received:From:Subject:To;
	b=Vhr1X2u0O/yLnmtjn+/h2+Sr1zDgJBKcjUYj5NBOWe2CIK18mnBVZE2zdzVRmU7dB
	 W0Ulfl9psy7YGsO1bCc0KbbnCZsTqqqhy5SbZAr+B5shkR6ZXJODlqpWSjhXLFi3I/
	 KM7qzeVvblgFiSjVuwkY/r3cXyHskn9jcdUIW8sPxBhLA2DvrGij+83cwbQ3fvtNu4
	 cblGnAjol6vBovAfGD+SALEjkEt5CZbiac8GOkyNUq7nhQjLMMMmyUq0a1CKXWuPIn
	 LUsUL70NGt8iGE5BEYS4iNzZVypRPxfDYADY05RFYBkRg57sDvCrv5hxcF0j96pbEQ
	 HTEDfECE2m8AA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.210.177) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pf1-f177.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-8b2f59de176so72824b3a.2
        for <linux-kernel@vger.kernel.org>;
 Sun, 08 Nov 2026 06:28:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErG62X79tUtJ161JpeG0pl8s9MWuBWNhgLyt/E8iT04QGjZP2k0ZzjYlzQEXqxQuMmOlRbPdt2X3C+UJkEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kM2d19G9PbnCtA1KztRi9qnit6qorGRdTb7WtUL6gfHIoUHjM
	pIEkPC8rKC1xwx+7RqxWJFkCx1Gp85OmLxcikVaszXtzfo/AUv3wFDTLUal+c804LF/NXZfXv80
	sikYUITVxczpzQF1yIt34l48gIOF0qGc=
X-Received: by 2002:a05:6a00:a245:b0:8b5:8fcd:a5d6 with SMTP id
 d2e1a72fcca58-8b670a21de9mr1358355b3a.41.1794148121377; Sun, 08 Nov 2026
 06:28:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: 
 <CAGwozwEKXJGBY5oZtdrrzfK-aOyYu5GaiOqkejSqbCPdeq0UJg@mail.gmail.com>
 <20261108135505.67330-1-hijae99@gmail.com>
 <CAGwozwHoTDCw63MoP2S6Qd1dk9Ym-=_E1e3oXOXkoWNfJxmUVQ@mail.gmail.com>
In-Reply-To: 
 <CAGwozwHoTDCw63MoP2S6Qd1dk9Ym-=_E1e3oXOXkoWNfJxmUVQ@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 8 Nov 2026 15:28:30 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFv9x_d5WprytNTdgAFqepeqxgT6TTKeXLD8-G1Z9T3yg@mail.gmail.com>
X-Gm-Features: AclHuK-p_g_GdUHU1_lGxOnirMhox94ZRUMyLbTRe8D51RzYv4iMKddJMh8MKvo
Message-ID: 
 <CAGwozwFv9x_d5WprytNTdgAFqepeqxgT6TTKeXLD8-G1Z9T3yg@mail.gmail.com>
Subject: Re: [PATCH] HID: ayaneo-flip-kb: Add driver for keyboard backlight
To: Hijae Song <hijae99@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179414812288.1256223.6093989025187065052@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 8 Nov 2026 at 15:26, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Sun, 8 Nov 2026 at 14:55, Hijae Song <hijae99@gmail.com> wrote:
> >
> > Hi Antheas,
> >
> > Thanks for the feedback.
> >
> > > If this is an actual keyboard product on the market and Ayaneo is
> > > sourcing the part for their device, look-up similar devices and kernel
> > > drivers.
> >
> > I checked. hid-sigmamicro only fixes the 0x0059 report descriptor, and
> > I found no SiGma Micro backlight driver on lore.
> >
> > > The name of the driver cannot be -flip-kb. You need to make sure it is
> > > generic enough to match most Ayaneo devices.
> >
> > 1c4f:007c also appears on the AYANEO Slide in hhd-dev/hwinfo, with the
> > same vendor interface (report ID 0x41, 7-byte feature report). I only
> > have a Flip KB, so I can only test the byte layout there.
> >
> > Matias's hid-ayaneo already claims 1c4f:0002 behind a DMI check for
> > AYANEO 3. Would you prefer that I add 007c backlight support to
> > hid-ayaneo once it is merged, or keep a separate driver named after
> > the chip? I lean towards hid-ayaneo, since the Slide may work the same
> > way, but I would like your view first.
>
> Mmmm so Ayaneo does not have a vid and may trample the pid of another
> device. That is not good. There is no guarantee this led profile is
> used by a different vendor.
>
> There are two options:
>  - Adding the keyboard to the hid-ayaneo driver
>      - This would happen after it merges
>      - There is 0 common logic between the rgb device and the keyboard device
>      - Driver registers a different led sysfs ABI and has convoluted
> dmi handling
>      - The driver would devolve
>  - Adding a scoped driver for the keyboard
>      - You can start now
>      - Can tightly scope to keyboard device
>      - name can be hid-ayaneo-kbd unless other vendor is found
>
> I would tend towards the latter. hid-ayaneo has plenty of work to
> merge. The controller firmware is quite unstable. Even my
> implementation in userspace is buggy. But that's fine... Windows is
> buggy too.
>
> I have two comments for your current version:
>   - remove all flip kbd references, name AYANEO_KBD
>   - use brightness values of 0 and 1, no scaling. DEs know how to
> handle these values by toggling.
>      - another option is 0-3, which looks nicer, but let's not get too
> deep into this
>   - use devm to register the led structure, drop remove entry point.
> Use devm prior to starting the device so that register code stays with
> initialization
>   - check if led subsystem is appropriate. I am not sure of the
> correct place. If not, current location is fine
>   - initialize host values to ff ff ff so on first write we get a nice
> white color
>   - if there is only one effect, brightness 0 is off. Do not add an
> effect handler

Ah yes, if the device supports Fn+Space, for this driver to merge you
need to send the correct hw notify and have at least KDE report the
cycling correctly. You will also need to read the values currently in
the device instead of hardcoding them. If it is a feature report, a
get_report should return current values

I am not sure what your current comment means about sending 0 breaking
the toggle.

Best,
Antheas

> With 2-3 revisions this should be good to go. While at it, try to find
> a Slide user
>
> Best,
> Antheas
>
> > I will also fix the two sashiko comments in v2.
> >
> > Thanks,
> > Hijae
> >


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.180.73.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794147994;
	b=gdwMOR4XEHmvb74pkFsDJuSsyXf0D0FHF/Ep9ttgAIewVa4zXQa7yI3bXePQEkyWR+Wh
	 iPPSn37b2dhKqZ1GNUVa1iLD8U8vCErQoNQDEpW/rvdWQwJhzGSw4ZsFQcDDAkJTgxlhC
	 nSK08x36B7TJB6+/YfpCJF3WwPRlgVazeREg9fuhAaIzMTa+U8++ihNXZdLZ+ab1Qpl2/
	 xaGxaqpjm8ryihNnYNtNdu+UHRVVTL3IiwbbdwTX5VrbIYys/k2P4xR9oB1hKQ4OXddxY
	 McWwwhIIu/mwwODNvs+Fw24mK1kcUbgBHJNLu2sCZQO35UYSytuYf6fYswsrQRuBirw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794147994;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=fPRAwt6gCc/aeEGAwUvTMhd29rocLRC7MawVr2saLj8=;
	b=4L/q1z8nYOyEUf6CHkQFov714fbuOaLN23pgmuPHK4adHa9dFmq1AwsGUtcj9E3Y9sRf
	 6OxOOb/g2mi8g5PtKdXo1PcJK3eX/9yMpj3g67CtbVA46MdXZgDsuLeaf7RsECMR2yfh/
	 cDkI7uvWmKvDR1k2UZzXMTFL5J2rO/XR6t537ZfEepgwlcaefsgQk+JX6DisOo0toBWMQ
	 6SrhuruMtth6FE5PuBMdX7AROHLM5mBiflSNHLoUy79CF+Z1ATAuvuaq3C+sv4OXahptu
	 H0spTNDdNcdN0zYkdfaJSvkB9mHhho4Z9DZGap4rxWQVtly9zeRwg2SvVhzZwVqIUJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=BtB9zKpD;
	arc=none smtp.remote-ip=157.180.73.62
Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E87606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E87606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=BtB9zKpD
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id 525073EB18
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:26:31 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id AE6B13EAB2
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:26:30 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B0F8F1FF28F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:26:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1794147990;
	bh=fPRAwt6gCc/aeEGAwUvTMhd29rocLRC7MawVr2saLj8=;
	h=Received:From:Subject:To;
	b=BtB9zKpDwW5Gx0nY9CL45GPVHinFFsoytQsR3JBd5oz1TvshwZqyQoLkGxGEzgzLF
	 DXPnvczGA8/YExiGXTqGA8LN90LTJIfrbYxmyPEuVlQEMeKwGhEDoLE8hhsg38hi5L
	 C8/o5bOWj3X8fL2QXEzyvBZWeL4WZzTzqjelr/M1iXl9EYyaO3+3zL9kZG6emjZW07
	 fUoBZ/5X6kKYCRh5lTk0LdJiPHXV/aNdkjYT1tqYhyHIWXZnOw2qPVAy5PVI3VEPwV
	 PFKhC06JnH+nePr9phT34A9FpqV2LOCL9GhISoD0STlzl5I0jVyJZBArnrbrATTTc9
	 bR6zs78hrTRzw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f179.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2e987b4a710so512575ad.1
        for <linux-kernel@vger.kernel.org>;
 Sun, 08 Nov 2026 06:26:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErHx2x8sK79LNWQrf0OaQlAwi6ImSZdWSZ/z2G4DzpvO38Vac1DybnAwGMCgu/VE6MOIf3DbTagp3bOb6Hg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XrH+em+3Lc+XZFaiQUc0TX+Wk2oH5vBlntZJhozV/tCywcCFo
	LOl4L7OrVexTZoDJZb49JcUP2q38t1kRfubiT43m8dfF5vC5k7Wxihe6IhCOe7iiKJw7QIQmOxq
	Cl9dkDfiHVjgIBEaUEiEQU3oWHgU5xCM=
X-Received: by 2002:a17:903:2290:b0:2ea:1079:e518 with SMTP id
 d9443c01a7336-2ed83036768mr10542495ad.0.1794147988317; Sun, 08 Nov 2026
 06:26:28 -0800 (PST)
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
In-Reply-To: <20261108135505.67330-1-hijae99@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 8 Nov 2026 15:26:17 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHoTDCw63MoP2S6Qd1dk9Ym-=_E1e3oXOXkoWNfJxmUVQ@mail.gmail.com>
X-Gm-Features: AclHuK8Ya8THLxcfdbiN4O0gUBtp_pOnojK24EKP4Xp8y6ZVUjHgAMUFgotFdxA
Message-ID: 
 <CAGwozwHoTDCw63MoP2S6Qd1dk9Ym-=_E1e3oXOXkoWNfJxmUVQ@mail.gmail.com>
Subject: Re: [PATCH] HID: ayaneo-flip-kb: Add driver for keyboard backlight
To: Hijae Song <hijae99@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179414799008.1249111.4084081055945355294@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 8 Nov 2026 at 14:55, Hijae Song <hijae99@gmail.com> wrote:
>
> Hi Antheas,
>
> Thanks for the feedback.
>
> > If this is an actual keyboard product on the market and Ayaneo is
> > sourcing the part for their device, look-up similar devices and kernel
> > drivers.
>
> I checked. hid-sigmamicro only fixes the 0x0059 report descriptor, and
> I found no SiGma Micro backlight driver on lore.
>
> > The name of the driver cannot be -flip-kb. You need to make sure it is
> > generic enough to match most Ayaneo devices.
>
> 1c4f:007c also appears on the AYANEO Slide in hhd-dev/hwinfo, with the
> same vendor interface (report ID 0x41, 7-byte feature report). I only
> have a Flip KB, so I can only test the byte layout there.
>
> Matias's hid-ayaneo already claims 1c4f:0002 behind a DMI check for
> AYANEO 3. Would you prefer that I add 007c backlight support to
> hid-ayaneo once it is merged, or keep a separate driver named after
> the chip? I lean towards hid-ayaneo, since the Slide may work the same
> way, but I would like your view first.

Mmmm so Ayaneo does not have a vid and may trample the pid of another
device. That is not good. There is no guarantee this led profile is
used by a different vendor.

There are two options:
 - Adding the keyboard to the hid-ayaneo driver
     - This would happen after it merges
     - There is 0 common logic between the rgb device and the keyboard device
     - Driver registers a different led sysfs ABI and has convoluted
dmi handling
     - The driver would devolve
 - Adding a scoped driver for the keyboard
     - You can start now
     - Can tightly scope to keyboard device
     - name can be hid-ayaneo-kbd unless other vendor is found

I would tend towards the latter. hid-ayaneo has plenty of work to
merge. The controller firmware is quite unstable. Even my
implementation in userspace is buggy. But that's fine... Windows is
buggy too.

I have two comments for your current version:
  - remove all flip kbd references, name AYANEO_KBD
  - use brightness values of 0 and 1, no scaling. DEs know how to
handle these values by toggling.
     - another option is 0-3, which looks nicer, but let's not get too
deep into this
  - use devm to register the led structure, drop remove entry point.
Use devm prior to starting the device so that register code stays with
initialization
  - check if led subsystem is appropriate. I am not sure of the
correct place. If not, current location is fine
  - initialize host values to ff ff ff so on first write we get a nice
white color
  - if there is only one effect, brightness 0 is off. Do not add an
effect handler

With 2-3 revisions this should be good to go. While at it, try to find
a Slide user

Best,
Antheas

> I will also fix the two sashiko comments in v2.
>
> Thanks,
> Hijae
>


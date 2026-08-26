Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689B41862
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787754764; cv=pass; b=sYg3Y5gtW7DmnYHZSPadlgzpsDHvZXBkbY+GnFqjumrMZ98JWjM3OT5mZTAWZ3QQmQ35D6ekDvDYKne5kuxyE/VFiSAwXPQAo93CHq6rZkvn7+W9dETtb6z+f7YrJ+JUmwbKfJNb6H8Pc316HAKLrXy4j6EHAPhtFs5hJFRnqeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787754764; c=relaxed/simple;
	bh=uGuMG/KM6SBJAW6r5VuXsRS227UH4wUcYvkOdg0cQyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMWV0bW1fWyDEHEGwqg/bV2V2TWepV6SWYT5mbJMQ36umxZ+9RPJZCvIokTX2QtF3/3fJBbpLOEA7XqbmxfPpYkVlXO0F6ilH0WGWgHlrJxYhLRRm6twWQkk/DEIPN+nIlKsmSdLIwerzGyknGD5GaovQWOi6MrtOGzqKtm8OL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ClTpXhXM; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ClTpXhXM"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f432ac553fso796481a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787754761; cv=none;
        d=google.com; s=arc-20260327;
        b=qOSF0D1welRZRJQabZ5W4ifTikb7/iD9s9LYWZ5RPd1KsHn+J4ZPzhC6ypN+nFXseG
         uU8jXVn2g33oeZMLJ4UF16wRpdOuJQKX4JPJfcFDy8Xe5eDhzVD/KT0Dn7OB4MrBRE+P
         vRMTcY5wvZAq/CDISnTftkNN3OhD0F9JXW7x5Q6GEUTrs6fS/odPJ9h+l0zaHsvXubtQ
         /xz5CcVBW36OO9lFJnptQj/z4Kdm2RRutUVLpZ3hhCQ1Owq7ufUfcuN7rj2WU+py+0xC
         Wq9VYWj6RBl0pCQGopQ1dhwG3XgT0Bhjond9pbV8IM3sKgHiPcvfCbIVLftjQKLMRxpd
         MFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x1g4ctzEFpC9hS1eVfp5ZBV87NdsbdBID9p8ekLhrAY=;
        fh=agUbW3bRw0fr21TuhtYLp/ddB9xhls2PZzTCPECq/ms=;
        b=a8xF+Q9DZEkmPn+aI/Sh7U+68jm+8aN62H05zjOFFxJBNgtNdrs+ePh9KVrnGmBvkf
         //im10VSRk3tvCDlDL/GHSzAmw8ROE/ieB+akZOGNgEBTRUN/rTrkObPCo6aaDMtwU1u
         wkOxsfhZVPZwE5Hq8ooiUFmVB62+x3XUpEQpAeTqsOsRyasaz7aHeSl4bVsjBiz0aqYK
         uY7AUojJrRmKUFoLiK3Q/9bYCAGzNrqrayl5O6eX45as1dRgbl32tK6s/K9iTB+4YR30
         l17NwU1RRJeiXbQ4GhgFw4PZ+OjxqZhrvYTUqeTcMVJkl+K1AP+j/PeIwXFfvvOO8v3V
         1axA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787754761; x=1788359561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1g4ctzEFpC9hS1eVfp5ZBV87NdsbdBID9p8ekLhrAY=;
        b=ClTpXhXM+uOrobfj90WP2yjdefO3X9gIPragRCzKJ+oH6FqsevrVBFi+MOMrJnT5xR
         ZGfvCqxA4/CSyQ578oeOsuVHUuj2uj+GZdCN2PnY0Ttm84UR16EbiWH4/rPyYZTvDKWh
         YStRL3BQ2poPflKdnZ9NDEaslV78sLIqZ5k+hp68RuIFRxvFOrGDPyo07YICfSkrXSwZ
         fIetlBBshd5qSn+e2owXUooXTpT6MBlyESB5PYbWr19NaYst/ItjsEUNrggbL9AqnjPw
         ZIL6biAo7riFR/h9yHd40N64JpcfDDtTWa47joW6SkHC/kyWCOHFPFRauovvQnuoQBxy
         shyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787754761; x=1788359561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1g4ctzEFpC9hS1eVfp5ZBV87NdsbdBID9p8ekLhrAY=;
        b=WhWaQcYlGJv3AXhkRyCLVFwLagACPLBSkTtwzp2wmrbBZHWrsjT6KeKvPhhHNTT8B/
         hIvX9qrRqZUJA6vXXeM1h2ZAT5ciobSG9K9vpfXOfJAUJX/cpSzR29B+9Oc1faZZgIaQ
         Cqi2r5ZvpldiuU+pChJ05BhK4IfvsBoVkOxe9G+wINqUL1xEFT78G+5oGGrD/I2uS5RF
         ufxhDmNv1EMxQ88CJjT8HHPFfcAXmoRiFT/RTJ2qrQeD7qh34sAqKeLxEjIXjKFjqPdl
         VdE0WPGds/RzsbDDBDPUcSbLoNP3XbgGfEVzuYtqna/I4a49gZOQlJAcfV8vtkC3AxyC
         Er9g==
X-Forwarded-Encrypted: i=1; AHgh+RqNvkI+F6dYy/F6WpN8r0FxfHnSEZVb8jquyKW/QLdbukV4ILZYQFmmS4xewemLTNbvR5rzq+phkbY6nfM=@vger.kernel.org
X-Gm-Message-State: AFuF++lU2oHKGCOAsU4HtBO3zuNa+1iOF2y+cBiixl8rmAY7Jgntt/Rh
	XqUoLLmhtS8JZu64GV0ehnix+YiC+5FOodJ9YaWQQWohShpVF38i3E3JBuKMfiJDEOKksa3S8GX
	Qx3gZbKV7pomW839M6oihDZtj43FCD/VjFoPJ2AunjHxGtwgBnt+E37lH7MZLmQ==
X-Gm-Gg: AR+sD10ui11aZL259q+HC2gdC6bAb4bovk0SXPMN4ho2c2SR87Ilaj6q8sTNOYZ/MZQ
	XIQLfs1iIhYTwaMaCRL+hGS+qWi0EwpL4+77VXmqe9kVT4sGtZW+eqlNoEUlvod98E89ZtQ1t2y
	Y5bsaktR5MXzMSPHP6G0zvSQ+BjCdxhgN8rm8n1d5YFhNmVnn8aBqDit8wxWcoi+GTIeT+JsL/4
	rFIUiAkBQaR5BHX/ul/2d0ZKnGxnXtjKhM4VRcLAd7/8jRcSJcgkwFzkQo2M3byLgP6uuoKGiq3
	Vk/T8vK6ZPiQA4lXP2yTCMOm1sT/D3PQDi+k7iMJkUSmPJwT8nNzvbR9oy2LRCgU+IyltwjKcQh
	I1UMc/1EQERZu/MpH2Fd+vRRdROIT/rpZJ5IqHVzQoLpsjpFu8BRQbIu7HOFKwOKvqAQsksV1nK
	cLCfJQm3IM/KOh
X-Received: by 2002:a05:6830:3708:b0:7e6:fa37:9797 with SMTP id
 46e09a7af769-7f4c4dfee34mr7818437a34.6.1787754760603; Wed, 26 Aug 2026
 07:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a88012e.dbb3a75c.13dd47.0007.GAE@google.com> <6a8d0f6c.dbb3a75c.7844.001d.GAE@google.com>
 <2026082540-tarantula-gigantic-b786@gregkh> <CANp29Y5YH=O35brw55HFo_hVmFDz5Y4Yw7buBc-rOjETU2DNjg@mail.gmail.com>
 <2026082507-ecosystem-giant-0b79@gregkh> <CANp29Y5hnOWaqGw8BbPu1TCr00TbvNRciYvs_VCd6Jtk=8kSPg@mail.gmail.com>
 <2026082602-compile-bogged-877d@gregkh>
In-Reply-To: <2026082602-compile-bogged-877d@gregkh>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 26 Aug 2026 16:32:28 +0200
X-Gm-Features: AcwNN1U8xGoi4BJvKqmFyT1BTT2HHIMJbt0Q1AHIDird_ONv_FDVdlZesHwWpx0
Message-ID: <CANp29Y486UwGwRJpqzQ4aU2eN4Xu3A+zw_zDUJuFR5hKQ+Knrw@mail.gmail.com>
Subject: Re: [syzbot] [usb?] general protection fault in wcove_typec_probe
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+1a01783ea233350598b5@syzkaller.appspotmail.com>, 
	heikki.krogerus@linux.intel.com, jeffinphilip14@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	mika.westerberg@linux.intel.com, stable@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 4:11=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Aug 26, 2026 at 03:26:23PM +0200, Aleksandr Nogikh wrote:
> > On Tue, Aug 25, 2026 at 11:07=E2=80=AFAM Greg KH <gregkh@linuxfoundatio=
n.org> wrote:
> > >
> > > On Tue, Aug 25, 2026 at 11:04:54AM +0200, Aleksandr Nogikh wrote:
> > > > Hi Greg,
> > > >
> > > > On Tue, Aug 25, 2026 at 7:12=E2=80=AFAM Greg KH <gregkh@linuxfounda=
tion.org> wrote:
> > > > >
> > < .. >
> > > > >
> > > > > Please do not think that this is a valid path for syzbot to be
> > > > > fuzzing...
> > > > >
> > > >
> > > > Can you please elaborate on this?
> > > > Do you mean driver binding sysfs interface in general or something
> > > > more specific?
> > >
> > > That is the specific thing, don't have syzbot do random bind/unbind
> > > calls, having it attempt to bind any random driver to any random
> > > hardware device.  That's not how bind/unbind is supposed to work at a=
ll,
> > > it's for developers who "know what they are doing" and you get to kee=
p
> > > the broken system if you mess it up.
> > >
> > > Same for unbind.
> > >
> > > This is a root-only api for that reason.
> >
> > Thanks for clarifying!
> >
> > Some context from the syzkaller side:
> > Restricting the fuzzer is always tricky, especially when the
> > problematic operation is just opening a file and writing to it.
> >
> > We normally constrain openat to:
> > 1) An allowlist of safe absolute paths (so it won't open /dev/mem,
> > etc.), blocking any other path starting with '/'.
> > 2) Relative paths under CWD (so we can still fuzz normal file operation=
s).
> >
> > Here the problem is that one can mount sysfs under CWD, which leaves
> > syzkaller full access to everything inside it.
> >
> > Tightening the access to /bind, /unbind, /driver_override sounds
> > reasonable, but trying to catch all workarounds purely in userspace
> > (e.g., creating symlinks to these paths before opening them) will
> > easily turn into a whack-a-mole.
> >
> > Would you be open to adding some kernel config option or a boot
> > parameter to disable manual sysfs driver bind/unbind and
> > driver_override? We had a similar problem with writing to a block
> > device while a filesystem was being mounted, which was perfectly
> > solved by CONFIG_BLK_DEV_WRITE_MOUNTED.
>
> I've submitted a patch to taint the kernel if these files are written
> to, so that should "catch" syzbot and let you know to ignore these
> reports if it runs into them:
>         https://lore.kernel.org/r/20260826-bind_taint-v1-0-52b05f4a965c@l=
inuxfoundation.org
>
> Is that sufficient?

Hmm, if we set `panic_on_taint=3D` with TAINT_FORCED_BIND and ignore
such crashes, I think it could work, yes.

>
> If not, no, I really don't want to make a kernel config option just for
> this type of thing.
>
> thanks,
>
> greg k-h

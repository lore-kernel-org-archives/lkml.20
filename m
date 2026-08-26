Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA843B6BF0
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787775407; cv=pass; b=IucsVCut5GOstv2PYa4RVje8L7TRoOh3PSkZ/OWfR8yr0A0XsNn/M9Ljh3AvPcVOS63JrlaSQOo05m9mdB2VbNG3lydaES96Z3jFOAWQL7QDNU0t4I67woilxjdpn9lo0i8CAVfTldydXiPIRfTrqBXCNN+ZQpj92rGhf3ml0mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787775407; c=relaxed/simple;
	bh=0/7xCDKrWR+mPFvHdaazqCFu2sK+/utgz3T0Bn+mARE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ex3jU56fvpRXrKY4N8fnv2keGwPAXDDb7/6hVTQ6Nn7Si/I1c5MUIlRMRgMWAvmzJVMYyhSMRkAqX2ZbEbK09vunOITRP8/uiGh8B+HboIL8128Wi/XwOyzirt1wbs1nnV+Lh6Thz4GTe7lZmaMwGHZj1stimeXi8alT+4uF5p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=bjpOvYnG; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="bjpOvYnG"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-85b293528a9so845737b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787775401; cv=none;
        d=google.com; s=arc-20260327;
        b=WVJa9DbkNXKO5WMowiVMWSc7BcohspK1m4HtFIJtTTjx+GUDnSVcg3AZr8tWxiCiY2
         Wkm1SqQO42jVtKcez/uUcoJPud+lz2BIEjXSS6QIHoWucg18QA3eB3CRk2Ioeqi+1V5W
         DEyCQz08DjD3IOH+cWNcC0eyHFUg1sq9Bp/xdQ4CMcvGlL6F0MWD5cd0HTLZNHyTmMI6
         lQm11RMMaZ4ONzRjIP+iga2kYfuOGq9DIm2VYWn8sECX5nQFEmtUy8Zn6mWwVYmsg7eP
         rWbZ6il+m9KCEWdPu18NcWWIgGMiCoT7WneLxgKQzqBi5umaAtrTm8b4Dkd8qUGX7ebP
         MJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MoQXIfNzH6ytuVZiisRyn/tXm97WlOfMHt4zXWCzNSw=;
        fh=tojQFXmVLlx++Agj3K2lLh263zwpK+C/E+bzNt5Lc3U=;
        b=TMrxOnTZR5cCX0yvGDMgB45Ff2DIRgKemZ7kFF+7V/9I473Y6zAkg1qGjj3sivGA2E
         Q8WJZtJxfCLstpCSo/Q54ya224Xrs/+YbCv0dllKhg3PEBc8GEUlyyCB0MLLTey06f/J
         KxPRCmljjNmgTuUx1OLGwl0Bkh2GqJWYfLvRUymeyps/HfTWX/8ePJXPrIxQD52W2wF7
         p6Wf0Zjp339J66WG0N7gGv/gukWi2yKrY/ZLE3B79WCzhX0lO+H6gJhn2BHXV70tPMMu
         Hn7QVq8hh8UxzYr2oDvwvIdD30d35wfiVo1MyOc7Kb9zz/W3WRmDYpW4g4EFmJ8sZOsI
         YTxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1787775401; x=1788380201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MoQXIfNzH6ytuVZiisRyn/tXm97WlOfMHt4zXWCzNSw=;
        b=bjpOvYnGiIA/ACRntMqOC+TeIQTPntbxIWQjQ62isp7QLoG/RcBX1kj1hMRKPH9zw9
         u0ffGgTDOTILgL8WhykI2gX8eOrQwqlJlPS4nMXzW0WEVXNAkD5qxlzwDVHmDXyOSTQr
         ynkAo/8c05SlKvKJwuJMTS3Xusu2l99mTNtFmABJfK28wu3ctW0pIZ+rlSI21AeQk9su
         J/bhzNcz0DUFsSIiUR9ZEr3UReVFOAzqQv550u0TJM3GnN+z3a+7t9CSZxwW4ZmOfftk
         Nn4CJTwRWkpYIuTf6PBktzZDIv/dat1DcTN9T1W8IzPhYOAvqxm/Nml+g4jHJdpPD9NA
         cCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787775401; x=1788380201;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MoQXIfNzH6ytuVZiisRyn/tXm97WlOfMHt4zXWCzNSw=;
        b=PYJjD/ybT1+EKc+4G28Fcm1s+IJQLCad5vR0fvD8bUSUdmYmtP5Hg4jaQ+YRiwBrNe
         NVC8IO119muiaPKaqDMDxCm68Zxmau2typUP0CHplO9WrVn3tWacOhXymZ7L76h3b4fI
         gWTg7SlW/fWvjYTOWV6WChCfGD/G5IGP0U3GDagtjt66gIOdK+gfIe1W3vUe2gF3xMS8
         sjTct0p46YuBAnObszVTxvxY1/ScC++sNqH91+TAxSNkssa0Cvv1SWM/uZOhOjxY3Lty
         PBBRQBUma8R5vVUdponk68G38pn3Cc5yTz1JfL27s+CBU5ITglfl+w7Kq2BfH6VE8XQz
         TabQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaRNfV3dYJT3iyIDaW3d+cA4fzB/cej2tiuQj41OmzXlnItjRsK15bi7HkPNQJbv2UzoRvF9Q/EUz2wWM=@vger.kernel.org
X-Gm-Message-State: AFuF++kWxMiWZt7qfnFVNB8Kl073X0rRePa6ibO6EZiw/mNLohjCRjTj
	jvbsnKGS/iyzxNZkP9E6iQQaSNMI7H2iM7gf/3xBUX47IPjdC8QPehr4PKGitfahH2Gc754p5XX
	WG2m/VOEs4AkrpaMkusj4S+hKw6rFK0Km0+I/YwrXlpdXwB3hB5Uw9+2Aaw==
X-Gm-Gg: AR+sD12Y1OIy0JRq63jkj1XvKENiqu5ryNWcmEJcB61Ul3jFL+sIwTw49VtnBzSyecS
	CgFOFUb3IHZ8Tn9LXlHzZCc4R7vaFFlElecaoHLBpBIs/QPCGgpJA+jlDJaVtN9KGWZPyaZ4wsl
	bOJLaJkPUTYHGtFp0f8S1TNsZCn0uE9wVX7DIl2tFpA2W6shTTGxBcyYrd0EmZkhC5MUbHqI523
	ma24P8AH0TgLB/W7jJELLztg0hYI8mwEhPLqgpcy3d5Zxry2IdMiYpK2zVcrLdsHEe4AJszjzrm
	4QL4RrNTQI0DUmUlhxirQkY2niTMbfB2BgqcfCiyC/e4IP6BQ6IuRPt1NuF4J9A6iRJvymInEiG
	aTzAzKe54eA==
X-Received: by 2002:a05:690c:e15c:20b0:825:468e:e0eb with SMTP id
 00721157ae682-85aa1a0750cmr6587537b3.15.1787775401386; Wed, 26 Aug 2026
 13:16:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-blackhole_quirk-v1-2-fc004672cdbd@oss.tenstorrent.com> <20260826195503.GA1554946@bhelgaas>
In-Reply-To: <20260826195503.GA1554946@bhelgaas>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 26 Aug 2026 15:16:29 -0500
X-Gm-Features: AcwNN1XrWloBzUUZjl91EBwKqKAy0KdvrxrtaK_vn9u1fg3SBOWQBODKTb62OCs
Message-ID: <CAEev2e9HzMt27wWchsQGKuLELVW5hqL4-XK4DuP6XSwS6zmouQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI: quirks: Drop unassignable 32 GiB BAR 4 on
 Tenstorrent Blackhole
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, joelsmith@tenstorrent.com, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Bjorn,

On Wed, Aug 26, 2026 at 2:55=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> [+cc Ilpo]
>
> On Mon, Aug 24, 2026 at 11:57:07AM -0500, Anirudh Srinivasan wrote:
> > Tenstorrent Blackhole cards expose a 32 GiB BAR 4 that is unused by mos=
t
> > software talking to the card. This BAR cannot be assigned on hosts whos=
e
> > PCI aperture is smaller than 32 GiB (e.g some ARM/RISC-V systems). This
> > failure also results in BAR 0 (256 MiB) and 2 (2 MiB) being unassigned
> > because bridge windows are sized as the sum of all enabled child BARs.
> > This makes the card completely unusable on such systems.
> >
> >     spacemit-k1-pcie 80000000.pcie: PCI host bridge to bus 0000:00
> >     pci_bus 0000:00: root bus resource [bus 00-ff]
> >     pci_bus 0000:00: root bus resource [io  0x100000-0x1fffff] (bus add=
ress [0x10000-0x10ffff])
> >     pci_bus 0000:00: root bus resource [mem 0x1100110000-0x117fffffff] =
(bus address [0x00110000-0x7fffffff])
> >     pci_bus 0000:00: root bus resource [mem 0x1800000000-0x18ffffffff p=
ref]
> >
> >     <snip>
> >
> >     pci 0000:01:00.0: [1e52:b140] type 00 class 0x120000 PCIe Endpoint
> >     pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x1fffffff 64bit pref]
> >     pci 0000:01:00.0: BAR 2 [mem 0x1120000000-0x11200fffff 64bit pref]
> >     pci 0000:01:00.0: BAR 4 [mem 0xfffffff800000000-0xffffffffffffffff =
64bit pref]
> >
> >     <snip>
> >
> >     pci 0000:00:00.0: bridge window [mem size 0x820100000 64bit pref]: =
can't assign; no space
> >     pci 0000:00:00.0: bridge window [mem size 0x820100000 64bit pref]: =
failed to assign
> >     pci 0000:00:00.0: BAR 0 [mem 0x1108000000-0x110fffffff]: assigned
> >     pci 0000:00:00.0: BAR 1 [mem 0x1110000000-0x1117ffffff]: assigned
> >     pci 0000:00:00.0: BAR 0 [mem 0x1108000000-0x110fffffff]: releasing
> >     pci 0000:00:00.0: BAR 1 [mem 0x1110000000-0x1117ffffff]: releasing
> >     pci 0000:00:00.0: bridge window [mem size 0x820100000 64bit pref]: =
can't assign; no space
> >     pci 0000:00:00.0: bridge window [mem size 0x820100000 64bit pref]: =
failed to assign
> >     pci 0000:00:00.0: BAR 0 [mem 0x1108000000-0x110fffffff]: assigned
> >     pci 0000:00:00.0: BAR 1 [mem 0x1110000000-0x1117ffffff]: assigned
> >     pci 0000:01:00.0: BAR 4 [mem size 0x800000000 64bit pref]: can't as=
sign; no space
> >     pci 0000:01:00.0: BAR 4 [mem size 0x800000000 64bit pref]: failed t=
o assign
> >     pci 0000:01:00.0: BAR 0 [mem size 0x20000000 64bit pref]: can't ass=
ign; no space
> >     pci 0000:01:00.0: BAR 0 [mem size 0x20000000 64bit pref]: failed to=
 assign
> >     pci 0000:01:00.0: BAR 2 [mem size 0x00100000 64bit pref]: can't ass=
ign; no space
> >     pci 0000:01:00.0: BAR 2 [mem size 0x00100000 64bit pref]: failed to=
 assign
> >     pci 0000:01:00.0: BAR 4 [mem size 0x800000000 64bit pref]: can't as=
sign; no space
> >     pci 0000:01:00.0: BAR 4 [mem size 0x800000000 64bit pref]: failed t=
o assign
> >     pci 0000:01:00.0: BAR 0 [mem size 0x20000000 64bit pref]: can't ass=
ign; no space
> >     pci 0000:01:00.0: BAR 0 [mem size 0x20000000 64bit pref]: failed to=
 assign
> >     pci 0000:01:00.0: BAR 2 [mem size 0x00100000 64bit pref]: can't ass=
ign; no space
> >     pci 0000:01:00.0: BAR 2 [mem size 0x00100000 64bit pref]: failed to=
 assign
> >
> > Add a header fixup that walks the root-bus apertures and drops BAR 4
> > when it is larger than every root-bus aperture. Resource assignment
> > skips resources with zero flags (pdev_resource_assignable()), so the
> > bridge window then sizes to BARs 0/2 and succeeds. This was tested on a
> > Spacemit-K3 RISC-V board that has only 4GiB of BAR space. tt-smi and
> > tt-bh-linux are able to run on the card.
> >
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > ---
> >  drivers/pci/quirks.c | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > index b09f27f7846fc..df54e379c116b 100644
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
> > @@ -6415,3 +6415,35 @@ static void pci_mask_replay_timer_timeout(struct=
 pci_dev *pdev)
> >  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9750, pci_mask_replay_tim=
er_timeout);
> >  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9755, pci_mask_replay_tim=
er_timeout);
> >  #endif
> > +
> > +/*
> > + * Drop unused 32 GiB BAR 4 on Tenstorrent Blackhole cards so the card=
 is
> > + * usable on systems with smaller host bridge apertures.
> > + */
> > +static void quirk_tenstorrent_blackhole_bar4(struct pci_dev *pdev)
> > +{
> > +     struct resource *res =3D &pdev->resource[4];
> > +     struct pci_bus *bus =3D pdev->bus;
> > +     struct resource *win;
> > +
> > +     if (!(res->flags & IORESOURCE_MEM))
> > +             return;
> > +
> > +     /* Find the root bus; its resource list holds the host apertures =
*/
> > +     while (bus->parent)
> > +             bus =3D bus->parent;
> > +
> > +     pci_bus_for_each_resource(bus, win) {
> > +             if (!win || !(win->flags & IORESOURCE_MEM))
> > +                     continue;
> > +             if (resource_size(res) <=3D resource_size(win))
> > +                     return;
> > +     }
> > +
> > +     pci_info(pdev, "BAR 4 %pR larger than every host bridge aperture,=
 dropping it\n",
> > +              res);
> > +     res->start =3D 0;
> > +     res->end =3D 0;
> > +     res->flags =3D 0;
>
> This seems problematic because the hardware BAR still exists even if
> we zero out res->flags.
>
> This is a problem because pci_enable_device() will successfully enable
> a device and turn on PCI_COMMAND_MEMORY even though the hardware BAR
> may contain junk.  And if a driver ioremaps this BAR, it is
> ioremapping physical address 0, which doesn't end well.
>
> I know this from bitter experience :)
>
> If you have some device-specific way to actually disable the BAR in
> the hardware, that could work.

lspci for this device doesn't show this BAR region. Are you saying
that BAR4 still exists (but points to 0) ? Our driver doesn't seem to
have any issues with this, but some other driver may not play well
with this.

$ lspci -d 1e52: -vvv
0000:01:00.0 Processing accelerators: Tenstorrent Inc Blackhole
        Subsystem: Tenstorrent Inc p150a
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 27
        Region 0: Memory at 1800000000 (64-bit, prefetchable) [size=3D512M]
        Region 2: Memory at 1820000000 (64-bit, prefetchable) [size=3D1M]
        Capabilities: <access denied>
        Kernel driver in use: tenstorrent

>
> > +}
> > +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_TENSTORRENT, 0xb140, quirk_tens=
torrent_blackhole_bar4);
> >
> > --
> > 2.43.0
> >

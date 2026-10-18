Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126F7493D56
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792334901; cv=none; b=qT05E1CZtZeY1Cja8Sbp/OmT9PKL2RYI+5X1pV00J+w9ZiH6S1wbwkO6MOoztGQnnGJ3mxN3E97ZRi5QtYyBpC9i1l7P6CcHQDAKYYBMAVME7ht31aBSj7gkeqRTvydHT2i4BeawIwatCykXQU0uD/XXid3JhyiKNBnRGmfm74k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792334901; c=relaxed/simple;
	bh=Hj5hLisB54S1y/tYqExYUjuqnvH778SRo1sotusOCHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GDcxg9Vg10hPat1OkCUoj1QuZpFAgoY164vGJGQZZONLrxzeHZCzLhAt9+TYHu6cwQoxci2TqlMTZcmP/g8OOpjrkpIfkEwLgm/RrHjkS4uE7gF7s5ycGupnSs+Rs8S3VN/Z6ncg8966dg3o7+RDLRnMg9jI3vjlHnifH2NpS5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so827220e0c.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792334899; x=1792939699;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i/+KfkD3prUE3gpbH6xDwZzQ4znjfDPPu+7aaw/E4IY=;
        b=By03AVsWF2sK1O5SIwQeU0JH9Y6zz0fA5J7rqu4IhCM0ZbTLhqUvnr2Gk6sXh5YHtI
         5L/TDjgwjTkbX86blWfOCTOuJ6HFw3kkuRC3bcP+IfaVoTreCQkYNghkeoAMcnZt+VP3
         svYRrc0HZ8aVN/OTS48Cd6Z1FCcDZ04N1ybyxdVkI6DuxqLK9FoHk21M7Qz9aIiwFvej
         P+6898XLzfoZpmhrYYD2p6jt1ydBRBPvhRUc41JUIHJcT1I0Yo6jVzTXMb3IwhTx9Onv
         EF3yHIsB9R4oCakzGQM6vebVJ+2JV8LVX7maYQs33kwpOrQDh5MzJ64wWmbx0rCSQmcB
         4jTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDbIVKI45z1kzUk+7GJAX2EqSZuVE8XVo8gt63w+FYaBnCLk5wfWMpPUeZ77Oc8UBYpZ96/f7wpE+tneY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5jLU+UqHC6Vb63erhx2eAnsiyfv0ybQhgOvLn/z8SezRh6P30
	8PJRfnQWPDa7oNaIltFBFYPeX1I7mREF4nTmmxOjbRfbEQ1LxmmeoTBbpF/ucmq9
X-Gm-Gg: AYBFou1TxJZM5D2RbCDZ0MGWxrk6fim/D6O+0WAubFDLzbutPZ2wsE6ynNXY4sMxhyB
	YGD77PRJwl0eCBSrVAMmUog65IIWl9CSjgxQxoZyxPuhGfGnsvaejh2aNLg2c9Icr4bi7RfWwpq
	jgX27zO0evJeKiishmPYzQgmlXzuWGWvqi4GMs8J735QoEXySwWV+Tlln11jd/luUEH/bkL65cj
	Ugc7kn/KUqssdqnKhfj9C7f7o6sRp4Phaf9HviFPetvOBvry5mB40/DwK5BG4FZtYiqWLv1NOt6
	uZgYv39TOaqAtZ17WnOKydM+JvKxbVsGmoBwnGBj/zmTfuQ2z25rvfDXKmmgjDF0tg5KdzqXrRC
	VTtWzsoDm3HRe/iPcY78UNuHVUvqyumsKSq92XItgyioaLgSV6R3fEDOFlaTyZlfgH9TokurZky
	gB6gPWCFIyJynriS6HfAQXtqmIUDmc94LWhoVooQcW+/CpWnZojpGjOWPdkDQXPSN1Y+LRuSFWr
	BYY390cEneXPqIYqiJ2dP3SYY1mlUttWDMkXg==
X-Received: by 2002:a05:6122:328f:b0:5e9:721c:72a2 with SMTP id 71dfb90a1353d-5eaaa6a0b81mr2283206e0c.18.1792334898973;
        Sun, 18 Oct 2026 07:48:18 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabe1b2026sm2524917e0c.17.2026.10.18.07.48.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 07:48:18 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7c03a445cb8so1007422137.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:48:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw19sPVKygKJHaOOoeuhqXQUlcd7ln1vZiPbxqjN91VGMWpGNX2GaggAuw9TXWXmpLMYdVv+ue2qwK01i0=@vger.kernel.org
X-Received: by 2002:a05:6102:2c0d:b0:7c3:2f13:d905 with SMTP id
 ada2fe7eead31-7cc3670d3c9mr1798032137.3.1792334897916; Sun, 18 Oct 2026
 07:48:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017041419.311921-1-daniel@0x0f.com> <4cdb2939264e0b7d767f44289fddffd40fddf504.camel@physik.fu-berlin.de>
In-Reply-To: <4cdb2939264e0b7d767f44289fddffd40fddf504.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 18 Oct 2026 16:48:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmZash+8PmfSVrT=Wwob-mkq0x4umyRgX2-yikV9kaVA@mail.gmail.com>
X-Gm-Features: AclHuK8RBwZK_z43GrchRos_lydjyPBWt8zUJgcfKwlnh5NSKD4CTmW99AiE-yI
Message-ID: <CAMuHMdXmZash+8PmfSVrT=Wwob-mkq0x4umyRgX2-yikV9kaVA@mail.gmail.com>
Subject: Re: [PATCH 0/2] sh: Fix IDE on landisk
To: Daniel Palmer <daniel@0x0f.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, dalias@libc.org, dlemoal@kernel.org, 
	cassel@kernel.org, linux-sh@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yoshinori Sato <yoshinori.sato@nifty.com>
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Sat, 17 Oct 2026 at 09:48, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Sat, 2026-10-17 at 13:14 +0900, Daniel Palmer wrote:
> > I dug out my landisk to look at kexec for Geert. Since I'm lazy and
> > LLMs are good at fixing bitrot I let my LLM work out how to get
> > it to boot again.
> >
> > There are some other issues (perf is apparently borken, there are
> > some issues with the decompresor and big kernels..) but this
> > seems to be the only thing stopping it booting with the defconfig.
> >
> > Disclaimer since we don't need to give LLM tags anymore:
> > - LLM debugged the issue.
> > - It has been checked on real hardware.
> > - I have checked the IDE driver patch, cleaned it up and
> >   cleaned out massive walls of text that LLMs seem to like
> >   to add but I have left its summary of the issue in the commit
> >   message.
> >
> > Daniel Palmer (2):
> >   ata: pata_artop: read the ATP865 mode register through pci_iomap
> >   sh: landisk_defconfig: enable PATA_ARTOP for the ATP865
> >
> >  arch/sh/configs/landisk_defconfig |  2 +-
> >  drivers/ata/pata_artop.c          | 12 ++++++++++--
> >  2 files changed, 11 insertions(+), 3 deletions(-)
>
> Great, thanks for fixing this. While I have LANDISK hardware myself,
> I cannot probably set it up fast enough now to test your patches as
> I don't know where I put it after moving places.
>
> I hope Geert can test and review your patches and I'll pick them up
> with his Reviewed-by and Tested-by signatures.

Sorry, I must have different hardware, as mine doesn't have an
ATP865 PCI device:

    # lspci
    00:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
RTL-8139/8139C/8139C+ (rev 20)
    00:02.0 USB Controller: NEC Corporation USB (rev 43)
    00:02.1 USB Controller: NEC Corporation USB (rev 43)
    00:02.2 USB Controller: NEC Corporation USB 2.0 (rev 04)

My CF rootfs uses pata_platform, which is enabled in my working .config.
landisk_defconfig lacks CONFIG_PATA_PLATFORM=y, so it hangs during
boot. After enabling that, the boot gets further, but it still hangs:

    INIT: Id "1" respawning too fast: disabled for 5 minutes
    INIT: Id "2" respawning too fast: disabled for 5 minutes
    INIT: no more processes left in this runlevel

Adding

    CONFIG_DEVTMPFS=y
    CONFIG_DEVTMPFS_MOUNT=y

to landisk_defconfig fixes that.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

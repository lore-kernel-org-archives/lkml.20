Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C407449ED6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348861; cv=none; b=JIThV9tQbin5r+zNfpBr8djnS2l3L9iWREeJfF4Y+tX6v2k3kbUglrKReesEyjuoI9tTLsfnXFrdImevVGpLZklNQ9YDE8GHjGJd9lKPp5gUMAT73C/UNCADHNHWq3Or0HAaVAwjvzy+ROptTT+T6Bt+K5WhPSF9Exjaovh9IcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348861; c=relaxed/simple;
	bh=c8cVDH4+60eN9JY5piPPVSkAJg5r/Dt287R6xlSNjmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cTTXPhNnqyvf1nmfE5Sq2hzhY4E9HmJVkGMH9/K4J1pvFQkGN4zqZFOHnMShL7nwWlq5b2M/BlUgv6FA/cXlvx+1LCEWGal9kpybrUlzfXbyaFG51PClTBvlH7AVk0b5P0VoaWgL7rW1r03JsWg86hoKgzuZOwfzb55UBGjWW8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso471410e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348853; x=1788953653;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZX9X5hy8bWZKgZ28xeKzE387jyLfPdvXwed5OH+/3k8=;
        b=d7dAfl+o52q2MgZkZFQTEtFWW6SRo/AZUo4jcMGz8BKmFlTB63xTPcp94mY65rzZV7
         +1ymkOyYRv0kUR8hebigZNkdsZHwFbWfvoxc9yet+KiEOTPdLTVjfYMW1I1kXCfAZU1a
         eeqhWxblRwU1NVw9F2RfY8mOrVZY344v/uSYR5iJwhv9WWDrdGFcPsz9VzOH3hCMc7tY
         3gfAy/EQPmstnD/1qNIeGMlAOl58cYFqvz3IFWDCjQZrd35UkGbRDgiKalkeYeisyL/z
         BkfXrvPD+7kAYxjbYDbgHCrPJGi4+moZbi7PcTUIuxulWn1JdZxsW48bPAnVDLuKfet9
         VeAg==
X-Forwarded-Encrypted: i=1; AKwUvBzu9oh3Qw6R+qFdoRCSAd0o12I/I39esTxnbJVXua68EmOzarDsO5MnvmzhWHQyG6liRyBIwr1gjWgB1Gw=@vger.kernel.org
X-Gm-Message-State: AFuF++kesSy+UidQdSlqZB5MGhc9W86lE30f+5lX+L2e647xOMLSk0PJ
	JDkMZD/PiA8pAPN3P1bmFW6cg0tbvOvcG2vLq6bbmB3/eh9VCBg6teermtdXZ0Vo
X-Gm-Gg: AYBFou2lyws7Udz0ed8Ud/lRm1qzNLj6t0nUAGao5EgU/LS50qq2s+Lwb2+8DPr/yyt
	nUb0eaxcBjtI4tsSpyF6GPro4oR26yokiBgv7Ihsd9Jsv3KReo8GUrgAoF7+GVrgiFDiGlC+r6Y
	MkdniGYGM/i1vuMwBQVTsO/6uYzxIPa+w8yksfGbQKbcL6ZCS4DAMskrIA6NaKnrq351VFy0+xA
	G12Qoxi4jSgE0oINABj1f2PQmBkU1AGgp4meM4anenHCT2K7tS/rpjLOrxUS/tQ3COr+5jjyawz
	4xCUwDoo71TYinDLBUMp0LUgS21oWtlZ8wtxfovA+471nO6uaYPaKEC5KGWnDrWJbMT1I3w+kVu
	ryEWVFyWQxKCry2oEGOHcRFApmTtIq0r4hSIxoHnYPPqgi9vXJJp2XAQ8mxt0mSTav9loeNacbE
	g9uFYUkCPHx9ixrBBk2B/2E2LYT+/lE6uRDoSFSNOaDeWkDC4R6p7DwFGPJrqOKQVgJJjMh4Hju
	/am1pbcbEsLJMzvfLXrycC/uA==
X-Received: by 2002:a05:6122:4145:b0:5bf:a179:b2be with SMTP id 71dfb90a1353d-5c7d287bffcmr1352585e0c.7.1788348853140;
        Wed, 02 Sep 2026 04:34:13 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd73a0c1sm1748977e0c.4.2026.09.02.04.34.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:34:12 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97bf910aa70so232376241.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:34:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx44PqS3ApW2zCHPSNZQ4/PYmDxFyhlHzi3esKyz2okgJDWyaSL9Ol5JTbsAKKPXuKI+fBuKWNlNr7CYnA=@vger.kernel.org
X-Received: by 2002:a05:6102:6d2:b0:77b:2881:580b with SMTP id
 ada2fe7eead31-78a1f1aff84mr1204735137.4.1788348851833; Wed, 02 Sep 2026
 04:34:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
 <20260826122742.153643-4-biju.das.jz@bp.renesas.com> <CAMRc=MfAdTMb_4ii=up-ESwc322YYjzseyvAxshM6vUcEGfxcQ@mail.gmail.com>
 <CAMuHMdXmn7B_UOb8f2j0_BOx3d55nA0-0Auay-HLFYWtziS+6Q@mail.gmail.com> <CAMRc=MewW5aLqY66i-uUor3ke6k25rjZh3z7Cn76e_KhHQWoJA@mail.gmail.com>
In-Reply-To: <CAMRc=MewW5aLqY66i-uUor3ke6k25rjZh3z7Cn76e_KhHQWoJA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 13:34:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWN_JUzcF-ueAABOsfvvYuZ6r8Zf_vcBwsrb5ArVXWriQ@mail.gmail.com>
X-Gm-Features: AcwNN1VKD0uOf2MvN-4alfN6qZQtlFaKLsibUAqjRFeDI3iaU25OL_kOcxy9-xY
Message-ID: <CAMuHMdWN_JUzcF-ueAABOsfvvYuZ6r8Zf_vcBwsrb5ArVXWriQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] power: sequencing: Add Renesas RZ/G3L Power Ready driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Biju <biju.das.au@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Wed, 2 Sept 2026 at 12:49, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Wed, 2 Sep 2026 09:10:45 +0200, Geert Uytterhoeven
> <geert@linux-m68k.org> said:
> > On Tue, 1 Sept 2026 at 18:15, Bartosz Golaszewski <brgl@kernel.org> wrote:
> >> On Wed, 26 Aug 2026 14:27:25 +0200, Biju <biju.das.au@gmail.com> said:
> >> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >> >
> >> > Add a power sequencing driver for the Renesas RZ/G3L PWRRDY module,
> >> > which signals power readiness for various IPs (USB, DSI, CSI etc.) on the
> >> > SoC. The driver binds as an auxiliary device to the parent SYSC driver,
> >> > using its regmap to toggle the SYS_PWRRDY_N register bits, and exposes
> >> > {usb,dsi,csi}-pwrrdy pwrseq targets.
> >> >
> >> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> >> What is the merge strategy here? Are patches 2 and 3 independent from 1 and 4
> >> at build time?
> >
> > I think so: one can safely select a non-existing symbol in Kconfig.
> >
> > So once you're happy with this patch, I can take patches 1 and 4
> > through renesas-devel.
>
> I picked up 2 and 3.

Thanks, I will pick up 1 and 4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

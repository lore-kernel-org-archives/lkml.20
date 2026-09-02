Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211D53AA507
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333059; cv=none; b=RZu1EhkKPuwZuECXSYvimxlKx3qikKiqku1husWKzkZMR3DrOfAj3Z+UViYr9kVDPnognIQYdFyVUmmv/AzYZjIqeCABUu+8Cah8GOTknUJEvqXkVk9z+rHaC8ImDmcRio2LwWjPMAwh7nI2HHyzTd3zbAAfEx7askuGaBgPqkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333059; c=relaxed/simple;
	bh=fzWNt8m6dV7XJ26M3vj5sYnnsx+91P3uMd2jJYIJ1HU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQjpSZrjTwwtsSE1zrtN65Jz4YobxWQzQbi9+i84AyTPYWCM/p3FD+cyA9ia4Te8yuJsNvkQdQ7Mc+IaGDe/CaiOvbEBspPPLxxkQCqFezSFo0vYE4U0GxdKzTR9uJ0mDmTk31CM5gDS7YjQsWfVHgb8+C50qW5TXJUQeqnYEvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97cad2f51edso186906241.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788333057; x=1788937857;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S6z6L7vVC/89R/jl0HvM4yW8bp8VIuMDT6yh78Uqavs=;
        b=RZWmg218yyL15l5cLI1orPInuLfmxI1vlvwAv4m6YGLsK4WyoAg56STuLyL2DJ7DIN
         1JqMH0BIPYt/PzAK1oq2heGKqargtA9U8QTsI6xBQYeJ/mHqQmADZpUj8P3+dKB4042z
         OjKI3SyFj+pKBhJTQvu6oJKBDtJL/bQ4est+Nexb6v3LPq1uNzwfZMe8AcCcThggR78i
         Y6aEvZrGVEwtFqrHeheBmcqQcqYnkwSL+ZJGzZr+Aa3Wqf9cdpdcTkEwdlf2Cbm0vYWP
         Y4gmrqxagnthfNeOEqNAlOWy+gDikDq/TsvmhGTP4aUDS86zbmYRiGbTETYRlofy3M1S
         JH6w==
X-Forwarded-Encrypted: i=1; AKwUvBxZdBQo3AyVZ2Q/lCtFDAu+42A6Mqha1NK+coNYYc/7xbZkIWVD8m8U5jsZHBm6RHu3a4/TqbDyUYRQ9YE=@vger.kernel.org
X-Gm-Message-State: AFuF++maJ/1cxFdRo8WCsxyGtU3PtSXxIzvxFwzV2WrDRxYz+zrfDBKp
	UrkguHr9pHcESuEQpqkCOGN40tK0G6nVt0v4sbq5gmczV/SDFIsYXli3JQR1vOdb
X-Gm-Gg: AYBFou2flUFnnb5KC3Qv/Pjl0bJKL9rzhF1B7Meo3/WMWEpSCEKW3rqZAQp/Fcn7+ZL
	XUlPCv+8MPwZHlhX8pVD2jGt6buiU3Mc8mZGNTFZNHbcPlB+iesBYed04g9ISWTZWkrybSQ/s4g
	xf4Y/4jxJdYu8PYveRJz2Eyba0J2gHQbZQF21/MZWCh2wJBBSd2ACfoDd5OuLPjlyH+GIRQsJPJ
	KhGFua84VaVthIOUHO9Wm2thvG5s/9DbamCeDDV7ZWYXbb2OzXaJsDNjtYhA48Z/caUNRTaw/+M
	1FI95EFVn4H1uf+7VZLg+wGY+j49jJ2xUsOBUnU5Znuw4BQAYdQ6ZPPoB4OZ8nmUqmcov1vpHBb
	rR8ONtPgU7sc6+VX+xfHDdWneU6gLRrAWwb9+rWddCFkbDimuASQNXLpjFgMyqXP06SjCAfcPZ/
	EFlyZINdy/ay+2/AZWUH3+IcMPxMMd1nrRsVyLJ4XuuDgV/wF6xIIdGBKdUtKqoBlxjPWxALdWS
	lVCekBbgpRgQ/ifxlQEycEW8FT8UA==
X-Received: by 2002:a05:6102:158c:b0:784:b9ec:913f with SMTP id ada2fe7eead31-78a1f1e91famr847342137.5.1788333056957;
        Wed, 02 Sep 2026 00:10:56 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a19f8f68esm1519748137.0.2026.09.02.00.10.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 00:10:56 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso308044e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:10:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3qfPMZX41o5Qtocz4CI5XC1Jn5XlKgtl/ebFRBae0lDto8+b8uU3Mfpq/SSk2V3psgKxxKOTX+37/uVY=@vger.kernel.org
X-Received: by 2002:a05:6102:38c6:b0:785:3211:f5e4 with SMTP id
 ada2fe7eead31-78a1f1c3849mr970255137.4.1788333056097; Wed, 02 Sep 2026
 00:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
 <20260826122742.153643-4-biju.das.jz@bp.renesas.com> <CAMRc=MfAdTMb_4ii=up-ESwc322YYjzseyvAxshM6vUcEGfxcQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfAdTMb_4ii=up-ESwc322YYjzseyvAxshM6vUcEGfxcQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 09:10:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmn7B_UOb8f2j0_BOx3d55nA0-0Auay-HLFYWtziS+6Q@mail.gmail.com>
X-Gm-Features: AcwNN1Wg6VVOr5E8CpOD13jdheZdgLtuCw94APvhRsqrd_GzRtCymguaJxx7oSs
Message-ID: <CAMuHMdXmn7B_UOb8f2j0_BOx3d55nA0-0Auay-HLFYWtziS+6Q@mail.gmail.com>
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

On Tue, 1 Sept 2026 at 18:15, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Wed, 26 Aug 2026 14:27:25 +0200, Biju <biju.das.au@gmail.com> said:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add a power sequencing driver for the Renesas RZ/G3L PWRRDY module,
> > which signals power readiness for various IPs (USB, DSI, CSI etc.) on the
> > SoC. The driver binds as an auxiliary device to the parent SYSC driver,
> > using its regmap to toggle the SYS_PWRRDY_N register bits, and exposes
> > {usb,dsi,csi}-pwrrdy pwrseq targets.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> What is the merge strategy here? Are patches 2 and 3 independent from 1 and 4
> at build time?

I think so: one can safely select a non-existing symbol in Kconfig.

So once you're happy with this patch, I can take patches 1 and 4
through renesas-devel.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

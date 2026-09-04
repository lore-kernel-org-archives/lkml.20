Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D7D3D1A8F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508865; cv=none; b=YgPoueieo4JNBkOnWyhyh2r9PraQJ8oboaWsxgAso7s8ctCgGP5SQ2PofnCcf/Mxu+ppd5zZ7Ut/FPIN/Rjt5l8uDcvEeuMwZxWhtaNJ/+rosiI8RJ4bdt7Zy82kqY5jV9vVALrl0J/WmUU/c+W1QewO+Di9gNHwbpI15RcRLeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508865; c=relaxed/simple;
	bh=5STgmEpuSXLAENtQSqsuFnM5l/nP8haJUcsvw0rzQek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NhOvHBGMIZgU2J4HxVy6UpY2w88U38gvw3NbfYfJBT1Tn9cfkK0R4GBJxPFwyiGq6eHQp1/3tvHW4kNIUacuV6IONIosFeWb5H1/Re787jfFHnGfvtzg+IyBSnIezIie/WWxcks3liEqmeUXY6A0Z7oGksvwu01P9vuAQn2+dfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7542a2ee156so435773137.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508862; x=1789113662;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DHcVzyvg5T1LbBIIYfTsEAB71A8C4BjQEyDgYTrzH78=;
        b=Tk+4PNAxtQITqAMlhYggTnwKWHoRUS1ZPKAS/r/jsdhVjzo9w6dgoKudsHfUuCe7+b
         EuLJ8Xdfhnue6eUmXhhUsCgJrWFFl1erjQfe7xMMI7qUkesOFb/jMGk/73AxjukPB0Gn
         h8SM7v3Ob7t9Cyn/811sWWStcKcpmC7+M1uH7WetoN/k+NAHXa5OdVJwRjlpSKc+7jtn
         eRicpEvGMPn4VdD1aNKcalIlLh+L6CMb5ReGb9rKgbD4hhN5nOXgOw1HK2QPlWWLgkb/
         3NcX/ClXC9pFO3BBWAxls+vZW+I6CMgD8qI+XDAIcJCVcqMcLrvNoviA/sn/H7m+kNmm
         8/yw==
X-Forwarded-Encrypted: i=1; AKwUvBzBO4sovVnMoyiC6tJjSH5rvd9OrsaCsO6zcf02NGPUdDuF21IuTKAandfhjdg7P/+U9GZQaHHKKQDvIDI=@vger.kernel.org
X-Gm-Message-State: AFuF++l7QOgX7dyT6NC3z1TzS7PnoGV9xZhgRfLpMVv2oI2Hji6mriGQ
	3hqqoZy0gvBgKqfjQuMmMUx9Lbfha4VDD1Vz6GAPTDzTO235Q5YxCbi4nyOom2LzURM=
X-Gm-Gg: AYBFou2JM0tWDTA7JtIuFtBBuPRdRr2wqBBHQKOQSRX82bbKcW/M1lgZ9VwZ3n8t9il
	VjnPgIeGvsNLM8sNVVOGqhtY4Sc1fyFwiq3O3BzGPsbS7d3jLH2EfD1sdRUDSMZiWNyg+zQ13z1
	2NLTGzdSX64FECrahxHa9fUJUOESN1PzP2DFSCEfSesjFMLlvs5WUM2iaO1VGNnigQdioVSd2bp
	IfZGvtXxIHsFOMWFOtUpx5NSvTf8+6k1cA9/C2yHJHObl0kkfVBCz9Z7BeX6v2J3bMBLgQOG0fP
	iQBc5+g8djpUleeGX0U57OfAKAB6Zcs0/OYYK4T0ZDP4yhYhYIOtFDaP4hrrmnWZUFINEUckOlU
	Jg2+Ocv+iLmELtNiCeNLwEywm8Hfrgep0p68Cw+aaDoxE/nDVIXuNk0KIyaBToWcnhZSJK7060+
	mIyVnpyGiYQE11PwTsUufMIo8mLVKIhb5mqI6meHcC68brs/TcslYoB2oiejHzR6sdsvSg25diN
	WuwX7QrNbld9KlP9hZEtIP2uw==
X-Received: by 2002:a05:6102:1484:b0:785:1d9c:633c with SMTP id ada2fe7eead31-78a4a8436b7mr1486177137.7.1788508861981;
        Fri, 04 Sep 2026 01:01:01 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ad27bdsm1285924137.6.2026.09.04.01.01.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:01:00 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-74ab99038afso512721137.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz0n//yxvkUA/4WzZBnkCjUgOLrsNMsfMQS50aUBpfGiA8mwGdIVfGigjTEplMurEvCxDL9tDnhWbb15jQ=@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:778:5bbb:b2d2 with SMTP id
 ada2fe7eead31-78a4a97bda0mr1434786137.11.1788508859808; Fri, 04 Sep 2026
 01:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820171657.62815-1-biju.das.jz@bp.renesas.com> <apnUfCIcTG4bmYZF@ninjato>
In-Reply-To: <apnUfCIcTG4bmYZF@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 10:00:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOY2CYKfhmx4qmRPkf3a002NEbWuwafLvrJTXvLb9PLA@mail.gmail.com>
X-Gm-Features: AcwNN1URdf1eUYUIsC6Dx67B7nRZjxmnJO7wd9vXW0tYWJ8jFblIIeeoKCEUiQM
Message-ID: <CAMuHMdVOY2CYKfhmx4qmRPkf3a002NEbWuwafLvrJTXvLb9PLA@mail.gmail.com>
Subject: Re: [PATCH v24 00/15] Add Renesas RZ/G3L SD/eMMC support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Biju <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 22:11, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Although there are still issues to be handled, I tested this series on a
> R-Car S4 (Spider) with HS400 eMMC and on a R-Car V4H (SparrowHawk) with
> a UHS SD card. No regressions.

FTR, boot-tested on a wide range of Renesas platforms (RZ/A1H, RZ/A2M,
R-Mobile A1, SH-Mobile AG5, R-Car Gen1-4, RZ/Five)
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

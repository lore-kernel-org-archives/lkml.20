Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5533B50C289
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568209; cv=none; b=ZVgRXMCMtMzYaTaWxtS/mryPV9yy1oXP9b2mtb2Ga9rbnxYnvDGRgzNsB7x7EokaFOcioGhe62vry3ubFLSu0JSh9G/afmI8ae0/HodA8balD3yl9Um7tOFCMn/3R4PCR5DwR49IGKUF9+UqTop2jqqyo+Mxd8Z2c8WAjvGgyoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568209; c=relaxed/simple;
	bh=coXDW1UKwjEqw5hqQQ9LkeV6OHpNHzYpysQ3EUt3FgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rE0ZvjTzQ7nSZjJQ60BpF8Gdc8ihJivbjXpv6Tsh/m7ZdI9XXjDm2HecUMHPU9HIGtmplOT2pyKV2Rm5MYtH0U84ul0uwl18reydTv35yC/LEOtD36PjzNp8IT0Jpa7yLr6Gwu1ta5DigRNiJc0NLnVAlHGOF6KBucEZFzZjbJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-79028ca9371so284548137.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568207; x=1790173007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NZHEC+8AwtULIzRYVyufRQWIqPmnKtw3N56/Q6kikwc=;
        b=C4Oaq+XIfCtTkhImeRn+KC92TIG8sx9swC8Ut+OLdX79X+KaGd9MJGWZHnqsf51Ifx
         bjfy/7O2C4vVWi/Cxycassa/CbuBXtXmG6eJ0Dq1RCHEJ9HMLSLv2m7oFuiRrJ19Fv3u
         2nUHOiMfToKA7ncinkUzYaYuOPP0iQOTKJCxMw7l/TfZS3MoBOrFzInQprBKEiHao/dM
         2D4/kMAb9te28fjt9jSqBaTt2M/2hoXQbP4K7NO41wgbdO4sEyIMPVXTR+1LiK2f0xOd
         e/iy6spBNdjvKe52DivmJfHpzLBuAzECg5GtGakIMI1Doddz8KJjIg9X9vyWIxcRgRX4
         iywQ==
X-Forwarded-Encrypted: i=1; AKwUvByHDB8WWiHcN5Gq6JjuoWthsYijq8KXX3nN9YRt9WYiil90lLqTSjt48bdoZFYvDn2lYCSdLaKWfK/HL9Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mQ1UuBsBzvP3TXfxpNxh3A0xID1HzHmgmfTxtIJgVOyDMxNX+v
	isHvzbZY74c7YwPB9phODkQPz3EL9ttvOvuJjdZ28nAbtZig5MGuAM+IJMq+BBEVveA=
X-Gm-Gg: AYBFou3oatjO4Vp01YMR0eFKbSJ5L5F8LHNP83X8vukFJZq6/juDKp9qou4yIgzATtP
	ufRgd0Ax54roHDs8DMms9yyCvZ7ZWg7SUfEfAquw7uisbCkvfjfUqTvGxIdL/lNTM8tFmIJ/1gN
	PXgIB6/gyHZLEgvYEbkg52QNmWazhrsKdR3l2dSWjQ1x/JLuH4/T10y4VGinsVp49VlJsROJ6/h
	jGWJ2zbg0BdMHDTMW65TQw2n+w1tTeRmoGtOzqt3hDH0xkpeYPOySWORB8PFE+RZkvqWSEU7uBb
	myIAmP958ifbXrZThHDQHaOEH9GLuGt1MFp2DVPGmWpimO6ry8eT5hbnZWnyVN44K5jtoepXH+9
	Dn5zLwxMqopSCduQcOnS3sCbdT+pRHKce4YUdo7teI/P9QZ0DFbglIBMP2+Eex2FoQ0gQOpZuVG
	QOGPTJYyfRecyCjcCdu+wdgKVupxlp19pBrPQHnKVCPhn5EvEjuVSo1RnNIVS8OaItrsyZGNlqn
	D95pyTHpTcjzcOTc/CZo9RhF5A1mnOjqTOE
X-Received: by 2002:a05:6102:c49:b0:79f:7e2e:c64d with SMTP id ada2fe7eead31-7a027701bf0mr2831873137.7.1789568207032;
        Wed, 16 Sep 2026 07:16:47 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79fb193720fsm3153939137.6.2026.09.16.07.16.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:16:45 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e504d59so327401e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:16:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxbWLwy5HLlFw3rYcryjELDwZudxqXdkaKOiABEgs8ok8ECyM2GBDDPbzAdUd/JqacX7A/uPyjVsbE4MAs=@vger.kernel.org
X-Received: by 2002:a05:6122:218b:b0:5bd:cb34:1b70 with SMTP id
 71dfb90a1353d-5c99ab6ca62mr2524815e0c.1.1789568205123; Wed, 16 Sep 2026
 07:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-3-wsa+renesas@sang-engineering.com> <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
In-Reply-To: <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 16:16:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXcU3Eebhb3aS2PFoUdZsK=cmU6sjAFWhMRiPB9eczKhw@mail.gmail.com>
X-Gm-Features: AcwNN1XzX8LDXZHoO39ZbD09Ieg2WgEZcpweNI1kL3Ki-y9eZuEEawv4X8fTBcM
Message-ID: <CAMuHMdXcU3Eebhb3aS2PFoUdZsK=cmU6sjAFWhMRiPB9eczKhw@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 16:01, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, 12 Sept 2026 at 21:20, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > To help debugging, offer a list of registered hwspinlocks in debugfs. It
> > will also print the responsible hwspinlock_device and if the spinlock is
> > currently used. It does not show if the lock is taken because of
> > side-effects. Often, reading a lock means actually taking it.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I have been using this since quite a while on R-Car X5H Ironhide:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

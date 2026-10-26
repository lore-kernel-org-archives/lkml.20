Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792992124;
	b=sawQbcWdmaWFRL3n2OQSkOM8oTY2C+SVXJKSnvakr2Tibg4iFZjTRb3LAuPC/BUaLrAx
	 q+kg9YK7n/P0N9PqBGlXzIt6zAiDzzcmeU2i1ltN52dKjmIGph9vwufJk+ndUvPV625eL
	 wwNScTjOrc8Gcu4B//frqM5dB3Di9YD/sG8Mn4ieF36d5WH5pXk5Scs9NAI8jyWF6bZ6m
	 3M2t0VjbadNNs0vtku5NGkAHAwj2ro+0V5uL/4zJlyz3XBa4CTbTq/VWbiKIK4inswDJ/
	 mQPUrYUHo8vId9TecdFoie7HbniltkIFkrEhf/zHIo4q+z9/duSI8dGEQz9HxWLBbXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l+o7YHaaQtyvRVJCVlFIVIOOyJjpcMnJTZEtbdzMaE4=;
	b=rUUmiYPWMeFtaFe9OezJ9LkaPnNXVbIdx+/of41HsEe0QlTKUhYDI7kxTNNjbNy/1YDx
	 Y2q4x554J54u6pU5h/E6Dy25he40hNyzmGpx+Sp/fNpyMCYt4U/o8lkwzcOqSLMpkgWkw
	 JcV8Pjczah8BOCONFEqEMS7NAgP/PaZTekqEASUtKf9GMLyOGBich0o929ciQhYbE0hl2
	 X9jgVI6wBfmBowPnfb7WV0+B5lDdVxRf3Dfy/GFpeFkSvb8qIxVOdgU+/PdGFZe2BZWcJ
	 5Xkq46Rl5zk1soyKcrQKMzlAW4X/mxBmGUr8kffHAXfw9aJXnn33hitydSbLYPMvvYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bc5WQdyH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96246606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96246606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bc5WQdyH
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-988bb309c2bso1476062241.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792992122; cv=none;
        d=google.com; s=arc-20260327;
        b=sd639dXOiAB/EevdzXxsof3AhVARsEeZ+2HRlgIt5aXcD/g/bD4dIZ0CkJWPaX1G5B
         F0cvrZeup9Pc/r0xq9Q7+pkJFBHCwT8X7uNHvut8y3x8kVV3dGp1PgrX/Ru3xWEpEdE4
         rl1Q1W8j9Aojao/e/CCDYgx7FRjUxUuz8aJB2QEUI0JAmuc9Iu24y0alefBRODrOHOOt
         wOV5kXLpjJ4xkAbHkyE8ux3G5F/x1cpRSyCyNjhmpu5+sJMzWt2yd7MvQagyuX0Z2vFq
         u5XWCMjIW++2w7u9qkoFMyKoHsvNOhJsqECks8dpH1D+hCiqzb+Ma5zKcvTBJ5nE3ioC
         o27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l+o7YHaaQtyvRVJCVlFIVIOOyJjpcMnJTZEtbdzMaE4=;
        fh=P4TDotP8gsw4PPYlbw1oo5tgTsJwlJRxjA+x0I8Td6g=;
        b=frmw5VoZToz1bdX0jOQ/0Y4Jo9OUQKW6rzzoM5Pl6nHQCLUC0redCo5epZtJf0aeDP
         QJ8xvNcjxyriznj3iK7M78OOn0zxJWh58Aay0y3Q48zt+2xIaMVzcCV0ay/dDlncMGwz
         TQ4dxuaBTGvRhMh0TMDH4KqVv9qopK2ZYRh7AerzePw+rPShfvhFXXKQyfFVgX57qIJr
         j2Cwml79aEOePDHw1+heg15kmMtXsZsXWkIUMtYrW2WOWu8Fr6IEijN2LCFIukomHn7F
         8KsnP0+mDba9LgcJADUbpCvPugqtv7UdUoL6sycLD2vdNBjexfmiwpA+EqYXk+ztR+He
         8THw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792992122; x=1793596922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+o7YHaaQtyvRVJCVlFIVIOOyJjpcMnJTZEtbdzMaE4=;
        b=bc5WQdyHexz4RjeU1UmexokrezFYsyEkH7XDhWDE5Rekp300eoYEGKUzutj/Abz+Ap
         130hK1mybqk7/RYOiVz8rO4pjETDiCOdb1mbjh1EfkFp/J2uG+nvzN1twhPzvtAuMlvm
         7oTO8r2Yw+xnDVtYkOTPf9WAdlWQgsZNl8Z3RXEZxlptLx2xtZP1CyHAXl4QyWqWs7Q6
         RYLfGTPLvRxdQC7LIXe9lJ2FkLXVRl/JGannVzJDRVhjHwRi1LVrZKSKwijcxPjxGOHj
         HretMb9Z/JRAoCuvsqLwPKDsAbjl6ySjY+pMjkmqbiySJ/Y5AQVN0Z7b5Zgh+6sLS1td
         NkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992122; x=1793596922;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+o7YHaaQtyvRVJCVlFIVIOOyJjpcMnJTZEtbdzMaE4=;
        b=XjAWtwI8ETF7P+x48Sk0zb1BsBeo247ZDjzgw4S5zkzNNAaOnhBvzvOUkjtvZTmHRr
         DEX3NPcU5aFTTzVQHVCQ4/bcI9+CL1JyodGfQqJsIA/QT5uSm3MUlSslWSJ/tCcolnKw
         Jsa29IIWpVxU6Ep3f4VHXKjSI9VYhwy2xPQJF3bnQNBRXNaosUClO9UBomqyCUouORQT
         /5+oECmp/uwQb1equCSx3oJvAGZwFm4tu2PC/VQv1K+9xfKKnlczJAC821aibE7fHSG/
         YFMfvEUR3Z274q2J6vESRbdo2Xn4SevTg/D/XoxFAESluch0OtYnF6c8oF+fF4A3+JVN
         Hacg==
X-Forwarded-Encrypted: i=1; AKwUvBzV0EGuYbMbUFBBrXENV0IqLldJBhvoF/NmqcWlSbcZVaKfuYSyoR4VWzCWxC1e2CBXDwERIjdc7PxwT1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKofuPS7uKF+CWWS2sLUrlHcx58rppMK91tUVWskbUG44O3ro+
	b1xI7PWTaIqyIMy8hhI1NfalDReN7fNaj4iHJLRNEtE5BRzZsvmxMqEYewazZO8U8MMfnc9KS9q
	6ynUtTSHAUO6TAJlXR/fRTiz17i1SlHo=
X-Gm-Gg: AYBFou1rN63jXVG0RnJNCI9vvS2hoEyTtPPfKum+T4PyXp2wHVAG9IN9ZWKe4sGbeeb
	Y6eal1WZJQRSuvUJc/Xod19GGhRGJNnLPrjrSnSQXDDe8asoq5BYV0iQ2ZiDjxWn8emv8WpJej8
	atVxYqtZ8Ujbvu1ZLDr9lTElHnLb5Zu78b/qh2Yf2LxaBVmswPdvZ7KjkeEU6HNceBkk7jjXCLz
	pY7kBm9fWzkIDrkwtKFZskMzdQ0k3SvTimw1hxfVYBSinpVOyvyX65dHG+LtgVMTjImzWx0MR8Y
	J2+6fDhqjYpJ06cMKtjBuh5ubfZlRiYvkQJhkMzjht2Bj/wnCxkbIVm4LDnI0uiCMXTZ4K34UZu
	8bnO5eo3fnvvNOSmGg/1FklqkNfxktREeLuT9RnW6IX8Gz0woNQZ8NNcpp7AnJ6WBSRbsUQGSy9
	JLhp4Cl1czcknTZMdCeisOXg==
X-Received: by 2002:a05:6102:2c85:b0:7c1:9f20:36ad with SMTP id
 ada2fe7eead31-7ce5ca07ad7mr2086245137.2.1792992122575; Sun, 25 Oct 2026
 22:22:02 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024172641.19424-1-meatuni001@gmail.com> <at5d__q_RzGad7zt@ashevche-desk.local>
 <CADqcGBmOxJ1ns87pNmaSNVfCc-LNsTsf6YgnnZ5i+x4+dH+AMA@mail.gmail.com>
In-Reply-To: <CADqcGBmOxJ1ns87pNmaSNVfCc-LNsTsf6YgnnZ5i+x4+dH+AMA@mail.gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Mon, 26 Oct 2026 10:21:48 +0500
X-Gm-Features: AclHuK8vkB7NkckOpl2d0PlrXPWMHOQGPhx797u89umaHfztF2B1Jpqb3Rkh5mc
Message-ID: <CADqcGB=ok=Mr=EkhqjEspqMGOrE_ZSj4v8PkoKosR_=8wfUxjw@mail.gmail.com>
Subject: Re: [PATCH v7] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: jorge.lopez2@hp.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	linux@weissschuh.net, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review.

Link v8: https://lore.kernel.org/all/20261026051740.88791-1-meatuni001@gmai=
l.com/

Thanks
Muhammad

On Mon, Oct 26, 2026 at 10:16=E2=80=AFAM Muhammad Bilal <meatuni001@gmail.c=
om> wrote:
>
> Hi Andy,
>
> No particular reason. I removed them while trimming the diff, but
> you're right that both comments are still useful. I'll restore them in
> the next revision.
>
> Thanks,
> Muhammad
>
> On Mon, Oct 26, 2026 at 12:52=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Sat, Oct 24, 2026 at 10:26:41PM +0500, Muhammad Bilal wrote:
> > > The input is copied with kstrdup(), which stops at the first NUL, but
> > > the full write size is passed to hp_enforce_single_line_input(). With
> > > an embedded NUL the helper reads, and can write one byte, past the
> > > copy. Use strnchrnul() so the scan stops at the first NUL, and return
> > > -EINVAL for a NUL or newline before the last byte.
> > >
> > > Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.8): writing "A\0"
> > > followed by 4093 bytes of "B" to current_password 100 times returns
> > > -EINVAL every time, without reading into the heap.
> >
> > ...
> >
> > >  - Drop the trailing comments
> >
> > Why? At least The first one has the same meaning as before, what's wron=
g with
> > the second one?
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >

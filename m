Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794475507;
	b=s/GQRejQSG1EaW1WMI9BLGSlkISxhm/Rgy8Kx9I76SWAg6o6igHNSqQOVabnPn0PFQHU
	 Nrx3cYKIwEiGhsPG+DEdQRxpPNLPa+1nZmkw/sYPbT7jxg0F91IPrOT9DtNyL0OLvu7kG
	 dvfXZ+5R78JER+dR+fDHy8vY0TRCbfw/YQUmlpqc+FfeVSsvqZroFbi/v4T3aXpd3wwat
	 HFeF7ZCjtZPi8u7kOX/Wm/G6XC9XmlpKVD1Qq+LFH9takgcP356XzipF1bDA/Aw25+/t3
	 dlxPJ1rMNadwJqseM6Z0gQUIAkY1u/eWzGje/WJrb7u5qwkbHgZLmeUrbeFWHrDLgZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aAW3v6GEJbuYIvU/kMT5hk01048H4iK9Lb9vDkzw68s=;
	b=rosEBPAIWGK37PYOGlPKRSD5IC7nyVWr2nBhOy6imbcF9l4CfXZrz5ldzNgLOTVlJlsQ
	 D9h0Ubli8HCoFnY5qcc1B/8+sZW6hz5/pqn4IopNmUZhcJQnG4MGPwMMLAuBF/1/LW4RE
	 cq9VcyFCIgm6lfLDELW3NUW/PQSxNr9ok+WWbvfe4HY822zFI1NBsLuAXvtjgJ803VFYn
	 6u8G0D2ncdRktsEmYyyxn+iTdHDWp4R6mGe7p0vMkqptGtLUiaS7I8nZ5n51zDiKx2083
	 i5TQ3CKqPRe1AnnLQYKDnBIRx+Km0s0JFXUhh7h3+V0D6g9mkkphMk3a6G/Bp5jkveA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SU8Xq1qn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923D5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 923D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SU8Xq1qn
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14edde59eso110036e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:25:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794475505; cv=none;
        d=google.com; s=arc-20260327;
        b=WfGIns81SFmlnNDeeezSFrrI0aXP0KbDpg2swehGjKrRT+CKlagXnxW8TpKrzjKilL
         sMPOs544pqk4Xy9T1OCc6P2ADfXWB81zuzh06sopJ6vTvR/zUuVD5RWl+HvRj1H/S38t
         h8tBrx94OCSlO66Ne+sgT4XBe3pEqMVDFnWPZtrpeWIZTPwrBKcEnKEeL7cGHOXXPuNQ
         AhJ4yiR4lvHy/ZUxiHOKgcHhSpHfPfjTYmFaj/+1gayz8wL5IyUBd4KHyuG5U8gqi2o9
         f1Y1oXgghBG6O17IirzUBOv1VmMCRL5lA3MkIdb9XcoH5ATte5KLshwoSE4Xgig/EdE8
         dKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aAW3v6GEJbuYIvU/kMT5hk01048H4iK9Lb9vDkzw68s=;
        fh=QbgM15/sxEUBDhRSNrHycUrYl/9CaprLqPsmbblrdcI=;
        b=Ix6C62u5QfeciNHzwMLbsXcwuw9ibzihTuoibuVf2yANpLAz/HTysAR3SFL2E8WDzH
         Xr3l2sFS4RinSS78OLa5pp2OiuZJUGn6MOErPUzb3/KpnC+sM7m5YOtcrPfcT4ZlCzqV
         p1YtIDkpmiTex30sjsvFz66cxHVUx8puVzFt+CiaHBbxon7C4xM75JoKoKJswDNrJNTI
         gh8Z9M5NvPojnS4f2PKCBu9psECMVNeS3L8h/WajdoX8OIOiAK7Ol0wP8key9qDl7GKW
         56xlUsQ0a4zvAEOVQHj8R33q1TUO8rlUkYbS8oo1LAV2ykjUpHYjYZHqXiGEHq4DKlt5
         5oxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794475505; x=1795080305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAW3v6GEJbuYIvU/kMT5hk01048H4iK9Lb9vDkzw68s=;
        b=SU8Xq1qnbt1IWR/03+hYY5zLmHV7DIs08Op0x+nkGFaSU82dhodpgTiWHcHXWsyout
         EtbSvFl025pamBI7sTtLwGHwXJUjc55TvUh4nG+xFOAtmcpyeHAef9oxXECrKZW51zcK
         EWOmNP4Chl4L/I9cZHi2PC7ju1Urv+dr/Vi32oP1ruvQxn3s8q4526vzuNc1bhtf3ynS
         3q/KXBQ8SVg8+PuOpfKVgW6IVn8wDUiQaQT6QMPs+hXCXAmjVvMMMwiLp38lSqsWKlG9
         5SeZJ5vszdHtb3PJnLi7AaH/GWrOaG1RK4bH6EN2QQFjAUz/TNpbL4MXcWvunft9xl1D
         gwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475505; x=1795080305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAW3v6GEJbuYIvU/kMT5hk01048H4iK9Lb9vDkzw68s=;
        b=nNYIACT0ydxkoEoC9oq5rQIJS5VTU2/PeAyqpGuu0u4vwVVENg+GPZGPLsyldkNT4a
         E8FXaDwMeRFZ4pOHJi7+98QqVCd7KSTriixgHfImHBRwXI4MwlLWcx2zb2oQKpcOUKpk
         h4M7V5sIstiKJQ0AEEyXiohKdI8kn4VPY0aMFUQKNgc9nXyQDKiKseiiAfsUP7NVf9Aq
         ssPa2KxleSZwmmNDEFEaN+D1rn//rJv7qQrEIj+jFCkpm74walKTdbFp2cHTCNWgRnW4
         x010u0Dvnru+HXYYE2ughBDZqtQNZsmtR7rvgvIBxaikwa4c2EKoIpnB61WCoKB9uQxB
         Es5Q==
X-Forwarded-Encrypted: i=1; AL+hErEQqfS+ZMshJIZ4CipyZea2TwpaKKcFDmwAiy4NjZ9wyiEDt83jI3DjJuL8fGNMXsHPsSj/v9RtXzxafGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/M6Qyy/SfXNtHs1Y5u+JpR4t/6zYI3kx3CunmFaBMveRXFqXEg
	ooQrf6lDTBNd/zv8Ks6ss8Ik/RkoBbPMc8t2WbiML6QY55nmGhnm1kP5PcuNugaVc0rks9297WZ
	2+QQEsLiDh6UYSCZY12TonLinNCcnu6w=
X-Gm-Gg: AYBFou1+Q4DtTH1cuADaK8prmDFxXMpLhfXc1S01VGftsTAYtHcPV89eArFj+uIXvtx
	Nyok6ximKv5kzR/21eKAuwqImPS0G485MJ85nAv2qyvc0ZW0dq7F+BDBPXtXIrYN/mCs2nRckNL
	jzDeMa48kQjBdwN2NwD44PtJoK7UMJK9L3WplypqM6/XuiePmpG1ptkAhiRPEEZAw/CKeYcJiAe
	ohgEAQSXroo+qZsDkSK8iS8nAbB/gVVzkJ851s1YSotyaqWig9DXVvNf3thHxHp/MPwvEB9CyQC
	xJaGUP/SJiW/iSBQHGiMzHxnLqlHCSu86BXP2Rts0guuCa4k5VNCAmnGRxT2GTA0KGKU6EIRE5Y
	Gy5rOgD0+p7vmC31hvM3WW8DDb+e0V/BSXuqtinhxhlZ2cwDpOVmGnQqTPobR5PdLlWWuZJU=
X-Received: by 2002:a05:6512:1105:b0:5c1:57b9:90d3 with SMTP id
 2adb3069b0e04-5c15d5a8091mr1824839e87.1.1794475504618; Thu, 12 Nov 2026
 01:25:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-sun5i-hstimer-arch-sunxi-v1-1-9016f63e186f@gmail.com> <CAGb2v66=UbyC0jaW6tjeux5VruUAXN_64bAs3+LyS=CRG1qm9Q@mail.gmail.com>
In-Reply-To: <CAGb2v66=UbyC0jaW6tjeux5VruUAXN_64bAs3+LyS=CRG1qm9Q@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 01:24:53 -0800
X-Gm-Features: AclHuK-hAO4EvOdrjX-CMAuSOsrtdv-9s5jREBggl1QgG0DXsRBqy77zUtF8Ctk
Message-ID: <CAEy9hNXfqPHEhDnfP+S5zbvFbVSiuMUALVRNQLPEdOLTsehRZg@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/sun5i: Allow enabling the driver on
 64-bit sunxi
To: wens@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Michal Piekos <michal.piekos@mmpsystems.pl>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Wed, Nov 11, 2026, Chen-Yu Tsai wrote:
> This doesn't really say _why_ a user might want to enable it though.
> The only reason to do so is to get a higher resolution timer, but
> the rating for sun5i-timer is lower than sun4i-timer for both clocksource
> and clockevents. Realistically speaking this is never going to get used.

Thanks for the review. You're right: with its rating below both the
architected timer and the sun4i timer, the kernel never picks it, and I
have no use case that would. I'll drop this patch.

Best regards,
Arun

On Tue, Nov 10, 2026 at 11:33=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Tue, Nov 10, 2026 at 3:07=E2=80=AFPM Arun Iyengar via B4 Relay
> <devnull+aiyengar1990.gmail.com@kernel.org> wrote:
> >
> > From: Arun Iyengar <aiyengar1990@gmail.com>
> >
> > The high-speed timer driver binds "allwinner,sun20i-d1-hstimer", which
> > the H616 device tree uses as the fallback compatible of its
> > "allwinner,sun50i-h616-hstimer" node and the D1/T113 device tree uses
> > directly. SUN5I_HSTIMER, however, only has a prompt under COMPILE_TEST
> > and is selected by the 32-bit sunxi machine Kconfig alone, so arm64 and
> > RISC-V sunxi kernels cannot enable it and these nodes never probe.
>
> This could be simplified: the high speed timer is available on many
> newer platforms, but it is only selected by the few original platforms,
> and not visible to the user.
>
> > Make the prompt visible on ARCH_SUNXI. The driver registers its
> > clocksource and clockevent at rating 340: below the architected timer's
> > clocksource (400) and below the sun4i timer (350), which ARCH_SUNXI
> > already selects on arm64 and RISC-V. Enabling it therefore adds a
> > second hardware time base without changing which one the kernel uses.
> >
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> > ---
> > The H616 and D1/T113 hstimer nodes and the D1 driver support were merge=
d
> > for 7.2, but the driver still cannot be enabled outside COMPILE_TEST on
> > arm64 and RISC-V.
> >
> > Tested on an Orange Pi Zero2 (H616) with a 7.3 kernel carrying this
> > patch and CONFIG_SUN5I_HSTIMER=3Dy: the hstimer node at 0x3005000
> > probes and available_clocksource lists "arch_sys_counter timer
> > hstimer".
> >
> > This patch was developed with Claude (Anthropic) as a coding
> > assistant. It investigated the problem and wrote the code and the commi=
t
> > message; I reviewed it, and it was tested on an Orange Pi Zero2 (H616)
> > as described above.
> > ---
> >  drivers/clocksource/Kconfig | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index da83483296d5..971491d2e584 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -172,12 +172,17 @@ config SUN4I_TIMER
> >           Enables support for the Sun4i timer.
> >
> >  config SUN5I_HSTIMER
> > -       bool "Sun5i timer driver" if COMPILE_TEST
> > +       bool "Sun5i timer driver" if COMPILE_TEST || ARCH_SUNXI
>
> Nit: I would probably write "if ARCH_SUNXI || COMPILE_TEST" just to match
> the other instances.
>
> >         select CLKSRC_MMIO
> >         depends on COMMON_CLK
> >         help
> >           Enables support the Sun5i timer.
> >
> > +         The 32-bit sunxi platforms that have this timer select it. On
>
> "selected"? BTW I think we can drop the "selects" from those platforms
> if the option is now visible to the user.
>
> > +         64-bit (ARM64, RISC-V) sunxi SoCs such as the H616 and D1 it
> > +         registers an additional clocksource and clockevent device, ra=
ted
> > +         below the ones the kernel already uses there.
> > +
>
> This doesn't really say _why_ a user might want to enable it though.
> The only reason to do so is to get a higher resolution timer, but
> the rating for sun5i-timer is lower than sun4i-timer for both clocksource
> and clockevents. Realistically speaking this is never going to get used.
>
>
> ChenYu
>
> >  config TEGRA_TIMER
> >         bool "Tegra timer driver" if COMPILE_TEST
> >         select CLKSRC_MMIO
> >
> > ---
> > base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> > change-id: 20261110-sun5i-hstimer-arch-sunxi-167ea2ebcbd7
> >
> > Best regards,
> > --
> > Arun Iyengar <aiyengar1990@gmail.com>
> >
> >

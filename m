Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84923B3894
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974931; cv=none; b=gp7SDcUFgNmX5OMOKDUYQ9au2CrqzGLuEH06fS2ZSvjguMqznAWc8tTp3FudIsN1U9UPUOy946rOkxo6NaQK2m4TL1P3o0GmFzeKgffg6bm/Dw5aoKBBI8RAQJVOhuokZn/p84dMtmfrdKtdCwyV8uaIXZrgaeC/L5sGSH/b1mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974931; c=relaxed/simple;
	bh=mlXvSVm/Lq7qa7w+AV7HA/L3OjWuvTwojTve2NS37ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hb0M1uVEaCk/jSaAnnC2UfRzi4K9d1+AcMUHl9jpTxAd6srg292JoKN856hOH9LdYrBLwaroJS33hhkNCbCe1ZkwhlByagcdpNKY3d+pQpq4nPrWRHsv6JjA5NJm+8jv2MiQMlVuGLmooXEatxd2NKASXqTbF5n++0Boa8LL+zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ec395so23249771cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974929; x=1790579729;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HB8j5/kP2XPOkdK+SCbhJLf9Uj+WB32C7OC3D9kNjGQ=;
        b=N3kLZaHgAl5qq6kXAgHDR9Pmf4pa40YFoAug1pcuTWgVHszwFwrb0FgZPV22TQ6U/S
         O39uFdmD4RxAsokEY0rGq4P7Xck3Mozj+6f1DD2SdT4K9fWYinqxleM2T0nl3RY8H6bh
         flMHWCVEY4CWXGDKQ45cEPWuL4x+hbtsoBkQpIVzYWxGaD5ekLTqS0dkzDh0myP+9xps
         zsDx68Fv+k5rzuu7tGXY9JKv+4aWBuXWXZ3cDXWK5sADRohfaURT99OV/BQJKcmQ1w4n
         fardX5jNpQ2qXZs9AolTgk12yeqeUBCKywBH63MTlPgqafh9RqZUVcbkarPP228JVNAd
         rLlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTZ68RM2NBAZOfN0trjAoGEQPZIYp8HvoPxpZOjCjxggfXILGhUNGFTyxt5jVU3DfAgOrvsMOpan69qxY=@vger.kernel.org
X-Gm-Message-State: AFuF++mWR4R80c+thkN8gokAga6e4Ikc7zQ3+Lfpbb3JAPtKPQLsAAUF
	VMf4A3tVX97nA9Eeo8VqsVyVLOfsw+QsZ/0jXuj6TLqZadrYyZqxHLDE0g5T7v3i
X-Gm-Gg: AYBFou30TCokDMCI9ASm3EQymXPjplDnibLG5pZRtR6eqeUrS0LBIzl8WInagRxuLE0
	QDdc/Z2U18cZb77ibkUBzIetDlijEnp4cKUALid3pZXGmp3qs7S/nMUwB8R4fcpqhtFUL8qrU4j
	D3ADpFPd5vMx1i9mMsGq/jjipa6NRFF5iRPZ1GCbx30xNAShuiHBelERMMJqSGX2IwxQs9vF/bv
	UlaPVPZ8VmH8xPsgrDLwdG20w0lmboN4lHShJ7BcjA3nbQB6ORBatY6XChAQUNT1WeaBXCe8idp
	dRNlPK/lvdH84nDBmAroLPhd4yaZvUbUXPMXJow8a91ZVixf1Weh2VOxmi3v+DMgJTl7JPwpN6d
	NCmW8HUa8nAKWcwDT4MlL4r6RhC30pnlbWiLpGsO3+59ORT3EYqlxyDFV40fieILzDn6aU6FJ3i
	qRxGCs12r2FwsFaSnkxPE4lNhWHBUOergCi5Ga3umaIPka49VPs7OcwYa7g5qm6YaWaP/Zbujjp
	MKzvkr3svBOZawGHt+gOo27120AWx14BV63Iw==
X-Received: by 2002:ac8:5a89:0:b0:530:f8f6:4ded with SMTP id d75a77b69052e-532b7362febmr89238011cf.56.1789974928682;
        Mon, 21 Sep 2026 00:15:28 -0700 (PDT)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com. [74.125.230.205])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae750944sm57174061cf.25.2026.09.21.00.15.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:15:28 -0700 (PDT)
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a0299c787so204671885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:15:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3qMl3qRuZHjKni55scXKnpup5/5CqycWZZeelStNwFy1IWL9WAFuDB0zSIgSpg2++xldD6Qaxt2DtKWQ=@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:7a4:da60:acfb with SMTP id
 ada2fe7eead31-7a55af3177fmr4503081137.8.1789974432591; Mon, 21 Sep 2026
 00:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
In-Reply-To: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:07:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
X-Gm-Features: AcwNN1XBDwh6z17IsaQFiDrYFydSgUDFMGU_5lJeAdoD724Pjbvrq8QmlAe59_g
Message-ID: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 09:05, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Kieran,
>
> On Fri, 18 Sept 2026 at 12:55, Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> > Add a new dt-bindings/media/video-interface-devices.h header that
> > initially supports the Orientation types and convert existing users
> > throughout the code base.
>
> Just noticed these are already in since commit 6ab5acfb8dd38729
> ("dt-bindings: media: Add macros for video interface devices") in
> media/master (next-20260903 and later)?
>
> > v3 collects tags, and fixes the typo, but drops all hunks that do not
>
> [...]
>
> > v2:
>
> Interesting changelog order ;-)
>
> [...]
>
> > v3:
>
> [...]
>
> > -v4:
>
> [...]
>
>
> > -v5:
> >  - Definitions now accepted in linux-media, rebased to get conversions in.
>
> Oh, you say so here ;-)
>
> >       arm64: dts: renesas: Convert to new media orientation definitions
>
> So it's been safe for me to pick this up since v5?

No it's not, there is a hard dependency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

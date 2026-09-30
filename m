Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F931391E77
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758902; cv=pass; b=MEqCchbXXM+KdTwHvjz0qCqJTvqYyOYrUzSHuHHN0JyL7N0k11DdSNhW/PapCJ6gjelE76WYghPhVRbzO/h+ncizUtuPmmq1YLl/18IEUlDDW1Dx6V9jTnWng7KLkabuywUpcDuCyW6IEIn16wUXnLUkXCU8SwKuEGrchlF/WPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758902; c=relaxed/simple;
	bh=qbQjUe7LqGgZ1fLLEceiU6XcKlk7J9op70NiSeuioXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPJXN7TSRWSVZu5gfqEt3A2biMm6SMGAhCTOMQ6FNcQMLJcNTdwvgZmfFh5mLvs41aboqsjNUH+wr/VwMU4+f+OZA1QhzJxadiU5kn0z+0wAetUY4MppXW4SrpTtxqdDaaAPotVJP1G6gruw2y7Ix6duIGoYDlzrJcHuAVTstyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UhkxKx25; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UhkxKx25"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab20f4bso5393190d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790758899; cv=none;
        d=google.com; s=arc-20260327;
        b=DgS/pp6j4GiShWl8Djsr0gblkEj0Ix1Y48Yb6KFHsYvPGI2+y7jyEwfNe003yUqgGL
         cxQwa/1JwoS/YXpamyPvvE/1ClYpAsFdyXm9RnJUTBvZwAXYTofzoOY/00mNyauitDYT
         NReeyX3iIfGdjasXAbXff2diA/ykX+vqhwOkPuBKrKlQZFfiy7so4lR4wkKUDEmhWQiP
         Pv4c6znLSh9MIrNqL5I1ddKIIBNHj7Mgg40oo5yzOeJcEisTHeDjfW5HBcA+2wBAxVWq
         wOvCwt2ii+d2L0WZu1GJ4suFz5fStmzrH0z0dTcALgsv3/Rn8gYCmBEUxxl95Ki1ZwS4
         GLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OykS+SoJkr5JXEkWEawY2ny5Ghozx39KQAnc/vSe/EU=;
        fh=B54bGtQyU+UV3/38GP83b7SaNStx2E2ZrkUKTzGBIFM=;
        b=H1DRehKPcFlQQ6Ld/vkquVva8jRA9HZurlZkO9cSdn1o4oOH5wYSMxltGEqfbG3xL2
         ferEMAlMm5DBzWWNpu9vvjPtrlSM6v644fDhfoWFEHDj1oUc6/RdUO+b/cArO/+Y0lVr
         l30hNyG0U4aynTk5/hJ68CZhLukb/qebT8yiRfv2mdf4Kkz3oiHIIUBY6QA6A0xS15+9
         sjRKvT8ji9RweelOjw6nV5MzE4va35wTRHUod32jClBMn4LvAEZUW565WT5Qy9UibF0r
         dQKhIIF/3C3pSZprtPQipMK7VVvdTgHHbvr1Ev6nhcyTjGALYI9jR0qPdTBm+AF3UXO2
         uPig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790758899; x=1791363699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OykS+SoJkr5JXEkWEawY2ny5Ghozx39KQAnc/vSe/EU=;
        b=UhkxKx25B9IxaUuVdx+KkaznfgbuukEwi0IeBDA4lx7+F9J/pnvx9im6JhJ1qfPMQW
         t+DRKqQrRb+wW4tG/uX7HSmTfdcwN4HNgU/xHE+GjPm2YLlO8xPVsiO31OXiFZw7IzYB
         jNqxoh6zwAKdMDWdHeZhV7DIpv29Y3E0TnAwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758899; x=1791363699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OykS+SoJkr5JXEkWEawY2ny5Ghozx39KQAnc/vSe/EU=;
        b=upJE7LKc6Udi5keJLiFJSgIWY9u11fXG5L97nMzzyCuPd/Z7TrVMEcLWdjKBsMxU0W
         JCdV+zl66li9s1D3k6zQn/fatorBVFmwZy28XM4d7F0HR3EAVPW04Bmx4ChSJa6Wfdha
         ICyOL2toahel/NixzI+I684Hs8St1k+kFzUyZbnHzxa46HZZ5/z5TQMONW/YR4w6cEhz
         OX/Yz2Jqd/tTKM85y3IFqBcSY8UbYeDYyJAG6wFAfla5CFu4JTXo/6j2WY5P/Qxi7EFX
         mQ73PxaJpC9/03opAPEdVmJ1JcOOToQ9KkCj8VPMA+kRrtE/JbEMIve8nYWxkaEb+4M9
         0KSw==
X-Gm-Message-State: AFq9FYI3BgSy7yobazamQ6vyKtKa86gVWFcQAXiZDfBEV+tMDBQ3Wkrh
	APaTROBG7DYYVgTRoume2SzG0mVvXKhwNiqUBM4QnAkj72EtDk+fnCE4AKMUXsL7HxGQQ9BB401
	tCbmrWVKdQQOBZVj11/bkbQWBXCNmeHFx0fgzRW4rwg==
X-Gm-Gg: AYBFou3tks3y1v2+w7cS8RjJNmOo9ZRAxj1MTf7mxTPSmpDTxREdlXJs70Pne2GgCHI
	6Uzbzd6/iZadkC2x/MBnilF3YC+UQX/ttPnyQZ12+A+/Hrosy+71ZwvgAjHvnwohzyaqT3GDRfA
	FzkSzDMJCVYeCsyb927nz/r6riCqHiFBXiZscr9K8LGKSBfKVKG23T7S1478rJD1T9JAbl3Kbek
	Wt+V4s8ORcX/NrM9tGbh2iND+zJMpy2sDlgPnBLKcSpzJmBAKtOEvYPeyKnOSj3TXFgzfhMRhy8
	oZslgdV0lAz73/q/yJliG481eJZt1KUN1nwSaR+M7M/LjoqTttzn/dEIVZOiAF0E+Wppjmkdd0l
	4141YQRJjsojBErVmHEHLNUUb/v8j6/EuC2v2Qg05Ayo=
X-Received: by 2002:a05:690e:144c:b0:675:5fec:681d with SMTP id
 956f58d0204a3-6768346ceb9mr330443d50.78.1790758899672; Wed, 30 Sep 2026
 02:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com> <179070048452.199845.10870046832708018931.b4-ty@b4>
In-Reply-To: <179070048452.199845.10870046832708018931.b4-ty@b4>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 30 Sep 2026 11:01:28 +0200
X-Gm-Features: AclHuK_jgSkzAP6aG0bqXQrp3Gg_ntpz85heYxuGMY1RMPkv--ExXYz7UZJOjz0
Message-ID: <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
To: Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebin Francis <sebin.francis@ti.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

On Tue, Sep 29, 2026 at 6:48=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
>
> On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> > Support spread spectrum clocking for i.MX8M PLLs
> >
> > The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> > PLLs (audio, video and DRAM). It has been tested for the video PLL on
> > boards using i.MX8MN and i.MX8MP.
> >
> > While at it, it validates the spread spectrum configuration in the clk
> > core before it reaches the providers, and fixes the i.MX SCMI OEM
> > extension, which converted the spread to the wrong unit.
> >
> > [...]
>
> Applied, thanks!
>
> [2/4] clk: validate spread spectrum configuration
>       commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88

Thanks for picking up patch 2/4.

I put the two fixes at the head of the series expecting them to go in toget=
her.
Am I missing something for 1/4?

And how should 3/4 and 4/4 be handled?

Thanks and regards,

Dario
>
> Best regards,
> --
> Brian Masney <bmasney@redhat.com>
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

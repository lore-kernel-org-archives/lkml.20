Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802505;
	b=hTqiK+rl/KTPzlkAcK0S+P9x14mTYGPFu6XbdeQ43ddPnIbnCPfYzSDgoOAcwmcpfVag
	 jz3NcO6zyTiAbFkEa0myVPW6W4h3OuAOu14SkNegH1qFPejPxQ0n9vgAODi0m1qnjWr6X
	 z/siUTOnm1LWLx1npLbFsNRFat6VCrmWAnXhydNNhPu7qMq+QNf4v0ii7wALTawLdQZdC
	 aFp1x8zH6xS6ePYNET5rt0MO8c1X6cyYhLaGJbhwyub72hMx2RkFwLMnfXvxCKK+SjrsK
	 YW0iONRyEA3KyUlTgNooZ0Zn+dGWuLlXjZUe0bTqIRCHAGDeCceh4ETetXlhOdXT9bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802505;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=RMenACrLFyywKqOpn5aq6U+iXJREF0Kb5kUB2pOgic0=;
	b=fbUW9kW2xvj+HZGvDH0bwbE7Rch1KIWggGTvrpc7kdir9BC23+CVdVFksKy++vCRDg/8
	 NF+fkD2xuC2SEiE3amnkf6RRAu8a5k/9A8TSfK0e3C2uYqTURSSVzd2XLOpysAC7FaipR
	 DmKpV2S33lNPl9iR1+fpLDXMZckK7hJP+0pje0z4iXMuk+hTLc9C8xSRPB1vNiJxsO9Ht
	 DgaTCeiHHtY0I3KR+dq0TgnmC6Exa3nTlAujR+RPGvIFr7HQfTiuzDwBwQXyPfx+RTC+R
	 WaVtYg0+3gRj+p0F6hF/n4TAx82OizK4a7hUS7D3cV/Ky+QgBZQlo9UY6JBF1JGijsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=KiqHZakj;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=S36KDrgK;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566C1606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 566C1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=KiqHZakj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=S36KDrgK
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D149F7A0185
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:28:24 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 04 Nov 2026 09:28:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793802503;
	 x=1793888903; bh=RMenACrLFyywKqOpn5aq6U+iXJREF0Kb5kUB2pOgic0=; b=
	KiqHZakj17uPClISrKe6y+V21POMrjv/F5QixGBxI/oACddPYfDuizYbfjSge9yG
	aLPbT7+5DJie957qLFiaejWp5Jcf54co3dSC6zFOtcB80Zbk/rjt1+twx2fR59Va
	KZA+HY+s8HjSRaz4riIaxmc8xxafn7kUTBIXcHuZekQAmz6WOdg3jNVaRsUC1nn0
	m/jcvFXX/uA6fTrgwAMOXX0NEqqTPz47fQhB5vm87d6ZltnIqWyc1RVB1lykYGMP
	9qyN3wK4HhZ6uWSR3rjhaCsUYjrE63Ujq5dEP1oUAU8DTUNKCUFDeVaYbSFhem7p
	2YVuy/vt4zq0Pbujwst9Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793802503; x=
	1793888903; bh=RMenACrLFyywKqOpn5aq6U+iXJREF0Kb5kUB2pOgic0=; b=S
	36KDrgKNxI2VnBR2PKdoyGc8LVJ/qOMGYORmXnnTtKMotsHEDRMRESw4wibtmE7Y
	4VtXXtBYV08/7Iro03g/TIP/TMITa0Ir15YEMD0TPdrq1w7Y5LBlyU45uStPCqtK
	gxBPOGZKBUiIul3nLhqjthq59cptrRv2mT8EmJaA5AIIjALjlsExLt5XQp57JLp/
	lHfSKoHk21jFmgSuXF/MILmM6+V31L+UqPgesZCAfSati1XhlZAYv2UbBaPz+u/t
	XAD7JF8eH/fNstrKm5FhNpLMpEE8TSrmunCenQVEKu5Srd5rJUMlFVYv3tU0CqAX
	I88bniMtnpqLvQ+8FlCpA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793802503; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:hr6/3T3Ha3je1+TZtU0vBDjB2RxsvECFh9Vv85O21FZLsAY
	INdw4dWHwngxxDnZyFibcPk9QK26cH8EKtkioDUMbwOC/BJHgrsNulT/6CmaZiOg
	4CUQpL74t4Xu6opCWfoKEQB69X4iRIWG87s2JeKKrReUQnOBoj0rH4tsKNIxwyAa
	XzEISo/3kw6VUsJDQwsVWawRIxy6deN/WucBW1ACmX60YB0/+UNqPNxhahbi98DY
	jPGuNrZkmJczXoBabgMmB3A+o/DwkwcPtYfFw1E77V5Quf0VriBej9XtkXbAZt0n
	XikZwVrLVdBk8ZFO412EUFOMGALroqQjPIx8ZZA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:jCWgE3YJ4EvRsNPLIY/IXDctOuN2J9UFRBU50X4v1Rs=:NSZeassArK+0lGa23KaZEE+7V8nNZADT4dBkL2Q8lgo=;
X-ME-Sender: <xms:B0HravF5Z0PLl6q9DXF3nvAHUg7mtzacr6Bic031I4F9AcaXv18Hqw>
    <xme:B0HrakdDyD2DVpQaIvlk3nksJ7rAdv_NABTOA1gkZcTcXIBXwnVwvizDy4n478eSl
    E8MytGaJ2mR7LycHW2yWRvca-oIVSicj5cRyBe4BwtYZxIa5LmZ52U1>
X-ME-Received: <xmr:B0Hragp9w5vkX2mGVilvEO0W-OwFBuhh3-xiA_vvFckaV7TZFq2XrlkdxmRYqhc0sL0V34OU-v4FNS-G6LcaNOVuPjC1DmY>
X-ME-Proxy-Cause: dmFkZTFNR1ey4euJuPa2Fv718jweYIvtwoQn7xcXHyPcrA10VXtwfnwdHUmL1Fw3WreSUq
    DCQqdM5NVk4uUdJKvWJPAbU9tjqPam3ZmERcYg3nrpovtmvaeOfaDzplajZPOsH0T5FQKV
    On6P/uUV2SCzUvVDaaY5ulUHOl+M5GQDf+6zswnzqojp6zGG5RIYBqVsTrrInICtothQzj
    6lbkUoh5yz+aZQy0dRh3+PQWrWEzmGg9zCiiFMCiqBBLkmEdBCx0ezwONSmvQHDKSDFNO7
    xWVPqlRuhlsOcZJ73JQ4nPR7gcYluIvivfzu9uIVnyNBOxruD/xoINw5/s9a/H44alVsH/
    D5HLzZ0P2wwF54prlMIBWMVzbuk21Tc/9y+qE8d6+rvJ19Tj3IzfJBEjFbaB8n6oynDpLQ
    ppFx0nVa/+Xqt3UbV4pln7kchTHo2wH2Q6W/BFu7QWGMMco8ZKH+fK7Yy6sZfmhOdxut3l
    qehXWHv+ORCnmVlJaawP/3jV22cwmFkmFOJUuonjWG66OVD7cxwZZwZdcFUZyymPF4fT0U
    UUVisPFn2eOmPQtD6/xVaIwRHm1l+w+skncUh6k34Wn4MHyupIez2Vs6R3RH57D5c+vrtC
    g3v9bN4h/LZvYOJxW6KYLRKOt7bhC/qQtxjvxQ5MNnZ+qFHMrWqV+zGVcggg
X-ME-Proxy: <xmx:B0HratC3NTi_VdctiC4FZ_Mv8cfjBOkphY3UjWQRIpXI1mxQ_C_O7w>
    <xmx:B0HrahdFtIJAnroa1754QNnGrKxMkpsR889_37lMW4cNrDne4EvN-g>
    <xmx:B0Hralu0daVY-x7frEVVpOjB2inw7kr3Ei5KJ0QzuT1hVf1Tps00nA>
    <xmx:B0HraoiX9fl-098ID15iLCHRs-yQPnMuVMufUzgE14WMK4HxmiNFKg>
    <xmx:B0Hrat6r3_Z7TEZ7HapiAu1dJr4lod0zhuZmDCg0hmdeOVZkP-70sOk->
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 09:28:22 -0500 (EST)
Date: Wed, 4 Nov 2026 15:28:21 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Li Ximo <lixicaicai@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wang Haoran <haoranwangsec@gmail.com>
Subject: Re: [PATCH v2] thermal/drivers/rcar_thermal: fail probe when no
 sensors are probed
Message-ID: <20261104142821.GL1959885@ragnatech.se>
References: <20261103084604.700540-1-lixicaicai@gmail.com>
 <20261104120840.GJ1959885@ragnatech.se>
 <CAMuHMdV-K+S3W3R58Tjk4RZH5KNdwRKNS1qYmMyshL+VNYj_rw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV-K+S3W3R58Tjk4RZH5KNdwRKNS1qYmMyshL+VNYj_rw@mail.gmail.com>

Hi Geert,

On 2026-11-04 14:14:20 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Wed, 4 Nov 2026 at 13:08, Niklas Söderlund
> <niklas.soderlund@ragnatech.se> wrote:
> > On 2026-11-03 16:46:04 +0800, Li Ximo wrote:
> > > From: Wang Haoran <haoranwangsec@gmail.com>
> > >
> > > rcar_thermal_probe() returns success even when zero sensors were probed
> > > (the per-sensor loop simply falls through with i == 0), leaving
> > > common->head empty. rcar_thermal_suspend()/rcar_thermal_resume() then
> > > call list_first_entry(&common->head, ...) unconditionally, and
> > > list_first_entry() on an empty list does not return NULL: it returns
> > > container_of() of the list head, i.e. a wild pointer into
> > > struct rcar_thermal_common, which is dereferenced at
> > > priv->chip->needs_suspend_resume and in the MMIO accesses that follow.
> > > A malformed DT node with no MEM resource triggers this at every
> > > suspend/resume cycle.
> > >
> > > As suggested by Niklas Söderlund, fix this at the root instead of
> > > tolerating an empty list in the PM callbacks: fail probe with -ENODEV
> > > when no sensor was probed, since a successfully bound driver with zero
> > > sensors is meaningless. The error path through rcar_thermal_remove()
> > > already tolerates the empty list (it iterates with
> > > rcar_thermal_for_each_priv()).
> > >
> > > This issue was found by static analysis; we do not have R-Car hardware,
> > > so this is compile-tested only.
> > >
> > > Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> > > Reported-by: Li Ximo <lixicaicai@gmail.com>
> > > Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> > > ---
> > > v1: https://lore.kernel.org/r/20261026115018.3227372-1-lixicaicai@gmail.com
> > > v2: completely rework the fix per Niklas Söderlund's review: fail probe
> > > with -ENODEV when no sensors are probed instead of guarding
> > > suspend/resume.
> > >
> > >  drivers/thermal/renesas/rcar_thermal.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
> > > index 9a9038671..6a1e977d8 100644
> > > --- a/drivers/thermal/renesas/rcar_thermal.c
> > > +++ b/drivers/thermal/renesas/rcar_thermal.c
> > > @@ -514,6 +514,12 @@ static int rcar_thermal_probe(struct platform_device *pdev)
> > >                       enr_bits |= 3 << (i * 8);
> > >       }
> > >
> > > +     if (!i) {
> >
> > While this works I think it's fragile as it depends on the loop variable
> > of the last loop. If the loop is changed, or a new one added, this check
> > can break. Why not make it robust and check if any sensors where added
> > to the list containing sensors (common->head)?
> 
> Yeah, then we could move the loop variable declarations inside the
> for-statements...
> 
> > > +             dev_err(dev, "no thermal sensor probed\n");
> > > +             ret = -ENODEV;
> > > +             goto error_unregister;
> > > +     }
> > > +
> > >       if (common->base && enr_bits)
> > >               rcar_thermal_common_write(common, ENR, enr_bits);
> 
> ... if not for the next line:
> 
>     dev_info(dev, "%d sensor probed\n", i);

I like the idea of being able to move the loop variable to the 
declarations. This could be addressed with list_count_nodes(), right?

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

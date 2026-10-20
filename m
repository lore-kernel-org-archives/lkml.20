Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792507828;
	b=WsZIBv+Qg0Yn16Bp1f34lawr487SWVPuTlkfvODpkl8JP7Hct/cmeop3dI1deRippgih
	 EzUl6LfVso3RynsxyLUdjTcsxQVmdhaESsMJ/WWqTZJrbtmkWfnHNTJh/3LCLNd5myb93
	 vVEK/vwRX98+o/HIEAhYe5cDCJPSJEcUSrZjb9frc7LiH6Q7dfvffMC3QpRcKRLfT8ic1
	 teCDdw/6La2yDdCCD2BJr2Mmlv/j+XiSlEt+xz7JnLhFrYqXvA1LMqMv1qJoAVJIoo3cA
	 lesNj3mcYQ9iGkB147jKxTwUs7UAMxApwm5vhjI4rr2LmWPPBpletLJG9n0DheMmorw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wlkmGnexwUZqrSR6Z2ocUUR37fT6HoJKzxvPZMwVYqk=;
	b=w3FpnSXt6nrZNaVzreu5c1xdPWANnam2YVoQCSMZuVg9vqm9/68gzyj6sl1ToMAHtk+3
	 yN1fCdqepc5osxcfKg5t5DkN/Lr2Tg9/Vypqxh/wA4Mfk/ZJKg+zre2AekphXLcC+fltX
	 Pki08Ijjfo3BCM6wodHz3f6T+mW8j1mkin4VfdXKHoW2vV2oEBwLK+Ao0ZgFMDddsmHEu
	 /T+/CJoUUszYRLMBb/uy/jFvqXdxN+rt++4DpidTa+bdIR9grKy1/u42UiPAxzssmO2z9
	 cdf0Cr5FlRz1AqeRVBUuf6VbNW9PtWBvpJmqV3JHO/Iv6dKuvTXVoWaonSTcTJe2rGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=DmCj1Mhl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC672606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC672606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=DmCj1Mhl
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-49de8ea072cso1276341fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792507826; cv=none;
        d=google.com; s=arc-20260327;
        b=lwKlfUGC5fjJDmfuEI8CLF9xzGceoqPlauPTtxj1Ycdc7A5x1Qi1z2MnE3E4w4hbvA
         KIFm2jszj4+sIJ5WYe1SxjvYH5NoRAvaqXI7gPhpZfD/ovPrLWdMdm8ftJ6d5PFQ+Vvf
         0Lmjm/YczrpIzmVFPuevslA6QZlc00MjKXr8YvJFmlJnKPjvZdy53XGTlj68qK7+lPp+
         QOERmWh8ZXZoiL8yyCoK0uoS7I0K6Z+iLrEyHkO8mhJISWY6Y7WzgwjyVFwu94vu2I1s
         8CyYb+fdCm6dMdNS7sdaSqUOaW/s2mR6LExMbMOijgCYaGJOlNyJ+cRazSOERTD+irES
         U9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wlkmGnexwUZqrSR6Z2ocUUR37fT6HoJKzxvPZMwVYqk=;
        fh=UoxeVf9oNU5zDKGt5Moi/eu8utxP3qfb9IZzHhCH/7w=;
        b=q6GCPMEov2z3Y7FVxFiDSB/S3JY2NhsGNOjhhjTnfcdwHLeDiAqotr4cJGi+ZT1ViZ
         AjPVhzh2wPqos4CsMg8qJpmesvwjaGv/DUOl5F4VcJhTTncs2RSg7eeLMKQloeiEVzi1
         C2kiHX4A2aLYp/JRZLGtI6DzkJyLSEJZk1N0Fu3paZj9ENCOACwrFcnuTQRPVQHPZy+K
         dinnMMPRY5wVypBL74khbntDw2bEe2pCIQEYraR0bps1zMyFHYc1KeRK0voBYPDYIsPB
         HG9cr7RULnaSQSTlGyDcFPpZNeDC2vnf+tpIRHplfDp/3sk0GIM4HQosIonK+AQeBXWA
         5PaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792507826; x=1793112626; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlkmGnexwUZqrSR6Z2ocUUR37fT6HoJKzxvPZMwVYqk=;
        b=DmCj1Mhln3zqO7y9erOlJM2Ywiu68q+JoJR/UR+crGO3/NhfvsvVsgGuvpXgKc+kUn
         p97Q+8zY/X0ls6r2ZJh+tYeJZ4CALYBE6akJTIIXLqsLg6WvmQd5HTOWcVkJhiaZRfLq
         lsYN2bSBEzuUvSk0s5Au3PVY9RgCxU6hrqOd83QM3rpUqbZX3NmfwvUV7odJZTfxtEFK
         3L+joEWHomj/v9GTLz8IJ8DkwwZ6Qc4ID7hctC6IBEXQUkd4H0/wIUi5SouTDnOFMNhV
         SYcpBNXsfPiN1/2FvWA2CB3lvq0h3UmKTkJLEsTtQ1oEiKaNiEyer0LDDRbnDPXlYc4s
         BcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507826; x=1793112626;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wlkmGnexwUZqrSR6Z2ocUUR37fT6HoJKzxvPZMwVYqk=;
        b=g4jk9How8NP9VNDhxoO9/BU1CF+tzh+ff9NWF4cjASTAnfFGgqiQ4wtBEyrrw72pIx
         ZHaJw64WbHN5i3P5LtilIR0C1bHXvBHsfTSFYigjMzzXxJRgoNs9bYm3S2EDH7AVIEYo
         eRsZ7uPg8/AvZBqk+A00GzkdL8jkIEDT4EMbN97L10CE9StunZf2Ks1BBWjDuaw7nPmx
         3tW8kNkC+ANp+/dNeb2VoeLrp/19xmP5dIZWk1eXY7Rf8CJdmCoWpL2ftEA9rTYRWB1S
         RFalGjQts+5UedFJJ7lrxF+aBTb8kg56yXNxXPp/qChavsfPwuflHemQvzSNTTZGueDO
         Epig==
X-Forwarded-Encrypted: i=1; AKwUvBz503QtBmLpzb37wKhVCmUcIVyJEwJ0srPWQn4HcYUHSi+66nHfYp/Sg/ohgihsCwcYz91P7lacuv+L1dw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6PMCG+iDG/Y9oQnf4XNM41iitxc5xaTFOx2wxFskGLcjS9MfW
	h+Bso0DjpmMREwuwH43N3FaxT5lF6vPDIL93Cv1JCu8en/JZUOrYo6RJSVDSX12fEQGmvOQ/V9s
	NX5lAmgnDJLgF5ux2D8dYnwx174WY+4iXRUWUbmHUtQ==
X-Gm-Gg: AYBFou0/5cdBlJX+7yvLBq58+IzwYgBALQcUN/HQzS/Y1/oQkkJmS5hRx0n+a68QueJ
	0acT0tbgE30kcM77NISzG3DLmA1mmxdxAR8HAELqEezzRDPAowWwmSaJ9HlJm0A4Vp5ObBfZE3F
	XKYZuzwGj8cd+g9RRmIwiWK6Mk3oetkCZ7Rs396MiB1yTvqnLIDV+BWYxFEpSZtqendRlvNV3pq
	CJ9TBgjnhgNCOlxMGYTV4W1l5ZB9W1AxuIZ/AzanUjcQJCmL43l/+L3Zril/9IPPHEAME+a6s/7
	0S1v4gY2lRPyOiPSxWGlIUygqS5M77yp5k/dd6tgLSftBrqvb10pUi9aQopOZzCAKYm2hAngs1l
	fjl3PTxLr3J1N0nrY81hlaE2JfucXKJ/ZzPSh2IikclyUSwMTgStTEftC8NtLFwiXezOwUYid+d
	maV6JTcXA=
X-Received: by 2002:a05:6870:b3e2:b0:4a7:424b:934 with SMTP id
 586e51a60fabf-4a75789dac0mr9577479fac.12.1792507826447; Tue, 20 Oct 2026
 07:50:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-3-lachlan.michael@sony.com> <atdGr8S2sf1kZFUw@kekkonen.localdomain>
 <20261020125630.GA158670@killaraus.ideasonboard.com>
In-Reply-To: <20261020125630.GA158670@killaraus.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 20 Oct 2026 15:50:09 +0100
X-Gm-Features: AclHuK9jchI3nSC4JyaTIAm_0oNifQyoET0OAG28wvGpwbLI8WQ-9SbVDsLY7f0
Message-ID: <CAPY8ntBUncMWB2DqFG+iS9gFgW2aaeyMrD6x-c_4Da7rJDv6Mg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] media: i2c: Add Sony IMX908 image sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org, hverkuil+cisco@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, kieran.bingham@ideasonboard.com, 
	jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, 
	Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com, Yuji.John.Takahashi@sony.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari and Laurent

On Tue, 20 Oct 2026 at 13:56, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello Sakari,
>
> On Tue, Oct 20, 2026 at 01:47:11PM +0300, Sakari Ailus wrote:
> > On Mon, Oct 19, 2026 at 10:47:20AM +0900, Lachlan Michael wrote:
> > > The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
> > > output interface. The driver supports RAW10 and RAW12 output formats,
> > > exposure and analogue gain controls, image flipping, blanking controls
> > > and test pattern generation.
> >
> > The imx908 appears to be a Starvis 3 sensor. How close is it to the Starvis
> > 2, for which Dave (Cc'd) is working on a driver (see
> > <URL:https://lore.kernel.org/linux-media/atdAsDGw_jvhaydM@kekkonen.localdomain/T/#m0c50ea017ef9ae0d3d76a36b840db9b6f7ac296c>)?
> > The register defines in the two drivers appear to be quite well aligned.

Asked and answered at v1
https://lore.kernel.org/linux-media/TY6PR01MB17839FF48671E744E7E23A93E92D42@TY6PR01MB17839.jpnprd01.prod.outlook.com/

> The current version of the driver implements very few features of the
> IMX908 sensor, as crop support has been removed pending the raw camera
> sensor model, and Clear HDR3 is being developed. I expect more
> differences to appear when those features will be merged, so I believe
> it makes sense to have a separate driver here.
>
> In the future, I expect the raw camera sensor model to open the door to
> more code sharing and more drivers supporting a wider variety of
> devices. We can decide then if the imx908 should stay a standalone
> driver, support other sensors as well, possibly across the Starvis 2 and
> 3 families. I'm willing to help with the refactoring at that point if
> needed, the maintenance burden won't be on you (and I'm sure that
> Lachlan and his team will of course maintain the code base).

Agreed.
I have compared the datasheet for imx908 against the Starvis2 ones,
and when we start looking at HDR modes they diverge a reasonable
amount.

Even the later Starvis2 sensors (IMX585 and IMX676) have minor changes
to the earlier ones, so adding Starvis3 would need some care.

  Dave

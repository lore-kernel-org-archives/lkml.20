Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793673383;
	b=dqorhOSvaYFLmqHlfAbzwAWq1DdhomgRvwq7pUUxnvl/aL06wpbJlL5Vg4D1LyrZ7FyJ
	 JxOH4ESnQWrwekioHbvdqCZb4U38dlpiB1Hkno41hkXvMVvVQsYc6kSSN0s+0EXCc40t1
	 MmxzKlnLpDSU8p+fQFdg66vQtll+xwXHki2oWpZ4DBxeNegiJBASQuH6+JEhfDLXYFNi8
	 CjrKdFbD0DvkS9dHcbaEZJ5RRr+cuXWbDeJK39mVLDd5AVQB/XitMXfuE9JY1IiYZk2w7
	 D9LHgzt/hjJFYbbwOWYU0ZILDwVtuoLpE2gNchxIMnyA2Ke5TdOwc99XoNJPRNWI5rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9Jlikt+rNAof8xPAw+Y9FynKuu4c36ojLvpof3Ekays=;
	b=nHtEHYVkvePVuvhwVem5xukm2U0T979QS4mwsIRkTFDIcN77ps77EPeNQ7HJVa7djLuv
	 RKqMIWUf0NK55UZ7SAsccLdcgGP8CTGsSX+Wq66zPpPZ4KQ6/ZiakIXyiih/5EYP0G5Rm
	 VqC1ESDOIk479dK43ream/1qXgztdfSjgZpOLkfwNkcv6fd4ySGdD/HAH35D49mT5AtGB
	 sOpK3vDy687V4GXLAOqK64S0VODYrdEj23IT1jlSmT2KOJlxsstVuJAYQzqajTekdPYzw
	 wnWavWnw8JwZRXJ6Ezls0dEj2AZ9JlrDq619DuEEokHqZlSoqORrE0g0A3eilQICIlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a4TvgsYw;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9BC606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F9BC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a4TvgsYw
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a18fc7a38so6879689eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793673381; x=1794278181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Jlikt+rNAof8xPAw+Y9FynKuu4c36ojLvpof3Ekays=;
        b=a4TvgsYwUyyS0K9tedfdNHQcVmmTszna7pZdCPWDEUtUfS8eazt+3tw7+E0fRMUfaS
         fbpUnYPgGgifY/ZvHRVF5OLPg2c30UiopXSfMUiyig6a/tRPEeKoYjvQSV6xLBEBDqii
         FCwYWgrkpqBCRUi49rZFN8p0cYjDCfC5cmtpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673381; x=1794278181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Jlikt+rNAof8xPAw+Y9FynKuu4c36ojLvpof3Ekays=;
        b=u3hD5ECljsfup0RzRLgv/y8iL6cm/GkaLaS3gR6Iv/wym1xQ4i0oIVKTRtGiSCHH6h
         46p5XYYBZvwOWAjw1YvlQZhhfLZASG+8AP8C/qDt+p5NG6vsSBFA53O2PEYNjYF0ejbQ
         cg+ZgaiJY/z8TcBssiaFLgEwbJiyf0agbqofj4Ehwzcotf7KNp0of4jw8pSb58RzDGgU
         WJN/+XrZ7Ax4eR6RIr0gGao5ASWMvhcgFWogllmQO1lX//hXdtrHQL24uCG0VEL6O7fS
         sQT3hMmfxePnBLNiyXDs+rnfz4M9czTBQKPh4hO7j5bp3N55/iMaL7KriBoM2CT2QB3P
         UwuQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0PIBBz5n0w4oQQZm3/Yt5EpZFufYILK2WgVP/qCotKzh2fGWzDszUoFEupTw5a9qNIcXiA9cqsJ3xMTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3MW3yh9zsuAC+JrRiXZ7VjiahDy/x4MCCsIU+ygOS89hEYFM7
	O7z3EtfhERmWFLvyGuBoNeJTMHM6XasLYMwSPSBppBOKTk5uAH7swwr/8Jc7Jk8aOQ==
X-Gm-Gg: AYBFou2/1MEqDzMrmCFav3IDP1mgPfq04UL13bLWLONhqLF2wVvJf5rBAW1BWyxybx3
	Ye+psVfDIxYElKzMS8kx8jhsPpC4Gw6LHaiPjpf7H/Upd3mnT3mPLgAF9wkWkhGEMYoiMvtcZVi
	+quGM0eKJPjDVVHfVFxlv0rlheEZuLvqBs9dcC2HcmtuxH96MozExyohyiO59YhKK6gR+88plAI
	U8A++dsrceVpnMgtgOX0cMEQdsOqH9EWPhCHbnu7pAel2NYwUtWG2JXF0+lR1PhLSNJquqXbGh3
	PGvcQ02nTQ1PcHcLFUQeQAslB941cPhBa5K6ROKMvEPA/HbOUjiJp3xqbfY/3eFEfgiu4jobWvU
	/1Zekc4XH0VvysJxDi2vl65QnK0O5SY6Urpi3+aeSBCs+L8enIZ52IhSXhyjVPJCcu856o3mRnx
	xiict+xFAbEbYPLDeBiQN2GS+BZRoBzeDRfmy+EgdpSO95ADTMq5N5euPbdY55ymK0WZAJ7HtID
	my6njj7OjJP65vaLiWM2xHGLIPH406AkGP1WARbnau8jpHXLqzPOZf7CcUFgBdhzmgN/tsA5vOs
	IuCFn5rrcQQN9FpRrn4+Mrz8O5cWUbuTPPuffaddmaD5MPtVKjLmqVgVrFlKKm3SjyI=
X-Received: by 2002:a05:7022:1110:b0:14d:c9e:a356 with SMTP id a92af1059eb24-1ac59dd07f5mr17524614c88.12.1793673381373;
        Mon, 02 Nov 2026 18:36:21 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1ac1abcd6f1sm37000499c88.20.2026.11.02.18.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:36:20 -0800 (PST)
Date: Mon, 2 Nov 2026 18:36:18 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 2/9] dt-bindings: soc: google: Add Google Tensor CPM
 binding
Message-ID: <aulIoq2oVjJ3DVzL@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-rapid-daffodil-rat-0adc6a@quoll>

On Wed, Oct 28, 2026 at 02:19:23PM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 02:43:40PM -0700, Brian Norris wrote:

> > --- /dev/null
> > +++ b/include/dt-bindings/interrupt-controller/irq-cpm-google.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * This header provides constants for CPM IRQ.
> > + *
> > + * Copyright 2025-2026 Google LLC
> > + *
> > + */
> > +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> > +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> > +
> > +#define CPM_IRQ_RTC_ALARM_NO			0
> 
> Keep naming consistent. Clocks has _CLK suffix, so this should not use
> prefix.
> 
> 
> > +#define CPM_IRQ_AOC_MIN				7
> 
> Anyway, ABI constants should be indexed from 0 and incremented by 1.

What do you mean by this? Do I need to make up names for the
unused IDs between 0 and 7? On an initial search, I don't believe they
have any meaning at all. Does that mean I should make up some kind of
"RESERVED_<N>" naming here?

Between 7 and 156, these are just ... 150 different "service numbers"
within the AOC (Always On Connectivity) subsystem. I can name them
AOC_0, AOC_1, ... AOC_149 if that helps.

Or are you suggesting that I pack the actual use cases (so, 0 and 7-157)
into 0-151? I thought it was valuable to directly use the firmware
indexing where possible; if I change those, then the indexing loses its
inherent meaning, and we also have to add another layer of translation.

> > +#define CPM_IRQ_AOC_MAX				156
> > +#define CPM_IRQ_AP_GDMC_WAKE			157
> > +
> > +#endif  /* _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H */


> > --- /dev/null
> > +++ b/include/dt-bindings/soc/google,lga-lpcm.h
> > @@ -0,0 +1,54 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +
> > +#ifndef __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> > +#define __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> > +
> > +/*
> > + * LPCM IDs of each SSWRP.
> > + */
> > +#define LGA_LPCM_CPM			0
> 
> What are all these?

The binding doc says:

      Each reset is specified by an LPCM ID (cell 1) and a reset ID (cell 2).
      See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
      <dt-bindings/reset/google,lga-cpm-reset.h> for reset IDs.

and

      Each clock is specified by an LPCM ID (cell 1) and a clock ID (cell
      2). See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
      <dt-bindings/clock/google,lga-cpm.h> for clock IDs.

These are the IDs used in the firmware interface to talk about these
things, as many of the SoC resources involved (clocks, resets, power
domains) are grouped in this way (by subsystem (SSWRP / LPCM), and then
with indexing within each subsystem).

In reading again, I see that the definitions and explanation of these
terms and the SoC organization are split a bit between the pmdomain
commit message and the binding doc. Where would you prefer I elaborate
more? In the binding doc, the comments here, or both?

Or are you suggesting these IDs should be allocated/structured
differently?

Brian

> Best regards,
> Krzysztof

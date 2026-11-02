Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610290;
	b=hRA+XKdtVaFysFZMtPj1k0T/+q7Bm0PcJSDqrtaqXuJR75vQVCqyduRVSvn6S1KyqX8N
	 kf+Az8EPGi0NU0Umez2xnjfewZ43i1nhlqjAQTko1HBX/o92BVo88lUj4cyn8760SxmTh
	 Z3AU9kTTLHfRaIOCdhtL9HeIZKtgyY0tY9XLH8LRv7fhMSHyLyingFZEMrkFegBY08yES
	 m0MmerhAmoXIIOJenwFx+7nOoZM8DEkPtc9MDptKCYrU2gq1piCGX2Hce+hNPwFGsN7qG
	 7FmbuNcyUsTXwzJDrt/XKgjwJuyrQE021Tau8pkL5omFzWHseqbbJcFJhWuSs4jii2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=6OMMDQTVoFYMkW/indxgds3s7rWaF3OYRrED5RcBC8A=;
	b=GT4IIQru46jvbZu/jxaivEPrrNtrTwtPVKQap2rHZFjMYE9ZMlNuFLi3tOcKYtCC/UOC
	 fcIy/aTxze2h7W5nC7TuvIEYfCmjXkCweWWVZ3s4sW0djSxtIcFBhJE4k3FfiK3b/e6gD
	 b0kAZ9ad/jHmmdtlaS2AEhUxJFHK242QhQwO46gfzB4clmCl7fJdgiKlbJF1oyfISYKNZ
	 S0VIyAdVz5yhhpHfWY+R/ZfCQPBNecMlMlC/ojV7sAQ7dU1h0z3nuwx0ZKcAVl/2oZucH
	 GH+jNm/CFxHWHCSJc99SE3LJWGuL3lAli3A/9RO9/vf6hHRas4e6FQZaFGkvs89BUGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GuY/VUVA";
	arc=none smtp.remote-ip=74.125.228.71
Received: from mail-ed2-f7.google.com (mail-ed2-f7.google.com [74.125.228.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC74606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDC74606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GuY/VUVA
Received: by mail-ed2-f7.google.com with SMTP id 4fb4d7f45d1cf-6b1a8f9aba5so809583a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610288; x=1794215088; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OMMDQTVoFYMkW/indxgds3s7rWaF3OYRrED5RcBC8A=;
        b=GuY/VUVAezJtbfFdh33XY8NJxSfDBqR48lh0LAsVjL1ogF4222zSGkl2BA82PRzjqr
         jz6w2/X0EfHrvTbqSHz1jLNFNpsvN54eYsQatClkI0wZdus+gR0hk4d2xu1qa24GXnTi
         hoCRWhPSQV2Ad8hsVP/J+TcSSxWX6EC22skDu74YBgH96et3RTz/1TaROzFKi5XVyHSd
         Yi2U2pCjiZO+CVMdSBmQe8h8j8Bu3wRDjMLPSWDDH8VXmCUeA6bX6W1PwnK/IYdErP1b
         SkxEupLZ/BgBwZNFw0yhCdK2QUbBxG3VVO+j6szdGslz8QT+skiB9DDUZP3IUjSfXR2c
         cd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610288; x=1794215088;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6OMMDQTVoFYMkW/indxgds3s7rWaF3OYRrED5RcBC8A=;
        b=v4HpkCtDcM32GLAzw/pfgzw0KGAr4a7AgEtYoeaky24kX1oIbMxBbebBkJmI+l4t5A
         rbKYOS6mtG+RV5wdOLQvwj8+Gap4FWG2zwU+4aVkWnG5UzdvWQOkgecjruVDc1QslPhx
         ruiEtpWVETdDlg+Yase0ENEYWQOPoHUy4c9QEH5EXI7hjTkqmPtVoU7ibQIar61usfTq
         DPn0RAgBem6KMGe7vwT5GOc9vu7Cpkc+/z2OXLfh6Bl7965Z3suv6kKg2xHOfHSv/hrX
         dTn7yTpam/ROwQdCiesiub1TsLDzacbVkrVh14IbFbPaNhM7DrTcA/J1FfpAvwyPODEv
         Yc6A==
X-Forwarded-Encrypted: i=1; AKwUvBy7oAalynsMRC8bPfSjm4FU1yUPtiEVv4Bi/Srh8yEQpK2YLbWsrVVWsLSwDFhLjctQCpStXxdGQ41/zRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYx9sKAnzo6u+Hwy864BEDT8l+z58v62ObDME2Z3rk02sDTkuN
	tR7yX/mSZ+KNV77ndS4FPJlCLZQwsx1ggxvSHPychZGHjnn/ziEto+BF
X-Gm-Gg: AYBFou1N27GO3V3deE87X1cFCQVTY1N7lbDLiGkFxEIo4CizSP7ijT8k7PhUH8JFil/
	OQpg5EL2EaZSrd9cACryXaqHXxBbsYmZxiHoyl0cUxhlfyVcO/asKoKDwiPyYkfUojoauzD4onS
	BYzm6tB7pOA6/dvdFGEUVZcrUPng4h5OKgQ0ggFhewT80BPZp4Ts7Mq/QzIHOw8fltd/QqOUtuW
	GcLfoLrgViYIypGPv6/k6dHhgdvc4vgTcpaStM8mop94FSB+rsTgYRhvVpaR/asvtWeCJIoRKjw
	44dQ1Cafy888Te1p35EwzBgC7MbOQitZwWqN4ESV4maNwkae/yDofsJmIYTKQF6fSnZcF+AICeD
	+Q6da0+I1GEDIkQaFQbfYFgsVUUCqmfD6e6qTGQHWqAgjO4M7bjAVo4QNo8LHZyz8QjUy2KDmda
	uFsryNAjtvQ5i+l01cvquwqEQiVVs5Hviu0DceCvcB0PyEeIjJR55MPbMl3DG5eGv7+uvWFACWL
	pc3IB85nLQDulFabekotv+h8iMn/dhoE8LlYPT8Dd9VTWwY4p+4EM5JQfn6Pgx+/0MApcXweEOg
	r1H7qyfU1r6XU6xtDPPrBD7HGY+3r5BhaRYL+yGl5bifYSMQLyvATfjhPMx7sXU7DXPSuXV8MiN
	Al+qUGinkF2sD+F/YG/ojrb9/nIA08OiK9podDlV1qaDLO8eIvPby1no=
X-Received: by 2002:a17:907:7212:b0:c2e:3f49:df04 with SMTP id a640c23a62f3a-c4ca793bcd1mr730834266b.1.1793610287846;
        Mon, 02 Nov 2026 01:04:47 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf15694sm358429266b.81.2026.11.02.01.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:04:47 -0800 (PST)
Date: Mon, 2 Nov 2026 10:04:45 +0100
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: michal.simek@amd.com, andi.shyti@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: i2c-xiic: fix waiting/clearing while atomic
Message-ID: <auhSLVHIh8mv-KUA@thi-server.fritz.box>
References: <20261016125229.1798791-1-thi.zirnstein@gmail.com>
 <20261016125229.1798791-3-thi.zirnstein@gmail.com>
 <CAKfKVtEOOGsJSV0_im=-0u=N=fxkDuCMnAzt=1ZfBs4A4rg_0g@mail.gmail.com>
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
In-Reply-To: <CAKfKVtEOOGsJSV0_im=-0u=N=fxkDuCMnAzt=1ZfBs4A4rg_0g@mail.gmail.com>

Hi Shubhrajyoti, 

Thanks for your review.

On Fri, Oct 30, 2026 at 08:16:34PM +0530, Shubhrajyoti Datta wrote:
> On Fri, Oct 16, 2026 at 6:24 PM Thilo Zirnstein <thi.zirnstein@gmail.com> wrote:
> >
> > Use non jiffies based waiting functions,
> > if in atomic context.
> >
> > Suggested-by: Andi Shyti <andi.shyti@kernel.org>
> > Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-xiic.c | 28 +++++++++++++++++++++++-----
> >  1 file changed, 23 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> > index e68e17bdf0ba..fc9a0628cb67 100644
> > --- a/drivers/i2c/busses/i2c-xiic.c
> > +++ b/drivers/i2c/busses/i2c-xiic.c
> > @@ -359,16 +359,28 @@ static inline void xiic_irq_clr_en(struct xiic_i2c *i2c, u32 mask)
> >         xiic_irq_en(i2c, mask);
> >  }
> >
> > +static int xiic_poll_rx_empty(struct xiic_i2c *i2c)
> > +{
> > +       if (xiic_getreg8(i2c, XIIC_SR_REG_OFFSET) &
> > +           XIIC_SR_RX_FIFO_EMPTY_MASK)
> > +               return 1;
> > +
> > +       xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
> > +       return 0;
> > +}
> > +
> >  static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
> >  {
> > -       u8 sr;
> > +       int rx_empty;
> >         unsigned long timeout;
> >
> > +       if (i2c->atomic)
> > +               return read_poll_timeout_atomic(xiic_poll_rx_empty,
> > +                               rx_empty, rx_empty, 10, XIIC_I2C_TIMEOUT,
> > +                               0, i2c);
> > +
> read_poll_timeout_atomic() expects its timeout argument in
> microseconds  the current one is jiffies. Can you check it.

Ack

kind regards, 

Thilo


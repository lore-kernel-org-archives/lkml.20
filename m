Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793046312;
	b=s4UepCmsSk8NhuZNiJQiVKsZgygNBg1E0cCavq9d65W0/aUrcg70Cy7ZLyylfL3QZY0f
	 T64p0ctVi5IHcZpipz1j91q9pEi21yGF4klzHAKkTvRZg6mXuFHWAKqYX5c1grUZdKC67
	 Z8DN+Hw0SpuoCHhYMc2HqLLmmGPqjwgNuX1DBWVBlms15dd2uJ2vaeEgkfvMrVcHja3dN
	 gNe2Flmg75gOIKrxojbCowwFcbnO2UTXMunvqeGY6NcZXZ/aYlrR23/ItZ3nDdEwEy4Pj
	 FLf/kDBH11SwjJA7ux0ssvuQc8ATDSH6RC1URQSopuk3gRx7xyuKeM6Qu2ceycMNTOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pU0NwAlmN/1H5GxbKnpqpM7HbDpz94JrESY0WvDe6G0=;
	b=zmOop6Nl4llcnEsDbcwIuQ14T+M2Nu/PyRBMvc3UJpjQ20sYMjbg2Cpa12K0KpDjlGHE
	 t+eWlYSl6nQNY0aMHU+AOwy9pfJqUQgVy+GZO+MNHytDkVfJmANcF1vFRyCdsdJPitzDn
	 cw8eWwTS+DMOGCYj4o+zHZlR2oHcQTcsFMNp8YeamP2rPhuDAKXL8jLvuZLDWRqf50HdJ
	 WnyZT+FVh3fxAFEeEr1h3OpaItA8kEA04LAVOa1eHrscTIy8mvWiU7IB/KicOzSMh3QIo
	 zAEKyx5vmk/iciSatWGzDNaAnwRdFeZ2MyEEPerKfLbMYVgF+ffu5yXShAHXaKeAGWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ORp1ZIDT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB68606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAB68606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ORp1ZIDT
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-99061e2171cso853792241.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:25:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793046311; cv=none;
        d=google.com; s=arc-20260327;
        b=YJMwhrvM/lbvr6kS7AJdwYFOblQSL1HfX4nmTPccq1p9ERJVnNbCRBXQaWdtxCCq7b
         p5knHfJ0U0S5ttrSXoYnayrrTYA2EOc3/WIt4m0wQkT2Bx+sNsYFPv/pHd9qQ7WAnTNu
         x/M1FqZNcyPFmK5yl0Ze4QsE7VzPRUkqLbjH+TbzojwV87eYY+0OVHskSJLIv30i6Lch
         n2/vwE5aqO2Vd+9uIH+hctTlPbuobxKslHDpaPmfDG3pIuo+UFw57WzbB49Xyh75qXaK
         1ow6JOC9BPk3oHddbqI1/8Wy8zLwMRT0Bjtqww3dzKrXwp0xTeQ2UPLZVee3mSDPZ7n8
         yBbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pU0NwAlmN/1H5GxbKnpqpM7HbDpz94JrESY0WvDe6G0=;
        fh=XskIP5bTCT/ZFn9js6VGppxXJgePmUNExve3I6rbajQ=;
        b=Qa8AfwXxfQiCKLDQ3AciV2RyMTO2Z1BtZnXsDOvhmAqrZYzFLFsvIwalWgrjBeB2Pp
         RFcfzYqicZIla/rd0ch4jAeOcNYuqXzqSZ3WgbF0g+THruARWsS8LAPbJDji7EnwmyG7
         WnH16GH9QtESedVxpp1TzEJrUxuyJPck8TdvSy6Ccf7Ku/CMv3C/aGEnqM7SpdeNRPnt
         deFm5LmVncUnY2hmq5cd8+xU60LqWv9FFHjDKmtXIppQWXUusiiq/fZ+ntm9Et2sOwRC
         bvH/41EiQfQgL4M1r9wLrYbMdVcHNND0mx8VN5GwbYUsTRoi7GzJEZBaJd2d6uWAAJ84
         6XQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793046311; x=1793651111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pU0NwAlmN/1H5GxbKnpqpM7HbDpz94JrESY0WvDe6G0=;
        b=ORp1ZIDT3pwLo29WJw19zJ8UskOADber0JYzgo+Y8E+0ygR7BOElNkC/7/+l8GF20p
         clQlZI4h96RGkUBvHAm70jqi/487aN5YBrySbLP/gipBJbtyz3ug0467jdJpYPxN51pB
         jcnDOyAltJAkXGmTlIZ3rcrXRIpAIaEgBcL/I+J9QIbHatMnmdyqm5XP0OgKSnA2qhAt
         lQfnqizWf2Mw9/Z/Q9d7Nxuxr9bDTPEulrNB84JWRUZYygc5D69POQWnf1PKCjjun3r6
         wiCW+O3fF7q+PTgwDMCC3k+5KOMP2HCP3uc4UKb1kgmPIe/XqPheoVqKFqwQ7t/4yngB
         F5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046311; x=1793651111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pU0NwAlmN/1H5GxbKnpqpM7HbDpz94JrESY0WvDe6G0=;
        b=rXNZ3ZvN+VQ0UbuIKJCqsuGihyPC+aUmUBXAvNxYTXrZoZm0DAo0h+QxS1aBV++lNv
         eG49+dKNNuEsHdb39NiArWemgZufrcvtsvg/Ued2oiiutwaXz3JCLek+5uCva9esnzTq
         d8+aLFhXxD5+jKJgmFTaLvxI6bStCa8qZvtKZkEzkhoYA+bn0GMXh3P6glh9QFGZbNsR
         L6yOXUw8BcQBgozGD7XVPUuAX0psHJeLEh5IpNxRNtuEL5aqGexA5Azt17S/O3Du0TdL
         tT6QDjtklZCKNk05P+tIBEQqQi/5kiRBS2ABnB2JtG9Sj4uJ2iCO13+zzokVFsLrVyrn
         ndQg==
X-Forwarded-Encrypted: i=1; AKwUvBwx2/JWKEGb1JJ0KnGJSc7S85vSIjnwi/rltwcCeyhOjUaCa2hHr510uHey9HcUXs1JCKnwq2T7cjaHQt0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhq+ybQmXeu1/Ui8LoYTM1CRUOYCwh8HfuwBRw0TWjUmja5lbB
	LvVUCHGVygtSb+TcmbonbImuS6Yvozl86xJE2//jZ2nmTCGbQenNymqOF0Zfz1LiJBn+Q8yqgFX
	qYTsLRCjVhLuXwogkWEcwgut150FRk5c=
X-Gm-Gg: AYBFou2FeV2uY2S2E6ua9KSbPU8dRasrEUzF25hCcls6qWN3t2M2rLGWlcFEdu9P8RK
	pbMOVPzKdaG/2KRV/xiEIo6tdhhRhPdYcifw/ge5z1Wxs+v7FriMcgSJufNuntlJ2PIoDgHkTFZ
	Bo5aW/IpTZNi3rXvpDXSNdVPYj5k4grDP3nTJ7RyHndL76hrdyP0aaf2EooM1b4py5uZvqDpAd2
	J8EEp/fk4WZeKPAZSrTm+LAl234THk/FH0jrXOAvkrtgRoHouQN4LQglL4ZwpRYAxNjxipjAyfP
	gG5m5eQb9lKCpZIJl9z7pmV++N0F3Ymi4wc1apTOTAXfQqVSp10JQXhks3pq+76ELgY/nNzqdy7
	4smxY6OwDkPeDmZ/qHG8mpqYep7T9gPoQn/e02aI0Oe/bXsjeQGZcQd2b4/ojjbV1Ob0E8ReEEX
	d8E6WXSwzmWfPyJS91RSiM+bVmVa8w8aZBZgGKKBoJHIMFLhrElwcVadIWp/ffDxayest8wCP00
	oTR52HUooMHhqbDkmDNEs8imCDgjQ==
X-Received: by 2002:a05:6102:83cb:b0:7c1:6de4:9f67 with SMTP id
 ada2fe7eead31-7ce5ca62390mr2075068137.2.1793046310592; Mon, 26 Oct 2026
 13:25:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk> <at4bw-G8czG-G7Wl@ashevche-desk.local>
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local> <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local> <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
 <at-vyZ1sDhYPu0W5@ashevche-desk.local> <CADvTj4o_CENc3i92OQEZudOErSKPUptT4t2CCqDaGbseuK0QcQ@mail.gmail.com>
 <2026102631-stove-preview-b534@gregkh>
In-Reply-To: <2026102631-stove-preview-b534@gregkh>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 14:24:58 -0600
X-Gm-Features: AclHuK-jg_V963WeCj8dDZYyLMETxUQLvBlHikJJBrwQZYN579iKyQfuGLYZuh0
Message-ID: <CADvTj4pCnnzx4B28H_1BuY4gm2fh_8HYL9jLpsAoJcWfiUXOHw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 2:17=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 26, 2026 at 01:59:06PM -0600, James Hilliard wrote:
> > On Mon, Oct 26, 2026 at 1:53=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Mon, Oct 26, 2026 at 10:45:54AM -0600, James Hilliard wrote:
> > > > On Mon, Oct 26, 2026 at 3:33=E2=80=AFAM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrote:
> > > > > > On Sun, Oct 25, 2026 at 2:44=E2=80=AFPM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrot=
e:
> > >
> > > ...
> > >
> > > > > > > Some people might want to test the stuff. And sending too oft=
en you actually
> > > > > > > will get the opposite results, people will be tired to even s=
tart reviewing
> > > > > > > and/or testing your code as it's changed way too quickly.
> > > > > >
> > > > > > My thought process was that people wouldn't want to be testing =
code that
> > > > > > had known bugs flagged in Sashiko reviews.
> > > > >
> > > > > Sashiko reviews are not visible in my or any other mailbox. To se=
e them I have
> > > > > to go to some URL and so on, meaning to waste time to see why on =
the earth the
> > > > > new version has been sent.
> > > >
> > > > Maybe the Sashiko reviews are getting caught in spam filtering or s=
omething?
> > > > They are showing up for me and on the mailing list[0] so I'm a bit =
confused why
> > > > you aren't seeing them. You shouldn't have to go to the web interfa=
ce[1] to look
> > > > up the reviews.
> > > >
> > > > [0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.org/
> > > >
> > > > [1] https://sashiko.dev/
> > > >
> > > > > It's better before addressing Sashiko comments,
> > > > > reply to all people involved and to Sashiko's original email, so =
it will be
> > > > > visible in the previous version why you issued (actually about to=
 issue) the
> > > > > next version.
> > > >
> > > > Hmm, maybe it makes sense to enable recipients in the reply_to conf=
ig[2]?
> > >
> > > It's up to the list owners / subsystem maintainers.
> > >
> > > > [2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/projects/li=
nux/mailing_lists.toml#L290
> > > >
> > > > > And before even issuing it, wait for a while, people might
> > > > > disagree with Sashiko judgement or your replies on how to address=
 that.
> > > >
> > > > I was assuming everyone was seeing the Sashiko reviews getting post=
ed to
> > > > the mailing list already. The are ending up in lore so unless someo=
ne isn't
> > > > subscribed to the list I'm not sure why they wouldn't be seeing tho=
se reviews
> > > > already.
> > >
> > > I assume you already answered your Q. mailing list in this sense does=
n't mean
> > > recipients. I think it simply goes to the mailing list without forwar=
ding.
> >
> > Do we want those reviews going to recipients as well as the mailing lis=
t?
>
> For serial patches, we decided to only have it go to the submitter and
> the list.

When it goes to the list is it supposed to go to list subscribers as
well or only
to lore?

>
> thanks,
>
> greg k-h

Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413013DC878
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180632; cv=pass; b=bwLlFsDDsBZZpeJp8ZsmjUNGMZpB1I2t+3wB2sDjUDxr9Fssq1uuazONNv8jTWIYVpHVy1EiqGtypoFT5IgssFDowmdbcIyjQpLkOhsg3yW4nExcoKiR98WEpiUogdng/cq3j3DqGOrRgIh61swkpHbUuFht+ETtH5Vz5smxwr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180632; c=relaxed/simple;
	bh=o2UJylUuz6w51NEA/fkXwj3lLUPFl66l4s+47Rkdu88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2wSWt5FvrnI7aa8i6J2Y71kBvZZz8sDD201C/hzz/NSD28Ib9cMghAjente2Sjb5d2b3/vy/3lQWv4T2xWFcDO5W1sfghiRX6yap1MkSxxjNVJP9bEArgHRUdAZbNegpDVwM6mTeRnrOeES81s1/XigExKJ5d1bb/x3ZMyeB9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r11thk7N; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r11thk7N"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c197e7e4e94so499119866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:50:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788180627; cv=none;
        d=google.com; s=arc-20260327;
        b=FRdEx9ErFlu15uGyLyqQCKoKfFVfwWg781Uq8CV6A0NnxaGdOau1UkdEgk6PtT2ilw
         TJVUpZIUhYfoWkRIfF39WO8IERZkX8xh8yIFh3NtllpHB4cbPn02/ZwB+YjyLPmXYgFu
         +e5qPYKc68gEnsnFWm6clASkqaNB+8Ya2aV8U/Flho4C4MKBIBG0beWfKhpZLXDwtQcu
         yqJZs5l2l3upE0gvAgVIwmiIDH1SbAWrSD/0EJN50XGM9BhX/EXWBoW9qnChEI33LQoJ
         EV++vQsOFZzewBHTOO6m/dtBchARr451hjfmkflLJODNeWdas+RX+OnSebHktqXVYuk2
         BjtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQtOWDkW+w7ybqaZBfV9HKOca4eSda4cgJxTQC5fkhA=;
        fh=aF0JVBDdyUq6mFCiHRLhoalOWq7tlxbdWAaO9xXMBTA=;
        b=CrxLcKuMFbioUL6jCA0UBIHPw45hxoCWFlP5n6ZW3yPw36t7E80OAHi/tqe/RRJ0bg
         gszTXWdCBZmCPWw0E8DuQJwCQoMMDkV+3iHvT6wHtCDgVaMCxAAO3VWjOhz8w2fedjLw
         sBHyQPyndluBjHHKcwsZZNbnwd9VjSHuxiwAmfaPbJ1hLjCzovawmL2GfgsfCC8gVecI
         qWguZ/9PoSzqmTaWmtEmz0hVL5VHc24sepwWwn1J0w1cPzxomwHiFZ7DBin6sAhDvGyn
         OS49AeZU0QlsNc0F8F8FhQRtcJVfWM8+NiQwQCuXr86z4aVP+8WzKrnMRflxw6s3DBa6
         uTMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180627; x=1788785427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQtOWDkW+w7ybqaZBfV9HKOca4eSda4cgJxTQC5fkhA=;
        b=r11thk7NKsuIeGqEhv7ZfDJ1L32RquGeaBeHaHY55k2VhJ/Ex33OYciywswYL6wtJe
         xxwI+w9q7goqskWLFVVUpWEPeCvXvabyrdib7ZfyD/HBaGwkXvhuDyRrWKpL95MrcyYG
         Fcwbcjvp+gqbE/WcAPhWIfNtSnu2Kdb2vAfrkJLKLjDEp9rdqGLVZNBrfs2YO0iO1war
         4MOUvylEbZdGUtAu44gPjwm9zdyDau/EMwpRwMg+LOVQAg1Sd/Sh6cGDt48Qfwgd7JfW
         3p82YWLAKe17dbHtq0oGCcRWsUADr3KwC28csWQuc9aWsY/GwSy5eALKM2yAqZcA04HG
         axmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180627; x=1788785427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQtOWDkW+w7ybqaZBfV9HKOca4eSda4cgJxTQC5fkhA=;
        b=kyewpdHt0ycHbHO4V8IgXEocFpmjlFpQRUM/UKv4f4Xy6RaulLQxDO4IkniXe5ikaS
         SVpojqwyRxNavT4aMib4izPNTKwulkSG5n1vhFzcZ01XgyNhxfOk+FjOLl+REoGimBsm
         BCpSN6gt5suQQ+h6YFBkzv+fhs4068bzOhKTG+FyXMEZWkZNy2uUXcMQVr9twS1RtiWt
         gog1j+1YLFlMhKFLmQa1Q6+nXR38m+GnxfhaSr/gh0j1J68MoIL9uifqmIB+ZF49vjuV
         v1xnJsrcVm1JLiIlZOWoAS3c+gWGdteKaN0DidLsSB/I0cH17le3FdH2RkwV1SsY8Cwy
         F+Hg==
X-Forwarded-Encrypted: i=1; AHgh+RqU4qUmYhDmZOBKg2Wf49BQS0+84J6QMQturTnByOCjKhOT/jgTjsXl6LyCmvFpVOMpyJIDH40ymPHfpvE=@vger.kernel.org
X-Gm-Message-State: AFuF++mi4a8ux+iDHI2vl+8m14irR09ngu+s240E/MaJX1rPkTaQoZFl
	o7Qult1T/Fy//+QVPT1vpSVIo74k61CIlbqzN6rtZg1m8bmOMpnAkHK3DshyIdC+45Zm9K2esco
	Fc0oDWdoz/Qcswo0+8hXnwtDbtreUt/Y=
X-Gm-Gg: AR+sD13mgnM0EjFfrRvUetPP61AsJYYY4gjJ0nL+XOGXjbu6H86xXvCO402TwoygAP0
	UsjlxkzSJGxvVhehDj8KBb2yix7DkVuEDwdfLgF0fIJ08jVYUGeneJDGPgf+1SiiG9Qw/qjpmbd
	eyG/GALz03KTh3XI5CfCCVg11jVCEskJ0vOcIBHC6aneZV9SakXvKCQKtZuoSHsQYw30pzwm+Cj
	fQNiqXhy4U+2Qy5jbg+05PDlCmeicfwGCQaqzz85jdsk0ag34xNFNHVfJFQjQuJEvUuxD73ORfX
	r67XjouoTkWilcWiT+3XsHpitNIzufVlhz5KB38Nvf5PTw==
X-Received: by 2002:a17:907:e917:b0:c15:f598:60c0 with SMTP id
 a640c23a62f3a-c2556c61b53mr1648394266b.4.1788180626731; Mon, 31 Aug 2026
 05:50:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <d60f234e-1b9e-44cc-9bad-da79e794fe44@lunn.ch> <CAMFFDGgTnNouukst3V1rEg0NCNMW-BZ6tM6+fbQc0zeXaOb72w@mail.gmail.com>
 <daf98fe8-70f9-410e-8a2a-042a671086c2@lunn.ch>
In-Reply-To: <daf98fe8-70f9-410e-8a2a-042a671086c2@lunn.ch>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 31 Aug 2026 18:20:13 +0530
X-Gm-Features: AcwNN1X0boEpGKg5x_16jtNRieTR5nthk-taojlLL5pnPEzmWybbo4sOjQPV9Io
Message-ID: <CAMFFDGgaEXdCdoi3av+HSLfUCZx-_0p4j7c5bjwiq_F08et2AQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thanks. As I mentioned earlier, I had already found that the AST2600
has MAC-side RGMII delay configuration.

I will now check the actual delay register values on this board after
U-Boot has initialized the MAC, and compare them with the
corresponding U-Boot configuration. That should help determine how
much of the observed behavior is coming from the MAC-side delays left
configured by the bootloader.

Tan Siewert has also confirmed that the RGMII traces on the B650D4U do
not provide the delay, and pointed out the difference between the
SoC-specific delay handling in upstream U-Boot and openbmc/u-boot.

I will investigate that before preparing the next revision and will
remove the RX-only delay claim from the current patch.

Thanks,
Prasanth

On Mon, Aug 31, 2026 at 5:42=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Aug 31, 2026 at 06:43:46AM +0530, Prasanth wrote:
> > Hi Andrew,
> >
> > I do not currently have the PCB layout or trace-length information, so =
I cannot
> > prove that the board provides the TX delay externally.
> >
> > What I have validated on hardware is:
> >
> > rgmii: fails, with RX CRC errors and no valid RX traffic
> > rgmii-rxid: passes, 5000/5000 packets, 0% loss, no RX CRC errors
> > rgmii-id: also passes with the same traffic test
> >
> > This shows that the RTL8211F RX internal delay is required, but it does=
 not
> > establish where the TX delay is provided.
> >
> > Given that I cannot provide PCB-level evidence for the TX delay, would =
you
> > prefer that I use rgmii-id for the next revision?
>
> There has been a number of threads about the Aspeed SoC. It typically
> has delays enabled in its MAC, by the bootloader. The Linux MAC driver
> does not disable this, nor does it mask the value passed to the
> PHY. So you see many Aspeed .dts files incorrectly using 'rgmii'. Over
> the last couple of years i have been pointing out this problem, but
> nobody has stepped up to fix the issue. Most DT developers just leave
> the Ethernet node out, in order to get something merged.
>
> You case is interesting, because you are not suggesting 'rgmii'. So it
> could be there is more going on.
>
> If you look in the email archives you should find the information
> about where to configure the delay in the hardware. You might want to
> read it out to understand how the bootloader has configured the
> hardware.
>
>     Andrew

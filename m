Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFD5397343
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579179; cv=none; b=fmwg8CN8JcfnU2g26DBV1nfIYnv69fJmMcCwci747cX/tjHrwz1ETgue2UWX3YF50fuBjcDGNNe0YAe/WgjFqar+0QPsyNMMMUHWlRsEbzJ85KOsMrZQGcALU3KrOcS3pl/M1+IjMnuM9rScg4ZwNBfMNRchyc4q77Dk9qWuaS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579179; c=relaxed/simple;
	bh=3le5P+h/KiA8eq2M8tVprosyJ+rYeh5W5GrP/Ck16/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXeBkNsHrIdFvNZYG67QbG56SpvSZJerLiT/6KxJTHENHLO7vUgLXgiLsXebGCtxlctImo0FimtxlpsN1K1v1oegUS16IgQqOiDWtG/LmQV1uH2v7RICH5sWY3NHr20U4xdGkbXLqpTJqYlbzW/B6KWcfb/U22BK7NuIo5rgs+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-677af43eed4so106090d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579176; x=1792183976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRIIxOajP0yzIY23BtbyoAhj2PBRdU9IpmRdYvRMNJ4=;
        b=laVFigot655f+Li6KJi6yNqnxCHxg5W7+RKfFdX4rXP+ucxPg2Qvf46wfvICLF81bJ
         snGbtAxUhaEWTmfhIQ51WTctc1LLCvkX7E2oS8msAcREaJ54s5ZW8v7XyUof7jL2aSXZ
         +jzzbLg5lFewBpt2hK8GVD6c7SgIwrWdlV+k5+TuI+lbgSmbiOUV/beabzXrZ+63PSk/
         P8rHPxKv+rQ3+BQk71PQ4fR1d+fllcPTRop3YJ1gb08MWydgvxM1uuH5jwa3ib1cJCH+
         8nktlm8voFH+xh/4+4ZDchaVAJ0OYyTnLa8TXEAsSaC+spCd8K5KCbNiu9Eq6/mMV+aA
         fpUw==
X-Forwarded-Encrypted: i=1; AKwUvBz7QCnvjvGpK9CaBDM9JCLseaaC+7fWLfj0n+sV6SUdZxizQU2/dio/4q1elssOfHlEqu4y7LfR3qrJnyo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO6w+D2xLBv8MuvXVp8dr1v1jwwsSAxaz1yMrG4BCirWnZykkJ
	XCf7Zoncu3r4InWjIjmD6juxT0r4nFbY9Dszub+O+dTanrL6Wuqbc8zylAjfHeN7JR4=
X-Gm-Gg: AYBFou0L25XjXoeLxAhSwwVuqZDJJD+LaKtufGXMOYRHzPS/dAqw1VvQSxVfojq+1bn
	ic/SBtl1+LTTeQMR7e//6FxSJ6BcQliqRC54Rxh5FD5lYs0nz20fa3g+q0A+BKMgOjKVg2mgCqQ
	HNZRPu6Ya41LAOVOhEgiahMDG6C6ZquUKFh1YmaYUrHcu9132LX1Oz3f0TYVfun3QqQTIiaXI5j
	hz0QWArqkLfbCYdWetSkoxQQhqiaXWPjUkk66xajMoxO6qhD7fKYzYFw77Hbd8b0KhtiolbYW5R
	fXTbn1XfYTc7iwKAfwgpINFjTG/vCLa9VzXSFXuADcLz4w5yPWFom4TUQN1olb48+io99Xi2TZN
	z2Od1umJjr5+od3jDlIWFTfys+C8eR45Bxyuh6ku1JJFDdOO3szHkpNGz1Y+6QOjBG8XW5SP0Un
	2z6FY3vhqedK7QEnUIAv0HOtO5Wv7FgsBS+jgLbO5UnCdmLXC3Ts5zxPfM3yppZywHwwsoQoz5k
	ezTcVwgLQqwJ+Rm2eMAgtZ7L2U6yJvHiZFNExJ2JMuzBa2qNK7n/huUSwTUZn9YAcLmaI00cOeh
	/w==
X-Received: by 2002:a05:690e:4190:b0:677:c369:ff5b with SMTP id 956f58d0204a3-67936a42e7emr1001688d50.63.1791579176283;
        Fri, 09 Oct 2026 13:52:56 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356deec5sm1255464d50.20.2026.10.09.13.52.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 13:52:53 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ab432273c5so714597b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:52:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxOIMr0Z550qvpRiJRRVMjcFvS9N8fhRVyQku6x3J/ELjeoUfOEWSF60G9y0wMPrxeg4zYhzHqlouKx0Vc=@vger.kernel.org
X-Received: by 2002:a05:690e:440f:b0:677:d3d8:990 with SMTP id
 956f58d0204a3-67936768725mr589216d50.6.1791579173056; Fri, 09 Oct 2026
 13:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
 <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com> <3a037c87-e4c5-4a4e-9522-cf505e1c6399@lunn.ch>
In-Reply-To: <3a037c87-e4c5-4a4e-9522-cf505e1c6399@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 9 Oct 2026 21:52:41 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+22tckoRKsEt9_oakAsN=+cwHdX+WPcaGWR9_3EMqM5ow@mail.gmail.com>
X-Gm-Features: AclHuK_m9bgs2ZxoWfD-m6qDBIuQp5RI_xHW6gmLTuflU7vtLwdOlVbkLA0qUf0
Message-ID: <CAJX_Q+22tckoRKsEt9_oakAsN=+cwHdX+WPcaGWR9_3EMqM5ow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add ethernet support for the Amlogic T7
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 1:13=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Oct 09, 2026 at 06:59:49AM +0100, Lucas Tanure wrote:
> > On Wed, Oct 7, 2026 at 2:01=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > On Wed, Oct 07, 2026 at 09:26:20AM +0100, Lucas Tanure wrote:
> > > > The T7 pairs a Synopsys gigabit MAC with the same glue registers th=
e
> > > > G12A has, but nothing described it. This adds the binding, the driv=
er
> > > > support and the device tree nodes, and enables the port on the Khad=
as
> > > > VIM4.
> > > >
> > > > Unlike the G12A, the controller reaches DRAM through a pipeline sta=
ge
> > > > with a gate of its own, sys_ampipe_eth. Nothing else claims it, so
> > > > clk_disable_unused switches it off and transfers stop.
> > > >
> > > > v2 changes the RGMII delays, after review. phy-mode describes the
> > > > board, not which chip adds the delay, so this board is rgmii-id.
> > > > dwmac-meson8b did the opposite, and ignored the *-internal-delay-ps
> > > > properties. Patch 1 fixes that. The VIM4 needs it because the RTL82=
11F
> > > > transmit delay does not work here.
> > >
> > > What is special about the RTL8211F?
> > Maybe nothing, it may be this board. I cannot tell from here.
>
> Yes, look at my other reply. The RTL8211F is very likely correct. It
> is the MAC drivers handling of delays which is broken. You get to fix
> it for this new device.
>
>    Andrew

Doing exactly that. v3 leaves the existing delay code alone and adds a
path used only by the T7 compatible, built on Maxime's
phy_fix_phy_mode_for_mac_delays(). Testing it now, then I will send
it.

Thanks,
Lucas

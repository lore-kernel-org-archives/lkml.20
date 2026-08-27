Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05324963C8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851661; cv=pass; b=j7tX4zlwmh8kQ2dYVxL3kBXcRT1MiMPE1WwI6+t16Qk8KLTMbTNpiqwMxbgUB7c42S89z9EQZDor5r5XPbuguL+gIJM/FIWBgxg/g+nZRAQGcE5NR7ScbAeXv6K+NMg2wWeODxdqacikDOs2q2FV9ylko/3jrFwOH2w/uVXSijU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851661; c=relaxed/simple;
	bh=HvwT6T6j+NkHVCIiwJZYKviDkprWnij+Zd4dVGP5+4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7KV1PQ0Mysc72QxNUCv63OI1tmdYrAjgMS1UtPE+DhaWxXArQgGdag1oQ6uKh1WUy8xxnjx4ng7oBFovQDpZvIB84t8aWMoRtqEE7K/iS7Sl83Fmt4fYoEX2nJj/1Y+eEx28sWUfYDfh1lPB8p4Y+4d4aKeke/KhQ0cCsPbAWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqebu9kI; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqebu9kI"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39f20d19895so596011fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787851655; cv=none;
        d=google.com; s=arc-20260327;
        b=k7701bG/SgZkXFwH0RXvIP4pQYqpYZ44J3gQitjDKFl/G9GH+p2WmX0rjseICiFU0e
         8WTcxmLIH2eWvf4amfmJn7J351zLliZ/WjdXYOStMkhR8oGnz2RNNBARa1jLci6tmhhO
         vhlxqj/JpvLMpfecEvI2HiFYgCigM/s/AbPXYztHV+ioheMbH4xr8FV91/yJvrvH2xLy
         MERt+4t9EhVBfFCWo7HUbUB5w0Wc6USEoTPhc20r14O34Y1I7CwBC1j+wYoWljQsVVXg
         4cD3L31F2OsYqysakc/TDSQWq6/gTCvKeTfNY5dyhYwqj8C5IXjCVJgB37/6RNZImDAY
         36YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HvwT6T6j+NkHVCIiwJZYKviDkprWnij+Zd4dVGP5+4c=;
        fh=HCNLT1JyeiHphMvLp9ii4TY0pRx/C0ZXarXCRtO6axQ=;
        b=GkgeJ/M6I++2jtEzBHjpJ5qy5Z7p+gzVWev830XTXwnl8rvFTWSrAaCtFRuqB6DvMJ
         aZ//Djii+eKHdnh22X5NqLX84HsYdT8ubU7amnqMs7ZMpNLUMqKz6DGeQjBg1f+RyKVT
         BXHsGp9MGC60nXfVzKygDJLfED1kpibyFoQKqQprDegN2siCzE1BO+cIYJEN0Zx/QLrq
         seunqknTAT/wkW3ZM5UUcq/ZB3LRXyUVzJhxXPMB3AZAcwtIDlHq9nttYwY0FjvZBFDy
         VAIQ06inZ2BQkYFSWoIjKkcYMKC3vCZgaIggJs9gg0IGl3/DFWc19+UAyaafPxC8AVFg
         ccJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851655; x=1788456455; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvwT6T6j+NkHVCIiwJZYKviDkprWnij+Zd4dVGP5+4c=;
        b=eqebu9kIn1KdNwwDWR9qsI1okv8GRHyA7WCPkRLt5s/V/9miIz5qmq+h/pfFg6HLDy
         ytpDDnnx1hk3HNruDfyT+413QN6AIG1j33eWVnnrgFVjNON0909xUr3zM74oLpd7i7Ck
         WDvWTsI84NMonhzQ8+Mb1OMfbZc5Ag4NF/3f9/OW59+DAXycr2VGA/uNy0o2lZ8zRmdL
         7zX4jTy14T6kiLLh9uD/Z1cPZDgJGKeoX6PU1lia+8er9D79yDfpFP1M7OThfSXi75JW
         ojx89OwyRy03HG3pIKrca6F3NN9XURrJjM3EGZ2UafMV6vUuzr2Ny0YuWXdKIQJeD7aq
         e3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851655; x=1788456455;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HvwT6T6j+NkHVCIiwJZYKviDkprWnij+Zd4dVGP5+4c=;
        b=BJ8L2J+4752dVaeImej91YCXOxbSXHizkLoB2CK30ChXKrwUY2wpYlrwNsNAYXQwJr
         w+WtdkyaKq9o8FVySGje+4Swx/mvkhjzBaweqNdU/o1N+50CwseSqq+eAt3tMU15Lfdk
         ZL3casy5kWSuDsXhPdHkjcNpDD8tETFHxXOPRByn1W9N55qxz209qbXwTyYHHXULxcwI
         mBQYZEaTKMgHLEX8pZlHD7PAxKareUCsUINlgdY6mMugKC9ZpqO1yQy4AI16ILl9evAF
         nGvPTjuFqDoWVwKaq0oalgPf+cGVKQupibInl82npzTK1uXSHsjLU+w19+KAQfVeNKuV
         A24g==
X-Forwarded-Encrypted: i=1; AHgh+Rp5kuubNrZP65OzKnLc6vKStCH5Hjr8n79+TjSMcRjZK8Pd9fsBLBybkxvqLMv5OL/W5Eu06bupWqBw6mU=@vger.kernel.org
X-Gm-Message-State: AFuF++kT1GOwyznrHxG3VJ2pZ84XT/euvC9hsN5K1nMD6X+1YjjicLlr
	NxZ82doalmU9kErokwM8ONXbsBMDxtmIDmsTLSUk0VacF9iS9+GbEx579BDP4XGYQJ75MGvCzzd
	O4B87VzkbrSFw36yS5foCtz/AOe8msVI=
X-Gm-Gg: AR+sD11sxThAdqS95ApoEasqbfX9hdQN+fTwhBUyt5DFk1fg7JDavMxjrszPAQtSYNQ
	+B5HXrMNn8CSHC5wiZdJvReUxyJkC5T6BCD8ku1kKAT0ihmbPYu51WXpjZZwZ+TRScuvhFpBHcp
	GcfuKGsQOWfPzMwhav3lCVFx6bd/TTNpbFRZOaAnxnhAa1Nnfisw2EOA04O5n4V9SZp1R22avJJ
	c2aRcaemuNoRj8nv1t4pFasIDZf8LhOOoOu/F36UMUagAcUEu0PH5V2PJmqHEtoOILjVutfqrKj
	X+Y+4QECWyrucv60/C32mjBpX0Ojw+DL3iey3zRISLttgOE8Dt2OXve9fC/FrKNyhZ8zXBBVbC+
	bSVRdnvl5S1jB/5UWtXi6jt9lpA==
X-Received: by 2002:a05:651c:43c7:10b0:3a1:980f:5905 with SMTP id
 38308e7fff4ca-3a30187d5eemr119801fa.3.1787851655217; Thu, 27 Aug 2026
 10:27:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827130335.6606-1-gvalkov@gmail.com> <20260827130335.6606-2-gvalkov@gmail.com>
 <fbde1932-5433-48e8-b352-bf27eb545149@kernel.org>
In-Reply-To: <fbde1932-5433-48e8-b352-bf27eb545149@kernel.org>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 27 Aug 2026 20:27:23 +0300
X-Gm-Features: AcwNN1XMmtv8Tl2z9UfKPdkvBE_-gNrpL34xpH-g_gnIEgIMH3CQYCP7LMwA5gY
Message-ID: <CADOrJmY5jZvn8zEu-jCntGChXSY9wRd3bsOy1GB0EWNTY9GK6Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] wifi: mwifiex: add dt flag to avoid conflict with
 platform reg domain
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, francesco@dolcini.it, johannes.berg@intel.com, 
	kees@kernel.org, miriam.rachel.korenblit@intel.com, rongqianfeng@vivo.com, 
	wenst@chromium.org, rafael.beims@toradex.com, avraham.stern@intel.com, 
	error27@gmail.com, s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, arend.vanspriel@broadcom.com, 
	peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 18:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/08/2026 15:03, Georgi Valkov wrote:
> > WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> > from the mwifiex ROM, which conflicts with the platform regulatory
> > configuration on units sold outside the US market. For example:
> > - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> > - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> > - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >
> > When the system boots, it detects a conflict between the user selected
> > region and the radios, e.g. BG FR US, and applies extreme restrictions,
> > preventing phy0 from starting on any DFS channel. phy2 works.
> >
> > Add a device-tree flag, which allows affected devices, where the radio
> > conflicts with the platform to ignore the incorrect regulatory hint in
> > the ROM of the radio, so the platform regulatory domain can be used.
> > This does not allow the user to change the regulatory configuration of
> > any radio. It only allows phy0 to start and operate according to its
> > certified configuration.
> >
> > The change affects only platforms which explicitly define this flag, and
> > helps overcome the incorrect behaviour of proprietary radio firmware.
> >
> > [1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> > [2] https://github.com/openwrt/openwrt/issues/9956
> >
> > Tested-on: WRT3200ACM, OpenWrt
>
> OK, so this comment from v6 was not about binding, but this is still
> wrong - there is no such tag. Just make it a standard sentence.
>
> Do not introduce OpenWRT rules in to the upstream kernel.

Dropped the invalid tag. I hope this is suitable:
The change has been tested on OpenWrt and fixes the issue where
phy0 does not start on WRT3200ACM-EU when a DFS channel is used

I sent v8:
https://lore.kernel.org/linux-wireless/20260827171937.28878-1-gvalkov@gmail.com/T/#t

Greetings!
Georgi Valkov

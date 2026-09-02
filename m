Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE6143E073
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346146; cv=none; b=OrzheBW5m4ThUtnIJdaPk1vClIMTqAldSwkMrnCrrKkoq6g2bHytbcbEgGopTDv+fUnC2ZlQbEg/HIslh6O0RV52IB1lBqnrX8IqOlOH2bccJ2ygt7a+39v192Zb49PZebjgcznix+3gyZIFyzTLtFtuaY429Y3lYA8RplsvHbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346146; c=relaxed/simple;
	bh=5EzZXQ8V6NL9RxhHhxukzNsAZVvijkybCPLoUlAjCho=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iu2Uh7cwyS5zpcyhMcGx27fKj7MjwHHl/EePClh6mvFd2/7sHooSBgYIkwpyTDR8K4o14AMw6IiFX/Qb7BSW+pzAYWxjaRKsvC7yYJE/BQgZEIeEmYPH1LN/I+HYwFMmLCzeFCfsG6w3GjGYQm8YOpd11x9x5ItBksyaG8R12EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzt+Favm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzt+Favm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943131F00A3F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788346141;
	bh=5EzZXQ8V6NL9RxhHhxukzNsAZVvijkybCPLoUlAjCho=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dzt+FavmypQFbF3qJ6JG4U6E/zBRcrrTLQ61YXbv5f2vnYH4c9yr1Smk68WJuY2j8
	 f7UwQqcQm2o4ToSbrbyHBDe5THvP2/W8D7Ii91G/SCCAystq+Xc6EVq9X0jgFv9k8U
	 h7Z5l73rBoRUfMm7VRYPXowmjoxkG45LjDCCTNYnmPVAzvnaZavSvosIf3JfX0u6If
	 hE7eTQ3YOadPWPNs0Z7WeuUghwRRFrZT9oeGBglqjr9KXxaylnCw+8sfHZWysB/HTb
	 xVQk2CdyZy9yTsRzQG9hlnWvKECb0Ii6MPmrZCLoNhhAFhW0ZHMhfmpgVsp6zy/E63
	 C+yubQc8KLOTw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so1214643e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:49:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxBUeTVzuaEOqRMxWQsrs5KrtfMio47Sniz4Lp0ZRsf+3RafFj9EDgLUTY/GhkVtF737f1akM9nYqdSP2s=@vger.kernel.org
X-Gm-Message-State: AFuF++muxpx5Nc4Oxee2QEpusp2kB2/gvfFEi8En4edM+I38vL8Prfk/
	floe+iKxhz9zyv5f79siOnNNiRMnufWDP8Qg1maG83yAsTnEOTfzmVFc5/SckB4pNDjLwzKayvO
	lfNGFeI0Q+tzmk5AMarj0/UImj1ssmjM7HaIDHq/HmA==
X-Received: by 2002:a05:6512:131f:b0:5b6:4b2:45b4 with SMTP id
 2adb3069b0e04-5b6087ed44dmr1265412e87.32.1788346140221; Wed, 02 Sep 2026
 03:49:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Sep 2026 03:48:59 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Sep 2026 03:48:59 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMuHMdXmn7B_UOb8f2j0_BOx3d55nA0-0Auay-HLFYWtziS+6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
 <20260826122742.153643-4-biju.das.jz@bp.renesas.com> <CAMRc=MfAdTMb_4ii=up-ESwc322YYjzseyvAxshM6vUcEGfxcQ@mail.gmail.com>
 <CAMuHMdXmn7B_UOb8f2j0_BOx3d55nA0-0Auay-HLFYWtziS+6Q@mail.gmail.com>
Date: Wed, 2 Sep 2026 03:48:59 -0700
X-Gmail-Original-Message-ID: <CAMRc=MewW5aLqY66i-uUor3ke6k25rjZh3z7Cn76e_KhHQWoJA@mail.gmail.com>
X-Gm-Features: AcwNN1W3bxjr6MHNEaKG776nM62LP78_XqASMYOXKt17cNFJcTa4ryypmgpnWGo
Message-ID: <CAMRc=MewW5aLqY66i-uUor3ke6k25rjZh3z7Cn76e_KhHQWoJA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] power: sequencing: Add Renesas RZ/G3L Power Ready driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju <biju.das.au@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sep 2026 09:10:45 +0200, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Bartosz,
>
> On Tue, 1 Sept 2026 at 18:15, Bartosz Golaszewski <brgl@kernel.org> wrote:
>> On Wed, 26 Aug 2026 14:27:25 +0200, Biju <biju.das.au@gmail.com> said:
>> > From: Biju Das <biju.das.jz@bp.renesas.com>
>> >
>> > Add a power sequencing driver for the Renesas RZ/G3L PWRRDY module,
>> > which signals power readiness for various IPs (USB, DSI, CSI etc.) on the
>> > SoC. The driver binds as an auxiliary device to the parent SYSC driver,
>> > using its regmap to toggle the SYS_PWRRDY_N register bits, and exposes
>> > {usb,dsi,csi}-pwrrdy pwrseq targets.
>> >
>> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
>> What is the merge strategy here? Are patches 2 and 3 independent from 1 and 4
>> at build time?
>
> I think so: one can safely select a non-existing symbol in Kconfig.
>
> So once you're happy with this patch, I can take patches 1 and 4
> through renesas-devel.
>

I picked up 2 and 3.

Bart

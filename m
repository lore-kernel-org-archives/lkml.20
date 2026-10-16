Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E31C3B83E1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179160; cv=none; b=N2RBE8lF050WvPRcR9Qkyul58vBMFqEXGg9+Rgkq+X3ER/5cRdjExu0ocUbvQlRhShAw1SKBkvJiUGvL5cMldBULmt6QhdcWFgaroyFfZiBfeCTYyv1ysciVsz1FnPukFlqku9P9GX0m6MfRcBmEPJuAmGuiTAsUXziE4e3pjoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179160; c=relaxed/simple;
	bh=br2GX12R/HfpiLwzsj1/S/8DyFMuLHUl83yTUA1p69k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfVCy+pvRkAB7AfYq6d0oCyWAtuzUYp0xgi8VMa0yuCxUXsoA4nT/oIvS22Iv5XBESAnElbJpj8wtZMUS32C3NWB/7OfqZjdNdo99yK+pC/Qn+2WPo77e93WS+ZC/p58W7f/Z2uKV3L3XAepqHuCfT/buCV24PsDpR6lsLN2PNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aReIlCrf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aReIlCrf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE39B1F000C9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792179157;
	bh=br2GX12R/HfpiLwzsj1/S/8DyFMuLHUl83yTUA1p69k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aReIlCrf8fopyF3ChiCIeEC1hCVb1THWDlgJCVjWvzHnaPg3t3MAIyhg8Fr1qc9/g
	 bAFQSCdM5MdEygdgrMT8ldLha9m7P76w8w6j/7Xw2O2MUqWQ6S1ORocCep7vvCWVnv
	 6hN0Z+UiwikKN26uxBoYDhnDL75AwoLrOZrzm4Wl/DB//rug2d1E8QgBEjZqYKxW3W
	 5tky7SVtLE2Zvp2ombz8vwf/m0T1ZSSfLSpKAT5HChrlAldlFv5MPjciI1qM4I3hEq
	 xfKCn0ertUbTqq5kBKCae86MJZ9OOf7Y0gtSgJIidcPulfTy0uOrszZtTvLLlEs46h
	 k+Gm5MHX5lKIg==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso42666466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:32:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxV1dM+TmT3eVF2ZqcftByEoFg9RyZXERy5FxQINTk2deP5p55waszikqSPPCATyLM1xz4fIjyq4oR7XV4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHsaoCiqAEstF0llBdHjwo8E/rvzjvXthdZBihJ2OBJpo+Hbwu
	4XdWvxp+FUzT4eFetcA5erdDp9Avr0MkKh1vuS7tQznbh4LRL3y0cgfxmJsQS0e5kMXkr2ISyUo
	wO9EPNKYD7j5GR5YRtGnOF4Jh/nwRTQ==
X-Received: by 2002:a17:907:3f95:b0:c34:c5e8:1dc5 with SMTP id
 a640c23a62f3a-c419da41344mr62932166b.20.1792179155493; Fri, 16 Oct 2026
 12:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790606188.git.andrea.porta@suse.com> <ad9bc35d7c30f7925fed4c6621ed0f67c39c3f09.1790606188.git.andrea.porta@suse.com>
 <7c437a10-985b-402c-b3ac-cfa97c53d014@broadcom.com>
In-Reply-To: <7c437a10-985b-402c-b3ac-cfa97c53d014@broadcom.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 16 Oct 2026 14:32:24 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+rjfk-EGKy+sf-S7QRpGy_7SC38ZUASs28gWm_PuNDvQ@mail.gmail.com>
X-Gm-Features: AclHuK-3lCKkhjPmvIybYNhFqPMhoSBVuchxzZzjM1TnQd3DNXu0J5TqQN1c3O4
Message-ID: <CAL_Jsq+rjfk-EGKy+sf-S7QRpGy_7SC38ZUASs28gWm_PuNDvQ@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-pwm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>, 
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com, Sean Young <sean@mess.org>, 
	Julian Braha <julianbraha@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 1:26=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 9/28/26 07:42, Andrea della Porta wrote:
> > From: Stanimir Varbanov <svarbanov@suse.de>
> >
> > The RP1 chipset used on the Raspberry Pi 5 features an integrated
> > PWM controller to drive the cooling fan.
> >
> > Add the corresponding DT node for this PWM controller.
> >
> > Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> > Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>
> Applied to devicetre-arm64/next, thanks!

And that introduces warnings because the PWM binding is not applied.
Either wait for the binding to be applied or apply the binding with
the .dts change. IOW, Broadcom is warning free (you're welcome), don't
introduce warnings.

Rob

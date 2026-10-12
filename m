Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEBE4D37B3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829578; cv=pass; b=lTqB02FQVs7VqTGrfu8B6UXGrfRPD+HGOuFJ9wCS5RlwCNdPtXZT0It4uFsFj1FZOZBRtAGOu8s1kHtkZs8f29yN5Lq4sWIheggHHka1Ryj02la+7/MQ5B3AEYYU247tByWePNFiuEeG3vcxofOfcoAa9tzUJ38eChAc6AmhFDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829578; c=relaxed/simple;
	bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rupMagISm+Qy7XVf/XuS15CwzIlIWMe7gNo1txg4QsZDkTx29xwgJr9PbNoAMcCAdoKceZGYdox6fP1OSf+CR1UcGY7o94XGEkJ3ciJqWRoXZ/icVWy7VKSAi1FF2yDbpuRFb+UG2BDmAPPccrbjNMOF2dwec0VpkWxS1QTpGP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=owuffjT+; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="owuffjT+"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso299385666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791829575; cv=none;
        d=google.com; s=arc-20260327;
        b=bIaVsQ1WVYbl4jrRVc/V4qCyNjCdUzAaaE5GDdRpvJJWnV/iPton9CC+YJXib/Jqd3
         wH/hwiL+Ow1FtXlaiT9r+V5szgyLe1AObdxeCBEN4y4U4uG5ePUeTI9X+a1hbGKa4xZD
         N/EiFbObAoudtIVnHjyrnDZxCoLzp5lBl8M26mIV1V2Lb2OmYXOz7ixOroEW+Vlir2NW
         nnxewKVNIFN/6aFioGt9ny9qdAR2UPwzSdndlh6LdoXgKPS3rEfAn7QBHYThYk29a5Ac
         +qOycT0A9qK7TB9F+6v408L/55ZSB9ryIvfr3CZzAuWnUs9plyN3DAUsDyE1qe6Uxisn
         DqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
        fh=Tl2NhraMtP7H1jQoghyjEWumS7L5iOG2U2VdgsuziA0=;
        b=pXDODCJPwPuUMfyMumTTIAi38KjQ5U6DsMgq/VfcmHMKkWXZMAtHcOY4z5lilAUyoR
         zVCMxNsw34Z2RBYyGomhDO2LXjwXCvc6IOErf1VSfPbBuLiK2rceMT4Ueh9VK/+ezkvG
         H2vFfcHAzNRQVmer+OA5vLpalVsyZJBcm6swv/SGI66SWxNy1vCeCkVD69E/xqe022xt
         tGMO+NIZIgIU+8QYfyWmAZP9XFAyXfv7dZXf2cU3G9wVppeeNFVBKWMkqQJcGOkEfi8B
         vpsYpmEXEXHNhSgn+8Zny3NEzrCRIc1qoDQqXMNux34xcNQRQpSu+42BPLzkFdQzBxf7
         5lMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791829575; x=1792434375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
        b=owuffjT+l3q4IlEsQ3Zkn/I2utZbjTY3Czaykpn2N/m5tPsCzijRhO/uwdnr/aZ8zJ
         BNmF3YVKvokL3mcSVNmxQ2vvTyp5XMjMV67Q4OI2g0WjRI4wFB2evVihKit1iaJQ4WQ5
         1s9JHT/UzGVFZxOVvfcirEDrdglsSl7659obz2oCm5w6W6iidg3PmVLgxg4eoe8FWtam
         8WNV9vimRnHX2M1H0B6oXNTMudg0j/NuYg82N/u/gSNLrWCXocGjBMq3PaEd020pbZtB
         yCYcx4WmC+516lXVMxIpA3Jc9FMld4o3g0ShGC9PXXrpX/zv40duiBv5UESk/CeMb3am
         Jrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829575; x=1792434375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
        b=N59MgRVBcI5DI2WB7tvEoinSkAPp3D20qhH46G+i8q+Abcc1Zla3iucbBxGtCqLnt5
         462jNXICwoqLHkYBDFdh9PUkLl8Sby1/mbdi/Fc6ggzon5KVAPsd1P6XBR+P3f0oGaHR
         wKCzFsfYC+ZdJlPhYBtyNkYkT+LRFaNVQP6WH5LvT36PVVoL1wu+76XhykO3SY3lNqYd
         61Us/knfm96zu/q9cvxvdwfn07fVID/lc4sbBb7lKMePkx19JrS4gd6py+A+yY8qlucm
         xuWkqOflopNW4SfPcoRB4jA6031FxhZMt/uD4/6kLNLFC+k53HvkqztakqLZbeot9Syy
         LFkA==
X-Forwarded-Encrypted: i=1; AKwUvBzWCsQElG4KUtjvjCc5/avoFZH8fi/0HEEUp3e7JPqMBfPbRBf4BZ4P+uJikPdocGHmnYAtOq6VHiR/orE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzA0Tw0n5jMmy6A7uewYaS6SFPjdzvpywMlTqis9looDBi9Rlx
	Qfpv/bhG/zTHn3+jhVHOSLhwuTFtgGnAXhh8xmb6o9OOplbL74GWJthxQknmF466YLKpAOv8vZ5
	nEYKaw5A3D/HuGDxAycZTK7O94rkB0Lg=
X-Gm-Gg: AYBFou0UbaCtXos+Bv0p3rc69Lp3y0SuqMmsH+0PFK9paNMehb1sSurHewVYverSuv2
	L0AlfF80OcH95bh5Bo3BAsb5k26bNkFU4D4+cxpfYcTsPa2BaRZ1mSe6vd+udtnaYTg922ZSzoH
	bVB/GgFvrDs1jZuWCbnJerotQOl0hJ0iOpkdUBNwGJ9DFjKc0wIZ43rRYaOsDnIR0+FGkG3Rplm
	4uXrR2SYXT8j0Q1gKklmGRptMUQRzivU6W3PDH5ohl13ugbY9M94ORAJAgDSztBVaP/dZFuVbt5
	26aSl1QKEvxIXMzX6RNLEsU8xuTTepBtNhyB8qV0S3H+kRD4bbHxOwT+hbL6nZxCc1sl8gIpj4a
	HEir6iVLiYsh8akKdUms1jBO2nRVWJO0BCU0VDtZbbRzhJ+Dq+PhMp7puu4waRpPhOdxAyf9T4Q
	iQuUYbje2WsW/Lhe7PI05UV8eyGYf/iVMoghrmDlCD
X-Received: by 2002:a17:907:3e1d:b0:c2d:d27d:ef88 with SMTP id
 a640c23a62f3a-c31aa0b5511mr1082097066b.42.1791829574275; Mon, 12 Oct 2026
 11:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com> <CAHp75VfCrQAnVYV-7wiga-R8A4VKgjfV+EHo_7jy=FNmU=Ov6Q@mail.gmail.com>
 <asytkrYip+v2vl/i@shlinux89> <CAHp75VfqdVAYCTi2j0sB=rxBYaJ709-Wq7-aprfZZiBxbu=U_A@mail.gmail.com>
 <aszHhGylycuDIY35@shlinux89>
In-Reply-To: <aszHhGylycuDIY35@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 21:25:38 +0300
X-Gm-Features: AclHuK9Yv8wpNcKas8ocynagdzdCNr0lM7euheMiilCMFZqAJfrfDJ0QKY2cll4
Message-ID: <CAHp75VcJsjRk5v6=X_ut_S_vLLu24tHieOy43ATAH2Mr3P2RyQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] gpio: mxc: fix wakeup_pads bit operations
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:37=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
> On Mon, Oct 12, 2026 at 01:30:04PM +0300, Andy Shevchenko wrote:
> >On Mon, Oct 12, 2026 at 12:46=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com>=
 wrote:
> >> On Mon, Oct 12, 2026 at 12:15:28PM +0300, Andy Shevchenko wrote:
> >> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.=
nxp.com> wrote:
> >> >>
> >> >> gpio_set_wake_irq() can be called concurrently for different pins o=
n
> >> >> the same port, so use atomic bitops when modifying wakeup_pads.
> >> >
> >> >The code doesn't modify any reader part of this member. So, the above
> >> >paragraph is incorrect, right? Otherwise it needs to be clarified how
> >> >assign_bit() does change anything.
> >>
> >> I will replace with below:
> >>
> >> gpio_set_wake_irq() can be called concurrently for different pins on
> >> the same port. The IRQ core serializes per irq descriptor, but
> >> different pins have different descriptors, so concurrent calls for
> >> pins on the same port run without mutual exclusion. The plain |=3D and
> >> &=3D on wakeup_pads are non-atomic read-modify-write operations that
> >> can lose updates when two CPUs modify different bits simultaneously.
> >> Replace them with assign_bit() to make the modifications atomic.
> >
> >Right, but the code does change only the writer side. There is no
> >reader side that was changed. So this patch does *not* add any
> >atomicity. You also need to check if the reader side already uses
> >test_bit() or something like that. Otherwise it makes no sense.
>
> The writer-vs-writer race is the concern: two concurrent
> gpio_set_wake_irq() calls for different pins on the same port both do
> a non-atomic read-modify-write on the same wakeup_pads word. The old
> |=3D and &=3D compile to separate load/modify/store instructions that can
> interleave, losing one CPU's update.
>
> assign_bit() uses an atomic RMW instruction, so concurrent writers to
> different bits in the same word are safe.
>
> The reader side (for_each_set_bit in noirq_suspend, wakeup_pads > 0)
> runs in noirq context where no concurrent writer can execute, so
> reader atomicity is not needed.

Thanks, now make sure that summary of this is in the commit message.

--=20
With Best Regards,
Andy Shevchenko

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566944825A7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584953; cv=none; b=X7238D0E0v8oP0kK0lvQ/p+bbw+Mw889Mi6wdBcmXUAPoUj3ss9gM1aV8P7u95ptvbhbt4rxIqShTZI1YT0cEolj9tJGvUt/MZs5Yx30hzes0WR6p43ToiAl9YNkysqrSNsLXk2GxqcD1VQPS2CLsIqh8XWjd77bIrRPwYzi3HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584953; c=relaxed/simple;
	bh=L3sthWBh3U3rRznFXZPPHePa4vquDbcKV//zekWBLgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtFNWnf+6fY4N/7G/bc+KIYIqnv9FPhkIySCa3rlYcyln55OEoFu0ndaP2sq4SWJlrkg+zAdQ05pXVM4ndMdGBcyNxctZ7w72rAUUZ9McRZnC7VfaEG9VaFoIEsXga/R6fPp+zwYPcvkHe+Mkn+btDV4Fg8GUMbHn7bVePwmreA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8BmGDst; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8BmGDst"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE55C1F000FF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790584952;
	bh=Sn6tDoFYWxK2ewNYx+8E/CdQ5QB/1Ewh3VOvTMWnBPg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m8BmGDstNuOkdEoFfKUa026lUHmrWYRP9CvGM7PHq8QSh6Fy/EN7VkFmwFo7H5gpc
	 9IhuAa7VGOXqrnDGc6Zg9PLV2IOHUVmRiHS5WgJmO/IjYdNmK/rDQ+PDJi2JNhg+Ml
	 pxO1Rt2+tdj3DHaiyEs7sbxTzPitswdrQblbhqnzBwobR8qPebdwHdwFzbIoPJPo4f
	 gwvkRolqoafl/QPt6djlUDs5sV+HXMOIp0ZxNHceKjgaGmDVeQk1rgC8ry/JpZhhiQ
	 sOxXzN0ixZn87p06mSAS8rhNyW7oOFvyhCi2Q68P782fjSMCjqWPVOIZsVMr7TfJI3
	 jb8Gwp0a4JeAg==
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso1263076f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:42:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxRZkFEIzMs3rDh4iAiztvS/Z5g+6Jjr/yaIlEtvXAa6pOVeoN5dZGMQw4Wk/QEZkNpVnllnJU5WMHHkDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvBEga61xMFeNqKr4cyGO10dLQ2SxpfKIfaGLSa5549cnpTiXv
	S7Vq/hp5v7wQWP1NMQO/1jgx0s603aOUx+4Aw/BzIilXpobKVvGaI3l/sHU/aWEzsUHlDhAn/Sl
	BjGCkDGis3tuONB2wkkC8NvipxDay7do=
X-Received: by 2002:a05:6000:25c2:b0:487:2354:d9d5 with SMTP id
 ffacd0b85a97d-488717240c7mr25172189f8f.55.1790584950591; Mon, 28 Sep 2026
 01:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816070049.2097442-1-guoren@kernel.org> <20260816070049.2097442-2-guoren@kernel.org>
 <20260908222349.GA2324870@ax162> <CAJF2gTRYaiskhtZckt9ccRqv7an+OBKE34N=0uR3uKW9F8r6kA@mail.gmail.com>
 <arDSR9S3tZPB91Zm@monoceros>
In-Reply-To: <arDSR9S3tZPB91Zm@monoceros>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 28 Sep 2026 16:42:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSsHamRg4uRaDEXomR31mv0otXGf_waxqqCbVSZ+gRahQ@mail.gmail.com>
X-Gm-Features: AclHuK9ZTdr4DJypk-aoHyBAEmJJZLWh2enaYUZLnKzosB_yBlbrUCehBGUIVBs
Message-ID: <CAJF2gTSsHamRg4uRaDEXomR31mv0otXGf_waxqqCbVSZ+gRahQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] riscv: smp: Move enum ipi_message_type to asm/smp.h
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Nathan Chancellor <nathan@kernel.org>, tglx@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, palmer@dabbelt.com, pjw@kernel.org, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, daniel.lezcano@kernel.org, 
	anup@brainfault.org, hui.wang@canonical.com, samuel.holland@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 2:45=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> On Fri, Sep 11, 2026 at 09:17:11AM +0800, Guo Ren wrote:
> > On Wed, Sep 9, 2026 at 6:23=E2=80=AFAM Nathan Chancellor <nathan@kernel=
.org> wrote:
> > >
> > > On Sun, Aug 16, 2026 at 07:00:45AM +0000, Guo Ren wrote:
> > > > From: "GUO Ren (XuanTie)" <guoren@kernel.org>
> > > >
> > > > The IPI message type enumeration (and therefore IPI_MAX) is current=
ly
> > > > private to arch/riscv/kernel/smp.c.  Several IPI providers need to =
know
> > > > the exact number of IPIs that the architecture requires, so move th=
e
> > > > enum into the public header.
> > > >
> > > > This is a pure code movement with no functional change.
> > >
> > > Other than a build breakage with allmodconfig :) -next has this chang=
e
> > > as commit 1ae91dc397eb ("riscv: smp: Move enum ipi_message_type to
> > > asm/smp.h"), where it breaks allmodconfig with several errors along t=
he
> > > lines of:
> > >
> > >   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_m=
2m.c:20:
> > >   drivers/media/platform/mediatek/vpu/mtk_vpu.h:63:9: error: redeclar=
ation of enumerator 'IPI_MAX'
> > >      63 |         IPI_MAX,
> > >         |         ^~~~~~~
> > >   In file included from include/linux/smp.h:119,
> > >                    from include/linux/interrupt_rc.h:17,
> > >                    from include/linux/spinlock.h:60,
> > >                    from include/linux/sched.h:38,
> > >                    from include/linux/ratelimit.h:6,
> > >                    from include/linux/dev_printk.h:16,
> > >                    from include/linux/device.h:15,
> > >                    from drivers/media/platform/mediatek/mdp/mtk_mdp_m=
2m.c:8:
> > >   arch/riscv/include/asm/smp.h:27:9: note: previous definition of 'IP=
I_MAX' with type 'enum ipi_message_type'
> > >      27 |         IPI_MAX
> > >         |         ^~~~~~~
> > >
> > > So one of these needs to change.
> >
> > I prefer to keep IPI_MAX for SMP and rename IPI_MAX in mtk_vpu.h to
> > VPU_IPI_MAX, consistent with SCP_IPI_MAX in mtk_scp.h.
>
> That's why using driver specific prefixes are great. Why not
> MTK_VPU_IPI_MAX or something along these lines?

I agree that a driver-specific prefix such as MTK_VPU_ would be
clearer. One correction to my earlier reply: the patch uses
IPI_VPU_MAX, not VPU_IPI_MAX. This follows the existing IPI_VPU_INIT
naming in mtk_vpu.h; the other identifiers use prefixes such as
IPI_VDEC_ and IPI_VENC_.

The intent of this patch [1] is to fix the IPI_MAX collision with a
minimal change. Applying a consistent MTK_VPU_ prefix across the enum
would be a broader cleanup, which I think is best handled separately
in coordination with the driver maintainers.

[1] https://lore.kernel.org/all/20260911-ipi_max-v2-6-a77826ff189e@kernel.o=
rg/

--
Best Regards
 Guo Ren

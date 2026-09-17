Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A139E4D37B7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644181; cv=none; b=JuOosaPpsatXV5Abcktv/f0uVK7FCyfve+Z7Vjrv38b4IlFMNzDYUimTSyYVmfRWYU1PeYeYNS6fTqCMegz2afynP6YzpGHlxDbLbphCnxTouw8lcQ+4bf5YExU924L8XhXPVCYQp+zixTbHHgDs3+hlcU72irocpcMeTMhmQIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644181; c=relaxed/simple;
	bh=Wac/AhcaxN6kmGO8R2OM+ObdYionFE8bgUbpLv9bom8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IjoNbNhBCh3uCaQpNnU80WLDtoLLZkHtQ+RszHcppg/jKYb5EAFGadI4E2GK5lbKWpQQvcrYY4mT69UOGmfHTRZmofDq+BTRzyxV3NDMdS/xd/YSKEDJgjHeXmhjUqifFpmO+9uOetcOHxUEXnOUxm/NgsWD/qgBYPGSyk+2W1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXiXYNpa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXiXYNpa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04301F000FF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789644172;
	bh=n6B9j/a1/s4fshEJb5EzFOlgfCFA7frpy0VX2srAiwg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TXiXYNpabvSqHPTuVy63UzlukAP9rW3YxZn68xoZHUgyHw7UYnxU5Qi1d3+f96V5e
	 F02mqfQ0pDCExHmUmcF5lPKldiyNFr41olfeSh3y5vdzPOBl6Lfag8kwxpbWDNAx44
	 jEG/vybZryl02Mcyxq67Dv/ZEDQHg5WtfNZcWKFzkfVtX71DBRW6BpPJNPm5QJXWi2
	 P7O5MDIxS325W+D7YNh05nZuASiwbgkSVzXKVIo7N3XVcaBq5xwJxetGX2i1IIdrud
	 UWlRlcQdHpj+jW9rLUUxdGWDY1ob+Tv08ZjzavvUVtnsA/cF3qTeyR2azgeb18s3be
	 gvOG0s+xZvzjQ==
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so351646f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:22:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx+BsL3JLnASkbPzmkmP3c1NYqf+OpBLc6X4COJuvX7JZ2IOaS7vb7ysAjAtn21002z8enuAMRB/tN4Q2I=@vger.kernel.org
X-Gm-Message-State: AFuF++l0SmxT6QDwqsAGezNqJBZ8Uphl2RH0WdHNgyiQI8fVlvjIcUfW
	EiMbG1Mj1/7p5aMO/uTN8hXAx0QpRKt0ikiX41N3655x6dvjkp0URnzrMdb08PRJ+lIX2jIuM5h
	4RLVJp3mfa/sj0vrJS8/AcUzLjx/K8C4=
X-Received: by 2002:a5d:5c89:0:b0:484:3310:f39b with SMTP id
 ffacd0b85a97d-4870d05a853mr8600400f8f.28.1789644170593; Thu, 17 Sep 2026
 04:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org> <81f0bf10b41dff85872487ab68c750471b7c2f89.camel@rendec.net>
In-Reply-To: <81f0bf10b41dff85872487ab68c750471b7c2f89.camel@rendec.net>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 17 Sep 2026 19:22:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQZWfvN8c7E3+jcmzD0GqzYKzYO9vLd=eR36azKU1Uq5g@mail.gmail.com>
X-Gm-Features: AcwNN1VkQt2KJ9LdNhZ0s1HMZyJ-GB0dwEmH64lRQnabSIV5TmddFI50VGPY-Rw
Message-ID: <CAJF2gTQZWfvN8c7E3+jcmzD0GqzYKzYO9vLd=eR36azKU1Uq5g@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] riscv: Make IPI_MAX visible and use it consistently
To: Radu Rendec <radu@rendec.net>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	"tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 3:53=E2=80=AFAM Radu Rendec <radu@rendec.net> wrote=
:
>
> On Fri, 2026-09-11 at 03:27 +0000, Guo Ren wrote:
> > This series removes the implicit assumption that RISC-V supports exactl=
y
> > eight IPI message types.
> >
> > Currently, the SBI, CLINT and ACLINT SSWI IPI providers use
> > BITS_PER_BYTE when sizing the generic IPI mux, while IMSIC carries a
> > separate IMSIC_NR_IPI definition set to 8. These values happen to match
> > IPI_MAX today, but neither is the proper source of truth for the number
> > of RISC-V IPI message types.
> >
> > Move enum ipi_message_type to asm/smp.h so IPI providers can use IPI_MA=
X
> > directly, then replace the BITS_PER_BYTE and IMSIC_NR_IPI uses with
> > IPI_MAX.
> >
> > This also makes adding future RISC-V IPI message types independent of
> > the current eight-entry assumption.
> >
> > A follow-up patch renames the MediaTek VPU mailbox terminator from
> > IPI_MAX to IPI_VPU_MAX. That token belongs to the VPU firmware IPI id
> > enum and should follow the same prefixed convention as IPI_VPU_INIT
> > (and SCP_IPI_MAX on the SCP side), instead of reusing the generic
> > IPI_MAX name.
> >
> > ---
> > GUO Ren (XuanTie) (4):
> >       clocksource: clint: Use IPI_MAX for IPI muxing
> >       irqchip/aclint-sswi: Use IPI_MAX for IPI muxing
> >       irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI
> >       media: mtk-vpu: rename IPI_MAX to IPI_VPU_MAX
> >
> > tip-bot2 for GUO Ren (XuanTie) (2):
> >       riscv: smp: Move enum ipi_message_type to asm/smp.h
> >       riscv: sbi: Use IPI_MAX for SBI IPI muxing
>
> I am confused. Thomas merged your entire v1 series a week before (see
> the individual replies from tip-bot2@linutronix.de). Why are you
> sending v2?
>
> Patch 6 was not included in v1 (but it's clearly related), so perhaps
> you meant to send only this one as a separate patch?
>
> Also:
>  * The cover letter should include a changelog, indicating what changes
>    were made in each version compared to the previous one.
>  * Patches 1 and 2 carry a "From:" tag that attributes authorship to
>    tip-bot2, which is wrong (if these patches were to be applied).

Sorry for the noise, and thanks for catching these.

You are right on both points. I missed the cover-letter changelog,
and I should not have resent the already-merged patches as v2. The
"From: tip-bot2" tags were added by b4 because those two patches had
already landed; that is useful as a reminder to me, but it should not
have been left in the patches themselves.

I should have skipped the b4 v2 flow and just sent patch 6 on its
own. The only remaining change is the mtk-vpu IPI_MAX rename, which
is needed after IPI_MAX became visible from <asm/smp.h>.

If you are willing to pick patch 6 as-is, I would appreciate it.
Otherwise I will resend it as a standalone patch.

--=20
Best Regards
 Guo Ren

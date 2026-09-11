Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FEC2D0292
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789089445; cv=none; b=he+kWyJhMiYbomQhsb/5DqP/kKKG74bKAdQWX1NMarskMsQLbmOCyQmp4H4cGRPbyD+luuwNHop4iyTPhow4DQAY2c7j/6D8ylG9/iQY1k+D0amUXCDKFgba4eMgJKG2lypX+VaRS8t53S6zcmJtVL+LbpQH4wLLH3lp/nq6c0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789089445; c=relaxed/simple;
	bh=gV0aZACJ/tq47sOfII0qzkfrbXoMnzQpbR618Gu3xAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4CUfbMZLFG4202eWVCUpW4Z5EcTuWkhWxC/czuhe99xDnUPIQCEUerQ2dzS9EisbPom3qFyEiPcK62T78D03HlAQ2TeU5J2zwXrjo7Fu0hFmZT73z4u5gUyn1BmmohXOxB/GXJ0q8P0tspyIe+cxOOatKQzHqNAF6bZ/Rv6GWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/FibB5h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/FibB5h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CC91F00893
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789089444;
	bh=Xv9GpbZlpWhE33nw9eA7g+SjunCSHBMphq38hiDBlI4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W/FibB5hHJItumDLADY5HYrtNRtC5anZrg5j1iHL45UYk27tPHBDjwHqbl66oqWA3
	 y5b6V6wdLMnbSGk6QhijIQb+OUeGOmVPz1f79LvPa3TdIKkTv2FtrX2ZACR+3ECmef
	 9bMYDeAPaN4meaz0dWtalO/8o3wanprT9+tnqH5RhPgClWSsLKJQtkelC7QCSyJiL7
	 oMIw8Jv/wX/6g9DqheQ/TxNAutG+cYZD8BH2pGS0Eipf7wSLezRcZnEVPH0D8MNTm8
	 9NNKErbVu9Wi51Gk1MoywqbV+zEs9zRobZ4w1dx+vqkgnwZYiBS8moBQY4/R87TF+f
	 zBAzFNO7H4iyg==
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so133456f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:17:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxoZ45VNXUTJNTrbf5DtBKxav/UWEnVPa2Q3tX7WKrrWn+pIurWF72Cnxh1yyhPUtXCi3qKEvpX+G0+FAs=@vger.kernel.org
X-Gm-Message-State: AFuF++kCkyyer/AG0CE1qs8ophTJcKAuKc7MdxABRnLw1/heBhrRFOY1
	jGCUam7lLX7k9I/cK0zTW8LymJvYwxUtwCwgjVWvQc1q7xVbtH5g/cSRGZMZjFJrmC+bwaO5BSj
	bBsW3b9+uS9NVOt0tAwZJsh9rwsryFnA=
X-Received: by 2002:a05:6000:4025:b0:486:e722:f3c1 with SMTP id
 ffacd0b85a97d-486eb1d9c2amr1978549f8f.7.1789089443089; Thu, 10 Sep 2026
 18:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816070049.2097442-1-guoren@kernel.org> <20260816070049.2097442-2-guoren@kernel.org>
 <20260908222349.GA2324870@ax162>
In-Reply-To: <20260908222349.GA2324870@ax162>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 11 Sep 2026 09:17:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRYaiskhtZckt9ccRqv7an+OBKE34N=0uR3uKW9F8r6kA@mail.gmail.com>
X-Gm-Features: AcwNN1Upj2AoY0n4XssnGeZ1WdH62C0SXBhl1o0STuofx36PhU_vqnBmvqbC1gI
Message-ID: <CAJF2gTRYaiskhtZckt9ccRqv7an+OBKE34N=0uR3uKW9F8r6kA@mail.gmail.com>
Subject: Re: [PATCH 1/5] riscv: smp: Move enum ipi_message_type to asm/smp.h
To: Nathan Chancellor <nathan@kernel.org>
Cc: tglx@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, palmer@dabbelt.com, pjw@kernel.org, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, daniel.lezcano@kernel.org, 
	anup@brainfault.org, hui.wang@canonical.com, samuel.holland@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 6:23=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Sun, Aug 16, 2026 at 07:00:45AM +0000, Guo Ren wrote:
> > From: "GUO Ren (XuanTie)" <guoren@kernel.org>
> >
> > The IPI message type enumeration (and therefore IPI_MAX) is currently
> > private to arch/riscv/kernel/smp.c.  Several IPI providers need to know
> > the exact number of IPIs that the architecture requires, so move the
> > enum into the public header.
> >
> > This is a pure code movement with no functional change.
>
> Other than a build breakage with allmodconfig :) -next has this change
> as commit 1ae91dc397eb ("riscv: smp: Move enum ipi_message_type to
> asm/smp.h"), where it breaks allmodconfig with several errors along the
> lines of:
>
>   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c=
:20:
>   drivers/media/platform/mediatek/vpu/mtk_vpu.h:63:9: error: redeclaratio=
n of enumerator 'IPI_MAX'
>      63 |         IPI_MAX,
>         |         ^~~~~~~
>   In file included from include/linux/smp.h:119,
>                    from include/linux/interrupt_rc.h:17,
>                    from include/linux/spinlock.h:60,
>                    from include/linux/sched.h:38,
>                    from include/linux/ratelimit.h:6,
>                    from include/linux/dev_printk.h:16,
>                    from include/linux/device.h:15,
>                    from drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c=
:8:
>   arch/riscv/include/asm/smp.h:27:9: note: previous definition of 'IPI_MA=
X' with type 'enum ipi_message_type'
>      27 |         IPI_MAX
>         |         ^~~~~~~
>
> So one of these needs to change.

I prefer to keep IPI_MAX for SMP and rename IPI_MAX in mtk_vpu.h to
VPU_IPI_MAX, consistent with SCP_IPI_MAX in mtk_scp.h.

Thx for point it out

--
Best Regards
 Guo Ren

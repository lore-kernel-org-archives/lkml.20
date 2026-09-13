Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BED62BE7A7;
	Sun, 13 Sep 2026 19:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329211; cv=none; b=JtOCbBQrxw3zs3eID3DJ3G9VcWoLQW/iwFtvsZ2wvJrKLQDQUEsFph1sAtr9nETMgpH6o61owDUdKA1OsPnECFhE6k4TggcT5XK40Cbi+UIV9L6lsvQrYMLl2KYSiiI1dfwVsrxJPNIrxrAMuoWhPLyNUivV0EBJ6+fq4/KFStY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329211; c=relaxed/simple;
	bh=T0pqFukExVh823QT6gZ5rJ8J4IOF8bD800cZPU+R1TI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=arDFLn3SfUHPvqUyIXM093eOtY0NlnF+6TQJh62HjB8oXk6cMvh7695UGcaK/BrdtdF3ccIMiRsNapeVWqK961idC3v2dy7XS9GXAQXYcAA8T9L0COP/G3D4C7q3ChOhWjbqnKJzp2aUjzpaI8D3tYW+YfIfTSiiUynuC4OtbQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=bPrxv5Zx; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="bPrxv5Zx"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id B5817CD5BC;
	Sun, 13 Sep 2026 22:53:23 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro B5817CD5BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789329207;
	bh=OxeU5Su/M8erJsaUWOmS2EmM0zS643DtJmSk63z/Z00=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bPrxv5ZxzllOQiy2krKFOjC+n45BHyruI8wXJWW2dWXRr4DcLu0qSRf6d6pHLDx2g
	 jWcfuKvfm4R5fkihNP2bYAGlMPiEKu2EReiVm/sDrL/7gpXNRKBB7aWno9BxyE0PIx
	 eJ2WBtrgtJF/6pZnjqFQwwsDO/KmzOaIx0fkVSU/CK9rK96UEIEpRCrZ3RBw/9RO7M
	 dIG3X6gzczLJWO2ggvEASF+KnDy8M/wU/ZXNb4/e4nVlCj9JFDbH5mUjxdeheYhNPH
	 IQWdrYEJBtqEOV1SW3KVrCuI7RGRLTeehLAl+p9Cvbyg6Rh5mmTzHhmbRZNO4iAJKh
	 MCi83qnwm1Cog==
Message-ID: <81f0bf10b41dff85872487ab68c750471b7c2f89.camel@rendec.net>
Subject: Re: [PATCH v2 0/6] riscv: Make IPI_MAX visible and use it
 consistently
From: Radu Rendec <radu@rendec.net>
To: Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti	 <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas
 Gleixner	 <tglx@kernel.org>, Anup Patel <anup@brainfault.org>, Tiffany Lin	
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Minghsiu Tsai
 <minghsiu.tsai@mediatek.com>, Houlong Wei	 <houlong.wei@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, "tip-bot2 for GUO Ren (XuanTie)"
	 <tip-bot2@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Date: Sun, 13 Sep 2026 15:53:22 -0400
In-Reply-To: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-11 at 03:27 +0000, Guo Ren wrote:
> This series removes the implicit assumption that RISC-V supports exactly
> eight IPI message types.
>=20
> Currently, the SBI, CLINT and ACLINT SSWI IPI providers use
> BITS_PER_BYTE when sizing the generic IPI mux, while IMSIC carries a
> separate IMSIC_NR_IPI definition set to 8. These values happen to match
> IPI_MAX today, but neither is the proper source of truth for the number
> of RISC-V IPI message types.
>=20
> Move enum ipi_message_type to asm/smp.h so IPI providers can use IPI_MAX
> directly, then replace the BITS_PER_BYTE and IMSIC_NR_IPI uses with
> IPI_MAX.
>=20
> This also makes adding future RISC-V IPI message types independent of
> the current eight-entry assumption.
>=20
> A follow-up patch renames the MediaTek VPU mailbox terminator from
> IPI_MAX to IPI_VPU_MAX. That token belongs to the VPU firmware IPI id
> enum and should follow the same prefixed convention as IPI_VPU_INIT
> (and SCP_IPI_MAX on the SCP side), instead of reusing the generic
> IPI_MAX name.
>=20
> ---
> GUO Ren (XuanTie) (4):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocksource: clint: Use IPI_MAX for IPI mu=
xing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irqchip/aclint-sswi: Use IPI_MAX for IPI m=
uxing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irqchip/imsic: Use IPI_MAX instead of IMSI=
C_NR_IPI
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: mtk-vpu: rename IPI_MAX to IPI_VPU_=
MAX
>=20
> tip-bot2 for GUO Ren (XuanTie) (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv: smp: Move enum ipi_message_type to =
asm/smp.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv: sbi: Use IPI_MAX for SBI IPI muxing

I am confused. Thomas merged your entire v1 series a week before (see
the individual replies from=C2=A0tip-bot2@linutronix.de). Why are you
sending v2?

Patch 6 was not included in v1 (but it's clearly related), so perhaps
you meant to send only this one as a separate patch?

Also:
 * The cover letter should include a changelog, indicating what changes
   were made in each version compared to the previous one.
 * Patches 1 and 2 carry a "From:" tag that attributes authorship to
   tip-bot2, which is wrong (if these patches were to be applied).

>=20
> =C2=A0arch/riscv/include/asm/smp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++=
++++++
> =C2=A0arch/riscv/kernel/sbi-ipi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 ++--
> =C2=A0arch/riscv/kernel/smp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 12 ------------
> =C2=A0drivers/clocksource/timer-clint.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0drivers/irqchip/irq-aclint-sswi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0drivers/irqchip/irq-riscv-imsic-early.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0drivers/irqchip/irq-riscv-imsic-state.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.c | 12 ++++++------
> =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.h |=C2=A0 4 ++--
> =C2=A09 files changed, 28 insertions(+), 29 deletions(-)
> ---
> base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
> change-id: 20260911-ipi_max-ff71eeadf6fd
>=20
> Best regards,
> --=C2=A0=20
> GUO Ren (XuanTie) <guoren@kernel.org>

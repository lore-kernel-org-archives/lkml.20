Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961ED3314C3
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789324299; cv=none; b=nu4GT2caDEA1wA43TcynNx8CsJ8l6YTHOvbB7mH+oyPcuYlnOSXCnhotS/nMJx1iVWC3vxtQTPVl27GJZMksRoB37fhV5HgMvMPf19OplITjyLPKgl+qrcxw1QZABgfazZSYaZnxlLlnKKQJkSoRqGgtEOGQDq6HyepLTgfGefw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789324299; c=relaxed/simple;
	bh=yUHWt84lY+sWF2W06UjT35rIVWbFLcjD0lQAwnnKGhk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TavPzFTIGjbdv1jV62pajGOMO/ANdud2Vdk3qzOZ7KId8vrEB2+Yh8g4XlkI4ClJALK+CVs1NdUW9wCvJNq4s2QF3MtKdAeD8pOcqlsDb7RNsK/9/IZC9piQzLyL22ilxw8U76OJrFOq2owtL06fkHpCI3aJFVSitFFq5KOov9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=YcbeyvW7; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="YcbeyvW7"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id AAD2ACF9C9;
	Sun, 13 Sep 2026 21:31:33 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro AAD2ACF9C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789324295;
	bh=9dER/J/8MdqEP/M3Ls+38r00y1seRCBppFrIe7sL3Ak=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YcbeyvW7sSnnTfZTr/uCbcnFTlenGpzO6ymRZncRXn46x5A4ETMeyTu1u76htinxb
	 HNHqDW2pA2lRL/+B2wINBujBetFK7t8nC33MvgFUaud2K1lH65XirYDPGFGST8KBg0
	 P/Yqj8zKBqNjaNnkjfdpGsyVrylFggefTJykvBAdpRuuzNA/ZzXuia19AL3vHJvZ+R
	 ehkm+GzmviHEaV5QJJM2J4q7lpReWTj/n+ksNLXKSwgzFCTpHC3oyE9Ncbl2b0ADvv
	 7B4ICR/9eRUXKwBAvUdwCoetgsY8bJI3OLvb7LsQISqBExAXXfOQSHi6iCtfeyMRox
	 2WGKHRSqJDAsQ==
Message-ID: <159c52926a01c84a24d039b234bd1d3450fe5a9c.camel@rendec.net>
Subject: Re: [PATCH 02/14] irqchip: fix typos in comments
From: Radu Rendec <radu@rendec.net>
To: Hemanth Selam <hemanth.selam@gmail.com>, Thomas Gleixner
 <tglx@kernel.org>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,  Paul
 Walmsley	 <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
 Linus Walleij	 <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org
Date: Sun, 13 Sep 2026 14:31:32 -0400
In-Reply-To: <20260907065328.32009-1-hemanth.selam@gmail.com>
References: <20260907065328.32009-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-09-07 at 12:23 +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.=C2=A0 Only touches comments, no=
 code
> changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
> =C2=A0drivers/irqchip/irq-mtk-cirq.c=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-sifive-plic.c | 2 +-
> =C2=A0drivers/irqchip/irq-vic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
> =C2=A03 files changed, 3 insertions(+), 3 deletions(-)

The changes look good, but in my opinion should be split into 3
different patches, one per driver, and grouped into a series. Not that
it matters too much in this particular case (where only comments are
touched), but it's common practice in the Linux kernel development.

There are multiple reasons. The main one is that different drivers can
be reviewed/maintained by different people, and patches to them may be
picked up via different (Git) maintainer trees. Also, some companies
selectively port patches against specific drivers to the kernel trees
they maintain.

> diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cir=
q.c
> index 914d1d639fe3..d30c34ce0f56 100644
> --- a/drivers/irqchip/irq-mtk-cirq.c
> +++ b/drivers/irqchip/irq-mtk-cirq.c
> @@ -247,7 +247,7 @@ static int mtk_cirq_suspend(void *data)
> =C2=A0		writel_relaxed(mask, reg);
> =C2=A0	}
> =C2=A0
> -	/* set edge_only mode, record edge-triggerd interrupts */
> +	/* set edge_only mode, record edge-triggered interrupts */
> =C2=A0	/* enable cirq */
> =C2=A0	reg =3D mtk_cirq_reg(cirq_data, CIRQ_CONTROL);
> =C2=A0	value =3D readl_relaxed(reg);
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifi=
ve-plic.c
> index 5b0dac104814..a7cddadddf40 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -452,7 +452,7 @@ static irq_hw_number_t cp100_get_hwirq(struct plic_ha=
ndler *handler, void __iome
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	/*
> -	 * Interrupts delievered to hardware still become pending, but only
> +	 * Interrupts delivered to hardware still become pending, but only
> =C2=A0	 * interrupts that are both pending and enabled can be claimed.
> =C2=A0	 * Clearing the enable bit for all interrupts but the first pendin=
g
> =C2=A0	 * one avoids a hardware bug that occurs during read from the clai=
m
> diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
> index e38104c5064e..607e3284f700 100644
> --- a/drivers/irqchip/irq-vic.c
> +++ b/drivers/irqchip/irq-vic.c
> @@ -478,7 +478,7 @@ static void __init __vic_init(void __iomem *base, int=
 parent_irq, int irq_start,
> =C2=A0/**
> =C2=A0 * vic_init() - initialise a vectored interrupt controller
> =C2=A0 * @base: iomem base address
> - * @irq_start: starting interrupt number, must be muliple of 32
> + * @irq_start: starting interrupt number, must be multiple of 32
> =C2=A0 * @vic_sources: bitmask of interrupt sources to allow
> =C2=A0 * @resume_sources: bitmask of interrupt sources to allow for resum=
e
> =C2=A0 */

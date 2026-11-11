Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355671;
	b=cGFGFRxV5MYZ5APOj9lG4CqopITD0OH2XeuGVT29TK4EDfopq00q19M9uIz42uchSBBI
	 gNJoNSMuSpX4Wu/D0jU9WRgWwgZ/Kh9HftcLWcoi3NAafOkkApsNqH6MPFPFIU2pwkSDS
	 hbnCXWNype8MZ7lcyCTBdvePyAzlk/6EHyisqyF8v3BFRJ0fRZvEhvsdqjtTu9k0fgRcv
	 htv3XgHNfZBRBe7ZbYRdgemRhGbpFB4as0xX0bgFjsfJL0ojxi/MB32BOmwLYsxUOsbUb
	 AdTgTS6DGnl6vvsRS+TPTINnnXu4vdvJ4oesQYBcip9DnPE3vPoCY2ieYzh8ThqrTYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355671;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=uknRy7rJYSLugVW3qLuvx8E313F1JtrelCZFK1iUw/0=;
	b=H3x4mohwDFCErMDj7yJ9kq1q3TN+Nhke+wWxEZthm1j7THkeyT0Tv7JfktqtAQEVtI2Q
	 u79w7HpgJxB959D2MMP8CJYV+RAmVK7a05v9ULwVFSZjfO+M+buqzhnY1kzrPb75eMcaM
	 QuW7/SNNw5IZm2Jrxax8av/yiIPPvvIcHsFaByJmTg6uF7gIBu4t+APL+iVBQABxFyK/7
	 i5lipKMAYe06vty3fNvpXpqplzMlEzGqYzVhEeYzst2Qs6J7a5Fd9HDEExLijoMXqDvjG
	 +zDY54BphJtInO9rFSil2iqijmBWzV6o+Ptu0buL+f8wwvHrvI7lygkAOzYpMaGPnXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGjGdgln;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D2F606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGjGdgln
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E42C1F0089F;
	Wed, 11 Nov 2026 00:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794355671;
	bh=uknRy7rJYSLugVW3qLuvx8E313F1JtrelCZFK1iUw/0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VGjGdglnnCzw/lV9+vNGh6SpzKTjeBL+x4s31LVapLykY9ZpoVvUJegEC4roYEMIU
	 LFRTPEIHkhWLWdyqblh5/NhnEzos+XrkwK/WRDCZlQLTnd311ZRz2j1k6Ncxo7znvG
	 Hty14k0HzRZdnJTg1xT83+9gRE8KsafLCljXEQzrqFFHdjGNOk1QbpVKePLAOeKE0p
	 EP8kDCygzVt8TcqWQb+kUEeDhmxQPGTm8sfm15whArtLpmN0EYSK1EUS+SyMJa12lq
	 cYTiL1ySKYRL79SMg5pu0ACx0EFBivYtiawpH4UyH/ToD7jn2QjegUXSbXn+kn92sm
	 HdgH83fBbFfCQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>, Anup Patel
 <anup@brainfault.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, =?utf-8?B?Qmo=?=
 =?utf-8?B?w7ZybiBUw7ZwZWw=?=
 <bjorn@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v2 1/2] irqchip/riscv-aplic: Use handle_edge_irq() for
 edge-triggered MSI sources
In-Reply-To: <20261110-aplic-affinity-fix-v2-1-6c143b8b4e8c@linux.dev>
References: <20261110-aplic-affinity-fix-v2-0-6c143b8b4e8c@linux.dev>
 <20261110-aplic-affinity-fix-v2-1-6c143b8b4e8c@linux.dev>
Date: Wed, 11 Nov 2026 01:07:47 +0100
Message-ID: <87ik24telo.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 10 2026 at 12:06, Troy Mitchell wrote:
> In MSI mode, all APLIC interrupts are handled by handle_fasteoi_irq().
> For an edge-triggered source the APLIC forwards each edge as an MSI and
> keeps no state after that, so an edge which the CPU side drops is lost.
> After an affinity change, the next MSI can arrive on the new CPU while
> the previous one is still being handled on the old CPU, and
> handle_fasteoi_irq() then drops it.
>
> The fasteoi flow also never calls irq_ack(), which is where IMSIC applies
> an affinity change that was deferred while a previous vector move was in
> flight. Such a change stays pending, and later affinity changes of the
> interrupt only update the pending mask.
>
> Use handle_edge_irq() for edge-triggered sources. It acknowledges the
> interrupt before invoking the handler. If the interrupt is still in
> progress on the previous target CPU, it either waits for it to complete
> or marks it pending so that the handler runs again.
>
> Fixes: ca8df97fe679 ("irqchip/riscv-aplic: Add support for MSI-mode")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Not that I care at all about showing up in some made up git-tag metrics,
but in general it's a matter of courtesy to point out that the solution
to the problem was suggested by someone else, no?

> +	/*
> +	 * Edge-triggered sources are fire and forget, so they must be
> +	 * acknowledged before the handler runs. The edge flow handler also
> +	 * replays an interrupt which arrives while the previous one is
> +	 * still being handled on another CPU after an affinity change.
> +	 */
> +	if (type & IRQ_TYPE_EDGE_BOTH)
> +		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
> +						 handle_edge_irq, "edge");
> +	else
> +		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
> +						 handle_fasteoi_irq, "fasteoi");
> +

  https://docs.kernel.org/process/maintainer-tip.html#bracket-rules

Thanks,

        tglx
